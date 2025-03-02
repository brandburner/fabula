# File: validation.py
import logging
from typing import Any, Dict, Optional, Set, List, Union
from baml_client.types import Agent, Organization, Location, Object, Event, AgentParticipation, ObjectInvolvement
from context import GlobalContext
from dataclasses import dataclass
from entity_registry import EntityRegistry

@dataclass
class ValidationResult:
    """Represents the result of validating an entity or reference."""
    is_valid: bool
    errors: List[str]
    warnings: List[str]

def validate_entity_references(
    entity_refs: List[str],
    entity_type: str,
    registry: EntityRegistry
) -> ValidationResult:
    """
    Validates a list of entity references against the registry.
    """
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    for ref in entity_refs:
        if not registry.find_entity_by_uuid(ref):
            result.is_valid = False
            result.errors.append(f"Invalid {entity_type} reference: {ref}")
            
    return result


def validate_entity_attributes(entity: Any) -> bool:
    """
    Validates the attributes of an entity (Agent, Organization, Location, Object).

    Args:
        entity: The entity to validate.

    Returns:
        True if the entity is valid, False otherwise.
    """
    if isinstance(entity, Agent):
        if not entity.uuid or not entity.uuid.startswith("agent_"):
            logging.error(f"Invalid agent UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Agent {entity.uuid} has no name.")
            return False
        if entity.affiliated_org and not entity.affiliated_org.startswith("org_"):
            logging.error(f"Agent {entity.uuid} has invalid affiliated_org: {entity.affiliated_org}")
            return False

    elif isinstance(entity, Organization):
        if not entity.uuid or not entity.uuid.startswith("org_"):
            logging.error(f"Invalid organization UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Organization {entity.uuid} has no name.")
            return False
        # Add more Organization-specific checks if needed

    elif isinstance(entity, Location):
        if not entity.uuid or not entity.uuid.startswith("location_"):
            logging.error(f"Invalid location UUID: {entity.uuid}")
            return False
        if not entity.name:
            logging.error(f"Location {entity.uuid} has no name.")
            return False

    elif isinstance(entity, Object):
        if not entity.uuid or not entity.uuid.startswith("object_"):
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

def validate_organization_consistency(registry: EntityRegistry) -> ValidationResult:
    """Validates and optionally fixes org/agent consistency"""
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    for agent in registry.agents.values():
        if agent.affiliated_org:
            org = registry.get_organization(agent.affiliated_org)
            if org:
                if agent.uuid not in (org.members or []):
                    result.warnings.append(
                        f"Agent {agent.name} ({agent.uuid}) affiliated with org "
                        f"{org.name} but not in members list"
                    )
                    # Option to add agent to org members
                    if org.members is None:
                        org.members = []
                    org.members.append(agent.uuid)
            else:
                result.errors.append(
                    f"Agent {agent.name} ({agent.uuid}) has invalid "
                    f"affiliated_org: {agent.affiliated_org}"
                )
                agent.affiliated_org = None  # Clear invalid reference
                result.is_valid = False
                
    return result

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

    object_uuid = involvement_data["object"]
    normalized_object_uuid = normalize_identifier(object_uuid) # Normalize the object UUID

    involved_object = entity_registry.get_object(normalized_object_uuid)
    if not involved_object:
        logging.error(f"Validation Error: ObjectInvolvement refers to object '{object_uuid}' but object not found (normalized: '{normalized_object_uuid}').")
        return False

    # Ensure event UUID is valid
    if not involvement_data["event"].startswith("event_"):
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

    agent_uuid = participation_data["agent"]
    normalized_agent_uuid = normalize_identifier(agent_uuid)

    participating_agent = entity_registry.get_agent(normalized_agent_uuid)
    if not participating_agent:
        logging.error(f"Validation Error: AgentParticipation refers to agent '{agent_uuid}' but agent not found (normalized: '{normalized_agent_uuid}').")
        return False

    # Ensure event UUID is valid
    if not participation_data["event"].startswith("event_"):
        logging.error(f"Validation Error: AgentParticipation refers to event '{participation_data['event']}' with invalid UUID format.")
        return False

    return True

