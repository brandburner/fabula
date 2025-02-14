# entity_registry.py
from typing import Dict, Any, List, Union, cast, Optional
import logging
from thefuzz import fuzz
from baml_client.types import Agent, Organization, Location, Object, ResolvedAgent, ResolvedOrganization, ResolvedLocation, ResolvedObject
from utils import generate_uuid, normalize_identifier, normalize_name, normalize_for_matching, is_close_match
from baml_client import b

class EntityRegistry:
    """
    Maintains distinct collections of primary entities (agents, organizations, locations, objects)
    using native BAML types. Ensures consistent entity references.
    """

    def __init__(self):
        self.agents: Dict[str, Agent] = {}
        self.organizations: Dict[str, Organization] = {}
        self.locations: Dict[str, Location] = {}
        self.objects: Dict[str, Object] = {}

    def register(self, entity: Any, entity_type: str) -> None:
        """Registers or merges an entity into the registry based on type."""
        logging.debug(f"Registering entity of type: {entity_type}")
        if entity_type == "agents":
            self.register_agent(cast(Agent, entity))
        elif entity_type == "organizations":
            self.register_organization(cast(Organization, entity))
        elif entity_type == "locations":
            self.register_location(cast(Location, entity))
        elif entity_type == "objects":
            self.register_object(cast(Object, entity))
        else:
            logging.error(f"Unknown entity type: {entity_type}")
            raise ValueError(f"Unknown entity type: {entity_type}")

    # def register_agent(self, agent: Agent) -> None:
    #     """Registers or updates an agent, handling duplicates and orgs."""

    #     identifier = agent.agent_id if agent.agent_id else agent.name
    #     if not identifier:
    #         logging.error("Agent must have a name or an agent_id.")
    #         return

    #     # 1. Check for existing agent by UUID (fastest and most reliable)
    #     existing_agent = self.find_entity_by_uuid(agent.uuid)
    #     if existing_agent:
    #         logging.debug(f"Agent with UUID {agent.uuid} already exists. Merging...")
    #         self._merge_agent(existing_agent, agent)
    #         return  # CRITICAL: Return after merging by UUID

    #     # 2. Check for potential duplicates by name/aliases (using normalize_for_matching)
    #     for existing_agent in self.agents.values():
    #         if is_close_match(agent.name, existing_agent.name):
    #             logging.debug(f"Potential duplicate agent found (name match). Merging...")
    #             self._merge_agent(existing_agent, agent)
    #             return # Return after merging
    #         if hasattr(agent, "aliases") and agent.aliases:
    #             for alias in agent.aliases:
    #                 if is_close_match(alias, existing_agent.name):
    #                     logging.debug(f"Potential duplicate agent found (alias match). Merging...")
    #                     self._merge_agent(existing_agent, agent)
    #                     return # Return after merging

    #     # 3. Add new agent to the registry
    #     logging.debug(f"Adding new agent {agent.name} with UUID {agent.uuid}.")
    #     key = agent.uuid # Use LLM UUID as the key
    #     self.agents[key] = agent

    def register_agent(self, agent: Agent) -> None:
        """Registers or updates an agent, handling duplicates and orgs."""
        
        # 1. Check for existing agent by UUID (fastest and most reliable)
        existing_agent = self.find_entity_by_uuid(agent.uuid)
        if existing_agent:
            self._merge_agent(existing_agent, agent)
            return

        # 2. Check for potential duplicates by name/aliases using normalized matching
        normalized_name = normalize_for_matching(agent.name)
        for existing_agent in self.agents.values():
            if is_close_match(normalized_name, normalize_for_matching(existing_agent.name)):
                self._merge_agent(existing_agent, agent) 
                return
            
            # Check aliases with normalized matching
            if hasattr(agent, "aliases") and agent.aliases:
                for alias in agent.aliases:
                    if is_close_match(normalize_for_matching(alias), 
                                    normalize_for_matching(existing_agent.name)):
                        self._merge_agent(existing_agent, agent)
                        return

        # 3. Add new agent using UUID as key
        self.agents[agent.uuid] = agent

    # def _merge_agent(self, existing_agent: Agent, new_agent: Agent) -> None:
    #     """Merges new agent data into the existing agent record, KEEPING EXISTING UUID."""
    #     logging.debug(f"Merging agent {existing_agent.uuid} ({existing_agent.name}) with new data.")

    #     # Prioritize existing values, but update if new data is present and different
    #     if new_agent.name and new_agent.name != existing_agent.name:
    #         logging.debug(f"Updating agent name from {existing_agent.name} to {new_agent.name}")
    #         existing_agent.name = new_agent.name
    #     if new_agent.title is not None and new_agent.title != existing_agent.title:
    #         existing_agent.title = new_agent.title
    #     if new_agent.description is not None and new_agent.description != existing_agent.description:
    #         existing_agent.description = new_agent.description
    #     if new_agent.traits:
    #         existing_agent.traits = list(
    #             set(existing_agent.traits or []) | set(new_agent.traits)
    #         )
    #     if new_agent.affiliated_org and new_agent.affiliated_org != existing_agent.affiliated_org:
    #         existing_agent.affiliated_org = new_agent.affiliated_org
    #     if new_agent.sphere_of_influence is not None and new_agent.sphere_of_influence != existing_agent.sphere_of_influence:
    #         existing_agent.sphere_of_influence = new_agent.sphere_of_influence

    #     # Merge aliases only if the attribute exists in both
    #     if hasattr(existing_agent, "aliases") and hasattr(new_agent, "aliases"):
    #         existing_agent.aliases = list(
    #             set(existing_agent.aliases or []) | set(new_agent.aliases or [])
    #         )

    def _merge_agent(self, existing_agent: Agent, new_agent: Agent) -> None:
        """Merges new agent data into existing agent record, preserving existing UUID."""
        
        logging.debug(f"Merging agent {existing_agent.uuid} with new data")
        
        # Core fields - take non-null new values
        if new_agent.name and new_agent.name != existing_agent.name:
            existing_agent.name = new_agent.name
            logging.debug(f"Updated name to: {new_agent.name}")
            
        if new_agent.title and new_agent.title != existing_agent.title:
            existing_agent.title = new_agent.title
            
        # Merge descriptions if both exist
        if existing_agent.description and new_agent.description:
            existing_agent.description = f"{existing_agent.description}\n{new_agent.description}"
        elif new_agent.description:
            existing_agent.description = new_agent.description
            
        # Merge traits as sets
        if new_agent.traits:
            existing_traits = set(existing_agent.traits or [])
            new_traits = set(new_agent.traits)
            existing_agent.traits = list(existing_traits | new_traits)
            
        # Organizational affiliation - prefer more specific over "Unknown"
        if (new_agent.affiliated_org and 
            new_agent.affiliated_org != "Unknown" and
            new_agent.affiliated_org != existing_agent.affiliated_org):
            existing_agent.affiliated_org = new_agent.affiliated_org
            
        # Merge aliases if present
        if hasattr(existing_agent, "aliases") and hasattr(new_agent, "aliases"):
            existing_aliases = set(existing_agent.aliases or [])
            new_aliases = set(new_agent.aliases or [])
            existing_agent.aliases = list(existing_aliases | new_aliases)

        def get_agent(self, agent_id: str) -> Optional[Agent]:
            """Retrieves an agent by its ID (using normalize_identifier)."""
            return self.agents.get(agent_id)


        def register_organization(self, org: Organization) -> None:
            """Registers or updates an organization."""
            logging.debug(f"Registering organization: {org.name}")

            # Check for existing by UUID
            existing_org = self.find_entity_by_uuid(org.uuid)
            if existing_org:
                logging.debug(f"Organization with UUID {org.uuid} already exists. Merging...")
                self._merge_organization(existing_org, org)
                return

            # Check for potential duplicates by name (using normalize_for_matching)
            for existing_org in self.organizations.values():
                if is_close_match(org.name, existing_org.name):
                    logging.debug(f"Potential duplicate organization found (name match). Merging...")
                    self._merge_organization(existing_org, org)
                    return

            # Add new organization
            logging.debug(f"Adding new organization {org.name} with UUID {org.uuid}.")
            key = org.uuid # Use LLM UUID for the key
            self.organizations[key] = org


    def _merge_organization(self, existing_org: Organization, new_org: Organization) -> None:
        """Merges new organization data into the existing record, KEEPING EXISTING UUID."""
        logging.debug(f"Merging organization {existing_org.uuid} ({existing_org.name}) with new data.")

        if new_org.name and new_org.name != existing_org.name:
            logging.info(f"Updating org name from {existing_org.name} to {new_org.name}")
            existing_org.name = new_org.name
        if new_org.description is not None and new_org.description != existing_org.description:
            existing_org.description = new_org.description
        if new_org.sphere_of_influence and new_org.sphere_of_influence != "Unknown" and new_org.sphere_of_influence != existing_org.sphere_of_influence:
            existing_org.sphere_of_influence = new_org.sphere_of_influence
        if new_org.members:
            existing_org.members = list(
                set(existing_org.members or []) | set(new_org.members)
            )

    def get_organization(self, org_id: str) -> Optional[Organization]:
        """Retrieves an organization by its ID."""
        key = normalize_identifier(org_id)
        return self.organizations.get(key)

    def register_location(self, location: Location) -> None:
        """Registers or updates a location."""
        logging.debug(f"Registering location: {location.name}")

        # Check by UUID
        existing_location = self.find_entity_by_uuid(location.uuid)
        if existing_location:
            logging.debug(f"Location {location.name} exists. Merging...")
            self._merge_location(existing_location, location)
            return

        # Check for duplicates by name
        for existing_location in self.locations.values():
            if is_close_match(location.name, existing_location.name):
                 logging.debug(f"Potential duplicate location found (name match). Merging...")
                 self._merge_location(existing_location, location)
                 return

        # Add new
        logging.debug(f"Adding new location {location.name} to registry.")
        key = location.uuid # Use the LLM UUID as the Key
        self.locations[key] = location

    def _merge_location(self, existing_location: Location, new_location: Location) -> None:
        """Merges new location data into the existing record, KEEPING EXISTING UUID."""
        logging.debug(f"Merging location {existing_location.uuid} ({existing_location.name}) with new data.")
        if new_location.name and new_location.name != existing_location.name:
            logging.debug(f"Updating location name to {new_location.name}")
            existing_location.name = new_location.name
        if new_location.description is not None and new_location.description != existing_location.description:
            existing_location.description = new_location.description
        if new_location.type is not None and new_location.type != existing_location.type:
            existing_location.type = new_location.type

    def get_location(self, location_name: str) -> Optional[Location]:
        """Retrieves a location by its name."""
        key = normalize_identifier(location_name)
        return self.locations.get(key)

    def register_object(self, obj: Object) -> None:
        """Registers or updates an object."""
        logging.debug(f"Registering object: {obj.name}")

        # Check by UUID
        existing_object = self.find_entity_by_uuid(obj.uuid)
        if existing_object:
            logging.debug(f"Object {obj.name} exists. Merging...")
            self._merge_object(existing_object, obj)
            return

        # Check for duplicates by name
        for existing_object in self.objects.values():
            if is_close_match(obj.name, existing_object.name):
                logging.debug(f"Potential duplicate object found (name match). Merging...")
                self._merge_object(existing_object, obj)
                return

        # Add new
        logging.debug(f"Adding new object {obj.name} to registry.")
        key = obj.uuid # Use LLM UUID as key
        self.objects[key] = obj

    def _merge_object(self, existing_obj: Object, new_obj: Object) -> None:
        """Merges new object data into the existing record, KEEPING EXISTING UUID."""
        logging.debug(f"Merging object {existing_obj.uuid} ({existing_obj.name}) with new data.")
        if new_obj.name and new_obj.name != existing_obj.name:
            logging.debug(f"Updating object name to {new_obj.name}")
            existing_obj.name = new_obj.name
        if new_obj.description is not None and new_obj.description != existing_obj.description:
            existing_obj.description = new_obj.description
        if new_obj.purpose is not None and new_obj.purpose != existing_obj.purpose:
            existing_obj.purpose = new_obj.purpose
        if new_obj.significance is not None and new_obj.significance != existing_obj.significance:
            existing_obj.significance = new_obj.significance
        if new_obj.original_owner and new_obj.original_owner != existing_obj.original_owner:
            existing_obj.original_owner = new_obj.original_owner

    def get_object(self, object_name: str) -> Optional[Object]:
        """Retrieves an object by its name."""
        key = normalize_identifier(object_name)
        return self.objects.get(key)

    def get_all_entities(self) -> Dict[str, List[Any]]:
        """Returns all registered entities, keyed by type."""
        return {
            "agents": list(self.agents.values()),
            "organizations": list(self.organizations.values()),
            "locations": list(self.locations.values()),
            "objects": list(self.objects.values()),
        }

    def find_entity_by_name(self, name: str, entity_type: str) -> Optional[Any]:
        """Finds an entity by name (fuzzy matching using normalize_for_matching)."""
        logging.debug(f"Finding entity by name: {name} ({entity_type})")
        entities = getattr(self, entity_type)
        for existing_name, entity in entities.items():
            if is_close_match(name, existing_name):
                logging.debug(f"Found close match for {name}: {existing_name}")
                return entity
        logging.debug(f"No close match found for {name} in {entity_type}")
        return None

    def find_entity_by_uuid(self, entity_uuid: str) -> Optional[Any]:
        """Finds an entity of any type by its UUID."""
        logging.debug(f"Finding entity by UUID: {entity_uuid}")
        for entity_type in ["agents", "organizations", "locations", "objects"]:
            entities = getattr(self, entity_type)
            for entity in entities.values():
                if entity.uuid == entity_uuid:
                    logging.debug(f"Found entity with UUID {entity_uuid}: {getattr(entity, 'name', '')}")
                    return entity
        logging.debug(f"No entity found with UUID {entity_uuid}")
        return None

    def merge_duplicate_entities(self, threshold: int = 85) -> None:
        """Merges entities that are likely duplicates (fuzzy name matching).  Uses normalize_for_matching."""
        logging.debug(f"Merging duplicate entities (threshold: {threshold})")
        for entity_type in ["agents", "organizations", "locations", "objects"]:
            entities = list(getattr(self, entity_type).values())
            for i, entity1 in enumerate(entities):
                for j, entity2 in enumerate(entities[i + 1 :]):
                    if is_close_match(entity1.name, entity2.name, threshold):
                        logging.info(f"Merging {entity_type}: {entity1.name} with {entity2.name}")
                        self._merge_entities_by_type(entity_type, entity1, entity2)

    def _merge_entities_by_type(self, entity_type: str, entity1: Any, entity2: Any) -> None:
        """Helper: merge entities based on type."""
        if entity_type == "agents":
            self._merge_agent(entity1, entity2)
        elif entity_type == "organizations":
            self._merge_organization(entity1, entity2)
        elif entity_type == "locations":
            self._merge_location(entity1, entity2)
        elif entity_type == "objects":
            self._merge_object(entity1, entity2)

    def get_agent_name_to_uuid_mapping(self) -> Dict[str, str]:
        """Creates a mapping of agent names (and aliases) to UUIDs.  Uses normalize_name."""
        mapping = {}
        for agent in self.agents.values():
            if agent.name:
                mapping[normalize_name(agent.name)] = agent.uuid
            if hasattr(agent, "aliases") and agent.aliases:
                for alias in agent.aliases:
                    mapping[normalize_name(alias)] = agent.uuid
        return mapping

    async def reconcile_entities(self) -> None:
        """
        Reconciles entities using LLM-assisted resolution.  Converts from
        Resolved* types back to the original entity types.
        """
        for entity_type in ["agents", "organizations", "locations", "objects"]:
            logging.info(f"Reconciling {entity_type}...")
            entities = list(getattr(self, entity_type).values())

            if not entities:
                logging.info(f"No {entity_type} to reconcile.")
                continue

            # Call the appropriate BAML resolution function
            if entity_type == "agents":
                resolved_entities = await b.ResolveAgentCluster(entities=entities)
                # Convert ResolvedAgent back to Agent
                new_registry = {
                    entity.uuid: Agent(
                        uuid=entity.uuid,
                        agent_id=entity.agent_id,
                        name=entity.name,
                        title=entity.title,
                        aliases=entity.aliases,
                        description=entity.description,
                        traits=entity.traits,
                        affiliated_org=entity.affiliated_org,
                        sphere_of_influence=entity.sphere_of_influence,
                    )
                    for entity in resolved_entities
                }
            elif entity_type == "organizations":
                resolved_entities = await b.ResolveOrganizationCluster(entities=entities)
                # Convert ResolvedOrganization back to Organization
                new_registry = {
                    entity.uuid: Organization(
                        uuid=entity.uuid,
                        name=entity.name,
                        description=entity.description,
                        sphere_of_influence=entity.sphere_of_influence,
                        members=entity.members,
                    )
                    for entity in resolved_entities
                }
            elif entity_type == "locations":
                resolved_entities = await b.ResolveLocationCluster(entities=entities)
                # Convert ResolvedLocation back to Location
                new_registry = {
                    entity.uuid: Location(
                        uuid=entity.uuid,
                        name=entity.name,
                        description=entity.description,
                        type=entity.type,
                    )
                    for entity in resolved_entities
                }
            elif entity_type == "objects":
                resolved_entities = await b.ResolveObjectCluster(entities=entities)
                # Convert ResolvedObject back to Object
                new_registry = {
                    entity.uuid: Object(
                        uuid=entity.uuid,
                        name=entity.name,
                        description=entity.description,
                        purpose=entity.purpose,
                        significance=entity.significance,
                        original_owner=entity.original_owner,
                    )
                    for entity in resolved_entities
                }
            else:
                raise ValueError(f"Unknown entity type: {entity_type}")

            # Replace the existing entity list with the resolved and converted entities
            setattr(self, entity_type, new_registry)
            logging.info(f"Reconciliation of {entity_type} complete. {len(resolved_entities)} entities remain.")