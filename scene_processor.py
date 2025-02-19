# File: scene_processor.py
import logging
import json
from typing import Dict, Any, List

from baml_client import b
from baml_client.type_builder import TypeBuilder
from baml_client.types import (
    Agent,
    Organization,
    Location,
    Object,
    Event,
    AgentParticipation,
    ObjectInvolvement
)

from context import GlobalContext
from utils import format_scene_text, generate_uuid, normalize_identifier, is_close_match

async def process_scene_entities(scene: Dict[str, Any], global_context: GlobalContext, scene_number: int) -> str:
    """
    First pass: Extracts and registers entities in dependency order.
    """
    scene_text = format_scene_text(scene)
    story_synopsis = global_context.get_story_summary()
    tb = TypeBuilder()

    # 1. Extract and Register Locations
    locations = await b.ExtractLocations(
        scene_text=scene_text,
        story_synopsis=story_synopsis,
        scene_number=scene_number,
        baml_options={"tb": tb}
    )
    for loc in locations:
        global_context.entity_registry.register(loc, "locations")

    # 2. Extract and Register Organizations
    organizations = await b.ExtractOrganizations(
        scene_text=scene_text,
        story_synopsis=story_synopsis,
        scene_number=scene_number,
        agents=[],  # No agents at this point
        organizations=list(global_context.entity_registry.organizations.values()),
        baml_options={"tb": tb}
    )
    for org in organizations:
        global_context.entity_registry.register(org, "organizations")

    # 3. Extract and Register Agents (using resolved organizations)
    org_enum = tb.add_enum("OrganizationEnum")
    for org in global_context.entity_registry.organizations.values():
        org_enum.add_value(org.uuid)

    # Get the agent name to UUID mapping *before* extracting agents.
    agent_name_to_uuid_mapping = global_context.entity_registry.get_agent_name_to_uuid_mapping()

    # --- Debugging Prints ---
    print("--- Scene Text ---")
    print(scene_text)
    print("--- Story Synopsis ---")
    print(story_synopsis)
    print("--- Agent Name to UUID Mapping ---")
    print(agent_name_to_uuid_mapping)

    # IMPORTANT: Supply the mapping as a required positional parameter!
    agents_call = b.ExtractAgents(
        scene_text=scene_text,
        story_synopsis=story_synopsis,
        agent_name_to_uuid_mapping=agent_name_to_uuid_mapping,  # <-- now provided correctly
        scene_number=scene_number,
        organizations=list(global_context.entity_registry.organizations.values()),
        baml_options={"tb": tb}
    )

    # Await the result from the BAML call.
    agents = await agents_call

    # (If you need to debug the rendered prompt, check your BAML client documentation;
    # usually the awaitable returns the extracted agents and not a prompt property.)

    for agent in agents:
        global_context.entity_registry.register(agent, "agents")

    # 4. Extract and Register Objects (using resolved agents)
    agent_enum = tb.add_enum("AgentEnum")
    for agent in global_context.entity_registry.agents.values():
        agent_enum.add_value(agent.uuid)

    objects = await b.ExtractObjects(
        scene_text=scene_text,
        story_synopsis=story_synopsis,
        scene_number=scene_number,
        agents=list(global_context.entity_registry.agents.values()),
        baml_options={"tb": tb}
    )
    for obj in objects:
        global_context.entity_registry.register(obj, "objects")

    # Generate a UUID for the scene.
    scene_uuid = generate_uuid("scene", str(scene_number))
    return scene_uuid



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
    Second pass: Extracts Scene Metadata, Events, AgentParticipations, and ObjectInvolvements,
    using the already reconciled entities from the global_context.
    """
    scene_text = format_scene_text(scene)
    registry_context = global_context.get_registry_context()
    story_synopsis = global_context.get_story_summary() # Get story summary
    tb = TypeBuilder()

    # 1. Extract Scene Metadata (using resolved locations)
    location_enum = tb.add_enum("LocationEnum")
    for loc in global_context.entity_registry.locations.values():
        location_enum.add_value(loc.uuid)

    metadata = await b.ExtractSceneMetadata(
        scene_text=scene_text,
        story_synopsis=story_synopsis, # Pass the story synopsis here
        scene_number=scene_number,
        locations=list(global_context.entity_registry.locations.values()), # Pass the locations
        baml_options={"tb": tb}
    )
    metadata.uuid = scene_uuid  # Assign previously generated scene_uuid

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
        registry_context=registry_context,  # Use registry context
        story_synopsis=story_synopsis, # Pass the story synopsis here
        scene_number=scene_number, #Pass the scene_number
        baml_options={"tb": tb}
    )
    # Generate event UUIDs after extracting events.
    for event in events:
        if not validate_event_references(event, global_context):
            logging.error(f"Invalid references in event {event.uuid}")
        event.uuid = generate_uuid(f"event_{scene_number}", str(event.sequence_within_scene))

    # Sort events by their sequence number and update next_event for each event.
    events.sort(key=lambda e: e.sequence_within_scene)
    for i, event in enumerate(events):
        if i < len(events) - 1:
            event.next_event = events[i+1].uuid
        else:
            event.next_event = None


    # 3. Extract AgentParticipations (using resolved agents and events)
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
            registry_context=registry_context,  # Use registry context
            story_synopsis=story_synopsis, # Pass the story synopsis here
            event=event,
            scene_number=scene_number, # Pass the scene number
            baml_options={"tb": tb}
        )
        for participation in agent_participations_for_event:
            if participation.agent:
                participation.uuid = generate_uuid("agentparticipation", f"{participation.agent}_{event.uuid}")
                agent_participations.append(participation)


    # 4. Extract ObjectInvolvements (using resolved objects and events)
    object_enum = tb.add_enum("ObjectEnum")
    for obj in global_context.entity_registry.objects.values():
        object_enum.add_value(obj.uuid)

    object_involvements: List[ObjectInvolvement] = []
    for event in events:
        object_involvements_for_event = await b.ExtractObjectInvolvements(
            scene_text=scene_text,
            registry_context=registry_context,  # Use registry context
            story_synopsis=story_synopsis, # Pass the story synopsis here
            event=event,
            scene_number=scene_number,  # Pass the scene number
            baml_options={"tb": tb}
        )
        for involvement in object_involvements_for_event:
            if involvement.object:
                involvement.uuid = generate_uuid("objectinvolvement", f"{involvement.object}_{event.uuid}")
                object_involvements.append(involvement)

    # Update each event with the IDs of the participation/involvement records.
    for event in events:
        event.agent_participations = [p.uuid for p in agent_participations if p.event == event.uuid]
        event.object_involvements = [i.uuid for i in object_involvements if i.event == event.uuid]

    # Assemble the extracted data.
    extracted_data = {
        "metadata": metadata.model_dump() if metadata else {},
        "events": [e.model_dump() for e in events],
        "agent_participations": [p.model_dump() for p in agent_participations],
        "object_involvements": [i.model_dump() for i in object_involvements]
    }

    # Build the final scene output.
    processed_scene = {
        "scene_uuid": scene_uuid,
        "original_scene_data": scene,
        "extracted_data": extracted_data
    }
    return processed_scene