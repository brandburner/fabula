// Refactored BAML Schema for Story Bible Generator with Treatment Context

generator story_bible_generator {
 output_type "python/pydantic"
 output_dir "../utils/storybible" // Adjust path as needed
 version "0.83.0" // Use your current BAML version
 default_client_mode "sync"
}

template_string Showrunner_Persona #"
  {{ _.role('system') }}
  You are a veteran story analyst and dramaturg with decades of experience in high-level television, film, and narrative design.

  You specialize in:
  - Identifying the core emotional and thematic spine of a story
  - Mapping character transformation arcs with clarity and precision
  - Distilling complex plot sequences into elegant, dramatic structures
  - Highlighting contradictions, conflicts, and unresolved tensions
  - Recognizing subtext, irony, and tonal modulation within scenes
  - Synthesizing both granular scene-level beats and macro narrative arcs

  You work in the tradition of master showrunners and script doctors. You value stories that:
  - Reveal the **emotional cost** of choices
  - Honor the **dramatic arc**, not just events
  - Explore **moral ambiguity**, power dynamics, and human contradiction
  - Use structure as a vessel for **meaning**, not a formula

  Your tone is:
  - Intelligent but not academic
  - Passionate but not melodramatic
  - Witty when appropriate, but never flippant
  - Always in service of clarity, drama, and insight

  You dislike:
  - Flat summaries with no emotional valence
  - Repetition of surface-level events
  - Overwritten purple prose
  - Scene-by-scene catalogues pretending to be story arcs

  You are here to produce **emotionally intelligent, structurally rigorous, and narratively rich output** that will guide writers, editors, producers, and story developers.

  Always remember: **A story is not what happens. It's what it *means* to the people it happens to.**
"#

template_string Veteran_story_editor #"
  {{ _.role('system') }}
  You are also a seasoned Hollywood story editor. You worked on prestige television, indie films, and studio blockbusters. Your expertise lies in refining story beats, ensuring thematic consistency, trimming fat, and highlighting structural weaknesses. You are surgically precise in breaking down acts, turning points, and character moments that either propel or stall narrative momentum.
"#

template_string Philosopher_dramaturge #"
  {{ _.role('system') }}
  You are also a philosopher-dramaturge trained in both classical narrative analysis and moral philosophy. Your role is to uncover the deeper meaning behind dramatic events, exploring how character decisions reflect ethical tensions, existential dilemmas, and systemic power dynamics. Use insights from Aristotle, Hume, Kant, and contemporary ethics to contextualize motivations and consequences.
"#

template_string Historian_of_fictional_cultures #"
  {{ _.role('system') }}
  You are also a cultural historian specializing in fictional civilizations, with deep expertise in sociopolitical systems, legal codes, and ethical norms across imagined universes. You treat narrative canon like archival material, analyzing it for cultural tensions, historical trends, and the evolution of norms and power structures. Think Clifford Geertz meets Memory Alpha.
"#

template_string Genre_analyst #"
  {{ _.role('system') }}
  You are also a genre theorist with a forensic eye for form, convention, and narrative expectation. Whether it's film noir, courtroom drama, sci-fi, or romantic tragedy, you dissect stories to understand how they reinforce, challenge, or deconstruct genre norms. You can name the trope, cite its history, and explain its evolution in the cultural zeitgeist.
"#

template_string Narrative_theologian #"
  {{ _.role('system') }}
  You are also a narrative theologian, skilled in interpreting stories through the lens of redemption, sacrifice, sin, and grace. You see narrative as modern scripture—where characters seek salvation, fall from moral heights, or undergo transformations mirroring spiritual awakening. You use language that reflects both gravitas and human yearning.
"#

// --- Core Data Structures ---

class Character {
  name string @description("Character's full name if you know it")
  description string @description("Rich description of personality, motivations, conflicts, relationships and arc")
  background string? @description("Character's backstory and context")
  personality_traits string[]? @description("List of key personality traits")
  motivations string? @description("Character's core motivations and goals")
  relationships string[]? @description("Key relationships with other characters")
  contradictions string[]? @description("Internal contradictions or paradoxes within the character (e.g., 'seeks connection but pushes people away')")
  character_arc_stages CharacterArcStage[]? @description("Key moments in this character’s growth")
  core_wound string? @description("A defining emotional wound or trauma that shaped the character")
  deep_need string? @description("What the character truly needs to grow, often in contrast with what they want")
  role string? @description("Character's role in the narrative (e.g., Protagonist, Antagonist, Mentor)")
  detailed_profile string? @description("Comprehensive character profile in narrative format with vibrant prose, generated by EnhanceCharacterProfile")
}

class CharacterArcStage {
  stage_name string @description("Narrative moment in arc (e.g., Realization, Breaking Point, Transformation)")
  description string @description("What changes in the character at this point")
}

class StoryLocation {
  name string @description("Location name or identifier")
  description string @description("Detailed, atmospheric description capturing the energy and significance of the location")
  significance string? @description("The location's importance to the story")
}

class Theme {
  name string @description("Theme name/title")
  description string @description("Vivid analysis of how this theme manifests in the narrative")
  examples string[]? @description("Specific examples of how this theme appears in the story")
  scene_manifestation string? @description("How this theme appears or is explored in a specific scene - used for scene analysis")
  opposing_theme string? @description("A contrasting or opposing theme that challenges or reframes this theme")
}

