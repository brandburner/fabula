# work in progress

import os
import json
import logging
import traceback
from pydantic import BaseModel
from typing import List, Dict, Any, Optional
from openai import OpenAI
from neo4j import GraphDatabase
from baml_client import b  # BAML client
# Import the BAML-generated types
from baml_client.types import CypherQuery as BamlCypherQuery

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# Configuration
NEO4J_URI = os.getenv("NEO4J_URI", "bolt://localhost:7689")
NEO4J_USERNAME = os.getenv("NEO4J_USERNAME", "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD", "mythology")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    raise ValueError("Missing OPENAI_API_KEY environment variable.")

# Initialize OpenAI client
client = OpenAI(api_key=OPENAI_API_KEY)

# ----- Pydantic models for structured outputs -----

class DecomposedQuestions(BaseModel):
    sub_questions: List[str]

class CypherQuery(BaseModel):
    query: str
    purpose: str

class SynthesizedAnswer(BaseModel):
    answer: str

# ----- Neo4j Connection -----

class Neo4jConnection:
    def __init__(self, uri: str, user: str, pwd: str):
        try:
            self._driver = GraphDatabase.driver(uri, auth=(user, pwd))
            self._verify_connection()
        except Exception as e:
            raise ConnectionError(f"Failed to connect to Neo4j: {e}")

    def _verify_connection(self):
        with self._driver.session() as session:
            session.run("RETURN 1")

    def close(self):
        if self._driver is not None:
            self._driver.close()

    def query(self, cypher: str, parameters: dict = None) -> List[Dict[str, Any]]:
        try:
            with self._driver.session() as session:
                result = session.run(cypher, parameters or {})
                return [r.data() for r in result]
        except Exception as e:
            logger.error(f"Error executing query: {e}")
            raise

    def peek(self, limit: int = 5) -> str:
        """Return a JSON string of a few sample records from the database."""
        try:
            sample = self.query("MATCH (n) RETURN n LIMIT $limit", {"limit": limit})
            return json.dumps(sample, indent=2)
        except Exception as e:
            logger.error(f"Error peeking into database: {e}")
            return "[]"

# ----- Schema Extraction Functions -----

def get_schema_from_neo4j(db_connection):
    """
    Dynamically extracts the schema from Neo4j database.
    Returns both a dictionary representation and formatted string for BAML.
    
    Args:
        db_connection: An instance of Neo4jConnection
        
    Returns:
        tuple: (schema_dict, schema_string)
    """
    schema_dict = {
        "nodes": [],
        "relationships": []
    }
    
    # Extract node labels and their properties
    node_query = """
    CALL apoc.meta.schema() YIELD value
    RETURN value
    """
    
    try:
        schema_result = db_connection.query(node_query)
        if schema_result and len(schema_result) > 0:
            meta_schema = schema_result[0]['value']
            
            # Process nodes
            for label, properties in meta_schema.items():
                if 'type' in properties and properties['type'] == 'node':
                    node_info = {
                        "label": label,
                        "properties": []
                    }
                    
                    for prop_name, prop_info in properties.get('properties', {}).items():
                        prop_type = prop_info.get('type', 'string')
                        node_info["properties"].append({
                            "name": prop_name,
                            "type": prop_type
                        })
                    
                    schema_dict["nodes"].append(node_info)
            
            # Process relationships
            for label, properties in meta_schema.items():
                if 'type' in properties and properties['type'] == 'relationship':
                    # Get relationship details
                    rel_query = f"""
                    MATCH ()-[r:{label}]->()
                    WITH type(r) AS rel_type, startNode(r) AS start_node, endNode(r) AS end_node
                    RETURN DISTINCT rel_type, labels(start_node)[0] AS start_label, labels(end_node)[0] AS end_label
                    LIMIT 1
                    """
                    
                    rel_results = db_connection.query(rel_query)
                    if rel_results and len(rel_results) > 0:
                        rel_info = {
                            "label": label,
                            "src": rel_results[0]['start_label'],
                            "dst": rel_results[0]['end_label'],
                            "properties": []
                        }
                        
                        for prop_name, prop_info in properties.get('properties', {}).items():
                            prop_type = prop_info.get('type', 'string')
                            rel_info["properties"].append({
                                "name": prop_name,
                                "type": prop_type
                            })
                        
                        schema_dict["relationships"].append(rel_info)
    
    except Exception as e:
        logger.warning(f"Error using apoc.meta.schema(): {str(e)}")
        # Fall back to alternative schema extraction
        return get_schema_fallback(db_connection)
    
    # Generate formatted schema string for BAML
    schema_string = format_schema_for_baml(schema_dict)
    
    return schema_dict, schema_string


