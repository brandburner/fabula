# work in progress

import os
import json
import logging
import traceback
from pydantic import BaseModel
from typing import List, Dict, Any, Optional
from openai import OpenAI
from neo4j import GraphDatabase

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

SCHEMA_INFO = """
Database Schema:
Nodes:
- Scene (title, description, uuid, scene_number)
- Event (title, description, sequence, uuid, key_dialogue)
- Agent (name, title, description, uuid, traits, sphere_of_influence)
- Object (name, description, uuid, significance, purpose)
- AgentParticipation (uuid, current_status, emotional_state, active_plans, beliefs, goals, emotional_tags)
- ObjectInvolvement (description, uuid, status_after, status_before)
- Organization (name, description, uuid, sphere_of_influence)
- Location (name, description, uuid, type)

Relationships:
- (Scene)-[:LOCATED_IN]->(Location)
- (Scene)-[:NEXT_SCENE]->(Scene)
- (Event)-[:OCCURS_IN]->(Scene)
- (Event)-[:NEXT_EVENT]->(Event)
- (Agent)-[:HAS_PARTICIPATION]->(AgentParticipation)-[:IN_EVENT]->(Event)
- (Object)-[:HAS_INVOLVEMENT]->(ObjectInvolvement)-[:IN_EVENT]->(Event)
- (Agent)-[:AFFILIATED_WITH]->(Organization)
- (Agent)-[:OWNS]->(Object)
"""

# ----- Pydantic models for Structured Outputs -----

class DecomposedQuestions(BaseModel):
    sub_questions: List[str]

# Update the QueryStrategy model so that "parameters" is optional.
class QueryStrategy(BaseModel):
    strategy: str
    query: str
    parameters: Optional[Dict[str, Any]] = None  # Now optional

class QueryStrategies(BaseModel):
    strategies: List[QueryStrategy]

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

# ----- Step 1: Decompose the Question -----

def decompose_question(question: str, schema: str = SCHEMA_INFO) -> List[str]:
    """
    Uses the OpenAI API to decompose the user's narrative question into a list of sub-questions.
    Returns a list of strings from the "sub_questions" key in the JSON object.
    """
    system_prompt = f"""
You decompose questions into multiple sub-questions to form query strategies. Use only the following schema for context:
{schema}
Return only a JSON object in the format:
{{"sub_questions": ["sub-question 1", "sub-question 2", ...]}}
    """
    user_prompt = f"""
Decompose the following narrative question into clear sub-questions that target specific aspects of the narrative.

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

# ----- Step 2: Generate Query Strategies for a Sub-question -----

def generate_query_strategies(subquestion: str, schema: str = SCHEMA_INFO) -> List[Dict[str, Any]]:
    """
    Uses the OpenAI API to generate multiple candidate Cypher query strategies for the given sub-question.
    Returns a list of strategy dictionaries from the "strategies" key in the JSON object.
    """
    system_prompt = f"""
You are a query generation assistant. Use only the following database schema:
{schema}
Return only a JSON object in the format:
{{"strategies": [{{"strategy": "label", "query": "Cypher query", "parameters": {{...}}}}, ...]}}
Do not include any additional text.
    """
    user_prompt = f"""
Given the sub-question: "{subquestion}", generate 3 distinct Cypher query strategies.
Ensure that if your query includes any parameter placeholders (e.g. $title),
the parameters field must include a complete mapping with the correct key-value pairs.
For instance, if you use $title, include "parameters": eg. "title": "National Security Advisor".
    """
    try:
        response = client.beta.chat.completions.parse(
            model="o3-mini",
            messages=[
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": user_prompt}
            ],
            response_format=QueryStrategies,
        )
        strategies = response.choices[0].message.parsed.strategies
        logger.info(f"Generated query strategies for sub-question: {strategies}")
        # Convert pydantic objects to dicts if needed:
        return [strategy.dict() for strategy in strategies]
    except Exception as e:
        logger.error(f"Error generating query strategies: {e}")
        return []

# ----- Step 3: Execute the Best Query Strategy -----

def execute_best_strategy(strategies: List[Dict[str, Any]], db: Neo4jConnection) -> Dict[str, Any]:
    """
    Iterates over candidate strategies and executes each until one returns a non-empty result.
    Returns the first successful strategy and its results.
    """
    for strategy in strategies:
        query = strategy.get("query")
        parameters = strategy.get("parameters", {})
        try:
            results = db.query(query, parameters)
            if results:
                logger.info(f"Strategy '{strategy.get('strategy')}' returned {len(results)} results.")
                return {
                    "strategy": strategy.get("strategy"),
                    "query": query,
                    "parameters": parameters,
                    "results": results
                }
        except Exception as e:
            logger.error(f"Strategy '{strategy.get('strategy')}' failed: {e}")
            continue
    return {"strategy": None, "query": None, "parameters": {}, "results": []}

# ----- Step 4: Synthesize a Final Answer -----

def synthesize_answer(question: str, sub_results: Dict[str, Any]) -> str:
    """
    Uses the OpenAI API to synthesize a final narrative answer from all sub-question results.
    Returns the final answer string from the "answer" key.
    """
    system_prompt = "You are a world-class narrative analyst. Provide a concise, well-researched answer strictly in JSON."
    user_prompt = f"""
Given the original question: "{question}"
and the following sub-question results:
{sub_results}
Return only a JSON object in the following format:
{{"answer": "Your final synthesized answer."}}
    """
    try:
        response = client.beta.chat.completions.parse(
            model="o3-mini",
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

def process_question(question: str, db: Neo4jConnection) -> str:
    """
    Orchestrates the multi-step process:
      1. Decomposes the question.
      2. Generates query strategies for each sub-question.
      3. Executes queries and collects results.
      4. Synthesizes a final answer.
    Returns the final answer as a string.
    """
    sub_questions = decompose_question(question)
    sub_results = {}
    for idx, subq in enumerate(sub_questions):
        strategies = generate_query_strategies(subq)
        result = execute_best_strategy(strategies, db)
        sub_results[f"sub_question_{idx+1}"] = {
            "question": subq,
            "strategy_used": result.get("strategy"),
            "query": result.get("query"),
            "results": result.get("results")
        }
    final_answer = synthesize_answer(question, sub_results)
    return final_answer

# ----- Interactive Chatbot Loop -----

def main():
    print("Welcome to the Fabula Story Analysis Bot!")
    print("Ask questions about narrative analysis, character arcs, and plot development.")
    print("Type 'exit' or 'quit' to end the session.\n")

    db = Neo4jConnection(NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD)
    try:
        while True:
            try:
                question = input("Your question: ").strip()
                if question.lower() in ('exit', 'quit'):
                    print("Goodbye!")
                    break
                if not question:
                    print("Please enter a valid question.")
                    continue

                answer = process_question(question, db)
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
