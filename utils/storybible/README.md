# Story Bible Generator (using BAML)

This project automatically generates a detailed "story bible" from a screenplay text (TXT, MD, Fountain, PDF). It leverages **BAML** to orchestrate calls to Large Language Models (LLMs), performing deep narrative analysis and extracting structured information.

The goal is to provide writers, developers, and story analysts with a rich, structured understanding of a screenplay's core components, including:

*   **Synopsis:** A polished, multi-level summary of the plot.
*   **Treatment:** An initial high-level overview including logline, synopsis, main characters, and act structure.
*   **Characters:** Detailed profiles, motivations, relationships, and arcs.
*   **Themes:** Identification and exploration of key thematic elements.
*   **Locations:** Descriptions and significance of settings.
*   **Conflicts:** Both scene-level instances and overarching conflict arcs.
*   **Narrative Structure:** Breakdown into key stages (e.g., 3-Act structure).
*   **Plot Points:** Identification of major events driving the story.
*   **Scene Elements:** Granular analysis of individual scenes (beats, subtext, tone).

The output is provided in both structured JSON and human-readable Markdown formats.

## Features

*   **Flexible Input:** Supports various text-based formats (`.txt`, `.md`, `.fountain`) and `.pdf` (requires extra dependency).
*   **Intelligent Chunking:** Splits scripts based on identified scene boundaries where possible, falling back to token-based chunking.
*   **LLM-Powered Analysis (via BAML):**
    *   **Treatment Generation:** Creates an initial story treatment (logline, synopsis, characters, acts).
    *   **Character Pre-Scan:** Quickly identifies potential character names early on.
    *   **Contextual Summarization:** Summarizes script chunks using the overall treatment for context.
    *   **Hierarchical Merging:** Intelligently merges chunk summaries into a coherent whole.
    *   **Scene Element Extraction:** Extracts characters, locations, themes, conflicts, beats, tone, and subtext from individual scenes.
    *   **Element Synthesis:** Merges scene-level elements into comprehensive lists (characters, locations, themes, plot points).
    *   **Conflict Arc Tracking:** Identifies and traces the trajectory of major conflicts across the narrative.
    *   **Character Profile Enhancement:** Enriches initial character descriptions using contextual summaries.
    *   **Polished Final Synopsis:** Generates a final, high-quality narrative summary.
*   **Format Handling:** Detects screenplay format and applies appropriate text cleanup, including artifact removal from PDF conversions.
*   **Configurable Detail:** Allows adjusting the level of detail for generated summaries and analysis (`concise`, `standard`, `detailed`).
*   **Modular Design:** Code is organized into distinct modules for input processing, chunking, BAML analysis logic, format handling, PDF processing, and output generation.
*   **Caching:** Optionally caches BAML function results to speed up subsequent runs with the same input.
*   **Structured Output:** Generates a detailed JSON file containing all extracted information and a formatted Markdown file for easy reading.

## Core Technologies