def format_schema_for_baml(schema_dict):
    """
    Formats the schema dictionary into a string representation for BAML.
    
    Args:
        schema_dict: Dictionary containing nodes and relationships information
        
    Returns:
        str: Formatted schema string
    """
    lines = []
    
    # Add node labels
    lines.append("Database Schema:")
    lines.append("Nodes:")
    for node in schema_dict["nodes"]:
        lines.append(f"- {node['label']} ({node['label'].lower()})")
        for prop in node["properties"]:
            lines.append(f"  - {prop['name']}: {prop['type']}")
    
    # Add relationships
    lines.append("\nRelationships:")
    for rel in schema_dict["relationships"]:
        lines.append(f"- ({rel['src']})-[:{rel['label']}]->({rel['dst']})")
        if rel["properties"]:
            lines.append("  Properties:")
            for prop in rel["properties"]:
                lines.append(f"  - {prop['name']}: {prop['type']}")
    
    return "\n".join(lines)


# Alternative implementation if apoc.meta.schema() is not available
def get_schema_fallback(db_connection):
    """
    Alternative schema extraction if apoc.meta.schema() is not available.
    This uses Cypher's built-in functions for schema inspection.
    """
    schema_dict = {
        "nodes": [],
        "relationships": []
    }
    
    # Get all node labels
    labels_query = """
    CALL db.labels() YIELD label
    RETURN label
    """
    
    labels_result = db_connection.query(labels_query)
    
    for label_row in labels_result:
        label = label_row['label']
        
        # Get properties for this label
        props_query = f"""
        MATCH (n:{label})
        UNWIND keys(n) AS property
        RETURN DISTINCT property, 
               CASE 
                 WHEN apoc.meta.type(n[property]) CONTAINS 'int' THEN 'integer'
                 WHEN apoc.meta.type(n[property]) CONTAINS 'float' THEN 'float'
                 WHEN apoc.meta.type(n[property]) CONTAINS 'boolean' THEN 'boolean'
                 ELSE 'string'
               END AS type
        LIMIT 100
        """
        
        try:
            props_result = db_connection.query(props_query)
            
            node_info = {
                "label": label,
                "properties": []
            }
            
            for prop_row in props_result:
                node_info["properties"].append({
                    "name": prop_row['property'],
                    "type": prop_row['type']
                })
            
            schema_dict["nodes"].append(node_info)
        
        except Exception:
            # If apoc.meta.type is not available, use a simpler query
            props_query_simple = f"""
            MATCH (n:{label})
            UNWIND keys(n) AS property
            RETURN DISTINCT property
            LIMIT 100
            """
            
            props_result = db_connection.query(props_query_simple)
            
            node_info = {
                "label": label,
                "properties": []
            }
            
            for prop_row in props_result:
                node_info["properties"].append({
                    "name": prop_row['property'],
                    "type": "string"  # Default to string type
                })
            
            schema_dict["nodes"].append(node_info)
    
    # Get all relationship types
    rels_query = """
    CALL db.relationshipTypes() YIELD relationshipType
    RETURN relationshipType
    """
    
    rels_result = db_connection.query(rels_query)
    
    for rel_row in rels_result:
        rel_type = rel_row['relationshipType']
        
        # Get start and end node labels for this relationship type
        rel_meta_query = f"""
        MATCH (start)-[r:{rel_type}]->(end)
        RETURN DISTINCT labels(start)[0] AS start_label, 
                        labels(end)[0] AS end_label
        LIMIT 1
        """
        
        rel_meta_result = db_connection.query(rel_meta_query)
        
        if rel_meta_result and len(rel_meta_result) > 0:
            rel_info = {
                "label": rel_type,
                "src": rel_meta_result[0]['start_label'],
                "dst": rel_meta_result[0]['end_label'],
                "properties": []
            }
            
            # Get properties for this relationship
            rel_props_query = f"""
            MATCH ()-[r:{rel_type}]->()
            UNWIND keys(r) AS property
            RETURN DISTINCT property
            LIMIT 100
            """
            
            rel_props_result = db_connection.query(rel_props_query)
            
            for prop_row in rel_props_result:
                rel_info["properties"].append({
                    "name": prop_row['property'],
                    "type": "string"  # Default to string
                })
            
            schema_dict["relationships"].append(rel_info)
    
    # Generate formatted schema string for BAML
    schema_string = format_schema_for_baml(schema_dict)
    
    return schema_dict, schema_string

