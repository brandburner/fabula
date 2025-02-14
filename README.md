# Fabula: AI-Powered Narrative Analysis Engine

Fabula is an AI-powered narrative analysis engine designed to extract structured, interconnected data from narrative texts (such as drama scripts and novels). By leveraging advanced LLM-driven extraction (via the BAML library) and a robust entity resolution pipeline, Fabula transforms unstructured narratives into a detailed knowledge graph—facilitating deep analysis of story structure, character development, events, and thematic elements.

## 🚧 Work in Progress

This project is actively under development. While core functionality is implemented, some features may be incomplete or subject to change.

## Features

- **LLM-Based Extraction**: Uses the BAML library to extract entities and events directly from narrative scenes
- **Two-Pass Processing Pipeline**:
  - First Pass: Extracts raw entities from scenes (even if duplicates exist)
  - Second Pass: Extracts detailed scene metadata, events, and participations
- **Dedicated Entity Resolution**: A post-processing module that reconciles and merges raw entity records based on consistent normalization and fuzzy matching
- **Validation and Remapping**: Ensures that all relationships (e.g. character affiliations, event participations) are valid and correctly referenced
- **Knowledge Graph Output**: Generates a JSON-serializable output that can be used for further analysis or visualization

## Architecture

### Processing Pipeline

1. **Input Loading**:
   - Narrative scripts are provided in JSON format
   - Supporting context documents (e.g., a novelization text) are also loaded

2. **Raw Entity Extraction (First Pass)**:
   - Each episode and its scenes are processed
   - Extracts:
     - Locations
     - Organizations
     - Agents (Characters)
     - Objects

3. **Entity Resolution**:
   - Resolves duplicate or similar entities
   - Uses consistent normalization and fuzzy matching
   - Maintains both raw and resolved registries

4. **Event and Participation Extraction (Second Pass)**:
   - Scene metadata
   - Events
   - Agent Participations
   - Object Involvements

5. **Validation and Output Generation**:
   - Validates all references and relationships
   - Generates final JSON knowledge graph

## Installation

```bash
# Dependencies will be specified in requirements.txt (coming soon)
pip install -r requirements.txt
```

## Usage

```python
# Basic usage (more detailed documentation coming soon)
from main import main
import asyncio

asyncio.run(main())
```

## Project Structure

- `main.py`: Entry point and orchestration
- `episode_processor.py`: Processes individual episodes
- `scene_processor.py`: Handles scene-level extraction
- `entity_registry.py`: Maintains entity collections and handles resolution
- `validation.py`: Validates entity references and relationships
- `context.py`: Manages global context and story state
- `utils.py`: Utility functions for normalization and ID generation

## Dependencies

- BAML (for LLM interactions)
- thefuzz (for fuzzy string matching)
- Additional dependencies to be specified in requirements.txt

## Development Status

### Implemented
- Core extraction pipeline
- Entity resolution
- Basic validation
- JSON output generation

### In Progress
- Enhanced entity resolution
- Improved validation rules
- Documentation
- Test coverage
- Requirements specification

### Planned
- Performance optimizations
- Additional extraction types
- Visualization tools
- API documentation
- Example notebooks

## Contributing

While this project is still in development, we welcome feedback and suggestions. Please open an issue to discuss potential changes.

## License

[License details to be added]

## Acknowledgements

- BAML team for the extraction framework
- [Additional acknowledgements to be added]

---

For more information or to report issues, please open a GitHub issue.

Note: This README will be updated as development continues.