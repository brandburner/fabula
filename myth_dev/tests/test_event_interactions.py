#!/usr/bin/env python
# test_event_interactions_complete.py

import asyncio
import logging
from typing import Dict, Any, List, Optional, Union, Tuple
from dataclasses import dataclass, field

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(name)s - %(message)s"
)
logger = logging.getLogger(__name__)

# Try to import the real BAML client
try:
    from baml_client import b
    from baml_client.type_builder import TypeBuilder
    from baml_client.types import Event, AgentParticipation, ObjectInvolvement, EventInteractions
    BAML_AVAILABLE = True
except ImportError:
    logger.warning("Could not import baml_client. Will use mock classes.")
    BAML_AVAILABLE = False

# Define classes for testing if BAML isn't available
if not BAML_AVAILABLE:
    @dataclass
    class Event:
        title: str
        description: str
        uuid: str
        sequence_within_scene: int = 1
        agent_participations: List[str] = field(default_factory=list)
        object_involvements: List[str] = field(default_factory=list)
        key_dialogue: List[str] = field(default_factory=list)
        next_event: Optional[str] = None

    @dataclass
    class AgentParticipation:
        uuid: str
        agent: str
        event: str
        current_status: str
        emotional_state: str
        active_plans: List[str]
        beliefs: List[str]
        goals: List[str]

    @dataclass
    class ObjectInvolvement:
        uuid: str
        object: str
        event: str
        description_of_involvement: str
        object_status_before_event: str
        object_status_after_event: str

    @dataclass
    class EventInteractions:
        agent_participations: List[AgentParticipation]
        object_involvements: List[ObjectInvolvement]

    class TypeBuilder:
        def __init__(self):
            pass

    # Mock BAML client
    class MockB:
        async def ExtractEventInteractions(self, **kwargs):
            event = kwargs.get('event')
            agent_participations = []
            object_involvements = []
            
            # Create mock responses based on the agent_participations and object_involvements
            for agent_id in event.agent_participations:
                participation = AgentParticipation(
                    uuid=f"participation_{agent_id}_{event.uuid}",
                    agent=agent_id,
                    event=event.uuid,
                    current_status="Mock current status",
                    emotional_state="Mock emotional state",
                    active_plans=["Plan 1", "Plan 2", "Plan 3"],
                    beliefs=["Belief 1", "Belief 2", "Belief 3"],
                    goals=["Goal 1", "Goal 2", "Goal 3"]
                )
                agent_participations.append(participation)
                
            for object_id in event.object_involvements:
                involvement = ObjectInvolvement(
                    uuid=f"involvement_{object_id}_{event.uuid}",
                    object=object_id,
                    event=event.uuid,
                    description_of_involvement="Mock involvement description",
                    object_status_before_event="Mock before status",
                    object_status_after_event="Mock after status"
                )
                object_involvements.append(involvement)
                
            return EventInteractions(
                agent_participations=agent_participations,
                object_involvements=object_involvements
            )
    
    b = MockB()

# Test data
@dataclass
class Agent:
    uuid: str
    name: str
    description: str
    affiliated_org: Optional[str] = None

@dataclass
class Object:
    uuid: str
    name: str
    description: str
    original_owner: Optional[str] = None

# Mock entity registry for testing
class EntityRegistry:
    def __init__(self):
        self.agents = {}
        self.objects = {}
        
    def add_agent(self, agent):
        self.agents[agent.uuid] = agent
        
    def add_object(self, obj):
        self.objects[obj.uuid] = obj

# Mock global context for testing
class GlobalContext:
    def __init__(self):
        self.entity_registry = EntityRegistry()
        self.scene_entities = {}
        
    def format_scene_entity_context(self, scene_number, entity_types=None):
        # Format entities for the prompt
        lines = []
        
        if 'agents' in (entity_types or ['agents']):
            lines.append("Agents (ONLY use these entities for agent participations):")
            for uuid, agent in self.entity_registry.agents.items():
                lines.append(f"  - {agent.name} ({agent.uuid}): affiliated_org = {agent.affiliated_org or 'None'}")
        
        if 'objects' in (entity_types or ['objects']):
            lines.append("\nObjects (ONLY use these entities for object involvements):")
            for uuid, obj in self.entity_registry.objects.items():
                lines.append(f"  - {obj.name} ({obj.uuid}): owner = {obj.original_owner or 'None'}")
                
        return "\n".join(lines)

