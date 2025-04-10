#!/usr/usr/bin/env python3
"""
PDF Processing Module for Story Bible Generator

Handles the conversion of PDF files to text using PyMuPDF4LLM.
Includes V3 enhanced text cleaning focusing on aggressive backtick removal
and ensuring clean line structures before further markdown stripping.
"""

import re
import logging
from typing import Union, Optional
from pathlib import Path

# --- Dependencies ---
try:
    import pymupdf4llm
except ImportError:
    # This allows the module to be imported even if pymupdf4llm isn't installed,
    # but functions using it will fail later if called without it.
    pass

# --- Functions ---

def is_pymupdf4llm_available():
    """Checks if the PyMuPDF4LLM library is installed."""
    try:
        # Try importing again inside the function to be sure
        import pymupdf4llm
        return True
    except ImportError:
        return False

def convert_pdf_to_text(pdf_path: Union[str, Path], logger: Optional[logging.Logger] = None) -> str:
    """
    Converts a PDF file to reasonably clean plain text using PyMuPDF4LLM (V3 Cleaning).

    This process involves:
    1. Converting the PDF to Markdown using pymupdf4llm.
    2. Replacing backtick-space-backtick sequences (` ` `) with newlines
       to fix potential line concatenation issues.
    3. Aggressively removing ALL backtick characters (`) from the text, as they
       have been observed to interfere with subsequent regex matching.
    4. Splitting the text into lines, stripping leading/trailing whitespace
       from each, and discarding any resulting empty lines.
    5. Applying basic markdown artifact stripping (headers, bold, italic, links).
    6. Normalizing whitespace and newlines.

    Screenplay-specific formatting cleanup should still be handled by the
    format_handler module after this initial text extraction.

    Args:
        pdf_path (str or Path): Path to the PDF file.
        logger (logging.Logger, optional): Logger instance. Defaults to
            'StoryBibleGen' logger if None.

    Returns:
        str: Extracted and cleaned text content.

    Raises:
        ImportError: If PyMuPDF4LLM is not installed when called.
        FileNotFoundError: If the PDF file doesn't exist or is not a file.
        Exception: For other errors during conversion (e.g., issues within
                   PyMuPDF4LLM or file read errors).
    """
    # Use the provided logger or get the base logger for the application
    logger = logger or logging.getLogger('StoryBibleGen')
    pdf_path = Path(pdf_path) # Ensure pdf_path is a Path object

    # Check dependency when function is actually called
    if not is_pymupdf4llm_available():
        logger.error("PyMuPDF4LLM is not installed. Run 'pip install pymupdf4llm' to enable PDF support.")
        raise ImportError("PyMuPDF4LLM is required for PDF processing")

    # Import here, only after check confirms availability
    import pymupdf4llm

    # Verify the file exists *before* attempting to open it
    if not pdf_path.is_file():
        logger.error(f"PDF input file not found or is not a file: {pdf_path}")
        raise FileNotFoundError(f"PDF file not found: {pdf_path}")

    try:
        logger.info(f"Converting PDF to text using PyMuPDF4LLM: {pdf_path}")

        # Get markdown text as the intermediate representation
        md_text = pymupdf4llm.to_markdown(str(pdf_path))
        logger.info(f"Successfully extracted markdown from PDF ({len(md_text)} chars)")

        # --- V3 Cleaning: Focus on Backticks and Line Structure FIRST ---
        text = md_text

        # 1. Replace backtick-space-backtick with newline (Handles potential concatenation)
        # This pattern (` ` `) sometimes appears where line breaks should be.
        text = re.sub(r'`\s+`', '\n', text)
        logger.debug("Applied backtick-space-backtick newline replacement.")

        # 2. Aggressively remove ALL backticks ANYWHERE
        # Necessary step based on debugging feedback showing persistent backticks
        # interfering with start-of-line regex patterns (^).
        text = text.replace('`', '')
        logger.debug("Aggressively removed ALL backtick characters (`).")

        # 3. Split into lines and strip whitespace *after* backtick removal
        # This ensures lines are clean before further processing and removes empty lines.
        lines = text.splitlines()
        cleaned_lines = [line.strip() for line in lines if line.strip()] # List comprehension to strip and filter empty lines
        text = "\n".join(cleaned_lines)
        logger.debug("Split lines, stripped whitespace, removed empty lines.")

        # 4. Basic Markdown Cleaning (Apply AFTER structure/backtick fix)
        # This removes common markdown syntax while preserving the text content.

        # Remove headers (# markers) but keep the heading text
        text = re.sub(r'^#+\s+', '', text, flags=re.MULTILINE)

        # Remove bold and italic markers (*, **) - kept simple
        text = text.replace('**', '').replace('*', '')

        # Remove link formatting [text](url) -> text
        text = re.sub(r'\[([^\]]+)\]\([^)]+\)', r'\1', text)

        # Simplified table/rule removal from previous versions (can be added back if needed)
        # text = re.sub(r'\|', ' ', text) # Basic table pipe removal
        # text = re.sub(r'--+', '', text)
        # text = re.sub(r'^\s*[-*_]{3,}\s*$', '', text, flags=re.MULTILINE) # Remove HRs
        # text = re.sub(r'^```[a-zA-Z]*\n', '', text, flags=re.MULTILINE) # Remove code blocks
        # text = re.sub(r'^```\s*$', '', text, flags=re.MULTILINE)
        logger.debug("Applied basic markdown syntax removal (headers, bold/italic, links).")

        # 5. Normalize whitespace and newlines
        # Replace non-breaking spaces with regular spaces
        text = text.replace('\u00A0', ' ')

        # Consolidate sequences of spaces and tabs into a single space
        text = re.sub(r'[ \t]+', ' ', text)

        # Normalize excessive newlines (3 or more become 2)
        text = re.sub(r'\n{3,}', '\n\n', text)
        logger.debug("Applied whitespace and newline normalization.")

        final_text = text.strip() # Remove leading/trailing whitespace from the final result
        logger.info(f"Performed V3 cleaning on extracted text ({len(final_text)} chars)")
        return final_text

    # Specific exceptions first for better error reporting
    except FileNotFoundError: # Should have been caught above, but good practice
        logger.error(f"PDF file vanished during conversion process: {pdf_path}")
        raise # Re-raise the specific error
    except ImportError: # Should have been caught above
        logger.error("PyMuPDF4LLM import failed unexpectedly during conversion.")
        raise # Re-raise the specific error
    except Exception as e:
        # Catch any other exceptions during the PyMuPDF4LLM call or cleaning
        logger.error(f"Error converting PDF '{pdf_path}' to text: {e}", exc_info=True) # Log traceback
        # Raise a general exception indicating the failure point
        raise Exception(f"PDF conversion failed for {pdf_path.name}: {e}")