class PlotPoint {
  // ... (Existing fields unchanged) ...
  description string @description("Compelling description of a key event that drives the narrative forward")
  significance string? @description("The plot point's importance to the overall story")
  characters_involved string[]? @description("Characters involved in this plot point")
  irony string? @description("Any ironic, subversive, or unexpected reversal present in the plot point")
  audience_emotion string[]? @description("Target emotional beats this scene or moment is designed to provoke (e.g., shock, dread, joy)")
  // --- NEW EVIDENCE FIELDS ---
  evidence_dialogue string? @description("Optional: A specific, concise line of dialogue (max ~20 words) that exemplifies this plot point.")
  key_moment_text string? @description("Optional: A brief description (~1-2 sentences) of the key action or moment representing this plot point, especially if dialogue isn't suitable.")
}

class Conflict {
  // ... (Existing fields unchanged) ...
  description string @description("Propulsive description of a core tension or obstacle in the story")
  type string? @description("Type of conflict (e.g., internal, interpersonal, societal)")
  involved_characters string[]? @description("Characters involved in this conflict")
  escalation_level string? @description("Whether this conflict is being introduced, escalated, or resolved - used for scene analysis")
  // --- NEW EVIDENCE FIELDS ---
  evidence_dialogue string? @description("Optional: A specific, concise line of dialogue (max ~20 words) that exemplifies this conflict instance within a scene.")
  key_moment_text string? @description("Optional: A brief description (~1-2 sentences) of the key action or moment representing this conflict instance within a scene.")
}


class NarrativeStage {
  stage string @description("Name of the narrative stage (e.g., Exposition, Inciting Incident, Rising Action, etc.)")
  description string @description("Vibrant description of what happens in this stage of the narrative")
}

class CharacterDynamic {
  character_name string @description("Name of the character")
  role string @description("Role in the narrative (e.g., Protagonist, Antagonist, Mentor)")
  arc_description string @description("Vivid description of the character's arc and dynamics with other characters")
}

class CentralConflict {
  // ... (Existing fields unchanged) ...
  name string @description("Name of the conflict")
  description string @description("Powerful description of the conflict and its significance to the story")
  involved_characters string[]? @description("Characters involved in this conflict")
  // --- NEW EVIDENCE FIELDS ---
  evidence_dialogue string? @description("Optional: A key line of dialogue (max ~20 words) representing the core of this central conflict.")
  key_moment_text string? @description("Optional: A brief description (~1-2 sentences) of a key moment embodying this central conflict.")
}

// Consolidated comprehensive story elements class
class StoryElements {
 // ... (StoryElements definition mostly unchanged, uses updated sub-classes) ...
  characters Character[] @description("Cast of characters with rich personalities and arcs")
  locations StoryLocation[] @description("Vividly described significant locations")
  themes Theme[] @description("Thematic elements that permeate the narrative")
  plot_points PlotPoint[] @description("Key plot points that drive the narrative forward (now with evidence fields)")
  conflicts Conflict[]? @description("List of individual conflict instances noted across scenes (now with evidence fields)")
  narrative_structure NarrativeStage[]? @description("Overall narrative structure (e.g., 3-Act) derived from Treatment or final merge")
  character_dynamics CharacterDynamic[]? @description("Analysis of key character dynamics and relationships")
  central_conflicts CentralConflict[]? @description("Analysis of the 1-3 central conflicts driving the story (now with evidence fields)")
  conflict_arcs ConflictArc[]? @description("Analysis of the trajectory of major conflicts across scenes (now with evidence fields)")
}

// Consolidated summary with optional narrative structure
class Summary {
  summary_text string @description("Final story synopsis focusing on the overall arc, key turning points, and thematic resonance, written with vivid but concise prose.") // Updated description
  narrative_structure NarrativeStage[]? @description("Optional high-level dramatic structure breakdown (e.g., 3-Act) derived during final synthesis.") // Clarified purpose
  tone string? @description("Overall dominant tone of this summary (e.g., Tragic, Ironic, Cautionary, Hopeful), for validation or alignment.") // Added
  arc_focus string[]? @description("Primary character or thematic arcs emphasized in this summary (e.g., 'Henry's moral decline', 'Betrayal vs Loyalty', 'The Cost of Ambition')") // Added
}

class MarkdownBible {
  markdown_content string @description("Fully formatted markdown content for the story bible with vibrant prose")
}

class BibleMetadata {
  detail_level string @description("Level of detail in the bible - concise, standard, or detailed")
  chunks int @description("Number of chunks processed")
  processing_time_seconds float @description("Processing time in seconds")
  model string? @description("Model used for generation")
  generated_at string? @description("Timestamp of generation")
  treatment_generated bool? @description("Whether treatment context was used")
  parallel_extraction_used bool? @description("Whether parallel scene extraction was used")
}

// Scene-level analysis elements
class SceneCharacter {
  name string @description("Character's name")
  scene_description string @description("Character's actions, dialogue, and development in this specific scene")
  emotions string[]? @description("Emotions displayed by the character in this scene")
  relationships string[]? @description("Interactions with other characters in this scene")
  development_points string[]? @description("Any character growth or change shown in this scene")
}

class SceneLocation {
  name string @description("Location name")
  scene_description string @description("Vivid depiction of the location in this scene, including atmosphere")
  significance string? @description("The location's significance to this particular scene")
}

// Scene-level analysis elements
class SceneElements {
 // ... (Existing fields unchanged) ...
  scene_index int @description("Index of the scene/chunk being analyzed") // Keep name for BAML internal consistency
  scene_summary string @description("Brief, vibrant summary of the scene's core action and purpose")
  characters SceneCharacter[] @description("Characters appearing in this scene and their actions/development within it")
  locations SceneLocation[] @description("Locations featured in this scene")
  themes Theme[] @description("Themes explored or exemplified in this scene")
  conflicts Conflict[] @description("Specific conflicts presented or escalated in this scene (now with evidence fields)") // Uses updated Conflict class
  scene_beats MicroBeat[]? @description("The dramatic rhythm of the scene broken into 2-5 micro-beats")
  tone_profile SceneToneProfile? @description("The overall tone and emotional modulation of the scene")
  subtext_signals SubtextSignal[]? @description("Key moments of subtext or unspoken meaning in the scene")
  scene_purpose string? @description("The primary narrative or thematic function this scene serves (e.g., introduce character, raise stakes, reveal info, build tension)")
}

