import os
import json
import logging
import traceback
import re
from typing import List, Dict, Any, Literal, Optional, Tuple
from pydantic import BaseModel, Field
from neo4j.exceptions import ServiceUnavailable, ClientError

# LangChain imports
from langchain_openai import ChatOpenAI
from langchain_core.messages import HumanMessage
from langchain_core.output_parsers import JsonOutputParser
from langchain.prompts import PromptTemplate, ChatPromptTemplate
from langchain.output_parsers import PydanticOutputParser

# Neo4j connection
from neo4j import GraphDatabase

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

########################
# Schema & Configuration
########################

NEO4J_URI = "bolt://localhost:7689"
NEO4J_USERNAME = "neo4j"
NEO4J_PASSWORD = "mythology"
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

if not OPENAI_API_KEY:
    raise ValueError("Missing OPENAI_API_KEY environment variable.")

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

########################
# Models
########################

class QueryPattern(BaseModel):
    """Model for a single query pattern"""
    pattern_name: str
    node_labels: List[str]
    relationships: List[str]
    properties: Dict[str, List[str]]
    cypher: str = ""
    parameters: Dict[str, Any] = Field(default_factory=dict)
    connects_to: List[str] = Field(default_factory=list)
    main_focus: str = ""

class QueryPlan(BaseModel):
    """Model for the overall query plan"""
    patterns: List[QueryPattern]
    execution_order: List[str]
    main_focus: Literal["character_arc", "object_tracking", "location_based", 
                       "temporal", "character_identification"]

class QueryResult(BaseModel):
    """Model for storing query results and metadata"""
    pattern_name: str
    cypher: str
    parameters: Dict[str, Any]
    raw_results: List[Dict[str, Any]]
    success: bool = True
    error: Optional[str] = None

########################
# Prompt Templates
########################

QUERY_PLANNING_PROMPT = '''You are an expert at graph pattern matching and narrative analysis.
You follow the provided schema, which defines the dramatic structure of an episode of serial drama:

- 'Scene' (principal container of story events, has a title and location)
-- 'Location' (where Scenes are set, such as planets, cities, buildings or rooms)
-- 'Event' (the dramatic beats that occur in a scene)
--- 'AgentParticipation' (who an Event involved and their actions and emotions)
---- 'Agent' (a dramatic agent, aka character, in the drama)
--- 'ObjectInvolvement' (how a significant object was involved in an Event)
---- - 'Object' (tangible things invovled in story events, like golden idols, or classified documents)

Given this question about the serial drama: {question}

Schema:
{schema}

Break this question into Neo4j graph patterns that can be combined to find the answer. The 'main_focus' should be one of [character_arc, object_tracking, location_based, temporal, character_identification].
You must return a valid JSON object with no trailing commas and exact format shown below:
{{
    "patterns": [
        {{
            "pattern_name": "pattern1",
            "node_labels": ["Agent", "Event"],
            "relationships": ["HAS_PARTICIPATION"],
            "properties": {{"Agent": ["name"], "Event": ["title"]}},
            "parameters": {{"name": "Tom Baker"}},
            "connects_to": []
        }}
    ],
    "execution_order": ["pattern1"],
    "main_focus": "character_arc"
}}'''

CYPHER_GENERATION_PROMPT = """Given a narrative analysis pattern, generate a Cypher query.

Schema:
{schema}

Pattern Description: {pattern}
Previous Results Context: {context}

Requirements:
1. Use only the node labels, relationships, and properties from the schema
2. Order temporal results using scene.scene_number and event.sequence
3. Include relevant character emotional_states and beliefs
4. Track object status changes when relevant
5. Limit results appropriately

Return a Cypher query that implements this pattern. Return ONLY the raw Cypher query with no markdown formatting, code blocks, or explanation."""


########################
# Query Processing
########################

