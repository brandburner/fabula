# File: scene_processor.py
import logging
import json
from typing import Dict, Any, List, Tuple, Union
import re
from baml_client import b
from baml_client.type_builder import TypeBuilder
from baml_client.types import (
    Agent,
    Organization,
    Location,
    Object,
    Event,
    AgentParticipation,
    ObjectInvolvement,
    PrimaryEntities  # Add this import for the new combined class
)

from context import GlobalContext
from utils import normalize_identifier, normalize_name, normalize_for_matching, is_close_match, generate_uuid, format_scene_text


# Define and export the process_scene_data_combined function
__all__ = [
    'extract_locations', 
    'extract_organizations', 
    'extract_agents', 
    'extract_objects',
    'extract_all_primary_entities',
    'process_scene_data',
    'process_scene_data_combined',
    'extract_scene_data_combined',
    'extract_event_interactions_combined'
]

# Make sure the process_scene_data_combined function is defined at the module level
async def process_scene_data_combined(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int, scene_uuid: str) -> Dict[str, Any]:
    """
    Process a scene using the combined extraction approach:
    1. Extract scene metadata and events together
    2. Extract agent participations and object involvements together for each event
    
    This reduces the number of API calls and improves consistency.
    """
    import json  # Add this import if not already present
    
    logging.info(f"Using fully combined approach for scene {scene_number}")
    
    scene_text = format_scene_text(scene)
    registry_context = global_context.get_registry_context()
    story_synopsis = global_context.get_story_summary()
    
    # Extract scene metadata and events
    try:
        logging.info(f"Extracting combined scene data for scene {scene_number}")
        metadata, events = await extract_scene_data_combined(scene, global_context, scene_number, scene_uuid)
        logging.info(f"Successfully extracted combined scene data: {len(events)} events")
    except Exception as e:
        logging.error(f"Error in extract_scene_data_combined: {e}", exc_info=True)
        raise  # Re-raise the exception instead of silently falling back
    
    # Extract agent participations and object involvements for each event
    all_agent_participations = []
    all_object_involvements = []
    
    for event in events:
        try:
            # Ensure we have the UUID as a string in the correct format
            event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', '')
            logging.info(f"Extracting combined event interactions for event {event_uuid}")
            
            # Add debug logging here, inside the event loop
            logging.info(f"DEBUG - Event before processing: {event}")
            logging.info(f"DEBUG - Agent participations before call: {event.agent_participations if hasattr(event, 'agent_participations') else event.get('agent_participations', [])}")
            logging.info(f"DEBUG - Object involvements before call: {event.object_involvements if hasattr(event, 'object_involvements') else event.get('object_involvements', [])}")
            
            agent_participations, object_involvements = await extract_event_interactions_combined(
                scene_text=scene_text,
                registry_context=registry_context,
                story_synopsis=story_synopsis,
                event=event,
                scene_number=scene_number,
                global_context=global_context
            )
            logging.info(f"Successfully extracted combined event interactions: {len(agent_participations)} participations, {len(object_involvements)} involvements")
        except Exception as e:
            event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', 'unknown')
            logging.error(f"Error in extract_event_interactions_combined for event {event_uuid}: {e}", exc_info=True)
            raise  # Re-raise the exception instead of silently falling back
            
        # Add to the master lists
        all_agent_participations.extend(agent_participations)
        all_object_involvements.extend(object_involvements)

        
        # Update the event with the IDs of the participation/involvement records
        if hasattr(event, 'agent_participations'):
            event.agent_participations = [p.uuid for p in agent_participations]
            event.object_involvements = [i.uuid for i in object_involvements]
        else:
            event['agent_participations'] = [p.uuid for p in agent_participations]
            event['object_involvements'] = [i.uuid for i in object_involvements]
        
        # Validate references
        event_obj = event
        if not isinstance(event, Event) and isinstance(event, dict):
            # Create an Event object for validation
            event_obj = Event(
                uuid=event.get('uuid', ''),
                title=event.get('title', ''),
                description=event.get('description', ''),
                sequence_within_scene=event.get('sequence_within_scene', 1),
                key_dialogue=event.get('key_dialogue', []),
                agent_participations=[p.uuid for p in agent_participations],
                object_involvements=[i.uuid for i in object_involvements],
                next_event=event.get('next_event')
            )
            
        if not validate_event_references(event_obj, global_context):
            logging.error(f"Invalid references in event {event_uuid}")
    
    # Convert Event objects to dictionaries if needed
    events_data = []
    for event in events:
        if hasattr(event, 'model_dump'):
            events_data.append(event.model_dump())
        else:
            events_data.append(event)
    
    # Assemble the extracted data
    extracted_data = {
        "metadata": metadata.model_dump() if hasattr(metadata, 'model_dump') else metadata,
        "events": events_data,
        "agent_participations": [p.model_dump() if hasattr(p, 'model_dump') else p for p in all_agent_participations],
        "object_involvements": [i.model_dump() if hasattr(i, 'model_dump') else i for i in all_object_involvements]
    }

    # Add a check to ensure location is preserved
    if isinstance(extracted_data["metadata"], dict) and "location" in extracted_data["metadata"]:
        if extracted_data["metadata"]["location"] is None:
            # Try to recover the location from the original metadata
            if hasattr(metadata, 'location') and metadata.location:
                extracted_data["metadata"]["location"] = metadata.location
                logging.info(f"Recovered location from original metadata: {metadata.location}")

    # Build the final scene output
    processed_scene = {
        "scene_uuid": scene_uuid,
        "original_scene_data": scene,
        "extracted_data": extracted_data
    }
    
    return processed_scene


