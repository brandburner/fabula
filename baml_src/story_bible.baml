// Refactored BAML Schema for Story Bible Generator with improved style preservation

// Core character type with comprehensive fields
class Character {
  name string @description("Character's name")
  description string @description("Rich description of personality, motivations, conflicts, relationships and arc")
  background string? @description("Character's backstory and context")
  personality_traits string[]? @description("List of key personality traits")
  motivations string? @description("Character's core motivations and goals")
  relationships string[]? @description("Key relationships with other characters")
  character_arc string? @description("Character's development throughout the story")
  role string? @description("Character's role in the narrative (e.g., Protagonist, Antagonist, Mentor)")
  detailed_profile string? @description("Comprehensive character profile in narrative format with vibrant prose")
}

class Theme {
  name string @description("Theme name/title")
  description string @description("Vivid analysis of how this theme manifests in the narrative")
  examples string[]? @description("Specific examples of how this theme appears in the story")
  scene_manifestation string? @description("How this theme appears or is explored in a specific scene - used for scene analysis")
}

class SetLocation {
  name string @description("Location name or identifier")
  description string @description("Detailed, atmospheric description capturing the energy and significance of the location")
  significance string? @description("The location's importance to the story")
}

class PlotPoint {
  description string @description("Compelling description of a key event that drives the narrative forward")
  significance string? @description("The plot point's importance to the overall story")
  characters_involved string[]? @description("Characters involved in this plot point")
}

class Conflict {
  description string @description("Propulsive description of a core tension or obstacle in the story")
  type string? @description("Type of conflict (e.g., internal, interpersonal, societal)")
  involved_characters string[]? @description("Characters involved in this conflict")
  escalation_level string? @description("Whether this conflict is being introduced, escalated, or resolved - used for scene analysis")
}

// Narrative structure elements
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
  name string @description("Name of the conflict")
  description string @description("Powerful description of the conflict and its significance to the story")
  involved_characters string[]? @description("Characters involved in this conflict")
}

// Consolidated comprehensive story elements class
class StoryElements {
  // Core narrative elements
  characters Character[] @description("Cast of characters with rich personalities and arcs")
  locations SetLocation[] @description("Vividly described significant locations")
  themes Theme[] @description("Thematic elements that permeate the narrative")
  plot_points PlotPoint[] @description("Key plot points that drive the narrative forward")
  conflicts Conflict[] @description("Core conflicts creating dramatic tension")
  
  // Enhanced narrative analysis elements (optional)
  narrative_structure NarrativeStage[]? @description("Breakdown of the narrative into dramatic stages")
  character_dynamics CharacterDynamic[]? @description("Analysis of key character dynamics and relationships")
  central_conflicts CentralConflict[]? @description("Analysis of the central conflicts driving the story")
}

// Consolidated summary with optional narrative structure
class Summary {
  summary_text string @description("Comprehensive summary text with vibrant, propulsive prose")
  narrative_structure NarrativeStage[]? @description("Optional breakdown of the narrative into dramatic stages")
}

// Markdown generation response
class MarkdownBible {
  markdown_content string @description("Fully formatted markdown content for the story bible with vibrant prose")
}

