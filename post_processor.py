# post_processor.py
from typing import Dict, Any, Union
from entity_normalizer import EntityNormalizer
import logging

logger = logging.getLogger(__name__)

def clean_entity_references(data: Dict[str, Any]) -> Dict[str, Any]:
    """Clean up entity references in the extracted data."""
    if 'entity_registry' in data:
        # Build a map of normalized names to correct entity types
        entity_map = {}
        for entity_type in ['agents', 'objects', 'locations', 'organizations']:
            registry = data['entity_registry'].get(entity_type, {})
            for uuid, entity in registry.items():
                normalized_name = EntityNormalizer.normalize_name(entity['name'])
                if normalized_name in entity_map:
                    logger.warning(
                        f"Found duplicate entity '{normalized_name}' as both "
                        f"{entity_map[normalized_name][0]} and {entity_type}"
                    )
                entity_map[normalized_name] = (entity_type, uuid)

        # Clean up references using the map
        for entity_type in ['agents', 'objects', 'locations', 'organizations']:
            registry = data['entity_registry'].get(entity_type, {})
            clean_registry = {}
            for uuid, entity in registry.items():
                normalized_name = EntityNormalizer.normalize_name(entity['name'])
                correct_type, correct_uuid = entity_map.get(normalized_name, (entity_type, uuid))
                if correct_type == entity_type:
                    clean_registry[uuid] = entity
            data['entity_registry'][entity_type] = clean_registry

    return data

def clean_scene_references(scene_data: Dict[str, Any], normalizer: EntityNormalizer) -> None:
    """Clean up references within a scene's extracted data."""
    # Clean metadata location reference
    if 'metadata' in scene_data and scene_data['metadata'].get('location'):
        location_ref = normalizer.extract_uuid(scene_data['metadata']['location'])
        if not normalizer.validate_reference(location_ref):
            try:
                scene_data['metadata']['location'] = normalizer.normalize_reference(
                    'location', location_ref
                )
            except Exception as e:
                logger.warning(f"Failed to normalize location reference: {e}")
                scene_data['metadata']['location'] = None

    # Clean event references
    if 'events' in scene_data:
        for event in scene_data['events']:
            # Clean agent participations
            if 'agent_participations' in event:
                cleaned_participations = []
                for ap in event['agent_participations']:
                    ap_ref = normalizer.extract_uuid(ap)
                    if normalizer.validate_reference(ap_ref):
                        cleaned_participations.append(ap_ref)
                event['agent_participations'] = cleaned_participations

            # Clean object involvements
            if 'object_involvements' in event:
                cleaned_involvements = []
                for oi in event['object_involvements']:
                    oi_ref = normalizer.extract_uuid(oi)
                    if normalizer.validate_reference(oi_ref):
                        cleaned_involvements.append(oi_ref)
                event['object_involvements'] = cleaned_involvements

    # Clean agent participations
    if 'agent_participations' in scene_data:
        for ap in scene_data['agent_participations']:
            if 'agent' in ap:
                agent_ref = normalizer.extract_uuid(ap['agent'])
                if not normalizer.validate_reference(agent_ref):
                    try:
                        ap['agent'] = normalizer.normalize_reference('agent', agent_ref)
                    except Exception as e:
                        logger.warning(f"Failed to normalize agent reference: {e}")
                        ap['agent'] = None

    # Clean object involvements
    if 'object_involvements' in scene_data:
        for oi in scene_data['object_involvements']:
            if 'object' in oi:
                object_ref = normalizer.extract_uuid(oi['object'])
                if not normalizer.validate_reference(object_ref):
                    try:
                        oi['object'] = normalizer.normalize_reference('object', object_ref)
                    except Exception as e:
                        logger.warning(f"Failed to normalize object reference: {e}")
                        oi['object'] = None


def update_event_involvements(data: Dict) -> Dict:
    """Update object involvement counts based on events."""
    object_involvements = {}
    
    # Count involvements across all scenes
    for episode in data['episodes']:
        for scene in episode['scenes']:
            if 'extracted_data' in scene:
                for event in scene['extracted_data'].get('events', []):
                    for obj_uuid in event.get('object_involvements', []):
                        object_involvements[obj_uuid] = object_involvements.get(obj_uuid, 0) + 1
    
    # Update objects with involvement counts
    if 'entity_registry' in data and 'objects' in data['entity_registry']:
        for obj_uuid in data['entity_registry']['objects']:
            if obj_uuid in object_involvements:
                data['entity_registry']['objects'][obj_uuid]['event_involvements'] = object_involvements[obj_uuid]
            else:
                data['entity_registry']['objects'][obj_uuid]['event_involvements'] = 0
    
    return data