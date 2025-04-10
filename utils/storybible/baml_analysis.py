# --- START OF FILE baml_analysis.py ---

#!/usr/bin/env python3
"""
BAML Analysis Module for Story Bible Generator.
Contains wrapper functions for calling BAML functions for analysis tasks like
character scanning, treatment generation, summarization, element extraction, etc.
"""

import logging
import sys
from typing import List, Dict, Any, Optional

# Import BAML client
try:
    from baml_client import b as baml_client
except ImportError:
    print("ERROR: Failed to import 'baml_client'. Run 'pip install baml' and then 'baml-cli generate'.")
    sys.exit(1)
except Exception as e:
    print(f"ERROR: BAML client import failed: {e}")
    sys.exit(1)

# Import utilities
try:
    from utils import baml_cache, convert_to_dict
except ImportError:
     print("ERROR: Failed to import from 'utils.py'. Ensure it's in the same directory.")
     sys.exit(1)

# Helper for handling BAML AttributeErrors consistently
def _handle_baml_error(func_name: str, error: Exception, logger: logging.Logger, fallback_return: Any = None) -> Any:
    """Logs BAML errors and returns a fallback value."""
    if isinstance(error, AttributeError):
        # Specific check for common signature mismatch errors
        err_msg = str(error)
        if 'unexpected keyword argument' in err_msg:
             # Try to extract the problematic argument name
             import re
             match = re.search(r"unexpected keyword argument '(.*?)'", err_msg)
             arg_name = match.group(1) if match else "unknown"
             logger.error(f"BAML '{func_name}' call failed: Python wrapper signature mismatch (e.g., for '{arg_name}'). Run 'baml-cli generate'.", exc_info=False)
             return fallback_return or {"error": f"BAML signature mismatch in {func_name}", "is_fallback": True}
        else:
             logger.error(f"BAML function '{func_name}' likely missing or outdated (AttributeError). Run 'baml-cli generate'.", exc_info=False)
             return fallback_return or {"error": f"BAML function {func_name} missing/outdated", "is_fallback": True}
    elif isinstance(error, TypeError):
         err_msg = str(error)
         if 'unexpected keyword argument' in err_msg:
             import re
             match = re.search(r"unexpected keyword argument '(.*?)'", err_msg)
             arg_name = match.group(1) if match else "unknown"
             logger.error(f"Error calling BAML '{func_name}': Python wrapper signature mismatch (TypeError for '{arg_name}'). Check definition.", exc_info=False)
             return fallback_return or {"error": f"BAML type/signature mismatch in {func_name}", "is_fallback": True}
         else:
            logger.error(f"Type error calling BAML '{func_name}': {error}", exc_info=True)
            return fallback_return or {"error": f"TypeError in {func_name}: {str(error)}", "is_fallback": True}
    else:
        logger.error(f"Error calling BAML '{func_name}': {error}", exc_info=True)
        return fallback_return or {"error": f"Exception in {func_name}: {str(error)}", "is_fallback": True}


# --- BAML Wrapper Functions ---

@baml_cache(cache_dir_arg_index=2) # logger=0, script_text=1, cache_dir=2
def prescan_characters(logger: logging.Logger, script_text: str, cache_dir_override: Optional[str] = None) -> List[Dict[str, Any]]:
    """Performs character pre-scan using BAML or regex fallback."""
    logger.info("Performing character pre-scan...")
    if not script_text or not script_text.strip():
        logger.warning("Cannot perform character pre-scan on empty script text.")
        return []
    try:
        result = baml_client.PreScanCharacters(full_script=script_text)
        char_list = convert_to_dict(result, logger) # Use util converter
        if char_list and isinstance(char_list, list):
            valid_chars = [c for c in char_list if isinstance(c, dict) and 'name' in c]
            if len(valid_chars) == len(char_list):
                logger.info(f"LLM pre-scan identified {len(valid_chars)} potential characters.")
                return valid_chars
            else:
                logger.warning(f"LLM pre-scan returned invalid entries ({len(char_list) - len(valid_chars)} removed). Using {len(valid_chars)} valid ones.")
                if valid_chars: return valid_chars
        # Fallback or invalid data case
        logger.warning("LLM pre-scan failed or returned invalid data, trying regex fallback.")
        import re # Import re locally for fallback
        char_cues = re.findall(r"^\s*([A-Z][A-Z\s]{2,}[A-Z])\s*(?:\(.*\))?\s*$", script_text, re.MULTILINE)
        potential_names = sorted(list(set(name.strip() for name in char_cues)))
        exclusions = {"INT", "EXT", "V.O", "O.S", "CONT'D", "CONTINUED", "FADE IN", "FADE OUT", "CUT TO", "MONTAGE", "SERIES OF SHOTS"}
        final_names = [name for name in potential_names if name not in exclusions and not name.isdigit() and len(name) > 1]
        if final_names:
            logger.info(f"Regex pre-scan identified {len(final_names)} potential character names.")
            return [{"name": name, "likely_importance": "unknown"} for name in final_names]
        else:
            logger.warning("Regex pre-scan also found no likely character names.")
            return []
    except Exception as e:
        return _handle_baml_error("PreScanCharacters", e, logger, fallback_return=[])