class QueryProcessor:
    def __init__(self, llm, schema):
        self.llm = llm
        self.schema = schema
        self.plan_parser = PydanticOutputParser(pydantic_object=QueryPlan)
        
        # Store successful patterns
        self.successful_patterns: Dict[str, Tuple[str, Dict[str, Any]]] = {}
        
        # Track query patterns that work
        self.pattern_stats: Dict[str, Dict[str, int]] = {
            "success_count": {},
            "failure_count": {},
            "last_success": {},
        }

        # Base patterns with fuzzy matching
        self.base_patterns = {
            "agent_basic": """
                MATCH (a:Agent)
                WHERE toLower(a.name) CONTAINS toLower($name)
                RETURN a.name, a.description, a.traits
                ORDER BY a.name
                LIMIT 5
            """,
            "agent_events": """
                MATCH (a:Agent)
                WHERE toLower(a.name) CONTAINS toLower($name)
                MATCH (a)-[:HAS_PARTICIPATION]->(ap:AgentParticipation)
                -[:IN_EVENT]->(e:Event)
                RETURN a.name, e.title, ap.emotional_state
                ORDER BY e.sequence
                LIMIT 100
            """,
            "object_tracking": """
                MATCH (o:Object)
                WHERE toLower(o.name) CONTAINS toLower($name)
                MATCH (o)-[:HAS_INVOLVEMENT]->(oi:ObjectInvolvement)
                -[:IN_EVENT]->(e:Event)
                RETURN o.name, e.title, oi.status_before, oi.status_after
                ORDER BY e.sequence
                LIMIT 100
            """,
            "location_events": """
                MATCH (l:Location)
                WHERE toLower(l.name) CONTAINS toLower($name)
                MATCH (s:Scene)-[:LOCATED_IN]->(l)
                MATCH (e:Event)-[:OCCURS_IN]->(s)
                RETURN l.name, s.title, e.title
                ORDER BY s.scene_number, e.sequence
                LIMIT 100
            """
        }

    def create_query_plan(self, question: str) -> QueryPlan:
        """Create a plan for decomposing and executing a complex query"""
        try:
            logger.info(f"\nGenerating query plan for: {question}")
            
            prompt = PromptTemplate(
                template=QUERY_PLANNING_PROMPT,
                input_variables=["schema", "question"]
            )
            
            message = HumanMessage(content=prompt.format(
                schema=self.schema,
                question=question
            ))
            
            response = self.llm.invoke([message])
            logger.info("\nRaw LLM Response:")
            logger.info(response.content)
            
            plan = self.plan_parser.parse(response.content)
            logger.info(f"\nSuccessfully created query plan with {len(plan.patterns)} patterns")
            
            return plan
            
        except Exception as e:
            logger.error(f"\nError in create_query_plan: {str(e)}")
            return self._create_fallback_plan(question)

    def _create_fallback_plan(self, question: str) -> QueryPlan:
        """Create a simple fallback plan when main planning fails"""
        # Extract potential entity names from question
        words = re.findall(r'\b\w+\b', question)
        capitalized_words = [w for w in words if w[0].isupper()]
        
        patterns = []
        if capitalized_words:
            # Try to find agents/objects with these names
            patterns.append(
                QueryPattern(
                    pattern_name="fallback1",
                    node_labels=["Agent", "Object"],
                    relationships=[],
                    properties={"Agent": ["name", "description"], 
                              "Object": ["name", "description"]},
                    parameters={"name": capitalized_words[0]},
                    main_focus="character_identification"
                )
            )
        
        return QueryPlan(
            patterns=patterns,
            execution_order=[p.pattern_name for p in patterns],
            main_focus="character_identification"
        )

    def generate_cypher(self, pattern: QueryPattern, context: Dict = None) -> Optional[str]:
        # If the pattern references 'name' but has no 'parameters', fill from context
        if "name" not in pattern.parameters and context.get("name"):
            pattern.parameters["name"] = context["name"]
        try:
            # Check for existing successful pattern
            pattern_key = self._get_pattern_key(pattern)
            if pattern_key in self.successful_patterns:
                cypher, params = self.successful_patterns[pattern_key]
                if self._is_pattern_applicable(pattern, params):
                    logger.info(f"Reusing successful pattern: {pattern_key}")
                    return cypher

            # Try base patterns
            base_cypher = self._try_base_pattern(pattern)
            if base_cypher:
                return base_cypher

            # Generate custom query
            return self._generate_path_query(pattern, context)

        except Exception as e:
            logger.error(f"Error generating Cypher: {str(e)}")
            return None

    def _get_pattern_key(self, pattern: QueryPattern) -> str:
        """Generate a unique key for a pattern"""
        return f"{pattern.pattern_name}_{'-'.join(pattern.node_labels)}"

    def _is_pattern_applicable(self, pattern: QueryPattern, stored_params: Dict) -> bool:
        """Check if a stored pattern can be used with current parameters"""
        return all(
            k in pattern.parameters and pattern.parameters[k] == v
            for k, v in stored_params.items()
        )

    def _try_base_pattern(self, pattern: QueryPattern) -> Optional[str]:
        """Try standard query patterns first"""
        if pattern.node_labels == ["Agent"]:
            return """
                MATCH (a:Agent)
                WHERE toLower(a.name) CONTAINS toLower($name)
                RETURN a.name, a.description, a.traits
                LIMIT 5
            """
            
        if set(pattern.node_labels) == {"Agent", "AgentParticipation", "Event"}:
            return """
                MATCH (a:Agent)
                WHERE toLower(a.name) CONTAINS toLower($name)
                MATCH (a)-[:HAS_PARTICIPATION]->(ap:AgentParticipation)
                -[:IN_EVENT]->(e:Event)
                RETURN a.name, e.title, ap.emotional_state
                ORDER BY e.sequence
                LIMIT 100
            """

    def _determine_pattern_type(self, pattern: QueryPattern) -> Optional[str]:
        """Match pattern to a known type"""
        label_set = set(pattern.node_labels)
        
        if "Agent" in label_set:
            if len(label_set) == 1:
                return "agent_basic"
            if "Event" in label_set:
                return "agent_events"
                
        if "Object" in label_set and "Event" in label_set:
            return "object_tracking"
            
        if "Location" in label_set and "Scene" in label_set:
            return "location_events"
            
        return None

    def _generate_path_query(self, pattern: QueryPattern, context: Dict = None) -> str:
        """
        Build a Cypher MATCH query from the pattern's node_labels and relationships,
        optionally adding a WHERE clause and concluding with RETURN.
        """
        try:
            # Validate number of relationships vs. node labels
            if len(pattern.relationships) != len(pattern.node_labels) - 1:
                logger.warning(
                    f"[{pattern.pattern_name}] Mismatch: "
                    f"{len(pattern.node_labels)} node labels but {len(pattern.relationships)} relationships. Skipping."
                )
                return None

            var_map = {}
            path_parts = []
            where_clauses = []

            # Build each node in the pattern
            for i, label in enumerate(pattern.node_labels):
                var = self._get_variable_name(label, i)
                var_map[label] = var
                path_parts.append(f"({var}:{label})")

            # Build the MATCH clause with relationships
            # For N nodes, you have exactly N-1 relationships
            query = "MATCH "
            for i in range(len(path_parts) - 1):
                rel = pattern.relationships[i]
                query += f"{path_parts[i]}-[:{rel}]->{path_parts[i + 1]}"

            # If "name" is in parameters, apply a WHERE to a relevant node
            # (you can refine this logic if multiple labels might have 'name' properties)
            if "name" in pattern.parameters:
                # We'll assume the first label is the one we filter on
                primary_var = var_map[pattern.node_labels[0]]
                where_clauses.append(f"toLower({primary_var}.name) CONTAINS toLower($name)")

            if where_clauses:
                query += "\nWHERE " + " AND ".join(where_clauses)

            # Optional: If you have an Event node, you can ORDER BY event.sequence
            if "Event" in var_map:
                event_var = var_map["Event"]
                query += f"\nORDER BY {event_var}.sequence"

            # Return all node variables
            query += "\nRETURN " + ", ".join(var_map.values())

            return query

        except Exception as e:
            logger.error(f"Error generating path query for {pattern.pattern_name}: {str(e)}")
            return None



    def _create_relationship_path(self, nodes: List[str], relationships: List[str]) -> str:
        """Create a valid Neo4j path pattern"""
        path = []
        for i, (start_node, end_node) in enumerate(zip(nodes[:-1], nodes[1:])):
            if i == 0:
                path.append(f"({start_node.lower()}:{start_node})")
            rel = relationships[i] if i < len(relationships) else ""
            path.append(f"-[:{rel}]->({end_node.lower()}:{end_node})")
        return "".join(path)
    
    def _get_variable_name(self, label: str, index: int) -> str:
        """Generate unique variable name for a node"""
        base = label.lower()[0]
        if base in {'a', 'e', 's', 'o', 'l'}:  # Common first letters
            return f"{base}{index}" if index > 0 else base
        return f"n{index}"

    def validate_cypher(self, cypher: str, parameters: Dict[str, Any] = None) -> bool:
        """Validate Cypher query"""
        try:
            if not cypher:
                return False

            # Check basic syntax
            if not all(keyword in cypher.upper() for keyword in ["MATCH", "RETURN"]):
                return False

            # Check parameters
            param_matches = re.findall(r'\$(\w+)', cypher)
            if parameters is None:
                parameters = {}
            
            missing_params = [p for p in param_matches if p not in parameters]
            if missing_params:
                logger.warning(f"Missing parameters: {missing_params}")
                return False

            return True
            
        except Exception as e:
            logger.error(f"Error validating Cypher: {str(e)}")
            return False

    def track_pattern_success(self, pattern: QueryPattern, success: bool):
        """Track pattern success/failure statistics"""
        key = self._get_pattern_key(pattern)
        if success:
            self.pattern_stats["success_count"][key] = self.pattern_stats["success_count"].get(key, 0) + 1
            self.pattern_stats["last_success"][key] = pattern.parameters
        else:
            self.pattern_stats["failure_count"][key] = self.pattern_stats["failure_count"].get(key, 0) + 1