// --- Treatment Structure ---
class TreatmentAct {
  actNumber int @description("The act number (1, 2, or 3)")
  summary string @description("Detailed summary of the act's events")
  keyMoments string[] @description("List of key dramatic moments in this act")
}

class Treatment {
  title string @description("The title of the screenplay")
  logline string @description("One-sentence summary of the story")
  synopsis string @description("Detailed story treatment in prose form")
  mainCharacters string[] @description("List of brief main character descriptions (name and role/arc)")
  acts TreatmentAct[] @description("Breakdown of major story acts")
}


// --- BAML FUNCTIONS ---

// NEW: Function to generate the initial story treatment
function GenerateStoryTreatment(
  full_script: string,
  max_tokens: int @description("Maximum tokens for the treatment")
) -> Treatment {
  client CustomGemini25 // Use a capable client for whole-script analysis
  prompt #"
    {{ Showrunner_Persona ()}}
    {{ Veteran_story_editor ()}}

    STYLE INSTRUCTION: Create a comprehensive, structured treatment that captures the essence of the entire screenplay with clear, insightful prose.
    
    You are an experienced script doctor, story analyst, and screenwriting consultant. Your task is to read this entire screenplay and create a detailed, structured treatment that will serve as a foundation for more detailed scene analysis.
    
    Your treatment must include:
    
    1. TITLE: The title of the screenplay (infer from content if not explicitly stated, e.g., based on first page or prominent themes). If ambiguous, use "Untitled Screenplay".
    
    2. LOGLINE: A single compelling sentence (25-40 words) that captures the protagonist, their goal, the central conflict, and the stakes.
    
    3. SYNOPSIS: A detailed prose treatment (target 500-800 words, but adjust based on script length and complexity) describing the overall narrative arc, key plot points, character journeys, and thematic resonance. Write with vibrant, propulsive prose.
    
    4. MAIN CHARACTERS: A list of 3-7 key characters. For each, provide a brief description (1-2 sentences) covering their essential role, core motivation/conflict, and primary arc. Format as strings like: "CHARACTER NAME: Description..."
    
    5. ACT STRUCTURE: Break down the story into the intended number of acts (typically 3 acts for movies and UK television, or 5 acts for US television). For each act:
       - Provide a detailed summary (200-300 words) of the act's main events, character progression, and rising/falling action.
       - List 3-5 key dramatic moments or turning points within that act.
    
    This treatment will be used to provide context for a more detailed scene-by-scene analysis. Focus on elements that ground scene-level analysis within the broader narrative: overall plot, character arcs, major turning points, and core themes. Ensure the act summaries logically connect.
    
    {{ _.role("user") }}
    Here is the full screenplay:
    --- START SCRIPT ---
    {{ full_script }}
    --- END SCRIPT ---
    
    Create a comprehensive, structured treatment that captures the essence of this screenplay within approximately {{ max_tokens }} tokens.
    
    {{ ctx.output_format }}
  "#
}


