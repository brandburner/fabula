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
    processed_scenes = []
    episode_title = episode.get("Episode", "Untitled Episode")

    logging.info(f"Starting processing for episode: {episode_title}")

    # --- First Pass: Extract Entities ---
    scene_data_list = []  # Store tuple: (scene_number, scene_uuid, scene)
    scene_number = 0
    if "Acts" in episode:
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (entity extraction)")
            for scene in act_scenes:
                scene_number += 1
                logging.info(f"Processing scene {scene_number} (entity extraction): {scene.get('Scene', 'Unnamed Scene')}")
                try:
                    scene_uuid = await process_scene_entities(scene, global_context, scene_number)
                    # Store scene data along with its number and UUID.
                    scene_data_list.append((scene_number, scene_uuid, scene))
                except Exception as e:
                    logging.error(f"Error processing scene {scene_number} (entity extraction): {e}", exc_info=True)
    elif "Scenes" in episode:
        for scene in episode.get("Scenes", []):
            scene_number += 1
            logging.info(f"Processing scene {scene_number} (entity extraction): {scene.get('Scene', 'Unnamed Scene')}")
            try:
                scene_uuid = await process_scene_entities(scene, global_context, scene_number)
                # Store scene data along with its number and UUID.
                scene_data_list.append((scene_number, scene_uuid, scene))
            except Exception as e:
                logging.error(f"Error processing scene {scene_number} (entity extraction): {e}", exc_info=True)
    else:
        logging.error("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")

    # --- Second Pass: Extract Scene Data ---
    logging.info(f"Starting second pass (event/participation extraction) for episode: {episode_title}")
    for scene_number, scene_uuid, original_scene in scene_data_list:
        if original_scene is None:
            logging.error(f"Could not find original scene data for scene number {scene_number} (UUID: {scene_uuid})")
            continue

        logging.info(f"Processing scene {scene_number} (event/participation extraction)")
        try:
            logging.info(f"Calling process_scene_data for scene {scene_number} with UUID {scene_uuid}")
            processed_scene = await process_scene_data(original_scene, global_context, scene_number, scene_uuid)
            logging.info(f"process_scene_data completed for scene {scene_number}")
            processed_scenes.append(processed_scene)
        except Exception as e:
            logging.error(f"Error processing scene {scene_number} (event/participation extraction): {e}", exc_info=True)
    
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
