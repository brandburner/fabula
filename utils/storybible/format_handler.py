#!/usr/bin/env python3
"""
Screenplay Format Handler Module (Improved Detection)

Provides functions to detect screenplay format in text and apply
specific cleanup rules to normalize formatting, suitable for
various input sources (TXT, MD, Fountain, processed PDF). Includes
improved detection for numbered scene headings and CONT'D cues.
"""

import re
import logging
from collections import Counter
from typing import Optional, Tuple # Added for type hinting clarity

# format_handler.py

def detect_screenplay_format(text: str, logger: Optional[logging.Logger] = None) -> Tuple[bool, int, dict]:
    """
    Analyzes text to determine if it appears to be in screenplay format.
    (Improved version handling numbered scenes and CONT'D)

    Args:
        text (str): The text content to analyze (should be pre-cleaned of headers/footers).
        logger (logging.Logger, optional): Logger instance.

    Returns:
        tuple: (is_screenplay, confidence, format_details)
               Returns None if input text is effectively empty. <--- Potential Problem Area
    """
    logger = logger or logging.getLogger('StoryBibleGen') # Use consistent name
    confidence = 0
    format_details = {
        'scene_headings': 0,
        'character_cues': 0,
        'parentheticals': 0,
        'transitions': 0,
        'lines_analyzed': 0
    }

    if not text or not text.strip():
        logger.warning("detect_screenplay_format called with empty or whitespace-only text.")
        # --- THIS IS THE LIKELY CULPRIT ---
        # Previously it returned False, 0, format_details.
        # If it was changed to return None, that would cause the unpack error.
        # Let's ensure it returns the tuple structure even for empty input.
        return False, 0, format_details # Ensure tuple return

    # Defensive check: Ensure text is string after potential cleaning steps
    if not isinstance(text, str):
         logger.error(f"detect_screenplay_format received non-string input type: {type(text)}")
         # Handle this case gracefully, return default tuple
         return False, 0, format_details

    # Proceed with analysis assuming text is a valid string
    lines = text.splitlines()
    valid_lines = [line for line in lines if line.strip()] # Analyze non-blank lines
    format_details['lines_analyzed'] = len(valid_lines)

    if format_details['lines_analyzed'] == 0:
        # This handles cases where the text had lines but they were all blank after stripping
        logger.warning("detect_screenplay_format: No valid (non-blank) lines found after stripping.")
        return False, 0, format_details # Ensure tuple return

    # --- Regex Patterns (Improved) ---
    # Scene Headings: INT./EXT. or .FOUNTAIN_HEADING or NUMBERED HEADING at start of line
    scene_heading_pattern = r'^(?:\s*\d+\.?\s+.*|\s*\.(?![\.\s])[\w\s]+|\s*(?:INT|EXT|I/?E|E/?I)[\.\s]).*$'
    # Character Cues: ALL CAPS (min 2 chars), allows any (...) content after, start of line
    # Increased min length slightly to avoid matching short acronyms potentially
    character_pattern = r'^\s*([A-Z][A-Z0-9\s\.\-\']{2,})(?:\s*\(.*\))?\s*$' # Min 3 total chars for cue name
    # Parentheticals: Text within parentheses on its own line(s)
    parenthetical_pattern = r'^\s*\(.+\)\s*$'
    # Transitions: Common transitions ending in TO: or FADE IN/OUT:, optional * before end
    transition_pattern = r'^\s*(?:FADE\s+(?:IN|OUT)|(?:CUT|DISSOLVE|WIPE|MATCH|SMASH\s+CUT)\s+TO):\s*\*?\s*$'

    # --- Analyze Lines ---
    potential_char_cues = []
    for line in valid_lines:
        # Check Scene Heading
        if re.match(scene_heading_pattern, line, re.IGNORECASE):
            format_details['scene_headings'] += 1
            continue # A line is unlikely to be both heading and cue

        # Check Character Cue - capture the name part for potential filtering
        char_match = re.match(character_pattern, line)
        if char_match:
            # Filter common ALL CAPS lines that aren't cues
            cue_text = char_match.group(1).strip() # Get only the name part
            # Added more common ALL CAPS non-cues often found in headers/notes
            common_non_cues = {
                'CONT\'D', 'MORE', 'CONTINUED', 'OS', 'VO', 'O.S.', 'V.O.',
                'INT', 'EXT', 'SCENE', 'SHOT', 'MONTAGE', 'BEGIN', 'END',
                'NOTE', 'REVISED', 'FINAL', 'DRAFT'
            }
            if cue_text not in common_non_cues and not cue_text.isdigit() and len(cue_text) > 1: # Ensure not just numbers
                 format_details['character_cues'] += 1
                 potential_char_cues.append(cue_text)
            continue

        # Check Parenthetical
        if re.match(parenthetical_pattern, line):
            format_details['parentheticals'] += 1
            continue

        # Check Transition
        if re.match(transition_pattern, line, re.IGNORECASE):
            format_details['transitions'] += 1

    # --- Calculate Confidence (Using Densities) ---
    total_lines = format_details['lines_analyzed'] # Already checked > 0

    # Scene Headings: Max 35 points
    sh_density = format_details['scene_headings'] / total_lines
    confidence += min(35, int(sh_density * 100 * 15)) # Weight scene headings highly

    # Character Cues: Max 40 points
    cc_density = format_details['character_cues'] / total_lines
    confidence += min(40, int(cc_density * 100 * 7)) # Weight cues highly

    # Parentheticals: Max 15 points
    p_density = format_details['parentheticals'] / total_lines
    confidence += min(15, int(p_density * 100 * 3))

    # Transitions: Max 10 points
    t_density = format_details['transitions'] / total_lines
    confidence += min(10, int(t_density * 100 * 2))

    confidence = min(100, max(0, confidence)) # Ensure confidence is between 0 and 100
    threshold = 40 # Adjust threshold if needed based on testing
    is_screenplay = confidence >= threshold

    logger.info(f"Screenplay format detection: Likely={is_screenplay} (Confidence: {confidence}%, Threshold: {threshold}%)")
    logger.debug(f"Format details: {format_details}")

    return is_screenplay, confidence, format_details # Always return the tuple



