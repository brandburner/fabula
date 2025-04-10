# --- START OF FILE input_processor.py ---

#!/usr/bin/env python3
"""
Input Processing Module for Story Bible Generator.
Handles loading script files (TXT, MD, Fountain, PDF) and initial cleanup.
"""

import logging
from pathlib import Path
from typing import Optional
import sys # Added for sys.exit

# Assuming pdf_processor and format_handler are in the same directory
try:
    from pdf_processor import convert_pdf_to_text, is_pymupdf4llm_available
except ImportError:
    # pdf_processor.py itself will print a warning if pymupdf4llm failed to import
    # We only define dummies if pdf_processor.py is fundamentally broken/missing
    print("ERROR: Failed to import 'pdf_processor.py'. Check if the file exists and has no syntax errors.") # Make this an error
    def convert_pdf_to_text(*args, **kwargs):
        raise ImportError("pdf_processor.py not found or is broken.")
    def is_pymupdf4llm_available():
        return False

try:
    from format_handler import cleanup_screenplay_text
except ImportError:
    print("ERROR: Failed to import 'format_handler.py'. Ensure it's in the same directory or Python path.")
    sys.exit(1)

def load_and_prepare_screenplay(file_path: str, logger: Optional[logging.Logger] = None) -> str:
    """
    Loads screenplay from various file types and applies initial format cleanup.

    Args:
        file_path (str): Path to the input screenplay file.
        logger (logging.Logger, optional): Logger instance. Defaults to default logger.

    Returns:
        str: The prepared screenplay text.

    Raises:
        FileNotFoundError: If the input file doesn't exist.
        ValueError: If the file is empty or unsupported type after reading.
        ImportError: If PDF processing is attempted but dependencies are missing (raised by convert_pdf_to_text).
        Exception: For other loading or processing errors.
    """
    local_logger = logger or logging.getLogger('StoryBibleGen')
    input_path = Path(file_path)

    local_logger.info(f"--- Loading and Preparing Input File: {input_path.name} ---")

    if not input_path.is_file():
        local_logger.error(f"Input file not found or is not a file: {input_path}")
        raise FileNotFoundError(f"Input file not found: {input_path}")

    raw_text = ""
    file_ext = input_path.suffix.lower()
    text_formats = ['.txt', '.md', '.fountain', '.text', '.screenplay']

    try:
        if file_ext == '.pdf':
            try:
                local_logger.info(f"Attempting PDF conversion for: {input_path.name}")
                # Pass the logger to the PDF converter
                raw_text = convert_pdf_to_text(input_path, logger=local_logger)
            except ImportError as pdf_err:
                 local_logger.error(f"PDF conversion failed: {pdf_err}")
                 # Re-raise with clearer guidance
                 raise ImportError(f"PDF processing needed but failed: {pdf_err}. Ensure PyMuPDF4LLM is installed and pdf_processor.py is correct.")
            except Exception as pdf_conv_err:
                 local_logger.error(f"Error during PDF conversion: {pdf_conv_err}", exc_info=True)
                 raise Exception(f"PDF conversion failed for {input_path.name}: {pdf_conv_err}")

        elif file_ext in text_formats or '.' not in input_path.name: # Handle extensionless files as text
            local_logger.info(f"Reading as text-based format: {input_path.name}")
            raw_text = input_path.read_text(encoding='utf-8', errors='replace')
        else:
            local_logger.warning(f"Unknown file extension '{file_ext}'. Attempting to read as text.")
            try:
                raw_text = input_path.read_text(encoding='utf-8', errors='replace')
            except Exception as read_err:
                local_logger.error(f"Failed to read file '{input_path.name}' as text: {read_err}")
                raise ValueError(f"Unsupported or unreadable file type: {file_ext}")

        if not raw_text or not raw_text.strip():
            raise ValueError(f"Input file '{input_path.name}' is empty or contains only whitespace after loading.")

        local_logger.info(f"Successfully loaded raw text ({len(raw_text)} chars) from {input_path.name}")

    except (FileNotFoundError, ValueError, ImportError):
        raise # Re-raise specific errors
    except Exception as load_err:
        local_logger.error(f"Failed load/process '{input_path.name}': {load_err}", exc_info=True)
        raise Exception(f"Error loading file {input_path.name}: {load_err}")

    local_logger.info("Applying format handling (detection and cleanup)...")
    try:
        # Pass the logger to the format handler
        prepared_text = cleanup_screenplay_text(raw_text, logger=local_logger)
        if not prepared_text or not prepared_text.strip():
            local_logger.warning(f"Cleanup resulted in empty text for '{input_path.name}'.")
            return "" # Return empty string, let caller handle
        return prepared_text
    except Exception as format_err:
        local_logger.error(f"Error during format detection or cleanup: {format_err}", exc_info=True)
        raise Exception(f"Failure in format handling stage: {format_err}")

# --- END OF FILE input_processor.py ---