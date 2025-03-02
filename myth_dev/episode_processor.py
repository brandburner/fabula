# File: episode_processor.py
import asyncio
import logging
from typing import Dict, Any, List, Tuple

from scene_processor import (
    extract_locations, 
    extract_organizations, 
    extract_agents, 
    extract_objects,
    process_scene_data,
    process_scene_data_combined,
    extract_all_primary_entities  # Add this import
)
from context import GlobalContext
from utils import format_scene_text, generate_uuid

__all__ = [
    'process_episode', 
    'extract_primary_entities', 
    'extract_secondary_entities',
    'extract_primary_entities_combined',
    'extract_secondary_entities_combined'  # Add this line
]

# Configure logging
logging.basicConfig(filename='episode_processing.log', level=logging.INFO,
                   format='%(asctime)s - %(levelname)s - %(message)s')

async def extract_primary_entities(episode: Dict[str, Any], global_context: GlobalContext) -> None:
    """
    First phase: Extract all primary entities (locations, organizations, agents, objects).
    This function doesn't perform any entity resolution - just extraction.
    """
    episode_title = episode.get("Episode", "Untitled Episode")
    logging.info(f"Extracting primary entities from episode: {episode_title}")
    
    scene_number = 0
    
    # Process all scenes to extract primary entities
    if "Acts" in episode:
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (primary entity extraction)")
            for scene in act_scenes:
                scene_number += 1
                await extract_primary_entities_from_scene(scene, global_context, scene_number)
    elif "Scenes" in episode:
        for scene in episode.get("Scenes", []):
            scene_number += 1
            await extract_primary_entities_from_scene(scene, global_context, scene_number)
    else:
        logging.error("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")

async def extract_primary_entities_from_scene(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int) -> None:
    """
    Extract primary entities (locations, organizations, agents, objects) from a single scene.
    """
    try:
        scene_text = format_scene_text(scene)
        story_synopsis = global_context.get_story_summary()
        
        # 1. Extract Locations
        logging.info(f"Extracting locations from scene {scene_number}")
        locations = await extract_locations(scene_text, story_synopsis, scene_number)
        for loc in locations:
            global_context.entity_registry.register(loc, "locations")

        # 2. Extract Organizations
        logging.info(f"Extracting organizations from scene {scene_number}")
        organizations = await extract_organizations(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            agents=[],  # No agents at this point
            organizations=list(global_context.entity_registry.organizations.values())
        )
        for org in organizations:
            global_context.entity_registry.register(org, "organizations")

        # 3. Extract Agents
        logging.info(f"Extracting agents from scene {scene_number}")
        # Get the agent name to UUID mapping
        agent_name_to_uuid_mapping = global_context.entity_registry.get_agent_name_to_uuid_mapping()
        
        agents = await extract_agents(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            agent_name_to_uuid_mapping=agent_name_to_uuid_mapping,
            scene_number=scene_number,
            organizations=list(global_context.entity_registry.organizations.values())
        )
        for agent in agents:
            global_context.entity_registry.register(agent, "agents")
            
        # 4. Extract Objects
        logging.info(f"Extracting objects from scene {scene_number}")
        objects = await extract_objects(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            agents=list(global_context.entity_registry.agents.values())
        )
        for obj in objects:
            global_context.entity_registry.register(obj, "objects")
            
    except Exception as e:
        logging.error(f"Error extracting primary entities from scene {scene_number}: {str(e)}", exc_info=True)
        raise