# --- Optional: Add a main block for testing ---
if __name__ == '__main__':
    # Configure basic logging for testing purposes
    # Use DEBUG level to see the detailed cleaning steps
    logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    test_logger = logging.getLogger('PDF_Processor_Test')

    # --- IMPORTANT: Replace with a valid path to your test PDF file ---
    # Make sure this path points to a PDF where you previously observed issues
    # like the leading backtick.
    test_pdf_file = Path("path/to/your/test_screenplay.pdf")
    # ---

    if not is_pymupdf4llm_available():
         test_logger.error("Cannot run test: PyMuPDF4LLM is not installed. Please run 'pip install pymupdf4llm'.")
    elif not test_pdf_file.exists():
        test_logger.error(f"Cannot run test: Test PDF file not found at '{test_pdf_file}'. Please update the path in the script.")
    else:
        test_logger.info(f"Attempting PDF conversion test for: {test_pdf_file}")
        try:
            # Call the conversion function with the test logger
            extracted_text = convert_pdf_to_text(test_pdf_file, test_logger)
            test_logger.info(f"Conversion successful.")
            test_logger.info(f"First 500 characters of extracted text:\n---\n{extracted_text[:500]}\n---")

            # Define an output path for the converted text
            output_path = test_pdf_file.with_suffix('.converted_V3_test.txt') # Changed suffix to reflect V3
            try:
                output_path.write_text(extracted_text, encoding='utf-8')
                test_logger.info(f"Saved cleaned text (V3) for inspection to: {output_path}")
            except Exception as write_err:
                test_logger.error(f"Failed to write converted text to {output_path}: {write_err}")

        except FileNotFoundError as fnf_err:
             test_logger.error(f"Test conversion failed: File not found - {fnf_err}")
        except ImportError as imp_err:
             test_logger.error(f"Test conversion failed: Import error - {imp_err}")
        except Exception as err:
            test_logger.error(f"Test conversion failed with an unexpected error: {err}", exc_info=True)