*   **Python 3:** The primary programming language.
*   **BAML:** The core engine for defining LLM functions, types, and orchestrating calls. ([https://github.com/BoundaryML/baml](https://github.com/BoundaryML/baml))
*   **Large Language Models (LLMs):** The analysis is performed by LLMs (e.g., OpenAI's GPT series, Google's Gemini series) configured via BAML.
*   **PyMuPDF4LLM:** Used for extracting text content from PDF files (optional dependency).
*   **Tiktoken:** Used for accurately counting tokens for chunking.

## Prerequisites

1.  **Python:** Version 3.8 or higher recommended.
2.  **Pip:** Python package installer (usually comes with Python).
3.  **BAML CLI:** The BoundaryML command-line interface.
4.  **Git:** (Recommended) For cloning the repository.
5.  **LLM API Keys:** You need API keys for the LLM providers you intend to use (e.g., OpenAI, Google AI). These are configured via a `.env` file for BAML.
6.  **(Optional - for PDF Support):** `pymupdf4llm` library.

## Installation

1.  **Clone the Repository:**
    ```bash
    git clone <your-repo-url>
    cd <your-repo-directory>
    ```

2.  **Create and Activate a Virtual Environment (Recommended):**
    ```bash
    python -m venv venv
    # On Windows:
    .\venv\Scripts\activate
    # On macOS/Linux:
    source venv/bin/activate
    ```

3.  **Install Python Dependencies:**
    *(Note: You might need to create a `requirements.txt` file first)*
    ```bash
    # Create requirements.txt if it doesn't exist, listing:
    # baml
    # tiktoken
    # (Add pymupdf4llm if you need PDF support)
    pip install -r requirements.txt
    ```
    *Or install individually:*
    ```bash
    pip install baml tiktoken
    ```

4.  **Install BAML CLI:**
    *(If not already installed via requirements.txt)*
    ```bash
    pip install baml
    ```

5.  **Generate BAML Client Code:** This is a crucial step! It reads your `.baml` file(s) and generates the necessary Python client code (`baml_client`) used by the application. Run this from the directory containing your `baml_src` folder (or wherever your `.baml` files are).
    ```bash
    baml-cli generate
    ```
    You should see output indicating successful generation of Python code, likely into a `baml_client` directory within your project.

6.  **Install PDF Dependency (Optional):** If you need to process PDF files:
    ```bash
    pip install pymupdf4llm
    ```

## Configuration

BAML typically uses a `.env` file in the root of your project directory to manage API keys and other configurations. Create a file named `.env` and add your keys:

```dotenv
# Example for OpenAI
OPENAI_API_KEY=sk-YourOpenAIKeyHere

# Example for Google AI Studio / Gemini
GOOGLE_API_KEY=YourGoogleApiKeyHere

# Add other BAML configuration if needed (e.g., specific model names)
# BAML_DEFAULT_CLIENT_OPENAI=gpt-4o-mini
# BAML_DEFAULT_CLIENT_GEMINI=gemini-2.5-pro
```

Refer to the BAML documentation for specifics on configuring different LLM clients.

## Usage

The script is run from the command line.

```bash
python story_bible_generator.py [options] <script_file>
```

**Arguments:**

*   `<script_file>` (Required): Path to the input screenplay file (e.g., `my_script.txt`, `feature.pdf`, `pilot.fountain`).

**Common Options:**

*   `--output-json` / `-j`: Path for the JSON output file.
    *   Default: `<script_name>_bible.json` inside a timestamped folder (e.g., `my_script_bible_v11_20231027_103000/my_script_bible.json`).
*   `--output-markdown` / `-m`: Path for the Markdown output file.
    *   Default: `<script_name>_bible.md` inside the same timestamped folder.
*   `--cache-dir` / `-c`: Directory for caching BAML results. Caching is disabled if omitted.
*   `--log-file` / `-l`: Path to save logs to a file. Logs to console only if omitted.
*   `--detail-level` / `-d`: Generation detail level (`concise`, `standard` (default), `detailed`). Affects summary length and potentially analysis depth.
*   `--verbose` / `-v`: Enable DEBUG level logging for more detailed output.
*   `--max-tokens` / `-t`: Maximum tokens per chunk during script splitting (default: 2000).

**Control Flags (Defaults are ON):**

*   `--no-treatment`: Disable initial treatment generation.
*   `--no-prescan`: Disable character pre-scan.
*   `--no-elements`: Disable scene element extraction (also disables conflict arcs and character enhancement).
*   `--no-conflict-arcs`: Disable conflict arc analysis (requires elements).
*   `--no-char-enhance`: Disable character enhancement (requires elements).

**Examples:**

1.  **Basic Usage (Standard detail, default outputs):**
    ```bash
    python story_bible_generator.py my_screenplay.pdf
    ```
    *(Requires `pymupdf4llm` installed)*

2.  **Concise output, specific filenames, caching enabled:**
    ```bash
    python story_bible_generator.py ./scripts/pilot_v3.txt -d concise -j ./output/pilot_bible.json -m ./output/pilot_bible.md -c ./baml_cache
    ```

3.  **Detailed output, disable treatment and character enhancement, verbose logging:**
    ```bash
    python story_bible_generator.py final_draft.fountain -d detailed --no-treatment --no-char-enhance -v
    ```

## Input and Output

*   **Input:** The script accepts screenplay files. Tested formats include `.txt`, `.md`, `.fountain`. PDF (`.pdf`) is supported if `pymupdf4llm` is installed. The script attempts basic text reading for unknown extensions.
*   **Output:**
    *   **JSON File:** Contains the full, structured story bible data, including metadata, summaries, treatment details, synthesized elements (characters, locations, themes, plot points, conflicts, structure), character index, and potentially intermediate results for debugging. This file is suitable for programmatic use or further processing.
    *   **Markdown File:** A human-readable version of the story bible, formatted using Markdown headings, lists, and text styling. It includes sections for metadata, treatment, synopsis, characters, elements, conflicts, etc.

## Project Structure

```
.
├── baml_src/                  # Contains BAML definition files
│   └── main.baml              # Main BAML file defining classes and functions (or similar)
├── baml_client/               # Generated by 'baml-cli generate' - DO NOT EDIT MANUALLY
│   └── __init__.py
│   └── ... (generated Python code)
├── venv/                      # Python virtual environment (if created)
├── .env                       # API keys and BAML configuration (Gitignored)
├── .gitignore                 # Git ignore file
├── baml_analysis.py           # Wrappers for calling BAML analysis functions
├── chunker.py                 # Script chunking logic (scene-based and token-based)
├── format_handler.py          # Screenplay format detection and cleanup
├── input_processor.py         # Loads and prepares input files (incl. PDF via pdf_processor)
├── output_generator.py        # Generates Markdown and saves JSON/MD outputs
├── pdf_processor.py           # Handles PDF to text conversion using PyMuPDF4LLM
├── story_bible_generator.py   # Main script orchestrating the pipeline
├── utils.py                   # Helper utilities (logging, caching, data conversion)
├── README.md                  # This file
└── requirements.txt           # Python dependencies (optional, create if needed)
```

## BAML Schema (`baml_src/main.baml`)

The core logic defining the LLM interactions resides in the `.baml` file(s). This file defines:

*   **Classes:** Pydantic-like data structures (e.g., `Character`, `SceneElements`, `Treatment`, `ConflictArc`) that define the expected output shapes from the LLM.
*   **Template Strings:** Reusable prompts or system messages (like `Showrunner_Persona`).
*   **Functions:** Definitions for each LLM call (e.g., `GenerateStoryTreatment`, `ExtractSceneElements`, `MergeSummariesWithContext`). Each function specifies:
    *   Input arguments (e.g., `script_text`, `scene_index`).
    *   The expected output `Class`.
    *   The LLM client to use (e.g., OpenAI, Gemini).
    *   The prompt, often using Jinja templating (`{{ }}`) to insert variables and structure the request to the LLM.

The `baml-cli generate` command reads this schema and creates the Python code in `baml_client/` that allows `story_bible_generator.py` and `baml_analysis.py` to easily call these LLM functions with type safety and structure.

## Troubleshooting

*   **`ImportError: Failed to import 'baml_client'`:** Run `baml-cli generate` in your project's root directory (where `baml_src` is). Make sure BAML is installed (`pip install baml`).
*   **`AttributeError: 'b' object has no attribute 'FunctionName'`:** Run `baml-cli generate`. This usually means the Python client code is missing or outdated compared to your `.baml` file.
*   **`AttributeError: unexpected keyword argument '...'`:** Run `baml-cli generate`. The Python function signature generated by BAML doesn't match the arguments being passed in the Python code (likely due to changes in the `.baml` file).
*   **PDF Errors (`ImportError: PyMuPDF4LLM...`, `FileNotFoundError`):** Ensure `pymupdf4llm` is installed (`pip install pymupdf4llm`) and the PDF file path is correct.
*   **API Key Errors:** Ensure your `.env` file is correctly formatted and contains valid API keys for the LLM clients defined in your BAML file (e.g., `OPENAI_API_KEY`, `GOOGLE_API_KEY`). Check the BAML documentation for provider-specific variable names.
*   **Empty Output / Poor Quality Results:**
    *   Check the LLM responses in the logs (use `-v` for DEBUG level).
    *   Experiment with different LLM models configured in your BAML file or `.env`. Some models are better at specific tasks (synthesis, extraction) than others.
    *   Refine the prompts in your `.baml` file to be clearer or provide better examples.
    *   Ensure the input script is reasonably well-formatted. Use the `format_handler.py` logic effectively.
    *   Adjust the `--detail-level` or `--max-tokens`.
*   **Caching Issues:** Delete the contents of your `--cache-dir` to force recalculation if you suspect stale cache entries.

## Contributing / Future Work

*(Optional: Add guidelines if applicable)*

*   Improve scene boundary detection in `chunker.py`.
*   Add support for more input formats (e.g., Final Draft `.fdx`).
*   Implement more sophisticated conflict/relationship mapping.
*   Allow configuration of specific LLM models per BAML function via command-line args.
*   Add unit and integration tests.