# Function that simulates the extract_scene_data_combined behavior
def populate_event_entities(event: Event, global_context: GlobalContext):
    """
    Populate the agent_participations and object_involvements lists for an event.
    This simulates what extract_scene_data_combined would do.
    """
    # Initialize empty lists if they don't exist
    if not hasattr(event, 'agent_participations') or event.agent_participations is None:
        event.agent_participations = []
    if not hasattr(event, 'object_involvements') or event.object_involvements is None:
        event.object_involvements = []
    
    # Get all agents and objects from the registry
    all_agents = global_context.entity_registry.agents
    all_objects = global_context.entity_registry.objects
    
    # Clear existing lists before repopulating
    event.agent_participations.clear()
    event.object_involvements.clear()
    
    # For each agent in the registry, check if they're mentioned in the event description
    for agent_uuid, agent in all_agents.items():
        agent_name = agent.name.lower()
        event_desc_lower = event.description.lower()
        if agent_name in event_desc_lower:
            event.agent_participations.append(agent_uuid)
    
    # For each object in the registry, check if they're mentioned in the event description
    for object_uuid, obj in all_objects.items():
        object_name = obj.name.lower()
        event_desc_lower = event.description.lower()
        if object_name in event_desc_lower:
            event.object_involvements.append(object_uuid)
    
    logger.info(f"Event {event.uuid}: identified {len(event.agent_participations)} agents and {len(event.object_involvements)} objects")
    logger.info(f"Agent participations: {event.agent_participations}")
    logger.info(f"Object involvements: {event.object_involvements}")

