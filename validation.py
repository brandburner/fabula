# File: validation.py
import logging
from typing import Any, Dict
from baml_client.types import Agent, Organization, Location, Object, Event, AgentParticipation, ObjectInvolvement
from context import GlobalContext # Import GlobalContext
from entity_registry import EntityRegistry  # <---- CORRECTED IMPORT STATEMENT


def validate_entity_attributes(entity: Any) -> bool:
    """
    Validates the attributes of an entity (Agent, Organization, Location, Object).

    Args:
        entity: The entity to validate.

    Returns:
        True if the entity is valid, False otherwise.
    """
    if isinstance(entity, Agent):
        if not entity.uuid or not entity.uuid.startswith("agent-"):
            logging.error(f"Invalid agent UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Agent {entity.uuid} has no name.")
            return False
        if entity.affiliated_org and not entity.affiliated_org.startswith("org-"):
            logging.error(f"Agent {entity.uuid} has invalid affiliated_org: {entity.affiliated_org}")
            return False

    elif isinstance(entity, Organization):
        if not entity.uuid or not entity.uuid.startswith("org-"):
            logging.error(f"Invalid organization UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Organization {entity.uuid} has no name.")
            return False
        # Add more Organization-specific checks if needed

    elif isinstance(entity, Location):
        if not entity.uuid or not entity.uuid.startswith("location-"):
            logging.error(f"Invalid location UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Location {entity.uuid} has no name.")
            return False

    elif isinstance(entity, Object):
        if not entity.uuid or not entity.uuid.startswith("object-"):
            logging.error(f"Invalid object UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Object {entity.uuid} has no name.")
            return False

    else:
        logging.error(f"Unknown entity type: {type(entity)}")
        return False

    return True

def validate_relationships(global_context: GlobalContext) -> bool: # Pass GlobalContext
    """
    Validates the relationships in the entity registry.
    """
    all_valid = True
    entity_registry = global_context.entity_registry

    # Agent.affiliated_org -> Organization.members []
    for agent in entity_registry.agents.values():
        if agent.affiliated_org:
            org = entity_registry.get_organization(agent.affiliated_org)
            if not org:
                logging.error(f"Validation Error: Agent {agent.uuid} has affiliated_org '{agent.affiliated_org}' but organization not found.")
                all_valid = False
            elif agent.uuid not in (org.members or []): # Check if agent UUID is in org members
                logging.error(f"Validation Error: Agent {agent.uuid} affiliated_org '{agent.affiliated_org}' but agent not in organization members.")
                all_valid = False

    # Object.original_owner -> Agent.uuid
    for obj in entity_registry.objects.values():
        if obj.original_owner:
            owner_agent = entity_registry.get_agent(obj.original_owner)
            if not owner_agent:
                logging.error(f"Validation Error: Object {obj.uuid} has original_owner '{obj.original_owner}' but agent not found.")
                all_valid = False

    # ObjectInvolvement.object -> Object.uuid
    for event_data in global_context.processed_episodes:
        for scene_data in event_data["scenes"]:
            for involvement_data in scene_data["extracted_data"]["object_involvements"]:
                if not validate_object_involvement(involvement_data, entity_registry):
                  all_valid = False

    # AgentParticipation.agent -> Agent.uuid
    for event_data in global_context.processed_episodes:
        for scene_data in event_data["scenes"]:
            for participation_data in scene_data["extracted_data"]["agent_participations"]:
                if not validate_agent_participation(participation_data, entity_registry):
                  all_valid = False

    # SceneMetadata.location -> Location.uuid
    for event_data in global_context.processed_episodes:
        for scene_data in event_data["scenes"]:
            metadata_data = scene_data["extracted_data"]["metadata"]
            if metadata_data and metadata_data.get("location"): # Check if metadata and location exist
                location_uuid = metadata_data["location"]
                location = entity_registry.get_location(location_uuid)
                if not location:
                    logging.error(f"Validation Error: SceneMetadata {metadata_data.get('uuid')} refers to location '{location_uuid}' but location not found.")
                    all_valid = False

    # Event.agent_participations -> AgentParticipation.uuid [] (Forward reference check - UUIDs are generated later, can't fully validate here)
    # Event.object_involvements -> ObjectInvolvement.uuid [] (Forward reference check - UUIDs are generated later, can't fully validate here)
    # SceneMetadata.scene_number -> scene_number (variable) - Covered by other validation
    # Scene.scene_number -> scene_number (variable) - Covered by other validation
    # Scene.next_scene -> Scene.uuid (of next scene) or null (more complex, can add later if needed)
    # Event.next_event -> Event.uuid (of next event) or null (more complex, can add later if needed)


    return all_valid


def validate_scene_consistency(scene_data: Dict[str, Any]) -> bool:
    """
    Performs consistency checks within a scene.

    Args:
        scene_data: The processed scene data.

    Returns:
        True if the scene is consistent, False otherwise.
    """
    # Add scene consistency checks here (e.g., event sequence numbers, agent/object references)
    return True

def validate_all(global_context: "GlobalContext") -> bool:
    """
    Performs all validations on the given global context.
    """
    all_valid = True

    # Validate entity attributes
    for entity_type, entities in global_context.entity_registry.get_all_entities().items():
        for entity in entities:
            if not validate_entity_attributes(entity):
                logging.error(f"Invalid entity: {entity_type} - {entity.uuid}")
                all_valid = False

    # Validate relationships - CALL THE NEW FUNCTION
    if not validate_relationships(global_context): # Call the new relationship validation
        all_valid = False

    # Validate scene consistency (currently a placeholder)
    for episode in global_context.processed_episodes:
        for scene in episode["scenes"]:
            if not validate_scene_consistency(scene):
                all_valid = False

    return all_valid

def validate_object_involvement(involvement_data: Dict[str, Any], entity_registry: EntityRegistry) -> bool:
    """
    Validates an ObjectInvolvement record.
    """
    if not involvement_data.get("object"):
        logging.error(f"Invalid ObjectInvolvement data: Missing 'object' field.")
        return False

    if not involvement_data.get("event"):
        logging.error(f"Invalid ObjectInvolvement data: Missing 'event' field.")
        return False

    involved_object = entity_registry.get_object(involvement_data["object"])
    if not involved_object:
        logging.error(f"Validation Error: ObjectInvolvement refers to object '{involvement_data['object']}' but object not found.")
        return False

    # Ensure event UUID is valid
    if not involvement_data["event"].startswith("event-"):
        logging.error(f"Validation Error: ObjectInvolvement refers to event '{involvement_data['event']}' with invalid UUID format.")
        return False

    return True

def validate_agent_participation(participation_data: Dict[str, Any], entity_registry: EntityRegistry) -> bool:
    """
    Validates an AgentParticipation record.
    """
    if not participation_data.get("agent"):
        logging.error(f"Invalid AgentParticipation data: Missing 'agent' field.")
        return False

    if not participation_data.get("event"):
        logging.error(f"Invalid AgentParticipation data: Missing 'event' field.")
        return False

    participating_agent = entity_registry.get_agent(participation_data["agent"])
    if not participating_agent:
        logging.error(f"Validation Error: AgentParticipation refers to agent '{participation_data['agent']}' but agent not found.")
        return False

    # Ensure event UUID is valid
    if not participation_data["event"].startswith("event-"):
        logging.error(f"Validation Error: AgentParticipation refers to event '{participation_data['event']}' with invalid UUID format.")
        return False

    return True