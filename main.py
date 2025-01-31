# main.py
import asyncio
import logging
from pathlib import Path
from typing import Dict, List, Optional, Set, Union
from baml_client.type_builder import TypeBuilder
from baml_client import b
from thefuzz import fuzz
from entity_registry import EntityRegistry
from entity_normalizer import EntityNormalizer
from entity_extractors import extract_and_register_entities
from scene_processor import process_scene, format_dialogue
from utils import (
    load_json,
    save_json,
    load_and_concatenate_context,
    setup_logging,
    validate_file_paths,
    create_backup,
    Timer
)
from post_processor import (
    clean_entity_references,
    clean_scene_references,
    update_event_involvements
)

from entity_cleaners import (  
    clean_agent_data,
    clean_object_data,
    clean_location_data,
    clean_organization_data,
    clean_event_data
)

# Constants

INPUT_JSON_PATH = Path("source_docs/ai_fanfic/doctor_who/quantum_archive_transcript.json")
CONTEXT_FILES = [
    Path("ssource_docs/ai_fanfic/doctor_who/quantum_archive_novelization.txt")
]
OUTPUT_JSON_PATH = Path("output/pre_processed/quantum_archive_graph.json")

# INPUT_JSON_PATH = Path("source_docs/ai_fanfic/west_wing/fault_lines_transcript.json")
# CONTEXT_FILES = [
#     Path("source_docs/ai_fanfic/west_wing/fault_lines_novelization.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/pre_processed/fault_lines_graph.json")

# INPUT_JSON_PATH = Path("source_docs/ai_fanfic/peep_show/networking_event_transcript.json")
# CONTEXT_FILES = [
#     Path("source_docs/ai_fanfic/peep_show/networking_event_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/pre_processed/networking_event_graph.json")

# INPUT_JSON_PATH = Path("source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_transcript.json")
# CONTEXT_FILES = [
#     Path("source_docs/ai_fanfic/star_trek_tng/echoes_of_the_past_treatment.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/pre_processed/echoes_of_the_pastA.json")

# INPUT_JSON_PATH = Path("source_docs/doctor_who/doctor10/json/blink_transcript.json")
# CONTEXT_FILES = [
#     Path("source_docs/doctor_who/doctor10/resource/txt/blink_summary.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/pre_processed/blink_extracted.json")

# INPUT_JSON_PATH = Path("source_docs/doctor_who/doctor1/json/mission_to_the_unknown_transcript.json")
# CONTEXT_FILES = [
#     Path("source_docs/doctor_who/doctor1/resource/novel/mission_to_the_unknown_novel.txt")
# ]
# OUTPUT_JSON_PATH = Path("output/pre_processed/mission_to_the_unknown_graph.json")


LOG_DIR = Path("logs")

logger = logging.getLogger(__name__)

async def process_episode(
    episode_data: Dict,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder,
    known_agent_uuids: List[str],
    known_object_uuids: List[str]
) -> Dict:
    """Process a single episode."""
    logger.info(f"Processing episode: {episode_data.get('Episode', 'Unknown Episode')}")
    
    scenes = episode_data.get("Scenes", [])
    processed_scenes = []
    
    for i, scene in enumerate(scenes):
        scene_number = i + 1
        next_scene_uuid = f"scene-{scene_number+1:03}" if scene_number < len(scenes) else None
        
        # Extract scene location here
        scene_location = scene.get("Scene", "Unknown Location")  
        
        processed_scene = await process_scene(
            scene,
            story_context,
            scene_number,
            next_scene_uuid=next_scene_uuid,
            entity_registry=entity_registry,
            tb=tb,
            known_agent_uuids=known_agent_uuids,
            known_object_uuids=known_object_uuids
        )
        processed_scenes.append(processed_scene)

    return {
        "episode_title": episode_data.get("Episode"),
        "scenes": processed_scenes
    }