# ----- Step 0: Initialize Database Schema -----

def initialize_database_schema(db: Neo4jConnection) -> str:
    """
    Dynamically extracts the schema from the database.
    Caches the schema to avoid repeated extraction.
    """
    global SCHEMA_INFO
    
    # Extract schema from database
    _, schema_str = get_schema_from_neo4j(db)
    SCHEMA_INFO = schema_str
    
    logger.info(f"Database schema initialized: {SCHEMA_INFO}")
    return SCHEMA_INFO

# ----- Step 1: Decompose the Question -----

def decompose_question(question: str, db_context: str, schema: str) -> List[str]:
    """
    Uses the OpenAI API to decompose the user's narrative question into a list of sub-questions.
    The prompt includes sample database records as context.
    """
    system_prompt = f"""
You decompose narrative questions into multiple sub-questions to form query strategies.
Use the following schema for context:
{schema}

Also, here are some sample records from the database:
{db_context}

Return only a JSON object in the format:
{{"sub_questions": ["sub-question 1", "sub-question 2", ...]}}
    """
    user_prompt = f"""
Decompose the following narrative question into clear, focused sub-questions that target specific aspects of the narrative.

Narrative Question: "{question}"
    """
    try:
        response = client.beta.chat.completions.parse(
            model="o3-mini",
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            response_format=DecomposedQuestions,
        )
        sub_questions = response.choices[0].message.parsed.sub_questions
        logger.info(f"Decomposed into sub-questions: {sub_questions}")
        return sub_questions
    except Exception as e:
        logger.error(f"Error in decompose_question: {e}")
        return [question]

# ----- Step 2: Generate a Valid Query Using BAML -----

def get_available_apoc_functions(db: Neo4jConnection) -> List[str]:
    """
    Fetches the list of installed APOC functions from Neo4j.
    Returns a list of valid function names.
    """
    query = """
    CALL apoc.help('apoc.path')
    """
    try:
        results = db.query(query)
        return [row["name"] for row in results]
    except Exception as e:
        logger.error(f"Error fetching APOC functions: {e}")
        return []


def validate_cypher(user_request: str, apoc_functions: List[str]) -> Optional[CypherQuery]:
    """
    Calls the BAML ValidateCypher function with dynamically injected APOC function list.
    """
    try:
        result: BamlCypherQuery = b.ValidateCypher(
            question=user_request,
            available_apoc_functions=apoc_functions  # Inject valid APOC functions
        )
        return CypherQuery(query=result.query, purpose=result.purpose)
    except Exception as e:
        logger.error(f"Error in validate_cypher: {e}")
        return None


def generate_query_strategies(subquestion: str, apoc_functions: List[str]) -> List[Dict[str, Any]]:
    """
    Generates a list of possible query strategies for a given subquestion.
    Ensures all generated queries use only valid APOC functions.
    """
    valid_query = validate_cypher(subquestion, apoc_functions)
    if valid_query:
        return [{
            "query": valid_query.query,
            "purpose": valid_query.purpose
        }]
    else:
        return []


# ----- Step 3: Execute the Best Query Strategy -----