class FabulaChatbot:
    def __init__(self):
        self.llm = ChatOpenAI(
            api_key=OPENAI_API_KEY,
            model="gpt-4o",
            temperature=0.0
        )
        
        self.db = Neo4jConnection(NEO4J_URI, NEO4J_USERNAME, NEO4J_PASSWORD)
        self.query_processor = QueryProcessor(self.llm, SCHEMA_INFO)
        
        # Track query execution stats
        self.query_stats = {
            "total_queries": 0,
            "successful_queries": 0,
            "failed_queries": 0,
            "fallback_uses": 0
        }

    def process_question(self, question: str) -> Dict[str, Any]:
        """Process a question about the narrative"""
        try:
            # Create query plan
            plan = self.query_processor.create_query_plan(question)
            
            # Execute patterns and collect results
            executed_queries = {}
            results = {}
            context = {}
            
            for pattern in plan.patterns:
                self.query_stats["total_queries"] += 1
                
                # Generate and execute query
                cypher = self.query_processor.generate_cypher(pattern, context)
                if not cypher:
                    logger.warning(f"Could not generate Cypher for pattern: {pattern.pattern_name}")
                    continue
                    
                try:
                    result = self.db.query(cypher, pattern.parameters)
                    
                    # Track success
                    self.query_stats["successful_queries"] += 1
                    self.query_processor.track_pattern_success(pattern, True)
                    
                    # Store results
                    results[pattern.pattern_name] = result
                    executed_queries[pattern.pattern_name] = QueryResult(
                        pattern_name=pattern.pattern_name,
                        cypher=cypher,
                        parameters=pattern.parameters,
                        raw_results=result,
                        success=True
                    )
                    
                    # Update context
                    context = self._update_context(result)
                    
                except Exception as e:
                    logger.error(f"Query execution error for pattern {pattern.pattern_name}: {str(e)}")
                    self.query_stats["failed_queries"] += 1
                    self.query_processor.track_pattern_success(pattern, False)
                    
                    # Try fallback
                    fallback_result = self._try_fallback_query(pattern)
                    if fallback_result:
                        self.query_stats["fallback_uses"] += 1
                        results[pattern.pattern_name] = fallback_result
                        executed_queries[pattern.pattern_name] = QueryResult(
                            pattern_name=pattern.pattern_name,
                            cypher="FALLBACK QUERY",
                            parameters=pattern.parameters,
                            raw_results=fallback_result,
                            success=True
                        )
                    else:
                        executed_queries[pattern.pattern_name] = QueryResult(
                            pattern_name=pattern.pattern_name,
                            cypher=cypher,
                            parameters=pattern.parameters,
                            raw_results=[],
                            success=False,
                            error=str(e)
                        )
            
            # Generate narrative response
            response = self._generate_response(question, results, executed_queries)
            
            return {
                "question": question,
                "plan": plan,
                "executed_queries": {
                    name: query.model_dump() 
                    for name, query in executed_queries.items()
                },
                "results": results,
                "response": response.content,
                "query_stats": self._get_query_stats(),
                "source_analysis": {
                    "db_facts": list(results.keys()),
                    "partial_matches": self._get_partial_matches(executed_queries),
                    "success_rate": self._calculate_success_rate()
                }
            }
            
        except Exception as e:
            logger.error(f"Error processing question: {str(e)}")
            logger.error(f"Traceback: {traceback.format_exc()}")
            return {
                "error": str(e),
                "query_stats": self._get_query_stats(),
                "source_analysis": {
                    "db_facts": [],
                    "success_rate": self._calculate_success_rate()
                }
            }

    def _update_context(self, result: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Update context based on query results"""
        context = {
            'results': result,
            'scene_numbers': list(set(
                r.get('s.scene_number') for r in result 
                if 's.scene_number' in r
            )),
            'agent_names': list(set(
                r.get('a.name') for r in result 
                if 'a.name' in r
            )),
            'matched_terms': list(set(
                value for r in result 
                for key, value in r.items() 
                if isinstance(value, str) and key.endswith('.name')
            ))
        }
        return {k: v for k, v in context.items() if v}

    def _try_fallback_query(self, pattern: QueryPattern) -> Optional[List[Dict[str, Any]]]:
        """Try a fallback query when main query fails"""
        try:
            # Try pattern's main focus first
            if pattern.main_focus in self.query_processor.base_patterns:
                cypher = self.query_processor.base_patterns[pattern.main_focus]
                if cypher:
                    return self.db.query(cypher, pattern.parameters)
            
            # Try simpler versions of the query
            if "name" in pattern.parameters:
                simple_queries = [
                    f"""
                    MATCH (n)
                    WHERE toLower(n.name) CONTAINS toLower($name)
                    RETURN n.name, n.description, labels(n) as type
                    LIMIT 5
                    """,
                    f"""
                    MATCH (n)
                    WHERE n.name IS NOT NULL
                    AND any(word IN split(toLower(n.name), ' ')
                        WHERE word CONTAINS toLower($name))
                    RETURN n.name, n.description, labels(n) as type
                    LIMIT 5
                    """
                ]
                
                for query in simple_queries:
                    try:
                        result = self.db.query(query, pattern.parameters)
                        if result:
                            return result
                    except Exception:
                        continue
                        
        except Exception as e:
            logger.error(f"Fallback query failed: {str(e)}")
        return None

    def _generate_response(self, question: str, results: Dict, executed_queries: Dict):
        # Limit how many rows we return
        MAX_ROWS = 120

        truncated_results = {}
        for pattern_name, rows in results.items():
            if len(rows) > MAX_ROWS:
                truncated = rows[:MAX_ROWS]
                truncated.append({
                    "note": f"Truncated {len(rows) - MAX_ROWS} additional rows"
                })
                truncated_results[pattern_name] = truncated
            else:
                truncated_results[pattern_name] = rows

        # Build a smaller version of executed queries if needed
        # e.g. only store pattern_name + cypher or a short snippet
        minimal_executed_queries = {
            name: {
                "cypher": eq.cypher[:300] + "...",  # trim the query if huge
                "success": eq.success,
                "error": eq.error
            }
            for name, eq in executed_queries.items()
        }

        prompt = f"""Based on these database query results (truncated):
        Results:
        {json.dumps(truncated_results, indent=2)}

        Executed Queries:
        {json.dumps(minimal_executed_queries, indent=2)}

        Question: {question}
        
        Instructions:
        1. Show only facts from the truncated results
        2. List partial matches
        3. Summarize or note missing queries
        4. Provide a concise answer
        """

        message = HumanMessage(content=prompt)
        return self.llm.invoke([message])



    def _get_query_stats(self) -> Dict[str, Any]:
        """Get current query statistics"""
        return {
            **self.query_stats,
            "pattern_stats": self.query_processor.pattern_stats
        }

    def _get_partial_matches(self, executed_queries: Dict[str, QueryResult]) -> List[str]:
        """Identify partial matches from query results"""
        partial_matches = []
        for query in executed_queries.values():
            if not query.success or not query.raw_results:
                continue
            
            for result in query.raw_results:
                for key, value in result.items():
                    if (isinstance(value, str) and 
                        key.endswith('.name') and 
                        value.lower() != query.parameters.get('name', '').lower()):
                        partial_matches.append(f"{value} (matched from {query.parameters.get('name', '')})")
        
        return list(set(partial_matches))

    def _calculate_success_rate(self) -> float:
        """Calculate query success rate"""
        total = self.query_stats["total_queries"]
        if total == 0:
            return 0.0
        return self.query_stats["successful_queries"] / total

########################
# Database Connection
########################

class Neo4jConnection:
    def __init__(self, uri, user, pwd):
        try:
            self._driver = GraphDatabase.driver(uri, auth=(user, pwd))
            self._verify_connection()
        except Exception as e:
            raise ConnectionError(f"Failed to connect to Neo4j: {str(e)}")

    def _verify_connection(self):
        """Verify database connection and schema"""
        with self._driver.session() as session:
            # Test basic connectivity
            session.run("RETURN 1")
            
            # Verify schema elements
            schema_check = """
            MATCH (n) 
            WITH labels(n) as labels 
            RETURN DISTINCT labels
            """
            result = session.run(schema_check)
            available_labels = [r["labels"] for r in result]
            logger.info(f"Available node labels: {available_labels}")

    def close(self):
        if self._driver is not None:
            self._driver.close()

    def query(self, cypher: str, parameters: dict = None) -> List[Dict[str, Any]]:
        """Execute a Cypher query with parameters"""
        try:
            with self._driver.session() as session:
                result = session.run(cypher, parameters or {})
                return [r.data() for r in result]
        except Exception as e:
            logger.error(f"Query execution error: {str(e)}")
            logger.error(f"Problematic query: {cypher}")
            logger.error(f"Parameters: {parameters}")
            raise

########################
# Main Loop
########################

def main():
    chatbot = FabulaChatbot()
    print("Welcome to the Fabula Story Analysis Bot!")
    print("Ask questions about character development, plot progression, and narrative elements.")
    print("Type 'exit' to quit.")
    
    try:
        while True:
            question = input("\nYour question: ").strip()
            
            if question.lower() == 'exit':
                print("Thank you for using the Fabula Story Analysis Bot!")
                break
                
            if not question:
                print("Please ask a question.")
                continue
                
            result = chatbot.process_question(question)
            
            if "error" in result:
                print(f"Error: {result['error']}")
            else:
                print("\nAnalysis:")
                print(result["response"])
                
                if result.get("source_analysis", {}).get("partial_matches"):
                    print("\nPartial Matches Found:")
                    for match in result["source_analysis"]["partial_matches"]:
                        print(f"- {match}")
                
                print(f"\nQuery Success Rate: {result['source_analysis']['success_rate']:.2%}")
    
    finally:
        chatbot.db.close()

if __name__ == "__main__":
    main()