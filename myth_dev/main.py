# File: main.py
import asyncio
import json
import logging
import sys
from pathlib import Path
from typing import List, Optional
from collections import defaultdict
import argparse

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

# Import primary entity extraction functions
from episode_processor import (
    process_episode, 
    extract_primary_entities, 
    extract_secondary_entities,
    extract_primary_entities_combined
)


# Check if combined extraction functions are available
COMBINED_IMPORTS_AVAILABLE = False
try:
    # Try to import each function individually to isolate import errors
    try:
        from episode_processor import extract_secondary_entities_combined
        logging.info("Successfully imported extract_secondary_entities_combined")
    except ImportError as e:
        logging.error(f"Error importing extract_secondary_entities_combined: {e}")
        raise
        
    try:
        from scene_processor import process_scene_data_combined
        logging.info("Successfully imported process_scene_data_combined")
    except ImportError as e:
        logging.error(f"Error importing process_scene_data_combined: {e}")
        raise
        
    try:
        from scene_processor import extract_scene_data_combined
        logging.info("Successfully imported extract_scene_data_combined")
    except ImportError as e:
        logging.error(f"Error importing extract_scene_data_combined: {e}")
        raise
        
    try:
        from scene_processor import extract_event_interactions_combined
        logging.info("Successfully imported extract_event_interactions_combined")
    except ImportError as e:
        logging.error(f"Error importing extract_event_interactions_combined: {e}")
        raise
        
    COMBINED_IMPORTS_AVAILABLE = True
    logging.info(f"Combined imports available: {COMBINED_IMPORTS_AVAILABLE}")
except Exception as e:
    logging.error(f"Not all combined functions are available: {e}")
    COMBINED_IMPORTS_AVAILABLE = False



# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/west_wing/fault_lines_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/west_wing/fault_lines_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("fault_lines_graph.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("echoes_of_the_past_graph.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/utilities/doctor_who/doctor10/json/blink_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/utilities/doctor_who/doctor10/resource/txt/blink_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("blink_graph.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/peep_show/networking_event_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/peep_show/networking_event_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("networking_event_graph.json")

# INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/doctor_who/quantum_archive_transcript.json")
# CONTEXT_FILES = [
#     Path("/home/user/fabula/source_docs/ai_fanfic/doctor_who/quantum_archive_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("quantum_archive_graph.json")

INPUT_JSON_PATH = Path("/home/user/fabula/myth_dev/5doctors.json")
CONTEXT_FILES = [
    Path("/home/user/fabula/old_utilities/doctor_who/doctor5/resource/novel/the_five_doctors_novel.txt")
]
OUTPUT_JSON_PATH = Path("the_five_doctors_graph.json")