@baml_cache(cache_dir_arg_index=2) # logger=0, script_text=1, cache_dir=2
def generate_story_treatment(logger: logging.Logger, script_text: str, cache_dir_override: Optional[str] = None, max_tokens: int = 3000) -> Optional[Dict[str, Any]]:
    """Generates story treatment using BAML."""
    if not script_text or not script_text.strip():
        logger.warning("Cannot generate treatment from empty script text.")
        return None
    try:
        logger.info(f"Generating story treatment (max_tokens: {max_tokens})...")
        result = baml_client.GenerateStoryTreatment(full_script=script_text, max_tokens=max_tokens)
        treatment = convert_to_dict(result, logger)
        if not isinstance(treatment, dict) or not treatment.get('synopsis'):
            logger.error(f"GenerateStoryTreatment returned invalid structure: {treatment}")
            return None
        if len(treatment.get('synopsis', '')) < 50:
            logger.warning("Treatment synopsis seems short.")
        logger.info(f"Generated treatment: {len(treatment.get('mainCharacters', []))} chars, {len(treatment.get('acts', []))} acts.")
        return treatment
    except Exception as e:
        return _handle_baml_error("GenerateStoryTreatment", e, logger, fallback_return=None)

@baml_cache(cache_dir_arg_index=2) # logger=0, chunk_text=1, cache_dir=2
def summarize_chunk(logger: logging.Logger, chunk_text: str, cache_dir_override: Optional[str] = None, treatment: Optional[Dict[str, Any]] = None, detail_level: str = "standard", max_tokens: int = 400) -> str:
    """Summarizes a text chunk using BAML."""
    fallback_prefix = f"Fallback Summary (Chunk {str(chunk_text[:20]).encode('ascii', 'ignore').decode()}...):"
    if not chunk_text or not chunk_text.strip():
        logger.warning(f"{fallback_prefix} Empty chunk text.")
        return f"{fallback_prefix} Empty chunk text."
    try:
        logger.debug(f"Summarizing chunk (detail:{detail_level}, max_tok:{max_tokens}) start: {chunk_text[:50].replace(chr(10),' ')}...")
        # Ensure treatment is serializable if passed (should be dict already)
        safe_treatment = convert_to_dict(treatment, logger) if treatment else None
        result = baml_client.SummarizeChunkWithContext(chunk_text=chunk_text, story_treatment=safe_treatment, detail_level=detail_level, max_tokens=max_tokens)
        summary = getattr(result, 'summary_text', str(result)) # Safely access attribute
        if not summary or not summary.strip():
            logger.warning("SummarizeChunkWithContext returned empty summary.")
            return f"{fallback_prefix} BAML returned empty summary."
        return summary.strip()
    except Exception as e:
        # Pass chunk index info if available in args/kwargs or context? Hard here.
        err_result = _handle_baml_error("SummarizeChunkWithContext", e, logger, fallback_return=None)
        return f"{fallback_prefix} {err_result if err_result else 'Error during summarization.'}"