def validate_agent_affiliations(entity_registry: EntityRegistry) -> ValidationResult:
    """
    Validates bidirectional consistency between agent affiliations and org members.
    """
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    # Check agent -> org references
    for agent in entity_registry.agents.values():
        if agent.affiliated_org:
            org = entity_registry.get_organization(agent.affiliated_org)
            if not org:
                result.is_valid = False
                result.errors.append(
                    f"Agent {agent.name} ({agent.uuid}) references non-existent "
                    f"organization: {agent.affiliated_org}"
                )
            elif not org.members or agent.uuid not in org.members:
                result.is_valid = False
                result.errors.append(
                    f"Agent {agent.name} ({agent.uuid}) claims affiliation with "
                    f"org {org.name} but is not in its members list"
                )

    # Check org -> agent references 
    for org in entity_registry.organizations.values():
        if org.members:
            for member_uuid in org.members:
                agent = entity_registry.get_agent(member_uuid)
                if not agent:
                    result.is_valid = False
                    result.errors.append(
                        f"Organization {org.name} ({org.uuid}) references "
                        f"non-existent agent: {member_uuid}"
                    )
                elif agent.affiliated_org != org.uuid:
                    result.is_valid = False
                    result.errors.append(
                        f"Organization {org.name} claims agent {agent.name} as member "
                        f"but agent's affiliated_org doesn't match"
                    )
                    
    return result

def validate_participation_references(
    scene_data: Dict[str, Any],
    registry: EntityRegistry
) -> ValidationResult:
    """Validates participation and involvement references within a scene."""
    result = ValidationResult(is_valid=True, errors=[], warnings=[])

    # Event -> AgentParticipation/ObjectInvolvement
    for event in scene_data.get("events", []):
        # Validate agent participations
        for participation_id in event.get("agent_participations", []):
            participation = next(
                (p for p in scene_data.get("agent_participations", [])
                 if p["uuid"] == participation_id),
                None
            )
            if not participation:
                result.errors.append(
                    f"Event {event['uuid']} references non-existent "
                    f"participation: {participation_id}"
                )
                result.is_valid = False
            else:
                agent = registry.get_agent(participation["agent"])
                if not agent:
                    result.errors.append(
                        f"Participation {participation_id} references non-existent "
                        f"agent: {participation['agent']}"
                    )
                    result.is_valid = False

        # Validate object involvements
        for involvement_id in event.get("object_involvements", []):
            involvement = next(
                (i for i in scene_data.get("object_involvements", [])
                 if i["uuid"] == involvement_id),
                None
            )
            if not involvement:
                result.errors.append(
                    f"Event {event['uuid']} references non-existent "
                    f"involvement: {involvement_id}"
                )
                result.is_valid = False
            else:
                obj = registry.get_object(involvement["object"])
                if not obj:
                    result.errors.append(
                        f"Involvement {involvement_id} references non-existent "
                        f"object: {involvement['object']}"
                    )
                    result.is_valid = False

    return result

def validate_bidirectional_relationships(registry: EntityRegistry) -> ValidationResult:
    """Validates relationships that should be reciprocal."""
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    # Agent <-> Organization
    for agent in registry.agents.values():
        if agent.affiliated_org:
            org = registry.get_organization(agent.affiliated_org)
            if not org:
                result.errors.append(
                    f"Agent {agent.name} ({agent.uuid}) references non-existent "
                    f"organization: {agent.affiliated_org}"
                )
                result.is_valid = False
            elif not org.members or agent.uuid not in org.members:
                result.errors.append(
                    f"Agent {agent.name} references org {org.name} but is not in "
                    "its members list"
                )
                result.is_valid = False

    return result

