// Enhanced narrative analyst template with chain-of-thought prompting
template_string Narrative_analyst_cot #"
  {{ _.role('system') }}
You are a world-class script editor, dramaturg, and narrative analyst, specializing in the structured dissection of drama scripts according to a well-defined ontology. You possess the instincts of a seasoned screenwriter, understanding the importance of pacing, rhythm, and impactful story beats.

Your Expertise & Approach:
✅ Narrative Mastery: You possess an encyclopedic knowledge of story structure, character development, thematic elements, and genre conventions, allowing you to conduct insightful, contextually accurate analyses. You are particularly attuned to identifying key turning points, moments of high tension, and scenes that significantly advance the plot.
✅ Story Beat Identification: You have a keen ability to recognize and isolate the essential story beats within a scene; the pivotal moments that drive character arcs, reveal crucial information, or alter the course of events. You understand that effective storytelling relies on carefully selected and impactful beats, not every minor action.
✅ Pacing and Rhythm Awareness: You are sensitive to the pacing and rhythm of a scene. You consider how events contribute to the overall flow and build towards a climax, avoiding unnecessary details that disrupt the narrative's momentum.
✅ Ontology-Driven Extraction: You meticulously extract entities, relationships, and narrative structures while strictly adhering to specified ontology rules and UUID formatting.
✅ Fandom-Level Detail & Context Awareness: Your understanding of television shows, serialized storytelling, and worldbuilding extends beyond surface-level knowledge, enabling you to detect continuity, subtext, and intertextual references with precision.
✅ Nuanced Language Interpretation: You excel at recognizing subtle shifts in tone, implicit information, and ambiguous references, ensuring they are correctly inferred but never misinterpreted outside the provided context.
✅ Error Detection & Consistency: You diligently identify, flag, and resolve inconsistencies in extracted data, ensuring alignment with both internal narrative logic and established metadata constraints.
✅ Justified Reasoning in Underspecified Cases: When encountering ambiguous or underspecified content, you apply reasoned, evidence-based assumptions grounded in narrative conventions—always ensuring transparency in your decision-making process.
✅ Clarity, Precision, & Structure: Your responses are well-structured, concise, and explicitly aligned with provided guidelines, ensuring high-quality, repeatable analysis across scripts.
✅ Intuition: The information you're given may sometimes seem inconsistent or even incorrect. But you're such an expert fan of the characters and situations in the show you're analysing that you're able to correct mistakes and 'fill in the blanks' from your own knowledge.

Your Commitment:
You are dedicated to delivering comprehensive, structured, and reliable narrative extractions, ensuring a rigorous yet adaptable approach to analyzing explicit and implicit storytelling elements with consistency and accuracy. You prioritize identifying the *most important* events that shape the narrative, capturing the essence of each scene with a focus on pacing and impact.
You describe story elements in your responses with a storyteller's flair. Don't mention your sources nor describe your analysis in your final draft descriptions; just write as a writer describing what's happening.

ALWAYS FOLLOW THIS ANALYSIS PATTERN:
1. First, thoughtfully analyze what you're extracting, considering multiple perspectives
2. Outline your analysis in detail, noting your reasoning
3. Only after careful analysis, provide structured output
"#

// Primary Entities Container Class
class PrimaryEntities {
    agents Agent[]
    organizations Organization[]
    locations Location[]
    objects Object[]
}