@baml_cache(cache_dir_arg_index=2) # logger=0, scene_text=1, cache_dir=2
def extract_scene_elements(logger: logging.Logger, scene_text: str, cache_dir_override: Optional[str] = None, chunk_index: int = -1, scene_summary: Optional[str] = None, known_characters: Optional[List[Dict[str, Any]]] = None) -> Dict[str, Any]:
    """Extracts scene elements using BAML."""
    fallback_result = {"chunk_index": chunk_index, "error": "Unknown extraction error", "is_fallback": True}
    if not scene_text or not scene_text.strip():
        fallback_result["error"] = "Empty scene text"
        logger.warning(f"Cannot extract elements for chunk {chunk_index}: Empty scene text.")
        return fallback_result

    try:
        logger.debug(f"Extracting elements for chunk {chunk_index}")
        # Ensure known_characters is serializable list of dicts
        safe_known_chars = convert_to_dict(known_characters, logger) if known_characters else []
        if not isinstance(safe_known_chars, list): safe_known_chars = [] # Ensure list

        result = baml_client.ExtractSceneElements(
            scene_text=scene_text,
            scene_index=chunk_index, # Use chunk_index for BAML's scene_index
            scene_summary=scene_summary or "",
            known_characters=safe_known_chars
        )
        extracted_elements = convert_to_dict(result, logger)

        if not isinstance(extracted_elements, dict):
            raise TypeError(f"Expected dict from BAML ExtractSceneElements, got {type(extracted_elements)}")

        # BAML returns 'scene_index', ensure we map it back to our 'chunk_index' concept
        baml_scene_index = extracted_elements.pop("scene_index", chunk_index) # Get BAML index, default to passed index
        extracted_elements["chunk_index"] = baml_scene_index # Store it as chunk_index

        # Logging extracted elements
        log_parts = []
        if extracted_elements.get("scene_beats"): log_parts.append(f"{len(extracted_elements['scene_beats'])} beats")
        if extracted_elements.get("tone_profile"): log_parts.append("tone")
        if extracted_elements.get("subtext_signals"): log_parts.append(f"{len(extracted_elements['subtext_signals'])} subtext")
        if extracted_elements.get("conflicts"): log_parts.append(f"{len(extracted_elements['conflicts'])} conflicts")
        logger.debug(f"Extracted elements chunk {chunk_index}" + (f" ({', '.join(log_parts)})" if log_parts else ""))

        return extracted_elements

    except Exception as e:
        err_res = _handle_baml_error("ExtractSceneElements", e, logger, fallback_return=None)
        if isinstance(err_res, dict): # Check if error handler returned a dict
             fallback_result.update(err_res) # Merge error info
             fallback_result["chunk_index"] = chunk_index # Ensure index is preserved
        else: # If handler returned string or None
             fallback_result["error"] = str(err_res or f"Exception in ExtractSceneElements: {e}")
        return fallback_result


@baml_cache(cache_dir_arg_index=2) # logger=0, summaries=1, cache_dir=2
def merge_summaries(logger: logging.Logger, summaries: List[str], cache_dir_override: Optional[str] = None, treatment: Optional[Dict[str, Any]] = None, detail_level: str = "standard", is_final_merge: bool = False, max_tokens: int = 800) -> str:
    """Merges multiple summaries using BAML."""
    valid_summaries = [s for s in summaries if isinstance(s, str) and s.strip() and not s.startswith("Fallback")]
    fallback_result = f"Fallback Merge ({len(valid_summaries)} summaries): Could not merge."

    if not valid_summaries:
        logger.warning("No valid summaries provided to merge_summaries.")
        return "Fallback Merge: No valid summaries to merge."
    if len(valid_summaries) == 1:
        logger.debug("Only one valid summary provided, returning it directly.")
        return valid_summaries[0]

    try:
        logger.debug(f"Merging {len(valid_summaries)} summaries (final:{is_final_merge}, max_tok:{max_tokens})")
        safe_treatment = convert_to_dict(treatment, logger) if treatment else None
        result = baml_client.MergeSummariesWithContext(
            summaries=valid_summaries,
            story_treatment=safe_treatment,
            detail_level=detail_level,
            is_final_merge=is_final_merge,
            max_tokens=max_tokens
        )
        merged_summary = getattr(result, 'summary_text', str(result))
        if not merged_summary or not merged_summary.strip():
            logger.warning("MergeSummariesWithContext returned empty summary. Combining originals.")
            return "\n\n---\n\n".join(valid_summaries) # Fallback: join originals
        return merged_summary.strip()
    except Exception as e:
        err_res = _handle_baml_error("MergeSummariesWithContext", e, logger, fallback_return=None)
        logger.error(f"Merge failed: {err_res or e}. Combining originals as fallback.")
        # Fallback: join originals if BAML fails
        return "\n\n---\n\n".join(valid_summaries)