// UPDATED: Function for chunk summarization with context
function SummarizeChunkWithContext(
  chunk_text: string,
  story_treatment: Treatment? @description("Optional structured story treatment providing context"),
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  max_tokens: int? @description("Maximum tokens for the summary output")
) -> Summary { // Still returns Summary class, but prompt ensures only summary_text is generated here
  client CustomGemini // Or potentially a faster/cheaper client for chunks
  prompt #"
    {{ Showrunner_Persona ()}}
    STYLE INSTRUCTION: Write with vivid, propulsive prose. Your language should be as gripping and compelling as the events you describe.
    
    You are a world-class narratologist and script editor. You excel at distilling narrative excerpts while preserving dramatic impact. You never refer to 'excerpts' or 'chunks'.
    
    {% if story_treatment %}
    OVERALL STORY CONTEXT (Use for understanding characters, themes, and general plot direction):
    Title: {{ story_treatment.title }}
    Logline: {{ story_treatment.logline }}
    Synopsis Overview: {{ story_treatment.synopsis }}
    Main Characters: {{ story_treatment.mainCharacters | join(", ") }}
    Act Structure Overview: {# Brief overview for context #}
    {% for act in story_treatment.acts %}
    - Act {{ act.actNumber }}: Key Moments: {{ act.keyMoments | join(", ") }}
    {% endfor %}
    
    Using the context above for background understanding, create a {{ detail_level }} summary focusing *only* on the specific events, actions, dialogue, and character interactions *within the provided script passage*.
    {% else %}
    Create a {{ detail_level }} summary of this part of the story, explaining what's happening in the plot and providing helpful context based *solely on the passage below*.
    {% endif %}
    
    {% if max_tokens %}
    Your summary should capture the dramatic detail and energy of the passage within approximately {{ max_tokens }} tokens.
    {% endif %}
    
    Focus exclusively on:
    - Immediate plot events and actions within this passage.
    - Character motivations and interactions *as seen in this passage*.
    - Dialogue highlights or key information revealed *in this passage*.
    - Setting and atmosphere if significant *in this passage*.
    - Any conflicts introduced or escalated *in this passage*.
    
    Write with a storyteller's voice, avoiding meta-references to the text itself (like "this passage shows").
    
    **CRITICAL OUTPUT INSTRUCTION:** For this task, ONLY provide the `summary_text`. Do NOT attempt to determine or output the `narrative_structure` (like Exposition, Rising Action, etc.) for this specific passage.
    
    {{ _.role("user") }}
    Script Passage:
    --- START PASSAGE ---
    {{ chunk_text }}
    --- END PASSAGE ---
    
    Generate the summary text based *only* on the events in this passage.
    
    {{ ctx.output_format }}
    "#
}

// UPDATED: Function for merging summaries with context
function MergeSummariesWithContext(
  summaries: string[],
  story_treatment: Treatment? @description("Optional structured story treatment providing overall context"),
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  is_final_merge: bool @description("Whether this is the final merge to produce the complete summary"),
  max_tokens: int? @description("Maximum tokens for the merged summary output")
) -> Summary { // Returns Summary class now
  client CustomGemini25 // Or a client good at synthesis
  prompt #"
    {{ Showrunner_Persona ()}}

    STYLE INSTRUCTION: Maintain and enhance the vibrant, propulsive prose style throughout your merged summary. Ensure narrative coherence and flow.
    
    You are a master storyteller and narrative synthesizer. You excel at integrating narrative summaries into cohesive story accounts.
    
    {% if story_treatment %}
    OVERALL STORY CONTEXT:
    Title: {{ story_treatment.title }}
    Logline: {{ story_treatment.logline }}
    Synopsis Overview: {{ story_treatment.synopsis }} {# Truncate for brevity #}
    Main Characters: {{ story_treatment.mainCharacters | join(", ") }}
    Act Structure Overview:
    {% for act in story_treatment.acts %}
    - Act {{ act.actNumber }}: {{ act.summary }} Key Moments: {{ act.keyMoments | join(", ") }}
    {% endfor %}
    {% endif %}
    
    {{ _.role("user") }}
    Here are multiple sequential summaries recounting parts of the story:
    
    {% for summary in summaries %}
    --- SUMMARY {{ loop.index }} ---
    {{ summary }}
    
    {% endfor %}
    
    {% if is_final_merge %}
    Synthesize these summaries into the definitive, comprehensive {{ detail_level }} story synopsis. This is the final overview of the *entire* story based on the provided summaries.
    - Ensure a smooth narrative flow, connecting events logically.
    - Weave together plot progression, character development, and thematic elements.
    - Resolve minor inconsistencies if possible, favoring the most plausible narrative thread.
    {% if story_treatment %}
    - Align the narrative with the overall structure and character arcs provided in the STORY CONTEXT.
    {% endif %}
    {% if max_tokens %}
    Your complete synopsis should capture the dramatic detail and energy of the story with vibrant, propulsive prose, within approximately {{ max_tokens }} tokens.
    {% endif %}
    
    {% else %}
    Synthesize these sequential passages into a single, longer, cohesive narrative account.
    - Maintain the chronological flow of events as presented in the summaries.
    - Preserve key narrative details, character actions/dialogue, and thematic threads.
    - Ensure the writing tone remains consistent and engaging.
    {% if story_treatment %}
    - Use the STORY CONTEXT to inform connections between events and character motivations.
    {% endif %}
    {% if max_tokens %}
    Your synthesis should capture the dramatic detail and energy, within approximately {{ max_tokens }} tokens.
    {% endif %}
    {% endif %}
    
    Your integrated summary should read naturally as a single narrative. Avoid meta-references like "Summary 1 says..." or "combining these summaries...". Write with the authoritative voice of someone recounting the story.
    Use the provided context (if available) to ensure consistency and depth. Create propulsive prose that brings the story to life.
    
    {{ ctx.output_format }}
  "#
}

// Enhanced character profile generation (No direct context needed, uses summaries generated WITH context)
function EnhanceCharacterProfile(
  character_name: string,
  character_description: string, // Basic description from initial extraction
  relevant_chunks: string[] // Summaries of chunks where character appears
) -> Character { // Return the full Character object with enhanced details
  client GemkuA
  prompt #"
    {{ Showrunner_Persona ()}}
    {{ Historian_of_fictional_cultures ()}}
    STYLE INSTRUCTION: Create a character profile with vivid, propulsive prose. Your language should paint a rich psychological portrait that reveals their complexities and motivations.
    
    You are a character dramaturg with deep psychological insight and a storyteller’s intuition. You identify core motivations, internal contradictions, and long-form emotional arcs. You understand that people change in stages—reluctantly, imperfectly, under pressure—and you trace those patterns like a forensic psychologist for narrative design.


    Create a comprehensive, enhanced character profile for **{{ character_name }}**.
    Start with the basic description provided, then enrich it using details and nuances found in the relevant story excerpts.
    
    Basic Information:
    Name: {{ character_name }}
    Initial Description: {{ character_description }}
    
    Relevant Story Excerpts (Summaries of scenes involving the character):
    {% for chunk in relevant_chunks %}
    --- EXCERPT {{ loop.index }} ---
    {{ chunk }}
    {% endfor %}
    
    Synthesize all available information into an updated, detailed character profile covering:
    
    1.  **Name**: {{ character_name }}
    2.  **Description**: Rewrite the initial description into a richer, more nuanced overview incorporating insights from the excerpts.
    3.  **Background**: Infer or extract any backstory hinted at in the excerpts.
    4.  **Personality Traits**: List specific traits observed in the excerpts, providing brief examples if possible.
    5.  **Motivations**: Refine understanding of core drives based on actions/dialogue in excerpts.
    6.  **Relationships**: Describe key interactions and relationship dynamics seen in the excerpts.
    7.  **Character Arc**: Identify moments of change, decision, or revelation in the excerpts that contribute to their overall arc.
    8.  **Role**: Confirm or refine their narrative role based on their actions in the excerpts.
    9.  **Detailed Profile**: Write a cohesive narrative paragraph (100-200 words) summarizing the character's essence, complexities, and journey as revealed across the provided information. Use vibrant prose.
    
    Focus on integrating information smoothly. The final output should be a complete `Character` object.
    
    {{ _.role("user") }}
    Please create the enhanced character profile for {{ character_name }}.
    
    {{ ctx.output_format }}
  "#
}

// Function to extract scene elements (No direct context needed)
function ExtractSceneElements(
  scene_text: string,
  scene_index: int,
  scene_summary: string? @description("Optional pre-generated summary of the scene for context"),
  known_characters: CharacterIndex[]? @description("Optional: List of characters identified in pre-scan") // <-- NEW PARAMETER
) -> SceneElements {
  client CustomGemini // Use a capable model for multi-faceted analysis
  prompt #"
    {{ Showrunner_Persona ()}}
    STYLE INSTRUCTION: Extract elements using clear, concise language for structure, but use vibrant prose for descriptions (e.g., character actions, location atmosphere, tone). Be analytical about beats, tone, and subtext.

    You are an expert dramaturg, script analyst, and narrative designer specializing in deep scene analysis. Analyze this specific scene comprehensively.

    {% if scene_summary %}
    Contextual Scene Summary: {{ scene_summary }}
    {% endif %}

    {% if known_characters %}
    KNOWN CHARACTERS (Identified in script pre-scan. Pay close attention if they appear in *this specific scene*):
    {% for char_info in known_characters %}
    - {{ char_info.name }} {% if char_info.likely_importance %}(Importance Estimate: {{ char_info.likely_importance }}){% endif %}
    {% endfor %}
    {% endif %}


    Based *only* on the scene text provided below, extract the following elements for Scene #{{ scene_index }}:

    1.  **scene_index**: {{ scene_index }}
    2.  **scene_summary**: Create a brief (1-3 sentence) vibrant summary of the core action/purpose of *this specific scene*.
    3.  **characters**: For each character *appearing* in this scene: name, scene_description... **Cross-reference against the KNOWN CHARACTERS list.** Ensure you capture actions/dialogue for any known characters present here.
    4.  **locations**: For each location *used* in this scene: name, scene_description (atmosphere/use *in this scene*), significance *to this scene*.
    5.  **themes**: For themes explored *in this scene*: name, scene_manifestation, specific examples (dialogue, actions, imagery) *from this scene*.
    6.  **conflicts**: For conflicts present *in this scene*: description, involved characters, escalation_level (introduced, escalated, continued, climax, resolved *in this scene*). Also include `evidence_dialogue` (a key quote from this scene) or `key_moment_text` (a brief action description from this scene) *if* one clearly represents this specific conflict instance. Otherwise, leave blank.
    7.  **scene_beats**: Identify the dramatic rhythm. Break the scene down into 2-5 distinct `MicroBeat`s (name, description, emotional_shift). Focus on turning points or shifts in dynamic/information.
    8.  **tone_profile**: Analyze the scene's tone. Provide the `dominant_tone`, any notable `tone_shifts` within the scene, and the intended audience `emotional_targets`.
    9.  **subtext_signals**: (Optional but valuable) Identify 1-3 key moments of subtext. For each `SubtextSignal`, provide the `surface_dialogue`/action, the `implied_meaning`, `relational_implication`, and `character_inference`. Focus on moments where characters hide meaning or reveal something indirectly.
    10. **scene_purpose**: Concisely state the primary narrative or thematic function this scene serves (e.g., introduce character, raise stakes, reveal info, build tension, explore theme X, resolve conflict Y).

    {{ _.role("user") }}
    Scene #{{ scene_index }} Text:
    --- START SCENE ---
    {{ scene_text }}
    --- END SCENE ---

    Extract the comprehensive elements for this scene, attempting to populate evidence fields for conflicts where appropriate.

    {{ ctx.output_format }}
  "#
}


// Function to merge scene elements (No direct context needed)
function MergeSceneElements(
  scene_elements: SceneElements[],
  known_characters: CharacterIndex[]? @description("Optional: List of characters identified in pre-scan") // <-- NEW PARAMETER
) -> StoryElements { // Output the main StoryElements structure
  client CustomGemini // Use a client good at synthesis across many inputs
  prompt #"
    {{ Showrunner_Persona ()}}
    STYLE INSTRUCTION: Synthesize elements using vibrant, propulsive prose for descriptions. Focus on identifying patterns, arcs, and overall significance across scenes.
    
    You are a master dramaturg and narrative analyst skilled in synthesizing detailed scene-by-scene data into a cohesive, comprehensive understanding of a story's core components.
    
    {% if known_characters %}
    PRE-SCANNED CHARACTERS (Reference this list for completeness and importance hints when building the final character profiles):
    {% for char_info in known_characters %}
    - {{ char_info.name }} {% if char_info.likely_importance %}(Importance Estimate: {{ char_info.likely_importance }}){% endif %}
    {% endfor %}
    {% endif %}

    Analyze the provided elements extracted from individual scenes and merge them into the overall `StoryElements` structure. Your goal is not just to list items, but to synthesize the information to reveal development and significance across the entire narrative.
    
    For each category:
    
    1.  **Characters**: Synthesize scene appearances into rich profiles.
        **Use the PRE-SCANNED CHARACTERS list as a guide to ensure significant characters are included and their roles/importance are considered.**
        *   Track changes in behavior, relationships, and stated goals across scenes.
        *   Identify consistent personality traits and underlying motivations.
        *   Construct the overall character arc (development, key turning points) based *only* on the provided scene data.
        *   Determine their likely narrative role.
        *   Write a comprehensive `description` capturing this synthesized understanding.
    2.  **Locations**: Create unified descriptions for recurring locations.
        *   Combine descriptions from different scenes.
        *   Note changes in atmosphere or usage.
        *   Determine the overall `significance` of the location to the story based on its use across scenes.
    3.  **Themes**: Analyze how themes emerge and develop.
        *   Group related thematic mentions from different scenes under a common theme `name`.
        *   Write a `description` analyzing the theme's evolution and exploration.
        *   Compile representative `examples` from various scenes.
    4.  **Plot Points**: Identify the *major* story beats based on significant events across scenes.
        *   Synthesize related scene events into larger plot points.
        *   Focus on events that clearly drive the narrative forward (inciting incidents, turning points, climaxes).
        *   Determine the `significance` of these major points.
    5.  **Conflicts**: Map the trajectory of conflicts.
        *   Identify recurring conflicts and trace their introduction, escalation, and potential resolution across scenes.
        *   Distinguish between scene-level conflicts and the major, overarching `Central Conflicts`.
        *   Determine the `type` and main `involved_characters` for significant conflicts.
    6.  **Narrative Structure**: (Infer if not explicitly provided elsewhere) Based on the flow of events suggested by the scene elements (plot points, conflicts, character arcs), outline the likely narrative stages (Exposition, Rising Action, Climax, etc.).
    7.  **Character Dynamics**: Based on synthesized character arcs and relationships, describe the key dynamics and evolving relationships between major characters.
    8.  **Central Conflicts**: Identify the 1-3 core conflicts that seem to drive the entire narrative based on the scene data. Describe their nature and significance.
    
    {{ _.role("user") }}
    Here are the elements extracted from each scene:
    
    {% for scene in scene_elements %}
    --- SCENE {{ scene.scene_index }} ---
    Summary: {{ scene.scene_summary }}
    Characters: {% for c in scene.characters %}{{ c.name }}({{ c.scene_description }}); {% endfor %}
    Locations: {% for l in scene.locations %}{{ l.name }}; {% endfor %}
    Themes: {% for t in scene.themes %}{{ t.name }}; {% endfor %}
    Conflicts: {% for c in scene.conflicts %}{{ c.description }}({{ c.escalation_level }}); {% endfor %}
    {% endfor %}
    
    Synthesize these scene elements into the comprehensive `StoryElements` structure. Focus on integration and analysis, not just listing.
    
    {{ ctx.output_format }}
  "#
}

// Final polished summary function for the Story synopsis section
function GeneratePolishedExecutiveSummary(
  initial_summary: string @description("The summary generated from merging chunks, potentially detailed."),
  detail_level: string @description("Desired level of detail: concise, standard, detailed"),
  max_tokens: int? @description("Approximate token limit for the final synopsis (e.g., standard might be ~800 tokens).")
) -> Summary { // Returns the enhanced Summary class
  client CustomGemini25 // Use a capable client for final synthesis and writing
  prompt #"
    {{ Showrunner_Persona ()}}
    STYLE INSTRUCTION: Synthesize a final story synopsis that reflects the full arc of the narrative with vivid, cinematic, and emotionally grounded prose. Focus on:
    - Character motivations and **transformation**
    - Key **turning points** and consequences
    - Thematic throughlines (e.g., loyalty, greed, identity)
    - The overall **dramatic shape** (rising action, climax, fallout)

    **Avoid scene-by-scene description.** Do not repeat dialogue or detailed set pieces unless they are **pivotal turning points** crucial to understanding the overall arc.

    Tone should be **dramatic but restrained**. Do not use overly poetic or florid language. Prioritize **narrative clarity, pacing, and emotional impact** over literary flourish.

    This is not a chapter-by-chapter recounting. It is a **coherent, compelling narrative arc** of the full story, suitable for a show bible or pitch deck synopsis. Assume the reader has access to scene summaries and character breakdowns elsewhere.

    Adhere to the requested {{ detail_level }} level of detail. Target approximately {{ max_tokens or 800 }} tokens. Include only the most essential events needed to understand the arc, characters, and themes.

    **DO NOT summarize the treatment again.** Focus on synthesizing the arc from the provided summary material.

    Optionally, identify the overall `tone` of the story as presented in your synopsis and the primary `arc_focus` (key character or thematic arcs emphasized).

    {{ _.role("user") }}
    Initial Merged Summary Material:
    --- START SUMMARY MATERIAL ---
    {{ initial_summary }}
    --- END SUMMARY MATERIAL ---

    Synthesize this material into the final, polished story synopsis, following all instructions regarding scope, tone, style, and purpose. Output should conform to the `Summary` class structure, focusing primarily on `summary_text`.

    {{ ctx.output_format }}
  "#
}

// --- NEW BAML Classes ---

// For Step 0: Character Pre-Scan
class CharacterIndex {
  name string @description("Identified potential character name")
  likely_importance string? @description("Estimated importance (e.g., high, medium, low, unknown) based on frequency or context - optional")
}

// For Step 6: Conflict Arc Analysis
class ConflictArc {
  conflict_description string @description("Description of the overarching conflict being traced (e.g., 'Claudius vs. Sejanus for political influence')")
  type string @description("Type of conflict (e.g., Interpersonal, Internal/Psychological, Social/Institutional, Environmental)")
  involved_characters string[] @description("Main characters driving or significantly affected by this conflict arc")
  start_scene_index int? @description("Approximate scene/chunk index where this conflict arc begins or is clearly introduced") // Keep name for BAML internal consistency
  escalation_points string[]? @description("Descriptions or scene/chunk indices where the conflict significantly escalates or intensifies")
  climax_point string? @description("Description or scene/chunk index representing the peak intensity or turning point of this specific conflict arc")
  resolution_point string? @description("Description or scene/chunk index where the conflict arc resolves or concludes (if applicable, otherwise state 'unresolved' or 'persists')")
  // --- NEW EVIDENCE FIELDS ---
  evidence_dialogue string? @description("Optional: A defining line of dialogue (max ~20 words) that encapsulates this entire conflict arc.")
  key_moment_text string? @description("Optional: A brief description (~1-2 sentences) of a defining moment that represents this entire conflict arc.")
}


// --- NEW BAML Functions ---

// For Step 0: Character Pre-Scan
function PreScanCharacters(
  full_script: string
) -> CharacterIndex[] {
  client GemkuA // Or a faster/cheaper client suitable for pattern recognition
  prompt #"
    {{ Showrunner_Persona ()}}
    You are an expert script analyst tasked with quickly identifying potential character names.
    Scan the provided screenplay text and extract a list of likely character names.

    Focus on:
    - Names appearing in all caps at the start of lines (potential dialogue cues).
    - Names mentioned frequently in action lines or dialogue.
    - Avoid common script elements like INT., EXT., V.O., O.S., CONTINUED, FADE IN, FADE OUT.
    - Try to estimate the character's importance based on frequency or context (e.g., appearing early, mentioned often). Use 'high', 'medium', 'low', or 'unknown'.

    Return *only* the list of characters in the specified format. Do not include introductions or explanations.

    {{ _.role("user") }}
    Screenplay Text:
    --- START SCRIPT ---
    {{ full_script }}
    --- END SCRIPT ---

    Extract potential character names.

    {{ ctx.output_format }}
  "#
}

// For Step 8: Final Summary Synthesis
function SynthesizeNarrativeFromElements(
  initial_summary: string @description("The summary generated from merging chunks."),
  elements: StoryElements @description("The structured story elements, including enhanced characters and conflict arcs."),
  detail_level: string @description("Desired level of detail: concise, standard, detailed"),
  max_tokens: int? @description("Approximate token limit for the final summary.")
) -> Summary { // Returns the standard Summary class
  client GemkuA // Needs strong writing and synthesis skills
  prompt #"
    {{ Showrunner_Persona ()}}
    STYLE INSTRUCTION: Rewrite and enrich the initial summary using insights from the structured elements. Create a final, cohesive, and dramatically compelling narrative synopsis with vibrant, propulsive prose.

    You are a master editor and storyteller synthesizing the definitive narrative summary for a story bible. You have an initial draft summary and a detailed breakdown of the story's elements (characters, themes, conflicts, arcs).

    Your task is to **rewrite** the `initial_summary`, integrating the depth and specifics found in the `elements` to create the final, polished synopsis.

    Focus on:
    - **Grounding**: Ensure the narrative reflects the specific character arcs, motivations, and relationships detailed in `elements.characters`.
    - **Specificity**: Incorporate key plot points, location details, and thematic examples from `elements`.
    - **Conflict Integration**: Weave in the understanding of central conflicts and their trajectories (using `elements.central_conflicts` and `elements.conflict_arcs`).
    - **Cohesion**: Create a smooth, logical flow that reflects the narrative structure.
    - **Voice**: Maintain a compelling, dramatic, and engaging tone appropriate for the story.
    - **Detail**: Adhere to the requested `detail_level`.

    Do not simply append the elements; *integrate* their insights into the prose narrative. The output should be a single, flowing summary.

    {{ _.role("user") }}
    Initial Draft Summary:
    --- START INITIAL SUMMARY ---
    {{ initial_summary }}
    --- END INITIAL SUMMARY ---

    Structured Story Elements:
    --- START ELEMENTS ---
    Characters Overview: {% for char in elements.characters %} {{ char.name }} (Arc: {{ char.character_arc_stages or 'N/A' }}); {% endfor %}
    Themes Overview: {% for theme in elements.themes %} {{ theme.name }}; {% endfor %}
    Central Conflicts Overview: {% for conflict in elements.central_conflicts %} {{ conflict.name }}; {% endfor %}
    Conflict Arcs Overview: {% for arc in elements.conflict_arcs %} {{ arc.conflict_description }}; {% endfor %}
    (Full element details are available for your analysis)
    --- END ELEMENTS ---

    Synthesize the final {{ detail_level }} narrative summary, enriching the initial draft with insights from the structured elements. Target approximately {{ max_tokens }} tokens.

    {{ ctx.output_format }}
  "#
}

// --- NEW BAML Classes ---

class MicroBeat {
  name string @description("Concise dramatic beat name (e.g., Setup, Inciting Action, Confrontation, Reversal, Realization, Climax, Resolution)")
  description string @description("Brief summary (1 sentence) of what happens at this specific beat within the scene")
  emotional_shift string? @description("How the emotional tone shifts from start to end of this beat (e.g., 'hope to dread', 'calm to anger', 'confusion to clarity') - optional")
}

class SceneToneProfile {
  dominant_tone string @description("Primary overall tone of the scene (e.g., somber, ironic, suspenseful, intimate, frantic, satirical, romantic, threatening)")
  tone_shifts string[]? @description("Notable tone changes *within* the scene (e.g., 'shifts from suspense to relief then back to suspense')")
  emotional_targets string[]? @description("Intended audience emotional reactions at key moments (e.g., shock, sympathy, revulsion, anxiety, joy, pity)")
}


class SubtextSignal {
  surface_dialogue string @description("Quoted or paraphrased surface-level line or action")
  implied_meaning string @description("What is actually meant, felt, or intended beneath the surface")
  relational_implication string? @description("What this reveals or changes about the relationship between characters involved")
  character_inference string? @description("What this reveals about the speaker's internal state, hidden motives, or self-deception")
}

function TrackConflictTrajectory(
  all_scene_elements: SceneElements[]
) -> ConflictArc[] { // Output remains list<ConflictArc>
  client CustomGemini // Needs good synthesis capability across list
  prompt #"
    {{ Showrunner_Persona ()}}
    {{ Genre_analyst ()}}
    STYLE INSTRUCTION: Synthesize conflict instances across scenes into clear, longitudinal conflict arcs. Describe the trajectory analytically.

    You are a senior story analyst and dramaturg. Given structured data from multiple scenes, including conflicts identified within each, your task is to identify recurring conflicts and trace their arcs throughout the entire narrative provided.

    Analyze the `conflicts` listed within each `SceneElements` object. Group related conflict instances (e.g., multiple scenes showing 'Character A vs Character B over X') into overarching `ConflictArc`s.

    For each significant conflict arc (focus on the 3-7 most important):
    1.  Define the core conflict (`conflict_description`).
    2.  Specify its `type` (Interpersonal, Internal, Social, etc.).
    3.  List the main `involved_characters`.
    4.  Estimate the `start_scene_index` based on where it's first mentioned or clearly emerges in the scene data.
    5.  Identify key `escalation_points` by citing scene indices or brief descriptions of escalating events found in the scene conflicts.
    6.  Pinpoint the `climax_point` (scene index or event description) representing the peak intensity or turning point.
    7.  Note the `resolution_point` (scene index or event description) or state if it remains unresolved based on the provided scene data.
    8.  Optionally, identify a single, defining `evidence_dialogue` (concise quote) or `key_moment_text` (brief action) *from any of the input scenes* that best encapsulates the *entire arc* of this conflict. This might be difficult; only include if a strong example exists.

    Consider the `escalation_level` provided for conflicts within each scene to help map the trajectory.

    {{ _.role("user") }}
    Here is the scene-by-scene conflict data embedded within scene elements:

    {% for scene in all_scene_elements %}
    --- SCENE {{ scene.scene_index }} ---
    {% if scene.conflicts %}
    Conflicts Present:
    {% for conflict in scene.conflicts %}
    - {{ conflict.description }} (Involving: {{ conflict.involved_characters | join(", ") }}; Stage: {{ conflict.escalation_level or 'N/A' }})
      {% if conflict.evidence_dialogue %} Evidence Dialogue: "{{ conflict.evidence_dialogue }}" {% endif %}
      {% if conflict.key_moment_text %} Key Moment: "{{ conflict.key_moment_text }}" {% endif %}
    {% endfor %}
    {% else %}
    Conflicts Present: None noted.
    {% endif %}
    {% endfor %}

    Analyze this data and identify the major conflict arcs, describing their trajectory and attempting to identify a defining piece of evidence for the whole arc where possible.

    {{ ctx.output_format }}
  "#
}


// --- NEW BAML Classes ---

// For LLM Scene Pattern Identification
class SceneHeadingPatterns {
  identified_patterns string[] @description("List of Python-compatible regex patterns identified for scene headings in the script sample. Should capture variations like INT./EXT., numbering, spacing, punctuation.")
  confidence string @description("Confidence in the identified patterns (e.g., High, Medium, Low).")
  reasoning string? @description("Brief explanation of why these patterns were chosen (e.g., 'Observed INT./EXT. and numbered formats').")
  example_matches string[]? @description("A few examples of lines from the sample that match the identified patterns.") // Helps debugging
}

// --- NEW BAML Functions ---

// For identifying scene heading patterns before splitting
function IdentifySceneHeadingPattern(
  script_sample: string @description("A representative sample from the beginning of the script (e.g., first 500-1000 lines or 10k characters).")
) -> SceneHeadingPatterns {
  client CustomGemini25 // Or another client good at pattern recognition and regex generation
  prompt #"
    {{ Showrunner_Persona ()}} // Use a relevant persona
    // Add another persona if helpful, e.g., Regex Expert
    {{ _.role('system') }}
    You are also an expert in regular expressions and screenplay formatting conventions.

    STYLE INSTRUCTION: Analyze the provided script sample carefully. Identify the specific formatting patterns used for SCENE HEADINGS ONLY. Generate accurate Python-compatible regex patterns.

    Your task is to analyze the provided sample text from a screenplay and determine the distinct patterns used to mark the beginning of new scenes (Scene Headings). These typically start with INT., EXT., I/E., E/I., sometimes preceded by a scene number (e.g., '1.', '12A.'), or use a period prefix for Fountain format (e.g., '.INTERIOR'). They often include location and time of day (DAY, NIGHT, CONTINUOUS).

    Consider variations in:
    - Abbreviations (INT./EXT., I/E, etc.)
    - Punctuation (periods, hyphens, spaces)
    - Optional scene numbering (digits, maybe letters, with or without dots/parentheses)
    - Spacing around elements
    - Case sensitivity (though assume headings are typically uppercase, regex should handle variations if observed)
    - Potential artifacts from PDF conversion (e.g., extra spaces, broken lines - try to create robust patterns).

    Generate a list of Python-compatible regex patterns (`identified_patterns`) that accurately capture **all** distinct scene heading formats observed in the sample. Each pattern should generally match the start of the line (`^`) and account for potential leading whitespace (`\s*`).

    Also provide:
    - Your `confidence` level (High, Medium, Low) that these patterns cover the primary scene headings in the script.
    - Optional `reasoning` for your pattern choices.
    - Optional `example_matches` (actual lines from the sample that match your patterns).

    **CRITICAL:** Do NOT create patterns for character names (like 'LORNE'), action lines, dialogue, parentheticals ('(beat)'), or transitions ('CUT TO:'). Focus *exclusively* on scene start markers/headings.

    {{ _.role("user") }}
    Screenplay Sample:
    --- START SAMPLE ---
    {{ script_sample }}
    --- END SAMPLE ---

    Identify the scene heading patterns used in this sample.

    {{ ctx.output_format }}
  "#
}