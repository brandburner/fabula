class CypherQuery {
  query string @description("The generated Cypher query")
  purpose string @description("Brief explanation of what the query does")
}

function ValidateCypher(question: string, available_apoc_functions: string[]) -> CypherQuery {
    client CustomGemini
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
        CALL apoc.path.subgraphNodes(a, {relationshipFilter: "HAS_PARTICIPATION>|IN_EVENT>", maxLevel: 2})
        YIELD node
        WHERE node:Event
        RETURN node.title, node.description, node.key_dialogue;
        {% else %}
        MATCH (a)-[:HAS_PARTICIPATION]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)
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