# --- Primary Entity Extraction Functions ---

async def extract_locations(scene_text: str, story_synopsis: str, scene_number: int) -> List[Location]:
    """Extract locations from a scene."""
    tb = TypeBuilder()
    
    try:
        locations = await b.ExtractLocations(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        return locations
    except Exception as e:
        logging.error(f"Error extracting locations from scene {scene_number}: {e}", exc_info=True)
        return []

async def extract_organizations(scene_text: str, story_synopsis: str, scene_number: int, 
                             agents: List[Agent], organizations: List[Organization]) -> List[Organization]:
    """Extract organizations from a scene."""
    tb = TypeBuilder()
    
    try:
        organizations = await b.ExtractOrganizations(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            agents=agents,
            organizations=organizations,
            baml_options={"tb": tb}
        )
        return organizations
    except Exception as e:
        logging.error(f"Error extracting organizations from scene {scene_number}: {e}", exc_info=True)
        return []

async def extract_agents(scene_text: str, story_synopsis: str, agent_name_to_uuid_mapping: Dict[str, str], 
                      scene_number: int, organizations: List[Organization]) -> List[Agent]:
    """Extract agents from a scene."""
    tb = TypeBuilder()
    
    # Add organization enum for the type builder
    org_enum = tb.add_enum("OrganizationEnum")
    for org in organizations:
        org_enum.add_value(org.uuid)
    
    try:
        agents = await b.ExtractAgents(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            agent_name_to_uuid_mapping=agent_name_to_uuid_mapping,
            scene_number=scene_number,
            organizations=organizations,
            baml_options={"tb": tb}
        )
        return agents
    except Exception as e:
        logging.error(f"Error extracting agents from scene {scene_number}: {e}", exc_info=True)
        return []

async def extract_objects(scene_text: str, story_synopsis: str, scene_number: int, agents: List[Agent]) -> List[Object]:
    """Extract objects from a scene."""
    tb = TypeBuilder()
    
    # Add agent enum for the type builder
    agent_enum = tb.add_enum("AgentEnum")
    for agent in agents:
        agent_enum.add_value(agent.uuid)
    
    try:
        objects = await b.ExtractObjects(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            agents=agents,
            baml_options={"tb": tb}
        )
        return objects
    except Exception as e:
        logging.error(f"Error extracting objects from scene {scene_number}: {e}", exc_info=True)
        return []

# --- Combined Primary Entity Extraction Function ---

async def extract_all_primary_entities(scene_text: str, story_synopsis: str, scene_number: int, 
                                     global_context: GlobalContext) -> Dict[str, List[Any]]:
    """
    Extract all primary entity types (locations, organizations, agents, objects) in a single request.
    This reduces the number of API calls and potentially improves consistency between entity types.
    
    Returns:
        Dictionary with keys 'locations', 'organizations', 'agents', 'objects' containing the extracted entities.
    """
    tb = TypeBuilder()
    
    # Prepare existing data for context
    agent_name_to_uuid_mapping = global_context.entity_registry.get_agent_name_to_uuid_mapping()
    existing_organizations = list(global_context.entity_registry.organizations.values())
    existing_agents = list(global_context.entity_registry.agents.values())

    # Get registry context for enhanced prompting
    registry_context = global_context.get_registry_context()
    
    try:
        logging.info(f"Extracting all primary entities from scene {scene_number} in a single request")
        
        # Call the combined extraction function
        primary_entities = await b.ExtractPrimaryEntities(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            agent_name_to_uuid_mapping=agent_name_to_uuid_mapping,
            existing_organizations=existing_organizations,
            existing_agents=existing_agents,
            registry_context=registry_context,
            baml_options={"tb": tb}
        )
        
        # Log the results
        logging.info(f"Extracted {len(primary_entities.locations)} locations, "
                    f"{len(primary_entities.organizations)} organizations, "
                    f"{len(primary_entities.agents)} agents, "
                    f"{len(primary_entities.objects)} objects")
        
        return {
            "locations": primary_entities.locations,
            "organizations": primary_entities.organizations,
            "agents": primary_entities.agents,
            "objects": primary_entities.objects
        }
        
    except Exception as e:
        logging.error(f"Error extracting primary entities from scene {scene_number}: {str(e)}", exc_info=True)
        # Return empty lists for all entity types as fallback
        return {
            "locations": [],
            "organizations": [],
            "agents": [],
            "objects": []
        }

# --- Secondary Entity Extraction Functions ---

def validate_event_references(event: Event, global_context: GlobalContext) -> bool:
    """Validates all entity references in an event."""
    valid = True
    
    # Validate agent participations
    for participation_id in event.agent_participations:
        if not global_context.entity_registry.find_entity_by_uuid(participation_id):
            logging.error(f"Invalid agent participation reference: {participation_id}")
            valid = False
            
    # Validate object involvements  
    for involvement_id in event.object_involvements:
        if not global_context.entity_registry.find_entity_by_uuid(involvement_id):
            logging.error(f"Invalid object involvement reference: {involvement_id}")
            valid = False
            
    return valid

async def process_scene_data(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int, scene_uuid: str) -> Dict[str, Any]:
    """
    Process a scene to extract scene metadata, events, agent participations, 
    and object involvements using the reconciled entity registry.
    """
    scene_text = format_scene_text(scene)
    registry_context = global_context.get_registry_context()
    story_synopsis = global_context.get_story_summary()
    tb = TypeBuilder()

    # 1. Extract Scene Metadata
    location_enum = tb.add_enum("LocationEnum")
    for loc in global_context.entity_registry.locations.values():
        location_enum.add_value(loc.uuid)

    metadata = await b.ExtractSceneMetadata(
        scene_text=scene_text,
        story_synopsis=story_synopsis,
        scene_number=scene_number,
        locations=list(global_context.entity_registry.locations.values()),
        baml_options={"tb": tb}
    )
    metadata.uuid = scene_uuid

    # Normalize the location field
    if metadata and metadata.location:
        normalized_location = "location_" + normalize_identifier(metadata.location)
        registered_location = global_context.entity_registry.get_location(normalized_location)
        if registered_location:
            metadata.location = registered_location.uuid
        else:
            found = False
            for loc in global_context.entity_registry.locations.values():
                if is_close_match(normalized_location, loc.uuid):
                    metadata.location = loc.uuid
                    found = True
                    break
            if not found:
                metadata.location = None

    # 2. Extract Events
    events = await b.ExtractEvents(
        scene_text=scene_text,
        registry_context=registry_context,
        story_synopsis=story_synopsis,
        scene_number=scene_number,
        baml_options={"tb": tb}
    )
    
    # Generate event UUIDs
    for event in events:
        event.uuid = generate_uuid(f"event_{scene_number}", str(event.sequence_within_scene))

    # Sort events by sequence
    events.sort(key=lambda e: e.sequence_within_scene)
    for i, event in enumerate(events):
        if i < len(events) - 1:
            event.next_event = events[i+1].uuid
        else:
            event.next_event = None

    # 3. Extract Agent Participations
    agent_enum = tb.add_enum("AgentEnum")
    for agent in global_context.entity_registry.agents.values():
        agent_enum.add_value(agent.uuid)
    event_enum = tb.add_enum("EventEnum")
    for event in events:
        event_enum.add_value(event.uuid)

    agent_participations: List[AgentParticipation] = []
    for event in events:
        agent_participations_for_event = await b.ExtractAgentParticipations(
            scene_text=scene_text,
            registry_context=registry_context,
            story_synopsis=story_synopsis,
            event=event,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        for participation in agent_participations_for_event:
            if participation.agent:
                participation.uuid = generate_uuid("agentparticipation", f"{participation.agent}_{event.uuid}")
                agent_participations.append(participation)

    # 4. Extract Object Involvements
    object_enum = tb.add_enum("ObjectEnum")
    for obj in global_context.entity_registry.objects.values():
        object_enum.add_value(obj.uuid)

    object_involvements: List[ObjectInvolvement] = []
    for event in events:
        object_involvements_for_event = await b.ExtractObjectInvolvements(
            scene_text=scene_text,
            registry_context=registry_context,
            story_synopsis=story_synopsis,
            event=event,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        for involvement in object_involvements_for_event:
            if involvement.object:
                involvement.uuid = generate_uuid("objectinvolvement", f"{involvement.object}_{event.uuid}")
                object_involvements.append(involvement)

    # Update each event with participation/involvement IDs
    for event in events:
        event.agent_participations = [p.uuid for p in agent_participations if p.event == event.uuid]
        event.object_involvements = [i.uuid for i in object_involvements if i.event == event.uuid]
        
        # Validate references
        if not validate_event_references(event, global_context):
            logging.error(f"Invalid references in event {event.uuid}")

    # Assemble the extracted data
    extracted_data = {
        "metadata": metadata.model_dump() if metadata else {},
        "events": [e.model_dump() for e in events],
        "agent_participations": [p.model_dump() for p in agent_participations],
        "object_involvements": [i.model_dump() for i in object_involvements]
    }

    # Build the final scene output
    processed_scene = {
        "scene_uuid": scene_uuid,
        "original_scene_data": scene,
        "extracted_data": extracted_data
    }
    return processed_scene

async def extract_scene_data_combined(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int, scene_uuid: str) -> Tuple[Any, List[Event]]:
    """
    Combined extraction of scene metadata and events in a single request.
    This improves contextual understanding and reduces API calls.
    
    Returns:
        Tuple of (scene_metadata, events)
    """
    scene_text = format_scene_text(scene)
    story_synopsis = global_context.get_story_summary()
    tb = TypeBuilder()
    
    try:
        logging.info(f"Extracting combined scene metadata and events from scene {scene_number}")
        
        # Get scene-specific context
        filtered_registry_context = global_context.format_scene_entity_context(
            scene_number, entity_types=["locations", "agents", "objects"]
        )
        
        # For scene metadata, we especially need all available locations
        if filtered_registry_context.count("location_") == 0:
            # If no locations are specifically tracked for this scene, include all locations
            all_locations = "\nLocations:\n"
            for loc in global_context.entity_registry.locations.values():
                all_locations += f"  - {loc.name} ({loc.uuid}): type = {loc.type}\n"
            filtered_registry_context += all_locations
        
        logging.info(f"Using scene-specific context with {filtered_registry_context.count('location_')} locations, {filtered_registry_context.count('agent_')} agents, and {filtered_registry_context.count('object_')} objects")
        
        # Call the combined extraction function
        scene_data = await b.ExtractSceneData(
            scene_text=scene_text,
            registry_context=filtered_registry_context,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            scene_uuid=scene_uuid,
            locations=list(global_context.entity_registry.locations.values()),
            baml_options={"tb": tb}
        )
        
        # Standardize the event UUIDs
        events = scene_data.events
        for event in events:
            event.uuid = generate_uuid(f"event_{scene_number}", str(event.sequence_within_scene))
        
        # Sort events by sequence and set next_event links
        events.sort(key=lambda e: e.sequence_within_scene)
        for i, event in enumerate(events):
            if i < len(events) - 1:
                event.next_event = events[i+1].uuid
            else:
                event.next_event = None
        
        # Process agent participations and object involvements

        # In the extract_scene_data_combined function:
        # In extract_scene_data_combined, replace the existing event processing code with this:

        for event in events:
            # Initialize empty lists if they don't exist
            if not hasattr(event, 'agent_participations') or event.agent_participations is None:
                event.agent_participations = []
            if not hasattr(event, 'object_involvements') or event.object_involvements is None:
                event.object_involvements = []
            
            # Important: DO NOT clear these lists like the old code was doing
            # The old code had: event.agent_participations.clear()
            
            # Instead, log what BAML returned and preserve it
            logging.info(f"BAML returned for event {event.uuid}:")
            logging.info(f"agent_participations: {event.agent_participations}")
            logging.info(f"object_involvements: {event.object_involvements}")
            
            # Filter agent_participations to only include valid agent UUIDs
            valid_agent_participations = []
            for agent_id in event.agent_participations:
                if agent_id.startswith("agent_") and agent_id in global_context.entity_registry.agents:
                    valid_agent_participations.append(agent_id)
                else:
                    logging.warning(f"Removing invalid agent reference: {agent_id} (not found in registry)")
            
            # Filter object_involvements to only include valid object UUIDs
            valid_object_involvements = []
            for obj_id in event.object_involvements:
                if obj_id.startswith("object_") and obj_id in global_context.entity_registry.objects:
                    valid_object_involvements.append(obj_id)
                else:
                    logging.warning(f"Removing invalid object reference: {obj_id} (not found in registry or wrong type)")

            # IMPORTANT: SET these lists, not append to them
            event.agent_participations = valid_agent_participations
            event.object_involvements = valid_object_involvements

            # Additionally, let's verify and fix the original_owner field for objects
            for obj_id in valid_object_involvements:
                obj = global_context.entity_registry.objects.get(obj_id)
                if obj and obj.original_owner:
                    # Check if the owner is valid (either an agent or an organization)
                    owner_id = obj.original_owner
                    if not ((owner_id.startswith("agent_") and owner_id in global_context.entity_registry.agents) or 
                            (owner_id.startswith("org_") and owner_id in global_context.entity_registry.organizations)):
                        logging.warning(f"Object {obj_id} has invalid owner reference: {owner_id}")
                        # Try to find a matching organization if owner starts with 'org_'
                        if owner_id.startswith("org_"):
                            for org_uuid in global_context.entity_registry.organizations:
                                if is_close_match(owner_id, org_uuid):
                                    logging.info(f"Correcting owner reference from {owner_id} to {org_uuid}")
                                    obj.original_owner = org_uuid
                                    break
                        # Try to find a matching agent if owner starts with 'agent_'
                        elif owner_id.startswith("agent_"):
                            for agent_uuid in global_context.entity_registry.agents:
                                if is_close_match(owner_id, agent_uuid):
                                    logging.info(f"Correcting owner reference from {owner_id} to {agent_uuid}")
                                    obj.original_owner = agent_uuid
                                    break
            
            logging.info(f"Event {event.uuid}: filtered to {len(event.agent_participations)} valid agents and {len(event.object_involvements)} valid objects")
            logging.info(f"Agent participations: {event.agent_participations}")
            logging.info(f"Object involvements: {event.object_involvements}")
            #####
            # Do NOT check locations for object involvements
            # Let's add a check to remove any location entries that might have been incorrectly added
            event.object_involvements = [
                obj for obj in event.object_involvements
                if obj.startswith("object_") and not obj.startswith("location_")
            ]
            
            # Log what we found
            logging.info(f"Event {event.uuid}: identified {len(event.agent_participations)} agents and {len(event.object_involvements)} objects")
        
        # Set the metadata UUID
        metadata = scene_data.metadata
        metadata.uuid = scene_uuid
        
        # Normalize the location field
        if metadata and metadata.location:
            location_uuid = metadata.location
            logging.info(f"Extracted location from BAML: {location_uuid}")
            
            # Check if location exists in registry as-is
            if location_uuid in global_context.entity_registry.locations:
                logging.info(f"Found location {location_uuid} in registry")
            else:
                # Try normalizing the UUID
                normalized_location = "location_" + normalize_identifier(location_uuid.replace("location_", ""))
                logging.info(f"Normalized location UUID: {normalized_location}")
                
                # Check if normalized version exists
                if normalized_location in global_context.entity_registry.locations:
                    logging.info(f"Found normalized location {normalized_location} in registry")
                    metadata.location = normalized_location
                else:
                    # Try fuzzy matching
                    found = False
                    for loc_uuid, loc in global_context.entity_registry.locations.items():
                        if is_close_match(normalized_location, loc_uuid) or is_close_match(location_uuid, loc_uuid):
                            logging.info(f"Found fuzzy match for location: {loc_uuid}")
                            metadata.location = loc_uuid
                            found = True
                            break
                            
                    if not found:
                        logging.warning(f"Location {location_uuid} not found in registry. Keeping original value.")
        
        logging.info(f"Extracted combined scene metadata and {len(events)} events from scene {scene_number}")
        return metadata, events
        
    except Exception as e:
        logging.error(f"Error extracting combined scene data from scene {scene_number}: {str(e)}", exc_info=True)
        logging.warning(f"Falling back to separate extraction for scene {scene_number}")
        
        # Fall back to individual extraction methods
        metadata = await b.ExtractSceneMetadata(
            scene_text=scene_text,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            locations=list(global_context.entity_registry.locations.values()),
            baml_options={"tb": tb}
        )
        metadata.uuid = scene_uuid
        
        events = await b.ExtractEvents(
            scene_text=scene_text,
            registry_context=registry_context,
            story_synopsis=story_synopsis,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        
        # Generate event UUIDs
        for event in events:
            event.uuid = generate_uuid(f"event_{scene_number}", str(event.sequence_within_scene))
        
        # Sort events by sequence and set next_event links
        events.sort(key=lambda e: e.sequence_within_scene)
        for i, event in enumerate(events):
            if i < len(events) - 1:
                event.next_event = events[i+1].uuid
            else:
                event.next_event = None
        
        # Initialize empty lists for agent participations and object involvements
        for event in events:
            event.agent_participations = []
            event.object_involvements = []
            
        return metadata, events

async def extract_event_interactions_combined(
    scene_text: str,
    registry_context: str,
    story_synopsis: str,
    event: Union[Event, Dict[str, Any]],
    scene_number: int,
    global_context: GlobalContext = None
) -> Tuple[List[AgentParticipation], List[ObjectInvolvement]]:
    """
    Combined extraction of agent participations and object involvements for a specific event.
    This improves contextual understanding and reduces API calls.
    
    Returns:
        Tuple of (agent_participations, object_involvements)
    """
    import json  # Add this import if not already present
    
    logging.info(f"DEBUG - Received event in extract_event_interactions_combined: {event}")
    
    # If event is a dict, log directly. Otherwise convert attributes to a dict for logging
    if isinstance(event, dict):
        logging.info(f"DEBUG - Agent participations received: {event.get('agent_participations', [])}")
        logging.info(f"DEBUG - Object involvements received: {event.get('object_involvements', [])}")
    else:
        logging.info(f"DEBUG - Agent participations received: {event.agent_participations if hasattr(event, 'agent_participations') else []}")
        logging.info(f"DEBUG - Object involvements received: {event.object_involvements if hasattr(event, 'object_involvements') else []}")
    
    tb = TypeBuilder()
    
    try:
        # Rest of your function...
        # Handle either Event object or dictionary
        event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', '')
        event_title = event.title if hasattr(event, 'title') else event.get('title', '')
        event_description = event.description if hasattr(event, 'description') else event.get('description', '')
        
        # Get the pre-determined agent and object lists from the event
        predetermined_agents = []
        if hasattr(event, 'agent_participations') and event.agent_participations:
            predetermined_agents = event.agent_participations
        elif isinstance(event, dict) and 'agent_participations' in event and event['agent_participations']:
            predetermined_agents = event['agent_participations']

        predetermined_objects = []
        if hasattr(event, 'object_involvements') and event.object_involvements:
            predetermined_objects = event.object_involvements
        elif isinstance(event, dict) and 'object_involvements' in event and event['object_involvements']:
            predetermined_objects = event['object_involvements']

        logging.info(f"Event already identifies {len(predetermined_agents)} agents and {len(predetermined_objects)} objects")
        logging.info(f"Predetermined agents: {predetermined_agents}")
        logging.info(f"Predetermined objects: {predetermined_objects}")
        
        # Only proceed with extraction if we have valid predetermined agents or objects
        if not global_context:
            logging.error("Global context not provided for entity resolution. Cannot proceed with extraction.")
            return [], []
            
        # Create lists of valid entity UUIDs for validation
        valid_agent_uuids = set(global_context.entity_registry.agents.keys())
        valid_object_uuids = set(global_context.entity_registry.objects.keys())
        
        # Create name-to-UUID mappings for potential fuzzy matching
        agent_name_to_uuid = {}
        for agent_uuid, agent in global_context.entity_registry.agents.items():
            if agent.name:
                agent_name_to_uuid[normalize_for_matching(agent.name)] = agent_uuid
                
        object_name_to_uuid = {}
        for obj_uuid, obj in global_context.entity_registry.objects.items():
            if obj.name:
                object_name_to_uuid[normalize_for_matching(obj.name)] = obj_uuid
                
        # Create a special context that highlights the predetermined agents and objects
        filtered_lines = []
        
        # Add agents section with EXPLICIT list of valid UUIDs
        filtered_lines.append("Agents (ONLY use these entities for agent participations):")
        # If predetermined agents exist, include only those agents
        if predetermined_agents:
            for agent_uuid in predetermined_agents:
                if agent_uuid in valid_agent_uuids:
                    agent = global_context.entity_registry.agents[agent_uuid]
                    filtered_lines.append(f"  ✓- {agent.name} ({agent_uuid}): affiliated_org = {agent.affiliated_org or 'None'}")
                    filtered_lines.append(f"    Description: {agent.description}")
                else:
                    logging.warning(f"Predetermined agent {agent_uuid} not found in registry. Skipping.")
        # Otherwise include all agents from the scene
        else:
            scene_entities = global_context.get_scene_entities(scene_number, entity_types=["agents"])
            for agent in scene_entities.get("agents", []):
                if agent and agent.uuid in valid_agent_uuids:
                    filtered_lines.append(f"  - {agent.name} ({agent.uuid}): affiliated_org = {agent.affiliated_org or 'None'}")
                    filtered_lines.append(f"    Description: {agent.description}")
        
        # Add objects section with EXPLICIT list of valid UUIDs
        filtered_lines.append("\nObjects (ONLY use these entities for object involvements):")
        # If predetermined objects exist, include only those objects
        if predetermined_objects:
            for object_uuid in predetermined_objects:
                if object_uuid in valid_object_uuids:
                    obj = global_context.entity_registry.objects[object_uuid]
                    filtered_lines.append(f"  ✓- {obj.name} ({object_uuid}): owner = {obj.original_owner or 'None'}")
                    filtered_lines.append(f"    Description: {obj.description}")
                else:
                    logging.warning(f"Predetermined object {object_uuid} not found in registry. Skipping.")
        # Otherwise include all objects from the scene
        else:
            scene_entities = global_context.get_scene_entities(scene_number, entity_types=["objects"])
            for obj in scene_entities.get("objects", []):
                if obj and obj.uuid in valid_object_uuids:
                    filtered_lines.append(f"  - {obj.name} ({obj.uuid}): owner = {obj.original_owner or 'None'}")
                    filtered_lines.append(f"    Description: {obj.description}")
        
        # Add a CRITICAL reminder about using only the listed entities
        filtered_lines.append("\nCRITICAL: You MUST ONLY use the exact entity UUIDs listed above. DO NOT create new entities or modify existing UUIDs.")
        
        filtered_registry_context = "\n".join(filtered_lines)
        
        logging.info(f"Using filtered context with {filtered_registry_context.count('agent_')} agents and {filtered_registry_context.count('object_')} objects")
        
        # Transform to Event object if needed
        event_obj = event
        if not isinstance(event, Event):
            event_obj = Event(
                uuid=event.get('uuid', ''),
                title=event.get('title', ''),
                description=event.get('description', ''),
                sequence_within_scene=event.get('sequence_within_scene', 1),
                key_dialogue=event.get('key_dialogue', []),
                agent_participations=predetermined_agents,
                object_involvements=predetermined_objects,
                next_event=event.get('next_event')
            )
        
        # Call the combined extraction function
        interactions = await b.ExtractEventInteractions(
            scene_text=scene_text,
            registry_context=filtered_registry_context,
            story_synopsis=story_synopsis,
            event=event_obj,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        
        # Process agent participations
        agent_participations = []
        for participation in interactions.agent_participations:
            if not participation.agent:
                logging.warning(f"Agent participation missing agent reference. Skipping.")
                continue
                
            original_agent_id = participation.agent
            
            # Clean up any potential scene number suffixes
            base_agent_id = original_agent_id
            for suffix in [f"_{scene_number}", f"_{scene_number}_1", f"_{scene_number}_2"]:
                if base_agent_id.endswith(suffix):
                    base_agent_id = base_agent_id[:-len(suffix)]
                    logging.warning(f"Removing scene number suffix from agent ID: {original_agent_id} -> {base_agent_id}")
                    break
            
            # Verify this is an agent entity
            if not base_agent_id.startswith("agent_"):
                logging.warning(f"Incorrect agent type detected: {base_agent_id}. Skipping this participation.")
                continue
                
            # Verify it exists in the registry
            if base_agent_id not in valid_agent_uuids:
                # Try fuzzy matching by name
                agent_name = base_agent_id.replace("agent_", "").replace("_", " ")
                normalized_name = normalize_for_matching(agent_name)
                if normalized_name in agent_name_to_uuid:
                    base_agent_id = agent_name_to_uuid[normalized_name]
                    logging.warning(f"Fixed agent ID via name matching: {original_agent_id} -> {base_agent_id}")
                else:
                    logging.warning(f"Agent {base_agent_id} not found in registry. Skipping this participation.")
                    continue
                    
            # Verify it's one of the predetermined agents if we have any
            if predetermined_agents and base_agent_id not in predetermined_agents:
                logging.warning(f"Agent {base_agent_id} not in predetermined list. Skipping this participation.")
                continue
                
            # Use the corrected agent ID
            participation.agent = base_agent_id
            participation.uuid = generate_uuid("agentparticipation", f"{base_agent_id}_{event_uuid}")
            participation.event = event_uuid
            agent_participations.append(participation)
        
        # Process object involvements
        object_involvements = []
        for involvement in interactions.object_involvements:
            if not involvement.object:
                logging.warning(f"Object involvement missing object reference. Skipping.")
                continue
                
            original_object_id = involvement.object
            
            # Clean up any potential scene number suffixes
            base_object_id = original_object_id
            for suffix in [f"_{scene_number}", f"_{scene_number}_1", f"_{scene_number}_2"]:
                if base_object_id.endswith(suffix):
                    base_object_id = base_object_id[:-len(suffix)]
                    logging.warning(f"Removing scene number suffix from object ID: {original_object_id} -> {base_object_id}")
                    break
            
            # Verify this is an object entity
            if not base_object_id.startswith("object_"):
                logging.warning(f"Incorrect object type detected: {base_object_id}. Skipping this involvement.")
                continue
                
            # Verify it exists in the registry
            if base_object_id not in valid_object_uuids:
                # Try fuzzy matching by name
                object_name = base_object_id.replace("object_", "").replace("_", " ")
                normalized_name = normalize_for_matching(object_name)
                if normalized_name in object_name_to_uuid:
                    base_object_id = object_name_to_uuid[normalized_name]
                    logging.warning(f"Fixed object ID via name matching: {original_object_id} -> {base_object_id}")
                else:
                    logging.warning(f"Object {base_object_id} not found in registry. Skipping this involvement.")
                    continue
                    
            # Verify it's one of the predetermined objects if we have any
            if predetermined_objects and base_object_id not in predetermined_objects:
                logging.warning(f"Object {base_object_id} not in predetermined list. Skipping this involvement.")
                continue
                
            # Use the corrected object ID
            involvement.object = base_object_id
            involvement.uuid = generate_uuid("objectinvolvement", f"{base_object_id}_{event_uuid}")
            involvement.event = event_uuid
            object_involvements.append(involvement)
        
        logging.info(f"Extracted {len(agent_participations)} agent participations and {len(object_involvements)} object involvements for event {event_uuid}")
        return agent_participations, object_involvements
        
    except Exception as e:
        event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', 'unknown')
        logging.error(f"Error extracting combined interactions for event {event_uuid}: {str(e)}")
        logging.warning(f"Falling back to separate extraction for event {event_uuid}")
        return [], []

        # Fall back to individual extraction methods
        agent_participations = []
        agent_participations_for_event = await b.ExtractAgentParticipations(
            scene_text=scene_text,
            registry_context=registry_context,
            story_synopsis=story_synopsis,
            event=event,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        for participation in agent_participations_for_event:
            if participation.agent:
                participation.uuid = generate_uuid("agentparticipation", f"{participation.agent}_{event.uuid}")
                agent_participations.append(participation)
        
        object_involvements = []
        object_involvements_for_event = await b.ExtractObjectInvolvements(
            scene_text=scene_text,
            registry_context=registry_context,
            story_synopsis=story_synopsis,
            event=event,
            scene_number=scene_number,
            baml_options={"tb": tb}
        )
        for involvement in object_involvements_for_event:
            if involvement.object:
                involvement.uuid = generate_uuid("objectinvolvement", f"{involvement.object}_{event.uuid}")
                object_involvements.append(involvement)
                
        return agent_participations, object_involvements
