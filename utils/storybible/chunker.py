# --- START OF FILE chunker.py ---

#!/usr/bin/env python3
"""
Screenplay Chunking Module for Story Bible Generator.
Handles splitting scripts into chunks, preferring scene boundaries identified
via regex patterns (potentially informed by LLM analysis).
"""

import re
import logging
import datetime
from pathlib import Path
import json
from typing import List, Tuple, Optional

try:
    import tiktoken
except ImportError:
    print("ERROR: Failed to import 'tiktoken'. Run 'pip install tiktoken'.")
    import sys
    sys.exit(1)

# BAML client needed for identify_scene_patterns
try:
    from baml_client import b as baml_client # Import baml_client globally in this module
except ImportError:
    print("ERROR: Failed to import 'baml_client'. Run 'pip install baml' and then 'baml-cli generate'.")
    import sys
    sys.exit(1)
except Exception as e:
    print(f"ERROR: BAML client import failed: {e}")
    import sys
    sys.exit(1)

# Import caching and conversion from utils
try:
    from utils import baml_cache, convert_to_dict
except ImportError:
     print("ERROR: Failed to import from 'utils.py'. Ensure it's in the same directory.")
     import sys
     sys.exit(1)


# --- LLM Scene Pattern Identification ---
@baml_cache(cache_dir_arg_index=2) # logger is 0, script_text is 1, cache_dir is 2
def identify_scene_patterns(logger: logging.Logger, script_text: str, cache_dir_override: Optional[str] = None, sample_size_chars: int = 10000) -> Tuple[List[str], str]:
    """Uses BAML to identify likely regex patterns for scene headings."""
    logger.info("Attempting to identify scene heading patterns using LLM...")
    if not script_text or not script_text.strip():
        logger.warning("Script text is empty, cannot identify patterns.")
        return _get_default_scene_patterns(logger), "Low (Empty Input)"

    script_sample = script_text[:sample_size_chars].strip()
    if not script_sample:
        logger.warning("Script sample for pattern identification is empty. Falling back.")
        return _get_default_scene_patterns(logger), "Low (Empty Sample)"

    default_patterns = _get_default_scene_patterns(logger)
    logger.debug(f"Sending sample (first 500 chars) to IdentifySceneHeadingPattern:\n---\n{script_sample[:500]}\n---")

    try:
        # Assuming baml_client is imported as b in this module's scope
        result = baml_client.IdentifySceneHeadingPattern(script_sample=script_sample)
        patterns_obj = convert_to_dict(result, logger) # Use util converter

        if isinstance(patterns_obj, dict):
            identified_patterns = patterns_obj.get("identified_patterns", [])
            confidence = patterns_obj.get("confidence", "Low").lower()
            reasoning = patterns_obj.get("reasoning", "N/A")
            examples = patterns_obj.get("example_matches", [])

            logger.info(f"--- LLM IdentifySceneHeadingPattern Raw Response ---")
            logger.info(json.dumps(patterns_obj, indent=2))
            logger.info(f"--- End LLM Response ---")

            if identified_patterns and confidence in ["high", "medium"]:
                valid_patterns = [p for p in identified_patterns if isinstance(p, str) and p.strip()]
                if valid_patterns:
                    logger.info(f"LLM identified {len(valid_patterns)} scene pattern(s) with {confidence} confidence.")
                    logger.debug(f"  Patterns: {valid_patterns}")
                    if examples: logger.debug(f"  Example Matches: {examples}")
                    if reasoning: logger.debug(f"  Reasoning: {reasoning}")
                    return valid_patterns, patterns_obj.get("confidence", "Medium")
                else:
                    logger.warning("LLM returned empty or invalid patterns. Falling back to defaults.")
                    return default_patterns, "Low (Invalid LLM Output)"
            else:
                logger.warning(f"LLM pattern confidence low ({confidence}) or no patterns found. Falling back to defaults.")
                return default_patterns, f"Low ({confidence})"
        else:
            logger.error(f"BAML IdentifySceneHeadingPattern returned unexpected type: {type(patterns_obj)}. Falling back to defaults.")
            return default_patterns, "Low (BAML Error)"

    except AttributeError:
        logger.error("BAML 'IdentifySceneHeadingPattern' function likely missing or outdated. Falling back to defaults.")
        return default_patterns, "Low (BAML Missing)"
    except Exception as e:
        logger.error(f"Error during LLM scene pattern identification: {e}", exc_info=True)
        return default_patterns, f"Low (Exception: {e})"

