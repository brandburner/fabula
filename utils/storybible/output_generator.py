# --- START OF FILE output_generator.py ---

#!/usr/bin/env python3
"""
Output Generation Module for Story Bible Generator.
Handles formatting the story bible data into Markdown and saving output files.
"""

import json
import logging
import datetime
import re
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple

# Import utilities
try:
    from utils import baml_cache, convert_to_dict
except ImportError:
     print("ERROR: Failed to import from 'utils.py'. Ensure it's in the same directory.")
     import sys
     sys.exit(1)


# --- Markdown Generation ---

# Apply cache decorator if markdown generation involves significant computation
# or if consistency across runs with same input bible is desired.
# For now, assume it's fast enough not to cache, but keep the option:
# @baml_cache(cache_dir_arg_index=2) # logger=0, story_bible=1, cache_dir=2
def generate_markdown(logger: logging.Logger, story_bible: Dict[str, Any], cache_dir_override: Optional[str] = None, title: str = "Story Bible") -> str:
    """
    Generates Markdown formatted text from the story bible dictionary.

    Args:
        logger: Logger instance.
        story_bible: The completed story bible data dictionary.
        cache_dir_override: Optional cache directory path (if caching enabled).
        title: The main title for the Markdown document.

    Returns:
        str: The generated Markdown text.
    """
    try:
        # Safely access elements using .get()
        summary = story_bible.get("summary", "No final summary available.")
        summary_details = story_bible.get("summary_details", {})
        elements = story_bible.get("elements", {})
        metadata = story_bible.get("metadata", {})
        treatment = story_bible.get("treatment", None)
        # Try getting final characters from elements, fallback to intermediate prescan
        character_index = elements.get("characters", story_bible.get("character_index", []))

        lines = [f"# {title}\n"]

        # Format timestamp
        ts_iso = metadata.get('generated_at', datetime.datetime.now().isoformat())
        try:
            ts_dt = datetime.datetime.fromisoformat(ts_iso)
            # Format with timezone if available, otherwise naive format
            ts_formatted = ts_dt.strftime('%Y-%m-%d %H:%M:%S %Z') if ts_dt.tzinfo else ts_dt.strftime('%Y-%m-%d %H:%M:%S')
        except ValueError:
            ts_formatted = ts_iso # Fallback to ISO string if parsing fails
        lines.append(f"*Generated on: {ts_formatted}*\n")

        # Metadata Section
        lines.append("## Metadata\n")
        lines.append(f"- **Input File**: `{metadata.get('input_file', 'N/A')}`")
        lines.append(f"- **Detail Level**: `{metadata.get('detail_level', 'N/A')}`")
        proc_time = metadata.get('processing_time_seconds', 0)
        lines.append(f"- **Processing Time**: {proc_time:.2f} seconds (~{proc_time / 60:.1f} minutes)")
        lines.append(f"- **Chunks Processed**: {metadata.get('chunks_processed', 'N/A')}") # Key name from main script
        # Access intermediate results safely if they exist
        intermediate_prescan = story_bible.get('intermediate_results', {}).get('character_index', [])
        lines.append(f"- **Character Pre-Scan**: {'Yes' if metadata.get('character_prescan_performed') else 'No'} ({len(intermediate_prescan)} initial found)")
        lines.append(f"- **Treatment Generated**: {'Yes' if metadata.get('treatment_generated') else 'No'}")
        lines.append(f"- **Element Extraction**: {'Yes' if metadata.get('scene_elements_extracted') else 'No'}")
        lines.append(f"- **Conflict Arc Analysis**: {'Yes' if metadata.get('conflict_arcs_analyzed') else 'No'}")
        lines.append(f"- **Character Enhancement**: {'Yes' if metadata.get('character_enhancement_performed') else 'No'}")
        lines.append(f"- **Final Summary Polish**: {'Yes' if metadata.get('final_summary_polished') else 'No'}")
        lines.append("\n")

        # Treatment Section
        if treatment and isinstance(treatment, dict):
            lines.append("## Story Treatment\n")
            lines.append(f"### Title\n{treatment.get('title', '*N/A*')}\n")
            lines.append(f"### Logline\n{treatment.get('logline', '*N/A*')}\n")
            lines.append(f"### Synopsis\n{treatment.get('synopsis', '*N/A*')}\n")
            chars = treatment.get('mainCharacters', [])
            acts = treatment.get('acts', [])
            if chars and isinstance(chars, list):
                lines.append("### Main Characters (from Treatment)\n" + "\n".join(f"- {c}" for c in chars if c) + "\n")
            if acts and isinstance(acts, list):
                lines.append("### Act Structure (from Treatment)\n")
                for i, act in enumerate(acts):
                    if isinstance(act, dict):
                        lines.append(f"#### Act {act.get('actNumber', i+1)}\n**Summary:** {act.get('summary', '*N/A*')}\n")
                        moments = act.get('keyMoments', [])
                        if moments and isinstance(moments, list):
                            lines.append("**Key Moments:**\n" + "\n".join(f"  - {m}" for m in moments if m) + "\n")
                lines.append("\n")
        elif metadata.get('treatment_generated'):
            lines.append("## Story Treatment\n*Generation attempted but failed or returned invalid data.*\n")
        else:
             lines.append("## Story Treatment\n*Skipped.*\n") # Indicate skipped

        # Final Synopsis Section
        lines.append("## Final Synopsis\n")
        if isinstance(summary_details, dict):
            tone = summary_details.get('tone')
            focus = summary_details.get('arc_focus')
            if tone or focus:
                lines.append(f"*Tone: {tone or 'N/A'} | Focus: {focus or 'N/A'}*\n")
        # Ensure summary is treated as string, handle potential None/non-string
        summary_text = str(summary).strip() if summary is not None else "Synopsis not available or invalid."
        lines.append(summary_text + "\n")

        # Elements Section
        if isinstance(elements, dict) and not elements.get("is_fallback") and not elements.get("error"):
            lines.append("## Story Elements\n") # Add main heading for elements

            # Narrative Structure (Check elements first, then summary_details as fallback)
            narrative_structure = elements.get("narrative_structure")
            if not narrative_structure and isinstance(summary_details, dict):
                 narrative_structure = summary_details.get("narrative_structure")
            _append_markdown_section(lines, logger, "Narrative Structure", narrative_structure, _format_narrative_stage_md)

            _append_markdown_section(lines, logger, "Character Dynamics", elements.get("character_dynamics"), _format_character_dynamic_md)
            _append_markdown_section(lines, logger, "Major Themes", elements.get("themes"), _format_theme_md)
            _append_markdown_section(lines, logger, "Central Conflicts", elements.get("central_conflicts"), _format_conflict_md)
            _append_markdown_section(lines, logger, "Conflict Arcs", elements.get("conflict_arcs"), _format_conflict_arc_md) # Uses renamed chunk indices
            _append_markdown_section(lines, logger, "Characters", character_index, _format_character_md) # Use combined character index
            _append_markdown_section(lines, logger, "Locations", elements.get("locations"), _format_location_md)
            _append_markdown_section(lines, logger, "Key Plot Points", elements.get("plot_points"), _format_plot_point_md, enumerate_list=True)
        elif metadata.get('scene_elements_extracted'):
            lines.append("\n## Story Elements\n*Element extraction/merging failed or produced no valid elements.*\n")
        else:
            lines.append("\n## Story Elements\n*Element extraction skipped.*\n") # Indicate skipped

        markdown_text = "\n".join(lines)
        logger.info(f"Generated markdown text ({len(markdown_text)} chars)")
        return markdown_text

    except Exception as e:
        logger.error(f"Error generating markdown: {e}", exc_info=True)
        # Return a markdown formatted error message
        return f"# {title}\n\n## Markdown Generation Error\n\nAn unexpected error occurred while generating the Markdown output:\n\n```\n{e}\n```\n\nPlease check the logs and the input story bible data."