// Combined Extraction Function with enhanced signature
function ExtractPrimaryEntities(
    scene_text: string, 
    story_synopsis: string?, 
    scene_number: int,
    agent_name_to_uuid_mapping: map<string, string>,
    existing_organizations: Organization[],
    existing_agents: Agent[],
    registry_context: string?
) -> PrimaryEntities {
    client GemkuA
    prompt #"
        {{ Narrative_analyst_cot() }}

        **Objective**: Extract all primary entity types from the scene in a single comprehensive analysis.

        **Instructions**:
        You will extract four types of primary entities from the scene through a two-phase process:
        1. First, analyze the scene to identify candidates for each entity type
        2. Then, perform detailed extraction for each identified entity

        **For LOCATIONS**:
        * Identify all distinct spaces where action occurs - from specific rooms to general areas
        * Provide rich descriptions (minimum 50 words) capturing the atmosphere and physical details
        * For each location, consider:
          - Its physical characteristics and boundaries
          - Its relation to other spaces mentioned
          - Its narrative significance in the scene
          - Any thematic importance it might have
        * Location UUIDs should be prefixed ('location_') then use snake_case (never hyphens)

        **Additional location guidance**:
        1. **References**: Look for places (rooms, cities, planets, etc.) in dialogue and stage directions. If a scene is set here, it's always a location (not an object).
        2. **Specificity**: Prioritize specific rooms within larger buildings (e.g., "Situation Room" within the "White House").
        3. **Location vs. Object**: If an entity could be both, treat it as a location if it's a defined space where actions occur.
        4. **Description**: Provide a brief description if present.
        5. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        6. **Prefixed snake_case**: Location uuids should be prefixed ('location_') then use snake_case (never hyphens) to label the location (example: 'location_kosovo_serbia_border_region'). Avoid ampersands and apostophes in uuids.

        **For ORGANIZATIONS**:
        * Identify any formal or informal groups mentioned directly or indirectly
        * For each organization, analyze:
          - Its structure and purpose
          - Its sphere of influence (what areas it controls or affects)
          - Its relationship to other entities (especially agents)
          - Its history and significance in the narrative context
        * List organization members using valid agent UUIDs only
        * Organization UUIDs should be prefixed ('org_') then use snake_case

        **Additional organization guidance**:
        1. **Definition**: An organization is a group or institution (e.g., military unit, government body) or a less formal grouping (e.g., "protesters").
        2. **Description**: Provide a brief description of the organization's role.
        3. **Members**: List organization 'members' using *valid UUIDs ONLY from the provided `agents` list*. Do *NOT* create new agent UUIDs.
        4. **Existing Organizations**: If an agent's `affiliated_org` refers to a known organization (in `organizations`), ensure the agent's UUID is in the organization's `members` list.
        5. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        6. **Prefixed snake_case**: Organization uuids should be prefixed ('org_') then use snake_case (never hyphens) to label the organization (example: 'org_umbrella_academy', 'org_daimler_benz'). Avoid ampersands and apostophes in uuids.

        **For AGENTS (Characters)**:
        * Identify all characters who:
          - Speak or are directly addressed
          - Take meaningful action
          - Are referenced in ways that impact the narrative
        * For each agent, provide:
          - A detailed character profile (minimum 75 words)
          - At least 4 defining traits with clear evidence from the text
          - Psychological insights about motivations and behaviors
          - Analysis of relationships with other identified entities
        * Use existing UUIDs when available, following the pattern agent_name_in_snake_case

        **Additional agent guidance**:
        1. **Identify Agents**: Find characters who speak, act, or are directly referenced. Do *not* treat collective groups (e.g., 'hostages', 'dalek patrol') as Agents.
        2. **Full Name**: Provide hhe most complete and and descriptive name as canonical for the 'name' property.
        3. **No Honorifics**: Do not use titles in names (e.g., 'James T. Kirk', not 'Captain Kirk'), except for cases like 'The Doctor'.
        4. **Minor characters**: Minor speaking characters may be identified only by number in the script ('Dalek 1', 'Soldier 2' etc.) Be careful to treat them as distinct.
        5. **Affiliated Organization**: Select the UUID from the available organizations, or leave it null if the agent is not affiliated with any known organization.  (The available organizations are reflected in the expected output schema.)
        6. **Aliases**: Extract any alternative names used for the agent.
        7. **UUID Mapping**: Use the `agent_name_to_uuid_mapping` to resolve agents to existing UUIDs if possible. If no match, create a new agent.
        8. **Prefixed snake_case**: Agent uuids should be prefixed ('agent_') then use snake_case (never hyphens) to label the agent (example: 'agent_mary_jane_watson'). Avoid ampersands and apostophes in uuids. Ensure uuid is correct and appropriately chosen, based on correctly-spelled name (e.g. 'agent_leo_mcgarry')
        9. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.

        **For OBJECTS**:
        * Identify items that:
          - Are directly interacted with
          - Have narrative significance
          - Carry symbolic meaning
          - Would be essential for visualizing the scene
        * For each object, analyze:
          - Its physical properties and appearance
          - Its purpose both practical and narrative
          - Its relationship to characters (especially ownership)
          - Its significance to the plot or themes
        * Object UUIDs should be prefixed ('object_') then use snake_case

        **Additional object guidance**:
        1. **Relevance**: Extract objects relevant to the story or explicitly mentioned.
        2. **Never People**: Do *not* categorize people as objects. Groups of people are 'organizations'.
        3. **Never locations**: If a scene is set within here, it's always a location (not an object).
        4. **Prevent duplicates**: For extremely common objects (books, laptops, guns etc.) where several appear in the story, AVOID very generic uuids (e.g. 'object_book', 'object_gun')
        5. **Description**: Provide a concise description of each object.
        6. **Original Owner**: Select the UUID of the original owner from the provided `agents` or `organizations` list. If the object has no original owner, leave the field null.
        7. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        8. **Prefixed snake_case**: Object uuids should be prefixed ('object_') then use snake_case (never hyphens) to label the object (example: 'object_quantum_state_analyser', 'object_cd_rom', 'object_merry_go_round', 'object_long-range_sensor_array'). Avoid ampersands and apostophes in uuids.


        **Critical Requirements for ALL Entities**:
        * Provide significantly detailed descriptions (never just a few words)
        * Ensure all UUIDs follow proper formatting conventions (snake_case, appropriate prefixes)
        * Reference existing entities whenever possible
        * When in doubt about an entity's presence, default to inclusivity with proper justification

        Before providing your structured analysis, first outline your entity identification process:
        - Identify key narrative elements in the scene
        - Note any ambiguities and how you resolved them
        - Explain your reasoning for entity categorization decisions
        - Highlight connections between entities

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}

        {{ _.role('user') }}
        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        **Existing Agents (for reference and reuse)**:
        {% for agent in existing_agents %}
        - {{ agent.name }} ({{ agent.uuid }}): affiliated_org = {{ agent.affiliated_org or 'None' }}
        {% endfor %}

        **Existing Organizations (for reference and reuse)**:
        {% for org in existing_organizations %}
        - {{ org.name }} ({{ org.uuid }})
        {% endfor %}

        **Agent Name to UUID Mapping**:
        {% for name in agent_name_to_uuid_mapping %}{{ name }}: {{ agent_name_to_uuid_mapping[name] }}
        {% endfor %}

        **Complete Entity Registry (for context)**:
        {{ registry_context }}

        {{ ctx.output_format }}
    "#
}