# --- Chunking Main Function ---
def chunk_screenplay(logger: logging.Logger, script_text: str, cache_dir: Optional[str] = None, max_tokens: int = 2000) -> List[str]:
    """
    Chunks screenplay intelligently, preferring scene boundaries.

    Args:
        logger: Logger instance.
        script_text: The prepared text of the screenplay.
        cache_dir: Path to the cache directory (for identify_scene_patterns).
        max_tokens: The maximum token limit for each chunk.

    Returns:
        A list of text chunks.
    """
    if not script_text or not script_text.strip():
        logger.error("Cannot chunk empty script text.")
        return []

    # Identify patterns (passing logger and cache dir)
    identified_patterns, pattern_confidence = identify_scene_patterns(logger, script_text, cache_dir_override=cache_dir)
    logger.info(f"Using scene patterns (Confidence: {pattern_confidence}) for extraction attempt.")

    # Extract scenes based on patterns
    scenes = _extract_scenes_by_pattern(logger, script_text, identified_patterns)

    if len(scenes) >= 3: # Use scene-based chunking if enough scenes found
        logger.info(f"Extracted {len(scenes)} potential scenes. Combining into chunks (max_tokens: {max_tokens}).")
        return _combine_scenes_into_chunks(logger, scenes, max_tokens)
    else: # Fallback to token-based chunking
        logger.warning(f"Scene extraction resulted in {len(scenes)} scenes (threshold >= 3 not met). Attempting token chunking (max_tokens: {max_tokens}).")
        return _chunk_by_token_count(logger, script_text, max_tokens)


