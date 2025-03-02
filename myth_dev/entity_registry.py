# entity_registry.py
from typing import Dict, Any, List, Union, cast, Optional, Set, Tuple, TypeVar, Generic, Callable, Awaitable
import logging
from thefuzz import fuzz
from baml_client.types import Agent, Organization, Location, Object, ResolvedAgent, ResolvedOrganization, ResolvedLocation, ResolvedObject
from utils import generate_uuid, normalize_identifier, normalize_name, normalize_for_matching, is_close_match
from baml_client import b
from collections import defaultdict
import re
import math

# Type variable for entity types
T = TypeVar('T')

class BatchResolver(Generic[T]):
    """
    Handles batch processing of entity resolution to avoid overwhelming the LLM.
    """
    
    def __init__(
        self, 
        resolve_func: Callable[[List[T]], Awaitable[List[Any]]], 
        entity_type: str,
        batch_size: int = 25,
        similarity_threshold: float = 0.85
    ):
        """
        Initialize the batch resolver.
        
        Args:
            resolve_func: The async function that resolves entities (e.g., ResolveAgentCluster)
            entity_type: String name of the entity type (for logging)
            batch_size: Maximum number of entities to process in a single batch
            similarity_threshold: Threshold for name similarity to group entities before batching
        """
        self.resolve_func = resolve_func
        self.entity_type = entity_type
        self.batch_size = batch_size
        self.similarity_threshold = similarity_threshold
        self.logger = logging.getLogger(f"BatchResolver:{entity_type}")

    def create_batches(self, entities: List[T]) -> List[List[T]]:
        if not entities:
            return []
        if len(entities) <= self.batch_size:
            return [entities]
            
        from thefuzz import fuzz
        from utils import normalize_for_matching
        
        entity_names = []
        for entity in entities:
            if hasattr(entity, "name"):
                entity_names.append(normalize_for_matching(entity.name))
            else:
                entity_names.append("")
        
        similarity_groups = defaultdict(list)
        assigned = set()
        
        for i, entity in enumerate(entities):
            if i in assigned:
                continue
            group = [i]
            assigned.add(i)
            for j in range(i+1, len(entities)):
                if j in assigned:
                    continue
                if fuzz.ratio(entity_names[i], entity_names[j]) >= self.similarity_threshold * 100:
                    group.append(j)
                    assigned.add(j)
            group_key = f"group_{len(similarity_groups)}"
            similarity_groups[group_key] = [entities[idx] for idx in group]
            
        batches = []
        current_batch = []
        current_batch_size = 0
        
        for group in similarity_groups.values():
            group_size = len(group)
            if group_size > self.batch_size:
                for i in range(0, group_size, self.batch_size):
                    batches.append(group[i:i+self.batch_size])
                continue
            if current_batch_size + group_size > self.batch_size:
                batches.append(current_batch)
                current_batch = []
                current_batch_size = 0
            current_batch.extend(group)
            current_batch_size += group_size
            
        if current_batch:
            batches.append(current_batch)
            
        self.logger.info(f"Created {len(batches)} batches from {len(entities)} {self.entity_type} entities")
        for i, batch in enumerate(batches):
            self.logger.debug(f"Batch {i+1}: {len(batch)} entities")
            
        return batches

    async def resolve_in_batches(self, entities: List[T]) -> List[Any]:
        if not entities:
            self.logger.info(f"No {self.entity_type} entities to resolve")
            return []
        self.logger.info(f"Resolving {len(entities)} {self.entity_type} entities in batches")
        batches = self.create_batches(entities)
        all_resolved_entities = []
        for i, batch in enumerate(batches):
            try:
                self.logger.info(f"Processing batch {i+1}/{len(batches)} with {len(batch)} entities")
                resolved_batch = await self.resolve_func(batch)
                self.logger.info(f"Batch {i+1} resolved {len(batch)} entities into {len(resolved_batch)} entities")
                all_resolved_entities.extend(resolved_batch)
            except Exception as e:
                self.logger.error(f"Error resolving batch {i+1}: {str(e)}", exc_info=True)
                self.logger.warning(f"Using unresolved entities for batch {i+1} due to error")
                all_resolved_entities.extend(batch)
        self.logger.info(f"Completed {self.entity_type} resolution: {len(entities)} entities resolved to {len(all_resolved_entities)} entities")
        return all_resolved_entities

    async def resolve_and_merge(self, entities: List[T]) -> List[Any]:
        batch_resolved = await self.resolve_in_batches(entities)
        if len(batch_resolved) > self.batch_size:
            self.logger.info(f"Performing final merge pass on {len(batch_resolved)} resolved entities")
            try:
                final_batch_size = min(2 * self.batch_size, 50)
                final_batches = [batch_resolved[i:i+final_batch_size] 
                                for i in range(0, len(batch_resolved), final_batch_size)]
                
                final_resolved = []
                for i, batch in enumerate(final_batches):
                    self.logger.info(f"Final pass batch {i+1}/{len(final_batches)}")
                    resolved_batch = await self.resolve_func(batch)
                    final_resolved.extend(resolved_batch)
                    
                self.logger.info(f"Final merge complete: {len(batch_resolved)} entities merged to {len(final_resolved)}")
                return final_resolved
            except Exception as e:
                self.logger.error(f"Error in final merge pass: {str(e)}", exc_info=True)
                self.logger.warning("Using batch-resolved entities due to error in final merge")
                return batch_resolved
        else:
            return batch_resolved