def cleanup_screenplay_text(text: str, logger: Optional[logging.Logger] = None) -> str:
    """
    Detects format and cleans up text, applying screenplay-specific rules if detected.
    Includes pre-cleaning of artifacts like backticks and potential headers/footers.

    Args:
        text (str): The raw text content to clean.
        logger (logging.Logger, optional): Logger instance.

    Returns:
        str: The cleaned text.
    """
    logger = logger or logging.getLogger('StoryBibleGen')

    if not text or not text.strip():
        logger.warning("cleanup_screenplay_text called with empty text.")
        return ""

    # --- Step 1: Initial Universal Cleanup ---
    logger.debug("Applying initial universal cleanup (newlines, basic whitespace)...")
    # Normalize line endings first
    text = text.replace('\r\n', '\n').replace('\r', '\n')
    # Remove leading/trailing whitespace from the whole text *early*
    text = text.strip()
    # Replace non-breaking spaces with regular spaces (important for regex)
    text = text.replace('\u00A0', ' ')


    # --- Step 1.5: AGGRESSIVE ARTIFACT REMOVAL ---
    logger.debug("Applying aggressive artifact removal (backticks, etc.)...")
    lines = text.splitlines()
    cleaned_lines_stage1 = []
    # Regex to find lines that *might* be screenplay elements enclosed in backticks or similar junk
    # Looks for potential scene numbers/headings/transitions/cues possibly surrounded by junk
    junk_line_pattern = re.compile(r"^\s*[`'\"‘’“”]?\s*(\d+\.?\s+|INT\.|EXT\.|[A-Z\s]{2,}|CUT TO:|FADE|SCENE|\.\w+).*[`'\"‘’“”]?\s*$", re.IGNORECASE)
    leading_trailing_junk_pattern = re.compile(r"^\s*[`'\"‘’“”]+|[`'\"‘’“”]+\s*$") # Junk at very start/end

    for line in lines:
        stripped_line = line.strip()
        # Remove lines that are *only* backticks or quotes
        if re.fullmatch(r"[`'\"‘’“”]+", stripped_line):
             logger.debug(f"Removing artifact line (only quotes/backticks): '{line}'")
             continue

        # If line looks like a screenplay line possibly wrapped in junk, clean it
        # if junk_line_pattern.match(stripped_line): # This might be too broad
        # Try removing leading/trailing junk from *all* lines more simply
        cleaned_line = leading_trailing_junk_pattern.sub('', stripped_line)

        if line.strip() != cleaned_line and cleaned_line: # Log if cleaning happened and result isn't empty
             logger.debug(f"Cleaned potential artifact wrapping: '{line.strip()}' -> '{cleaned_line}'")
             cleaned_lines_stage1.append(cleaned_line) # Use the cleaned version
        elif line.strip() != cleaned_line and not cleaned_line: # Log if cleaning resulted in empty line
             logger.debug(f"Removing artifact line (became empty after cleaning): '{line.strip()}'")
             continue
        else:
             cleaned_lines_stage1.append(line) # Keep original if no junk found/removed

    text = "\n".join(cleaned_lines_stage1)
    # Remove trailing whitespace potentially reintroduced or left by splitlines
    lines = text.splitlines()
    lines = [line.rstrip() for line in lines]
    text = "\n".join(lines)
    # --- END AGGRESSIVE ARTIFACT REMOVAL ---


    # --- Step 2: Remove Potential Headers/Footers (Pre-detection) ---
    # (Keep the existing header/footer removal logic, apply it to the now cleaner text)
    logger.debug("Attempting pre-detection header/footer removal...")
    lines = text.split('\n') # Use already cleaned lines
    original_line_count_for_artifact_check = len(lines)
    cleaned_lines_for_detection = lines[:] # Create a copy

    # (The rest of the header/footer logic remains the same as before)
    # ... (heuristic check, Counter, artifact filtering, etc.) ...
    if original_line_count_for_artifact_check > 30:
        line_counts = Counter(line.strip() for line in lines if line.strip())
        num_valid_lines = sum(line_counts.values())
        artifacts = {
            line for line, count in line_counts.items()
            if (count > 4 or (num_valid_lines > 0 and count / num_valid_lines > 0.05)) and len(line) < 70
        }
        potential_artifacts_to_remove = set()
        for art in artifacts:
            if re.fullmatch(r'\d+\.?', art): continue
            if re.fullmatch(r'\d{1,2}/\d{1,2}/\d{2,4}', art) or re.fullmatch(r'(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\w*\s+\d{1,2},?\s+\d{4}', art, re.IGNORECASE): continue
            common_headings = {"INT.", "EXT.", "CONT'D", "MORE", "CONTINUED", "FADE IN", "FADE OUT", "CUT TO", "OMITTED"}
            # Ensure we don't remove lines that look like actual scene headings found by LLM later
            # This is tricky - maybe header removal should happen *after* scene splitting?
            # For now, keep the check against common uppercase items
            if art.upper() in common_headings or any(head in art.upper() for head in common_headings if len(head)>3):
                 continue
            potential_artifacts_to_remove.add(art)

        if potential_artifacts_to_remove:
            logger.info(f"Identified {len(potential_artifacts_to_remove)} potential header/footer lines to remove pre-detection: {potential_artifacts_to_remove}")
            cleaned_lines_for_detection = [line for line in lines if line.strip() not in potential_artifacts_to_remove]
            logger.info(f"Removed {original_line_count_for_artifact_check - len(cleaned_lines_for_detection)} potential header/footer lines before detection.")
        else:
            logger.info("No obvious repeated header/footer artifacts found for pre-removal.")
    else:
        logger.info("Skipping pre-detection header/footer removal (document too short).")

    # Re-join text for detection
    text_for_detection = "\n".join(cleaned_lines_for_detection)

    # --- Step 3: Detect Format ---
    logger.info("Detecting format on pre-cleaned text...")
    is_screenplay, confidence, _ = detect_screenplay_format(text_for_detection, logger)

    # --- Step 4: Apply Final Cleanup ---
    current_text = text_for_detection # Use the text after artifact/header removal

    if is_screenplay:
        logger.info(f"Applying screenplay-specific formatting (Confidence: {confidence}%)")
        # (Keep the existing spacing logic for scene headings, cues, transitions)
        # ... (Rule 1 & 2 Combined: Ensure blank line before major elements) ...
        heading_transition_pattern = r'^(?:\s*\d+\.?\s+.*|\s*\.(?![\.\s])[\w\s]+|\s*(?:INT|EXT|I/?E|E/?I)[\.\s].*|\s*(?:FADE\s+(?:IN|OUT)|(?:CUT|DISSOLVE|WIPE|MATCH|SMASH\s+CUT)\s+TO):\s*\*?\s*)$'
        char_cue_pattern = r'^\s*([A-Z][A-Z0-9\s\.\-\']{1,})(?:\s*\(.*\))?\s*$'
        lines = current_text.split('\n')
        formatted_lines = []
        for i, line in enumerate(lines):
            is_major_element = False
            if re.match(heading_transition_pattern, line, re.IGNORECASE):
                is_major_element = True
            else:
                char_match = re.match(char_cue_pattern, line)
                if char_match:
                     cue_text = char_match.group(1).strip()
                     common_non_cues = {'CONT\'D', 'MORE', 'CONTINUED', 'OS', 'VO'}
                     if cue_text not in common_non_cues and len(cue_text) > 1:
                           is_major_element = True
            if is_major_element and i > 0:
                prev_line_stripped = lines[i-1].strip()
                if prev_line_stripped != "":
                    prev_is_major = bool(re.match(heading_transition_pattern, lines[i-1], re.IGNORECASE))
                    if not prev_is_major:
                         prev_char_match = re.match(char_cue_pattern, lines[i-1])
                         if prev_char_match:
                              prev_cue_text = prev_char_match.group(1).strip()
                              if prev_cue_text not in common_non_cues and len(prev_cue_text) > 1:
                                    prev_is_major = True
                    if not prev_is_major:
                         formatted_lines.append("")
            formatted_lines.append(line)
        current_text = "\n".join(formatted_lines)
        # Final normalization of blank lines (max 2)
        current_text = re.sub(r'\n{3,}', '\n\n', current_text)
    else:
        logger.info("Applying only minimal cleanup (text not detected as screenplay).")
        current_text = re.sub(r'\n{3,}', '\n\n', current_text)

    logger.info(f"Format handling complete. Final text length: {len(current_text.strip())} chars.")
    return current_text.strip() # Return final stripped text

