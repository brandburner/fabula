# scene_processor.py
from typing import Dict, Optional, List, Any
import logging
from baml_client import b
from baml_client.type_builder import TypeBuilder
from entity_registry import EntityRegistry
from entity_extractors import (
    extract_and_register_entities,
    infer_object_owners
)

logger = logging.getLogger(__name__)

async def process_scene(
    scene_data: Dict,
    story_context: str,
    scene_number: int,
    *,
    next_scene_uuid: Optional[str]=None,
    entity_registry: Optional[EntityRegistry]=None,
    tb: Optional[TypeBuilder] = None,
    known_agent_uuids: Optional[List[str]] = None,
    known_object_uuids: Optional[List[str]] = None
) -> Dict:
    """Process a single scene, extracting all relevant information."""
    try:
        if entity_registry is None:
            entity_registry = EntityRegistry()
            
        # Generate scene UUID
        scene_uuid = f"scene-{scene_number:03}"
        scene_title = scene_data.get("Scene", "Untitled Scene")
        logger.info(f"Processing scene: {scene_title} (UUID: {scene_uuid})")

        # Format scene text for processing, now passing scene_location
        scene_text = format_dialogue(scene_data.get("Dialogue", []), scene_number, scene_data.get("Scene"))
        
        # First extract entities to ensure proper typing
        await extract_and_register_entities(
            scene_data,
            scene_text, 
            story_context,
            entity_registry,
            tb
        )

        # Get current UUIDs after entity registration
        current_agent_uuids = known_agent_uuids or list(entity_registry.agents.keys())
        current_object_uuids = known_object_uuids or list(entity_registry.objects.keys())

        # Extract metadata (now using existing entity UUIDs)
        metadata = await b.ExtractSceneMetadata(
            scene_text=scene_text,
            story_context=story_context,
            baml_options={"tb": tb}
        )

        if metadata:
            metadata_dict = metadata.model_dump()
            # Directly use the location from ExtractSceneMetadata if it's a valid UUID
            if metadata_dict.get('location') and not entity_registry.normalizer.validate_reference(metadata_dict['location']):
                # Only resolve if it's not already a valid UUID
                location_uuid = entity_registry.resolve_reference('locations', metadata_dict['location'])
                metadata_dict['location'] = location_uuid
            metadata_dict['uuid'] = scene_uuid
            metadata_dict['scene_number'] = scene_number
            metadata_dict['next_scene'] = next_scene_uuid
        else:
            metadata_dict = {
                'uuid': scene_uuid,
                'scene_number': scene_number,
                'next_scene': next_scene_uuid,
                'title': scene_title,
                'description': ''
            }

        # Extract events using known entity UUIDs
        events = await b.ExtractEvents(
            scene_text=scene_text,
            story_context=story_context,
            scene_number=scene_number,
            known_agents=current_agent_uuids,
            known_objects=current_object_uuids,
            baml_options={"tb": tb}
        )
        
        events_list = []
        for event in events:
            event_dict = event.model_dump()
            # Ensure all agent/object references are valid UUIDs
            if 'agent_participations' in event_dict:
                event_dict['agent_participations'] = [
                    uuid for uuid in event_dict['agent_participations']
                    if entity_registry.get_entity_details('agents', uuid)
                ]
            if 'object_involvements' in event_dict:
                event_dict['object_involvements'] = [
                    uuid for uuid in event_dict['object_involvements']
                    if entity_registry.get_entity_details('objects', uuid)
                ]
            events_list.append(event_dict)

        # Extract participations and involvements
        agent_participations = await b.ExtractAgentParticipations(
            scene_text=scene_text,
            story_context=story_context,
            events=events_list,
            agents=current_agent_uuids,
            baml_options={"tb": tb}
        )
        
        participations_list = []
        for ap in agent_participations:
            ap_dict = ap.model_dump()
            agent_uuid = entity_registry.resolve_reference('agents', ap_dict['agent'])
            if agent_uuid and ap_dict.get('event'):
                ap_dict['agent'] = agent_uuid
                ap_dict['uuid'] = f"participation-{agent_uuid}-{ap_dict['event']}"
                participations_list.append(ap_dict)

        object_involvements = await b.ExtractObjectInvolvements(
            scene_text=scene_text,
            story_context=story_context,
            events=events_list,
            objects=current_object_uuids,
            baml_options={"tb": tb}
        )
        
        involvements_list = []
        for oi in object_involvements:
            oi_dict = oi.model_dump()
            object_uuid = entity_registry.resolve_reference('objects', oi_dict['object'])
            if object_uuid and oi_dict.get('event'):
                oi_dict['object'] = object_uuid
                oi_dict['uuid'] = f"involvement-{object_uuid}-{oi_dict['event']}"
                involvements_list.append(oi_dict)

        return {
            "scene_uuid": scene_uuid,
            "original_scene_data": scene_data,
            "extracted_data": {
                "metadata": metadata_dict,
                "events": events_list,
                "agent_participations": participations_list,
                "object_involvements": involvements_list
            }
        }

    except Exception as e:
        logger.error(f"Error processing scene {scene_title}: {str(e)}")
        return {
            "scene_uuid": scene_uuid,
            "original_scene_data": scene_data,
            "error": str(e)
        }