class EntityRegistry:
    """
    Maintains distinct collections of primary entities (agents, organizations, locations, objects)
    using native BAML types. Ensures consistent entity references through batched resolution.
    """

    def __init__(self):
        self.agents: Dict[str, Agent] = {}
        self.organizations: Dict[str, Organization] = {}
        self.locations: Dict[str, Location] = {}
        self.objects: Dict[str, Object] = {}
        self.processed_episodes: List[Dict[str, Any]] = []
        self._original_agents: Dict[str, Agent] = {}
        self._original_organizations: Dict[str, Organization] = {}
        self._original_locations: Dict[str, Location] = {}
        self._original_objects: Dict[str, Object] = {}
        self.entity_uuid_mapping: Dict[str, str] = {}

    def register(self, entity: Any, entity_type: str) -> None:
        logging.debug(f"Registering entity of type: {entity_type}")
        if entity_type == "agents":
            self._register_agent(cast(Agent, entity))
        elif entity_type == "organizations":
            self._register_organization(cast(Organization, entity))
        elif entity_type == "locations":
            self._register_location(cast(Location, entity))
        elif entity_type == "objects":
            self._register_object(cast(Object, entity))
        else:
            logging.error(f"Unknown entity type: {entity_type}")
            raise ValueError(f"Unknown entity type: {entity_type}")

    def _register_agent(self, agent: Agent) -> None:
        key = agent.uuid
        self.agents[key] = agent
        self._original_agents[key] = agent
        logging.debug(f"Registered agent {agent.name} with UUID {agent.uuid}")

    def _register_organization(self, org: Organization) -> None:
        key = org.uuid
        self.organizations[key] = org
        self._original_organizations[key] = org
        logging.debug(f"Registered organization {org.name} with UUID {org.uuid}")

    def _register_location(self, location: Location) -> None:
        key = location.uuid
        self.locations[key] = location
        self._original_locations[key] = location
        logging.debug(f"Registered location {location.name} with UUID {location.uuid}")

    def _register_object(self, obj: Object) -> None:
        key = obj.uuid
        self.objects[key] = obj
        self._original_objects[key] = obj
        logging.debug(f"Registered object {obj.name} with UUID {obj.uuid}")

    def get_agent(self, agent_id: str) -> Optional[Agent]:
        key = normalize_identifier(agent_id)
        return self.agents.get(key)

    def get_organization(self, org_id: str) -> Optional[Organization]:
        key = normalize_identifier(org_id)
        return self.organizations.get(key)

    def get_location(self, location_name: str) -> Optional[Location]:
        key = normalize_identifier(location_name)
        return self.locations.get(key)

    def get_object(self, object_name: str) -> Optional[Object]:
        key = normalize_identifier(object_name)
        return self.objects.get(key)

    def get_all_entities(self) -> Dict[str, List[Any]]:
        return {
            "agents": list(self.agents.values()),
            "organizations": list(self.organizations.values()),
            "locations": list(self.locations.values()),
            "objects": list(self.objects.values()),
        }

    def find_entity_by_name(self, name: str, entity_type: str) -> Optional[Any]:
        logging.debug(f"Finding entity by name: {name} ({entity_type})")
        entities = getattr(self, entity_type)
        for existing_name, entity in entities.items():
            if is_close_match(name, existing_name):
                logging.debug(f"Found close match for {name}: {existing_name}")
                return entity
        logging.debug(f"No close match found for {name} in {entity_type}")
        return None

    def find_entity_by_uuid(self, entity_uuid: str) -> Optional[Any]:
        logging.debug(f"Finding entity by UUID: {entity_uuid}")
        if entity_uuid in self.entity_uuid_mapping:
            remapped_uuid = self.entity_uuid_mapping[entity_uuid]
            logging.debug(f"UUID {entity_uuid} has been remapped to {remapped_uuid}")
            entity_uuid = remapped_uuid
                
        # Special case for participation and involvement UUIDs
        if entity_uuid.startswith("agentparticipation_") or entity_uuid.startswith("objectinvolvement_"):
            # These are dynamically created and not stored in the registry
            # Return a placeholder True value to indicate it's a valid reference format
            return True
            
        # Check in respective entity collections based on prefix
        if entity_uuid.startswith("agent_"):
            return self.agents.get(entity_uuid)
        elif entity_uuid.startswith("org_"):
            return self.organizations.get(entity_uuid)
        elif entity_uuid.startswith("location_"):
            return self.locations.get(entity_uuid)
        elif entity_uuid.startswith("object_"):
            return self.objects.get(entity_uuid)
        
        # If no specific prefix, try all collections
        for collection in [self.agents, self.organizations, self.locations, self.objects]:
            if entity_uuid in collection:
                return collection[entity_uuid]
        
        logging.debug(f"No entity found with UUID {entity_uuid}")
        return None

    def get_agent_name_to_uuid_mapping(self) -> Dict[str, str]:
        mapping = {}
        for agent in self.agents.values():
            if agent.name:
                mapping[normalize_name(agent.name)] = agent.uuid
            if hasattr(agent, "aliases") and agent.aliases:
                for alias in agent.aliases:
                    mapping[normalize_name(alias)] = agent.uuid
        return mapping

    def update_agent_affiliations(self) -> None:
        """
        Ensures bidirectional consistency between agent affiliations and organization members.
        If an agent is affiliated with an organization, add the agent to the organization's members list.
        """
        logging.info("Updating agent-organization affiliations for consistency...")
        
        # First, gather all the affiliated_org references from agents
        org_to_agents = defaultdict(list)
        for agent_uuid, agent in self.agents.items():
            if agent.affiliated_org:
                org_uuid = agent.affiliated_org
                org_to_agents[org_uuid].append(agent_uuid)
        
        # Update organization members lists
        for org_uuid, agent_uuids in org_to_agents.items():
            org = self.organizations.get(org_uuid)
            if org:
                if org.members is None:
                    org.members = []
                # Add any missing agent UUIDs to the members list
                for agent_uuid in agent_uuids:
                    if agent_uuid not in org.members:
                        org.members.append(agent_uuid)
                logging.debug(f"Updated organization {org.name} with {len(org.members)} members")
            else:
                logging.warning(f"Agent(s) affiliated with non-existent organization: {org_uuid}")
        
        logging.info("Agent-organization affiliation update complete")

    async def reconcile_entities(self, use_batched: bool = True) -> None:
        entity_counts = {
            "agents": len(self.agents),
            "organizations": len(self.organizations),
            "locations": len(self.locations),
            "objects": len(self.objects)
        }
        
        total_entities = sum(entity_counts.values())
        largest_entity_type = max(entity_counts, key=entity_counts.get)
        largest_count = entity_counts[largest_entity_type]
        
        should_use_batched = use_batched or total_entities > 75 or largest_count > 25
        
        if should_use_batched:
            logging.info(f"Using batched entity resolution for {total_entities} total entities")
            await self.reconcile_entities_batched()
        else:
            logging.info(f"Using standard entity resolution for {total_entities} total entities")
            await self._reconcile_entities_original()
    
    async def _reconcile_entities_original(self) -> None:
        logging.info("Starting entity reconciliation...")
        self.entity_uuid_mapping = {}
        stats = {
            "agents": {"before": len(self.agents), "after": 0},
            "organizations": {"before": len(self.organizations), "after": 0},
            "locations": {"before": len(self.locations), "after": 0},
            "objects": {"before": len(self.objects), "after": 0},
        }
        
        await self._reconcile_agents()
        await self._reconcile_organizations()
        await self._reconcile_locations()
        await self._reconcile_objects()
        
        stats["agents"]["after"] = len(self.agents)
        stats["organizations"]["after"] = len(self.organizations)
        stats["locations"]["after"] = len(self.locations)
        stats["objects"]["after"] = len(self.objects)
        
        for entity_type, count in stats.items():
            logging.info(f"Reconciled {entity_type}: {count['before']} entities before, {count['after']} after reconciliation")
            
        logging.info(f"Entity reconciliation complete. Remapped {len(self.entity_uuid_mapping)} entity UUIDs.")

    async def _reconcile_agents(self) -> None:
        if not self.agents:
            logging.info("No agents to reconcile.")
            return
        logging.info(f"Reconciling {len(self.agents)} agents...")
        original_uuids = set(self.agents.keys())
        try:
            resolved_agents = await b.ResolveAgentCluster(entities=list(self.agents.values()))
            new_registry = {}
            for agent in resolved_agents:
                new_registry[agent.uuid] = Agent(
                    uuid=agent.uuid,
                    agent_id=agent.agent_id,
                    name=agent.name,
                    title=agent.title,
                    aliases=agent.aliases,
                    description=agent.description,
                    traits=agent.traits,
                    affiliated_org=agent.affiliated_org,
                    sphere_of_influence=agent.sphere_of_influence,
                )
                if hasattr(agent, "source_uuids") and agent.source_uuids:
                    for source_uuid in agent.source_uuids:
                        if source_uuid != agent.uuid:
                            self.entity_uuid_mapping[source_uuid] = agent.uuid
            self.agents = new_registry
            logging.info(f"Agent reconciliation complete. {len(resolved_agents)} agents after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling agents: {e}", exc_info=True)
            logging.warning("Using original unreconciled agents due to error.")

    async def _reconcile_organizations(self) -> None:
        if not self.organizations:
            logging.info("No organizations to reconcile.")
            return
        logging.info(f"Reconciling {len(self.organizations)} organizations...")
        original_uuids = set(self.organizations.keys())
        try:
            resolved_orgs = await b.ResolveOrganizationCluster(entities=list(self.organizations.values()))
            new_registry = {}
            for org in resolved_orgs:
                new_registry[org.uuid] = Organization(
                    uuid=org.uuid,
                    name=org.name,
                    description=org.description,
                    sphere_of_influence=org.sphere_of_influence,
                    members=org.members or []
                )
                if hasattr(org, "source_uuids") and org.source_uuids:
                    for source_uuid in org.source_uuids:
                        if source_uuid != org.uuid:
                            self.entity_uuid_mapping[source_uuid] = org.uuid
            self.organizations = new_registry
            logging.info(f"Organization reconciliation complete. {len(resolved_orgs)} organizations after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling organizations: {e}", exc_info=True)
            logging.warning("Using original unreconciled organizations due to error.")

    async def _reconcile_locations(self) -> None:
        if not self.locations:
            logging.info("No locations to reconcile.")
            return
        logging.info(f"Reconciling {len(self.locations)} locations...")
        original_uuids = set(self.locations.keys())
        try:
            resolved_locations = await b.ResolveLocationCluster(entities=list(self.locations.values()))
            new_registry = {}
            for location in resolved_locations:
                new_registry[location.uuid] = Location(
                    uuid=location.uuid,
                    name=location.name,
                    description=location.description,
                    type=location.type,
                )
                if hasattr(location, "source_uuids") and location.source_uuids:
                    for source_uuid in location.source_uuids:
                        if source_uuid != location.uuid:
                            self.entity_uuid_mapping[source_uuid] = location.uuid
            self.locations = new_registry
            logging.info(f"Location reconciliation complete. {len(resolved_locations)} locations after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling locations: {e}", exc_info=True)
            logging.warning("Using original unreconciled locations due to error.")

    async def _reconcile_objects(self) -> None:
        if not self.objects:
            logging.info("No objects to reconcile.")
            return
        logging.info(f"Reconciling {len(self.objects)} objects...")
        original_uuids = set(self.objects.keys())
        try:
            resolved_objects = await b.ResolveObjectCluster(entities=list(self.objects.values()))
            new_registry = {}
            for obj in resolved_objects:
                new_registry[obj.uuid] = Object(
                    uuid=obj.uuid,
                    name=obj.name,
                    description=obj.description,
                    purpose=obj.purpose,
                    significance=obj.significance,
                    original_owner=obj.original_owner,
                )
                if hasattr(obj, "source_uuids") and obj.source_uuids:
                    for source_uuid in obj.source_uuids:
                        if source_uuid != obj.uuid:
                            self.entity_uuid_mapping[source_uuid] = obj.uuid
            self.objects = new_registry
            logging.info(f"Object reconciliation complete. {len(resolved_objects)} objects after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling objects: {e}", exc_info=True)
            logging.warning("Using original unreconciled objects due to error.")

    async def reconcile_entities_batched(self) -> None:
        logging.info("Starting batched entity reconciliation...")
        self.entity_uuid_mapping = {}
        stats = {
            "agents": {"before": len(self.agents), "after": 0},
            "organizations": {"before": len(self.organizations), "after": 0},
            "locations": {"before": len(self.locations), "after": 0},
            "objects": {"before": len(self.objects), "after": 0},
        }
        
        await self._reconcile_agents_batched()
        await self._reconcile_organizations_batched()
        await self._reconcile_locations_batched()
        await self._reconcile_objects_batched()
        
        stats["agents"]["after"] = len(self.agents)
        stats["organizations"]["after"] = len(self.organizations)
        stats["locations"]["after"] = len(self.locations)
        stats["objects"]["after"] = len(self.objects)
        
        for entity_type, count in stats.items():
            logging.info(f"Reconciled {entity_type}: {count['before']} entities before, {count['after']} after reconciliation")
            
        logging.info(f"Entity reconciliation complete. Remapped {len(self.entity_uuid_mapping)} entity UUIDs.")

    async def _reconcile_agents_batched(self) -> None:
        if not self.agents:
            logging.info("No agents to reconcile.")
            return
        logging.info(f"Reconciling {len(self.agents)} agents with batch processing...")
        original_uuids = set(self.agents.keys())
        from baml_client import b
        resolver = BatchResolver(b.ResolveAgentCluster, "agents", batch_size=30)
        try:
            resolved_agents = await resolver.resolve_and_merge(list(self.agents.values()))
            new_registry = {}
            for agent in resolved_agents:
                new_registry[agent.uuid] = agent
                if hasattr(agent, "source_uuids") and agent.source_uuids:
                    for source_uuid in agent.source_uuids:
                        if source_uuid != agent.uuid:
                            self.entity_uuid_mapping[source_uuid] = agent.uuid
            self.agents = new_registry
            logging.info(f"Agent reconciliation complete. {len(resolved_agents)} agents after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling agents: {e}", exc_info=True)
            logging.warning("Using original unreconciled agents due to error.")

    async def _reconcile_organizations_batched(self) -> None:
        if not self.organizations:
            logging.info("No organizations to reconcile.")
            return
        logging.info(f"Reconciling {len(self.organizations)} organizations with batch processing...")
        original_uuids = set(self.organizations.keys())
        from baml_client import b
        resolver = BatchResolver(b.ResolveOrganizationCluster, "organizations", batch_size=30)
        try:
            resolved_orgs = await resolver.resolve_and_merge(list(self.organizations.values()))
            new_registry = {}
            for org in resolved_orgs:
                new_registry[org.uuid] = org
                if hasattr(org, "source_uuids") and org.source_uuids:
                    for source_uuid in org.source_uuids:
                        if source_uuid != org.uuid:
                            self.entity_uuid_mapping[source_uuid] = org.uuid
            self.organizations = new_registry
            logging.info(f"Organization reconciliation complete. {len(resolved_orgs)} organizations after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling organizations: {e}", exc_info=True)
            logging.warning("Using original unreconciled organizations due to error.")

    async def _reconcile_locations_batched(self) -> None:
        if not self.locations:
            logging.info("No locations to reconcile.")
            return
        logging.info(f"Reconciling {len(self.locations)} locations with batch processing...")
        original_uuids = set(self.locations.keys())
        from baml_client import b
        resolver = BatchResolver(b.ResolveLocationCluster, "locations", batch_size=25)
        try:
            resolved_locations = await resolver.resolve_and_merge(list(self.locations.values()))
            new_registry = {}
            for location in resolved_locations:
                new_registry[location.uuid] = location
                if hasattr(location, "source_uuids") and location.source_uuids:
                    for source_uuid in location.source_uuids:
                        if source_uuid != location.uuid:
                            self.entity_uuid_mapping[source_uuid] = location.uuid
            self.locations = new_registry
            logging.info(f"Location reconciliation complete. {len(resolved_locations)} locations after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling locations: {e}", exc_info=True)
            logging.warning("Using original unreconciled locations due to error.")

    async def _reconcile_objects_batched(self) -> None:
        if not self.objects:
            logging.info("No objects to reconcile.")
            return
        logging.info(f"Reconciling {len(self.objects)} objects with batch processing...")
        original_uuids = set(self.objects.keys())
        from baml_client import b
        resolver = BatchResolver(b.ResolveObjectCluster, "objects", batch_size=25)
        try:
            resolved_objects = await resolver.resolve_and_merge(list(self.objects.values()))
            new_registry = {}
            for obj in resolved_objects:
                new_registry[obj.uuid] = obj
                if hasattr(obj, "source_uuids") and obj.source_uuids:
                    for source_uuid in obj.source_uuids:
                        if source_uuid != obj.uuid:
                            self.entity_uuid_mapping[source_uuid] = obj.uuid
            self.objects = new_registry
            logging.info(f"Object reconciliation complete. {len(resolved_objects)} objects after reconciliation.")
        except Exception as e:
            logging.error(f"Error reconciling objects: {e}", exc_info=True)
            logging.warning("Using original unreconciled objects due to error.")