async def extract_secondary_entities(episode: Dict[str, Any], global_context: GlobalContext) -> Dict[str, Any]:
    """
    Second phase: Extract all secondary entities (scenes, events, participations, involvements)
    using the reconciled primary entities.
    """
    processed_scenes = []
    episode_title = episode.get("Episode", "Untitled Episode")
    logging.info(f"Extracting secondary entities from episode: {episode_title}")
    
    # Collect all scenes with their numbers and UUIDs
    scene_data_list: List[Tuple[int, str, Dict[str, Any]]] = []
    scene_number = 0
    
    # Process all scenes
    if "Acts" in episode:
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (collecting scenes)")
            for scene in act_scenes:
                scene_number += 1
                scene_uuid = generate_uuid("scene", str(scene_number))
                scene_data_list.append((scene_number, scene_uuid, scene))
    elif "Scenes" in episode:
        for scene in episode.get("Scenes", []):
            scene_number += 1
            scene_uuid = generate_uuid("scene", str(scene_number))
            scene_data_list.append((scene_number, scene_uuid, scene))
    else:
        logging.error("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
    
    # Process each scene to extract secondary entities
    for scene_number, scene_uuid, original_scene in scene_data_list:
        if original_scene is None:
            logging.error(f"Could not find original scene data for scene number {scene_number} (UUID: {scene_uuid})")
            continue

        logging.info(f"Processing scene {scene_number} (secondary entity extraction)")
        try:
            processed_scene = await process_scene_data(original_scene, global_context, scene_number, scene_uuid)
            processed_scenes.append(processed_scene)
        except Exception as e:
            logging.error(f"Error processing scene {scene_number} (secondary entity extraction): {e}", exc_info=True)
    
    # Update scene connections (next_scene)
    for i in range(len(processed_scenes) - 1):
        current_scene_metadata = processed_scenes[i]["extracted_data"]["metadata"]
        next_scene_uuid = processed_scenes[i+1]["scene_uuid"]
        current_scene_metadata["next_scene"] = next_scene_uuid
    if processed_scenes:
        processed_scenes[-1]["extracted_data"]["metadata"]["next_scene"] = None

    logging.info(f"Finished extracting secondary entities from episode: {episode_title}")

    processed_episode = {
        "episode_title": episode_title,
        "scenes": processed_scenes
    }
    return processed_episode

async def process_episode(episode: Dict[str, Any], global_context: GlobalContext) -> Dict[str, Any]:
    """
    Legacy method that combines both extraction phases.
    Maintained for backward compatibility.
    """
    logging.warning("Using the legacy process_episode method. Consider using the two-phase approach instead.")
    
    # First extract primary entities
    await extract_primary_entities(episode, global_context)
    
    # Then extract secondary entities
    return await extract_secondary_entities(episode, global_context)

async def extract_primary_entities_combined(episode: Dict[str, Any], global_context: GlobalContext) -> None:
    """
    First phase using the combined extraction approach: Extract all primary entities in a single request per scene.
    This reduces the number of API calls and potentially improves consistency between entity types.
    """
    episode_title = episode.get("Episode", "Untitled Episode")
    logging.info(f"Extracting primary entities from episode (combined approach): {episode_title}")
    
    scene_number = 0
    
    # Process all scenes to extract primary entities
    if "Acts" in episode:
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (combined primary entity extraction)")
            for scene in act_scenes:
                scene_number += 1
                await extract_primary_entities_combined_from_scene(scene, global_context, scene_number)
    elif "Scenes" in episode:
        for scene in episode.get("Scenes", []):
            scene_number += 1
            await extract_primary_entities_combined_from_scene(scene, global_context, scene_number)
    else:
        logging.error("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")

async def extract_primary_entities_combined_from_scene(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int) -> None:
    """
    Extract all primary entities from a single scene using the combined extraction function.
    """
    try:
        scene_text = format_scene_text(scene)
        story_synopsis = global_context.get_story_summary()
        
        # Extract all primary entities in a single request
        primary_entities = await extract_all_primary_entities(
            scene_text=scene_text, 
            story_synopsis=story_synopsis, 
            scene_number=scene_number,
            global_context=global_context
        )
        
        # Register all extracted entities and track them by scene
        for location in primary_entities["locations"]:
            global_context.entity_registry.register(location, "locations")
            global_context.track_scene_entity(scene_number, "locations", location)
            
        for organization in primary_entities["organizations"]:
            global_context.entity_registry.register(organization, "organizations")
            global_context.track_scene_entity(scene_number, "organizations", organization)
            
        for agent in primary_entities["agents"]:
            global_context.entity_registry.register(agent, "agents")
            global_context.track_scene_entity(scene_number, "agents", agent)
            
        for obj in primary_entities["objects"]:
            global_context.entity_registry.register(obj, "objects")
            global_context.track_scene_entity(scene_number, "objects", obj)
            
    except Exception as e:
        logging.error(f"Error in combined extraction of primary entities from scene {scene_number}: {str(e)}", exc_info=True)
        # Fall back to individual extraction methods
        logging.warning(f"Falling back to individual entity extraction for scene {scene_number}")
        await extract_primary_entities_from_scene(scene, global_context, scene_number)

async def extract_secondary_entities_combined(episode: Dict[str, Any], global_context: GlobalContext) -> Dict[str, Any]:
    """
    Second phase using the combined extraction approach:
    Extract scene metadata, events, agent participations, and object involvements with fewer API calls.
    """
    processed_scenes = []
    episode_title = episode.get("Episode", "Untitled Episode")
    logging.info(f"Extracting secondary entities from episode (combined approach): {episode_title}")
    
    # Collect all scenes with their numbers and UUIDs
    scene_data_list: List[Tuple[int, str, Dict[str, Any]]] = []
    scene_number = 0
    
    # Process all scenes
    if "Acts" in episode:
        for act_index, act in enumerate(episode.get("Acts", [])):
            act_scenes = act.get("Scenes", [])
            logging.info(f"Processing act {act_index + 1} (collecting scenes)")
            for scene in act_scenes:
                scene_number += 1
                scene_uuid = generate_uuid("scene", str(scene_number))
                scene_data_list.append((scene_number, scene_uuid, scene))
    elif "Scenes" in episode:
        for scene in episode.get("Scenes", []):
            scene_number += 1
            scene_uuid = generate_uuid("scene", str(scene_number))
            scene_data_list.append((scene_number, scene_uuid, scene))
    else:
        logging.error("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
        raise ValueError("Episode structure not recognized: must contain 'Scenes' or 'Acts'.")
    
    # Process each scene using the combined approach
    for scene_number, scene_uuid, original_scene in scene_data_list:
        if original_scene is None:
            logging.error(f"Could not find original scene data for scene number {scene_number} (UUID: {scene_uuid})")
            continue

        logging.info(f"Processing scene {scene_number} (combined secondary entity extraction)")
        try:
            processed_scene = await process_scene_data_combined(original_scene, global_context, scene_number, scene_uuid)
            processed_scenes.append(processed_scene)
        except Exception as e:
            logging.error(f"Error processing scene {scene_number} (combined extraction): {e}", exc_info=True)
            try:
                # Fall back to standard extraction
                logging.warning(f"Falling back to standard extraction for scene {scene_number}")
                processed_scene = await process_scene_data(original_scene, global_context, scene_number, scene_uuid)
                processed_scenes.append(processed_scene)
            except Exception as fallback_e:
                logging.error(f"Error in fallback processing for scene {scene_number}: {fallback_e}", exc_info=True)
    
    # Update scene connections (next_scene)
    for i in range(len(processed_scenes) - 1):
        current_scene_metadata = processed_scenes[i]["extracted_data"]["metadata"]
        next_scene_uuid = processed_scenes[i+1]["scene_uuid"]
        current_scene_metadata["next_scene"] = next_scene_uuid
    if processed_scenes:
        processed_scenes[-1]["extracted_data"]["metadata"]["next_scene"] = None

    logging.info(f"Finished extracting secondary entities from episode (combined approach): {episode_title}")

    processed_episode = {
        "episode_title": episode_title,
        "scenes": processed_scenes
    }
    return processed_episode