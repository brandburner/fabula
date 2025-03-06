// File: fabula_dev/myth06.baml
// Jinja-like template syntax for baml python library
// Defines classes, enums and functions to guide LLM output to strict schema alignment

// Reusable template string for the narrative analyst persona
template_string Narrative_analyst_persona #"
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
"#

// --- Classes ---

class Episode {
    title string @description("The official title of the episode, reflecting its central theme or key events. Example: 'Episode One - Fault Lines'.")
    synopsis string @description("A brief summary outlining the main plot points and developments of the episode.")
    episode_number int @description("The numerical order of the episode within the season or series. Example: 1 for the first episode.")
    part_of_serial string @description("The name of the larger series or serial to which this episode belongs. Example: 'The West Wing'.")
    //@@dynamic
}

class Scene {
    title string @description("The official title of the scene, capturing its primary focus or significant events. Example: 'Emergency at the Kosovo-Serbia Border'.")
    description string @description("A detailed narrative summarizing the scene's setting, involved characters, and main actions. It should encapsulate the atmosphere and key occurrences.")
    scene_number int @description("The numerical sequence of the scene within its respective episode. Example: 1 for the first scene in an episode.")
    events string[] @description("An array of UUIDs representing the events that occur within this scene, listed in chronological order.")
    location string|null @description("The UUID of the primary location where the scene takes place. Follows the format 'location_<normalized_name>'.")
    next_scene string|null @description("The UUID of the subsequent scene in the narrative flow, following the format 'scene_XXX'. If there is no next scene, set to null.")
    //@@dynamic
}

class Event {
    title string @description("The official title of the event, summarizing its essence. Example: 'Josh Lyman Enters Situation Room'.")
    uuid string @description("Unique identifier for the event, following the format 'event_<scene_number>_<sequence_within_scene>'. Example: 'event_1_1'.")
    description string @description("A comprehensive description detailing what happens during the event, including key actions and outcomes.")
    sequence_within_scene int @description("The order of the event within its scene, starting from 1.")
    key_dialogue string[] @description("An array of significant dialogue lines that are central to the event's occurrence or impact.")
    agent_participations string[] @skip
    object_involvements string[] @skip
    next_event string|null @description("The UUID of the next event in chronological order within the scene. If there is no subsequent event, set to null.")
    //@@dynamic
}

class Agent {
    uuid string @description("Unique identifier for the agent in snake_case, in the format 'agent_{agent_id}', for example 'agent_josiah_bartlet', 'agent_tenth_doctor', 'agent_she_ra'")
    agent_id string @description("Unique identifier derived from the agent's name in snake_case")
    name string @description("Full canonical name (including surname) of the dramatic agent (character) excluding title, rank or honorific")
    title string? @description("Official or informal role, title, or designation held by the agent within the narrative (e.g., 'Doctor', 'UNIT Commander', 'President of the United States').")
    aliases string[]|null @description("Alternative names or titles used to refer to the agent.")
    description string @description("Comprehensive general (not scene-specific) character profile based on all known information in the story so far. This is an evergreen description but you'll keep adding to and revising it as the story progresses.")
    traits string[] @description("List of defining qualities and characteristics that describe the agent's personality, behavior, or abilities (e.g., 'Brave', 'Time Lord', 'Resourceful').")
    affiliated_org string|null @description("The organization the agent appears to be officially associated with. Expressed as a unique identifier in snake_case, in the format 'org_{org_id}'") @alias("affiliated_org_uuid")
    sphere_of_influence string? @description("Primary domain, area, or field where the agent exerts their power or influence (e.g., 'Time Travel', 'Military Strategy').")
    //@@dynamic
}

class Organization {
    uuid string @description("Unique identifier for the organization in snake_case, in the format 'org_{normalized_name}', for example 'org_time_lords' or 'org_galactic_empire'")
    name string @description("Name of the organization.")
    description string @description("Description of the organization's purpose and role.")
    sphere_of_influence string @description("Area where the organization has influence.")
    members string[] @skip
    //@@dynamic
}

class Location {
    uuid string @description("Unique identifier for the location in snake_case, in the format 'location_{name}', for example 'location_mos_eisley' or 'location_hogwarts_castle'")
    name string @description("Name of the location.")
    description string @description("Detailed description of the location's characteristics.")
    type string @description("Type of location (e.g., City, Building, Planet, Office, Apartment).")
    //@@dynamic
}

