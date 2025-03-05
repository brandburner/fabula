import json
import sys
from collections import Counter
from typing import Dict, Any, List

def count_entities(data: Dict[str, Any]) -> Dict[str, int]:
    """
    Count entities in a Fabula knowledge graph JSON file.
    
    Args:
        data: The loaded JSON data from a Fabula output file
        
    Returns:
        A dictionary with counts of each entity type
    """
    stats = {
        'agents': 0,
        'organizations': 0,
        'locations': 0,
        'objects': 0,
        'scenes': 0,
        'events': 0,
        'agent_participations': 0,
        'object_involvements': 0
    }
    
    # Count primary entities
    if 'entity_registry' in data:
        registry = data['entity_registry']
        for entity_type in ['agents', 'organizations', 'locations', 'objects']:
            if entity_type in registry:
                stats[entity_type] = len(registry[entity_type])
    
    # Count secondary entities
    if 'episodes' in data:
        for episode in data['episodes']:
            if 'scenes' in episode:
                stats['scenes'] += len(episode['scenes'])
                
                # Count events, agent_participations, and object_involvements
                for scene in episode['scenes']:
                    if 'extracted_data' in scene:
                        extracted = scene['extracted_data']
                        
                        if 'events' in extracted:
                            stats['events'] += len(extracted['events'])
                        
                        if 'agent_participations' in extracted:
                            stats['agent_participations'] += len(extracted['agent_participations'])
                        
                        if 'object_involvements' in extracted:
                            stats['object_involvements'] += len(extracted['object_involvements'])
    
    return stats

def calculate_relations_stats(data: Dict[str, Any]) -> Dict[str, Dict[str, int]]:
    """
    Calculate statistics about relationships between entities.
    
    Args:
        data: The loaded JSON data from a Fabula output file
        
    Returns:
        A dictionary with statistics about entity relationships
    """
    relation_stats = {
        'agent_participations_per_event': Counter(),
        'object_involvements_per_event': Counter(),
        'agents_per_scene': Counter(),
        'objects_per_scene': Counter()
    }
    
    # Process each scene
    if 'episodes' in data:
        for episode in data['episodes']:
            if 'scenes' in episode:
                for scene in episode['scenes']:
                    if 'extracted_data' in scene:
                        extracted = scene['extracted_data']
                        
                        # Count agents and objects per scene
                        scene_agents = set()
                        scene_objects = set()
                        
                        # Process each event
                        if 'events' in extracted:
                            for event in extracted['events']:
                                # Count participations per event
                                agent_count = len(event.get('agent_participations', []))
                                object_count = len(event.get('object_involvements', []))
                                
                                relation_stats['agent_participations_per_event'][agent_count] += 1
                                relation_stats['object_involvements_per_event'][object_count] += 1
                                
                                # Add to scene sets
                                for agent_id in event.get('agent_participations', []):
                                    scene_agents.add(agent_id)
                                
                                for object_id in event.get('object_involvements', []):
                                    scene_objects.add(object_id)
                        
                        # Update scene counters
                        relation_stats['agents_per_scene'][len(scene_agents)] += 1
                        relation_stats['objects_per_scene'][len(scene_objects)] += 1
    
    return relation_stats

def main():
    """Main function to process a Fabula JSON file and print statistics."""
    # Check if a filename was provided
    if len(sys.argv) < 2:
        print("Usage: python fabula_stats.py [filename.json]")
        sys.exit(1)
        
    filename = sys.argv[1]
    
    try:
        # Load the JSON data
        with open(filename, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # Get entity counts
        counts = count_entities(data)
        
        # Get relationship statistics
        relation_stats = calculate_relations_stats(data)
        
        # Print results
        print("\n===== FABULA KNOWLEDGE GRAPH STATISTICS =====\n")
        
        print("Entity Counts:")
        print("--------------")
        for entity_type, count in counts.items():
            print(f"{entity_type.replace('_', ' ').title()}: {count}")
        
        print("\nRelationship Statistics:")
        print("-----------------------")
        
        print("\nAgents per scene:")
        for count, freq in sorted(relation_stats['agents_per_scene'].items()):
            print(f"  {count} agents: {freq} scenes")
        
        print("\nObjects per scene:")
        for count, freq in sorted(relation_stats['objects_per_scene'].items()):
            print(f"  {count} objects: {freq} scenes")
        
        print("\nAgent participations per event:")
        for count, freq in sorted(relation_stats['agent_participations_per_event'].items()):
            print(f"  {count} participations: {freq} events")
        
        print("\nObject involvements per event:")
        for count, freq in sorted(relation_stats['object_involvements_per_event'].items()):
            print(f"  {count} involvements: {freq} events")
        
        # Print some additional useful metrics
        total_events = counts['events']
        total_ap = counts['agent_participations']
        total_oi = counts['object_involvements']
        
        print("\nSummary Metrics:")
        print("---------------")
        print(f"Average agent participations per event: {total_ap / total_events:.2f}")
        print(f"Average object involvements per event: {total_oi / total_events:.2f}")
        print(f"Extraction method: {data.get('extraction_method', 'unknown')}")
        
        # Print validation results if available
        if 'validation_results' in data:
            validation = data['validation_results']
            print(f"\nValidation: {'Passed' if validation.get('is_valid', False) else 'Failed'}")
            if not validation.get('is_valid', False):
                print(f"Errors: {len(validation.get('errors', []))}")
        
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
    except json.JSONDecodeError:
        print(f"Error: '{filename}' is not a valid JSON file")
    except Exception as e:
        print(f"Error: {str(e)}")

if __name__ == "__main__":
    main()