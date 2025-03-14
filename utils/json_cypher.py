# json_cypher.py

import json
import datetime
from pathlib import Path
from typing import List, Dict, Union, Set
from dataclasses import dataclass
from enum import Enum
import logging
from collections import defaultdict

# Set up logging
logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class RelationshipType(Enum):
    NEXT_SCENE = "NEXT_SCENE"
    OCCURS_IN = "OCCURS_IN"
    NEXT_EVENT = "NEXT_EVENT"
    PARTICIPATES_IN = "PARTICIPATES_IN"
    IN_EVENT = "IN_EVENT"
    INVOLVED_IN = "INVOLVED_IN"
    OWNS = "OWNS"
    AFFILIATED_WITH = "AFFILIATED_WITH"
    PART_OF = "PART_OF"
    LOCATED_IN = "LOCATED_IN"
    # Added relationship types
    APPEARS_IN = "APPEARS_IN"
    HAPPENED_BEFORE = "HAPPENED_BEFORE"
    INTERACTED_WITH = "INTERACTED_WITH"
    CO_PRESENT_WITH = "CO_PRESENT_WITH"
    VISITED_LOCATION = "VISITED_LOCATION"

@dataclass
class CypherStatement:
    statement: str
    priority: int = 0  # Higher numbers execute later

def generate_consistent_uuid(entity_type: str, entity_id: str) -> str:
    """Generates consistent UUIDs across all entity types."""
    clean_id = str(entity_id).lower().replace(" ", "_").replace("-", "_")
    return f"{entity_type}_{clean_id}"

def escape_cypher_string(value: str) -> str:
    """Escapes special characters in strings for Cypher."""
    if not isinstance(value, str):
        return str(value)
    return value.replace("\\", "\\\\").replace("'", "\\'").replace('"', '\\"')

def generate_schema_cleanup() -> List[CypherStatement]:
    """Generates Cypher statements for dropping existing indexes and constraints."""
    cleanup_statements = [
        "DROP INDEX scene_uuid IF EXISTS;",
        "DROP INDEX event_uuid IF EXISTS;",
        "DROP INDEX agent_uuid IF EXISTS;",
        "DROP INDEX object_uuid IF EXISTS;",
        "DROP INDEX agent_participation_uuid IF EXISTS;",
        "DROP INDEX object_involvement_uuid IF EXISTS;",
        "DROP INDEX organization_uuid IF EXISTS;",
        "DROP INDEX location_uuid IF EXISTS;",
        "DROP INDEX episode_uuid IF EXISTS;",
        "DROP CONSTRAINT agent_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT event_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT scene_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT object_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT location_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT organization_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT agent_participation_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT object_involvement_uuid_unique IF EXISTS;",
        "DROP CONSTRAINT episode_uuid_unique IF EXISTS;"
    ]
    return [CypherStatement(stmt, 0) for stmt in cleanup_statements]

def generate_constraints() -> List[CypherStatement]:
    """Generates Cypher statements for creating uniqueness constraints."""
    constraints = [
        "CREATE CONSTRAINT agent_uuid_unique IF NOT EXISTS FOR (a:Agent) REQUIRE a.uuid IS UNIQUE;",
        "CREATE CONSTRAINT event_uuid_unique IF NOT EXISTS FOR (e:Event) REQUIRE e.uuid IS UNIQUE;",
        "CREATE CONSTRAINT scene_uuid_unique IF NOT EXISTS FOR (s:Scene) REQUIRE s.uuid IS UNIQUE;",
        "CREATE CONSTRAINT object_uuid_unique IF NOT EXISTS FOR (o:Object) REQUIRE o.uuid IS UNIQUE;",
        "CREATE CONSTRAINT location_uuid_unique IF NOT EXISTS FOR (l:Location) REQUIRE l.uuid IS UNIQUE;",
        "CREATE CONSTRAINT organization_uuid_unique IF NOT EXISTS FOR (org:Organization) REQUIRE org.uuid IS UNIQUE;",
        "CREATE CONSTRAINT agent_participation_uuid_unique IF NOT EXISTS FOR (ap:AgentParticipation) REQUIRE ap.uuid IS UNIQUE;",
        "CREATE CONSTRAINT object_involvement_uuid_unique IF NOT EXISTS FOR (oi:ObjectInvolvement) REQUIRE oi.uuid IS UNIQUE;",
        "CREATE CONSTRAINT episode_uuid_unique IF NOT EXISTS FOR (ep:Episode) REQUIRE ep.uuid IS UNIQUE;"
    ]
    return [CypherStatement(stmt, 0) for stmt in constraints]