def validate_simple_references(registry: EntityRegistry) -> ValidationResult:
    """Validates one-way entity references."""
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    # Object -> Agent or Organization (original owner)
    for obj in registry.objects.values():
        if obj.original_owner:
            # Check if owner is an agent
            if obj.original_owner.startswith("agent_"):
                owner = registry.get_agent(obj.original_owner)
                if not owner:
                    result.errors.append(
                        f"Object {obj.name} references non-existent owner: "
                        f"{obj.original_owner}"
                    )
                    result.is_valid = False
            # Check if owner is an organization
            elif obj.original_owner.startswith("org_"):
                owner_org = registry.get_organization(obj.original_owner)
                if not owner_org:
                    result.errors.append(
                        f"Object {obj.name} references non-existent owner organization: "
                        f"{obj.original_owner}"
                    )
                    result.is_valid = False
            # Invalid owner prefix
            else:
                result.errors.append(
                    f"Object {obj.name} has invalid owner format: "
                    f"{obj.original_owner} (should start with 'agent_' or 'org_')"
                )
                result.is_valid = False

    return result

def validate_sequence_references(
    scenes: List[Dict[str, Any]]
) -> ValidationResult:
    """Validates scene and event sequence references."""
    result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    scene_uuids = {scene["scene_uuid"] for scene in scenes}
    
    for i, scene in enumerate(scenes):
        # Validate scene sequence
        if i < len(scenes) - 1:
            next_scene = scene["extracted_data"]["metadata"].get("next_scene")
            if not next_scene:
                result.errors.append(
                    f"Scene {scene['scene_uuid']} missing next_scene reference"
                )
                result.is_valid = False
            elif next_scene not in scene_uuids:
                result.errors.append(
                    f"Scene {scene['scene_uuid']} references invalid next_scene: "
                    f"{next_scene}"
                )
                result.is_valid = False
                
        # Validate event sequence within scene
        events = scene["extracted_data"].get("events", [])
        event_uuids = {event["uuid"] for event in events}
        
        for j, event in enumerate(events):
            if j < len(events) - 1:
                next_event = event.get("next_event")
                if not next_event:
                    result.errors.append(
                        f"Event {event['uuid']} missing next_event reference"
                    )
                    result.is_valid = False
                elif next_event not in event_uuids:
                    result.errors.append(
                        f"Event {event['uuid']} references invalid next_event: "
                        f"{next_event}"
                    )
                    result.is_valid = False

    return result

def validate_all_relationships(
    global_context: GlobalContext
) -> ValidationResult:
    """Performs comprehensive validation of all entity relationships."""
    
    registry = global_context.entity_registry
    final_result = ValidationResult(is_valid=True, errors=[], warnings=[])
    
    # Run all validation checks
    validations = [
        validate_bidirectional_relationships(registry),
        validate_simple_references(registry)
    ]
    
    # Add scene-specific validations
    for episode in global_context.processed_episodes:
        for scene in episode["scenes"]:
            validations.extend([
                validate_participation_references(
                    scene["extracted_data"], 
                    registry
                )
            ])
    
    # Add sequence validation
    for episode in global_context.processed_episodes:
        validations.append(
            validate_sequence_references(episode["scenes"])
        )
    
    # Combine all validation results
    for result in validations:
        if not result.is_valid:
            final_result.is_valid = False
            final_result.errors.extend(result.errors)
            final_result.warnings.extend(result.warnings)
    
    return final_result


def validate_all(global_context: "GlobalContext") -> ValidationResult:
    """
    Performs all validations on the given global context.
    """
    final_result = ValidationResult(is_valid=True, errors=[], warnings=[])

    # Validate entity attributes
    for entity_type, entities in global_context.entity_registry.get_all_entities().items():
        for entity in entities:
            if not validate_entity_attributes(entity):
                final_result.errors.append(f"Invalid entity: {entity_type} - {entity.uuid}")
                final_result.is_valid = False

    # Validate all relationships
    relationship_result = validate_all_relationships(global_context)
    if not relationship_result.is_valid:
        final_result.is_valid = False
        final_result.errors.extend(relationship_result.errors)
        final_result.warnings.extend(relationship_result.warnings)

    # Validate scene consistency
    for episode in global_context.processed_episodes:
        for scene in episode["scenes"]:
            if not validate_scene_consistency(scene):
                final_result.errors.append(f"Scene consistency validation failed for scene {scene.get('scene_uuid')}")
                final_result.is_valid = False

    return final_result