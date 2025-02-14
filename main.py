# File: main.py
import asyncio
import json
import logging
import sys
import json
from pathlib import Path
from typing import List

from episode_processor import process_episode
from context import GlobalContext
from validation import validate_all
from utils import normalize_name # NEW IMPORT
from entity_registry import EntityRegistry


import logging
for handler in logging.root.handlers[:]:
    logging.root.removeHandler(handler)
# Configure logging
logging.basicConfig(
    filename="fabula_processing.log",
    level=logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

# Define paths for input and output files
INPUT_JSON_PATH = Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_transcript.json")
CONTEXT_FILES = [
    Path("/home/user/fabula/source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_treatment.txt")
]
OUTPUT_JSON_PATH = Path("echoes_of_the_past_graph_GPT4o.json")

# INPUT_JSON_PATH = Path("dummy_data/fault_lines_transcript.json")
# CONTEXT_FILES = [
#     Path("dummy_data/fault_lines_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("fault_lines_graph.json")

# OUTPUT_JSON_PATH = Path("output/test_graph.json")

# INPUT_JSON_PATH = Path("dummy_data/networking_event_transcript.json")
# CONTEXT_FILES = [
#     Path("dummy_data/networking_event_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/networking_event_graph.json")

def load_context_documents(context_files: List[Path]) -> str:
    """Loads and concatenates context documents."""
    context_text = ""
    for filepath in context_files:
        with open(filepath, "r") as f:
            context_text += f.read() + "\n"
    return context_text

def convert_to_serializable(obj):
    """
    Recursively convert Pydantic objects to dictionaries for JSON serialization.
    """
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
    Loads the script JSON, processes episodes, updates the global context,
    and outputs the final structured JSON.  Uses a two-pass approach with
    dependency-based entity extraction.
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
            existing_context_files = [Path(filepath) for filepath in CONTEXT_FILES if Path(filepath).exists()]
            if existing_context_files:
                context_documents = load_context_documents(existing_context_files)
    
    # If no input file found, use test data
    else:
        logging.info("No input file provided. Using test data.")
        script_data = {
            "Story": "Frontier in Space",
            "Airdate": "1973-02-24",
            "Episodes": [
                {
                    "Episode": "Episode One",
                    "Scenes": [
                        {
                            "Scene": "Spaceship Bridge",
                            "Dialogue": [
                                {
                                    "Stage Direction": "A spaceship is travelling between star systems."
                                },
                                {
                                    "Character": "HARDY",
                                    "Line": "We shall be entering hyperspace in fifty seconds."
                                },
                                {
                                    "Character": "STEWART",
                                    "Line": "Do you know what I'd like?"
                                }
                            ]
                        }
                    ]
                },
                {
                    "Episode": "Episode Two",
                    "Acts": [
                        {
                            "Act": "Act One",
                            "Scenes": [
                                {
                                    "Scene": "Control Room",
                                    "Dialogue": [
                                        {
                                            "Stage Direction": "The control room buzzes with activity."
                                        },
                                        {
                                            "Character": "CAPTAIN",
                                            "Line": "Prepare for jump!"
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            "Act": "Act Two",
                            "Scenes": [
                                {
                                    "Scene": "Engine Room",
                                    "Dialogue": [
                                        {
                                            "Stage Direction": "The engine room hums with power."
                                        },
                                        {
                                            "Character": "TECHNICIAN",
                                            "Line": "All systems are green."
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
        context_documents = ""  # Or load default context if applicable

    # Add support for context files, if provided
    if len(sys.argv) > 2:  # Check for command line arguments for context files
        context_documents = load_context_documents([Path(filepath) for filepath in sys.argv[2:]])
    else:  # Use default context files, if they exist
        context_documents = load_context_documents([Path(filepath) for filepath in CONTEXT_FILES if Path(filepath).exists()]) # Use list comprehension for safety
    # Initialize GlobalContext with context documents
    global_context = GlobalContext(context_documents)

    # **ADD THIS CHECK: Skip processing if script_data is None (error already logged)**
    if script_data is None:
        logging.error("No script data loaded. Aborting processing.")
        return

    episodes = script_data.get("Episodes", [])
    processed_episodes = []

    logging.info("Starting episode processing (two-pass)...")
    for episode_index, episode in enumerate(episodes):
        logging.info(f"Processing episode {episode_index + 1}: {episode.get('Episode', 'Untitled Episode')}")
        processed_episode = await process_episode(episode, global_context)  # process_episode now handles BOTH passes
        processed_episodes.append(processed_episode)
    logging.info("Finished episode processing.")

    # --- Entity Reconciliation (after ALL episodes are processed) ---
    logging.info("Starting entity reconciliation...")
    await global_context.entity_registry.reconcile_entities()  # Await the async function
    logging.info("Entity reconciliation complete.")

    # After processing episodes, attach them to the global context.
    global_context.processed_episodes = processed_episodes

    # --- Remapping (as a final safety net) ---
    #Remove all the remapping - we have to resolve the core problem, not patch it
    #logging.info("Starting remapping...")
    #agent_name_to_uuid = global_context.entity_registry.get_agent_name_to_uuid_mapping()
    #entity_registry = global_context.entity_registry

    #for episode in processed_episodes:
    #    for scene in episode["scenes"]:
    #        extracted_data = scene["extracted_data"]

            # Remap agent_participations
    #        for participation in extracted_data["agent_participations"]:
    #            if participation["agent"] in agent_name_to_uuid:
    #                participation["agent"] = agent_name_to_uuid[participation["agent"]]
    #            elif entity_registry.find_entity_by_uuid(participation["agent"]):
    #              #If already a UUID, pass
    #              pass
    #            else:
    #                logging.warning(f"Agent participation refers to unknown agent: {participation['agent']}")

            # Remap object_involvements
    #        for involvement in extracted_data["object_involvements"]:
                # Check for name-based references and remap if possible
    #            if involvement["object"] in {obj.name: obj.uuid for obj in entity_registry.objects.values()}:
    #                involvement["object"] = {obj.name: obj.uuid for obj in entity_registry.objects.values()}[involvement["object"]]
    #            elif entity_registry.find_entity_by_uuid(involvement["object"]):
                    # If already a UUID, pass
    #                pass
    #            else:
    #                logging.warning(f"Object involvement refers to unknown object: {involvement['object']}")


            #Remap original owners in objects
    #        for obj in entity_registry.objects.values():
    #            if obj.original_owner:
    #                if obj.original_owner in agent_name_to_uuid:
    #                    obj.original_owner = agent_name_to_uuid[obj.original_owner]
    #                elif entity_registry.find_entity_by_uuid(obj.original_owner):
                        # If already a UUID, pass
    #                    pass
    #                else:
    #                    logging.warning(f"Object refers to unknown original owner: {obj.original_owner}")

            #Remap locations in scene metadata
    #        metadata = extracted_data["metadata"]
    #        if metadata.get("location"):
    #            location_uuid = metadata["location"]

    #            if location_uuid in {loc.name: loc.uuid for loc in entity_registry.locations.values()}:
    #                metadata["location"] = {loc.name: loc.uuid for loc in entity_registry.locations.values()}[location_uuid]
    #            elif entity_registry.find_entity_by_uuid(location_uuid):
                    #If already a valid UUID, pass
    #                pass
    #            else:
    #                logging.warning(f"Scene metadata refers to unknown location: {location_uuid}")


    #logging.info("Remapping complete.")

    # Validate the output (now that the global context contains the updated processed episodes)
    logging.info("Validating extracted data...")
    if validate_all(global_context):
        logging.info("Validation successful.")
    else:
        logging.error("Validation failed. Check logs for details.")

    final_output = {
        "story_title": script_data.get("Story", "Untitled Story"),
        "airdate": script_data.get("Airdate"),
        "episodes": processed_episodes,  # Include processed episodes
        "entity_registry": global_context.entity_registry.get_all_entities()
    }

    # Convert the output to a JSON-serializable format
    serializable_output = convert_to_serializable(final_output)

    # Log the final output
    logging.info("Final output:")
    logging.info(json.dumps(serializable_output, indent=4))

    # Write the output to a file
    with open(OUTPUT_JSON_PATH, "w") as f:
        json.dump(serializable_output, f, indent=4)
    logging.info(f"Fabula processing complete. Output written to {OUTPUT_JSON_PATH}")

if __name__ == "__main__":
    asyncio.run(main())