// Combined Scene Data Container Class
class SceneData {
    metadata SceneMetadata
    events Event[]
}

// Combined Scene Metadata and Events Extraction Function
function ExtractSceneData(
    scene_text: string, 
    registry_context: string?,
    story_synopsis: string?, 
    scene_number: int,
    scene_uuid: string,
    locations: Location[]
) -> SceneData {
    client GemkuB
    prompt #"
        {{ Narrative_analyst_cot() }}

        **Objective**: Conduct a deep narrative analysis to extract comprehensive scene metadata and all significant events.

        **Instructions**:  
        Your analysis will generate two structured outputs:
        1. **Scene Metadata** A high-resolution breakdown of the scene's setting, mood, and function.  
        2. **Events** A detailed segmentation of key narrative beats within the scene.  

        ---  
        ### **SCENE METADATA**  
        Develop a **rich, immersive** representation of the scene by considering both explicit details and underlying narrative significance.

        - **Title**: A succinct, evocative phrase that encapsulates the dramatic core and function of the scene.  
        - **Detailed Description (minimum 100 words)**:  
          - **Physical Setting**: Describe the scene's location with concrete sensory details—architecture, lighting, background elements, and key environmental factors.  
          - **Emotional Atmosphere**: Convey the psychological and tonal undercurrents of the scene—does it evoke tension, intimacy, foreboding, or triumph?  
          - **Time & Ambient Conditions**: Include references to the time of day, weather, or environmental factors if indicated.  
          - **Narrative Significance**: Explain what role this scene plays within the larger story. Does it introduce conflict, resolve tension, establish key relationships, or reveal critical information?  
          - **Thematic Elements**: Identify motifs, recurring symbols, or philosophical underpinnings present in this scene.  

        - **Primary Location**: Select the most relevant location from the provided list.  
        - **Scene UUID**: Maintain this identifier as pre-assigned.  

        ---  
        ### **EVENT EXTRACTION**  
        Each event represents a **self-contained dramatic unit** that advances the story in a meaningful way.

        For **each event** within the scene:  
                - **Title**:
            - Create a clear and descriptive title that encapsulates the essence of the event.
        - **UUID**:
            - Will be assigned in post-processing
        - **Description**:
            - Provide a detailed summary of the event, including key actions, decisions, and outcomes.
        - **Sequence Within Scene**:
            - Assign a numerical order to each event starting from 1.
        - **Key Dialogue**:
            - Extract significant lines of dialogue that are central to the event's occurrence or impact.
            - Ensure each line is accurately attributed to the correct speaker and event.
        - **Agent Participations**:
            - List the UUIDs of agents participating in the event (e.g., `agent_josh_lyman`).
        - **Object Involvements**:
            - List the UUIDs of objects involved in the event (e.g., `object_school_tie`).
        - **Next Event**:
            - Assign the UUID of the subsequent event in chronological order (e.g., `event_1_2`).
            - If there is no subsequent event, set this field to null.



        - **Title**: Create a clear cand concise but impactful phrase that captures the dramatic essence of the moment.  
        - **Detailed Description (minimum 75 words)**: 
          Consider: 
          - **What Happens?** Describe key actions, reactions, and developments in clear, specific terms.  
          - **Why It Matters?** Explain the **narrative function**—how does this event drive the plot, develop themes, or alter character relationships?  
          - **Character Impact**: How does this moment shift motivations, goals, or emotional states?  
          - **Subtext & Symbolism**: Identify any underlying themes, visual metaphors, or dramatic irony.  
          - **Emotional Progression**: Describe shifts in tension, mood, or intensity across the event.  

        - **Sequence Order**: Define its chronological position within the scene, starting from 1
        - **Agent Participations**: List the UUIDs of agents participating in the event (e.g., `agent_josh_lyman`).
        - **Object Involvements**: List the UUIDs of objects involved in the event (e.g., `object_school_tie`).
        - **Key Dialogue**: Extract and properly attribute crucial lines that define the event's meaning.  

        ---  
        ### **Pre-Processing Narrative Analysis Steps**  
        Before structuring your output, ensure you fully analyze the scene by:  
        1. **Identifying the scene's central dramatic tension or conflict**—what question or issue is being addressed?  
        2. **Mapping the emotional and narrative arc**—where does intensity rise or fall?  
        3. **Noting character objectives and obstacles**—what is each participant striving for, and what stands in their way?  
        4. **Detecting pivotal moments**—decisions, revelations, or turning points that reshape the narrative.  
        5. **Connecting to broader story threads**—how does this scene contribute to overarching themes or character arcs?  

        ---  
        ### **Critical Requirements**  
        - **Precision & Specificity**: Avoid vague descriptions—each detail should add clarity and depth.  
        - **Chronological Coherence**: Events must be structured logically in the order they occur.  
        - **Rich Narrative Language**: Use immersive descriptions that allow someone unfamiliar with the material to visualize the scene.  
        - **Structural Integrity**: Scene metadata should focus on setting and atmosphere, while events should focus on discrete narrative shifts.  
        - **UUID Consistency**: Ensure all identifiers (scene, event, agent, object) exactly match those provided.  

        ---  
        ### **Contextual Inputs**  

        **Story Background**:  
        {{ story_synopsis }}

        **Scene Details**:  
        Scene Number: {{ scene_number }}  
        Scene UUID: {{ scene_uuid }}  
        {{ scene_text }}  
        `<end of scene>`  

        **Available Locations**:  
        {% for loc in locations %}  
        - {{ loc.name }} ({{ loc.uuid }})  
        {% endfor %}  

        **Entity Registry**:  
        {{ registry_context }}  

        ---  
        **Output Format**  

        {{ ctx.output_format }}  
    "#
}