async def extract_scene_metadata(
    scene_text: str,
    story_context: str,
    scene_uuid: str,
    scene_number: int,
    next_scene_uuid: Optional[str],
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> Dict:
    """Extract and process scene metadata."""
    metadata_extracted = await b.ExtractSceneMetadata(
        scene_text=scene_text,
        story_context=story_context,
        baml_options={"tb": tb}
    )
    metadata = metadata_extracted.model_dump()
    metadata["uuid"] = scene_uuid
    metadata["scene_number"] = scene_number
    metadata["next_scene"] = next_scene_uuid

    # Extract and assign primary location
    locations = await b.ExtractLocations(
        scene_text=scene_text,
        story_context=story_context,
        baml_options={"tb": tb}
    )
    
    if locations:
        primary_location = locations[0].model_dump()
        location_uuid = entity_registry.register_entity('locations', primary_location)
        metadata["location"] = location_uuid

    return metadata

async def extract_scene_events(
    scene_text: str,
    story_context: str,
    scene_number: int,
    known_agent_uuids: List[str],
    known_object_uuids: List[str],
    tb: TypeBuilder
) -> List[Dict]:
    """Extract events from a scene."""
    events_extracted = await b.ExtractEvents(
        scene_text=scene_text,
        story_context=story_context,
        scene_number=scene_number,
        known_agents=known_agent_uuids,
        known_objects=known_object_uuids,
        baml_options={"tb": tb}
    )
    
    events = [ev.model_dump() for ev in events_extracted]
    for event in events:
        event['uuid'] = f"event-{scene_number}-{event['sequence_within_scene']}"
    
    return events

async def extract_agent_participations(
    scene_text: str,
    story_context: str,
    events: List[Dict],
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> List[Dict]:
    """Extract agent participations for events."""
    registry_agents = [v for v in entity_registry.agents.values()]
    
    agent_parts_extracted = await b.ExtractAgentParticipations(
        scene_text=scene_text,
        story_context=story_context,
        events=events,
        agents=registry_agents,
        baml_options={"tb": tb}
    )
    
    agent_participations = []
    for p in agent_parts_extracted:
        d = p.model_dump()
        agent_uuid = entity_registry.resolve_reference('agents', d['agent'])
        if agent_uuid:
            d['agent'] = agent_uuid
            d['uuid'] = f"participation-{agent_uuid}-{d['event']}"
            agent_participations.append(d)
        else:
            logger.warning(f"Skipping invalid agent participation for '{d['agent']}'")
    
    return agent_participations

async def extract_object_involvements(
    scene_text: str,
    story_context: str,
    events: List[Dict],
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> List[Dict]:
    """Extract object involvements for events."""
    registry_objects = [v for v in entity_registry.objects.values()]
    
    obj_invs_extracted = await b.ExtractObjectInvolvements(
        scene_text=scene_text,
        story_context=story_context,
        events=events,
        objects=registry_objects,
        baml_options={"tb": tb}
    )
    
    object_involvements = []
    for oi in obj_invs_extracted:
        d = oi.model_dump()
        obj_uuid = entity_registry.resolve_reference('objects', d['object'])
        if obj_uuid:
            d['object'] = obj_uuid
            d['uuid'] = f"involvement-{obj_uuid}-{d['event']}"
            object_involvements.append(d)
        else:
            logger.warning(f"Skipping invalid object involvement for '{d['object']}'")
    
    return object_involvements

def build_scene_output(
    metadata: Dict,
    events: List[Dict],
    agent_participations: List[Dict],
    object_involvements: List[Dict],
    entity_registry: EntityRegistry
) -> Dict:
    """Build the final scene output structure."""
    used_agent_uuids = set()
    used_object_uuids = set()
    used_location_uuids = set()
    used_org_uuids = set()

    # Primary location from metadata
    if metadata.get("location"):
        used_location_uuids.add(metadata["location"])

    # Collect references from events
    for e in events:
        used_agent_uuids.update(e.get('agent_participations', []))
        used_object_uuids.update(e.get('object_involvements', []))
        if e.get('location'):
            used_location_uuids.add(e['location'])

    # Collect references from agent_participations
    for ap in agent_participations:
        used_agent_uuids.add(ap['agent'])
        agent_details = entity_registry.get_entity_details('agents', ap['agent'])
        if agent_details and agent_details.get('affiliated_org'):
            org_uuid = entity_registry.resolve_reference(
                'organizations',
                agent_details['affiliated_org']
            )
            if org_uuid:
                used_org_uuids.add(org_uuid)

    # Collect references from object_involvements
    for oi in object_involvements:
        used_object_uuids.add(oi['object'])
        obj_details = entity_registry.get_entity_details('objects', oi['object'])
        if obj_details and obj_details.get('original_owner'):
            owner_uuid = entity_registry.resolve_reference(
                'agents',
                obj_details['original_owner']
            )
            if owner_uuid:
                used_agent_uuids.add(owner_uuid)

    return {
        "metadata": metadata,
        "events": events,
        "agents": [
            entity_registry.get_entity_details('agents', au)
            for au in used_agent_uuids
            if entity_registry.get_entity_details('agents', au)
        ],
        "objects": [
            entity_registry.get_entity_details('objects', ou)
            for ou in used_object_uuids
            if entity_registry.get_entity_details('objects', ou)
        ],
        "locations": [
            entity_registry.get_entity_details('locations', lu)
            for lu in used_location_uuids
            if entity_registry.get_entity_details('locations', lu)
        ],
        "organizations": [
            entity_registry.get_entity_details('organizations', ou)
            for ou in used_org_uuids
            if entity_registry.get_entity_details('organizations', ou)
        ],
        "agent_participations": agent_participations,
        "object_involvements": object_involvements,
    }

def format_dialogue(
    dialogues: List[Dict[str, str]], 
    scene_number: int,
    scene_location: Optional[str] = None
) -> str:
    formatted_lines = [f"(Scene Number: {scene_number})"]
    if scene_location:
        formatted_lines.append(f"Location: {scene_location}")
    
    for dialogue in dialogues:
        if "Stage Direction" in dialogue:
            formatted_lines.append(f"[{dialogue['Stage Direction']}]")
        elif "Character" in dialogue and "Line" in dialogue:
            formatted_lines.append(f"{dialogue['Character']}: {dialogue['Line']}")
            
    return "\n".join(formatted_lines)
