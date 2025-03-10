// File: baml_src/graphrag.baml
// Jinja-like template syntax for baml python library - boundaryml.com
// Defines classes, enums and functions to guide LLM output to strict schema alignment


class NodeLabel {
  name "Agent" | "Organization" | "Location" | "Object" | "Scene" | "Event" | "AgentParticipation" | "ObjectInvolvement"
}

class PropertyName {
  agent "uuid" | "name" | "description" | "traits" | "affiliated_org"
  organization "uuid" | "name" | "description" | "sphere_of_influence" | "members"
  location "uuid" | "name" | "description" | "type"
  object "uuid" | "name" | "description" | "purpose" | "significance" | "original_owner"
  scene "uuid" | "title" | "description" | "scene_number" | "location" | "next_scene"
  event "uuid" | "title" | "description" | "sequence_within_scene" | "key_dialogue" | "next_event"
  agentParticipation "uuid" | "agent" | "event" | "current_status" | "emotional_state"
  objectInvolvement "uuid" | "object" | "event" | "description_of_involvement"
}

class RelationType {
  name "NEXT_SCENE" | "OCCURS_IN" | "NEXT_EVENT" | "PARTICIPATES_IN" | "IN_EVENT" | "INVOLVED_IN" | "OWNS" | "AFFILIATED_WITH" | "PART_OF" | "LOCATED_IN"
}

class CypherQuery {
  query string @description("The generated Cypher query")
  purpose string @description("Brief explanation of what the query does")
}

function ValidateCypherOld(question: string) -> CypherQuery {
    client "openai/gpt-4o-mini"
    prompt #"
        You are a **Neo4j Cypher query generator** specializing in **narrative graph structures**.  
        Your goal is to generate **precise, schema-compliant** Cypher queries that conform to the database schema.

        ---
        ### **Database Schema (Ensure Queries Match This)**
        The knowledge graph models **narrative elements** such as characters, locations, events, and their relationships.

        **Valid Node Labels:**
        - **Agent (`Agent`)** → Represents characters or individuals.
        - **AgentParticipation (`AgentParticipation`)** → Captures an agent’s role within an event.
        - **Episode (`Episode`)** → Represents a collection of scenes within a story.
        - **Event (`Event`)** → A meaningful action occurring within a scene.
        - **Location (`Location`)** → Physical or conceptual places where events occur.
        - **Object (`Object`)** → Items of significance in a scene or event.
        - **ObjectInvolvement (`ObjectInvolvement`)** → Captures an object’s role in an event.
        - **Organization (`Organization`)** → Factions, groups, or institutions.
        - **Scene (`Scene`)** → A structured narrative moment, containing events.

        **Valid Relationship Types:**
        - `(s1:Scene)-[:NEXT_SCENE]->(s2:Scene)` → Defines scene sequence.
        - `(e:Event)-[:OCCURS_IN]->(s:Scene)` → Links events to scenes.
        - `(e1:Event)-[:NEXT_EVENT]->(e2:Event)` → Defines event sequence.
        - `(s:Scene)-[:LOCATED_IN]->(l:Location)` → Associates a scene with a place.
        - `(a:Agent)-[:PARTICIPATES_IN]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)` → Links agents to events.
        - `(o:Object)-[:INVOLVED_IN]->(oi:ObjectInvolvement)-[:IN_EVENT]->(e:Event)` → Links objects to events.
        - `(a:Agent)-[:AFFILIATED_WITH]->(o:Organization)` → Associates agents with organizations.
        - `(a:Agent)-[:OWNS]->(o:Object)` → Defines object ownership.

        ---
        ### **Query Generation Rules**
        1. **STRICTLY match the node labels, properties, and relationships above.**
        2. **Ensure relationships exist before querying properties** (prevents errors like `UnknownRelationshipTypeWarning`).
        3. **Use indexed lookups (`uuid`) instead of querying by `name`**, unless explicitly required.
        4. **If querying an agent, always retrieve their participations via `PARTICIPATES_IN`.**
        5. **For objects, always retrieve their involvement via `INVOLVED_IN`.**
        6. **Return only relevant properties**—avoid using `RETURN *`.

        ---
        ### **Example Query Strategies**
        
        **User Request:** `"Find all events a character named Maddox participated in."`
        
        **Primary Query (UUID-Based, Preferred)**
        ```cypher
        MATCH (a:Agent {name: 'Maddox'})-[:PARTICIPATES_IN]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)
        RETURN e.uuid, e.title, ap.current_status, ap.emotional_state
        ```

        **Backup Query (If Direct Agent Lookup Fails)**
        ```cypher
        MATCH (e:Event)-[:IN_EVENT]-(ap:AgentParticipation)-[:PARTICIPATES_IN]-(a:Agent)
        WHERE a.name CONTAINS 'Maddox'
        RETURN DISTINCT e.uuid, e.title
        ```

        **User Request:** `"Find all objects involved in Event XYZ."`
        ```cypher
        MATCH (o:Object)-[:INVOLVED_IN]->(oi:ObjectInvolvement)-[:IN_EVENT]->(e:Event {uuid: $event_uuid})
        RETURN o.uuid, o.name, oi.description_of_involvement
        ```

        ---
        **Output Format**  
        {{ ctx.output_format }}

        {{ _.role("user") }} {{ question }}
    "#
}