async def first_pass_extraction(
    story_json: Dict,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> None:
    """First pass: extract all entities across all scenes."""
    scene_number = 1  # Initialize to 1
    
    for episode in story_json.get("Episodes", []):
        for scene in episode.get("Scenes", []):
            logger.info(f"First pass processing scene {scene_number}")
            scene_text = format_dialogue(
                    scene.get("Dialogue", []), 
                    scene_number,
                    scene.get("Scene", "Unknown Location")
                )
            
            await extract_and_register_entities(
                scene,
                scene_text,
                story_context,
                entity_registry,
                tb
            )
            
            scene_number += 1
    
    entity_registry.debug_registry()

async def second_pass_processing(
    story_json: Dict,
    story_context: str,
    entity_registry: EntityRegistry,
    tb: TypeBuilder
) -> List[Dict]:
    """Second pass: process episodes in detail."""
    logger.info("Second pass: processing episodes in detail")
    
    processed_episodes = []
    for ep in story_json.get("Episodes", []):
        # Extract agent and object UUIDs
        known_agent_uuids = [agent["uuid"] for agent in entity_registry.agents.values()]
        known_object_uuids = [object["uuid"] for object in entity_registry.objects.values()]
        
        processed_episodes.append(
            await process_episode(
                ep,
                story_context,
                entity_registry,
                tb,
                known_agent_uuids=known_agent_uuids,
                known_object_uuids=known_object_uuids
            )
        )
    
    return processed_episodes


def build_final_output(
    story_json: Dict,
    processed_episodes: List[Dict],
    entity_registry: EntityRegistry
) -> Dict:
    """Build the final output structure."""
    return {
        "serial": story_json.get("Story", "Untitled Serial"),
        "episodes": processed_episodes,
        "entity_registry": {
            "agents": entity_registry.agents,
            "objects": entity_registry.objects,
            "locations": entity_registry.locations,
            "organizations": entity_registry.organizations,
        }
    }

async def process_story(story_json: Dict, story_context: str) -> Dict:
    """Process entire story, managing the two-pass approach with enhanced entity handling."""
    logger.info(f"Processing story: {story_json.get('Story', 'Untitled Serial')}")

    entity_registry = EntityRegistry()
    tb = TypeBuilder()

    # First pass: gather entities
    logger.info("First pass: extracting & registering global entities")
    await first_pass_extraction(story_json, story_context, entity_registry, tb)

    # Post first-pass processing
    logger.info("Processing entities after first pass")
    merge_duplicate_entities(entity_registry)  # This merges agents, objects, locations

    # Second pass: process episodes in detail
    logger.info("Second pass: processing episodes in detail")
    processed_episodes = await second_pass_processing(
        story_json,
        story_context,
        entity_registry,
        tb
    )

    # Merge duplicate organizations (after second pass and before updating relationships)
    logger.info("Merging duplicate organizations")
    merge_duplicate_organizations(entity_registry)  # Only call this once!

    # Update relationships and perform other scene-level post-processing
    for episode_idx, episode in enumerate(story_json.get("Episodes", []), 1):
        processed_scenes = []
        scene_count = len(episode.get("Scenes", []))

        for scene_idx, scene in enumerate(episode.get("Scenes", []), 1):
            # Determine next scene UUID
            next_scene_uuid = f"scene-{scene_idx + 1:03}" if scene_idx < scene_count else None

            # Process scene with enhanced context
            scene_result = await process_scene(
                scene,
                story_context,
                scene_idx,
                next_scene_uuid=next_scene_uuid,
                entity_registry=entity_registry,
                tb=tb,
                known_agent_uuids=list(entity_registry.agents.keys()),
                known_object_uuids=list(entity_registry.objects.keys())
            )
            processed_scenes.append(scene_result)

    # Synchronize organization memberships after all processing
    logger.info("Synchronizing organization memberships")
    synchronize_organization_memberships(entity_registry)

    # Validate affiliations
    logger.info("Validating affiliations")
    validate_affiliations(entity_registry)

    # Convert EntityRegistry to clean dictionary for final output
    final_data = {
        "story_title": story_json.get("Story", "Untitled Serial"),
        "episodes": processed_episodes,
        "entity_registry": build_clean_registry(entity_registry)
    }

    # Post-processing pipeline
    logger.info("Running post-processing pipeline")

    # Clean up entity references
    final_data = clean_entity_references(final_data)

    # Update event involvements
    final_data = update_event_involvements(final_data)

    # Final validation
    logger.info("Performing final validation")
    validate_entity_references(final_data)

    logger.info("Post-processing complete")
    return final_data

def validate_participation(p: Dict, entity_registry: EntityRegistry) -> bool:
    """Validate an agent participation entry."""
    if not p.get('agent') or not p.get('event'):
        return False
    return (entity_registry.get_entity_details('agents', p['agent']) is not None and
            p['event'].startswith('event-'))

def validate_involvement(i: Dict, entity_registry: EntityRegistry) -> bool:
    """Validate an object involvement entry."""
    if not i.get('object') or not i.get('event'):
        return False
    return (entity_registry.get_entity_details('objects', i['object']) is not None and
            i['event'].startswith('event-'))

def infer_scene_location(
    title: str,
    description: str,
    entity_registry: EntityRegistry
) -> Optional[str]:
    """Infer location from scene title and description."""
    # First try to match with title
    for uuid, loc in entity_registry.locations.items():
        if (entity_registry.normalize_name(loc['name']) in 
            entity_registry.normalize_name(title)):
            return uuid
    
    # Then try with description
    for uuid, loc in entity_registry.locations.items():
        if (entity_registry.normalize_name(loc['name']) in 
            entity_registry.normalize_name(description)):
            return uuid
    
    return None

async def infer_object_owner(
    dialogues: List[Dict],
    obj_uuid: str,
    agent_uuids: List[str],
    story_context: str,
    tb: TypeBuilder
) -> Optional[str]:
    """Infer object owner from dialogue context."""
    dialogue_text = format_dialogue(dialogues, 0, "Contextual Location")  # scene number not important here
    owner = await b.InferObjectOwner(
        scene_text=dialogue_text,
        object_uuid=obj_uuid,
        agent_uuids=agent_uuids,
        baml_options={"tb": tb}
    )
    return owner if owner else None

def infer_agent_organization(
    agent: Dict,
    participation: Dict,
    entity_registry: EntityRegistry
) -> Optional[str]:
    """Infer agent's organization based on context."""
    
    # Try to infer from agent's title or description
    for uuid, org in entity_registry.organizations.items():
        org_name = entity_registry.normalize_name(org['name'])
        if (org_name in entity_registry.normalize_name(agent.get('title', '')) or
            org_name in entity_registry.normalize_name(agent.get('description', ''))):
            return uuid
    
    return None

def merge_duplicate_entities(entity_registry: EntityRegistry) -> None:
    """Merge duplicate entities across all entity types."""
    logger.info("Merging duplicate entities")

    # Merge duplicate agents
    agent_names = {}
    for uuid, agent in list(entity_registry.agents.items()):
        normalized_name = entity_registry.normalize_name(agent['name'])
        if normalized_name in agent_names:
            existing_uuid = agent_names[normalized_name]
            existing_agent = entity_registry.agents[existing_uuid]
            merged_agent = merge_agent_data(existing_agent, agent)
            entity_registry.agents[existing_uuid] = merged_agent
            del entity_registry.agents[uuid]
            logger.info(f"Merged agent {uuid} into {existing_uuid}")
        else:
            agent_names[normalized_name] = uuid

    # Merge duplicate objects
    merge_duplicate_objects(entity_registry)

    # Merge duplicate locations
    merge_duplicate_locations(entity_registry)

    # Merge duplicate organizations
    merge_duplicate_organizations(entity_registry)

def merge_agent_data(agent1: Dict, agent2: Dict) -> Dict:
    """Merge two agent dictionaries, combining their attributes intelligently."""
    merged = agent1.copy()
    
    # Combine traits
    merged['traits'] = list(set(agent1.get('traits', []) + agent2.get('traits', [])))
    
    # Take the longer description
    if len(agent2.get('description', '')) > len(agent1.get('description', '')):
        merged['description'] = agent2['description']
    
    # Combine spheres of influence if different
    if agent1.get('sphere_of_influence') != agent2.get('sphere_of_influence'):
        spheres = [s for s in [agent1.get('sphere_of_influence'), agent2.get('sphere_of_influence')] if s]
        merged['sphere_of_influence'] = ' & '.join(spheres)
    
    # Keep the most specific title
    if agent2.get('title') and (not agent1.get('title') or len(agent2['title']) > len(agent1['title'])):
        merged['title'] = agent2['title']
    
    return merged

def merge_duplicate_objects(entity_registry: EntityRegistry) -> None:
    """Merge duplicate objects based on normalized names."""
    object_names = {}
    for uuid, obj in list(entity_registry.objects.items()):
        normalized_name = entity_registry.normalize_name(obj['name'])
        if normalized_name in object_names:
            # Merge into existing object
            existing_uuid = object_names[normalized_name]
            existing_obj = entity_registry.objects[existing_uuid]
            merged_obj = merge_object_data(existing_obj, obj)
            entity_registry.objects[existing_uuid] = merged_obj
            # Remove duplicate
            del entity_registry.objects[uuid]
            logger.info(f"Merged object {uuid} into {existing_uuid}")
        else:
            object_names[normalized_name] = uuid

def merge_duplicate_locations(entity_registry: EntityRegistry) -> None:
    """Merge duplicate locations based on normalized names."""
    location_names = {}
    for uuid, loc in list(entity_registry.locations.items()):
        normalized_name = entity_registry.normalize_name(loc['name'])
        if normalized_name in location_names:
            # Merge into existing location
            existing_uuid = location_names[normalized_name]
            existing_loc = entity_registry.locations[existing_uuid]
            merged_loc = merge_location_data(existing_loc, loc)
            entity_registry.locations[existing_uuid] = merged_loc
            # Remove duplicate
            del entity_registry.locations[uuid]
            logger.info(f"Merged location {uuid} into {existing_uuid}")
        else:
            location_names[normalized_name] = uuid

# main.py

def synchronize_organization_memberships(entity_registry: EntityRegistry) -> None:
    """Synchronize organization memberships with agent affiliations."""
    logger.info("Synchronizing organization memberships...")

    organizations = entity_registry.organizations
    agents = entity_registry.agents

    # Ensure all agents' affiliations are reflected in organizations' members lists
    for agent_uuid, agent in agents.items():
        affiliated_org_uuid = agent.get('affiliated_org')
        if affiliated_org_uuid:
            if affiliated_org_uuid in organizations:
                organization = organizations[affiliated_org_uuid]
                if 'members' not in organization:
                    organization['members'] = []
                if agent_uuid not in organization['members']:
                    organization['members'].append(agent_uuid)
                    logger.debug(f"Added agent {agent_uuid} to organization {affiliated_org_uuid}")
            else:
                logger.warning(f"Agent {agent_uuid} affiliated with non-existent organization {affiliated_org_uuid}")

    # Ensure all organization members have their affiliated_org set correctly
    for org_uuid, organization in organizations.items():
        members = organization.get('members', [])
        for member_uuid in members:
            agent = agents.get(member_uuid)
            if agent:
                if agent.get('affiliated_org') != org_uuid:
                    # Update agent's affiliated_org to reflect membership
                    previous_affiliation = agent.get('affiliated_org')
                    agent['affiliated_org'] = org_uuid
                    logger.debug(
                        f"Set affiliated_org for agent {member_uuid} to {org_uuid} "
                        f"(previously {previous_affiliation})"
                    )
            else:
                logger.warning(
                    f"Organization {org_uuid} has non-existent member {member_uuid}"
                )

    # No need to return anything as EntityRegistry is modified in place

def filter_valid_organizations(organizations: Dict) -> Dict:
    """Filter out entries that aren't actually organizations."""
    invalid_keywords = {
        'species', 'plant', 'animal', 'weapon', 'vehicle', 'location'
    }
    
    return {
        uuid: org for uuid, org in organizations.items()
        if not any(keyword in org.get('description', '').lower() 
                  for keyword in invalid_keywords)
    }

def create_canonical_mapping(organizations: Dict) -> Dict:
    """Create mapping of similar organization names to canonical UUID."""
    canonical_map = {}
    
    for uuid, org in organizations.items():
        name_variants = generate_name_variants(org['name'])
        for variant in name_variants:
            canonical_map[variant] = uuid
            
    return canonical_map

def generate_name_variants(name: str) -> List[str]:
    """Generate possible variants of organization names."""
    variants = {name.lower()}
    
    # Handle common abbreviations
    words = name.split()
    if len(words) > 1:
        abbrev = ''.join(word[0].upper() for word in words)
        variants.add(abbrev)
        
    # Handle parenthetical abbreviations
    if '(' in name and ')' in name:
        base = name.split('(')[0].strip().lower()
        abbrev = name.split('(')[1].split(')')[0].strip().lower()
        variants.add(base)
        variants.add(abbrev)
        
    return list(variants)

def process_agent_affiliations(
    agents: Dict,
    organizations: Dict,
    canonical_map: Dict
) -> None:
    """Process and validate agent affiliations."""
    
    # First pass: collect all affiliations
    agent_orgs = defaultdict(set)
    for agent_uuid, agent in agents.items():
        if agent.get('affiliated_org'):
            org_uuid = resolve_organization_reference(
                agent['affiliated_org'],
                canonical_map
            )
            if org_uuid:
                agent_orgs[agent_uuid].add(org_uuid)
    
    # Second pass: resolve conflicts
    for agent_uuid, agent in agents.items():
        orgs = agent_orgs.get(agent_uuid, set())
        if len(orgs) > 1:
            # Resolve conflicting affiliations
            primary_org = resolve_affiliation_conflicts(
                agent,
                orgs,
                organizations
            )
            agent['affiliated_org'] = primary_org
            if primary_org:
                organizations[primary_org]['members'].append(agent_uuid)
        elif len(orgs) == 1:
            org_uuid = orgs.pop()
            agent['affiliated_org'] = org_uuid
            organizations[org_uuid]['members'].append(agent_uuid)
        else:
            agent['affiliated_org'] = None

def resolve_organization_reference(ref: str, canonical_map: Dict) -> Optional[str]:
    """Resolve organization reference to canonical UUID."""
    if not ref:
        return None
        
    ref_lower = ref.lower()
    
    # Direct UUID match
    if ref in canonical_map.values():
        return ref
        
    # Name variant match
    if ref_lower in canonical_map:
        return canonical_map[ref_lower]
        
    # Fuzzy match
    best_match = None
    best_ratio = 0
    for variant, uuid in canonical_map.items():
        ratio = fuzz.ratio(ref_lower, variant)
        if ratio > 85 and ratio > best_ratio:
            best_match = uuid
            best_ratio = ratio
            
    return best_match

def resolve_affiliation_conflicts(
    agent: Dict,
    org_uuids: Set[str],
    organizations: Dict
) -> Optional[str]:
    """Resolve conflicting organization affiliations."""
    # Score each organization based on various factors
    org_scores = {}
    
    for org_uuid in org_uuids:
        org = organizations[org_uuid]
        score = 0
        
        # Check title match
        if agent.get('title') and org['name'].lower() in agent['title'].lower():
            score += 3
            
        # Check sphere of influence match
        if (agent.get('sphere_of_influence') and 
            org.get('sphere_of_influence') and
            fuzz.ratio(agent['sphere_of_influence'].lower(),
                      org['sphere_of_influence'].lower()) > 70):
            score += 2
            
        # Check description alignment
        if (agent.get('description') and
            org['name'].lower() in agent['description'].lower()):
            score += 1
            
        org_scores[org_uuid] = score
    
    # Return highest scoring organization, or None if no clear winner
    if org_scores:
        max_score = max(org_scores.values())
        if max_score > 0:
            return max(org_scores.items(), key=lambda x: x[1])[0]
    
    return None
    
    # Update registry with merged organizations
    entity_registry.organizations = merged_orgs

def merge_duplicate_organizations(entity_registry: EntityRegistry) -> None:
    """
    Merge duplicate organizations based on normalized names.
    This function now takes an EntityRegistry object and modifies it in place.
    """
    logger.info("Starting organization merge process")

    org_dict = entity_registry.organizations
    merged_orgs = {}
    org_groups = {}  # Groups of similar organization names

    # Group similar organizations
    try:
        for uuid, org in org_dict.items():
            # Validate organization entry
            if not isinstance(org, dict) or 'name' not in org:
                logger.warning(f"Skipping invalid organization entry: {uuid}")
                continue

            normalized_name = entity_registry.normalize_name(org['name'])
            found_match = False

            # Check for similar existing groups
            for group_name in list(org_groups.keys()):
                if fuzz.ratio(normalized_name, group_name) > 85:
                    org_groups[group_name].append((uuid, org))
                    found_match = True
                    break

            if not found_match:
                org_groups[normalized_name] = [(uuid, org)]

    except Exception as e:
        logger.error(f"Error during organization grouping: {str(e)}")
        return  # Exit on error

    # Merge each group
    for group_name, group_orgs in org_groups.items():
        logger.info(f"Merging organization group: {group_name}")
        if not group_orgs:
            continue

        try:
            # Use the first org as base
            base_uuid, base_org = group_orgs[0]
            merged_org = base_org.copy()
            merged_org['members'] = set(base_org.get('members', []))

            # Merge additional orgs
            for other_uuid, other_org in group_orgs[1:]:
                # Merge members
                merged_org['members'].update(other_org.get('members', []))

                # Take longer description if available
                if len(other_org.get('description', '')) > len(merged_org.get('description', '')):
                    merged_org['description'] = other_org['description']

                # Combine spheres of influence if different
                if other_org.get('sphere_of_influence') != merged_org.get('sphere_of_influence'):
                    spheres = {s for s in [
                        merged_org.get('sphere_of_influence'),
                        other_org.get('sphere_of_influence')
                    ] if s}  # Filter None values
                    merged_org['sphere_of_influence'] = ' & '.join(spheres) if spheres else None

                logger.debug(f"Successfully merged organization {other_uuid} into {base_uuid}")

            # Convert members back to list
            merged_org['members'] = list(merged_org['members'])
            merged_orgs[base_uuid] = merged_org

            # Log successful merge
            if len(group_orgs) > 1:
                logger.info(
                    f"Merged organizations: {[org['name'] for _, org in group_orgs]} "
                    f"into {merged_org['name']}"
                )

            # Update agents' affiliated_org to point to the merged organization
            for _, org in group_orgs[1:]:
                for member_uuid in org.get('members', []):
                    agent = entity_registry.agents.get(member_uuid)
                    if agent and agent.get('affiliated_org') == org['uuid']:
                        agent['affiliated_org'] = base_uuid
                        logger.debug(
                            f"Updated affiliated_org for agent {member_uuid} to {base_uuid} after merging."
                        )

        except Exception as e:
            logger.error(f"Error merging organization group: {str(e)}")
            # Add unmerged orgs to result
            for uuid, org in group_orgs:
                merged_orgs[uuid] = org

    # Update the entity registry with merged organizations
    entity_registry.organizations = merged_orgs

    # No return needed as EntityRegistry is modified in place


def validate_affiliations(entity_registry: EntityRegistry) -> None:
    """Validate that all agent affiliations point to valid organizations."""
    for agent_uuid, agent in entity_registry.agents.items():
        if 'affiliated_org' in agent:
            org_uuid = agent['affiliated_org']
            if org_uuid not in entity_registry.organizations:
                logger.warning(
                    f"Agent {agent_uuid} has an invalid affiliated_org: {org_uuid}"
                )

def merge_object_data(obj1: Dict, obj2: Dict) -> Dict:
    """Merge two object dictionaries, combining their attributes intelligently."""
    merged = obj1.copy()
    
    # Take the longer description
    if len(obj2.get('description', '')) > len(obj1.get('description', '')):
        merged['description'] = obj2['description']
    
    # Combine purposes if different
    if obj1.get('purpose') != obj2.get('purpose'):
        purposes = [p for p in [obj1.get('purpose'), obj2.get('purpose')] if p]
        merged['purpose'] = ' & '.join(purposes)
    
    # Take the more detailed significance
    if len(obj2.get('significance', '')) > len(obj1.get('significance', '')):
        merged['significance'] = obj2['significance']
    
    # Keep the original owner if it exists
    if obj2.get('original_owner') and not obj1.get('original_owner'):
        merged['original_owner'] = obj2['original_owner']
    
    return merged

def merge_location_data(loc1: Dict, loc2: Dict) -> Dict:
    """Merge two location dictionaries, combining their attributes intelligently."""
    merged = loc1.copy()
    
    # Take the longer description
    if len(loc2.get('description', '')) > len(loc1.get('description', '')):
        merged['description'] = loc2['description']
    
    # Keep the more specific type
    if loc2.get('type') and (not loc1.get('type') or len(loc2['type']) > len(loc1['type'])):
        merged['type'] = loc2['type']
    
    return merged

def merge_organization_data(org1: Dict, org2: Dict) -> Dict:
    """Merge two organization dictionaries, combining their attributes intelligently."""
    merged = org1.copy()
    
    # Take the longer description
    if len(org2.get('description', '')) > len(org1.get('description', '')):
        merged['description'] = org2['description']
    
    # Combine spheres of influence if different
    if org1.get('sphere_of_influence') != org2.get('sphere_of_influence'):
        spheres = [s for s in [org1.get('sphere_of_influence'), org2.get('sphere_of_influence')] if s]
        merged['sphere_of_influence'] = ' & '.join(spheres)
    
    # Combine members lists, removing duplicates
    members1 = set(org1.get('members', []))
    members2 = set(org2.get('members', []))
    merged['members'] = list(members1.union(members2))
    
    return merged

def clean_scene_data(scene_result: Dict, entity_registry: EntityRegistry) -> Dict:
    """Clean and validate scene-level data."""
    if 'extracted_data' not in scene_result:
        return scene_result
    
    data = scene_result['extracted_data']
    
    # Clean metadata
    if 'metadata' in data:
        # Only infer location if it's missing or 'unknown'
        if not data['metadata'].get('location') or data['metadata'].get('location') == 'location-unknown':
            # Try to infer location from scene title or description
            inferred_location = infer_scene_location(
                data['metadata'].get('title', ''),
                data['metadata'].get('description', ''),
                entity_registry
            )
            if inferred_location:
                data['metadata']['location'] = inferred_location

    # Clean events
    if 'events' in data:
        data['events'] = [clean_event_data(event, entity_registry) for event in data['events']]

    # Clean participations and involvements
    if 'agent_participations' in data:
        data['agent_participations'] = [
            p for p in data['agent_participations']
            if validate_participation(p, entity_registry)
        ]
    
    if 'object_involvements' in data:
        data['object_involvements'] = [
            i for i in data['object_involvements']
            if validate_involvement(i, entity_registry)
        ]

    return scene_result

async def update_entity_relationships(
    scene_result: Dict,
    entity_registry: EntityRegistry,
    story_context: str,
    tb: TypeBuilder
) -> None:
    """Update entity relationships based on scene content."""
    if 'extracted_data' not in scene_result:
        return

    data = scene_result['extracted_data']
    
    # Update object ownership
    for event in data.get('events', []):
        for obj_uuid in event.get('object_involvements', []):
            obj = entity_registry.get_entity_details('objects', obj_uuid)
            if obj and not obj.get('original_owner'):
                # Try to infer owner from context
                owner = await infer_object_owner(
                    scene_result['original_scene_data'].get('Dialogue', []),
                    obj_uuid,
                    list(entity_registry.agents.keys()),
                    story_context,
                    tb
                )
                if owner:
                    obj['original_owner'] = owner

    # Update organization memberships
    for ap in data.get('agent_participations', []):
        agent = entity_registry.get_entity_details('agents', ap['agent'])
        if agent and not agent.get('affiliated_org'):
            # Try to infer organization from context
            org = infer_agent_organization(
                agent,
                ap,
                entity_registry
            )
            if org:
                agent['affiliated_org'] = org
                # Add agent to organization's members
                org_data = entity_registry.get_entity_details('organizations', org)
                if org_data and agent['uuid'] not in org_data.get('members', []):
                    if 'members' not in org_data:
                        org_data['members'] = []
                    org_data['members'].append(agent['uuid'])

def build_clean_registry(entity_registry: EntityRegistry) -> Dict:
    return {
        "agents": {
            uuid: clean_agent_data(agent)
            for uuid, agent in entity_registry.agents.items()
        },
        "objects": {
            uuid: clean_object_data(obj, entity_registry)  # Fixed: passing entity_registry
            for uuid, obj in entity_registry.objects.items()
        },
        "locations": {
            uuid: clean_location_data(loc)
            for uuid, loc in entity_registry.locations.items()
        },
        "organizations": {
            uuid: clean_organization_data(org)
            for uuid, org in entity_registry.organizations.items()
        }
    }

def validate_entity_references(data: Dict) -> None:
    """Validate all entity references in the final data structure."""
    logger.info("Validating entity references")
    
    registry = data['entity_registry']
    valid_agents = set(registry['agents'].keys())
    valid_objects = set(registry['objects'].keys())
    valid_locations = set(registry['locations'].keys())
    valid_organizations = set(registry['organizations'].keys())
    
    errors = []

    # Validate episodes
    for episode in data['episodes']:
        for scene in episode['scenes']:
            if 'extracted_data' in scene:
                # Validate metadata
                if scene['extracted_data'].get('metadata', {}).get('location'):
                    if scene['extracted_data']['metadata']['location'] not in valid_locations:
                        errors.append(f"Invalid location reference: {scene['extracted_data']['metadata']['location']}")

                # Validate events
                for event in scene['extracted_data'].get('events', []):
                    for agent_uuid in event.get('agent_participations', []):
                        if agent_uuid not in valid_agents:
                            errors.append(f"Invalid agent reference in event: {agent_uuid}")
                    for obj_uuid in event.get('object_involvements', []):
                        if obj_uuid not in valid_objects:
                            errors.append(f"Invalid object reference in event: {obj_uuid}")

    if errors:
        logger.warning("Entity reference validation errors found:")
        for error in errors:
            logger.warning(error)

async def user_confirmation() -> bool:
    """Get user confirmation to proceed."""
    while True:
        ans = input("Context loaded. Continue processing? (y/n): ").lower()
        if ans in ["y", "n"]:
            break
    return ans == "y"

async def async_main():
    """Main async entry point."""
    # Setup logging
    setup_logging(LOG_DIR)
    logger.info("Starting story processing...")

    # Validate paths
    if not validate_file_paths(INPUT_JSON_PATH, OUTPUT_JSON_PATH, CONTEXT_FILES):
        logger.error("File path validation failed")
        return

    # Create backup if output exists
    if OUTPUT_JSON_PATH.exists():
        create_backup(OUTPUT_JSON_PATH)

    # Load story and context
    with Timer("Loading story data"):
        story_data = load_json(INPUT_JSON_PATH)
    
    with Timer("Loading context"):
        story_context = load_and_concatenate_context(CONTEXT_FILES)

    # Get user confirmation
    if not await user_confirmation():
        logger.info("Aborting as per user request.")
        return

    # Process
    with Timer("Story processing"):
        final_data = await process_story(story_data, story_context)

    # Save output
    with Timer("Saving output"):
        save_json(final_data, OUTPUT_JSON_PATH)
    
    logger.info("Processing complete. Output saved.")

def main():
    """Main entry point."""
    asyncio.run(async_main())

if __name__ == "__main__":
    main()