# --- Markdown Helper Functions ---
# (These remain largely the same, but made standalone and take logger)

def _append_markdown_section(lines: List[str], logger: logging.Logger, title: str, data: Optional[Any], formatter: callable, enumerate_list: bool = False):
    """Appends a formatted section to the markdown lines."""
    if isinstance(data, list):
        lines.append(f"## {title}\n")
        if not data:
            lines.append("*None identified or provided.*")
        elif enumerate_list:
            for i, item in enumerate(data):
                try:
                    # Pass logger to formatter if it accepts it? For now, assume not.
                    if isinstance(item, dict): formatted_item = formatter(item, i)
                    else: formatted_item = f"{i+1}. {str(item)}\n" # Basic list item
                except Exception as fmt_e:
                    formatted_item = f"{i+1}. *Error formatting item: {fmt_e}*\n"
                    logger.warning(f"Markdown format error in section '{title}', item {i}: {fmt_e}")
                lines.append(formatted_item)
        else:
            for item in data:
                try:
                    if isinstance(item, dict): formatted_item = formatter(item)
                    else: formatted_item = f"- {str(item)}\n" # Basic bullet point
                except Exception as fmt_e:
                    formatted_item = f"- *Error formatting item: {fmt_e}*\n"
                    logger.warning(f"Markdown format error in section '{title}', item: {fmt_e}")
                lines.append(formatted_item)
        lines.append("\n") # Add newline after the section
    elif data is not None: # Handle cases where data exists but isn't a list
        lines.append(f"## {title}\n")
        lines.append(f"*Invalid data format for section '{title}' (expected list, got {type(data)}).*")
        logger.warning(f"Invalid Markdown data type for '{title}': {type(data)}. Data: {str(data)[:100]}")
        lines.append("\n")
    # If data is None, do nothing (don't add the section header)