class BibleMetadata {
  detail_level string @description("Level of detail in the bible - concise, standard, or detailed")
  chunks int @description("Number of chunks processed")
  processing_time_seconds float @description("Processing time in seconds")
  model string? @description("Model used for generation")
  generated_at string? @description("Timestamp of generation")
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

class SceneElements {
  scene_index int @description("Index of the scene in the screenplay")
  scene_summary string @description("Brief, vibrant summary of the scene")
  characters SceneCharacter[] @description("Characters appearing in this scene")
  locations SceneLocation[] @description("Locations in this scene")
  themes Theme[] @description("Themes explored in this scene")
  conflicts Conflict[] @description("Conflicts presented in this scene")
}

// FUNCTIONS

// Function for chunk summarization with enhanced style guidance
function SummarizeChunk(
  chunk_text: string,
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  max_tokens: int? @description("Maximum tokens for the summary output")
) -> Summary {
  client GemkuA
  prompt #"
    STYLE INSTRUCTION: Write with vivid, propulsive prose. Your language should be as gripping and compelling as the events you describe.
    
    You are a world-class narratologist, historian, script editor, dramaturg, and narrative analyst with decades of experience. 
    You excel at distilling screenplays, novels, and short stories to their essential narrative elements while preserving the dramatic impact. 
    You never refer to 'excerpts' or use phrases like 'in this scene' as you understand you're analyzing complete narrative units.
        
    Create a {{ detail_level }} summary of this part of the story, explaining what's happening in the plot and providing helpful context.
    {% if max_tokens %}
    Your synopsis should capture the dramatic detail and energy of the passage.
    {% endif %}
    
    Capture the main storyline, character motivations, interpersonal dynamics, plot conflicts, and thematic elements. 
    Write with a storyteller's voice, avoiding meta-references to the text itself. 
    Focus on the narrative's beats, tensions, and character arcs.
    
    {{ _.role("user") }}
    Script content:
    {{ chunk_text }}
    
    {{ ctx.output_format }}
  "#
}

// Function for merging summaries with improved style preservation
function MergeSummaries(
  summaries: string[],
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  is_final_merge: bool @description("Whether this is the final merge to produce the complete summary"),
  max_tokens: int? @description("Maximum tokens for the merged summary output")
) -> Summary {
  client GemkuB
  prompt #"
    STYLE INSTRUCTION: Maintain and enhance the vibrant, propulsive prose style throughout your merged summary.
    
    You are a master storyteller and narrative analyst with decades of experience. 
    You excel at integrating narrative summaries to create comprehensive, coherent story outlines.
    
    {{ _.role("user") }}
    Here are multiple overlapping summaries recounting the same part of the story:
    
    {% for summary in summaries %}
    --- SECTION {{ loop.index }} ---
    {{ summary }}
    
    {% endfor %}
    
    {% if is_final_merge %}
    Create a {{ detail_level }} story synopsis and authoritative 'story bible' based on these summaries. Focus on narrative structure, 
    character dynamics, and central conflicts. This is the final comprehensive overview of the entire story.
    {% if max_tokens %}
    Your complete synopsis should capture the dramatic detail and energy of the story with vibrant, propulsive prose.
    {% endif %}
    
    Your story bible should be structured and comprehensive, covering:
    - Main plot and storylines
    - Character motivations and development
    - Key themes and conflicts
    - Setting and atmosphere
    {% else %}
    Synthesize these passages into a single cohesive account that preserves the key narrative elements, 
    character developments, and thematic threads and writing tone. Maintain the chronological flow of events.
    {% if max_tokens %}
    Your complete synthesis should capture the dramatic detail and energy of the story.
    {% endif %}
    {% endif %}
    
    Your integrated summary should flow naturally as if describing a single continuous narrative.
    Avoid meta-references like "in the first excerpt" or "according to the summary."
    Write with the authoritative voice of someone who understands the entire story.
    
    Always respond with a cohesive, well-formed narrative summary, even if the input summaries contain gaps or errors.
    Use your expertise to fill in logical connections between events and maintain narrative consistency.
    
    Remember: Create propulsive prose that brings the story to life.

    {{ ctx.output_format }}
  "#
}

// Comprehensive function for extracting story elements with narrative structure
function ExtractStoryElements(
  narrative_summary: string,
  narrative_structure: NarrativeStage[]? @description("Optional narrative structure breakdown")
) -> StoryElements {
  client GemkuA
  prompt #"
    You are a world-class script editor, dramaturg, and narrative analyst, specializing in the structured dissection of drama scripts according to a well-defined ontology.

    Based on the provided summary, extract the key narrative elements into a structured format. Write with vibrant, propulsive prose.

    1. CHARACTERS: For each character, include:
       - Name
       - A rich description capturing personality, motivations, conflicts, relationships, and arc
       - Background information where available
       - Key personality traits
       - Core motivations and goals
       - Significant relationships
       - Character development arc
       - Role in the narrative (protagonist, antagonist, etc.)

    2. LOCATIONS: All distinct spaces where action occurs, with detailed descriptions capturing atmosphere and significance.

    3. THEMES: The central thematic elements that permeate the narrative, with analysis of how they manifest and specific examples.

    4. PLOT POINTS: Key story beats that drive the narrative forward, including inciting incidents, turning points, complications, and resolutions.

    5. CONFLICTS: The core tensions and obstacles that create dramatic friction in the story, both external and internal.
    
    {% if narrative_structure %}
    6. NARRATIVE STRUCTURE: Using the provided structure, enhance it with additional insights.
    
    7. CHARACTER DYNAMICS: Analyze how characters relate to one another and their roles in the narrative.
    
    8. CENTRAL CONFLICTS: Identify the major conflicts that drive the entire narrative.
    {% endif %}

    {{ _.role("user") }}
    Summary:
    {{ narrative_summary }}
    
    {% if narrative_structure %}
    Narrative Structure:
    {% for stage in narrative_structure %}
    {{ stage.stage }}: {{ stage.description }}
    {% endfor %}
    {% endif %}
        
    {{ ctx.output_format }}
  "#
}

// Enhanced character profile generation
function EnhanceCharacterProfile(
  character_name: string,
  character_description: string,
  relevant_chunks: string[]
) -> Character {
  client GemkuA
  prompt #"
    STYLE INSTRUCTION: Create a character profile with vivid, propulsive prose. Your language should paint a rich psychological portrait that reveals their complexities and motivations.
    
    You are a master character analyst, narratologist, dramaturg, ontologist and screenwriter for screenplays and stories, with exceptional insight into human psychology and narrative dynamics.

    Create a comprehensive character profile for {{ character_name }} based on the provided information and relevant story excerpts.
    
    Basic Information:
    Name: {{ character_name }}
    Basic Description: {{ character_description }}
    
    {% if relevant_chunks %}
    Relevant Story Excerpts:
    {% for chunk in relevant_chunks %}
    --- EXCERPT {{ loop.index }} ---
    {{ chunk }}
    
    {% endfor %}
    {% endif %}
    
    Create a detailed character profile that includes:
    
    1. **Background and Context**: Any known history, social standing, and role within the story world.
    
    2. **Personality Traits**: A thorough analysis of key personality attributes with examples of how they manifest.
    
    3. **Motivations and Goals**: The character's core drives, both conscious and unconscious, that propel their actions.
    
    4. **Key Relationships**: How they relate to other characters and the dynamics that define these relationships.
    
    5. **Character Arc**: How the character transforms (or fails to transform) throughout the story.
    
    Format this as a cohesive, narrative profile that would be suitable for a professional story bible. Be specific, insightful, and thorough, drawing connections between different aspects of the character.
    
    {{ _.role("user") }}
    Please create a detailed character profile for {{ character_name }} using vibrant, propulsive prose.
    
    {{ ctx.output_format }}
  "#
}

// Dedicated function for generating a vibrant final summary
function GenerateVibrantFinalSummary(
  merged_summaries: string[],
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  max_tokens: int? @description("Maximum tokens for the summary, generous limit recommended")
) -> Summary {
  client GemkuA
  prompt #"
    You are a master storyteller crafting the definitive story synopsis sourced from the provided material.
    
    Your PRIMARY MISSION is to create a summary with:
    
    1. VIBRANT, PROPULSIVE PROSE that makes the story leap off the page
    2. RICH CHARACTER DESCRIPTIONS that reveal complex personalities and motivations
    3. DRAMATIC TENSIONS that highlight the life-or-death stakes
    4. POLITICAL INTRIGUE captured with the sophistication the material demands
    
    DO NOT HOLD BACK on length or detail - create a summary of {{ detail_level }} detail worthy of this tale.
    {% if max_tokens %}
    You have up to {{ max_tokens }} tokens to craft a truly compelling summary.
    {% endif %}
    
    CRITICAL NOTE: This summary will be the Story synopsis in the final story bible. It needs to maintain the vibrant, dramatic tone throughout and should be substantial enough to give readers a complete understanding of the story.
    
    {{ _.role("user") }}
    Here are merged summaries from different parts of the story:
    
    {% for summary in merged_summaries %}
    --- SECTION {{ loop.index }} ---
    {{ summary }}
    
    {% endfor %}
    
    Create the definitive summary of this story with vibrant, propulsive prose.
    
    {{ ctx.output_format }}
  "#
}

// Function to extract scene elements
function ExtractSceneElements(
  scene_text: string,
  scene_index: int,
  scene_summary: string? @description("Optional pre-generated summary of the scene")
) -> SceneElements {
  client GemkuA
  prompt #"
    STYLE INSTRUCTION: Extract elements using vibrant, propulsive prose.
    
    You are an expert dramaturg, narratologist, and script analyst specializing in extracting structured narrative elements from screenplay scenes.
    Your task is to analyze this scene and extract key narrative elements in a structured format.
    
    {% if scene_summary %}
    Scene Summary: {{ scene_summary }}
    {% endif %}
    
    Based on the scene provided, extract the following elements:
    
    1. CHARACTERS: For each character in the scene, identify:
       - Their name
       - What they do or say in this specific scene
       - Emotions they display
       - How they interact with others
       - Any character development shown in this scene
    
    2. LOCATIONS: For each location in the scene, identify:
       - The name/description of the location
       - How it's depicted (atmosphere, details mentioned)
       - Its significance to this particular scene
    
    3. THEMES: For each theme explored in the scene, identify:
       - The name of the theme
       - How it manifests in this particular scene
       - Specific examples (dialogue, actions) that express this theme
    
    4. CONFLICTS: For each conflict presented in the scene, identify:
       - A description of the conflict
       - Characters involved
       - Whether this conflict is being introduced, escalated, or resolved
    
    {{ _.role("user") }}
    Scene #{{ scene_index }}:
    {{ scene_text }}
    
    {{ ctx.output_format }}
  "#
}

// Function to merge scene elements
function MergeSceneElements(
  scene_elements: SceneElements[]
) -> StoryElements {
  client GemkuB
  prompt #"
    STYLE INSTRUCTION: Synthesize elements using vibrant, propulsive prose.
    
    You are a master dramaturg and narrative analyst with exceptional skill in synthesizing story elements across multiple scenes into cohesive character arcs, thematic developments, and narrative structures.
    
    Your task is to analyze scene-by-scene elements and merge them into comprehensive story elements that capture the dynamic development across the entire narrative.
    
    For each category, don't simply concatenate information but synthesize it to show development and change:
    
    1. CHARACTERS: Create rich character profiles that show their arc across scenes
       - Notice how they change from scene to scene
       - Identify patterns in their behaviors and relationships
       - Construct their overall arc and development
    
    2. LOCATIONS: Create detailed location descriptions that incorporate all appearances
       - Note how locations might change in atmosphere or significance
       - Identify patterns in how locations are used dramaturgically
    
    3. THEMES: Analyze how themes develop and evolve throughout the story
       - Track how themes interconnect and build upon each other
       - Identify the overall thematic structure
    
    4. CONFLICTS: Map how conflicts are introduced, escalated, and resolved
       - Trace conflict arcs across the entire narrative
       - Identify the central conflicts that drive the story
    
    5. NARRATIVE STRUCTURE: Based on all elements, analyze the overall narrative structure
       - Identify key turning points, rising action, climax, etc.
       - Analyze how the structure supports character and thematic development
    
    {{ _.role("user") }}
    Here are the elements extracted from each scene:
    
    {% for scene in scene_elements %}
    --- SCENE {{ scene.scene_index }} ---
    Summary: {{ scene.scene_summary }}
    
    Characters:
    {% for character in scene.characters %}
    - {{ character.name }}: {{ character.scene_description }}
    {% if character.emotions %}Emotions: {{ character.emotions | join(", ") }}{% endif %}
    {% if character.relationships %}Relationships: {{ character.relationships | join(", ") }}{% endif %}
    {% if character.development_points %}Development: {{ character.development_points | join(", ") }}{% endif %}
    {% endfor %}
    
    Locations:
    {% for location in scene.locations %}
    - {{ location.name }}: {{ location.scene_description }}
    {% if location.significance %}Significance: {{ location.significance }}{% endif %}
    {% endfor %}
    
    Themes:
    {% for theme in scene.themes %}
    - {{ theme.name }}: {{ theme.scene_manifestation }}
    {% if theme.examples %}Examples: {{ theme.examples | join(", ") }}{% endif %}
    {% endfor %}
    
    Conflicts:
    {% for conflict in scene.conflicts %}
    - {{ conflict.description }}
    {% if conflict.involved_characters %}Characters involved: {{ conflict.involved_characters | join(", ") }}{% endif %}
    {% if conflict.escalation_level %}Stage: {{ conflict.escalation_level }}{% endif %}
    {% endfor %}
    
    {% endfor %}
    
    {{ ctx.output_format }}
  "#
}

// Function to combine analyses from different approaches
function CombineNarrativeAnalyses(
  summary_based_elements: StoryElements,
  scene_based_elements: StoryElements? @description("Optional scene-based elements to combine")
) -> StoryElements {
  client GemkuA
  prompt #"
    STYLE INSTRUCTION: Combine analyses using vibrant, propulsive prose.
    
    You are a master dramaturg, script editor, and narrative analyst with exceptional skill in creating comprehensive story bibles.
    
    You've been provided with analyses of the same story:
    1. A top-down analysis based on the overall narrative summary
    2. A bottom-up analysis built by analyzing individual scenes (if provided)
    
    Your task is to create the definitive analysis that combines the strengths of both approaches:
    - The holistic perspective of the summary-based analysis
    - The granular detail and developmental tracking of the scene-based analysis (if provided)
    
    For each category of elements (characters, locations, themes, conflicts), create integrated descriptions that:
    - Preserve the overall arc and role from the summary analysis
    - Incorporate the detailed development patterns from the scene analysis (if provided)
    - Resolve any contradictions by favoring the more detailed or evidence-supported version
    - Create a richer, more nuanced understanding by combining both perspectives
    
    The final output should be a seamless integration that reads as a single, coherent analysis, not just a combination of two perspectives.
    
    {{ _.role("user") }}
    ANALYSIS 1 (Summary-based):
    
    Characters:
    {% for character in summary_based_elements.characters %}
    - {{ character.name }}: {{ character.description }}
    {% if character.background %}Background: {{ character.background }}{% endif %}
    {% if character.personality_traits %}Traits: {{ character.personality_traits | join(", ") }}{% endif %}
    {% if character.motivations %}Motivations: {{ character.motivations }}{% endif %}
    {% if character.relationships %}Relationships: {{ character.relationships | join(", ") }}{% endif %}
    {% if character.character_arc %}Arc: {{ character.character_arc }}{% endif %}
    {% endfor %}
    
    Locations:
    {% for location in summary_based_elements.locations %}
    - {{ location.name }}: {{ location.description }}
    {% if location.significance %}Significance: {{ location.significance }}{% endif %}
    {% endfor %}
    
    Themes:
    {% for theme in summary_based_elements.themes %}
    - {{ theme.name }}: {{ theme.description }}
    {% if theme.examples %}Examples: {{ theme.examples | join(", ") }}{% endif %}
    {% endfor %}
    
    Plot Points:
    {% for point in summary_based_elements.plot_points %}
    - {{ point.description }}
    {% if point.significance %}Significance: {{ point.significance }}{% endif %}
    {% if point.characters_involved %}Characters involved: {{ point.characters_involved | join(", ") }}{% endif %}
    {% endfor %}
    
    Conflicts:
    {% for conflict in summary_based_elements.conflicts %}
    - {{ conflict.description }}
    {% if conflict.type %}Type: {{ conflict.type }}{% endif %}
    {% if conflict.involved_characters %}Characters involved: {{ conflict.involved_characters | join(", ") }}{% endif %}
    {% endfor %}
    
    {% if summary_based_elements.narrative_structure %}
    Narrative Structure:
    {% for stage in summary_based_elements.narrative_structure %}
    - {{ stage.stage }}: {{ stage.description }}
    {% endfor %}
    {% endif %}
    
    {% if scene_based_elements %}
    ANALYSIS 2 (Scene-based):
    
    Characters:
    {% for character in scene_based_elements.characters %}
    - {{ character.name }}: {{ character.description }}
    {% if character.background %}Background: {{ character.background }}{% endif %}
    {% if character.personality_traits %}Traits: {{ character.personality_traits | join(", ") }}{% endif %}
    {% if character.motivations %}Motivations: {{ character.motivations }}{% endif %}
    {% if character.relationships %}Relationships: {{ character.relationships | join(", ") }}{% endif %}
    {% if character.character_arc %}Arc: {{ character.character_arc }}{% endif %}
    {% endfor %}
    
    Locations:
    {% for location in scene_based_elements.locations %}
    - {{ location.name }}: {{ location.description }}
    {% if location.significance %}Significance: {{ location.significance }}{% endif %}
    {% endfor %}
    
    Themes:
    {% for theme in scene_based_elements.themes %}
    - {{ theme.name }}: {{ theme.description }}
    {% if theme.examples %}Examples: {{ theme.examples | join(", ") }}{% endif %}
    {% endfor %}
    
    Plot Points:
    {% for point in scene_based_elements.plot_points %}
    - {{ point.description }}
    {% if point.significance %}Significance: {{ point.significance }}{% endif %}
    {% if point.characters_involved %}Characters involved: {{ point.characters_involved | join(", ") }}{% endif %}
    {% endfor %}
    
    Conflicts:
    {% for conflict in scene_based_elements.conflicts %}
    - {{ conflict.description }}
    {% if conflict.type %}Type: {{ conflict.type }}{% endif %}
    {% if conflict.involved_characters %}Characters involved: {{ conflict.involved_characters | join(", ") }}{% endif %}
    {% endfor %}
    
    {% if scene_based_elements.narrative_structure %}
    Narrative Structure:
    {% for stage in scene_based_elements.narrative_structure %}
    - {{ stage.stage }}: {{ stage.description }}
    {% endfor %}
    {% endif %}
    {% endif %}
    
    {{ ctx.output_format }}
  "#
}

// Function for markdown generation with programmatic assembly
function GenerateMarkdownBible(
  title: string,
  summary: string,
  elements: StoryElements,
  metadata: BibleMetadata
) -> MarkdownBible {
  client GemkuB
  prompt #"
    You are an expert in creating beautifully formatted, professional story bibles in markdown format.

    Create a comprehensive, well-structured markdown document based on the following story elements for "{{ title }}".
    
    The markdown should include these sections:
    1. Title (Story Bible)
    2. Metadata section with generation timestamp and provided metadata
    3. Story synopsis
    4. Characters section with detailed profiles
    5. Locations section
    6. Themes section
    7. Plot Points section
    8. Conflicts section
    
    For the metadata section, include:
    - Detail Level: {{ metadata.detail_level }}
    - Model: {{ metadata.model }}
    - Processing Time: {{ metadata.processing_time_seconds / 60 }} minutes
    - Chunks: {{ metadata.chunks }}
    
    Use rich formatting with appropriate headers, bullet points, and styling.
    Maintain a professional, cohesive structure throughout the document.
    The final output should be valid markdown that could be directly saved to a file.
    
    {{ _.role("user") }}
    I need a markdown story bible with the following content:
    
    Summary:
    {{ summary }}
    
    Characters:
    {% for character in elements.characters %}
    - {{ character.name }}: {{ character.description }}
    {% if character.detailed_profile %}
    Detailed profile: {{ character.detailed_profile }}
    {% endif %}
    {% endfor %}
    
    Locations:
    {% for location in elements.locations %}
    - {{ location.name }}: {{ location.description }}
    {% endfor %}
    
    Themes:
    {% for theme in elements.themes %}
    - {{ theme.name }}: {{ theme.description }}
    {% endfor %}
    
    Plot Points:
    {% for point in elements.plot_points %}
    - {{ point.description }}
    {% endfor %}
    
    Conflicts:
    {% for conflict in elements.conflicts %}
    - {{ conflict.description }}
    {% endfor %}
    
    {% if elements.narrative_structure %}
    Narrative Structure:
    {% for stage in elements.narrative_structure %}
    - {{ stage.stage }}: {{ stage.description }}
    {% endfor %}
    {% endif %}
    
    {% if elements.character_dynamics %}
    Character Dynamics:
    {% for dynamic in elements.character_dynamics %}
    - {{ dynamic.character_name }} ({{ dynamic.role }}): {{ dynamic.arc_description }}
    {% endfor %}
    {% endif %}
    
    {% if elements.central_conflicts %}
    Central Conflicts:
    {% for conflict in elements.central_conflicts %}
    - {{ conflict.name }}: {{ conflict.description }}
    {% endfor %}
    {% endif %}
    
    {{ ctx.output_format }}
  "#
}



// Final polished summary function for the Story synopsis section
function GeneratePolishedExecutiveSummary(
  summary: string,
  detail_level: string @description("Level of detail - 'concise', 'standard', or 'detailed'"),
  max_tokens: int? @description("Maximum tokens for the enhanced summary")
) -> Summary {
  client GemkuA
  prompt #"
    STYLE INSTRUCTION: Create a vibrant, propulsive Story synopsis that brings our story to life. Your prose should be rich, evocative, and dramatically compelling.
    
    You are a master storyteller specializing in historical drama and political intrigue. Your task is to transform the provided summary into a compelling Story synopsis for a story bible.
    
    {{ _.role("user") }}
    Here is a summary of the story:
    
    {{ summary }}
    
    Transform this into a {{ detail_level }} Story synopsis with vibrant, propulsive prose that brings the story to life.
    
    {% if max_tokens %}
    You have up to {{ max_tokens }} tokens - use them wisely to create a truly compelling summary.
    {% endif %}
    
    {{ ctx.output_format }}
  "#
}