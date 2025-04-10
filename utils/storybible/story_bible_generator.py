# --- START OF FILE story_bible_generator.py ---

#!/usr/bin/env python3
"""
Main Script for Story Bible Generator (Modularized V11 - WC V2 HP)

Orchestrates the story bible generation pipeline using imported modules for
input processing, chunking, BAML analysis, and output generation.
Handles command-line arguments and overall execution flow.
"""

# --- Core Libraries ---
import os
import re
import json
import time
import datetime
import logging
from pathlib import Path
import sys
import argparse
from collections import defaultdict
from typing import Dict, Any, Optional, List # Keep necessary types

# --- BAML Client Import (Set marker on failure) ---
try:
    from baml_client import b as baml_client
    _BAML_IMPORT_SUCCESS = True
    # Test if 'b' object is usable (optional but good check)
    # If baml generate failed, b might exist but be empty/unusable
    if not hasattr(baml_client, '__version__'): # Check for a standard attribute
         print("WARNING: Imported 'baml_client.b' but it seems incomplete. Did 'baml-cli generate' run correctly?")
         # We could set _BAML_IMPORT_SUCCESS = False here if needed
except ImportError:
    baml_client = None # Explicitly set to None
    _BAML_IMPORT_SUCCESS = False
    print("ERROR: Failed to import 'baml_client'. Run 'pip install baml' and then 'baml-cli generate'.")
except Exception as e:
    baml_client = None # Explicitly set to None
    _BAML_IMPORT_SUCCESS = False
    print(f"ERROR: BAML client import failed with unexpected error: {e}")


# --- Custom Modules ---
try:
    from utils import setup_logging, convert_to_dict
    from input_processor import load_and_prepare_screenplay
    from chunker import chunk_screenplay
    import baml_analysis
    from output_generator import generate_markdown, save_story_bible, save_markdown
    # Import PDF check function here directly for use in main()
    from pdf_processor import is_pymupdf4llm_available
except ImportError as import_err:
    # Make this error message more informative
    print(f"ERROR: Failed to import necessary local modules: {import_err}. Ensure all .py files (utils, input_processor, chunker, baml_analysis, output_generator, pdf_processor, format_handler) are in the same directory and have no syntax errors.")
    # Exit here if core modules are missing
    sys.exit(1)
except Exception as e:
     print(f"ERROR: Unexpected error during initial module imports: {e}")
     sys.exit(1)