def generate_indexes() -> List[CypherStatement]:
    """Generates Cypher statements for creating indexes."""
    indexes = [
        "CREATE INDEX scene_uuid IF NOT EXISTS FOR (s:Scene) ON (s.uuid);",
        "CREATE INDEX event_uuid IF NOT EXISTS FOR (e:Event) ON (e.uuid);",
        "CREATE INDEX agent_uuid IF NOT EXISTS FOR (a:Agent) ON (a.uuid);",
        "CREATE INDEX object_uuid IF NOT EXISTS FOR (o:Object) ON (o.uuid);",
        "CREATE INDEX agent_participation_uuid IF NOT EXISTS FOR (ap:AgentParticipation) ON (ap.uuid);",
        "CREATE INDEX object_involvement_uuid IF NOT EXISTS FOR (oi:ObjectInvolvement) ON (oi.uuid);",
        "CREATE INDEX organization_uuid IF NOT EXISTS FOR (org:Organization) ON (org.uuid);",
        "CREATE INDEX location_uuid IF NOT EXISTS FOR (l:Location) ON (l.uuid);",
        "CREATE INDEX episode_uuid IF NOT EXISTS FOR (ep:Episode) ON (ep.uuid);"
    ]
    return [CypherStatement(stmt, 0) for stmt in indexes]

def generate_clear_graph() -> CypherStatement:
    """Generates Cypher statement to clear the existing graph."""
    return CypherStatement("MATCH (n) DETACH DELETE n;", 0)

def generate_graph_metadata(source_file: str) -> CypherStatement:
    """Adds metadata about the graph creation process."""
    timestamp = datetime.datetime.now().isoformat()
    query = f"""
    CREATE (m:GraphMetadata {{
        source_file: '{escape_cypher_string(source_file)}',
        creation_timestamp: '{escape_cypher_string(timestamp)}',
        version: '1.0'
    }});
    """
    return CypherStatement(query, 0)

