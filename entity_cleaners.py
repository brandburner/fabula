# entity_cleaners.py
from typing import Dict
import logging
from entity_registry import EntityRegistry
logger = logging.getLogger(__name__)

def clean_agent_data(agent: Dict) -> Dict:
    """Clean and validate agent data."""
    cleaned = agent.copy()
    # Ensure required fields
    if 'name' not in cleaned:
        logger.warning(f"Agent missing name: {cleaned}")
        cleaned['name'] = 'Unknown Agent'
    if 'traits' not in cleaned:
        cleaned['traits'] = []
    return cleaned

def clean_object_data(obj: Dict, entity_registry: EntityRegistry) -> Dict:
    cleaned = obj.copy()
    
    if cleaned.get('original_owner'):
        original_owner = cleaned['original_owner']
        if isinstance(original_owner, (str, dict)):
            owner_id = original_owner.get('uuid') if isinstance(original_owner, dict) else original_owner
            if owner_id and owner_id != 'agent-':
                cleaned['original_owner'] = entity_registry.normalizer.normalize_owner_reference(str(owner_id))
                if not entity_registry.get_entity_details('agents', cleaned['original_owner']):
                    cleaned['original_owner'] = None
        else:
            cleaned['original_owner'] = None
    
    return cleaned

def clean_location_data(loc: Dict) -> Dict:
    """Clean and validate location data."""
    cleaned = loc.copy()
    # Ensure required fields
    if 'name' not in cleaned:
        logger.warning(f"Location missing name: {cleaned}")
        cleaned['name'] = 'Unknown Location'
    if 'type' not in cleaned:
        cleaned['type'] = 'Unspecified'
    return cleaned

def clean_organization_data(org: Dict) -> Dict:
    """Clean and validate organization data."""
    cleaned = org.copy()
    # Ensure required fields
    if 'name' not in cleaned:
        logger.warning(f"Organization missing name: {cleaned}")
        cleaned['name'] = 'Unknown Organization'
    if 'members' not in cleaned:
        cleaned['members'] = []
    return cleaned

def clean_event_data(event: Dict, entity_registry: EntityRegistry) -> Dict:
    """Clean and validate event data."""
    cleaned = event.copy()
    # Validate agent participations
    if 'agent_participations' in cleaned:
        cleaned['agent_participations'] = [
            ap for ap in cleaned['agent_participations']
            if entity_registry.get_entity_details('agents', ap) is not None
        ]
    # Validate object involvements
    if 'object_involvements' in cleaned:
        cleaned['object_involvements'] = [
            oi for oi in cleaned['object_involvements']
            if entity_registry.get_entity_details('objects', oi) is not None
        ]
    return cleaned