# context.py

import uuid
import logging
from typing import Dict, Any, List, Union, Type, Optional, cast
from baml_client.types import Agent, Organization, Location, Object
from utils import normalize_identifier, is_close_match, generate_uuid
from entity_registry import EntityRegistry

def normalize_name(name: str) -> str:
    """
    Normalize an entity name by stripping whitespace and converting to lowercase.
    """
    return name.strip().lower() if name else ""

class GlobalContext:
    """
    The GlobalContext holds story-wide shared state, including:
      - The entity registry, which tracks all agents, objects, locations, and organizations.
      - Scene summaries to help build a cohesive story context for BAML calls.
      - Processed episodes for reference and validation.
    """

    def __init__(self, context_documents: str = ""):
        self.entity_registry = EntityRegistry()
        # Keep a list of scene metadata summaries (for example, scene titles).
        self.scene_summaries: List[Dict[str, Any]] = []
        self.context_documents = context_documents
        self.processed_episodes: List[Any] = []
        self.entity_resolution_performed = False

    def update_with_scene(self, extracted_data: Dict[str, Any]) -> None:
        """
        Update the global context using extracted data from a scene.
        Typically, we add the scene metadata to our context.
        """
        metadata = extracted_data.get("metadata", {})
        if metadata:
            self.scene_summaries.append(metadata)

    def get_story_summary(self) -> str:
        """
        Generates a summary string of the current story context based on the global context.
        Includes scene summaries and optionally context documents.
        """
        summary_lines = []

        # Add context documents to the summary
        if self.context_documents:
            summary_lines.append("Context Documents:")
            summary_lines.append(self.context_documents)

        # Summarize scene metadata
        if self.scene_summaries:
            summary_lines.append("Scene Summaries:")
            for scene_data in self.scene_summaries:
                summary_lines.append(
                    f"  Scene: {scene_data.get('title', 'Untitled')}, UUID: {scene_data.get('uuid', 'N/A')}, Location: {scene_data.get('location', 'N/A')}"
                )

        return "\n".join(summary_lines)

    def get_registry_context(self) -> str:
        """
        Generates a summarized view of all registered entities, useful for BAML prompts.
        """
        summary_lines = []
        entities = self.entity_registry.get_all_entities()
        for entity_type, entity_list in entities.items():
            if entity_list:
                summary_lines.append(f"{entity_type.capitalize()}:")
                for entity in entity_list:
                    if entity_type == "agents":
                        summary_lines.append(
                            f"  Agent: {entity.name}, UUID: {entity.uuid}, Affiliated Org: {entity.affiliated_org}, Description: {entity.description}"
                        )
                    elif entity_type == "organizations":
                        summary_lines.append(
                            f"  Organization: {entity.name}, UUID: {entity.uuid}, Members: {', '.join(entity.members or [])}, Description: {entity.description}"
                        )
                    elif entity_type == "locations":
                        summary_lines.append(
                            f"  Location: {entity.name}, UUID: {entity.uuid}, Type: {entity.type}, Description: {entity.description}"
                        )
                    elif entity_type == "objects":
                        summary_lines.append(
                            f"  Object: {entity.name}, UUID: {entity.uuid}, Original Owner: {entity.original_owner}, Description: {entity.description}"
                        )
        return "\n".join(summary_lines)

    def track_scene_entity(self, scene_number: int, entity_type: str, entity: Any) -> None:
        """
        Track an entity as being relevant to a specific scene.
        
        Args:
            scene_number: The scene number where the entity appears
            entity_type: The type of entity (agents, objects, locations, organizations)
            entity: The entity object to track
        """
        # Initialize scene entity tracking if it doesn't exist
        if not hasattr(self, 'scene_entities'):
            self.scene_entities = {}
        
        # Initialize tracking for this scene if it doesn't exist
        if scene_number not in self.scene_entities:
            self.scene_entities[scene_number] = {
                "agents": set(),
                "objects": set(),
                "locations": set(),
                "organizations": set()
            }
        
        # Add entity UUID to the tracked set for this scene
        if hasattr(entity, 'uuid'):
            self.scene_entities[scene_number][entity_type].add(entity.uuid)

    def get_scene_entities(self, scene_number: int, entity_types: List[str] = None) -> Dict[str, List[Any]]:
        """
        Get entities that are relevant to a specific scene.
        
        Args:
            scene_number: The scene number to get entities for
            entity_types: Optional list of entity types to include (e.g., ["agents", "objects"])
                        If None, includes all entity types
        
        Returns:
            Dictionary of entity lists by type
        """
        result = {}
        
        # If we don't have scene-specific tracking, return empty result
        if not hasattr(self, 'scene_entities') or scene_number not in self.scene_entities:
            return {entity_type: [] for entity_type in (entity_types or ["agents", "objects", "locations", "organizations"])}
        
        # Filter by requested entity types
        types_to_include = entity_types or ["agents", "objects", "locations", "organizations"]
        
        # For each requested entity type, find the corresponding entities
        for entity_type in types_to_include:
            if entity_type in self.scene_entities[scene_number]:
                # Get UUIDs of entities for this scene
                entity_uuids = self.scene_entities[scene_number][entity_type]
                
                # Get the actual entity objects from the registry
                if entity_type == "agents":
                    result[entity_type] = [self.entity_registry.agents.get(uuid) for uuid in entity_uuids 
                                        if uuid in self.entity_registry.agents]
                elif entity_type == "objects":
                    result[entity_type] = [self.entity_registry.objects.get(uuid) for uuid in entity_uuids 
                                        if uuid in self.entity_registry.objects]
                elif entity_type == "locations":
                    result[entity_type] = [self.entity_registry.locations.get(uuid) for uuid in entity_uuids 
                                        if uuid in self.entity_registry.locations]
                elif entity_type == "organizations":
                    result[entity_type] = [self.entity_registry.organizations.get(uuid) for uuid in entity_uuids 
                                        if uuid in self.entity_registry.organizations]
        
        return result

    def format_scene_entity_context(self, scene_number: int, entity_types: List[str] = None) -> str:
        """
        Format scene-specific entity context for use in prompts.
        
        Args:
            scene_number: The scene number to get context for
            entity_types: Optional list of entity types to include
        
        Returns:
            Formatted string with entity information
        """
        scene_entities = self.get_scene_entities(scene_number, entity_types)
        
        lines = []
        for entity_type, entities in scene_entities.items():
            if entities:
                lines.append(f"{entity_type.capitalize()}:")
                for entity in entities:
                    if entity is None:
                        continue
                        
                    if entity_type == "agents":
                        lines.append(f"  - {entity.name} ({entity.uuid}): affiliated_org = {entity.affiliated_org or 'None'}")
                    elif entity_type == "objects":
                        lines.append(f"  - {entity.name} ({entity.uuid}): owner = {entity.original_owner or 'None'}")
                    elif entity_type == "locations":
                        lines.append(f"  - {entity.name} ({entity.uuid}): type = {entity.type}")
                    elif entity_type == "organizations":
                        lines.append(f"  - {entity.name} ({entity.uuid})")
        
        return "\n".join(lines)

    async def reconcile_primary_entities(self) -> None:
        """
        Perform entity resolution on all primary entities in the registry.
        This should be called after all primary entities have been extracted
        and before secondary entities are processed.
        """
        if self.entity_resolution_performed:
            logging.warning("Entity resolution has already been performed. Skipping.")
            return
            
        await self.entity_registry.reconcile_entities()
        self.entity_registry.update_agent_affiliations()
        self.entity_resolution_performed = True

    def update_references_after_resolution(self) -> None:
        """
        Update all entity references in processed episodes after resolution.
        This ensures consistent references throughout the knowledge graph.
        """
        if not self.processed_episodes:
            return
            
        self.entity_registry.update_references_after_resolution(self.processed_episodes)