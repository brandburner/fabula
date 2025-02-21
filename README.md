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
```python
from main import main
import asyncio

asyncio.run(main())
```

3. Convert the processed data to Cypher:
```python
from json_cypher import main as generate_cypher
generate_cypher()
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
│   └── other utilities...
└── baml_src/
    └── myth06.baml       # BAML extraction definitions
```

## Key Components

### Script Pre-processing (`script2json.py`)

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

### Cypher Generation (`json_cypher.py`)

Converts processed story data into Neo4j Cypher queries for graph database import. Features:
- Generates schema cleanup and constraint creation
- Creates nodes for all entity types
- Establishes relationships between entities
- Handles metadata and properties
- Supports incremental updates

### Natural Language Queries (`fabula_graphrag.py`)

A work-in-progress tool that:
- Converts natural language questions into Cypher queries
- Uses RAG (Retrieval Augmented Generation) for accuracy
- Supports both vector and graph-based retrieval
- Provides explanations for query construction

Example usage (coming soon):
```python
from utils.fabula_graphrag import process_question

question = "What events involve the Weeping Angels?"
answer = process_question(question, neo4j_connection)
```

## Development Status

### Implemented
- Core extraction pipeline
- Entity resolution
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