# --- Story Bible Generator Class ---
class StoryBibleGenerator:
    """
    Orchestrates the generation of a story bible by coordinating calls
    to specialized modules for each step of the pipeline.
    """

    def __init__(self, logger: Optional[logging.Logger] = None, cache_dir: Optional[str] = None):
        """
        Initializes the generator.

        Args:
            logger: Logger instance.
            cache_dir: Path to the directory for caching BAML results.

        Raises:
            ImportError: If the BAML client was not successfully imported earlier.
        """
        self.logger = logger or logging.getLogger('StoryBibleGen')
        self.cache_dir = cache_dir
        self.intermediate_results: Dict[str, Any] = {}
        self._markdown_saved = False

        # Check BAML client *after* logger is set up, using the flag set during module import
        if not _BAML_IMPORT_SUCCESS or baml_client is None:
            self.logger.critical("BAML client 'b' is not available or failed to import. Cannot proceed.")
            # Raise error here so constructor fails cleanly if BAML is missing
            raise ImportError("BAML client 'b' is not available or failed to import.")
        self.logger.info(f"StoryBibleGenerator initialized. Cache dir: {self.cache_dir or 'Disabled'}")

    def process_screenplay(self, prepared_script_text: str, input_filename: str, detail_level: str = "standard", perform_element_extraction: bool = True, perform_conflict_arc_analysis: bool = True, generate_treatment: bool = True, perform_character_prescan: bool = True, perform_character_enhancement: bool = True, retry_count: int = 2, max_tokens_per_chunk: int = 2000, output_markdown_path: Optional[str] = None) -> Dict[str, Any]:
        """
        Executes the full story bible generation pipeline.
        (No changes needed inside this method for the current issue)
        """
        self.logger.info(f"--- Starting V11 Pipeline (Modular) ---")
        self.logger.info(f"Input:'{input_filename}', Detail:{detail_level}")
        self.logger.info(f"Opts - Treat:{generate_treatment}, Prescan:{perform_character_prescan}, Elem:{perform_element_extraction}, Arcs:{perform_conflict_arc_analysis}, CharEnh:{perform_character_enhancement}")
        start_time = time.time()
        run_timestamp = datetime.datetime.now().isoformat()

        if not prepared_script_text or not prepared_script_text.strip():
            self.logger.error("Pipeline cannot proceed: Prepared script text is empty.")
            return {
                "error": "Prepared script text is empty",
                "metadata": {"input_file": input_filename, "failed_at": "preparation", "args": locals()}
            }

        # Reset intermediate results for this run
        self.intermediate_results = {
            "character_index": [], "treatment": None, "processed_chunks": [],
            "merge_rounds": [], "merged_elements": None, "conflict_arcs": [],
            "enhanced_characters_log": [], "initial_merged_summary": None,
            "final_polished_summary_obj": None,
        }
        # Initialize variables used throughout the pipeline
        treatment = None
        final_elements = {}
        initial_merged_summary = "Processing Error: Summary step not reached."
        final_summary_text = "Processing Error: Final summary step not reached."
        final_summary_obj = None
        conflict_arcs = []
        enhancement_performed_flag = False
        final_summary_polished_status = False
        markdown_text = None # Initialize markdown text
        num_chunks = 0 # Initialize chunk count
        valid_elements_for_merge = [] # Initialize list for step 5 scope

        # --- Pipeline Steps ---
        try:
            # STEP 0: Character Pre-Scan
            if perform_character_prescan:
                self.logger.info("STEP 0: Character Pre-Scan")
                self.intermediate_results["character_index"] = baml_analysis.prescan_characters(
                    logger=self.logger,
                    script_text=prepared_script_text,
                    cache_dir_override=self.cache_dir
                )
                self.logger.info(f" > Found {len(self.intermediate_results['character_index'])} potential chars.")
            else:
                self.logger.info("STEP 0: Skip Pre-Scan")

            # STEP 1: Generate Story Treatment
            if generate_treatment:
                self.logger.info("STEP 1: Generate Story Treatment")
                treatment = baml_analysis.generate_story_treatment(
                    logger=self.logger,
                    script_text=prepared_script_text,
                    cache_dir_override=self.cache_dir
                )
                self.intermediate_results["treatment"] = treatment
                if treatment:
                    self.logger.info(f" > Treatment OK (Title: {treatment.get('title', 'N/A')}).")
                else:
                    self.logger.warning(" > Treatment generation failed or returned invalid data.")
            else:
                self.logger.info("STEP 1: Skip Treatment")

            # STEP 2: Chunk Screenplay
            self.logger.info("STEP 2: Chunk Screenplay")
            chunks = chunk_screenplay(
                logger=self.logger,
                script_text=prepared_script_text,
                cache_dir=self.cache_dir,
                max_tokens=max_tokens_per_chunk
            )
            if not chunks:
                self.logger.error("Chunking failed to produce any chunks. Cannot proceed.")
                # Include intermediate results gathered so far in error dict
                return {
                    "error": "Chunking failed",
                    "metadata": {"input_file": input_filename, "failed_at": "chunking", "args": locals()},
                    "intermediate_results": self.intermediate_results
                }
            num_chunks = len(chunks)
            self.logger.info(f" > Script divided into {num_chunks} chunks.")


            # STEP 3: Process Each Chunk (Summarize & Extract Elements)
            self.logger.info(f"STEP 3: Processing {num_chunks} Chunks (Summarize & Extract Elements)")
            processed_chunk_data: List[Dict[str, Any]] = []
            summary_tokens = {'concise': 250, 'standard': 400, 'detailed': 600}.get(detail_level, 400)
            known_chars_from_prescan = self.intermediate_results.get("character_index", [])

            for i, chunk_text in enumerate(chunks):
                chunk_idx = i + 1
                self.logger.info(f"  Processing chunk {chunk_idx}/{num_chunks}...")
                chunk_summary = f"Fallback Summary: Chunk {chunk_idx} processing skipped."
                chunk_elements: Dict[str, Any] = {"chunk_index": chunk_idx, "status": "Processing skipped", "is_fallback": True}

                if not chunk_text or not chunk_text.strip():
                    self.logger.warning(f"  Skipping empty chunk {chunk_idx}.")
                    chunk_summary = f"Skipped (Empty Chunk {chunk_idx})"
                    chunk_elements = {"chunk_index": chunk_idx, "status": "Skipped (Empty Chunk)", "is_fallback": True}
                    processed_chunk_data.append({"chunk_index": chunk_idx, "summary": chunk_summary, "elements": chunk_elements})
                    continue

                chunk_summary = baml_analysis.summarize_chunk(
                    logger=self.logger, chunk_text=chunk_text, cache_dir_override=self.cache_dir,
                    treatment=treatment, detail_level=detail_level, max_tokens=summary_tokens
                )

                if perform_element_extraction:
                    chunk_elements = baml_analysis.extract_scene_elements(
                        logger=self.logger, scene_text=chunk_text, cache_dir_override=self.cache_dir,
                        chunk_index=chunk_idx, scene_summary=chunk_summary if not chunk_summary.startswith("Fallback") else None,
                        known_characters=known_chars_from_prescan
                    )
                else:
                    chunk_elements = {"chunk_index": chunk_idx, "status": "Element extraction skipped", "is_fallback": True}

                processed_chunk_data.append({"chunk_index": chunk_idx, "summary": chunk_summary, "elements": chunk_elements})
                elements_ok = perform_element_extraction and isinstance(chunk_elements, dict) and not chunk_elements.get('error', False) and not chunk_elements.get('is_fallback', False)
                self.logger.debug(f"  > Chunk {chunk_idx}: Summary OK={not chunk_summary.startswith('Fallback')}, Elements OK={elements_ok}")

            self.intermediate_results["processed_chunks"] = processed_chunk_data

            chunk_summaries = [
                cd["summary"] for cd in processed_chunk_data
                if cd.get("summary") and isinstance(cd["summary"], str) and not cd["summary"].startswith("Fallback") and not cd["summary"].startswith("Skipped")
            ]
            chunk_elements_list = [
                cd["elements"] for cd in processed_chunk_data if isinstance(cd.get("elements"), dict)
            ]

            # STEP 4: Merge Chunk Summaries
            self.logger.info(f"STEP 4: Merging {len(chunk_summaries)} Valid Chunk Summaries")
            initial_merged_summary = "Fallback Merge: No valid chunk summaries generated."
            if chunk_summaries:
                merge_tokens = {'concise': 600, 'standard': 900, 'detailed': 1200}.get(detail_level, 900)
                final_merge_tokens = {'concise': 800, 'standard': 1400, 'detailed': 1800}.get(detail_level, 1400)
                batch_size = {'concise': 5, 'standard': 4, 'detailed': 3}.get(detail_level, 4)
                current_summaries = chunk_summaries[:]
                round_num = 1
                while len(current_summaries) > 1:
                    self.logger.info(f"  Merging round {round_num}: {len(current_summaries)} summaries -> ~{ (len(current_summaries) + batch_size - 1) // batch_size} summaries")
                    next_summaries = []
                    round_results_log = []
                    is_final_round = (len(current_summaries) <= batch_size)
                    current_max_tokens = final_merge_tokens if is_final_round else merge_tokens
                    for j in range(0, len(current_summaries), batch_size):
                        batch_to_merge = current_summaries[j:j+batch_size]
                        if not batch_to_merge: continue
                        if len(batch_to_merge) == 1: next_summaries.append(batch_to_merge[0]); continue
                        merged_batch_summary = baml_analysis.merge_summaries(
                            logger=self.logger, summaries=batch_to_merge, cache_dir_override=self.cache_dir,
                            treatment=treatment, detail_level=detail_level, is_final_merge=is_final_round,
                            max_tokens=current_max_tokens
                        )
                        next_summaries.append(merged_batch_summary)
                        round_results_log.append({"input_count": len(batch_to_merge), "output_preview": str(merged_batch_summary)[:100]+"..."})
                    self.intermediate_results["merge_rounds"].append({ "round": round_num, "in": len(current_summaries), "out": len(next_summaries), "results": round_results_log })
                    current_summaries = next_summaries; round_num += 1
                initial_merged_summary = current_summaries[0] if current_summaries else "Error: Summary merging failed completely."
                self.logger.info(f"  > Initial merged summary generated ({len(initial_merged_summary)} chars).")
            else:
                self.logger.warning("  > Skipping summary merge - no valid chunk summaries.")
            self.intermediate_results["initial_merged_summary"] = initial_merged_summary

            # STEP 5: Merge Chunk Elements
            merged_chunk_elements: Dict[str, Any] = {"status": "Merging skipped or failed", "is_fallback": True}
            valid_elements_for_merge = [ # Filter valid elements for merging step
                elem for elem in chunk_elements_list
                if isinstance(elem, dict) and not elem.get("is_fallback") and not elem.get("error") and 'chunk_index' in elem
            ]
            if perform_element_extraction and valid_elements_for_merge:
                self.logger.info(f"STEP 5: Merging {len(valid_elements_for_merge)} Valid Chunk Element Sets")
                merged_chunk_elements = baml_analysis.merge_scene_elements(
                    logger=self.logger, scene_elements_list=valid_elements_for_merge,
                    cache_dir_override=self.cache_dir, known_characters=known_chars_from_prescan
                )
                self.intermediate_results["merged_elements"] = merged_chunk_elements
                if isinstance(merged_chunk_elements, dict) and not merged_chunk_elements.get("error") and not merged_chunk_elements.get("is_fallback"):
                    self.logger.info("  > Chunk elements merged successfully.")
                else:
                    err_msg = merged_chunk_elements.get('error', 'Unknown merge error') if isinstance(merged_chunk_elements, dict) else "Invalid merge result type"
                    self.logger.error(f"  > Failed to merge chunk elements: {err_msg}")
            elif perform_element_extraction:
                self.logger.warning("STEP 5: Skipping element merge - no valid elements found after chunk processing.")
            else:
                self.logger.info("STEP 5: Skipping element merge - extraction disabled.")

            # STEP 6: Track Conflict Trajectory
            can_track_conflicts = (perform_element_extraction and perform_conflict_arc_analysis and chunk_elements_list)
            if can_track_conflicts:
                self.logger.info("STEP 6: Tracking Conflict Trajectory")
                conflict_arcs = baml_analysis.track_conflict_trajectory(
                    logger=self.logger, all_scene_elements=chunk_elements_list,
                    cache_dir_override=self.cache_dir
                )
                self.intermediate_results["conflict_arcs"] = conflict_arcs
                self.logger.info(f"  > Identified {len(conflict_arcs)} conflict arcs.")
                if isinstance(merged_chunk_elements, dict) and not merged_chunk_elements.get("error") and not merged_chunk_elements.get("is_fallback"):
                    merged_chunk_elements["conflict_arcs"] = conflict_arcs
                    self.logger.debug("  > Added conflict arcs to merged elements dictionary.")
                elif conflict_arcs:
                    self.logger.warning("  > Conflict arcs identified, but could not add to merged elements. Stored separately.")
            else:
                self.logger.info(f"STEP 6: Skipping Conflict Trajectory Analysis (Requires Elem:{perform_element_extraction}, Arcs:{perform_conflict_arc_analysis}, Data Available:{bool(chunk_elements_list)})")

            # STEP 7: Enhance Character Profiles
            enhancement_performed_flag = False
            can_enhance_chars = (
                perform_character_enhancement and isinstance(merged_chunk_elements, dict) and
                not merged_chunk_elements.get("error") and not merged_chunk_elements.get("is_fallback") and
                isinstance(merged_chunk_elements.get("characters"), list) and merged_chunk_elements.get("characters")
            )
            if can_enhance_chars:
                self.logger.info("STEP 7: Enhancing Character Profiles")
                characters_to_enhance = merged_chunk_elements.get("characters", [])
                enhanced_characters_list = []
                enhancement_log = []
                self.logger.info("  Building character context index...")
                char_context = defaultdict(list)
                for chunk_data in processed_chunk_data:
                    summary = chunk_data.get("summary"); elements = chunk_data.get("elements")
                    if summary and not summary.startswith("Fallback") and not summary.startswith("Skipped") and isinstance(elements, dict) and not elements.get("error") and not elements.get("is_fallback"):
                        chars_in_chunk = elements.get("characters", [])
                        if isinstance(chars_in_chunk, list):
                             for char_el in chars_in_chunk:
                                 if isinstance(char_el, dict):
                                     char_name = char_el.get("name")
                                     if char_name and isinstance(char_name, str):
                                         name_parts = char_name.split(); key = name_parts[0].upper() if name_parts else None
                                         if key: char_context[key].append(summary)
                self.logger.info(f"  Context index built ({len(char_context)} keys). Enhancing {len(characters_to_enhance)} chars.")
                for char_data in characters_to_enhance:
                    enhanced_profile = char_data.copy(); log_status = "skipped_invalid_data"
                    if isinstance(char_data, dict) and isinstance(char_data.get("name"), str) and char_data.get("name"):
                        name = char_data["name"]; desc = char_data.get("description", "")
                        key_parts = name.split(); key = key_parts[0].upper() if key_parts else None
                        ctx_summaries = char_context.get(key, [])[:5] if key else []
                        if ctx_summaries:
                            self.logger.debug(f"    Enhancing '{name}'...")
                            enhancement_result = baml_analysis.enhance_character_profile(
                                logger=self.logger, character_name=name, initial_description=desc,
                                cache_dir_override=self.cache_dir, relevant_summaries=ctx_summaries
                            )
                            if isinstance(enhancement_result, dict) and not enhancement_result.get("error") and not enhancement_result.get("is_fallback"):
                                log_status = "success"; enhanced_profile = enhancement_result
                                self.logger.debug(f"    Enhancement OK for '{name}'.")
                            else:
                                log_status = "error"; enhance_err = enhancement_result.get("error", "Unknown")
                                enhanced_profile["enhancement_error"] = enhance_err
                                self.logger.warning(f"    Enhancement FAILED for '{name}': {enhance_err}")
                        else: log_status = "skipped_no_context"; self.logger.warning(f"    No context found for '{name}'. Skipping enhancement call.")
                    else: self.logger.warning(f"  Skipping enhancement for invalid char data: {char_data}")
                    enhanced_profile["enhancement_status"] = log_status
                    enhanced_characters_list.append(enhanced_profile)
                    enhancement_log.append({"name": enhanced_profile.get("name", "Invalid"), "status": log_status})
                merged_chunk_elements["characters"] = enhanced_characters_list
                self.intermediate_results["enhanced_characters_log"] = enhancement_log
                enhancement_performed_flag = True; self.logger.info(f"  > Character enhancement complete.")
            elif perform_character_enhancement:
                reason = "unknown";
                if not (isinstance(merged_chunk_elements, dict) and not merged_chunk_elements.get("error")): reason = "merged elements invalid/failed"
                elif not isinstance(merged_chunk_elements.get("characters"), list): reason = "merged 'characters' not list"
                elif not merged_chunk_elements.get("characters"): reason = "merged 'characters' empty"
                self.logger.warning(f"STEP 7: Skipping Character Enhancement (Reason: {reason}).")
            else: self.logger.info("STEP 7: Skipping Character Enhancement (disabled).")

            # STEP 8: Generate Polished Final Synopsis
            self.logger.info("STEP 8: Generating Polished Final Synopsis")
            final_summary_text = initial_merged_summary; final_summary_obj = None; final_summary_polished_status = False
            final_polish_tokens = {'concise': 700, 'standard': 1000, 'detailed': 1500}.get(detail_level, 1000)
            is_initial_summary_valid = (isinstance(initial_merged_summary, str) and initial_merged_summary.strip() and not initial_merged_summary.startswith("Error:") and not initial_merged_summary.startswith("Fallback") and len(initial_merged_summary) > 100)
            if is_initial_summary_valid:
                final_summary_obj = baml_analysis.generate_polished_executive_summary(
                    logger=self.logger, initial_summary=initial_merged_summary, cache_dir_override=self.cache_dir,
                    detail_level=detail_level, max_tokens=final_polish_tokens
                )
                if isinstance(final_summary_obj, dict) and final_summary_obj.get("summary_text"):
                     polished_text = final_summary_obj.get("summary_text", "").strip()
                     if polished_text:
                         final_summary_text = polished_text; final_summary_polished_status = True
                         tone = final_summary_obj.get('tone', 'N/A'); focus = final_summary_obj.get('arc_focus', 'N/A')
                         self.logger.info(f"  > Polished synopsis OK ({len(final_summary_text)} chars). Tone:{tone}, Focus:{focus}")
                     else: self.logger.warning("  > Polish returned empty summary text. Using initial.")
                else: self.logger.warning(f"  > Polishing failed or returned invalid object. Using initial.")
            else: self.logger.warning(f"STEP 8: Skipping final polish - Initial summary invalid/short.")
            self.intermediate_results["final_polished_summary_obj"] = final_summary_obj

            # STEP 9: Assign Final Elements for Output
            self.logger.info("STEP 9: Assigning Final Elements for Output")
            if isinstance(merged_chunk_elements, dict) and not merged_chunk_elements.get("error") and not merged_chunk_elements.get("is_fallback"):
                if "conflict_arcs" not in merged_chunk_elements and conflict_arcs: merged_chunk_elements["conflict_arcs"] = conflict_arcs
                final_elements = merged_chunk_elements; self.logger.info("  > Using successfully merged chunk elements.")
            elif perform_element_extraction:
                final_elements = {"error": "Element processing/merging failed.", "is_fallback": True}
                if conflict_arcs: final_elements["conflict_arcs"] = conflict_arcs
                self.logger.warning("  > Element processing failed; final elements indicate error.")
            else: final_elements = {"status": "Element extraction skipped."}; self.logger.info("  > Element extraction skipped; final elements indicate status.")

            # STEP 11: Compile Final Story Bible Output Dictionary
            self.logger.info("STEP 11: Compiling Final Story Bible Output")
            execution_time = time.time() - start_time
            final_metadata = {
                "input_file": input_filename, "detail_level": detail_level, "chunks_processed": num_chunks,
                "processing_time_seconds": round(execution_time, 2), "generated_at": run_timestamp,
                "treatment_generated": generate_treatment and (treatment is not None),
                "character_prescan_performed": perform_character_prescan,
                "scene_elements_extracted": perform_element_extraction and bool(valid_elements_for_merge),
                "conflict_arcs_analyzed": perform_conflict_arc_analysis and bool(conflict_arcs),
                "character_enhancement_performed": enhancement_performed_flag,
                "final_summary_polished": final_summary_polished_status
            }
            complete_story_bible = {
                "title": treatment.get("title", Path(input_filename).stem) if treatment else Path(input_filename).stem,
                "logline": treatment.get("logline") if treatment else None,
                "summary": final_summary_text, "treatment": treatment,
                "summary_details": final_summary_obj, "elements": final_elements,
                "character_index": final_elements.get("characters", self.intermediate_results["character_index"]),
                "metadata": final_metadata, "intermediate_results": self.intermediate_results
            }
            narrative_structure = None
            if isinstance(final_elements, dict): narrative_structure = final_elements.get("narrative_structure")
            if not narrative_structure and isinstance(final_summary_obj, dict): narrative_structure = final_summary_obj.get("narrative_structure")
            complete_story_bible["narrative_structure"] = narrative_structure

            # STEP 10: Generate and Save Markdown (if path provided)
            if output_markdown_path:
                 self.logger.info("STEP 10: Generating and Saving Markdown Output")
                 try:
                     markdown_text = generate_markdown(
                         logger=self.logger, story_bible=complete_story_bible,
                         title=f"Story Bible: {complete_story_bible['title']}"
                     )
                     self.logger.info(f"  > Markdown content generated ({len(markdown_text)} chars).")
                     if markdown_text and "## Markdown Generation Error" not in markdown_text:
                          save_markdown(self.logger, markdown_text, output_markdown_path)
                          self._markdown_saved = True # Set flag on success
                     else: self.logger.warning(f"  > MD path provided ({output_markdown_path}), but generation failed or produced error content. Not saved.")
                 except Exception as e: self.logger.error(f"  > Markdown generation/saving failed critically: {e}", exc_info=True)

            self.logger.info(f"--- V11 Pipeline (Modular) complete in {execution_time:.2f} seconds. ---")
            return complete_story_bible

        except Exception as pipeline_error:
            self.logger.critical(f"CRITICAL PIPELINE ERROR: {pipeline_error}", exc_info=True)
            error_bible = {
                "error": f"Critical Pipeline Failure: {str(pipeline_error)}",
                "metadata": {"input_file": input_filename, "failed_at": datetime.datetime.now().isoformat(), "args": locals()},
                "intermediate_results": self.intermediate_results
            }
            if 'treatment' in locals(): error_bible["treatment"] = treatment
            if 'final_elements' in locals(): error_bible["elements"] = final_elements
            if 'final_summary_text' in locals(): error_bible["summary"] = final_summary_text
            return error_bible


