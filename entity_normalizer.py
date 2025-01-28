# entity_normalizer.py
from typing import Dict, List, Optional, Any
import re
import logging

logger = logging.getLogger(__name__)

class EntityNormalizer:
    @staticmethod
    def normalize_name(name: str) -> str:
        """Normalize entity names to a consistent format."""
        if not isinstance(name, str):
            return ""
        # Force lowercase first
        name = name.lower()
        # Remove entity type prefixes
        name = re.sub(r"^(agent|object|location|org)-", "", name)
        # Remove special characters except underscores
        name = re.sub(r'[^\w\s_]', '', name)
        # Replace spaces with underscores
        return re.sub(r'\s+', '_', name.strip())

    @staticmethod
    def normalize_reference(ref_type: str, name: str) -> str:
        """Create a properly formatted entity reference."""
        if not isinstance(name, str):
            return ""
        normalized_name = EntityNormalizer.normalize_name(name)
        return f"{ref_type}-{normalized_name}"

    @staticmethod
    def normalize_owner_reference(owner: Any) -> str:
        """Normalize owner references to proper agent UUIDs."""
        if not isinstance(owner, str):
            return ""
        # Remove any prefix
        owner = re.sub(r"^(agent-|object-)", "", owner)
        # Convert to snake_case
        owner = owner.lower().replace(" ", "_")
        # Remove special characters
        owner = re.sub(r'[^\w_]', '', owner)
        return f"agent-{owner}"

    @staticmethod
    def validate_reference(ref: Any) -> bool:
        """Validate entity reference format."""
        if not isinstance(ref, str):
            return False
        if not ref:
            return False
        return bool(re.match(r"^(agent|object|location|org)-[\w_]+$", ref))

    @staticmethod
    def extract_uuid(entity: Any) -> str:
        """Extract UUID from an entity object or string."""
        if isinstance(entity, str):
            return entity
        if isinstance(entity, dict):
            return entity.get('uuid', '')
        return ''

    @staticmethod
    def merge_duplicate_agents(agents: Dict[str, Dict]) -> Dict[str, Dict]:
        """Merge duplicate agent entries."""
        normalized_agents = {}
        result = {}
        
        for uuid, agent in agents.items():
            normalized_name = EntityNormalizer.normalize_name(agent['name'])
            if normalized_name in normalized_agents:
                # Merge into existing agent
                existing_uuid = normalized_agents[normalized_name]
                existing_agent = result[existing_uuid]
                merged = {
                    **existing_agent,
                    'traits': list(set(existing_agent.get('traits', []) + agent.get('traits', []))),
                    'description': (agent.get('description', '') 
                                 if len(agent.get('description', '')) > len(existing_agent.get('description', ''))
                                 else existing_agent.get('description', '')),
                    'title': (agent.get('title', '') 
                            if len(agent.get('title', '')) > len(existing_agent.get('title', ''))
                            else existing_agent.get('title', ''))
                }
                result[existing_uuid] = merged
            else:
                normalized_agents[normalized_name] = uuid
                result[uuid] = agent.copy()
        
        return result