# --- Scene Extraction Logic ---
def _extract_scenes_by_pattern(logger: logging.Logger, script_text: str, identified_patterns: List[str]) -> List[str]:
    """
    Extracts scenes using identified patterns, forgiving patterns, or fallbacks.
    Includes detailed debugging logging. (V11 logic)
    """
    # --- DEBUG: Save the exact text being processed (Optional, uncomment if needed) ---
    # try:
    #     timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    #     debug_file_path = Path(f"./DEBUG_script_text_extract_{timestamp}.txt")
    #     debug_file_path.write_text(script_text, encoding='utf-8', errors='replace')
    #     logger.info(f"DEBUG: Saved full script_text ({len(script_text)} chars) for inspection to: {debug_file_path.resolve()}")
    # except Exception as e:
    #     logger.error(f"DEBUG: Failed to save script_text for inspection: {e}")
    # --- END DEBUG ---

    if not script_text or not script_text.strip():
        logger.error("_extract_scenes_by_pattern received empty script text.")
        return []

    heading_matches = [] # Store all found match objects: (match_object, pattern_source_info)

    # 1. Forgiving Patterns (Derived from common structures)
    forgiving_patterns = [
        r"^\s*(\d+[A-Z]?\.?\s*)?(INT|EXT|I/?E)[.\-\s]+.*$",
        r"^\s*\.(?![\.\s])[\w\s]+.*$",
        r"^\s*\d+[A-Z]?\.?\s+(?:(?:INT|EXT|FADE|CUT|MONTAGE)\b|[^a-z\n]{5,}.*)$",
        # Add TITLE SEQUENCE check based on LLM patterns
        r"^\s*(\d+\s*)?TITLE SEQUENCE\s*:?.*$" if isinstance(identified_patterns, list) and any("TITLE SEQUENCE" in p for p in identified_patterns if isinstance(p, str)) else None
    ]
    forgiving_patterns = [p for p in forgiving_patterns if p is not None]
    logger.info(f"Attempting extraction with derived forgiving patterns: {forgiving_patterns}")
    forgiving_matches = _find_matches_with_patterns(logger, script_text, forgiving_patterns, "forgiving")
    heading_matches.extend(forgiving_matches)
    logger.info(f"Forgiving patterns phase found a total of {len(forgiving_matches)} matches.")

    # Log if only one match found (V11 Debugging)
    if len(forgiving_matches) == 1:
        match_obj, pattern_info = forgiving_matches[0]
        start_pos = match_obj.start()
        logger.warning(f"!!! Only ONE match found by forgiving patterns !!!")
        logger.warning(f"  Match Details: Pos={start_pos}, Src='{pattern_info}', Text='{match_obj.group(0).strip()}'")
        try:
            lines_in_script = script_text.splitlines()
            line_index = script_text[:start_pos].count('\n')
            context_start = max(0, line_index - 3)
            context_end = min(len(lines_in_script), line_index + 4)
            logger.warning(f"  Context around match (lines ~{context_start} to {context_end}):")
            for i in range(context_start, context_end):
                prefix = ">> " if i == line_index else "   "
                logger.warning(f"    {prefix}Line {i}: {repr(lines_in_script[i])}")
        except Exception as ctx_e:
            logger.error(f"  Error getting context around single match: {ctx_e}")
    elif len(forgiving_matches) > 1:
        logger.debug(f"First few matches text (Forgiving): {[m[0].group(0).strip()[:100] for m in forgiving_matches[:5]]}")

    # 2. LLM Patterns (If Forgiving failed and LLM provided patterns)
    if not heading_matches and isinstance(identified_patterns, list) and identified_patterns:
        logger.warning("Forgiving patterns found no matches. Trying direct LLM patterns.")
        llm_matches = _find_matches_with_patterns(logger, script_text, identified_patterns, "llm_direct")
        heading_matches.extend(llm_matches)
        logger.info(f"LLM patterns phase found a total of {len(llm_matches)} matches.")
        if llm_matches:
            logger.debug(f"First few matches text (LLM): {[m[0].group(0).strip()[:100] for m in llm_matches[:10]]}")

    # 3. Original Fallback Patterns (If both failed)
    if not heading_matches:
        logger.warning("LLM/Forgiving patterns found no matches. Falling back to original default patterns.")
        original_default_patterns = _get_default_scene_patterns(logger)
        fallback_matches = _find_matches_with_patterns(logger, script_text, original_default_patterns, "fallback_original")
        heading_matches.extend(fallback_matches)
        logger.info(f"Original fallback patterns phase found a total of {len(fallback_matches)} matches.")
        if fallback_matches:
            logger.debug(f"First few matches text (Fallback): {[m[0].group(0).strip()[:100] for m in fallback_matches[:10]]}")

    # --- Process combined matches ---
    if not heading_matches:
        logger.error("FATAL: No scene heading matches found using LLM, forgiving, or fallback patterns.")
        return []

    # Sort all found matches by start position
    heading_matches.sort(key=lambda x: x[0].start())
    logger.debug(f"Total sorted matches from all pattern sets: {len(heading_matches)}")
    if logger.level == logging.DEBUG: # Only log this large output if verbose
         logger.debug("--- All Sorted Matches Found ---")
         for idx, (match_obj, pattern_info) in enumerate(heading_matches):
             logger.debug(f"  {idx+1:03d}: Pos={match_obj.start():<6} Src='{pattern_info}' Text='{match_obj.group(0).strip()[:120]}'")
         logger.debug("--- End All Sorted Matches ---")

    # Define scenes based on sorted headings
    scene_spans = []
    last_end_pos = -1
    processed_starts = set()

    for j in range(len(heading_matches)):
        match_obj, pattern_info = heading_matches[j]
        start_pos = match_obj.start()

        if start_pos in processed_starts:
            logger.debug(f"Skipping match at {start_pos} - already processed starting position (Pattern: {pattern_info}).")
            continue
        if start_pos < last_end_pos:
            logger.debug(f"Skipping overlapping match '{match_obj.group(0).strip()[:50]}' at {start_pos} (inside previous scene ending at {last_end_pos}) (Pattern: {pattern_info}).")
            continue

        next_start_pos = len(script_text)
        for k in range(j + 1, len(heading_matches)):
            next_match_obj, _ = heading_matches[k]
            potential_next_start = next_match_obj.start()
            if potential_next_start > start_pos:
                next_start_pos = potential_next_start
                break

        end_pos = next_start_pos

        if end_pos <= start_pos:
            logger.warning(f"Invalid span detected: start={start_pos}, end={end_pos}. Skipping match '{match_obj.group(0).strip()[:50]}'.")
            continue

        scene_spans.append((start_pos, end_pos))
        processed_starts.add(start_pos)
        last_end_pos = end_pos

    logger.debug(f"Calculated {len(scene_spans)} scene spans before filtering:")
    if scene_spans and logger.level == logging.DEBUG:
        for s_idx, (start, end) in enumerate(scene_spans[:10]):
            logger.debug(f"  Span {s_idx+1}: ({start}, {end}) Length={end-start}")

    # Extract text for unique spans and apply basic filter
    final_scenes = []
    seen_spans = set()
    for start, end in scene_spans:
        span_tuple = (start, end)
        if span_tuple in seen_spans: continue

        try:
            scene_text = script_text[start:end].strip()
            word_count = len(scene_text.split())
            if scene_text and word_count > 3: # Minimum length filter
                final_scenes.append(scene_text)
                seen_spans.add(span_tuple)
            else:
                logger.debug(f"Filtering out scene from span ({start}, {end}) due to low word count ({word_count} <= 3) or empty text. Preview: '{scene_text[:50]}...'")
        except IndexError:
            logger.error(f"IndexError extracting scene text for span ({start}, {end}). Text length: {len(script_text)}.")
        except Exception as ext_e:
            logger.error(f"Error extracting scene text for span ({start}, {end}): {ext_e}")

    if not final_scenes and heading_matches:
        logger.warning("Scene heading matches were found, but no valid scenes extracted after filtering.")
    elif final_scenes:
        logger.info(f"Extracted {len(final_scenes)} unique scenes after filtering.")

    return final_scenes


