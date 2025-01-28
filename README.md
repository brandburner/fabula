# Fabula

Fabula is a Python-based project that models narrative drama using graph databases, specifically Neo4j with the Cypher query language. Inspired by the BBC's Mythology Engine ([BBC](https://www.bbc.com/rd/projects/mythology-engine?utm_source=chatgpt.com)), Fabula aims to represent complex narratives interactively and non-linearly, facilitating advanced narrative analysis and emergent storyline detection.

## Abstract

In this project, we present a comprehensive approach to modeling narrative drama using graph databases. We address the challenges of representing complex narrative elements such as characters, events, scenes, timelines, and internal character states within a graph structure. By using the "Blink" episode from _Doctor Who_ as a test case, we develop a graph ontology that captures both the structural and dramatic aspects of the narrative. Our methodology balances detail with practicality, ensuring that the model remains both expressive and efficient. We provide reproducible code snippets and demonstrate how our model can be used to perform insightful queries, facilitating advanced narrative analysis.

## Features

- **Entity Extraction**: Extracts entities from text using various methods.
- **Entity Normalization**: Normalizes extracted entities for consistency.
- **Scene Processing**: Processes scenes to model their structure and relationships.
- **Graph Ontology**: Defines a graph-based ontology to represent narrative elements and their interconnections.

## Installation

To get started with Fabula, clone the repository and install the required dependencies:

```bash
git clone https://github.com/brandburner/fabula.git
cd fabula
# Install dependencies (e.g., Neo4j, Python libraries)
```

## Usage

Provide examples of how to use your project. For instance:

```python
# Example usage of Fabula
from fabula import main

# Describe how to use the main module or any other functionalities
```

## Project Structure

- `baml_client/`: [Describe the purpose of this directory]
- `output/`: [Describe the purpose of this directory]
- `source_docs/`: [Contains source documents used for entity extraction and scene processing]
- `utilities/`: [Utility scripts and helper functions]
- `entity_cleaners.py`: [Cleans and preprocesses entities]
- `entity_extractors.py`: [Contains methods for entity extraction]
- `entity_normalizer.py`: [Normalizes entities to a standard format]
- `entity_registry.py`: [Manages the registry of entities]
- `json_cypher.py`: [Handles JSON and Cypher operations]
- `main.py`: [The main entry point of the application]
- `post_processor.py`: [Post-processes data after initial processing]
- `scene_processor.py`: [Processes scenes for analysis]
- `utils.py`: [Utility functions used across the project]

## Graph Ontology

The graph ontology developed for Fabula includes:

### Node Types

- **Character**: Represents individuals or groups.
- **Event**: Significant occurrences in the narrative.
- **Scene**: Narrative segments containing events.
- **Location**: Places where events occur.
- **Object**: Items of significance.
- **Timeline**: Represents chronological sequences or alternate realities.

### Relationship Types

- **PARTICIPATES_IN**: Links characters to events.
- **OCCURS_IN**: Associates events with scenes.
- **LOCATED_AT**: Specifies where an event takes place.
- **OWNS**: Represents object ownership.
- **NEXT_EVENT**: Establishes chronological order.
- **NEXT_SCENE**: Establishes narrative order.
- **BELONGS_TO**: Assigns events to timelines.
- **INTERACTS_WITH**: Captures interactions between characters.
- **HAS_BELIEF**: Represents characters' beliefs at specific times.

## Implementation

Using the "Blink" episode as a test case, we implemented the graph ontology in Neo4j using Cypher queries. The implementation includes:

- **Data Creation Script**: A Cypher script to create nodes and relationships representing the narrative elements.
- **Modeling Decisions**: Strategies to simplify changes over time and ensure data integrity.

## Results

We demonstrate how the model can be used to perform insightful queries, such as:

- Retrieving events in chronological order.
- Listing scenes in narrative order.
- Tracking ownership of significant objects.
- Analyzing characters' beliefs over time.
- Identifying events involving specific characters or groups.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or suggestions.

## License

[Specify the license under which your project is distributed.]

## References

1. **BBC Mythology Engine**: ([BBC](https://www.bbc.com/rd/projects/mythology-engine))
2. **Neo4j Documentation**: [https://neo4j.com/docs/](https://neo4j.com/docs/)
3. **Belief-Desire-Intention Model**: Rao, A. S., & Georgeff, M. P. (1995). BDI Agents: From Theory to Practice.

```

Feel free to expand upon each section, especially the descriptions of each module and directory, to provide more detailed information about your project. o