async def extract_event_interactions_combined(
    scene_text: str,
    registry_context: str,
    story_synopsis: str,
    event: Union[Event, Dict[str, Any]],
    scene_number: int,
    global_context: GlobalContext = None
) -> Tuple[List[AgentParticipation], List[ObjectInvolvement]]:
    """
    Combined extraction of agent participations and object involvements for a specific event.
    This improves contextual understanding and reduces API calls.
    
    Returns:
        Tuple of (agent_participations, object_involvements)
    """
    tb = TypeBuilder() if BAML_AVAILABLE else None
    
    try:
        # Handle either Event object or dictionary
        event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', '')
        event_title = event.title if hasattr(event, 'title') else event.get('title', '')
        event_description = event.description if hasattr(event, 'description') else event.get('description', '')
        
        # Get the pre-determined agent and object lists from the event
        predetermined_agents = []
        if hasattr(event, 'agent_participations') and event.agent_participations:
            predetermined_agents = event.agent_participations
        elif isinstance(event, dict) and 'agent_participations' in event and event['agent_participations']:
            predetermined_agents = event['agent_participations']

        predetermined_objects = []
        if hasattr(event, 'object_involvements') and event.object_involvements:
            predetermined_objects = event.object_involvements
        elif isinstance(event, dict) and 'object_involvements' in event and event['object_involvements']:
            predetermined_objects = event['object_involvements']

        logger.info(f"Event already identifies {len(predetermined_agents)} agents and {len(predetermined_objects)} objects")
        logger.info(f"Predetermined agents: {predetermined_agents}")
        logger.info(f"Predetermined objects: {predetermined_objects}")
        
        # Use scene-specific context if global_context is provided
        filtered_registry_context = registry_context
        
        # Create a context that includes entity information for the predetermined entities
        if global_context:
            # Get all entities from the registry
            all_agents = global_context.entity_registry.agents
            all_objects = global_context.entity_registry.objects
            
            # Build descriptive context for the predetermined entities
            context_lines = []
            
            # Add agent descriptions
            if predetermined_agents:
                context_lines.append("Agents (ONLY use these entities for agent participations):")
                for agent_uuid in predetermined_agents:
                    agent = all_agents.get(agent_uuid)
                    if agent:
                        context_lines.append(f"  - {agent.name} ({agent.uuid}): affiliated_org = {agent.affiliated_org or 'None'}")
                        context_lines.append(f"    Description: {agent.description}")
                    else:
                        context_lines.append(f"  - Unknown agent ({agent_uuid})")
            
            # Add object descriptions
            if predetermined_objects:
                context_lines.append("\nObjects (ONLY use these entities for object involvements):")
                for object_uuid in predetermined_objects:
                    obj = all_objects.get(object_uuid)
                    if obj:
                        context_lines.append(f"  - {obj.name} ({obj.uuid}): owner = {obj.original_owner or 'None'}")
                        context_lines.append(f"    Description: {obj.description}")
                    else:
                        context_lines.append(f"  - Unknown object ({object_uuid})")
            
            filtered_registry_context = "\n".join(context_lines)
            
            logger.info(f"Using filtered context with {len(predetermined_agents)} agents and {len(predetermined_objects)} objects")
        
        # Transform to Event object if needed
        event_obj = event
        if not isinstance(event, Event):
            event_obj = Event(
                uuid=event.get('uuid', ''),
                title=event.get('title', ''),
                description=event.get('description', ''),
                sequence_within_scene=event.get('sequence_within_scene', 1),
                agent_participations=predetermined_agents,
                object_involvements=predetermined_objects,
                key_dialogue=event.get('key_dialogue', []),
                next_event=event.get('next_event')
            )
        
        # Log event information before calling BAML
        logger.info(f"Event object being sent to BAML: {event_obj}")
        logger.info(f"Event agent_participations: {event_obj.agent_participations}")
        logger.info(f"Event object_involvements: {event_obj.object_involvements}")
        
        # Preview the prompt that would be sent
        with open('prompt_preview.txt', 'w') as f:
            f.write(f"SCENE TEXT:\n{scene_text}\n\n")
            f.write(f"REGISTRY CONTEXT:\n{filtered_registry_context}\n\n")
            f.write(f"EVENT:\nTitle: {event_title}\nDescription: {event_description}\nUUID: {event_uuid}\n")
            f.write(f"Agent Participations: {predetermined_agents}\n")
            f.write(f"Object Involvements: {predetermined_objects}\n")
        
        # Call the BAML function
        logger.info("Calling BAML ExtractEventInteractions...")
        interactions = await b.ExtractEventInteractions(
            scene_text=scene_text,
            registry_context=filtered_registry_context,
            story_synopsis=story_synopsis,
            event=event_obj,
            scene_number=scene_number,
            baml_options={"tb": tb} if tb else None
        )
        
        # Process agent participations
        agent_participations = []
        for participation in interactions.agent_participations:
            if participation.agent:
                # Verify this is actually an agent entity
                if not participation.agent.startswith("agent_"):
                    logger.warning(f"Incorrect agent type detected: {participation.agent}. Skipping this participation.")
                    continue
                    
                # Verify it's one of the predetermined agents
                if predetermined_agents and participation.agent not in predetermined_agents:
                    logger.warning(f"Agent {participation.agent} not in predetermined list {predetermined_agents}. Skipping this participation.")
                    continue
                    
                participation.uuid = f"agentparticipation_{participation.agent}_{event_uuid}"
                participation.event = event_uuid
                agent_participations.append(participation)
        
        # Process object involvements
        object_involvements = []
        for involvement in interactions.object_involvements:
            if involvement.object:
                # Verify this is actually an object entity
                if not involvement.object.startswith("object_"):
                    logger.warning(f"Incorrect object type detected: {involvement.object}. Skipping this involvement.")
                    continue
                    
                # Verify it's one of the predetermined objects
                if predetermined_objects and involvement.object not in predetermined_objects:
                    logger.warning(f"Object {involvement.object} not in predetermined list {predetermined_objects}. Skipping this involvement.")
                    continue
                    
                involvement.uuid = f"objectinvolvement_{involvement.object}_{event_uuid}"
                involvement.event = event_uuid
                object_involvements.append(involvement)
        
        logger.info(f"Extracted {len(agent_participations)} agent participations and {len(object_involvements)} object involvements for event {event_uuid}")
        return agent_participations, object_involvements
        
    except Exception as e:
        event_uuid = event.uuid if hasattr(event, 'uuid') else event.get('uuid', 'unknown')
        logger.error(f"Error extracting combined interactions for event {event_uuid}: {str(e)}")
        return [], []