# --- Helper: Find Matches with Patterns ---
def _find_matches_with_patterns(logger: logging.Logger, text: str, patterns: List[str], pattern_source: str) -> List[Tuple[re.Match, str]]:
    """Helper to find all regex matches for a list of patterns."""
    matches_found = []
    if not text: return matches_found

    for i, pattern_str in enumerate(patterns):
        if not isinstance(pattern_str, str) or not pattern_str.strip():
            logger.warning(f"Skipping empty or invalid pattern string at index {i} from source '{pattern_source}'.")
            continue
        try:
            # Use MULTILINE and IGNORECASE for heading patterns
            flags = re.MULTILINE | re.IGNORECASE
            logger.debug(f"Compiling {pattern_source} pattern {i+1}: r'{pattern_str}' with flags {flags}")
            heading_pattern = re.compile(pattern_str, flags)

            pattern_matches = list(heading_pattern.finditer(text))
            logger.debug(f"{pattern_source.capitalize()} pattern {i+1} finditer found {len(pattern_matches)} matches.")
            if pattern_matches and logger.level == logging.DEBUG:
                logger.debug(f"  First few matches text for {pattern_source} pattern {i+1}: {[m.group(0).strip()[:100] for m in pattern_matches[:5]]}")

            for match in pattern_matches:
                matches_found.append((match, f"{pattern_source}_{i+1}"))

        except re.error as e:
            logger.error(f"Invalid regex pattern ({pattern_source.capitalize()} Index {i}): '{pattern_str}'. Error: {e}")
            continue
        except Exception as e:
            logger.error(f"Error processing {pattern_source} pattern {i+1}: {e}", exc_info=True)
            continue
    return matches_found


# --- Helper: Get Default Patterns ---
def _get_default_scene_patterns(logger: logging.Logger) -> List[str]:
    """Returns the original hardcoded default regex patterns."""
    logger.debug("Using hardcoded default scene heading patterns.")
    return [
        r"^\s*(?:\.(?![\.\s])[\w\s]+|(?:INT|EXT|I\.?/E\.?|E\.?/I\.?)[ \t]).*$", # .FOUNTAIN or INT./EXT. start
        r"^\s*(?:SCENE\s+\d+\s*[:.]\s*)?(?:INT\.|EXT\.|I/E|E/I)[.\s\-].*$", # Optional SCENE X:, then INT./EXT.
        r"^\s*#+\s*(?:INT\.|EXT\.).*$" # Markdown style headings with INT./EXT.
    ]


# --- Combine Scenes into Chunks ---
def _combine_scenes_into_chunks(logger: logging.Logger, scenes: List[str], max_tokens: int) -> List[str]:
    """Combines extracted scenes into chunks respecting max_tokens."""
    if not scenes: return []
    try:
        enc = tiktoken.get_encoding("cl100k_base")
    except Exception:
        enc = tiktoken.get_encoding("gpt2")
        logger.warning("Using gpt2 tokenizer as cl100k_base not found.")

    chunks, current_chunk, current_tokens = [], "", 0
    for i, scene in enumerate(scenes):
        if not isinstance(scene, str):
            logger.warning(f"Skipping non-string scene item at index {i}: {type(scene)}")
            continue

        try:
            scene_tokens = len(enc.encode(scene))
        except Exception as enc_e:
            logger.warning(f"Tiktoken encode error scene {i+1}, estimating: {enc_e}")
            scene_tokens = len(scene) // 4 # Simple estimation fallback

        if scene_tokens == 0 and not scene.strip(): continue # Skip empty scenes

        if scene_tokens > max_tokens:
            logger.warning(f"Scene {i+1} ({scene_tokens} tokens) > max_tokens ({max_tokens}). Splitting scene using token chunker.")
            # If there's a current chunk being built, add it first
            if current_chunk:
                chunks.append(current_chunk)
                current_chunk, current_tokens = "", 0
            # Split the large scene and add its parts directly to the main chunks list
            split_scene_chunks = _chunk_by_token_count(logger, scene, max_tokens)
            chunks.extend(split_scene_chunks)
            logger.debug(f" > Scene {i+1} was split into {len(split_scene_chunks)} sub-chunks.")
            continue # Move to the next scene

        # Check if the current scene can be added to the current chunk
        separator_tokens = len(enc.encode("\n\n")) if current_chunk else 0
        if current_tokens + separator_tokens + scene_tokens <= max_tokens:
            current_chunk += ("\n\n" if current_chunk else "") + scene
            current_tokens += separator_tokens + scene_tokens
        else:
            # Finalize the previous chunk and start a new one with the current scene
            if current_chunk:
                chunks.append(current_chunk)
            current_chunk = scene
            current_tokens = scene_tokens

    # Add the last remaining chunk
    if current_chunk:
        chunks.append(current_chunk)

    logger.info(f"Combined {len(scenes)} valid scenes into {len(chunks)} chunks.")
    return chunks