class Object {
    uuid string @description("Unique identifier for the object, following the format 'object_<normalized_name>'. Example: 'object_lcd_screens'.")
    name string @description("The official name of the object. Example: 'LCD Screens'.")
    description string @description("A detailed description of the object's nature, physical attributes, and role within the narrative.")
    purpose string @description("The intended use or function of the object within the context of the narrative. Example: 'To visualize satellite imagery for briefings'.")
    significance string @description("The narrative importance or symbolic meaning of the object. Example: 'Provides visual context for the Kosovo-Serbia situation'.")
    original_owner string|null @description("The UUID of the agent or org who originally owns the object, following the format 'agent_<agent_id>' or 'org_<org id>' Example: 'agent_josh_lyman', 'org_starfleet'. If no owner, set to null.")
    //@@dynamic
}

class AgentParticipation {
    uuid string @description("Unique identifier for this agent's participation in an event in the format 'agentparticipation_{agent_uuid}_{event_uuid}' for example 'agentparticipation_agent_mark_corrigan_event_5_3'.")
    agent string @description("UUID of the agent participating in the event.")
    event string @description("UUID of the event.")
    current_status string @description("What the agent is doing during the event.")
    emotional_state string @description("Brief description of the agent's emotional disposition during the event.")
    active_plans string[] @description("Brief description of the agent's active objectives or strategies in the context of the event.")
    beliefs string[] @description("The agent's beliefs or convictions that influence their actions during the event.")
    goals string[] @description("The agent's short-term and long-term goals related to the event.")
    //@@dynamic
}

class ObjectInvolvement {
    uuid string @description("Unique identifier for this object's involvement in an event in the format 'objectinvolvement_{object_uuid}_{event_uuid}', for example 'objectinvolvement_object_melatrite_nebula-event_5_5'")
    object string @description("UUID of the involved object.")
    event string @description("UUID of the event where the object is involved.")
    description_of_involvement string @description("Clear description of how the object is used or affected in the event, detailing its functional and narrative role.")
    object_status_before_event string @description("Brief description of the object's state prior to the event.")
    object_status_after_event string @description("Brief description of the object's state following the event.")
    //@@dynamic
}

class SceneMetadata {
    uuid string|null @description("Unique identifier for the scene.")
    title string @description("Title of the scene.")
    description string @description("Detailed description of the scene's setting and action.")
    scene_number int @description("Order of the scene within the episode.")
    location string|null @description("UUID of the primary location where this scene takes place.")
    next_scene string|null @description("UUID of the next scene in the narrative order (syuzhet).")
}

// --- Functions ---

function ExtractSceneMetadata(scene_text: string, story_synopsis: string?, scene_number: int, locations: Location[]) -> SceneMetadata {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**: Extract metadata for the current scene.

        **Instructions**:
        1. **Title**: Generate a concise, descriptive title.
        2. **Description**: Summarize the setting, characters, actions, and emotional tone.
        3. **Scene Number**: Extract if explicitly mentioned; otherwise, leave null.
        4. **Location**: Select the UUID of the primary location from the provided `locations` list. If not explicit, infer from `story_context`.
        5. **Next Scene**:  Identify any references to the next scene and assign its `scene_uuid`. If none, leave null.
        6. **UUID**: This will be assigned in post processing.

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}

        {{ _.role('user') }}
        **Known Locations**:
        {% for loc in locations %}
        - {{ loc.name }} ({{ loc.uuid }})
        {% endfor %}

        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        {{ ctx.output_format }}
    "#
}

function ExtractEvents(scene_text: string, registry_context: string?, story_synopsis: string?, scene_number: int) -> Event[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**: Extract distinct events within the scene in chronological order.

        **Instructions**:
        Extract and detail each distinct event or occurrence within the current scene in chronological order. For each event, provide comprehensive information as outlined below:

        1. **Event Identification**:
        - **Chronological Order**: Ensure events are ordered based on their sequence of occurrence within the scene.
        - **Distinctness**: Each event should represent a unique action, decision, or occurrence that advances the narrative.

        2. **Event Details**:
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

        3. **UUID Integrity**:
        - Ensure that all UUIDs for agents and objects correspond to valid entries in the provided `known_agents` and `known_objects` lists.
        - Do not introduce new UUIDs for known entities; reuse existing ones for consistency.
        - Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.

        [EXAMPLE]
        {
        "title": "Nancy McNally Briefs the Staff",
        "uuid": "event_1_2",
        "description": "National Security Advisor Nancy McNally addresses the senior staff, notifying them about the four USAID workers who went missing near the Kosovo-Serbia border while conducting post-conflict assessments.",
        "sequence_within_scene": 2,
        "key_dialogue": [
            "Four USAID workers went dark three hours ago near the Kosovo-Serbia border. They were conducting post-conflict reconstruction assessments when we lost contact."
        ],
        "agent_participations": [
            "agent_nancy_mcnally"
        ],
        "object_involvements": [
            "object_lcd_screens"
        ],
        "next_event": "event_1_3"
        },
        [/EXAMPLE]

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}


        {{ _.role('user') }}
        **Entity Registry (use these UUIDs ONLY when populating events with agents and objects)**
        {{ registry_context }}

        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        {{ ctx.output_format }}
    "#
}

