# entity_extractors.py
from typing import Dict, List, Optional, Tuple
import logging
import re
from fuzzywuzzy import fuzz
from baml_client import b
from baml_client.type_builder import TypeBuilder
from entity_registry import EntityRegistry

logger = logging.getLogger(__name__)

def normalize_agent_id(name: str) -> str:
   """Normalize agent name to create a consistent agent_id."""
   normalized = name.lower().strip()
   # Remove titles/honorifics except for special cases like 'The Doctor'
   if not normalized.startswith('the '):
       normalized = re.sub(r"^(dr|doctor|mr|mrs|ms|miss|professor|sir|lady|president|general|senator|ambassador)\.?\s+", "", normalized)
   # Replace spaces and special characters with underscores
   normalized = re.sub(r'[^\w\s]', '', normalized)
   normalized = re.sub(r'\s+', '_', normalized)
   return normalized

async def extract_and_register_entities(
   scene_data: Dict,
   scene_text: str,
   story_context: str, 
   entity_registry: EntityRegistry,
   tb: TypeBuilder
) -> None:
   """Extract and register all entities from a scene, maintaining proper entity typing."""
   try:
       # Get current registry state for deduplication
       known_agents = [v for v in entity_registry.agents.values()]
       known_objects = [v for v in entity_registry.objects.values()]

       # Create agent name to UUID mapping to help resolve references
       agent_name_to_uuid = {
           entity_registry.normalize_name(agent["name"]): agent["uuid"]
           for agent in known_agents
       }
       logger.debug(f"Agent name to UUID mapping: {agent_name_to_uuid}")

       # Extract and register agents first
       agents = await b.ExtractAgents(
           scene_text=scene_text,
           story_context=story_context,
           known_agents=known_agents,
           agent_name_to_uuid_mapping=agent_name_to_uuid,
           baml_options={"tb": tb}
       )
       logger.debug(f"Extracted agents: {agents}")

       for agent in agents:
           agent_data = agent.model_dump()
           agent_data['agent_id'] = normalize_agent_id(agent_data['name'])
           agent_data['uuid'] = f"agent-{agent_data['agent_id']}"
           entity_registry.register_entity('agents', agent_data)

       # Update UUID lists after agent registration
       known_agent_uuids = list(entity_registry.agents.keys())

       # Extract and register objects
       objects = await b.ExtractObjects(
           scene_text=scene_text,
           story_context=story_context,
           known_object_uuids=list(entity_registry.objects.keys()),
           baml_options={"tb": tb}
       )
       logger.debug(f"Extracted objects: {objects}")

       for obj in objects:
           obj_data = obj.model_dump()
           # Check if this "object" is actually referencing an existing agent
           normalized_name = entity_registry.normalize_name(obj_data['name'])
           agent_uuid = entity_registry.find_best_match(normalized_name, entity_registry.agents)
           
           if agent_uuid:
               logger.debug(f"Skipping object registration for '{obj_data['name']}' as it refers to agent {agent_uuid}")
               continue

           if 'uuid' not in obj_data:
               obj_data['uuid'] = f"object-{entity_registry.normalize_name(obj_data['name'])}"
           
           # Clean up any owner references
           if obj_data.get('original_owner'):
                owner_ref = obj_data['original_owner']
                if isinstance(owner_ref, str) and owner_ref.strip():
                    owner_uuid = entity_registry.find_best_match(owner_ref, entity_registry.agents)
                    obj_data['original_owner'] = owner_uuid
                else:
                    obj_data['original_owner'] = None

           entity_registry.register_entity('objects', obj_data)

       # Extract and register locations
       locations = await b.ExtractLocations(
           scene_text=scene_text,
           story_context=story_context,
           baml_options={"tb": tb}
       )
       logger.debug(f"Extracted locations: {locations}")

       # Merge similar locations before registration
       merged_locations = merge_locations([loc.model_dump() for loc in locations])
       
       for loc in merged_locations:
           if 'uuid' not in loc:
               loc['uuid'] = f"location-{entity_registry.normalize_name(loc['name'])}"
           entity_registry.register_entity('locations', loc)

       # Extract and register organizations
       orgs = await b.ExtractOrganizations(
           scene_text=scene_text,
           story_context=story_context,
           known_agents=known_agents,
           baml_options={"tb": tb}
       )
       logger.debug(f"Extracted organizations: {orgs}")
       
       for org in orgs:
           org_data = org.model_dump()
           if 'uuid' not in org_data:
               org_data['uuid'] = f"org-{entity_registry.normalize_name(org_data['name'])}"
           
           # Clean up member references
           if 'members' in org_data:
               cleaned_members = []
               for member_ref in org_data['members']:
                   member_uuid = entity_registry.find_best_match(member_ref, entity_registry.agents)
                   if member_uuid:
                       cleaned_members.append(member_uuid)
               org_data['members'] = cleaned_members
               
           entity_registry.register_entity('organizations', org_data)

   except Exception as e:
       logger.error(f"Error during entity extraction for scene: {e}")
       raise