test SimpleQuery {
  functions [ValidateCypher]
  args {
    question "Find all agents who own objects and their affiliated organizations"
  }
}

test ComplexQuery {
  functions [ValidateCypher]
  args {
    question "Show me all events in scenes where Agent 'John' participated and was in an 'ANGRY' emotional state, including the locations of these scenes"
  }
}

function ValidateCypher(question: string, available_apoc_functions: string[]) -> CypherQuery {
    client "openai/o3-mini"
    prompt #"
        You are a **Neo4j Cypher query generator** specializing in **narrative graph structures**.
        Your goal is to generate **precise, schema-compliant** Cypher queries that conform to the database schema.

        ---
        ### **Database Schema**
        The knowledge graph models **narrative elements** such as characters, locations, events, and their relationships.

        **Valid APOC Procedures (ONLY Use These)**:
        {% if available_apoc_functions and available_apoc_functions|length > 0 %}
        {% for apoc_function in available_apoc_functions %}
        - {{ apoc_function }}
        {% endfor %}
        {% else %}
        - NO APOC FUNCTIONS AVAILABLE (DO NOT USE APOC)
        {% endif %}

        ---
        **Schema Definition Rules**
        1. Only use APOC functions if explicitly specified above
        2. Strictly adhere to the following node labels, properties, and relationships:

        **Nodes and Their Purpose**

        1. Agent (Represents characters or individuals)
          - uuid* (Unique identifier)
          - name (Character's name)
          - title (Character's title or role)
          - description (Character background and details)
          - traits (Array of character's defining characteristics)
          - sphere_of_influence (Character's area of power or influence)

        2. AgentParticipation (Captures how an agent participates in an event)
          - uuid* (Unique identifier)
          - current_status (Agent's status during the event)
          - emotional_state (Agent's emotional condition)
          - emotional_tags (Array of discrete emotions)
          - active_plans (Array of current objectives)
          - beliefs (Array of current beliefs)
          - goals (Array of intended outcomes)

        3. Object (Significant items in the narrative)
          - uuid* (Unique identifier)
          - name (Item name)
          - description (Physical and contextual details)
          - purpose (Intended function)
          - significance (Narrative importance)

        4. Event (Meaningful actions or occurrences within scenes)
          - uuid* (Unique identifier)
          - title (Event name)
          - description (What happens)
          - sequence_within_scene (Order of occurrence)
          - key_dialogue (Array of important speech)

        5. Scene (Structured narrative moments)
          - uuid* (Unique identifier)
          - title (Scene name)
          - description (Scene contents and context)
          - scene_number (Sequential identifier)
          - location (Where it takes place)

        6. Organization (Groups, factions, or institutions)
          - uuid* (Unique identifier)
          - name (Organization name)
          - description (Purpose and nature)
          - sphere_of_influence (Area of power or control)

        7. Location (Physical or conceptual places)
          - uuid* (Unique identifier)
          - name (Place name)
          - description (Details about the location)
          - type (Category of location)

        8. Episode (Collection of related scenes)
          - uuid* (Unique identifier)
          - title (Episode name)
          - description (Episode summary)
          - airdate (Broadcast date)

        9. ObjectInvolvement (How objects are used in events)
          - uuid* (Unique identifier)
          - description (How object is involved)
          - status_before (Condition pre-event)
          - status_after (Condition post-event)

        **Relationships and Their Meaning**

        1. Scene Flow
          - (Scene)-[:NEXT_SCENE]->(Scene) : Defines sequence of scenes
          - (Scene)-[:PART_OF]->(Episode) : Groups scenes into episodes
          - (Scene)-[:LOCATED_IN]->(Location) : Places scene in physical context

        2. Event Structure
          - (Event)-[:OCCURS_IN]->(Scene) : Places events within scenes
          - (Event)-[:NEXT_EVENT]->(Event) : Orders events chronologically

        3. Agent Interactions
          - (Agent)-[:PARTICIPATES_IN]->(AgentParticipation)-[:IN_EVENT]->(Event) : Links characters to their actions
          - (Agent)-[:AFFILIATED_WITH]->(Organization) : Shows group membership
          - (Agent)-[:OWNS]->(Object) : Indicates possession

        4. Object Relations
          - (Object)-[:INVOLVED_IN]->(ObjectInvolvement)-[:IN_EVENT]->(Event) : Tracks object usage in events

        Note: Properties marked with * have unique constraints


        ---
        **Example Query Using Verified APOC**
        ```cypher
        MATCH (a:Agent {name: 'Maddox'}) 
        {% if "apoc.path.subgraphNodes" in available_apoc_functions %}
        CALL apoc.path.subgraphNodes(a, {relationshipFilter: "PARTICIPATES_IN>|IN_EVENT>", maxLevel: 2})
        YIELD node
        WHERE node:Event
        RETURN node.title, node.description, node.key_dialogue;
        {% else %}
        MATCH (a)-[:PARTICIPATES_IN]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)
        RETURN e.title, e.description, e.key_dialogue;
        {% endif %}
        ```

        ---
        **Output Format**
        Return the generated Cypher query as:
        {
          "query": "MATCH (...) RETURN ...",
          "purpose": "Brief explanation of what the query does."
        }

        {{ _.role("user") }} {{ question }}
    "#
}