function ExtractAgents(scene_text: string, story_synopsis: string?, agent_name_to_uuid_mapping: map<string, string>, scene_number: int, organizations: Organization[]) -> Agent[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**: Extract information about characters (agents) in the scene.

        **Instructions**:
        1. **Identify Agents**: Find characters who speak, act, or are directly referenced. Do *not* treat collective groups (e.g., 'hostages', 'dalek patrol') as Agents.
        2. **Full Name**: Provide hhe most complete and and descriptive name as canonical for the 'name' property.
        3. **No Honorifics**: Do not use titles in names (e.g., 'James T. Kirk', not 'Captain Kirk'), except for cases like 'The Doctor'.
        4. **Minor characters**: Minor speaking characters may be identified only by number in the script ('Dalek 1', 'Soldier 2' etc.) Be careful to treat them as distinct.
        5. **Affiliated Organization**: Select the UUID from the available organizations, or leave it null if the agent is not affiliated with any known organization.  (The available organizations are reflected in the expected output schema.)
        6. **Aliases**: Extract any alternative names used for the agent.
        7. **UUID Mapping**: Use the `agent_name_to_uuid_mapping` to resolve agents to existing UUIDs if possible. If no match, create a new agent.
        8. **Prefixed snake_case**: Agent uuids should be prefixed ('agent_') then use snake_case (never hyphens) to label the agent (example: 'agent_mary_jane_watson'). Avoid ampersands and apostophes in uuids. Ensure uuid is correct and appropriately chosen, based on correctly-spelled name (e.g. 'agent_leo_mcgarry')
        9. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.

        [EXAMPLE]
        {
        "uuid": "agent_nigel_smith",
        "agent_id": "nigel_smith",
        "name": "Nigel Smith",
        "title": "Creative Influencer",
        "aliases": [
            "Smitty",
            "Digital Prophet"
        ],
        "description": "Nigel Smith is a failed musician turned creative entrepreneur who has embraced an unconventional approach to the corporate world. He is characterized by his exuberance and ability to charm others, often leveraging buzzwords and absurd concepts to elevate his status within the corporate environment.",
        "traits": [
            "Creative",
            "Unconventional",
            "Charismatic",
            "Charming"
        ],
        "affiliated_org": "org_digital_prophets",
        "sphere_of_influence": "Corporate Innovation"
        },
        [/EXAMPLE]

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}

        {{ _.role('user') }}
        *Known organization UUIDs so far**:
        {% for org in organizations %}
        - {{ org.name }} ({{ org.uuid }})
        {% endfor %}

        **Existing Agents (Name to UUID Mapping)**:
        {% for name in agent_name_to_uuid_mapping %}{{ name }}: {{ agent_name_to_uuid_mapping[name] }}
        {% endfor %}

        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        {{ ctx.output_format }}
        "#
    }