def _format_narrative_stage_md(stage: Dict[str, Any], index: Optional[int] = None) -> str:
    prefix = f"{index+1}. " if index is not None else "- "
    return f"{prefix}**{stage.get('stage', 'Unknown Stage')}**: {stage.get('description', 'N/A')}\n"

def _format_character_dynamic_md(dyn: Dict[str, Any], index: Optional[int] = None) -> str:
    return f"### {dyn.get('character_name', '?')} ({dyn.get('role', '?')})\n{dyn.get('arc_description', 'N/A')}\n\n"

def _format_theme_md(theme: Dict[str, Any], index: Optional[int] = None) -> str:
    lines = [f"### {theme.get('name', 'Unnamed Theme')}\n", f"{theme.get('description', 'N/A')}\n"]
    examples = theme.get('examples', [])
    if examples and isinstance(examples, list):
        lines.append("**Examples:**\n")
        lines.extend(f"- {str(example)}\n" for example in examples if example)
    return "".join(lines) + "\n"

def _format_conflict_md(conflict: Dict[str, Any], index: Optional[int] = None) -> str:
    title = conflict.get('name', conflict.get('description', 'Unnamed Conflict'))
    lines = [f"### {title}\n"]
    if conflict.get('description') and conflict.get('description') != title:
        lines.append(f"{conflict.get('description')}\n")
    involved = conflict.get('involved_characters', [])
    conflict_type = conflict.get('type')
    if involved and isinstance(involved, list):
        lines.append(f"**Characters:** {', '.join(map(str, involved))}\n")
    if conflict_type:
        lines.append(f"**Type:** {conflict_type}\n")
    evidence_dialogue = conflict.get('evidence_dialogue')
    key_moment_text = conflict.get('key_moment_text')
    if evidence_dialogue:
        lines.append(f"> *Evidence:* `{evidence_dialogue}`\n")
    elif key_moment_text: # Show key moment if no dialogue evidence
        lines.append(f"> *Key Moment:* `{key_moment_text}`\n")
    return "".join(lines) + "\n"