# --- Main Execution ---
def main():
    """Command-line interface for the Modular Story Bible Generator."""
    parser = argparse.ArgumentParser(
        description='Generate story bible using BAML (Modular V11 - WC V2 HP)',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    # (Argument parsing remains the same)
    parser.add_argument('script_file', help='Path to screenplay file (txt, md, pdf, fountain, etc.)')
    parser.add_argument('--output-json', '-j', default=None, help='Path for JSON output. Default: <script_name>_bible.json in timestamped folder.')
    parser.add_argument('--output-markdown', '-m', default=None, help='Path for Markdown output. Default: <script_name>_bible.md in timestamped folder.')
    parser.add_argument('--cache-dir', '-c', default=None, help='Directory for BAML cache files. Disabled if omitted.')
    parser.add_argument('--log-file', '-l', default=None, help='Path to log file. Console only if omitted.')
    parser.add_argument('--detail-level', '-d', choices=['concise', 'standard', 'detailed'], default='standard', help='Generation detail level.')
    parser.add_argument('--no-treatment', dest='generate_treatment', action='store_false', help='Disable initial treatment generation.')
    parser.add_argument('--no-prescan', dest='perform_character_prescan', action='store_false', help='Disable character pre-scan.')
    parser.add_argument('--no-elements', dest='perform_element_extraction', action='store_false', help='Disable element extraction (also disables conflict arcs, char enhancement).')
    parser.add_argument('--no-conflict-arcs', dest='perform_conflict_arc_analysis', action='store_false', help='Disable conflict arc analysis (requires elements).')
    parser.add_argument('--no-char-enhance', dest='perform_character_enhancement', action='store_false', help='Disable character enhancement (requires elements).')
    parser.add_argument('--verbose', '-v', action='store_true', help='Enable DEBUG level logging.')
    parser.add_argument('--retries', '-r', type=int, default=2, help='Retries for failed BAML calls (Note: retry logic might be internal to wrappers).')
    parser.add_argument('--max-tokens', '-t', type=int, default=2000, help='Max tokens per chunk for splitting.')
    parser.set_defaults(
        generate_treatment=True, perform_character_prescan=True, perform_element_extraction=True,
        perform_conflict_arc_analysis=True, perform_character_enhancement=True
    )
    args = parser.parse_args()

    # Setup Logging using the utility function
    logger = setup_logging(args.verbose, args.log_file)
    logger.info("--- Initializing Story Bible Generator (V11 Modular) ---")
    logger.debug(f"Parsed Arguments: {args}")

    # --- Check Dependencies (BAML, PDF) ---
    # BAML Check (relies on flag set during module import)
    if not _BAML_IMPORT_SUCCESS:
        logger.critical("BAML client failed to import at module level. Cannot initialize generator.")
        sys.exit(1)
    else:
         logger.info("BAML client import successful at module level.")

    # PDF Check (uses function imported at module level)
    pdf_available = False
    try:
        # is_pymupdf4llm_available was imported at the top
        pdf_available = is_pymupdf4llm_available()
    except NameError: # Handles case where pdf_processor import failed entirely
        logger.warning("is_pymupdf4llm_available function not found (pdf_processor import likely failed). PDF support disabled.")
    except Exception as pdf_check_err:
         logger.warning(f"Error checking PDF availability: {pdf_check_err}. PDF support disabled.")

    if not pdf_available:
        logger.warning("PDF support disabled (PyMuPDF4LLM not installed or pdf_processor.py issue).")
        if Path(args.script_file).suffix.lower() == '.pdf':
            logger.error("Input is PDF, but support is disabled. Please install 'pymupdf4llm' and ensure pdf_processor.py is correct.")
            sys.exit(1)
    else:
         logger.info("PDF support dependencies detected.")

    # Adjust flags based on --no-* args AND dependencies
    if not args.perform_element_extraction:
        if args.perform_conflict_arc_analysis:
            logger.warning("Disabling Conflict Arcs analysis because Element Extraction is disabled.")
            args.perform_conflict_arc_analysis = False
        if args.perform_character_enhancement:
            logger.warning("Disabling Character Enhancement because Element Extraction is disabled.")
            args.perform_character_enhancement = False

    # --- Prepare Output Paths ---
    script_path = Path(args.script_file)
    script_base_name = script_path.stem
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    final_output_json = args.output_json
    final_output_markdown = args.output_markdown
    md_path_arg = None # Initialize markdown path argument

    # Create default output directory if paths are not specified
    if not final_output_json or (args.output_markdown is None and not final_output_markdown): # Check if MD needs default
        try:
            safe_base_name = re.sub(r'[<>:"/\\|?*.]', '_', script_base_name) # Be more aggressive with sanitization
            output_dir_name = f"{safe_base_name}_bible_v11_{timestamp}"
            output_dir = Path(output_dir_name).resolve() # Resolve path immediately
            output_dir.mkdir(exist_ok=True, parents=True)
            logger.info(f"Using default output directory: '{output_dir}'")
            if not final_output_json:
                final_output_json = output_dir / f"{safe_base_name}_bible.json"
            if args.output_markdown is None and not final_output_markdown: # Set default MD only if not provided via args
                final_output_markdown = output_dir / f"{safe_base_name}_bible.md"
        except Exception as e:
            logger.error(f"Failed to create default output directory '{output_dir_name}': {e}. Specify output paths manually or check permissions.")
            sys.exit(1)

    # Resolve and ensure parent directories exist for specified paths
    try:
        if final_output_json:
            final_output_json = Path(final_output_json).resolve()
            final_output_json.parent.mkdir(parents=True, exist_ok=True)
            logger.info(f"JSON output target: {final_output_json}")
        else:
             raise ValueError("JSON output path could not be determined.") # Should not happen

        if final_output_markdown: # Use the potentially default-set path
            final_output_markdown = Path(final_output_markdown).resolve()
            final_output_markdown.parent.mkdir(parents=True, exist_ok=True)
            logger.info(f"Markdown output target: {final_output_markdown}")
            md_path_arg = str(final_output_markdown) # Set argument for process call
        else:
             logger.info("Markdown output path not specified, will not be saved automatically.")
             # md_path_arg remains None

    except Exception as path_e:
        logger.error(f"Error resolving or creating parent directory for output files: {path_e}")
        sys.exit(1)

    # --- Prepare Cache Directory ---
    cache_dir_path = None
    if args.cache_dir:
        try:
            cache_dir_path = Path(args.cache_dir).resolve()
            cache_dir_path.mkdir(exist_ok=True, parents=True)
            logger.info(f"Using cache directory: {cache_dir_path}")
        except Exception as e:
            logger.error(f"Cache directory error for '{args.cache_dir}': {e}. Caching disabled.")
            cache_dir_path = None

    # --- Instantiate Generator ---
    try:
        # The __init__ now contains the BAML check using the module-level import result
        generator = StoryBibleGenerator(logger=logger, cache_dir=cache_dir_path)
    except ImportError as gen_imp_err:
         logger.critical(f"Failed to instantiate StoryBibleGenerator: {gen_imp_err}")
         sys.exit(1)
    except Exception as gen_e:
        logger.critical(f"Failed to instantiate StoryBibleGenerator: {gen_e}", exc_info=True)
        sys.exit(1)

    # --- Load and Prepare Script ---
    prepared_script_text = ""
    try:
        prepared_script_text = load_and_prepare_screenplay(args.script_file, logger=logger)
        if not prepared_script_text or not prepared_script_text.strip():
            logger.error("Script loading and preparation resulted in empty content. Cannot proceed.")
            error_data = {"error": "Script preparation resulted in empty content.", "metadata": {"input_file": script_path.name, "args": vars(args)}}
            error_json_path = final_output_json.with_name(final_output_json.stem + "_PREP_ERROR.json")
            save_story_bible(logger, error_data, str(error_json_path))
            sys.exit(1)
        logger.info("Script loaded and prepared successfully.")
    except FileNotFoundError:
        logger.error(f"Input file not found: '{args.script_file}'. Please check the path.")
        sys.exit(1)
    except ValueError as ve:
        logger.error(f"Input error during loading/preparation: {ve}")
        sys.exit(1)
    except ImportError as ie:
        logger.error(f"Dependency error during loading/preparation: {ie}")
        sys.exit(1)
    except Exception as e:
        logger.error(f"Failed during script load/prepare phase: {e}", exc_info=True)
        sys.exit(1)

    # --- Run Processing Pipeline ---
    story_bible = {}
    try:
        story_bible = generator.process_screenplay(
            prepared_script_text=prepared_script_text,
            input_filename=script_path.name,
            detail_level=args.detail_level,
            perform_element_extraction=args.perform_element_extraction,
            perform_conflict_arc_analysis=args.perform_conflict_arc_analysis,
            generate_treatment=args.generate_treatment,
            perform_character_prescan=args.perform_character_prescan,
            perform_character_enhancement=args.perform_character_enhancement,
            retry_count=args.retries,
            max_tokens_per_chunk=args.max_tokens,
            output_markdown_path=md_path_arg # Pass resolved MD path or None
        )
    except Exception as e:
        logger.critical(f"CRITICAL ERROR during pipeline execution: {e}", exc_info=True)
        partial_results = generator.intermediate_results if hasattr(generator, 'intermediate_results') else {}
        if isinstance(story_bible, dict) and 'intermediate_results' in story_bible:
             partial_results = story_bible.get('intermediate_results', partial_results)
        err_data = {
            "error": f"Critical Pipeline Failure: {str(e)}",
            "partial_results": convert_to_dict(partial_results, logger), # Ensure serializable
            "metadata": {"failed_at": datetime.datetime.now().isoformat(), "input_file": script_path.name, "args": vars(args)}
        }
        error_json_path = final_output_json.with_name(final_output_json.stem + "_CRITICAL_ERROR.json")
        try:
            save_story_bible(logger, err_data, str(error_json_path))
            logger.info(f"Saved partial error state to: {error_json_path}")
        except Exception as save_err:
            logger.error(f"Failed to save partial error state after critical failure: {save_err}")
        sys.exit(1)

    # --- Save Final JSON Output ---
    if final_output_json: # Ensure path is determined
        if isinstance(story_bible, dict) and "error" not in story_bible:
            save_story_bible(logger, story_bible, str(final_output_json))
        elif isinstance(story_bible, dict) and "error" in story_bible:
            logger.error(f"Pipeline finished with an error: {story_bible['error']}")
            logger.info(f"Saving error details to: {final_output_json}")
            save_story_bible(logger, story_bible, str(final_output_json))
        elif not isinstance(story_bible, dict):
            logger.error(f"Pipeline completed but the final result was not a dictionary (type: {type(story_bible)}). Cannot save JSON.")
            err_data = {"error": "Pipeline failed to produce a valid dictionary result.", "result_type": str(type(story_bible)), "metadata": {"input_file": script_path.name, "args": vars(args)}}
            error_json_path = final_output_json.with_name(final_output_json.stem + "_INVALID_RESULT.json")
            save_story_bible(logger, err_data, str(error_json_path))
    else:
         logger.error("JSON output path was not determined. Cannot save.")


    # --- Final Logging ---
    logger.info("\n========== V11 PIPELINE COMPLETE (Modular) ==========")
    if isinstance(story_bible, dict) and story_bible.get("error"):
        logger.error(f"Process finished with error: {story_bible['error']}")
    elif not isinstance(story_bible, dict):
         logger.error("Process finished, but final result was not a dictionary.")
    else:
        logger.info(f"Final Summary Length: {len(story_bible.get('summary', 'N/A'))} chars")

    final_metadata = story_bible.get('metadata', {}) if isinstance(story_bible, dict) else {}
    logger.info(f"Total Processing Time: {final_metadata.get('processing_time_seconds', 0):.2f} seconds")
    if final_output_json:
        logger.info(f"JSON Output target: {final_output_json}")

    markdown_saved_flag = getattr(generator, '_markdown_saved', False)
    # Check md_path_arg which holds the actual path used (or None)
    if md_path_arg and markdown_saved_flag:
        logger.info(f"Markdown Output saved to: {md_path_arg}")
    elif md_path_arg and not markdown_saved_flag:
        logger.warning(f"Markdown output path specified ({md_path_arg}), but file may not have been saved (check for errors above).")
    elif not md_path_arg: # If no path was ever determined or specified
         logger.info("Markdown output path was not specified.")

    logger.info("--- Story Bible Generation Finished ---")

if __name__ == "__main__":
    main()
# --- END OF FILE story_bible_generator.py ---