function ExtractObjects(scene_text: string, story_synopsis: string?, scene_number: int, agents: Agent[]) -> Object[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**: Extract details of noteworthy objects in the scene.

        **Instructions**:
        1. **Relevance**: Extract objects relevant to the story or explicitly mentioned.
        2. **Never People**: Do *not* categorize people as objects. Groups of people are 'organizations'.
        3. **Never locations**: If a scene is set within here, it's always a location (not an object).
        4. **Prevent duplicates**: For extremely common objects (books, laptops, guns etc.) where several appear in the story, AVOID very generic uuids (e.g. 'object_book', 'object_gun')
        5. **Description**: Provide a concise description of each object.
        6. **Original Owner**: Select the UUID of the original owner from the provided `agents` or `organizations` list. If the object has no original owner, leave the field null.
        7. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        8. **Prefixed snake_case**: Object uuids should be prefixed ('object_') then use snake_case (never hyphens) to label the object (example: 'object_quantum_state_analyser', 'object_cd_rom', 'object_merry_go_round', 'object_long-range_sensor_array'). Avoid ampersands and apostophes in uuids.

        [EXAMPLE]
        {
        "uuid": "object_sams_laptop",
        "name": "Sam's Laptop",
        "description": "A portable computer that Sam Seaborn uses to draft presidential addresses, featuring an illuminated screen displaying two documents.",
        "purpose": "To draft presidential addresses regarding the current situation involving aid workers.",
        "significance": "Symbolizes the pressure and urgency faced by staff in crisis situations, as well as the need for careful communication in political narratives.",
        "original_owner": "agent_sam_seaborn",
        },
        [/EXAMPLE]

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}

        {{ _.role('user') }}
        *Known Agents (use to populate 'Original Owner' where appropriate)**:
        {% for agent in agents %}
        - {{ agent.name }} ({{ agent.uuid }}): affiliated_org = {{ agent.affiliated_org or 'None' }}
        {% endfor %}

        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        {{ ctx.output_format }}
    "#
}
function ExtractAgentParticipations(scene_text: string, registry_context: string?, story_synopsis: string?, event: Event, scene_number: int) -> AgentParticipation[] {
  client OpenRouter
  prompt #"
    {{ Narrative_analyst_persona ()}}

    **Objective**:
    Use your dramatic analysis to provide a comprehensive picture of agents' participation in an event, including insight into their state of mind.

    **Instructions**:
    1. **Analyze Scene and Event**: Determine which agents participate in the event *within the current scene {{ scene_number }}*.
    2. **AgentParticipation**: For each participation:
       - `agent`: Select the UUID from the provided `agents` list. Do *NOT* invent new agent UUIDs. *NEVER* rename entity uuids or you will break the connection.
       -  `event`: Use the existing UUID of the provided 'event'
       -  Fill out all other relevant properties
       - ONLY 'agent_' entities from the entity list provided can have a agent participation. Do *NOT* use 'org_' version or other other entity types.
    3. **UUID**: This will be assigned in post-processing.

    [EXAMPLE]
    {
    "uuid": "participation_agent_jean_luc_picard-event_1_4",
    "agent": "agent_jean_luc_picard",
    "event": "event_1_4",
    "current_status": "Commanding Ensign Taur to set course for investigation.",
    "emotional_state": "Confident and resolute.",
    "active_plans": [
        "Initiate travel to Melatrite III",
        "Explore the energy readings firsthand"
    ],
    "beliefs": [
        "Proactive investigation will yield answers",
        "The crew's safety and the mission's success are paramount"
    ],
    "goals": [
        "Gather more data from Melatrite III",
        "Ensure the crew is prepared for possible encounters"
    ]
    },
    [/EXAMPLE]


    **Story Context (use for background context when processing provided scene)**:
    {{ story_synopsis }}

    **Entity Registry (base the participation only on the relevant object entity name/uuid from this list)**
    {{ registry_context }}
    
    {{ _.role('user') }}
    **Event Description**:
    {{ event.description }}
   
    **Event UUID:**
    {{event.uuid}}

    **Scene to Analyze**:
    Scene number {{ scene_number }}
    {{ scene_text }}
    <end of scene>

    {{ ctx.output_format }}
  "#
}

function ExtractObjectInvolvements(scene_text: string, registry_context: string?, story_synopsis: string?, event: Event, scene_number: int) -> ObjectInvolvement[] {
  client OpenRouter
  prompt #"
    {{ Narrative_analyst_persona ()}}

    **Objective**:
    Use your dramatic analysis to provide a comprehensive picture of objects' literal or subtextual involvement in an event, including who used it.

    **Instructions**:
    1. **Review Scene and Event**: Determine which objects are involved (directly or indirectly) *within the current scene {{ scene_number }}*.
    2. **ObjectInvolvement**: For each object involved:
        - `object`: Select the UUID from the provided `objects` list. Do *NOT* invent new object UUIDs. *NEVER* rename entity uuids or you will break the connection.
        - `event`: Use the existing UUID of the provided 'event
        - Fill out all other relevant properties.
        - ONLY 'object_' entities can have an object involvement. Do not use other entity types.
    3.  **UUID**: This will be assigned in post processing.

    [EXAMPLE]
    {
    "uuid": "involvement_object_varga_thorn-event_2_12",
    "object": "object_varga_thorn",
    "event": "event_2_12",
    "description_of_involvement": "Marc Cory examines Garvey's body and discovers a Varga thorn embedded in Garvey's flesh, identifying the cause of his transformation.",
    "object_status_before_event": "The Varga thorn was embedded in Jeff Garvey's flesh, unnoticed.",
    "object_status_after_event": "The Varga thorn is removed from Garvey's body during the examination."
     },
     [/EXAMPLE]

    **Story Context (use for background context when processing provided scene)**:
    {{ story_synopsis }}

    **Entity Registry (base the involvement only on the relevant object entity name/uuid from this list)**
    {{ registry_context }}
    
    
    {{ _.role('user') }}
    **Event Description**:
    {{ event.description }}
    **Event UUID:**
    {{event.uuid}}

    **Scene to Analyze**:
    Scene number {{ scene_number }}
    {{ scene_text }}
    <end of scene>

    {{ ctx.output_format }}
  "#
}