def _format_character_md(char: Dict[str, Any], index: Optional[int] = None) -> str:
    if not isinstance(char, dict):
        return f"- Invalid character data: {str(char)}\n"
    lines = [f"### {char.get('name', 'Unnamed Character')}\n"]
    if char.get('description'): lines.append(f"**Description:** {char.get('description')}\n")
    if char.get('background'): lines.append(f"**Background:** {char.get('background')}\n")
    traits = char.get('personality_traits', [])
    if traits and isinstance(traits, list): lines.append(f"**Traits:** {', '.join(map(str, traits))}\n")
    motivations = char.get('motivations')
    if isinstance(motivations, list): lines.append(f"**Motivations:** {', '.join(map(str, motivations))}\n")
    elif isinstance(motivations, str) and motivations: lines.append(f"**Motivations:** {motivations}\n")
    relationships = char.get('relationships') # Can be list or string based on BAML output
    if isinstance(relationships, list): lines.append(f"**Relationships:** {', '.join(map(str, relationships))}\n")
    elif isinstance(relationships, str) and relationships: lines.append(f"**Relationships:** {relationships}\n")
    # Character Arc
    arc_stages = char.get('character_arc_stages', [])
    if arc_stages and isinstance(arc_stages, list):
        lines.append("**Arc Stages:**\n" + "\n".join(
            (f"- **{s.get('stage_name','? Stage')}:** {s.get('description','N/A')}" if isinstance(s, dict) else f"- {str(s)}")
            for s in arc_stages if s # Filter out potential null/empty stages
        ) + "\n")
    elif char.get('character_arc'): # Fallback to single arc description if stages not present
        lines.append(f"**Arc:** {char.get('character_arc')}\n")
    if char.get('role'): lines.append(f"**Role:** {char.get('role')}\n")
    # Detailed profile from enhancement
    if char.get('detailed_profile'): lines.append(f"\n**Detailed Profile:**\n{char.get('detailed_profile')}\n")
    # Enhancement status/errors
    enhancement_status = char.get('enhancement_status')
    enhancement_error = char.get('enhancement_error')
    if enhancement_error: lines.append(f"\n**Note:** Enhancement Error: {enhancement_error}\n")
    elif enhancement_status == 'skipped_no_context': lines.append(f"\n**Note:** Enhancement skipped (no context summaries found).\n")
    elif enhancement_status == 'skipped_invalid_data': lines.append(f"\n**Note:** Enhancement skipped (invalid input character data).\n")
    elif enhancement_status == 'error_invalid_return': lines.append(f"\n**Note:** Enhancement Error: Invalid return type from BAML.\n")
    elif enhancement_status == 'error': lines.append(f"\n**Note:** Enhancement failed (see error message above or logs).\n")

    return "".join(lines) + "\n"

def _format_conflict_arc_md(arc: Dict[str, Any], index: Optional[int] = None) -> str:
    """Formats a conflict arc for markdown, using chunk indices."""
    if not isinstance(arc, dict): return f"- Invalid conflict arc data: {str(arc)}\n"
    # logging.getLogger('StoryBibleGen').debug(f"Formatting conflict arc: {arc.get('conflict_description', '?')}") # Optional debug

    lines = [f"### {arc.get('conflict_description', 'Unnamed Conflict Arc')}\n"]
    involved_characters = arc.get('involved_characters', [])
    conflict_type = arc.get('type')

    # Use the renamed '_chunk_index' keys
    start_idx = arc.get('start_chunk_index')
    climax_idx = arc.get('climax_chunk_index') # Might be present
    resolution_idx = arc.get('resolution_chunk_index') # Might be present

    if start_idx is not None:
        lines.append(f"**Starts Around Processing Chunk Index:** {start_idx}\n")
    if climax_idx is not None:
        lines.append(f"**Climax Around Processing Chunk Index:** {climax_idx}\n")
    if resolution_idx is not None:
        lines.append(f"**Resolution Around Processing Chunk Index:** {resolution_idx}\n")

    # Descriptive points
    climax_point_desc = arc.get('climax_point') # Assumed text description
    resolution_point_desc = arc.get('resolution_point') # Assumed text description
    escalation_points = arc.get('escalation_points', []) # Assumed list of strings

    if involved_characters and isinstance(involved_characters, list):
        lines.append(f"**Characters:** {', '.join(map(str, involved_characters))}\n")
    if conflict_type:
        lines.append(f"**Type:** {conflict_type}\n")

    if escalation_points and isinstance(escalation_points, list):
        lines.append("**Escalation Points:**\n")
        lines.extend(f"- {str(e)}\n" for e in escalation_points if e)
    if climax_point_desc:
        lines.append(f"**Climax Description:** {climax_point_desc}\n")
    if resolution_point_desc:
        lines.append(f"**Resolution Description:** {resolution_point_desc}\n")

    # Evidence
    evidence_dialogue = arc.get('evidence_dialogue')
    key_moment_text = arc.get('key_moment_text')
    if evidence_dialogue: lines.append(f"> *Evidence:* `{evidence_dialogue}`\n")
    elif key_moment_text: lines.append(f"> *Key Moment:* `{key_moment_text}`\n")

    return "".join(lines) + "\n"