def cleanup_screenplay_text(text: str, logger: Optional[logging.Logger] = None) -> str:
    """
    Detects format and cleans up text, applying screenplay-specific rules if detected.
    Includes pre-cleaning of artifacts.

    Args:
        text (str): The raw text content to clean.
        logger (logging.Logger, optional): Logger instance.

    Returns:
        str: The cleaned text.
    """
    logger = logger or logging.getLogger('StoryBibleGen')

    if not text or not text.strip():
        logger.warning("cleanup_screenplay_text called with empty text.")
        return ""

    # --- Step 1: Minimal Universal Cleanup ---
    logger.debug("Applying minimal universal cleanup...")
    text = text.replace('\r\n', '\n').replace('\r', '\n')
    lines = text.splitlines()
    # Remove trailing whitespace first
    lines = [line.rstrip() for line in lines]
    text = "\n".join(lines)
    # Remove leading/trailing whitespace from the whole text
    text = text.strip()

    # --- Step 2: Remove Potential Headers/Footers (Pre-detection) ---
    logger.debug("Attempting pre-detection artifact removal...")
    lines = text.split('\n') # Use already cleaned lines
    original_line_count_for_artifact_check = len(lines)
    cleaned_lines_for_detection = lines[:] # Create a copy

    if original_line_count_for_artifact_check > 30: # Only apply if reasonably long
        # Use Counter on stripped, non-empty lines
        line_counts = Counter(line.strip() for line in lines if line.strip())
        num_valid_lines = sum(line_counts.values())

        # Heuristic: repeated > 4 times OR > 5% of valid lines, AND shorter than 70 chars
        artifacts = {
            line for line, count in line_counts.items()
            if (count > 4 or (num_valid_lines > 0 and count / num_valid_lines > 0.05)) and len(line) < 70
        }

        # Refine artifacts: remove page numbers, common date formats, common script notations
        potential_artifacts_to_remove = set()
        for art in artifacts:
            # Skip pure numbers or numbers with trailing dot (likely page numbers)
            if re.fullmatch(r'\d+\.?', art):
                continue
            # Skip common date formats like M/D/YY or Month D, YYYY
            if re.fullmatch(r'\d{1,2}/\d{1,2}/\d{2,4}', art) or re.fullmatch(r'(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\w*\s+\d{1,2},?\s+\d{4}', art, re.IGNORECASE):
                continue
            # Skip common ALL CAPS script elements that might get repeated
            common_headings = {"INT.", "EXT.", "CONT'D", "MORE", "CONTINUED", "FADE IN", "FADE OUT", "CUT TO", "OMITTED"}
            if art.upper() in common_headings or any(head in art.upper() for head in common_headings if len(head)>3): # Check substrings for longer ones
                 continue
            # If it passes filters, consider it an artifact
            potential_artifacts_to_remove.add(art)


        if potential_artifacts_to_remove:
            logger.info(f"Identified {len(potential_artifacts_to_remove)} potential header/footer lines to remove pre-detection: {potential_artifacts_to_remove}")
            cleaned_lines_for_detection = [line for line in lines if line.strip() not in potential_artifacts_to_remove]
            logger.info(f"Removed {original_line_count_for_artifact_check - len(cleaned_lines_for_detection)} artifact lines before detection.")
        else:
            logger.info("No obvious repeated header/footer artifacts found for pre-removal.")
    else:
        logger.info("Skipping pre-detection artifact removal (document too short).")

    # Re-join text for detection
    text_for_detection = "\n".join(cleaned_lines_for_detection)

    # --- Step 3: Detect Format ---
    logger.info("Detecting format on pre-cleaned text...")
    is_screenplay, confidence, _ = detect_screenplay_format(text_for_detection, logger)

    # --- Step 4: Apply Final Cleanup (using original lines potentially, or cleaned?) ---
    # Let's apply final cleanup to the artifact-removed version for consistency
    current_text = text_for_detection

    if is_screenplay:
        logger.info(f"Applying screenplay-specific formatting (Confidence: {confidence}%)")

        # Rule 1 & 2 Combined: Ensure Scene Headings, Transitions, Character Cues have blank line before
        # Use the improved patterns from detection
        heading_transition_pattern = r'^(?:\s*\d+\.?\s+.*|\s*\.(?![\.\s])[\w\s]+|\s*(?:INT|EXT|I/?E|E/?I)[\.\s].*|\s*(?:FADE\s+(?:IN|OUT)|(?:CUT|DISSOLVE|WIPE|MATCH|SMASH\s+CUT)\s+TO):\s*\*?\s*)$'
        # Use the more specific char cue pattern here to avoid over-spacing action lines
        char_cue_pattern = r'^\s*([A-Z][A-Z0-9\s\.\-\']{1,})(?:\s*\(.*\))?\s*$'

        lines = current_text.split('\n')
        formatted_lines = []
        for i, line in enumerate(lines):
            # Check if current line matches any major element type
            is_major_element = False
            if re.match(heading_transition_pattern, line, re.IGNORECASE):
                is_major_element = True
            else:
                char_match = re.match(char_cue_pattern, line)
                if char_match:
                     cue_text = char_match.group(1).strip()
                     common_non_cues = {'CONT\'D', 'MORE', 'CONTINUED', 'OS', 'VO'}
                     if cue_text not in common_non_cues and len(cue_text) > 1:
                           is_major_element = True

            # If it's a major element, ensure previous line was blank (unless it's the first line)
            if is_major_element and i > 0:
                prev_line_stripped = lines[i-1].strip()
                if prev_line_stripped != "":
                    # Check if previous line was *also* a major element (already handled)
                    prev_is_major = bool(re.match(heading_transition_pattern, lines[i-1], re.IGNORECASE))
                    if not prev_is_major:
                         prev_char_match = re.match(char_cue_pattern, lines[i-1])
                         if prev_char_match:
                              prev_cue_text = prev_char_match.group(1).strip()
                              if prev_cue_text not in common_non_cues and len(prev_cue_text) > 1:
                                    prev_is_major = True
                    # Only add blank line if previous wasn't also a major element
                    if not prev_is_major:
                         formatted_lines.append("")

            formatted_lines.append(line) # Add the current line regardless

        current_text = "\n".join(formatted_lines)

        # Final normalization of blank lines (max 2)
        current_text = re.sub(r'\n{3,}', '\n\n', current_text)

    else:
        logger.info("Applying only minimal cleanup (text not detected as screenplay).")
        # Ensure max 2 blank lines even for non-screenplays after artifact removal etc.
        current_text = re.sub(r'\n{3,}', '\n\n', current_text)

    logger.info(f"Format handling complete. Final text length: {len(current_text.strip())} chars.")
    return current_text.strip() # Return final stripped text