function ExtractLocations(scene_text: string, story_synopsis: string?, scene_number: int) -> Location[] {
   client OpenRouter
   prompt #"
       {{ Narrative_analyst_persona ()}}

       **Objective**: Detail the principal location and other significant places.

       **Instructions**:
        1. **References**: Look for places (rooms, cities, planets, etc.) in dialogue and stage directions. If a scene is set here, it's always a location (not an object).
        2. **Specificity**: Prioritize specific rooms within larger buildings (e.g., "Situation Room" within the "White House").
        3. **Location vs. Object**: If an entity could be both, treat it as a location if it's a defined space where actions occur.
        4. **Description**: Provide a brief description if present.
        5. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        6. **Prefixed snake_case**: Location uuids should be prefixed ('location_') then use snake_case (never hyphens) to label the location (example: 'location_kosovo_serbia_border_region'). Avoid ampersands and apostophes in uuids.


        [EXAMPLE]
        {
        "name": "Steam Pipe Trunk Distribution Venue",
        "type": "Office",
        "description": "A windowless office space occupied by staff members amidst an atmosphere of tension and urgency. It contains remnants of intense work, such as crumpled papers and empty coffee cups, reflecting the pressure of the situation. The space serves as a backdrop for significant discussions and emotional exchanges related to the ongoing crises.",
        "uuid": "location_steam_pipe_trunk_distribution_venue"
        },
        [/EXAMPLE]

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}

       {{ _.role('user') }}
       **Scene to Analyze**:
       Scene number {{ scene_number }}
       {{ scene_text }}
        <end of scene>

       {{ ctx.output_format }}
   "#
}

function ExtractOrganizations(
    scene_number: int,
    scene_text: string,
    story_synopsis: string?,
    agents: Agent[],
    organizations: Organization[]
) -> Organization[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**: Extract and fill out comprehensive details of real or fictional organizations represented in the scene, referenced by characters, or named as an agent's 'affiliated_org'

        **Instructions**:
        1. **Definition**: An organization is a group or institution (e.g., military unit, government body) or a less formal grouping (e.g., "protesters").
        2. **Description**: Provide a brief description of the organization's role.
        3. **Members**: List organization 'members' using *valid UUIDs ONLY from the provided `agents` list*. Do *NOT* create new agent UUIDs.
        4. **Existing Organizations**: If an agent's `affiliated_org` refers to a known organization (in `organizations`), ensure the agent's UUID is in the organization's `members` list.
        5. **ASCII-only**: Avoid using non-ASCII characters in entity names (especially for affiliated_org). Normalize or transliterate names to a standard character set.
        6. **Prefixed snake_case**: Organization uuids should be prefixed ('org_') then use snake_case (never hyphens) to label the organization (example: 'org_umbrella_academy', 'org_daimler_benz'). Avoid ampersands and apostophes in uuids.

        [EXAMPLE]

            "org_national_security_council": {
                "uuid": "org_national_security_council",
                "name": "National Security Council",
                "description": "Advises the President on national security and foreign policy matters.",
                "sphere_of_influence": "United States government and its foreign relations.",
                "members": [
                    "agent_nancy_mcnally"
                ]
            },
        [/EXAMPLE]

        It's also fine for organizations that are referenced in passing to have no agent members, for example:

            "org_serbian_paramilitary_group": {
                "uuid": "org_serbian_paramilitary_group",
                "name": "Serbian Paramilitary Group",
                "description": "A paramilitary organization claiming responsibility for the attack on USAID workers.",
                "sphere_of_influence": "Serbia and areas affected by its armed groups.",
                "members": []
            },

        **Story Context (use for background context when processing provided scene)**:
        {{ story_synopsis }}
       
        {{ _.role('user') }}
        **Known Agents (if any)**:
        {% for agent in agents %}
        - {{ agent.name }} ({{ agent.uuid }}): affiliated_org = {{ agent.affiliated_org or 'None' }}
        {% endfor %}

        **Known Organizations (if any)**:
        {% for org in organizations %}
        - {{ org.name }} ({{ org.uuid }})
        {% endfor %}

        **Scene to Analyze**:
        Scene number {{ scene_number }}
        {{ scene_text }}
        <end of scene>

        {{ ctx.output_format }}
    "#
}

