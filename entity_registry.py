# entity_registry.py
from typing import Dict, Optional, List, Any, Tuple
import logging
import re
from fuzzywuzzy import fuzz
from entity_normalizer import EntityNormalizer

logger = logging.getLogger(__name__)

class EntityRegistry:
    """Maintains consistent entity tracking across scenes."""
    def __init__(self):
        self.agents = {}  
        self.objects = {}  
        self.locations = {} 
        self.organizations = {}
        self._debug_matches = {}
        self.normalizer = EntityNormalizer()  # Add this line

    def normalize_name(self, name: str) -> str:
        """Enhanced name normalization."""
        return self.normalizer.normalize_name(name)

    def determine_primary_entity_type(self, entity_name: str, extracted_types: Dict[str, Dict]) -> Optional[Tuple[str, str]]:
        """
        Determine the primary type for an entity that was extracted as multiple types.
        
        Args:
            entity_name: The normalized name of the entity
            extracted_types: Dictionary of form {'agents': {...}, 'objects': {...}, etc}
                            containing the entity data for each type it was extracted as
        
        Returns:
            Tuple of (primary_type, uuid) or None if no determination can be made
        """
        normalized_name = self.normalize_name(entity_name)
        
        # Find all matching entities across types
        found_types = {}
        for type_name, entities in extracted_types.items():
            for uuid, data in entities.items():
                if self.normalize_name(data.get('name', '')) == normalized_name:
                    found_types[type_name] = {
                        'uuid': uuid,
                        'data': data
                    }
        
        if not found_types:
            return None
            
        # Base type hierarchy
        type_scores = {
            'agents': 10,      # Agents take highest precedence
            'organizations': 8, # Organizations next
            'locations': 6,    # Then locations
            'objects': 4       # Objects lowest
        }
        
        # Calculate final scores with context-based adjustments
        final_scores = {}
        for type_name, type_data in found_types.items():
            score = type_scores[type_name]
            entity_data = type_data['data']
            
            # Context-based score adjustments
            if self._has_type_specific_traits(type_name, normalized_name, entity_data):
                score += 2
                
            # Special case: known agent references should strongly favor agent type
            if type_name == 'agents' and self._is_known_agent_reference(normalized_name):
                score += 5
                
            final_scores[type_name] = score
            
        # Get type with highest score
        if not final_scores:
            return None
            
        primary_type = max(final_scores.items(), key=lambda x: x[1])[0]
        uuid = found_types[primary_type]['uuid']
        
        logger.debug(f"Resolved entity '{entity_name}' to primary type '{primary_type}' with uuid '{uuid}'")
        
        return (primary_type, uuid)

    def _has_type_specific_traits(self, type_name: str, name: str, entity_data: Dict) -> bool:
        """Helper method to check for type-specific characteristics."""
        name_lower = name.lower()
        description = entity_data.get('description', '').lower() if entity_data.get('description') else ''

        # Group/collective terms should be organizations
        collective_terms = {
            'workers', 'group', 'team', 'unit', 'force', 'corps',
            'committee', 'staff', 'personnel', 'service'
        }
        
        # Known locations/spaces
        location_terms = {
            'room', 'office', 'building', 'hall', 'wing', 'venue',
            'house', 'center', 'centre', 'area', 'chamber', 'situation room'
        }

        if type_name == 'locations':
            return any(term in name_lower for term in location_terms)
            
        elif type_name == 'organizations':
            return (
                any(term in name_lower for term in collective_terms) or
                any(term in description for term in collective_terms)
            )
            
        elif type_name == 'agents':
            # Enhanced check for human names
            has_full_name = bool(re.search(r'^[A-Z][a-z]+ (?:[A-Z][a-z]+ )*[A-Z][a-z]+$', name))
            
            # If it's a person name or title
            agent_indicators = {
                'president', 'senator', 'secretary', 'ambassador',
                'director', 'chief', 'minister', 'advisor', 'doctor'
            }
            title = entity_data.get('title', '').lower() if entity_data.get('title') else ''
            
            # Person detection
            person_indicators = {'grandmother', 'brother', 'sister', 'father', 'mother', 'aunt', 'uncle'}
            
            # Check for various person indicators
            return (
                has_full_name or
                any(indicator in description for indicator in person_indicators) or
                any(term in name_lower for term in agent_indicators) or
                any(term in title for term in agent_indicators) or
                bool(re.match(r'^[A-Z][a-z]+$', name))  # single-word proper name
            )
        
        return False

    def _is_known_agent_reference(self, normalized_name: str) -> bool:
        """Helper method to check if this matches any known agent patterns."""
        # Check against existing agents
        for agent in self.agents.values():
            if normalized_name == self.normalize_name(agent['name']):
                return True
            if 'agent_id' in agent and normalized_name == agent['agent_id']:
                return True
                
        return False
    
    def find_best_match(self, name: str, registry: Dict[str, Dict[str, Any]]) -> Optional[str]:
        """Find best matching entity using fuzzy matching."""
        logger.debug(f"Finding best match for: {name} in {registry.keys()}")
        
        if not name:
            return None

        # Direct UUID match
        if name in registry:
            self._debug_matches[name] = ('direct_uuid', name)
            logger.debug(f"Found direct match by UUID: {name} -> {name}")
            return name

        normalized = self.normalize_name(name)
        
        # Direct normalized name match
        for uuid, details in registry.items():
            if self.normalize_name(details['name']) == normalized:
                self._debug_matches[name] = ('direct', normalized)
                logger.debug(f"Found direct match: {normalized} -> {uuid}")
                return uuid
            
        # Special agent_id handling
        if registry is self.agents:
            for uuid, details in registry.items():
                if 'agent_id' in details and self.normalize_name(details['agent_id']) == normalized:
                    self._debug_matches[name] = ('agent_id', normalized)
                    logger.debug(f"Found agent_id match: {normalized} -> {uuid}")
                    return uuid

        # Fuzzy matching
        best_match = None
        best_ratio = 0
        for uuid, details in registry.items():
            ratio = fuzz.ratio(normalized, self.normalize_name(details['name']))
            if ratio > 85 and ratio > best_ratio:
                best_match = uuid
                best_ratio = ratio
                self._debug_matches[name] = ('fuzzy', details['name'], ratio)
                logger.debug(f"Found fuzzy match: {normalized} ~ {details['name']} ({ratio}) -> {uuid}")

        return best_match

    def register_entity(self, entity_type: str, entity: Dict) -> Optional[str]:
        """Register an entity and return its UUID."""
        if not entity or not entity.get('name'):
            logger.warning(f"Attempting to register invalid entity: {entity}")
            return None

        normalized_name = self.normalize_name(entity['name'])
        
        # Check across all registries
        current_entities = {
            'agents': self.agents,
            'objects': self.objects,
            'locations': self.locations,
            'organizations': self.organizations
        }
        
        resolution = self.determine_primary_entity_type(normalized_name, current_entities)
        
        if resolution:
            primary_type, existing_uuid = resolution
            if primary_type != entity_type:
                logger.warning(
                    f"Skipping registration of {entity_type} '{entity['name']}' "
                    f"as it exists as {primary_type} {existing_uuid}"
                )
                return None
            
            # Update existing entity with any new information
            existing_entity = getattr(self, primary_type)[existing_uuid]
            self._merge_entity_data(existing_entity, entity)
            return existing_uuid

        # New entity registration
        if 'uuid' not in entity:
            entity['uuid'] = f"{entity_type[:-1]}-{normalized_name}"
        
        registry = getattr(self, entity_type)
        registry[entity['uuid']] = entity
        return entity['uuid']

    def _merge_entity_data(self, existing: Dict, new: Dict) -> None:
        """Helper method to merge new entity data into existing entity."""
        # Update non-null fields
        for key, value in new.items():
            if value is not None and key != 'uuid':
                if isinstance(value, list):
                    # Merge lists without duplicates
                    existing[key] = list(set(existing.get(key, []) + value))
                elif isinstance(value, str) and key in existing:
                    # Take longer string values, handling None
                    existing_value = existing[key]
                    if existing_value is None or (len(value) > len(existing_value)):
                        existing[key] = value
                else:
                    existing[key] = value

    def resolve_reference(self, entity_type: str, reference: str) -> Optional[str]:
        """Resolve an entity reference to its UUID."""
        if not reference:
            return None

        # Try finding in specified type first
        registry = getattr(self, entity_type)
        if uuid := self.find_best_match(reference, registry):
            return uuid
            
        # Check other types
        normalized_ref = self.normalize_name(reference)
        for type_name in ['agents', 'objects', 'locations', 'organizations']:
            if type_name == entity_type:
                continue
                
            registry = getattr(self, type_name)
            if uuid := self.find_best_match(normalized_ref, registry):
                logger.warning(
                    f"Attempted to reference {entity_type} '{reference}' "
                    f"but it exists as {type_name} {uuid}"
                )
                return None
                    
        return None

    def get_entity_details(self, entity_type: str, uuid: str) -> Optional[Dict]:
        """Retrieve entity details by UUID."""
        logger.debug(f"Getting details for {entity_type} with UUID: {uuid}")
        if not uuid:  # Early return for null/empty UUIDs
            return None

        registry = getattr(self, entity_type)
        details = registry.get(uuid)

        if details:
            logger.debug(f"Found details for {entity_type} with UUID: {uuid}")
            return details
        else:
            logger.debug(f"No details found for {entity_type} with UUID: {uuid}")
            return None

    def get_entity_by_name(self, entity_type: str, name: str) -> Optional[Dict]:
        """Retrieve entity details by normalized name."""
        registry = getattr(self, entity_type)
        if uuid := self.find_best_match(name, registry):
            return registry[uuid]
        return None


    def merge_entities(self, entity_type: str, uuid1: str, uuid2: str) -> Optional[str]:
        """Merges two entities of the same type, returning the UUID of the merged entity."""
        registry = getattr(self, entity_type)

        if uuid1 not in registry or uuid2 not in registry:
            logger.warning(f"Cannot merge: One or both entities not found in {entity_type}: {uuid1}, {uuid2}")
            return None

        if uuid1 == uuid2:
            logger.info(f"No merge needed: Entities are the same: {uuid1}")
            return uuid1

        # For now, we'll just keep the first entity and discard the second
        # In the future, implement more sophisticated merging logic here
        logger.info(f"Merging {entity_type} {uuid2} into {uuid1}. Currently, this just keeps {uuid1} and discards {uuid2}.")
        del registry[uuid2]

        return uuid1
    
    def debug_registry(self):
        """Print current registry state for debugging."""
        for entity_type in ['agents', 'objects', 'locations', 'organizations']:
            registry = getattr(self, entity_type)
            logger.debug(f"\n{entity_type.upper()}:")
            for uuid, details in registry.items():
                logger.debug(f"  UUID: {uuid}, Name: {details['name']}, Agent ID: {details.get('agent_id')}")