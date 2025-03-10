# Fabula: AI-Powered Narrative Analysis Engine

![Fabula Demo](fabula_video.gif)

Fabula is an AI-powered narrative analysis engine that transforms unstructured narrative texts (scripts, novels, etc.) into richly structured knowledge graphs. By combining LLM-driven extraction with a robust entity resolution pipeline, Fabula enables deep analysis of story structure, character development, and thematic elements.

Inspired by the BBC's [Mythology Engine](https://www.bbc.co.uk/blogs/researchanddevelopment/2010/03/the-mythology-engine-represent.shtml), Fabula aims to unlock narrative information and make it explorable through graph-based queries.

## Core Features

- **Script Pre-processing**: Converts TV/film scripts from various formats into standardized JSON using `script2json.py`
- **LLM-Based Entity Extraction**: Uses BAML for structured extraction of:
  - Characters (Agents)
  - Locations
  - Objects
  - Organizations
  - Events
  - Relationships
- **Two-Pass Processing Pipeline**:
  - First Pass: Raw entity extraction
  - Second Pass: Detailed scene metadata, events, and participations
- **Entity Resolution**: Reconciles and merges duplicate entities using fuzzy matching and LLM-assisted resolution
- **Cypher Generation**: Converts processed data to Neo4j Cypher queries for graph database import
- **Natural Language Graph Queries**: Work-in-progress tool for converting natural language to Cypher queries

## Quick Start

### Prerequisites

```bash
# Required Python packages (requirements.txt coming soon)
pip install requests beautifulsoup4 thefuzz neo4j pydantic openai
```

You'll also need:
- Neo4j Desktop ([free version available](https://neo4j.com/))
- Access to an LLM API (by default the code uses OpenAI o3-mini)

### Basic Usage

1. Convert a script to JSON:
```bash
python script2json.py "http://chakoteya.net/DoctorWho/29-10.html" output.json
```

2. Process the script and generate the knowledge graph:
```bash
# Basic usage with default settings
python main.py input_file.json --output output_graph.json

# Using combined extraction mode (recommended for speed and efficiency)
python main.py input_file.json --combined --output output_graph.json

# Using fully combined extraction mode for max performance
python main.py input_file.json --fully-combined --output output_graph.json

# Using batch resolution for large datasets
python main.py input_file.json --batch-resolution --output output_graph.json
```

3. Convert the processed data to Cypher:
```python
from json_cypher import main as generate_cypher
generate_cypher()
```

## Processing Modes

Fabula offers several processing modes to balance speed, cost, and accuracy:

### Standard Mode
Standard mode processes each entity type separately and is good for small datasets or when you need maximum precision.
```bash
python main.py input_file.json
```

### Combined Mode (`--combined`)
Combined mode extracts all primary entities (agents, locations, organizations, objects) in a single pass, reducing API calls and improving consistency.
```bash
python main.py input_file.json --combined
```

### Fully Combined Mode (`--fully-combined`) RECOMMENDED
This mode extracts both primary and secondary entities (events, participations, etc.) in combined calls, offering the best performance. This is recommended for most use cases.
```bash
python main.py input_file.json --fully-combined
```

### Batch Resolution (`--batch-resolution`) RECOMMENDED
For large datasets, batch resolution processes entity resolution in smaller groups, improving performance and reducing API costs.
```bash
python main.py input_file.json --batch-resolution
```

### Multiple Flags
You can combine multiple flags for optimal performance:
```bash
python main.py input_file.json --fully-combined --batch-resolution
```

## Project Structure

```
fabula/
├── main.py                 # Main orchestration
├── episode_processor.py    # Episode-level processing
├── scene_processor.py      # Scene-level extraction
├── entity_registry.py      # Entity management/resolution
├── validation.py          # Reference validation
├── context.py            # Global context management
├── utils/
│   ├── script2json.py    # Script preprocessing
│   ├── fabula_graphrag.py # Natural language query tool
│   └── json_cypher.py  # Generate graph as Cypher statements
└── baml_src/
    └── myth06.baml       # BAML extraction definitions
```

## Key Components

### Script Pre-processing (`utils/script2json.py`)

The script converter is designed to work with TV/film scripts from sources like chakoteya.net. It:
- Parses HTML/text scripts into structured JSON
- Extracts scene boundaries, dialogue, and stage directions
- Handles multi-episode stories
- Supports various script formats

Example output structure:
```json
{
  "Story": "Blink",
  "Airdate": "2007-06-09",
  "Episodes": [
    {
      "Episode": "Episode One",
      "Scenes": [
        {
          "Scene": "WESTER DRUMLINS",
          "Dialogue": [
            {
              "Character": "SALLY",
              "Line": "Hello? Is someone there?"
            },
            {
              "Stage Direction": "Sally enters the abandoned house"
            }
          ]
        }
      ]
    }
  ]
}
```

### Cypher Generation (`utils/json_cypher.py`)

Converts processed story data into Neo4j Cypher queries for graph database import. Features:
- Generates schema cleanup and constraint creation
- Creates nodes for all entity types
- Establishes relationships between entities
- Handles metadata and properties
- Supports incremental updates

I can update the "Natural Language Queries" section of your README to better reflect the current state and capabilities of your system. Here's an improved version:

```markdown
## Natural Language Queries ('utils/fabula_graphrag.py')

The `fabula_graphrag.py` tool enables natural language querying of your narrative knowledge graphs, allowing exploration without writing Cypher queries:

### Features

- Dynamic schema extraction from Neo4j database
- LLM-based question decomposition for complex narrative inquiries
- BAML-constrained Cypher generation for accurate queries
- Multi-hop path exploration for deep narrative connections
- Rich answer synthesis with narrative context

### Usage

```python
# Basic usage
python fabula_graphrag.py

# With custom Neo4j connection
python fabula_graphrag.py --uri bolt://localhost:7687 --username neo4j --password password
```

Example questions:
- "What happens prior to the Doctor's arrival?"
- "How does Josh's emotional state change throughout the episode?"
- "Which characters visit the White House Situation Room?"
- "What objects are significant to the main character's development?"

### Implementation Details

The system:
1. Extracts and enriches the database schema with narrative semantics
2. Decomposes complex questions into focused sub-questions
3. Generates Cypher queries constrained by BAML templates
4. Traverses multi-hop relationships to find narrative connections
5. Synthesizes results into coherent narrative answers

The architecture combines BAML's structured output guarantees with rich narrative exploration capabilities, allowing both precise fact retrieval and deeper thematic analysis.
```

## Development Status

### Implemented
- Core extraction pipeline
- Entity resolution with batch processing
- Combined extraction modes
- Basic validation
- Script preprocessing
- Cypher generation

### In Progress
- Natural language query tool
- Enhanced entity resolution
- Requirements specification
- Documentation improvements
- Test coverage

### Planned
- Multi-modal support (extract from video)
- Additional script format support
- Interactive visualization
- API documentation
- Performance optimizations

## Contributing

While in active development, we welcome:
- Bug reports
- Feature suggestions
- Documentation improvements
- Script format contributions
- Ontology enhancements

Please open an issue to discuss potential changes.

## License

[License TBD]

## Acknowledgements

- BBC Mythology Engine for inspiration
- [chakoteya.net](http://chakoteya.net/) for script resources
- BAML team for the extraction framework
- Neo4j community for graph database expertise

---

For more information or to report issues, please open a GitHub issue.