# --- Optional: Add a main block for testing ---
if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO, format='%(levelname)s:%(name)s:%(message)s')
    test_logger = logging.getLogger('FormatHandler_Test')

    # --- Test Cases ---
    test_snl_extract = """
2nd Blue Rev. (5/3/24) 123.

1 EXECUTIVE OFFICE - ROCKEFELLER CENTER 1

Some action text.

LORNE (CONT’D)
Dialogue here.

NBC PAGE
More dialogue.

    (beat)
I like it.

3 30 ROCK LOBBY 3
More action.

CUT TO: *

123.
    """

    test_normal_text = """
This is a normal paragraph. It includes words like MORE.

It has multiple lines and some whitespace.

# A Heading

* An item
* Another item

Maybe an ALL CAPS word like IMPORTANT.

Version 1.0 (1/1/2024)
Version 1.0 (1/1/2024)
Version 1.0 (1/1/2024)

    """

    # Test SNL Extract
    test_logger.info("--- Testing SNL-like Text ---")
    # is_sp, conf, dets = detect_screenplay_format(test_snl_extract, test_logger) # Test detection directly if needed
    cleaned_sp = cleanup_screenplay_text(test_snl_extract, test_logger) # Test combined cleanup
    test_logger.info(f"Cleaned SNL Text:\n---\n{cleaned_sp}\n---")

    # Test Normal Text
    test_logger.info("--- Testing Normal Text ---")
    cleaned_norm = cleanup_screenplay_text(test_normal_text, test_logger)
    test_logger.info(f"Cleaned Normal Text:\n---\n{cleaned_norm}\n---")