def generate_agent_node_cypher(agent: Dict) -> CypherStatement:
    """Generates Cypher for an Agent node ensuring no duplication."""
    uuid = agent.get("uuid", "")
    name = agent.get("name", "")
    title = agent.get("title", "")
    description = agent.get("description", "")
    traits = json.dumps(agent.get("traits", []))
    sphere_of_influence = agent.get("sphere_of_influence", "")
    
    query = f"""
    MERGE (a:Agent {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        a.name = '{escape_cypher_string(name)}',
        a.title = '{escape_cypher_string(title)}',
        a.description = '{escape_cypher_string(description)}',
        a.traits = {traits},
        a.sphere_of_influence = '{escape_cypher_string(sphere_of_influence)}'
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_organization_node_cypher(org: Dict) -> CypherStatement:
    """Generates Cypher for Organization nodes."""
    uuid = org.get("uuid", "")
    name = org.get("name", "")
    description = org.get("description", "")
    sphere_of_influence = org.get("sphere_of_influence", "")
    
    query = f"""
    MERGE (o:Organization {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        o.name = '{escape_cypher_string(name)}',
        o.description = '{escape_cypher_string(description)}',
        o.sphere_of_influence = '{escape_cypher_string(sphere_of_influence)}'
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_location_node_cypher(location: Dict) -> CypherStatement:
    """Generates Cypher for Location nodes."""
    uuid = location.get("uuid", "")
    name = location.get("name", "")
    description = location.get("description", "")
    type_val = location.get("type", "")
    
    query = f"""
    MERGE (l:Location {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        l.name = '{escape_cypher_string(name)}',
        l.description = '{escape_cypher_string(description)}',
        l.type = '{escape_cypher_string(type_val)}'
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_object_node_cypher(obj: Dict) -> CypherStatement:
    """Generates Cypher for Object nodes."""
    uuid = obj.get("uuid", "")
    name = obj.get("name", "")
    description = obj.get("description", "")
    purpose = obj.get("purpose", "")
    significance = obj.get("significance", "")
    
    query = f"""
    MERGE (o:Object {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        o.name = '{escape_cypher_string(name)}',
        o.description = '{escape_cypher_string(description)}',
        o.purpose = '{escape_cypher_string(purpose)}',
        o.significance = '{escape_cypher_string(significance)}'
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_episode_node_cypher(episode: Dict) -> CypherStatement:
    """Generates Cypher for Episode nodes."""
    title = episode.get("episode_title", "Untitled Episode")
    # Using consistent UUID format
    episode_uuid = generate_consistent_uuid("episode", title)
    description = episode.get("description", "")
    airdate = episode.get("airdate", "")
    
    query = f"""
    MERGE (ep:Episode {{uuid: '{escape_cypher_string(episode_uuid)}'}})
    ON CREATE SET
        ep.title = '{escape_cypher_string(title)}',
        ep.description = '{escape_cypher_string(description)}',
        ep.airdate = '{escape_cypher_string(airdate)}'
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_scene_node_cypher(metadata: Dict) -> CypherStatement:
    """Generates Cypher for Scene nodes and their location relationships."""
    uuid = metadata.get("uuid", "")
    title = metadata.get("title", "")
    description = metadata.get("description", "")
    scene_number = metadata.get("scene_number", 0)
    location_uuid = metadata.get("location")

    query = f"""
    MERGE (s:Scene {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        s.title = '{escape_cypher_string(title)}',
        s.description = '{escape_cypher_string(description)}',
        s.scene_number = {scene_number}
    """
    if location_uuid:
        query += f"""
    WITH s
    MATCH (l:Location {{uuid: '{escape_cypher_string(location_uuid)}'}})
    MERGE (s)-[:LOCATED_IN]->(l)
    """
        logger.info(f"Linking scene {uuid} to location {location_uuid}")
    else:
        logger.warning(f"No location specified for scene {uuid}: {title}")
    query += ";"
    return CypherStatement(query.strip(), 1)

def generate_event_node_cypher(event: Dict) -> CypherStatement:
    """Generates Cypher for Event nodes."""
    uuid = event.get("uuid", "")
    title = event.get("title", "")
    description = event.get("description", "")
    sequence = event.get("sequence_within_scene", 0)
    key_dialogue = json.dumps(event.get("key_dialogue", []))
    
    query = f"""
    MERGE (e:Event {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        e.title = '{escape_cypher_string(title)}',
        e.description = '{escape_cypher_string(description)}',
        e.sequence_within_scene = {sequence},
        e.key_dialogue = {key_dialogue}
    ;
    """
    return CypherStatement(query.strip(), 1)

def generate_agent_participation_node_cypher(participation: Dict) -> CypherStatement:
    """Generates Cypher for AgentParticipation nodes with improved emotional parsing."""
    uuid = participation.get("uuid", "")
    current_status = participation.get("current_status", "")
    emotional_state = participation.get("emotional_state", "")
    
    # Improved emotional state parsing
    emotion_words = []
    for splitter in [" and ", ",", ";", " while ", " but ", " as well as "]:
        if splitter in emotional_state:
            emotion_parts = emotional_state.split(splitter)
            for part in emotion_parts:
                clean_emotion = part.strip().lower()
                if clean_emotion and clean_emotion not in emotion_words:
                    emotion_words.append(clean_emotion)
    
    # If no splitters found, use the whole string
    if not emotion_words and emotional_state:
        emotion_words = [emotional_state.strip().lower()]
    
    emotional_tags = json.dumps(emotion_words)
    active_plans = json.dumps(participation.get("active_plans", []))
    beliefs = json.dumps(participation.get("beliefs", []))
    goals = json.dumps(participation.get("goals", []))
    
    query = f"""
    MERGE (ap:AgentParticipation {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        ap.current_status = '{escape_cypher_string(current_status)}',
        ap.emotional_state = '{escape_cypher_string(emotional_state)}',
        ap.emotional_tags = {emotional_tags},
        ap.active_plans = {active_plans},
        ap.beliefs = {beliefs},
        ap.goals = {goals}
    ;
    """
    return CypherStatement(query.strip(), 2)

def generate_object_involvement_cypher(involvement: Dict) -> CypherStatement:
    """Generates Cypher for ObjectInvolvement nodes."""
    uuid = involvement.get("uuid", "")
    object_uuid = involvement.get("object", "")
    event_uuid = involvement.get("event", "")
    description = involvement.get("description_of_involvement", "")
    before_status = involvement.get("object_status_before_event", "")
    after_status = involvement.get("object_status_after_event", "")
    
    query = f"""
    MERGE (oi:ObjectInvolvement {{uuid: '{escape_cypher_string(uuid)}'}})
    ON CREATE SET
        oi.description = '{escape_cypher_string(description)}',
        oi.status_before = '{escape_cypher_string(before_status)}',
        oi.status_after = '{escape_cypher_string(after_status)}'
    WITH oi
    MATCH (o:Object {{uuid: '{escape_cypher_string(object_uuid)}'}})
    MATCH (e:Event {{uuid: '{escape_cypher_string(event_uuid)}'}})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
    """
    return CypherStatement(query.strip(), 2)

def generate_relationship_cypher(from_uuid: str, to_uuid: str, rel_type: str, 
                               from_label: str, to_label: str) -> CypherStatement:
    """Generates Cypher for creating relationships between nodes."""
    query = f"""
    MATCH (a:{from_label} {{uuid: '{escape_cypher_string(from_uuid)}'}}),
          (b:{to_label} {{uuid: '{escape_cypher_string(to_uuid)}'}})
    MERGE (a)-[:{rel_type}]->(b);
    """
    return CypherStatement(query.strip(), 3)

def generate_ownership_relationship_cypher(object_uuid: str, owner_uuid: str) -> CypherStatement:
    """Generates Cypher for connecting Objects to their owning Agents."""
    query = f"""
    MATCH (o:Object {{uuid: '{escape_cypher_string(object_uuid)}'}}),
          (a:Agent {{uuid: '{escape_cypher_string(owner_uuid)}'}})
    MERGE (a)-[:OWNS]->(o);
    """
    return CypherStatement(query.strip(), 2)

def generate_affiliation_relationship_cypher(agent_uuid: str, org_uuid: str) -> CypherStatement:
    """Generates Cypher for agent-organization affiliations."""
    query = f"""
    MATCH (a:Agent {{uuid: '{escape_cypher_string(agent_uuid)}'}}),
          (o:Organization {{uuid: '{escape_cypher_string(org_uuid)}'}})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
    """
    return CypherStatement(query.strip(), 2)

def generate_scene_episode_relationship(scene_uuid: str, episode_uuid: str) -> CypherStatement:
    """Generates Cypher for connecting a Scene to its Episode."""
    query = f"""
    MATCH (s:Scene {{uuid: '{escape_cypher_string(scene_uuid)}'}}),
          (ep:Episode {{uuid: '{escape_cypher_string(episode_uuid)}'}})
    MERGE (s)-[:PART_OF]->(ep);
    """
    return CypherStatement(query.strip(), 3)

def generate_temporal_sequence_relationships(events: List[Dict]) -> List[CypherStatement]:
    """Create additional temporal relationships based on sequence numbers."""
    statements = []
    
    # Map of events by their sequence numbers
    events_by_sequence = defaultdict(list)
    for event in events:
        if 'sequence_within_scene' in event:
            events_by_sequence[event['sequence_within_scene']].append(event['uuid'])
    
    # Create HAPPENED_BEFORE relationships
    for seq in sorted(events_by_sequence.keys()):
        earlier_events = []
        for earlier_seq, event_ids in sorted(events_by_sequence.items()):
            if earlier_seq < seq:
                earlier_events.extend(event_ids)
        
        for later_event in events_by_sequence[seq]:
            for earlier_event in earlier_events:
                stmt = f"""
                MATCH (e1:Event {{uuid: '{earlier_event}'}}),
                      (e2:Event {{uuid: '{later_event}'}})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                """
                statements.append(CypherStatement(stmt, 4))
    
    return statements

def generate_inference_relationships() -> List[CypherStatement]:
    """Creates inferred relationships to enrich the graph."""
    inferences = [
        # Infer Agent-Scene relationships
        """
        MATCH (a:Agent)-[:PARTICIPATES_IN]->(:AgentParticipation)-[:IN_EVENT]->(e:Event)-[:OCCURS_IN]->(s:Scene)
        WITH DISTINCT a, s
        MERGE (a)-[:APPEARS_IN]->(s);
        """,
        
        # Infer Agent-Location relationships
        """
        MATCH (a:Agent)-[:APPEARS_IN]->(s:Scene)-[:LOCATED_IN]->(l:Location)
        WITH DISTINCT a, l
        MERGE (a)-[:VISITED_LOCATION]->(l);
        """,
        
        # Infer direct connections between co-present agents
        """
        MATCH (a1:Agent)-[:APPEARS_IN]->(s:Scene)<-[:APPEARS_IN]-(a2:Agent)
        WHERE a1 <> a2
        WITH DISTINCT a1, a2
        MERGE (a1)-[:CO_PRESENT_WITH]->(a2);
        """,
        
        # Infer direct connections between agents and objects they interact with
        """
        MATCH (a:Agent)-[:PARTICIPATES_IN]->(:AgentParticipation)-[:IN_EVENT]->(e:Event)<-[:IN_EVENT]-(:ObjectInvolvement)<-[:INVOLVED_IN]-(o:Object)
        WITH DISTINCT a, o
        MERGE (a)-[:INTERACTED_WITH]->(o);
        """
    ]
    
    return [CypherStatement(query.strip(), 5) for query in inferences]

def generate_narrative_procedures() -> List[CypherStatement]:
    """Creates direct Cypher queries for common narrative queries instead of procedures."""
    comments = [
        """
        // Character arc query example - run with:
        // MATCH (a:Agent {name: 'Character Name'})
        // CALL {
        //   MATCH (a)-[:PARTICIPATES_IN]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)-[:OCCURS_IN]->(s:Scene)
        //   WITH a, ap, e, s
        //   ORDER BY s.scene_number, e.sequence
        //   RETURN s.scene_number as scene, e.title as event, ap.emotional_state as emotional_state, ap.current_status as status
        // }
        // RETURN scene, event, emotional_state, status
        """,
        
        """
        // Location journey query example - run with:
        // MATCH (a:Agent {name: 'Character Name'})
        // CALL {
        //   MATCH (a)-[:APPEARS_IN]->(s:Scene)-[:LOCATED_IN]->(l:Location)
        //   WITH a, s, l
        //   ORDER BY s.scene_number
        //   RETURN s.scene_number as scene, l.name as location, l.type as location_type
        // }
        // RETURN scene, location, location_type
        """
    ]
    
    return [CypherStatement(comment.strip(), 6) for comment in comments]

def main():
    try:
        input_path = Path("/home/user/fabula/output/pre_processed/echoes_of_the_past_graph.json")
        output_path = Path("/home/user/fabula/output/post_processed/echoes_of_the_past_graph.cypher")

        # input_path = Path("/home/user/fabula/output/pre_processed/fault_lines_graph.json")
        # output_path = Path("/home/user/fabula/output/post_processed/fault_lines_graph.cypher")

        # input_path = Path("/home/user/fabula/output/pre_processed/networking_event_graph.json")
        # output_path = Path("/home/user/fabula/output/post_processed/networking_event_graph.cypher")

        # input_path = Path("/home/user/fabula/output/pre_processed/quantum_archive_graph.json")
        # output_path = Path("/home/user/fabula/output/post_processed/quantum_archive_graph.cypher")


        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        logger.info(f"Reading input file: {input_path}")
        if not input_path.exists():
            raise FileNotFoundError(f"Input file not found: {input_path}")
            
        with input_path.open('r', encoding='utf-8') as f:
            story_data = json.load(f)
        
        cypher_statements = []
        
        # Schema cleanup, constraints, indexes, and clear graph
        cypher_statements.extend(generate_schema_cleanup())
        cypher_statements.extend(generate_constraints())
        cypher_statements.extend(generate_indexes())
        cypher_statements.append(generate_clear_graph())
        
        # Add graph metadata
        cypher_statements.append(generate_graph_metadata(str(input_path)))
        
        # Process entity registry
        entity_registry = story_data.get("entity_registry", {})
        
        # Track all events for temporal relationships
        all_events = []
        
        # Process agents and their affiliations
        logger.info("Processing agents...")
        for agent in entity_registry.get("agents", []):
            cypher_statements.append(generate_agent_node_cypher(agent))
            affiliated_org = agent.get("affiliated_org")
            if affiliated_org:
                cypher_statements.append(generate_affiliation_relationship_cypher(
                    agent["uuid"], affiliated_org))
        
        # Process objects and their ownership
        logger.info("Processing objects...")
        for obj in entity_registry.get("objects", []):
            cypher_statements.append(generate_object_node_cypher(obj))
            original_owner = obj.get("original_owner")
            if original_owner:
                cypher_statements.append(generate_ownership_relationship_cypher(
                    obj["uuid"], original_owner))
        
        # Process locations
        logger.info("Processing locations...")
        for location in entity_registry.get("locations", []):
            cypher_statements.append(generate_location_node_cypher(location))
        
        # Process organizations
        logger.info("Processing organizations...")
        for org in entity_registry.get("organizations", []):
            cypher_statements.append(generate_organization_node_cypher(org))
            for member_uuid in org.get("members", []):
                cypher_statements.append(generate_affiliation_relationship_cypher(
                    member_uuid, org["uuid"]))
        
        # Process episodes, scenes, events, participations, and object involvements
        logger.info("Processing episodes...")
        for episode in story_data.get("episodes", []):
            # Create Episode node
            episode_node = generate_episode_node_cypher(episode)
            cypher_statements.append(episode_node)
            
            # Generate consistent episode UUID (using same logic as in generate_episode_node_cypher)
            title = episode.get("episode_title", "Untitled Episode")
            episode_uuid = generate_consistent_uuid("episode", title)
            
            previous_scene = None
            for scene in episode.get("scenes", []):
                extracted_data = scene.get("extracted_data", {})
                metadata = extracted_data.get("metadata", {})
                scene_uuid = metadata.get("uuid")
                if not scene_uuid:
                    logger.warning(f"Scene found without UUID: {metadata.get('title', 'Unknown scene')}")
                    continue
                
                cypher_statements.append(generate_scene_node_cypher(metadata))
                
                # Link scene to its parent episode
                cypher_statements.append(generate_scene_episode_relationship(scene_uuid, episode_uuid))
                
                if previous_scene:
                    cypher_statements.append(generate_relationship_cypher(
                        previous_scene, scene_uuid, "NEXT_SCENE", "Scene", "Scene"))
                previous_scene = scene_uuid
                
                # Process events
                previous_event = None
                scene_events = []
                for event in extracted_data.get("events", []):
                    event_uuid = event.get("uuid")
                    cypher_statements.append(generate_event_node_cypher(event))
                    cypher_statements.append(generate_relationship_cypher(
                        event_uuid, scene_uuid, "OCCURS_IN", "Event", "Scene"))
                    if previous_event:
                        cypher_statements.append(generate_relationship_cypher(
                            previous_event, event_uuid, "NEXT_EVENT", "Event", "Event"))
                    previous_event = event_uuid
                    
                    # Add to all events for temporal relationships
                    all_events.append(event)
                    scene_events.append(event)
                
                # Add temporal sequence relationships for events in this scene
                cypher_statements.extend(generate_temporal_sequence_relationships(scene_events))
                
                # Process object involvements
                for involvement in extracted_data.get("object_involvements", []):
                    if isinstance(involvement, dict):
                        cypher_statements.append(generate_object_involvement_cypher(involvement))
                    else:
                        logger.error(f"Skipping invalid object involvement format: {involvement}")
                
                # Process agent participations
                for participation in extracted_data.get("agent_participations", []):
                    participation_uuid = participation.get("uuid")
                    agent_uuid = participation.get("agent")
                    event_uuid = participation.get("event")
                    cypher_statements.append(generate_agent_participation_node_cypher(participation))
                    if agent_uuid and event_uuid:
                        cypher_statements.append(generate_relationship_cypher(
                            agent_uuid, participation_uuid, "PARTICIPATES_IN", "Agent", "AgentParticipation"))
                        cypher_statements.append(generate_relationship_cypher(
                            participation_uuid, event_uuid, "IN_EVENT", "AgentParticipation", "Event"))
        
        # Add inferred relationships
        cypher_statements.extend(generate_inference_relationships())
        
        # Add narrative procedures if APOC is available
        cypher_statements.extend(generate_narrative_procedures())
        
        # Sort and write statements
        logger.info("Sorting and writing Cypher statements...")
        sorted_statements = sorted(cypher_statements, key=lambda x: x.priority)
        with output_path.open('w', encoding='utf-8') as f:
            for stmt in sorted_statements:
                f.write(f"{stmt.statement}\n")
        
        logger.info(f"Successfully wrote {len(sorted_statements)} Cypher statements to {output_path}")
        
    except Exception as e:
        logger.error(f"An unexpected error occurred: {str(e)}")
        raise

if __name__ == "__main__":
    main()