def load_context_documents(context_files: Optional[List[Path]] = None) -> str:
    """Loads and concatenates context documents."""
    if not context_files:
        return ""
        
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
    Orchestrates the complete processing of a narrative script with a two-phase entity extraction approach:
    1. Extract all primary entities
    2. Perform entity resolution and reconciliation
    3. Extract secondary and tertiary entities based on reconciled primary entities
    """
    # Set up argument parser
    parser = argparse.ArgumentParser(description='Process TV/movie scripts into knowledge graphs')
    parser.add_argument('input_file', nargs='?', help='Input JSON file path')
    parser.add_argument('--context', '-c', nargs='+', help='Context files (e.g., summaries, treatments)')
    parser.add_argument('--output', '-o', help='Output JSON file path')
    parser.add_argument('--combined', '-m', action='store_true', 
                        help='Use combined extraction for primary entities')
    parser.add_argument('--legacy', '-l', action='store_true', 
                        help='Use legacy single-pass processing')
    parser.add_argument('--debug', '-d', action='store_true', 
                        help='Display debug information')
    parser.add_argument('--fully-combined', '-f', action='store_true', 
                        help='Use combined extraction for both primary and secondary entities')
    # Add the batch processing options
    parser.add_argument('--batch-resolution', '-b', action='store_true',
                      help='Use batch processing for entity resolution (recommended for large datasets)')
    parser.add_argument('--no-batch-resolution', action='store_true',
                      help='Disable batch processing for entity resolution')
    
    # Parse arguments
    args = parser.parse_args()
    
    # Configure console logging if debug is enabled
    if args.debug:
        console = logging.StreamHandler()
        console.setLevel(logging.INFO)
        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
        console.setFormatter(formatter)
        logging.getLogger('').addHandler(console)
    
    logging.info("Starting Fabula processing...")

    # Determine input file
    input_path = None
    if args.input_file:
        input_path = Path(args.input_file)
    elif INPUT_JSON_PATH.exists():
        input_path = INPUT_JSON_PATH
    
    if not input_path or not input_path.exists():
        logging.error(f"Input file not found: {input_path}")
        parser.print_help()
        return

    # Load script data
    try:
        logging.info(f"Loading script data from: {input_path}")
        with open(input_path, "r") as f:
            script_data = json.load(f)
    except json.JSONDecodeError as e:
        logging.error(f"Failed to parse JSON from {input_path}: {e}")
        return
    
    # Determine context files
    context_files = []
    if args.context:
        context_files = [Path(filepath) for filepath in args.context]
    elif CONTEXT_FILES:
        context_files = CONTEXT_FILES
    
    # Load context documents
    context_documents = load_context_documents(context_files)

    # Initialize GlobalContext with context documents
    global_context = GlobalContext(context_documents)

    episodes = script_data.get("Episodes", [])
    
    if args.legacy:
        # Legacy single-pass processing
        logging.info("Using legacy single-pass processing...")
        processed_episodes = []
        for episode_index, episode in enumerate(episodes):
            logging.info(f"Processing episode {episode_index + 1}: {episode.get('Episode', 'Untitled Episode')}")
            processed_episode = await process_episode(episode, global_context)
            processed_episodes.append(processed_episode)
        global_context.processed_episodes = processed_episodes
    else:
        # Two-phase processing
        logging.info("Using two-phase processing...")
        
        # PHASE 1: Primary Entity Extraction
        logging.info("Starting primary entity extraction phase...")
        for episode_index, episode in enumerate(episodes):
            episode_title = episode.get('Episode', 'Untitled Episode')
            logging.info(f"Extracting primary entities from episode {episode_index + 1}: {episode_title}")
            
            if args.combined or args.fully_combined:
                logging.info(f"Using combined extraction for primary entities in episode: {episode_title}")
                await extract_primary_entities_combined(episode, global_context)
            else:
                logging.info(f"Using individual extraction functions for primary entities in episode: {episode_title}")
                await extract_primary_entities(episode, global_context)

        # PHASE 2: Entity Resolution and Reconciliation
        logging.info("Starting entity resolution and reconciliation phase...")
        # Determine if we should use batched resolution
        use_batched = not args.no_batch_resolution  # Default to True unless explicitly disabled
        if args.batch_resolution:
            use_batched = True  # Explicitly enabled
        await global_context.entity_registry.reconcile_entities(use_batched=use_batched)
        global_context.entity_registry.update_agent_affiliations()
        logging.info("Completed entity resolution and reconciliation phase.")

        # PHASE 3: Secondary and Tertiary Entity Extraction
        logging.info("Starting secondary entity extraction phase...")
        processed_episodes = []
        for episode_index, episode in enumerate(episodes):
            episode_title = episode.get('Episode', 'Untitled Episode')
            logging.info(f"Extracting secondary entities from episode {episode_index + 1}: {episode_title}")
            
            # In the main function where it processes the --fully-combined flag
            if args.fully_combined:
                # Debug print to confirm flags
                logging.info(f"Using fully combined extraction approach")
                try:
                    processed_episode = await extract_secondary_entities_combined(episode, global_context)
                    logging.info(f"Successfully used fully combined extraction for {episode_title}")
                except Exception as e:
                    logging.error(f"Error using fully combined extraction: {e}", exc_info=True)
                    logging.warning(f"Falling back to standard extraction for episode {episode_title}")
                    processed_episode = await extract_secondary_entities(episode, global_context)
            else:
                # Use standard extraction for secondary entities
                logging.info(f"Using standard extraction for secondary entities in episode: {episode_title}")
                processed_episode = await extract_secondary_entities(episode, global_context)

                
                # Use standard extraction for secondary entities
                logging.info(f"Using standard extraction for secondary entities in episode: {episode_title}")
                processed_episode = await extract_secondary_entities(episode, global_context)
            
            processed_episodes.append(processed_episode)

        # Attach processed episodes to the global context
        global_context.processed_episodes = processed_episodes
        logging.info("Completed secondary entity extraction phase.")


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
        "episodes": global_context.processed_episodes,
        "entity_registry": global_context.entity_registry.get_all_entities(),
        "extraction_method": ("fully_combined" if args.fully_combined and COMBINED_IMPORTS_AVAILABLE else 
                    "combined" if args.combined else 
                    "individual" if not args.legacy else 
                    "legacy"),
        "validation_results": {
            "is_valid": final_validation.is_valid,
            "errors": final_validation.errors,
            "warnings": final_validation.warnings
        }
    }

    # Convert to JSON-serializable format
    serializable_output = convert_to_serializable(final_output)

    # Determine output file path
    output_path = OUTPUT_JSON_PATH
    if args.output:
        output_path = Path(args.output)
    elif args.input_file:
        # Use input filename as base for output if provided via command line
        output_path = Path(args.input_file).parent / f"{Path(args.input_file).stem}_processed.json"
    
    # Ensure output directory exists
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    # Write output to file
    with open(output_path, "w") as f:
        json.dump(serializable_output, f, indent=4)
    logging.info(f"Fabula processing complete. Output written to {output_path}")

if __name__ == "__main__":
    asyncio.run(main())