// Entity Resolution Stage

class ResolvedAgent {
    uuid string @description("Unique identifier for the agent in snake_case, derived from their name excluding title, honorific or rank, in the format 'agent_{agent_id}', for example 'agent_josiah_bartlet', 'agent_jean_luc_picard', 'agent_she_ra' Special exceptions for cases where the character's name *is* a title, such as 'agent_darth_vader'")
    agent_id string @description("Unique identifier derived from the agent's name in snake_case")
    name string @description("Full canonical name (including surname) of the dramatic agent (character) if you know it.")
    title string? @description("Official or informal role, title, or designation held by the agent within the narrative (e.g., 'Doctor', 'UNIT Commander', 'President of the United States', 'Lieutenant Commander').")
    aliases string[]? @description("Alternative names or titles used to refer to the agent.")
    description string @description("Comprehensive general (not scene-specific) character profile based on all known information in the story so far. This is an evergreen description but you'll keep adding to and revising it as the story progresses.")
    traits string[] @description("List of defining qualities and characteristics that describe the agent's personality, behavior, or abilities (e.g., 'Brave', 'Time Lord', 'Resourceful').")
    affiliated_org string|null @description("The organization the agent appears to be officially associated with. Expressed as a unique identifier in snake_case, in the format 'org_{org_id}' - e.g., 'org_department_of_justice', 'org_time_lords', 'org_galactic_empire', 'org_library_of_congress'.") @alias("affiliated_org_uuid")
    sphere_of_influence string? @description("Primary domain, area, or field where the agent exerts their power or influence (e.g., 'Time Travel', 'Military Strategy').")
    source_uuids string[]? @description("List of UUIDs of the original entities that were merged into this resolved entity.")
}

class ResolvedOrganization {
    uuid string @description("Unique identifier for the organization in snake_case, in the format 'org_<normalised_name>', for example 'org_time_lords', 'org_galactic_empire', 'org_united_federation_of_planets'")
    name string @description("Name of the organization.")
    description string @description("Description of the organization's purpose and role.")
    sphere_of_influence string @description("Area where the organization has influence.")
    members string[]|null @description("List of UUIDs of agents who are members of this organization.")
    source_uuids string[]? @description("List of UUIDs of the original entities that were merged into this resolved entity.")
}

class ResolvedObject {
    uuid string @description("Unique identifier for the object, following the format 'object_<normalized_name>'. Example: 'object_lcd_screens'.")
    name string @description("The official name of the object. Example: 'LCD Screens'.")
    description string @description("A detailed description of the object's nature, physical attributes, and role within the narrative.")
    purpose string @description("The intended use or function of the object within the context of the narrative. Example: 'To visualize satellite imagery for briefings'.")
    significance string @description("The narrative importance or symbolic meaning of the object. Example: 'Provides visual context for the Kosovo-Serbia situation'.")
    original_owner string|null @description("The UUID of the agent who originally owns the object, following the format 'agent_<agent_id>'. Example: 'agent_josh_lyman'. If no owner, set to null.")
    source_uuids string[]? @description("List of UUIDs of the original entities that were merged into this resolved entity.")
}

class ResolvedLocation {
    uuid string @description("Unique identifier for the location in snake_case, in the format 'location_{name}', for example 'location_mos_eisley' or 'location_hogwarts_castle'")
    name string @description("Name of the location.")
    description string @description("Detailed description of the location's characteristics.")
    type string @description("Type of location (e.g., City, Building, Planet, Office, Apartment).")
    source_uuids string[]? @description("List of UUIDs of the original entities that were merged into this resolved entity.")
}