def execute_best_strategy(strategies: List[Dict[str, Any]], db: Neo4jConnection) -> Dict[str, Any]:
    """
    Iterates over candidate strategies and executes each until one returns a non-empty result.
    Returns the first successful strategy and its results.
    """
    for strategy in strategies:
        query = strategy.get("query")
        parameters = strategy.get("parameters", {})  # Our BAML queries should be fully inlined
        try:
            results = db.query(query, parameters)
            if results:
                logger.info(f"Strategy '{strategy.get('purpose')}' returned {len(results)} results.")
                return {
                    "strategy": strategy.get("purpose"),
                    "query": query,
                    "parameters": parameters,
                    "results": results
                }
        except Exception as e:
            logger.error(f"Strategy '{strategy.get('purpose')}' failed: {e}")
            continue
    return {"strategy": None, "query": None, "parameters": {}, "results": []}

# ----- Step 4: Synthesize a Final Answer -----

def synthesize_answer(question: str, sub_results: Dict[str, Any]) -> str:
    """
    Uses the OpenAI API to synthesize a final narrative answer from all sub-question results.
    """
    system_prompt = "You are a world-class narrative analyst. Provide a concise, well-researched answer strictly in JSON. State your sources. Don't invent things - if you don't know, say so."
    user_prompt = f"""
Given the original question: "{question}"
and the following sub-question results:
{sub_results}
Return only a JSON object in the following format:
{{"answer": "Your final synthesized answer."}}
    """
    try:
        response = client.beta.chat.completions.parse(
            model="gpt-4o-mini",
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            response_format=SynthesizedAnswer,
        )
        answer = response.choices[0].message.parsed.answer
        logger.info(f"Synthesized final answer: {answer}")
        return answer
    except Exception as e:
        logger.error(f"Error synthesizing answer: {e}")
        return "An error occurred while synthesizing the answer."

# ----- Main Pipeline -----

def process_question(question: str, db: Neo4jConnection, schema: str) -> str:
    """
    Handles the full pipeline:
      1. Fetches available APOC functions.
      2. Calls BAML with the updated function list.
      3. Executes the best query and synthesizes an answer.
    """
    # Step 1: Fetch available APOC functions
    apoc_functions = get_available_apoc_functions(db)
    logger.info(f"Available APOC functions: {apoc_functions}")

    # Step 2: Decompose into subquestions
    sub_questions = decompose_question(question, db.peek(limit=3), schema)
    
    sub_results = {}
    for idx, subq in enumerate(sub_questions):
        strategies = generate_query_strategies(subq, apoc_functions)  # ✅ Pass APOC list here
        result = execute_best_strategy(strategies, db)
        sub_results[f"sub_question_{idx+1}"] = {
            "question": subq,
            "strategy_used": result.get("strategy"),
            "query": result.get("query"),
            "results": result.get("results")
        }

    # Step 3: Synthesize a final answer
    final_answer = synthesize_answer(question, sub_results)
    return final_answer


# ----- Interactive Chatbot Loop -----

def main():
    print("Welcome to the Fabula Story Analysis Bot!")
    print("Ask questions about narrative analysis, character arcs, and plot development.")
    print("Type 'exit' or 'quit' to end the session.\n")

    db = Neo4jConnection(NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD)
    
    try:
        # Initialize database schema on startup
        schema = initialize_database_schema(db)
        print("Database schema initialized successfully!")
        
        while True:
            try:
                question = input("Your question: ").strip()
                if question.lower() in ('exit', 'quit'):
                    print("Goodbye!")
                    break
                if not question:
                    print("Please enter a valid question.")
                    continue

                answer = process_question(question, db, schema)
                print("\nFinal Answer:")
                print(answer)
                print("\n" + "-" * 60 + "\n")
            except EOFError:
                break
            except Exception as e:
                logger.error(f"Error processing question: {e}")
                traceback.print_exc()
                print("An error occurred while processing your question. Please try again.")
    except KeyboardInterrupt:
        print("\nSession terminated.")
    finally:
        db.close()

if __name__ == "__main__":
    main()