@baml_cache(cache_dir_arg_index=2) # logger=0, scene_elements_list=1, cache_dir=2
def merge_scene_elements(logger: logging.Logger, scene_elements_list: List[Dict[str, Any]], cache_dir_override: Optional[str] = None, known_characters: Optional[List[Dict[str, Any]]] = None) -> Dict[str, Any]:
    """Merges scene elements from multiple chunks using BAML."""
    fallback_result = {"error": "Unknown element merge error", "is_fallback": True}

    # Filter only valid element dictionaries that have a chunk_index
    valid_chunk_elements = [
        se for se in scene_elements_list
        if isinstance(se, dict) and not se.get("is_fallback") and not se.get("error") and 'chunk_index' in se
    ]

    if not valid_chunk_elements:
        logger.warning("No valid chunk elements with 'chunk_index' found to merge.")
        fallback_result["error"] = "No valid chunk elements with index found"
        return fallback_result

    # Prepare for BAML: Rename 'chunk_index' back to 'scene_index'
    elements_for_baml = []
    for elem in valid_chunk_elements:
        elem_copy = elem.copy()
        elem_copy['scene_index'] = elem_copy.pop('chunk_index') # Rename key
        elements_for_baml.append(elem_copy)

    try:
        logger.debug(f"Merging elements from {len(elements_for_baml)} chunks via BAML.")
        safe_known_chars = convert_to_dict(known_characters, logger) if known_characters else []
        if not isinstance(safe_known_chars, list): safe_known_chars = []

        result = baml_client.MergeSceneElements(
            scene_elements=elements_for_baml,
            known_characters=safe_known_chars
        )
        merged = convert_to_dict(result, logger)

        if not isinstance(merged, dict):
            raise TypeError(f"Expected dict from BAML MergeSceneElements, got {type(merged)}")

        logger.info(f"Merged elements from {len(elements_for_baml)} chunks.")
        return merged

    except Exception as e:
        err_res = _handle_baml_error("MergeSceneElements", e, logger, fallback_return=None)
        if isinstance(err_res, dict): # Check if error handler returned a dict
             fallback_result.update(err_res) # Merge error info
        else: # If handler returned string or None
             fallback_result["error"] = str(err_res or f"Exception in MergeSceneElements: {e}")
        return fallback_result


@baml_cache(cache_dir_arg_index=2) # logger=0, all_scene_elements=1, cache_dir=2
def track_conflict_trajectory(logger: logging.Logger, all_scene_elements: List[Dict[str, Any]], cache_dir_override: Optional[str] = None) -> List[Dict[str, Any]]:
    """Tracks conflict trajectories across scene elements using BAML."""
    fallback_result = []

    # Filter valid elements with chunk_index
    valid_chunk_elements = [
        se for se in all_scene_elements
        if isinstance(se, dict) and not se.get("is_fallback") and not se.get("error") and 'chunk_index' in se
    ]

    if not valid_chunk_elements:
        logger.warning("No valid chunk elements for conflict trajectory tracking.")
        return fallback_result

    # Prepare for BAML: Rename 'chunk_index' to 'scene_index'
    elements_for_baml = []
    for elem in valid_chunk_elements:
        elem_copy = elem.copy()
        elem_copy['scene_index'] = elem_copy.pop('chunk_index')
        elements_for_baml.append(elem_copy)

    try:
        logger.info(f"Tracking conflict trajectory across {len(elements_for_baml)} valid chunk elements.")
        result_arcs = baml_client.TrackConflictTrajectory(all_scene_elements=elements_for_baml)
        arcs = convert_to_dict(result_arcs, logger)

        if not isinstance(arcs, list):
            raise TypeError(f"Expected list from BAML TrackConflictTrajectory, got {type(arcs)}")

        processed_arcs = []
        for arc in arcs:
            if isinstance(arc, dict) and arc.get('conflict_description'):
                arc_copy = arc.copy()
                # Rename BAML's scene_index back to our chunk_index concept for consistency
                if 'start_scene_index' in arc_copy: arc_copy['start_chunk_index'] = arc_copy.pop('start_scene_index')
                if 'climax_scene_index' in arc_copy: arc_copy['climax_chunk_index'] = arc_copy.pop('climax_scene_index')
                if 'resolution_scene_index' in arc_copy: arc_copy['resolution_chunk_index'] = arc_copy.pop('resolution_scene_index')
                processed_arcs.append(arc_copy)
            else:
                logger.warning(f"Invalid conflict arc structure received from BAML: {arc}")

        logger.info(f"Identified {len(processed_arcs)} potential conflict arcs.")
        return processed_arcs

    except Exception as e:
        return _handle_baml_error("TrackConflictTrajectory", e, logger, fallback_return=fallback_result)