function ResolveAgentCluster(entities: Agent[]) -> ResolvedAgent[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**:
        Disambiguate and resolve a list of Agent entities, identifying all unique agents present. Return the unique agents that account for all provided mentions.

        **Instructions**:
        1. **Consider Disambiguation First**: Prioritize *correctly distinguishing* unique agents before attempting to merge. Base your reasoning on all available data in the source entities, particularly name, description, and traits.
        2. **Unique Agent Identification**: Carefully assess each agent entity, taking into account their name, description, traits, and aliases. Only merge entities if there is *overwhelming evidence* they refer to the *exact same* individual. Avoid merging entities if there's even a slight chance they could be distinct characters.  Minor speaking characters may be identified only by number in the script ('Dalek 1', 'Soldier 2' etc.) Be careful to treat them as distinct.
        3. **Fact Preservation**: Ensure that for each unique agent, you do *not* make the names too similar, remove their title, or otherwise make errors that remove their identifying qualities.
        4. **Name Canonization**: Choose the most complete name as canonical, preferring names with surnames where available and ensuring consistency across the entire entity record. Be careful to avoid normalising to common terms
        5. **Contextual Awareness**: Use the description and traits to disambiguate entities. If two entities have significantly different descriptions or traits, they are likely different individuals, even if they share a similar name or alias.
        6. **Alias Handling**: Recognize that aliases may be shared between different characters, especially informal nicknames, which on their own are not enough evidence for merging. Treat all aliases as indicators or potential links, *not* as definitive proof.
        7. **Description & Trait Preservation**:
            - Merge descriptions into a single, cohesive, non-redundant description.
            -  Ensure that traits of each source entity is carried over to the consolidated description.
            - Correct spelling or factual errors that may have crept in to source entities
            - Combine traits without duplication.
            -  Do not overwrite existing data, ensure that data is carried through where accurate to do so.
        8. **Affiliation and Influence:** If an affiliated_org is mentioned, choose the most relevant one. If multiple sphere_of_influence values appear, pick the most representative one.
        9. **Source UUID Tracking**: Track UUIDs of original entities that were merged into this resolved entity. List them inside the `source_uuids` field.
        10. **Negative Constraint**: If two entities have distinct and mutually exclusive biographies or traits, they must not be merged, even if they share a name or role.
        11. **Default to Splitting:** If in doubt, default to preserving two entities as distinct. Only merge entities if you are absolutely certain they are the same.
        
        {{ _.role('user') }}
        Agents to consider for resolution:
        {{ entities }}

        *You MUST return ALL requested items in a single response.*

        ______
        {{ ctx.output_format }}
    "#
}

function ResolveOrganizationCluster(entities: Organization[]) -> ResolvedOrganization[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**:
        Disambiguate and resolve a list of Organization entities, identifying all unique organizations present. Return the unique organizations that account for all provided mentions.

        **Instructions**:
        1. **Consider Disambiguation First**: Prioritize *correctly distinguishing* unique organizations before attempting to merge. Base your reasoning on all available data in the source entities, particularly name, description, and sphere of influence.
        2. **Unique Organization Identification**: Carefully assess each organization entity, taking into account their name, description, sphere of influence, and members. Only merge entities if there is *overwhelming evidence* they refer to the *exact same* group or institution. Avoid merging entities if there's even a slight chance they could be distinct organizations.
        3. **Fact Preservation**: Ensure that for each unique organization, you do *not* make the names too similar, remove their title, or otherwise make errors that remove their identifying qualities.
        4. **Name Canonization**: Choose the most complete and descriptive name as canonical, ensuring consistency across the entire entity record. Be careful to avoid normalising to common terms
        5. **Contextual Awareness**: Use the description and sphere of influence to disambiguate entities. If two entities have significantly different descriptions or spheres of influence, they are likely different organizations, even if they share a similar name or alias.
        6. **Member List Handling**: Recognize that the member list are important to determine if the organization should be kept as unique, base your descision on whether it is mentioned as a member of this group. Treat all members as indicators or potential links, *not* as definitive proof.
        7. **Description & Sphere of Influence Preservation**:
            - Merge descriptions into a single, cohesive, non-redundant description.
            - Ensure that traits of each source entity is carried over to the consolidated description.
            - Correct spelling or factual errors that may have crept in to source entities
        8. **Membership Prioritization**: Use membership lists to differentiate organizations. Do not merge organizations with significantly different membership rosters.
        9. **Default to Splitting:** If in doubt, default to preserving two entities as distinct. Only merge entities if you are absolutely certain they are the same.
        10. **Source UUID Tracking**: Track UUIDs of original entities that were merged into this resolved entity. List them inside the `source_uuids` field.
       
        {{ _.role('user') }}
        Organizations to consider for resolution:
        {{ entities }}

        *You MUST return ALL requested items in a single response.*

        ______
        {{ ctx.output_format }}
    "#
}

