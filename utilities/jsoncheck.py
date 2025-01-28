from collections import defaultdict
from typing import Dict, Set, List
import json
from pprint import pformat

class RelationshipAnalyzer:
    def __init__(self, data: dict):
        self.data = data
        self.registry = data.get('entity_registry', {})
        self.episodes = data.get('episodes', [])
        self.relationships = defaultdict(lambda: defaultdict(set))
        self.issues = defaultdict(list)
        
    def analyze_all_relationships(self):
        """Analyze all entity relationships and generate a detailed report"""
        # Extract relationships from events
        self._extract_event_relationships()
        # Extract ownership relationships
        self._extract_ownership_relationships()
        # Extract organizational relationships
        self._extract_org_relationships()
        # Validate reciprocal relationships
        self._validate_relationships()
        
        return self._generate_report()

    def _extract_event_relationships(self):
        """Extract relationships from event participations and involvements"""
        for episode in self.episodes:
            for scene in episode.get('scenes', []):
                extracted_data = scene.get('extracted_data', {})
                events = extracted_data.get('events', [])
                
                for event in events:
                    event_id = event.get('uuid', '')
                    # Agent participations
                    for agent in event.get('agent_participations', []):
                        self.relationships['agent_event'][agent].add(event_id)
                    
                    # Object involvements
                    for obj in event.get('object_involvements', []):
                        self.relationships['object_event'][obj].add(event_id)

    def _extract_ownership_relationships(self):
        """Extract ownership relationships from objects"""
        for obj_id, obj_data in self.registry.get('objects', {}).items():
            owner = obj_data.get('original_owner')
            if owner:
                self.relationships['owner_object'][owner].add(obj_id)

    def _extract_org_relationships(self):
        """Extract organizational relationships"""
        for org_id, org_data in self.registry.get('organizations', {}).items():
            for member in org_data.get('members', []):
                self.relationships['org_member'][org_id].add(member)
        
        for agent_id, agent_data in self.registry.get('agents', {}).items():
            if agent_data.get('affiliated_org'):
                self.relationships['agent_org'][agent_id].add(agent_data['affiliated_org'])

    def _validate_relationships(self):
        """Validate reciprocal relationships"""
        # Check agent-org reciprocation
        for agent_id, orgs in self.relationships['agent_org'].items():
            for org_id in orgs:
                if org_id in self.registry.get('organizations', {}):
                    if agent_id not in self.relationships['org_member'][org_id]:
                        self.issues['missing_reciprocal'].append(
                            f"Agent {agent_id} is affiliated with {org_id} but not listed as member"
                        )

    def _generate_report(self) -> str:
        """Generate a detailed relationship report"""
        report = ["=== Enhanced Data Integrity Analysis Report ===\n"]
        
        # Entity counts
        report.append("1. Entity Counts:")
        for entity_type, entities in self.registry.items():
            report.append(f"   - {entity_type}: {len(entities)}")
        
        # List all agents and their relationships
        report.append("\n2. Agent Relationships:")
        for agent_id, agent_data in self.registry.get('agents', {}).items():
            report.append(f"\n   {agent_data.get('name', agent_id)}:")
            report.append(f"   - Affiliated Org: {agent_data.get('affiliated_org', 'None')}")
            report.append(f"   - Event Participations: {len(self.relationships['agent_event'][agent_id])}")
            report.append(f"   - Owns Objects: {', '.join(self.relationships['owner_object'][agent_id]) or 'None'}")
        
        # List all objects and their relationships
        report.append("\n3. Object Relationships:")
        for obj_id, obj_data in self.registry.get('objects', {}).items():
            report.append(f"\n   {obj_data.get('name', obj_id)}:")
            report.append(f"   - Original Owner: {obj_data.get('original_owner', 'None')}")
            report.append(f"   - Event Involvements: {len(self.relationships['object_event'][obj_id])}")
        
        # List all organizations and their relationships
        report.append("\n4. Organization Relationships:")
        for org_id, org_data in self.registry.get('organizations', {}).items():
            report.append(f"\n   {org_data.get('name', org_id)}:")
            report.append(f"   - Members: {', '.join(org_data.get('members', []))}")
            affiliated_agents = [
                agent_id for agent_id, orgs in self.relationships['agent_org'].items()
                if org_id in orgs
            ]
            report.append(f"   - Affiliated Agents: {', '.join(affiliated_agents) or 'None'}")
        
        # List locations
        report.append("\n5. Locations:")
        for loc_id, loc_data in self.registry.get('locations', {}).items():
            report.append(f"\n   {loc_data.get('name', loc_id)}:")
            report.append(f"   - Type: {loc_data.get('type', 'Unknown')}")
        
        # Report any issues
        if self.issues:
            report.append("\n6. Relationship Issues:")
            for issue_type, issues in self.issues.items():
                report.append(f"\n   {issue_type.replace('_', ' ').title()}:")
                for issue in issues:
                    report.append(f"   - {issue}")
        else:
            report.append("\n6. Issues: None found")
        
        return "\n".join(report)

def analyze_json_file(json_data: dict) -> str:
    """Analyze a JSON file and return a detailed relationship report"""
    analyzer = RelationshipAnalyzer(json_data)
    return analyzer.analyze_all_relationships()

# Example usage:
if __name__ == "__main__":
    with open('/home/user/langchain/output/pre_processed/quantum_archive_extracted.json', 'r') as f:
        data = json.load(f)
    report = analyze_json_file(data)
    print(report)