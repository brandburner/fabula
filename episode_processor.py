# File: episode_processor.py
import asyncio
import logging
from typing import Dict, Any

from scene_processor import process_scene_entities, process_scene_data  # Import both functions
from context import GlobalContext
from utils import format_scene_text, generate_uuid # Import the missing functions

# Configure logging
logging.basicConfig(filename='episode_processing.log', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

async def process_episode(episode: Dict[str, Any], global_context: GlobalContext) -> Dict[str, Any]:
    """
    Process a single episode by iterating over its scenes.
    Supports both direct scene arrays and nested acts.
    Uses a two-pass approach:
    1. process_scene_entities (extracts entities in dependency order)
    2. process_scene_data (extracts events, participations, using reconciled entities)
    """
    processed_scenes = []
    episode_title = episode.get("Episode", "Untitled Episode")

    logging.info(f"Starting processing for episode: {episode_title}")

    # --- First Pass: Extract Entities ---
    scene_uuids = []  # Store scene UUIDs for the second pass
    if "Acts" in episode:
        scene_number = 0
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (entity extraction)")
            for scene in act_scenes:
                scene_number += 1
                logging.info(f"Processing scene {scene_number} (entity extraction): {scene.get('Scene', 'Unnamed Scene')}")
                try:
                    scene_uuid = await process_scene_entities(scene, global_context, scene_number)
                    scene_uuids.append((scene_number, scene_uuid))  # Store scene number and UUID
                except Exception as e:
                    logging.error(f"Error processing scene {scene_number} (entity extraction): {e}", exc_info=True)
                    # Consider skipping the scene on error

    elif "Scenes" in episode:
        scene_number = 0
        for scene in episode.get("Scenes", []):
            scene_number += 1
            logging.info(f"Processing scene {scene_number} (entity extraction): {scene.get('Scene', 'Unnamed Scene')}")
            try:
                scene_uuid = await process_scene_entities(scene, global_context, scene_number)
                scene_uuids.append((scene_number, scene_uuid)) # Store scene number and UUID
            except Exception as e:
                logging.error(f"Error processing scene {scene_number} (entity extraction): {e}", exc_info=True)
            # Consider skipping the scene on error
    else:
        logging.error(f"Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")


    # --- Second Pass: Extract Scene Data ---
    logging.info(f"Starting second pass (event/participation extraction) for episode: {episode_title}")
    for scene_number, scene_uuid in scene_uuids:
        # Find the original scene data based on scene_number
        original_scene = None
        if "Acts" in episode:
            for act in episode.get("Acts", []):
                for scene in act.get("Scenes", []):
                    # Format the scene text and check if it matches the UUID
                    temp_scene_text = format_scene_text(scene)
                    temp_scene_uuid = generate_uuid("scene", str(scene_number))  # Generate UUID the same way
                    if temp_scene_uuid == scene_uuid:
                        original_scene = scene
                        break
                if original_scene:
                    break
        elif "Scenes" in episode:
            for scene in episode.get("Scenes", []):
                temp_scene_text = format_scene_text(scene)
                temp_scene_uuid = generate_uuid("scene", str(scene_number))
                if temp_scene_uuid == scene_uuid:
                    original_scene = scene
                    break

        if original_scene is None:
            logging.error(f"Could not find original scene data for scene number {scene_number} (UUID: {scene_uuid})")
            continue # Or raise an exception if you want to halt processing

        logging.info(f"Processing scene {scene_number} (event/participation extraction)")
        try:
            logging.info(f"Calling process_scene_data for scene {scene_number} with UUID {scene_uuid}") #NEW LOGGING STATEMENT
            processed_scene = await process_scene_data(original_scene, global_context, scene_number, scene_uuid)
            logging.info(f"process_scene_data completed for scene {scene_number}") # NEW LOGGING STATEMENT
            processed_scenes.append(processed_scene)
        except Exception as e:
            logging.error(f"Error processing scene {scene_number} (event/participation extraction): {e}", exc_info=True)
            # Consider skipping the scene

     # Update each scene’s metadata to point to the next scene’s UUID.
    for i in range(len(processed_scenes) - 1):
        current_scene_metadata = processed_scenes[i]["extracted_data"]["metadata"]
        next_scene_uuid = processed_scenes[i+1]["scene_uuid"]
        current_scene_metadata["next_scene"] = next_scene_uuid
    if processed_scenes:
        processed_scenes[-1]["extracted_data"]["metadata"]["next_scene"] = None

    logging.info(f"Finished processing episode: {episode_title}")

    processed_episode = {
        "episode_title": episode_title,
        "scenes": processed_scenes
    }

    return processed_episode