# File: utils.py
import uuid
import re
from typing import Dict, Any, Optional
from thefuzz import fuzz

def generate_uuid(entity_type: str, identifier: str) -> str:
    """
    Generates a UUID for a given entity type and identifier.

    Args:
        entity_type: The type of the entity (e.g., "agent", "object", "location").
        identifier: A string identifier unique to the entity within its type.

    Returns:
        A UUID string in the format "entity_type-normalized_identifier".
    """
    normalized_identifier = normalize_identifier(identifier)
    return f"{entity_type}-{normalized_identifier}"

def normalize_identifier(identifier: str) -> str:
    """
    Normalize an identifier for use in UUIDs (Strip, lowercase, and replace spaces with underscores).
    This function is used for creating consistent, unique keys.
    """
    return identifier.strip().lower().replace(" ", "_") if identifier else ""

def normalize_name(name: str) -> str:
    """
    Normalize an entity name for display (strip whitespace, lowercase).
    This function is used for presenting names in a consistent format,
    but NOT for matching or UUID generation.
    """
    return name.strip().lower() if name else ""

def normalize_for_matching(text: str) -> str:
    """
    Normalize text for fuzzy matching (remove punctuation, lowercase, etc.).
    This function is used for comparing strings to find potential duplicates,
    and is more aggressive than normalize_identifier and normalize_name.
    """
    text = text.strip().lower()
    text = re.sub(r'[^\w\s]', '', text)  # Remove punctuation
    # Consider adding stemming/lemmatization here if needed, e.g., using NLTK:
    # from nltk.stem import PorterStemmer
    # stemmer = PorterStemmer()
    # text = ' '.join([stemmer.stem(word) for word in text.split()])
    return text

def normalize_reference(text: str) -> str:
    """
    Normalizes a reference string by removing extra whitespace and converting to lowercase.
    Kept for backwards compatibility; consider consolidating with normalize_identifier.
    """
    return re.sub(r"\s+", " ", text.strip().lower())

def validate_reference(reference: str, valid_prefixes: list) -> bool:
    """
    Validates a reference string against a list of valid prefixes.
    Kept for backwards compatibility.
    """
    return any(reference.startswith(prefix) for prefix in valid_prefixes)

def is_close_match(str1: str, str2: str, threshold: int = 80) -> bool:
    """
    Checks if two strings are a close match using fuzzy matching.
    Now uses normalize_for_matching before comparison.

    Args:
        str1: The first string.
        str2: The second string.
        threshold: The minimum similarity score to be considered a match (0-100).

    Returns:
        True if the strings are a close match, False otherwise.
    """
    return fuzz.ratio(normalize_for_matching(str1), normalize_for_matching(str2)) >= threshold

def format_scene_text(scene: Dict[str, Any]) -> str:
    """
    Combines dialogue and stage directions from a scene dictionary into a single text string.
    """
    parts = []
    if "Scene" in scene:
        parts.append(f"Scene: {scene['Scene']}")

    dialogue = scene.get("Dialogue", [])
    for item in dialogue:
        if "Stage Direction" in item:
            parts.append(f"Stage Direction: {item['Stage Direction']}")
        if "Character" in item and "Line" in item:
            parts.append(f"{item['Character']}: {item['Line']}")

    return "\n".join(parts)