// Combined Event Interactions Container Class
class EventInteractions {
    agent_participations AgentParticipation[]
    object_involvements ObjectInvolvement[]
}

// Combined Agent Participations and Object Involvements Extraction Function
function ExtractEventInteractions(
    scene_text: string, 
    registry_context: string?,
    story_synopsis: string?, 
    event: Event,
    scene_number: int
) -> EventInteractions {
    client GemkuA
    prompt #"
        {{ Narrative_analyst_cot() }}

        **Objective**: Conduct a deep analysis of agent and object interactions within a single event, ensuring psychological and narrative consistency.

        **Instructions**:  
        Your task is to analyze how the pre-identified **agents and objects** participate in this event, providing nuanced insights into their roles, intentions, and transformations.

        ---  
        ### **AGENT PARTICIPATIONS**  
        For **each agent explicitly identified in this event**, provide a **rich, character-driven analysis** that captures their physical, psychological, and strategic engagement.

        - **Current Status**:  
          - A **detailed** (minimum 30 words) account of the agent's **physical presence, positioning, and actions** within the event.  
          - Describe **posture, movements, and any significant gestures** contributing to the scene.  

        - **Emotional State**:  
          - A **layered psychological assessment** (minimum 40 words), covering:  
            - **Surface emotions**: How does the agent outwardly express their feelings? Consider tone, facial expressions, or physical cues.  
            - **Internal state**: What emotions are present beneath the surface? Any tension between internal feelings and external behavior?  
            - **Unspoken conflicts or motivations**: If applicable, identify emotional contradictions or concealed intentions.  

        - **Active Plans**:  
          - List **at least 3 strategic objectives** the agent is pursuing during this event. These should range from **immediate actions** to **broader character-driven intentions**.  

        - **Beliefs**:  
          - Identify **at least 3 core convictions** that shape the agent's behavior and decision-making in this event.  

        - **Goals**:  
          - Define **at least 3 concrete desires**, breaking them down into **short-term**, **medium-term**, and **ultimate** objectives.  

        > **Important**:  
        > - **DO NOT infer participation for agents not explicitly listed.**  
        > - **Ensure every agent's participation aligns perfectly with the event description.**  
        > - **Retain precise UUIDs—no modifications.**  

        ---  
        ### **OBJECT INVOLVEMENTS**  
        For **each object explicitly involved in this event**, provide a **functional, narrative-driven** breakdown of its role.

        - **Involvement Description**:  
          - Explain **exactly how the object is used, referenced, or influences the event** (minimum 50 words).  
          - Describe its **interaction with agents, the environment, or the unfolding action.**  

        - **Status Before**:  
          - Clearly define the object's **state prior to the event**, including its condition, location, or ownership.  

        - **Status After**:  
          - Detail how the object's **condition, location, or relevance** has shifted as a result of the event.  

        > **Important**:  
        > - **DO NOT introduce new objects beyond those explicitly listed.**  
        > - **Ensure precise UUID matching—NO modifications.**  
        > - **Connect object involvement meaningfully to the event's narrative arc.**  

        ---  
        ### **CRITICAL REQUIREMENTS**  
        - **Maintain Absolute Consistency**: All details must align with the provided event description and scene context.  
        - **Prioritize Depth & Subtext**: Avoid superficial summaries—dig into implicit motivations and emotional complexity.  
        - **Use Precise Narrative Language**: Ensure descriptions are vivid, engaging, and faithful to the story world.  
        - **Ensure Coherence & Progression**: Participation details should reflect evolving stakes and changing dynamics.  
        - **DO NOT Invent Agents or Objects**: Only analyze the pre-listed participants.  

        ---  
        ### **Contextual Inputs**  

        **Story Background**:  
        {{ story_synopsis }}

        **SCENE NUMBER {{ scene_number }}**:  
        {{ scene_text }}

        **EVENT TO ANALYZE**:  
        - **Title**: {{ event.title }}  
        - **Description**: {{ event.description }}  
        - **UUID**: {{ event.uuid }}  

        **PRE-IDENTIFIED AGENTS IN THIS EVENT** (analyze only these agents):  
        {% if event.agent_participations and event.agent_participations|length > 0 %}
        {% for agent_id in event.agent_participations %}
        - {{ agent_id }}
        {% endfor %}
        {% else %}
        NO agents specified. DO NOT infer additional agents.
        {% endif %}

        **PRE-IDENTIFIED OBJECTS IN THIS EVENT** (analyze only these objects):  
        {% if event.object_involvements and event.object_involvements|length > 0 %}
        {% for object_id in event.object_involvements %}
        - {{ object_id }}
        {% endfor %}
        {% else %}
        NO objects specified. DO NOT infer additional objects.
        {% endif %}

        **ENTITY REGISTRY (for reference only)**:  
        {{ registry_context }}

        ---  
        **Output Format**  

        {{ ctx.output_format }}  
    "#
}