async def test_entity_detection():
    """Test how well the new entity detection logic works."""
    logger.info("Testing entity detection logic")
    
    # Create a global context
    global_context = GlobalContext()
    
    # Add some test agents
    agents = [
        Agent(uuid="agent_john", name="John Smith", description="A brave explorer"),
        Agent(uuid="agent_sarah", name="Sarah Jones", description="An intelligent archaeologist"),
        Agent(uuid="agent_dragon", name="Ancient Dragon", description="A mythical creature")
    ]
    
    for agent in agents:
        global_context.entity_registry.add_agent(agent)
    
    # Add some test objects
    objects = [
        Object(uuid="object_sword", name="Ancient Sword", description="A powerful weapon"),
        Object(uuid="object_pedestal", name="Stone Pedestal", description="A display for artifacts"),
        Object(uuid="object_tome", name="Magical Tome", description="A book of spells")
    ]
    
    for obj in objects:
        global_context.entity_registry.add_object(obj)
    
    # Create a test event
    test_event = Event(
        uuid="event_001",
        title="The Discovery",
        description="John Smith carefully approached the stone pedestal where the ancient sword lay. The magical tome was nowhere to be seen.",
        sequence_within_scene=1,
        agent_participations=[],
        object_involvements=[],
        key_dialogue=[]
    )
    
    # Populate the event entities
    populate_event_entities(test_event, global_context)
    
    # Check if the correct entities were detected
    assert "agent_john" in test_event.agent_participations, "John Smith should be detected in the event"
    assert "object_sword" in test_event.object_involvements, "Ancient Sword should be detected in the event"
    assert "object_pedestal" in test_event.object_involvements, "Stone Pedestal should be detected in the event"
    assert "object_tome" in test_event.object_involvements, "Magical Tome should be detected in the event"
    
    logger.info("Entity detection test passed!")
    return test_event

async def test_extract_event_interactions():
    """Test the full extract_event_interactions_combined function."""
    logger.info("Testing extract_event_interactions_combined")
    
    # Create a global context with entities
    global_context = GlobalContext()
    
    # Add some test agents
    agents = [
        Agent(uuid="agent_john", name="John Smith", description="A brave explorer"),
        Agent(uuid="agent_sarah", name="Sarah Jones", description="An intelligent archaeologist")
    ]
    
    for agent in agents:
        global_context.entity_registry.add_agent(agent)
    
    # Add some test objects
    objects = [
        Object(uuid="object_sword", name="Ancient Sword", description="A powerful weapon"),
        Object(uuid="object_pedestal", name="Stone Pedestal", description="A display for artifacts")
    ]
    
    for obj in objects:
        global_context.entity_registry.add_object(obj)
    
    # Create a test event with pre-populated entities
    test_event = Event(
        uuid="event_001",
        title="The Discovery",
        description="John Smith carefully approached the stone pedestal where the ancient sword lay.",
        sequence_within_scene=1,
        agent_participations=["agent_john"],
        object_involvements=["object_sword", "object_pedestal"],
        key_dialogue=[]
    )
    
    # Test scene text
    test_scene_text = """
    The temple chamber was dimly lit by torches that cast long shadows on the ancient walls.
    John Smith carefully approached the stone pedestal where the ancient sword lay.
    The metal gleamed despite centuries of age, its edges still sharp.
    "I've finally found it," John whispered to himself, his hand trembling slightly.
    """
    
    # Call the function
    agent_participations, object_involvements = await extract_event_interactions_combined(
        scene_text=test_scene_text,
        registry_context="",
        story_synopsis="An adventure story about finding magical artifacts",
        event=test_event,
        scene_number=1,
        global_context=global_context
    )
    
    # Check results
    assert agent_participations, "Should have agent participations"
    assert object_involvements, "Should have object involvements"
    
    logger.info(f"Extracted {len(agent_participations)} agent participations")
    for ap in agent_participations:
        logger.info(f"Agent: {ap.agent}, Event: {ap.event}, Status: {ap.current_status[:30]}...")
    
    logger.info(f"Extracted {len(object_involvements)} object involvements")
    for oi in object_involvements:
        logger.info(f"Object: {oi.object}, Event: {oi.event}, Description: {oi.description_of_involvement[:30]}...")
    
    logger.info("Extract event interactions test completed!")

async def main():
    """Run all tests."""
    logger.info("Starting tests...")
    
    # Test entity detection
    test_event = await test_entity_detection()
    
    # Test extract_event_interactions_combined
    await test_extract_event_interactions()
    
    logger.info("All tests completed successfully!")

if __name__ == "__main__":
    asyncio.run(main())