async def extract_and_register_agents(
    scene_text: str,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder,
    known_agents: List[Dict],
    agent_name_to_uuid: Dict[str, str]
) -> None:
    """Extract and register agents from a scene."""
    agents = await b.ExtractAgents(
        scene_text=scene_text,
        story_context=story_context,
        known_agents=known_agents,
        agent_name_to_uuid_mapping=agent_name_to_uuid,
        baml_options={"tb": tb}
    )
    logger.debug(f"Extracted agents: {agents}")
    
    for agent in agents:
        agent_data = agent.model_dump()
        agent_data['agent_id'] = normalize_agent_id(agent_data['name'])
        agent_data['uuid'] = f"agent-{agent_data['agent_id']}"
        entity_registry.register_entity('agents', agent_data)

async def extract_and_register_objects(
    scene_text: str,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder,
    known_objects: List[Dict]
) -> None:
    """Extract and register objects from a scene."""
    # Get list of known object UUIDs
    known_object_uuids = [obj.get('uuid') for obj in known_objects if obj.get('uuid')]
    
    objects = await b.ExtractObjects(
        scene_text=scene_text,
        story_context=story_context,
        known_object_uuids=known_object_uuids,  # Changed parameter name to match BAML function
        baml_options={"tb": tb}
    )
    logger.debug(f"Extracted objects: {objects}")
    
    for obj in objects:
        entity_registry.register_entity('objects', obj.model_dump())

async def extract_and_register_locations(
    scene_text: str,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> None:
    """Extract and register locations from a scene."""
    locations = await b.ExtractLocations(
        scene_text=scene_text,
        story_context=story_context,
        baml_options={"tb": tb}
    )
    logger.debug(f"Extracted locations: {locations}")

    # Merge similar locations
    merged_locations = merge_locations([loc.model_dump() for loc in locations])
    
    for loc in merged_locations:
        entity_registry.register_entity('locations', loc)

async def extract_and_register_organizations(
    scene_text: str,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder,
    known_agents: List[Dict]
) -> None:
    """Extract and register organizations from a scene."""
    orgs = await b.ExtractOrganizations(
        scene_text=scene_text,
        story_context=story_context,
        known_agents=known_agents,
        baml_options={"tb": tb}
    )
    logger.debug(f"Extracted organizations: {orgs}")
    
    for org in orgs:
        entity_registry.register_entity('organizations', org.model_dump())

def merge_locations(locations: List[Dict]) -> List[Dict]:
   """Merges similar locations based on name similarity."""
   merged_locations = []
   for location in locations:
       merged = False
       for i, existing_location in enumerate(merged_locations):
           if fuzz.ratio(
               location['name'].lower(), 
               existing_location['name'].lower()
           ) > 85:
               # Merge descriptions if they provide different information
               existing_desc = existing_location.get('description', '')
               new_desc = location.get('description', '')
               if existing_desc and new_desc and existing_desc != new_desc:
                   merged_desc = f"{existing_desc} {new_desc}"
                   existing_location['description'] = merged_desc
               
               # Keep the more specific type if available
               if location.get('type') and len(location['type']) > len(existing_location.get('type', '')):
                   existing_location['type'] = location['type']
                   
               merged = True
               break
               
       if not merged:
           merged_locations.append(location)
           
   return merged_locations

async def infer_object_owners(
    scene_text: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> None:
    """Infer owners for objects in the registry."""
    known_agent_uuids = list(entity_registry.agents.keys())
    
    for object_uuid, object_data in entity_registry.objects.items():
        if not object_data.get('original_owner'):
            inferred_owner = await b.InferObjectOwner(
                scene_text=scene_text,
                object_uuid=object_uuid,
                agent_uuids=known_agent_uuids,
                baml_options={"tb": tb}
            )
            
            if inferred_owner:
                logger.debug(f"Inferred owner for object '{object_data['name']}': {inferred_owner}")
                object_data['original_owner'] = inferred_owner
            else:
                logger.debug(f"Could not infer owner for object '{object_data['name']}' ({object_uuid})")

