# context.py

import uuid
from typing import Dict, Any, List, Union, Type, Optional, cast
from baml_client.types import Agent, Organization, Location, Object
from utils import normalize_identifier, is_close_match, generate_uuid
from entity_registry import EntityRegistry # <---- CORRECTED IMPORT STATEMENT

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
    """

    def __init__(self, context_documents: str = ""):
        self.entity_registry = EntityRegistry()
        # Keep a list of scene metadata summaries (for example, scene titles).
        self.scene_summaries: List[Dict[str, Any]] = []
        self.context_documents = context_documents
        self.processed_episodes: List[Any] = []

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
        Generates a context string summarizing the current state of the entity registry.
        """
        summary_lines = []

        # Summarize entities
        entities = self.entity_registry.get_all_entities()
        for entity_type, entity_list in entities.items():
            if entity_list:
                summary_lines.append(f"{entity_type.capitalize()}:")
                for entity in entity_list:
                    if entity_type == "agents":
                        summary_lines.append(
                            f"  Agent: {entity.name}, UUID: {entity.uuid}, Affiliated Org: {entity.affiliated_org}"
                        )
                    elif entity_type == "organizations":
                        summary_lines.append(
                            f"  Organization: {entity.name}, UUID: {entity.uuid}, Members: {', '.join(entity.members or [])}"
                        )
                    elif entity_type == "locations":
                        summary_lines.append(
                            f"  Location: {entity.name}, UUID: {entity.uuid}, Type: {entity.type}"
                        )
                    elif entity_type == "objects":
                        summary_lines.append(
                            f"  Object: {entity.name}, UUID: {entity.uuid}, Original Owner: {entity.original_owner}"
                        )

        return "\n".join(summary_lines)