def _format_location_md(loc: Dict[str, Any], index: Optional[int] = None) -> str:
    lines = [f"### {loc.get('name', 'Unnamed Location')}\n"]
    if loc.get('description'): lines.append(f"{loc.get('description')}\n")
    if loc.get('significance'): lines.append(f"**Significance:** {loc['significance']}\n")
    return "".join(lines) + "\n"

def _format_plot_point_md(pt: Dict[str, Any], index: int) -> str: # Requires index
    line = f"{index+1}. {pt.get('description', 'No description')}."
    if pt.get('significance'): line += f" (Significance: {pt.get('significance')})"
    chars = pt.get('characters_involved',[])
    if chars and isinstance(chars, list): line += f" (Characters: {', '.join(map(str, chars))})"
    # Add evidence/moment quote block if available
    evidence_dialogue = pt.get('evidence_dialogue')
    key_moment_text = pt.get('key_moment_text')
    if evidence_dialogue: line += f"\n> *Evidence:* `{evidence_dialogue}`"
    elif key_moment_text: line += f"\n> *Key Moment:* `{key_moment_text}`"
    return line + "\n" # Add final newline for spacing


# --- File Saving Functions ---

def save_story_bible(logger: logging.Logger, story_bible: Dict[str, Any], output_file: str):
    """Saves the story bible dictionary to a JSON file."""
    try:
        output_path = Path(output_file)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        # Use the utility function to ensure JSON serializability
        json_ready_bible = convert_to_dict(story_bible, logger)
        with output_path.open('w', encoding='utf-8') as f:
            json.dump(json_ready_bible, f, indent=2, ensure_ascii=False)
        logger.info(f"JSON story bible saved successfully to: {output_file}")
    except TypeError as te:
        logger.error(f"JSON Serialization Error saving to {output_file}: {te}. Check data types in story bible.", exc_info=True)
        # Attempt fallback save
        _save_fallback_json(logger, story_bible, Path(output_file))
    except Exception as e:
        logger.error(f"Error saving JSON story bible to {output_file}: {e}", exc_info=True)
        # Attempt fallback save
        _save_fallback_json(logger, story_bible, Path(output_file))

def _save_fallback_json(logger: logging.Logger, data: Dict[str, Any], original_path: Path):
    """Attempts to save data as JSON using string conversion as a fallback."""
    try:
        fallback_path = original_path.with_name(original_path.stem + "_fallback.json")
        logger.warning(f"Attempting to save fallback JSON with string conversion to: {fallback_path}")
        # Use default=str to handle non-serializable types
        with fallback_path.open('w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False, default=str)
        logger.info(f"Saved fallback JSON: {fallback_path}")
    except Exception as fallback_e:
        logger.error(f"Could not save fallback JSON either: {fallback_e}", exc_info=True)

def save_markdown(logger: logging.Logger, markdown_text: str, output_file: str):
    """Saves the generated markdown text to a file."""
    try:
        output_path = Path(output_file)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(markdown_text, encoding='utf-8')
        logger.info(f"Markdown output saved successfully to: {output_file}")
    except Exception as e:
        logger.error(f"Error saving Markdown file to {output_file}: {e}", exc_info=True)


# --- END OF FILE output_generator.py ---