function ResolveLocationCluster(entities: Location[]) -> ResolvedLocation[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**:
        Disambiguate and resolve a list of Location entities, identifying all unique locations present. Return the unique locations that account for all provided mentions.

        **Instructions**:
        1. **Consider Disambiguation First**: Prioritize *correctly distinguishing* unique locations before attempting to merge. Base your reasoning on all available data in the source entities, particularly name, description, and type.
        2. **Unique Location Identification**: Carefully assess each location entity, taking into account their name, description, and type. Only merge entities if there is *overwhelming evidence* they refer to the *exact same* place. Avoid merging entities if there's even a slight chance they could be distinct locations.
        3. **Be Specific**: Only merge locations with highly general names if the descriptions also align. For example, do not merge "a forest" and "the forest outside town", nor individual rooms within a bigger space if they are distinct in the scene structure.
        4. **Fact Preservation**: Ensure that for each unique location, you do *not* make the names too similar, remove their title, or otherwise make errors that remove their identifying qualities.
        4. **Name Canonization**: Choose the most specific and descriptive name as canonical (e.g., "White House Situation Room" is preferred over "White House"), ensuring consistency across the entire entity record. Be careful to avoid normalising to common terms.
        5. **Contextual Awareness**: Use the description and type to disambiguate entities. If two entities have significantly different descriptions or types, they are likely different locations.
        6. **Type Preservation**: Ensure that merged locations maintain the most specific and accurate location type. Prefer more specific types (e.g., "Office") over more general types (e.g., "Building").
        7. **Description Preservation**:
            - Merge descriptions into a single, cohesive, non-redundant description.
            - Correct spelling or factual errors that may have crept in to source entities
        8. **Default to Splitting:** If in doubt, default to preserving two entities as distinct. Only merge entities if you are absolutely certain they are the same.
        9. **Source UUID Tracking**: Track UUIDs of original entities that were merged into this resolved entity. List them inside the `source_uuids` field.
        
        {{ _.role('user') }}
        Locations to consider for resolution:
        {{ entities }}

        *You MUST return ALL requested items in a single response.*

        ______
        {{ ctx.output_format }}
    "#
}

function ResolveObjectCluster(entities: Object[]) -> ResolvedObject[] {
    client OpenRouter
    prompt #"
        {{ Narrative_analyst_persona ()}}

        **Objective**:
        Disambiguate and resolve a list of Object entities, identifying all unique objects present. Return the unique objects that account for all provided mentions.

        **Instructions**:

        1. **Consider Disambiguation First**: Prioritize *correctly distinguishing* unique objects before attempting to merge. Base your reasoning on all available data in the source entities, particularly name, description, purpose, and significance.

        2. **Unique Object Identification**: Carefully assess each object entity, taking into account their name, description, purpose, significance, and original owner. Only merge entities if there is *overwhelming evidence* they refer to the *exact same* item. Avoid merging entities if there's even a slight chance they could be distinct objects. Pay particular attention to:
            *   Ensure the uuid is correct and appropriately chosen. Avoid spelling out acronyms etc. in uuid labels.
            *   Only deduplicate clearly duplicate entries. Maintain granular distinction and don't attempt to merge compound objects into one.
            *   Object uuids should be prefixed ('object_') then use snake_case (not hyphens) to label the object (example: 'object_quantum_state_analyser')
        3. **Name Canonization**: Choose the most complete and and descriptive name as canonical for the 'name' property, but only if the meaning is still the same, and the meaning is well-described.
            *   Normalize or transliterate names and uuids to a standard character set (ASCII or similar) where necessary.
            *   Correct spelling or factual errors that may have crept in to source entities
        4. **Contextual Awareness**: Use the description, purpose, and significance to disambiguate entities. If two entities have significantly different descriptions, purposes, or significance, they are likely different objects.
        5.  **Original Owner Attribution**: Consider the `original_owner` property very carefully. Do not merge two objects unless they have the same likely or explicit `original_owner`, otherwise they are almost certainly different items.
        6. **Description Preservation**:
            - Merge descriptions of duplicate objects into a single cohesive, non-redundant description.
            - Combine purpose and significance fields if they provide distinct information; otherwise, choose the most informative one.
        7. **Consider 'One Of' scenarios carefully:** Only deduplicate entries with confidence. Make sure you're comparing object concepts - 'the quantum state analyser' rather than specific items 'this quantum state analyser'.
        8. **Multiple Owners**:  If multiple original_owner values are present, choose the most likely owner based on your understanding of the story.
        9. **Default to Splitting:** If in doubt, default to preserving two entities as distinct. Only merge entities if you are absolutely certain they are the same.
        10. **Source UUID Tracking**: Track UUIDs of original entities that were merged into this resolved entity. List them inside the `source_uuids` field.
        
        {{ _.role('user') }}
        Objects to consider for resolution:
        {{ entities }}

        *You MUST return ALL requested items in a single response.*

        ______
        {{ ctx.output_format }}
    "#
}