@baml_cache(cache_dir_arg_index=3) # logger=0, name=1, desc=2, cache_dir=3
def enhance_character_profile(logger: logging.Logger, character_name: str, initial_description: str, cache_dir_override: Optional[str] = None, relevant_summaries: Optional[List[str]] = None) -> Dict[str, Any]:
    """Enhances a character profile using context summaries via BAML."""
    fallback_result = {"name": character_name, "description": initial_description, "error": "Unknown enhancement error", "is_fallback": True}
    valid_summaries = [s for s in (relevant_summaries or []) if isinstance(s, str) and s.strip() and not s.startswith("Fallback")]

    if not valid_summaries:
        logger.warning(f"No valid context summaries provided for enhancing '{character_name}'. Skipping BAML call.")
        fallback_result["error"] = "No context provided"
        fallback_result["enhancement_status"] = "skipped_no_context" # Add status
        return fallback_result

    try:
        logger.debug(f"Enhancing profile '{character_name}' using {len(valid_summaries)} summaries.")
        result = baml_client.EnhanceCharacterProfile(
            character_name=character_name,
            character_description=initial_description,
            relevant_chunks=valid_summaries # BAML expects 'relevant_chunks'
        )
        enhanced_data = convert_to_dict(result, logger)

        if not isinstance(enhanced_data, dict):
            raise TypeError(f"Expected dict from EnhanceCharacterProfile, got {type(enhanced_data)}")

        # Ensure the original name is preserved if BAML doesn't return one
        if 'name' not in enhanced_data or not enhanced_data.get('name'):
             enhanced_data['name'] = character_name

        return enhanced_data # Return the enhanced dictionary

    except Exception as e:
        err_res = _handle_baml_error("EnhanceCharacterProfile", e, logger, fallback_return=None)
        if isinstance(err_res, dict):
            fallback_result.update(err_res)
        else:
            fallback_result["error"] = str(err_res or f"Exception enhancing {character_name}: {e}")
        return fallback_result


# Note: GeneratePolishedExecutiveSummary was called directly in process_screenplay
# Let's wrap it here for consistency.
@baml_cache(cache_dir_arg_index=2) # logger=0, initial_summary=1, cache_dir=2
def generate_polished_executive_summary(logger: logging.Logger, initial_summary: str, cache_dir_override: Optional[str] = None, detail_level: str = "standard", max_tokens: int = 1000) -> Optional[Dict[str, Any]]:
    """Generates a polished final summary using BAML."""
    fallback_result = None # Or maybe {"summary_text": initial_summary, "error": ...}? Let's return None on failure.
    if not initial_summary or not initial_summary.strip() or len(initial_summary) < 50: # Basic validity check
        logger.warning("Skipping polish: Initial summary is empty, too short, or invalid.")
        return fallback_result

    try:
        logger.info(f"Generating Polished Executive Summary (detail:{detail_level}, max_tok:{max_tokens})...")
        result = baml_client.GeneratePolishedExecutiveSummary(
            initial_summary=initial_summary,
            detail_level=detail_level,
            max_tokens=max_tokens
        )
        polished_summary_obj = convert_to_dict(result, logger)

        if not isinstance(polished_summary_obj, dict) or not polished_summary_obj.get("summary_text"):
            logger.warning(f"GeneratePolishedExecutiveSummary returned invalid object or empty summary: {polished_summary_obj}")
            return fallback_result # Indicate failure

        return polished_summary_obj # Return the full object

    except Exception as e:
        return _handle_baml_error("GeneratePolishedExecutiveSummary", e, logger, fallback_return=fallback_result)


# --- END OF FILE baml_analysis.py ---