# --- Token-based Chunking (Fallback) ---
def _chunk_by_token_count(logger: logging.Logger, text: str, max_tokens: int = 2000) -> List[str]:
    """Splits text into chunks based purely on token count."""
    if not text or not text.strip(): return []
    try:
        enc = tiktoken.get_encoding("cl100k_base")
    except Exception:
        enc = tiktoken.get_encoding("gpt2")
        logger.warning("Using gpt2 tokenizer as cl100k_base not found.")

    try:
        tokens = enc.encode(text)
    except Exception as e:
        logger.error(f"Failed to encode text for token chunking: {e}. Returning single chunk.")
        return [text]

    total_tokens = len(tokens)
    if total_tokens == 0: return []

    chunks, start_idx = [], 0
    logger.debug(f"Starting token chunking. Total tokens: {total_tokens}, Max per chunk: {max_tokens}")

    while start_idx < total_tokens:
        end_idx = min(start_idx + max_tokens, total_tokens)

        # Try to find a better break point (e.g., double newline) near the end
        if end_idx < total_tokens: # Only adjust if not the very last chunk
            # Look back a bit from the proposed end index
            search_start = max(start_idx, end_idx - 200) # Search window: last 200 tokens or from start_idx
            try:
                window_tokens = tokens[search_start:end_idx]
                window_text = enc.decode(window_tokens)

                # Find the last double newline or single newline in the window
                best_break_in_window = -1
                break_chars = ['\n\n', '\n'] # Prioritize double newline
                for bc in break_chars:
                    found_pos = window_text.rfind(bc)
                    if found_pos != -1:
                        best_break_in_window = found_pos + len(bc) # Position *after* the break
                        break # Found the best possible break

                if best_break_in_window != -1:
                    # Calculate the token position corresponding to this text break
                    prefix_tokens = enc.encode(window_text[:best_break_in_window])
                    potential_end_idx = search_start + len(prefix_tokens)

                    # Use this break only if it's valid and moves the index back
                    if potential_end_idx > start_idx and potential_end_idx < end_idx:
                        logger.debug(f"Adjusting token chunk end from {end_idx} to {potential_end_idx} based on newline break.")
                        end_idx = potential_end_idx
                    elif potential_end_idx == end_idx:
                         logger.debug("Newline break found, but it's at the original end_idx.")
                    else:
                         logger.debug(f"Potential break point at {potential_end_idx} invalid or didn't move index. Using original {end_idx}.")

            except Exception as decode_e:
                logger.warning(f"Error decoding token window for break adjustment: {decode_e}. Using original end_idx {end_idx}.")

        # Extract and decode the chunk
        chunk_tokens = tokens[start_idx:end_idx]
        try:
            chunk_str = enc.decode(chunk_tokens).strip()
            if chunk_str: # Ensure the decoded chunk is not empty
                chunks.append(chunk_str)
            else:
                 logger.debug(f"Decoded token chunk [{start_idx}:{end_idx}] resulted in empty string. Skipping.")
        except Exception as e:
            logger.error(f"Failed to decode token chunk [{start_idx}:{end_idx}]: {e}")

        # Move to the next chunk start
        start_idx = end_idx

    logger.info(f"Token-chunked text ({total_tokens} tokens) into {len(chunks)} chunks.")
    return chunks

# --- END OF FILE chunker.py ---