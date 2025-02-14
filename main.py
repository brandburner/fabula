# File: main.py
import asyncio
import json
import logging
import sys
from pathlib import Path
from typing import List
from collections import defaultdict

from episode_processor import process_episode
from context import GlobalContext
from validation import (
    ValidationResult,
    validate_all,
    validate_all_relationships,
    validate_agent_affiliations,
    validate_bidirectional_relationships,
    validate_simple_references,
    validate_participation_references,
    validate_sequence_references,
    validate_organization_consistency
)
from utils import normalize_name
from entity_registry import EntityRegistry

# Configure logging
for handler in logging.root.handlers[:]:
    logging.root.removeHandler(handler)
logging.basicConfig(
    filename="fabula_processing.log",
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

# Define paths for input and output files
# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("/home/user/fabula/output/pre_processed/echoes_of_the_past_graph_GPT4oMini.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/peep_show/networking_event_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/peep_show/networking_event_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("/home/user/fabula/output/pre_processed/networking_event_graph_GPT4oMini.json")

INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/west_wing/fault_lines_transcript.json")
CONTEXT_FILES = [
    Path("/home/user/fabula/source_docs/ai_fanfic/west_wing/fault_lines_novelization.txt")
]
OUTPUT_JSON_PATH = Path("/home/user/fabula/output/pre_processed/fault_lines_graph_GPT4oMini.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/doctor_who/quantum_archive_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/doctor_who/quantum_archive_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("/home/user/fabula/output/pre_processed/quantum_archive_graph_GPT4oMini.json")


def load_context_documents(context_files: List[Path]) -> str:
    """Loads and concatenates context documents."""
    context_text = ""
    for filepath in context_files:
        if filepath.exists():
            with open(filepath, "r") as f:
                context_text += f.read() + "\n"
    return context_text

def convert_to_serializable(obj):
    """Recursively convert Pydantic objects to dictionaries for JSON serialization."""
    if isinstance(obj, list):
        return [convert_to_serializable(item) for item in obj]
    elif isinstance(obj, dict):
        return {k: convert_to_serializable(v) for k, v in obj.items()}
    elif hasattr(obj, "model_dump"):
        return obj.model_dump()
    else:
        return obj

async def main():
    """
    Orchestrates the complete processing of a narrative script.
    """
    logging.info("Starting Fabula processing...")

    script_data = None
    context_documents = ""
    
    # First check for command-line input file
    if len(sys.argv) > 1:
        input_path = Path(sys.argv[1])
        if not input_path.exists():
            logging.error(f"Input file not found: {input_path}")
            return
        logging.info(f"Loading script data from: {input_path}")
        try:
            with open(input_path, "r") as f:
                script_data = json.load(f)
        except json.JSONDecodeError as e:
            logging.error(f"Failed to parse JSON from {input_path}: {e}")
            return
            
        # Check for additional context files from command line
        if len(sys.argv) > 2:
            context_files = [Path(filepath) for filepath in sys.argv[2:]]
            context_documents = load_context_documents(context_files)
    
    # If no command line arguments, check for default input file
    elif INPUT_JSON_PATH.exists():
        logging.info(f"Loading script data from default path: {INPUT_JSON_PATH}")
        try:
            with open(INPUT_JSON_PATH, "r") as f:
                script_data = json.load(f)
        except json.JSONDecodeError as e:
            logging.error(f"Failed to parse JSON from {INPUT_JSON_PATH}: {e}")
            return
            
        # Load default context files
        if CONTEXT_FILES:
            context_documents = load_context_documents(CONTEXT_FILES)

    # Skip processing if script_data is None
    if script_data is None:
        logging.error("No script data loaded. Aborting processing.")
        return

    # Initialize GlobalContext with context documents
    global_context = GlobalContext(context_documents)

    episodes = script_data.get("Episodes", [])
    processed_episodes = []

    logging.info("Starting episode processing (two-pass)...")
    for episode_index, episode in enumerate(episodes):
        logging.info(f"Processing episode {episode_index + 1}: {episode.get('Episode', 'Untitled Episode')}")
        processed_episode = await process_episode(episode, global_context)
        processed_episodes.append(processed_episode)
    logging.info("Finished episode processing.")

    # Entity Reconciliation
    logging.info("Starting entity reconciliation...")
    await global_context.entity_registry.reconcile_entities()
    logging.info("Entity reconciliation complete.")

    # Update agent affiliations
    global_context.entity_registry.update_agent_affiliations()

    # After processing episodes, attach them to the global context
    global_context.processed_episodes = processed_episodes

    # Validation
    logging.info("Starting validation...")
    
    # Run all validation checks
    validation_results = [
    validate_all_relationships(global_context),
    validate_agent_affiliations(global_context.entity_registry),
    validate_bidirectional_relationships(global_context.entity_registry),
    validate_simple_references(global_context.entity_registry)
    ]

    # Add scene-specific validations
    for episode in global_context.processed_episodes:
        for scene in episode["scenes"]:
            validation_results.append(
                validate_participation_references(
                    scene["extracted_data"],
                    global_context.entity_registry
                )
            )
        validation_results.append(
            validate_sequence_references(episode["scenes"])
        )

    # Combine all validation results
    final_validation = ValidationResult(is_valid=True, errors=[], warnings=[])
    for result in validation_results:
        if result and not result.is_valid:  # Add null check here
            final_validation.is_valid = False
            final_validation.errors.extend(result.errors)
            final_validation.warnings.extend(result.warnings)

    # Log validation results
    if not final_validation.is_valid:
        logging.warning("Validation found issues:")
        for error in final_validation.errors:
            logging.error(f"  - {error}")
        for warning in final_validation.warnings:
            logging.warning(f"  - {warning}")
    else:
        logging.info("Validation successful.")

    # Prepare final output
    final_output = {
        "story_title": script_data.get("Story", "Untitled Story"),
        "airdate": script_data.get("Airdate"),
        "episodes": processed_episodes,
        "entity_registry": global_context.entity_registry.get_all_entities(),
        "validation_results": {
            "is_valid": final_validation.is_valid,
            "errors": final_validation.errors,
            "warnings": final_validation.warnings
        }
    }

    # Convert to JSON-serializable format
    serializable_output = convert_to_serializable(final_output)

    # Write output to file
    with open(OUTPUT_JSON_PATH, "w") as f:
        json.dump(serializable_output, f, indent=4)
    logging.info(f"Fabula processing complete. Output written to {OUTPUT_JSON_PATH}")

if __name__ == "__main__":
    asyncio.run(main())