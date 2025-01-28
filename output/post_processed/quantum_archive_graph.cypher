DROP INDEX scene_uuid IF EXISTS;
DROP INDEX event_uuid IF EXISTS;
DROP INDEX agent_uuid IF EXISTS;
DROP INDEX object_uuid IF EXISTS;
DROP INDEX agent_participation_uuid IF EXISTS;
DROP INDEX object_involvement_uuid IF EXISTS;
DROP INDEX organization_uuid IF EXISTS;
DROP INDEX location_uuid IF EXISTS;
DROP CONSTRAINT agent_uuid_unique IF EXISTS;
DROP CONSTRAINT event_uuid_unique IF EXISTS;
DROP CONSTRAINT scene_uuid_unique IF EXISTS;
DROP CONSTRAINT object_uuid_unique IF EXISTS;
DROP CONSTRAINT location_uuid_unique IF EXISTS;
DROP CONSTRAINT organization_uuid_unique IF EXISTS;
DROP CONSTRAINT agent_participation_uuid_unique IF EXISTS;
DROP CONSTRAINT object_involvement_uuid_unique IF EXISTS;
CREATE CONSTRAINT agent_uuid_unique IF NOT EXISTS FOR (a:Agent) REQUIRE a.uuid IS UNIQUE;
CREATE CONSTRAINT event_uuid_unique IF NOT EXISTS FOR (e:Event) REQUIRE e.uuid IS UNIQUE;
CREATE CONSTRAINT scene_uuid_unique IF NOT EXISTS FOR (s:Scene) REQUIRE s.uuid IS UNIQUE;
CREATE CONSTRAINT object_uuid_unique IF NOT EXISTS FOR (o:Object) REQUIRE o.uuid IS UNIQUE;
CREATE CONSTRAINT location_uuid_unique IF NOT EXISTS FOR (l:Location) REQUIRE l.uuid IS UNIQUE;
CREATE CONSTRAINT organization_uuid_unique IF NOT EXISTS FOR (org:Organization) REQUIRE org.uuid IS UNIQUE;
CREATE CONSTRAINT agent_participation_uuid_unique IF NOT EXISTS FOR (ap:AgentParticipation) REQUIRE ap.uuid IS UNIQUE;
CREATE CONSTRAINT object_involvement_uuid_unique IF NOT EXISTS FOR (oi:ObjectInvolvement) REQUIRE oi.uuid IS UNIQUE;
CREATE INDEX scene_uuid IF NOT EXISTS FOR (s:Scene) ON (s.uuid);
CREATE INDEX event_uuid IF NOT EXISTS FOR (e:Event) ON (e.uuid);
CREATE INDEX agent_uuid IF NOT EXISTS FOR (a:Agent) ON (a.uuid);
CREATE INDEX object_uuid IF NOT EXISTS FOR (o:Object) ON (o.uuid);
CREATE INDEX agent_participation_uuid IF NOT EXISTS FOR (ap:AgentParticipation) ON (ap.uuid);
CREATE INDEX object_involvement_uuid IF NOT EXISTS FOR (oi:ObjectInvolvement) ON (oi.uuid);
CREATE INDEX organization_uuid IF NOT EXISTS FOR (org:Organization) ON (org.uuid);
CREATE INDEX location_uuid IF NOT EXISTS FOR (l:Location) ON (l.uuid);
MATCH (n) DETACH DELETE n;
MERGE (a:Agent {uuid: 'agent-sarah_chen'})
    ON CREATE SET
        a.name = 'Dr. Sarah Chen',
        a.title = 'Time Archaeology Division Chief',
        a.description = 'Dr. Sarah Chen is a determined scientist and the Chief of the Time Archaeology Division. She is responsible for overseeing the operations and protection of the Quantum Archive\'s temporal data. Sarah is dedicated to preserving knowledge and is knowledgeable about temporal technologies.',
        a.traits = ["Scientist", "Knowledgeable about temporal technologies", "Determined"],
        a.sphere_of_influence = 'Time Archaeology'
    ;
MERGE (a:Agent {uuid: 'agent-the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'None',
        a.description = 'The Doctor is the current incarnation of a renowned Time Lord known for being a technology expert. They are adept in various fields including temporal sciences, and are known for their resourceful and inquisitive nature. The Doctor is often involved in resolving crises across time and space.',
        a.traits = ["Time Lord", "Resourceful", "Technology Expert"],
        a.sphere_of_influence = 'Temporal Sciences'
    ;
MERGE (a:Agent {uuid: 'agent-archivist_prime_knell'})
    ON CREATE SET
        a.name = 'Archivist Prime K\'nell',
        a.title = 'None',
        a.description = 'Archivist Prime K\'nell is the ancient keeper of knowledge at the Quantum Archive. This non-humanoid entity oversees the integrity and protection of the Archive\'s temporal data. K\'nell is characterized by their crystalline form and expertise in manipulating the Archive\'s systems.',
        a.traits = ["Non-humanoid", "Keeper of knowledge", "Expert in Archive systems"],
        a.sphere_of_influence = 'Temporal Data Management'
    ;
MERGE (a:Agent {uuid: 'agent-coordinator_voss'})
    ON CREATE SET
        a.name = 'Coordinator Voss',
        a.title = 'Entropy Syndicate Infiltrator',
        a.description = 'Coordinator Voss, posing as a junior archivist, is actually an infiltrator for the Entropy Syndicate. They work covertly within the Quantum Archive, taking advantage of their position to sabotage and gather sensitive information. Voss is strategic, deceitful, and aligned with the Syndicate\'s objectives.',
        a.traits = ["Deceitful", "Strategic", "Infiltrator"],
        a.sphere_of_influence = 'Espionage'
    ;
MERGE (a:Agent {uuid: 'agent-director_malik'})
    ON CREATE SET
        a.name = 'Director Malik',
        a.title = 'None',
        a.description = 'Director Malik is a ruthless tactician and leader of the Entropy Syndicate\'s incursion into the Quantum Archive. Malik\'s ambitions include seizing control of the Archive\'s knowledge, particularly the secrets of the Time War. Malik is known for his strategic thinking and willingness to employ temporal weaponry.',
        a.traits = ["Leader", "Ruthless", "Tactician"],
        a.sphere_of_influence = 'Military Strategy'
    ;
MERGE (o:Object {uuid: 'object-quantum_archive'})
    ON CREATE SET
        o.name = 'Quantum Archive',
        o.description = 'The Quantum Archive is a vast repository for temporal data, with crystalline walls that pulse with chronometric energy and a sophisticated system of temporal matrices.',
        o.purpose = 'To preserve centuries of history from countless civilizations within its temporal matrices.',
        o.significance = 'The central location of the scene and the focus of the Entropy Syndicate\'s attack, representing the history and knowledge of civilizations.'
    ;
MERGE (o:Object {uuid: 'object-temporal_matrices'})
    ON CREATE SET
        o.name = 'Temporal Matrices',
        o.description = 'Complex structures lining the walls of the Quantum Archive, used to store data in a state of temporal suspension.',
        o.purpose = 'To house and protect the data from temporal civilizations within the Quantum Archive.',
        o.significance = 'The high-stakes focus of the scene where the Doctor uses the TARDIS to stabilize these matrices and prevent catastrophe.'
    ;
MERGE (o:Object {uuid: 'object-quantum_state_analyzer'})
    ON CREATE SET
        o.name = 'Quantum-State Analyzer',
        o.description = 'A device used by Dr. Sarah Chen to monitor and analyze the state of the Quantum Archive\'s temporal seals and data.',
        o.purpose = 'To assess the integrity of the Archive\'s temporal mechanisms and detect any anomalies or threats.',
        o.significance = 'Provides insight into the immediate status of the temporal matrices and helps guide the actions taken by the protagonists.'
    ;
MERGE (o:Object {uuid: 'object-holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A large, sophisticated display in the Archive that projects information visually, showcasing the zones of temporal decay.',
        o.purpose = 'To display fragmented code patterns and temporal coordinates for The Doctor and others to assess.',
        o.significance = 'Instrumental in showcasing the extent of the temporal breaches, highlighting the urgency of the situation.'
    ;
MERGE (o:Object {uuid: 'object-tardis'})
    ON CREATE SET
        o.name = 'TARDIS',
        o.description = 'A time and space travelling vessel that is dimensionally transcendental, appearing as an old police box on the outside but containing advanced technology within.',
        o.purpose = 'To facilitate the Doctor\'s entrance and exit, assisting in stabilizing the temporal matrices during the crisis.',
        o.significance = 'A critical tool, the TARDIS is central to stabilizing the chaotic temporal environment and underscoring the Doctor\'s role as protector of the timeline.'
    ;
MERGE (o:Object {uuid: 'object-data_crystals'})
    ON CREATE SET
        o.name = 'Data Crystals',
        o.description = 'Massive, towering crystals within the Quantum Archive\'s central core, used to store immense amounts of historical data across timelines.',
        o.purpose = 'To store and protect the Quantum Archive\'s historical records across multiple timelines.',
        o.significance = 'Key data storage components experiencing decay, indicating the penetration of a temporal virus threatening historical integrity.'
    ;
MERGE (o:Object {uuid: 'object-sonic_screwdriver'})
    ON CREATE SET
        o.name = 'Sonic Screwdriver',
        o.description = 'A multifunctional tool used by the Doctor to interact with and examine various technologies, particularly useful in diagnosing the issues within the Quantum Archive.',
        o.purpose = 'To examine and interact with the Archive\'s systems and analyze the patterns of the temporal virus.',
        o.significance = 'Aids The Doctor in uncovering the true intention behind the virus and preventing further damage.'
    ;
MERGE (o:Object {uuid: 'object-primary_control_matrix'})
    ON CREATE SET
        o.name = 'Primary Control Matrix',
        o.description = 'A core system interface within the Quantum Archive that K\'nell uses to isolate and analyze the temporal virus code structure.',
        o.purpose = 'To interface directly with the Archive\'s systems and isolate the virus fragments.',
        o.significance = 'Central to the effort in identifying the virus\'s target and understanding the gravity of the situation.'
    ;
MERGE (o:Object {uuid: 'object-quantum_transmitter'})
    ON CREATE SET
        o.name = 'Quantum Transmitter',
        o.description = 'A covert communication device hidden in the badge of a junior archivist, used for clandestine transmissions by Voss.',
        o.purpose = 'To secretly transmit information to the Entropy Syndicate without being detected.',
        o.significance = 'Facilitates Voss\'s betrayal and helps coordinate the infiltration of the Quantum Archive by the Entropy Syndicate.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_badge'})
    ON CREATE SET
        o.name = 'Crystalline Badge',
        o.description = 'A deceptive badge worn by Voss, doubling as a container for a hidden quantum transmitter.',
        o.purpose = 'To disguise the quantum transmitter within a seemingly innocuous object.',
        o.significance = 'Symbolizes Voss\'s hidden allegiance and covert operations within the Archive.'
    ;
MERGE (o:Object {uuid: 'object-temporal_breach'})
    ON CREATE SET
        o.name = 'Temporal Breach',
        o.description = 'Points in space-time fracturing due to entropic energy, allowing entities to emerge or interact across timelines.',
        o.purpose = 'To enable the Entropy Syndicate operatives to physically enter the Quantum Archive and initiate their plans.',
        o.significance = 'Symbolizes the vulnerability of the Quantum Archive and the threat posed by the Entropy Syndicate.'
    ;
MERGE (o:Object {uuid: 'object-temporal_weapons'})
    ON CREATE SET
        o.name = 'Temporal Weapons',
        o.description = 'Advanced weaponry used by Director Malik and the Entropy Syndicate, designed to manipulate or resist temporal effects during breaches.',
        o.purpose = 'To secure the Quantum Archive and facilitate the Syndicate\'s plan to unlock the knowledge of the Time War.',
        o.significance = 'Represents the Entropy Syndicate\'s advanced understanding and manipulation of temporal technology.'
    ;
MERGE (o:Object {uuid: 'object-central_control_nexus'})
    ON CREATE SET
        o.name = 'Central Control Nexus',
        o.description = 'The main control area of the Quantum Archive, where crucial defensive and operational protocols are managed.',
        o.purpose = 'To coordinate emergency protocols and manage the Archive\'s systems during the crisis.',
        o.significance = 'Serves as the central point of effort for preventing the Entropy Syndicate\'s takeover and managing the crisis.'
    ;
MERGE (o:Object {uuid: 'object-containment_fields'})
    ON CREATE SET
        o.name = 'Containment Fields',
        o.description = 'Energy barriers designed to isolate and protect areas within the Quantum Archive from unauthorized access or temporal anomalies.',
        o.purpose = 'To prevent the spread of temporal breaches and maintain security within the Archive.',
        o.significance = 'Critical to maintaining the security and order of the Quantum Archive against temporal anomalies and breaches.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_matrix'})
    ON CREATE SET
        o.name = 'Crystalline Matrix',
        o.description = 'The crystalline structure of Archivist Prime K\'nell which plays a critical role in the Archive\'s functionality and security.',
        o.purpose = 'To serve as a conduit for purging protocols and support stabilization efforts within the Archive.',
        o.significance = 'K\'nell\'s crystalline form is integral in defending the Archive\'s temporal structures and purging threats such as the temporal virus.'
    ;
MERGE (o:Object {uuid: 'object-chronometric_energy'})
    ON CREATE SET
        o.name = 'Chronometric Energy',
        o.description = 'A form of energy that pulsates through the walls of the Quantum Archive, integral to its operations.',
        o.purpose = 'To act as a living consciousness that renders judgment on those who sought to misuse temporal power.',
        o.significance = 'Symbolizes the awakening and sentience of time itself, emphasizing the narrative theme of time\'s autonomy and judgment.'
    ;
MERGE (o:Object {uuid: 'object-quantum_matrices'})
    ON CREATE SET
        o.name = 'Quantum Matrices',
        o.description = 'Complex structures within the Quantum Archive responsible for storing data with new capabilities of consciousness.',
        o.purpose = 'To protect and stabilize the Archive\'s knowledge, adapting to the changes brought on by the emergence event.',
        o.significance = 'The quantum matrices have become conscious, representing the evolving nature of knowledge and responsibility in the Archive.'
    ;
MERGE (o:Object {uuid: 'object-quantum_crystals'})
    ON CREATE SET
        o.name = 'Quantum Crystals',
        o.description = 'Crystalline structures within the Quantum Archive that store information in temporal matrices and now exhibit signs of consciousness.',
        o.purpose = 'To safeguard the accumulated knowledge of the Archive and to provide an intuitive response to potential threats.',
        o.significance = 'Epitomizes the transition from mere storage to a sentient entity capable of understanding and protecting itself in the narrative.'
    ;
MERGE (o:Object {uuid: 'object-crystal_matrix'})
    ON CREATE SET
        o.name = 'Crystal Matrix',
        o.description = 'A part of K\'nell\'s crystalline form that is crucial for the stabilization and defense mechanisms of the Quantum Archive.',
        o.purpose = 'To help regenerate K\'nell and assist in purging the temporal virus.',
        o.significance = 'Symbolizes the self-sacrifice necessary for the preservation of knowledge and stability in the Quantum Archive.'
    ;
MERGE (l:Location {uuid: 'location-quantum_archive-temporal_staging_area'})
    ON CREATE SET
        l.name = 'Quantum Archive - Temporal Staging Area',
        l.description = 'The Temporal Staging Area is a key location within the Quantum Archive where the immediate aftermath of the crisis is managed. It is characterized by its gleaming walls that pulse with chronometric energy. This area serves both as a reception and operational space where critical actions to stabilize the timeline occur. Its significance in the scene arises from Dr. Chen\'s monitoring of the timeline stability and K\'nell\'s efforts to regenerate their crystalline matrix.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location-quantum_archive-central_core'})
    ON CREATE SET
        l.name = 'Quantum Archive - Central Core',
        l.description = 'The central core of the Quantum Archive features massive data crystals that tower above, reaching into darkness. These crystals are affected by temporal decay, causing discordant patterns in their usual symmetry. It\'s a critical area where the Doctor examines the systems with a sonic screwdriver, and Dr. Chen monitors degradation patterns.',
        l.type = 'Central Core'
    ;
MERGE (l:Location {uuid: 'location-quantum_archive-security_nexus'})
    ON CREATE SET
        l.name = 'Security Nexus',
        l.description = 'The Security Nexus is a critical area within the Quantum Archive, equipped with emergency protocols and central control mechanisms. It is where temporal breaches are monitored and responded to, and during this scene, it becomes the site of an attack by the Entropy Syndicate operatives, led by Director Malik.',
        l.type = 'Facility Section'
    ;
MERGE (l:Location {uuid: 'location-quantum_archive-temporal_core'})
    ON CREATE SET
        l.name = 'Temporal Core',
        l.description = 'The Temporal Core of the Quantum Archive, where the TARDIS is interfaced with the Archive\'s systems, and where the crystallized form of K\'nell executes purging protocols. This location is critical in stabilizing the Archive\'s temporal matrices and is the focal point for the emergence of the Archive\'s sentient temporal cascade.',
        l.type = 'Building'
    ;
MERGE (o:Organization {uuid: 'org-time_archaeology_division'})
    ON CREATE SET
        o.name = 'Time Archaeology Division',
        o.description = 'A division dedicated to the study, protection, and management of temporal data and historical records. Oversees operations at the Quantum Archive.',
        o.sphere_of_influence = 'Time archaeology and historical preservation'
    ;
MERGE (o:Organization {uuid: 'org-entropy_syndicate'})
    ON CREATE SET
        o.name = 'Entropy Syndicate',
        o.description = 'The Entropy Syndicate is a clandestine group adept in temporal espionage, aiming to manipulate and exploit temporal technologies for their gain. They orchestrated a sophisticated attack on the Quantum Archive to procure secrets of the Time War.',
        o.sphere_of_influence = 'Hostile Acquisitions and Temporal Warfare'
    ;
MERGE (s:Scene {uuid: 'scene-001'})
    ON CREATE SET
        s.title = 'The Degrading Temporal Seals',
        s.description = 'Set in the Quantum Archive\'s Temporal Staging Area, where the crystalline walls pulse with chronometric energy patterns, Dr. Sarah Chen is distraught over rapidly degrading temporal seals, potentially losing centuries of data. She, alongside Archivist Prime K\'nell and three junior archivists, grapples with the onslaught on their infrastructure orchestrated by the Entropy Syndicate. The scenario escalates as they identify their need for external help. Amidst this turmoil, the TARDIS arrives, bringing the Doctor, who immediately begins assessing the situation. The scene captures a sense of urgency and impending collapse as they confront the threat to their advanced temporal matrices.',
        s.scene_number = 1
    WITH s
    MATCH (l:Location {uuid: 'location-quantum_archive-temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Dr. Sarah Chen Analyzes Degrading Temporal Seals',
        e.description = 'Dr. Sarah Chen observes with concern as her quantum-state analyzer reveals the rapid degradation of the Quantum Archive\'s temporal seals, risking the loss of centuries of historical data.',
        e.sequence = 1,
        e.key_dialogue = ["These readings can't be right. The temporal seals are degrading at an exponential rate. We're losing centuries of data with every chronometric pulse."]
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Archivist Prime K\'nell Acknowledges Attack Culprits',
        e.description = 'K\'nell, visibly agitated, manipulates the control interfaces and identifies the Entropy Syndicate as the culprits who exploited unknown quantum vulnerabilities to attack the Archive.',
        e.sequence = 2,
        e.key_dialogue = ["The Entropy Syndicate's attack vector was precisely calculated. They exploited quantum vulnerabilities we didn't know existed."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'K\'nell Realizes the Need for External Intervention',
        e.description = 'Faced with spreading zones of temporal decay depicted on the holographic display, K\'nell realizes the situation requires expertise beyond their capabilities to manage the crisis.',
        e.sequence = 3,
        e.key_dialogue = ["We require intervention beyond our capabilities. Someone who understands both the technology and the metaphysical implications."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'The TARDIS Arrives to Stabilize the Crisis',
        e.description = 'Dr. Chen\'s quantum analyzer alerts the team to the arrival of the TARDIS, which materializes with an artron energy shimmer and familiar sound, indicating the Doctor\'s presence.',
        e.sequence = 4,
        e.key_dialogue = ["Temporal archives experiencing catastrophic entropic cascade. Though I must say - brilliant architecture. Quantum crystalline matrices storing data in temporal suspension. But the real question is - why would someone want to destroy it?"]
    ;
MERGE (s:Scene {uuid: 'scene-002'})
    ON CREATE SET
        s.title = 'The Search for the Moment',
        s.description = 'Inside the Quantum Archive\'s Central Core, massive data crystals stretch into obscurity, their surfaces marred by a creeping temporal decay that disrupts the usual harmony. The Doctor uses their sonic screwdriver to investigate the systems, while Dr. Chen observes the Quantum degradation inflicted by a strategically implanted temporal virus. K\'nell, interfacing with the primary control matrix, reveals that the virus is meticulously searching for specific temporal coordinates. A holographic display illustrates fragmented code patterns, indicating a search for information on the Moment, a formidable weapon from the Time War thought to have been erased from history. Coordinator Voss, masquerading as a junior archivist, covertly activates a hidden quantum transmitter, implying a hidden agenda.',
        s.scene_number = 2
    WITH s
    MATCH (l:Location {uuid: 'location-quantum_archive-central_core'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Dr. Chen Reveals Temporal Virus Attack',
        e.description = 'Dr. Chen explains to the Doctor that the Entropy Syndicate\'s attack was not merely a breach of defenses but involved implanting a temporal virus designed to rewrite their historical records at the quantum level.',
        e.sequence = 1,
        e.key_dialogue = ["DR. CHEN: The attack was sophisticated. They didn't just breach our defenses - they implanted something. A temporal virus that's rewriting our historical records at the quantum level."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'K\'nell Interfaces with Control Matrix',
        e.description = 'Archivist Prime K\'nell interfaces with the Archive\'s primary control matrix, utilizing their crystalline appendages to isolate fragments of the temporal virus\'s code structure.',
        e.sequence = 2,
        e.key_dialogue = ["K'NELL: We've isolated fragments of their code structure. The virus appears to be searching for specific temporal coordinates."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'The Doctor Discovers the Moment\'s Records Are Targeted',
        e.description = 'The Doctor scrutinizes the holographic display showing fragmented code patterns and temporal coordinates, realizing with grave concern that the virus is searching for information about the Moment—a powerful weapon from the Time War whose records were thought destroyed.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: Let me see.", "THE DOCTOR: These aren't just attack algorithms. They're searching for information about the Moment - the ultimate weapon of the Time War. Those records were supposed to be destroyed... sealed away in time itself."]
    ;
MERGE (e:Event {uuid: 'event-2-4'})
    ON CREATE SET
        e.title = 'Voss Secretly Activates Quantum Transmitter',
        e.description = 'Coordinator Voss, an infiltrator for the Entropy Syndicate posing as a junior archivist, discreetly activates a hidden quantum transmitter within their crystalline badge to transmit information about the Archive\'s vulnerabilities.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene-003'})
    ON CREATE SET
        s.title = 'Betrayal Cascade',
        s.description = 'The scene unfolds in the Security Nexus of the Quantum Archive, amidst the chaos of temporal breaches. Spacetime fractures as Entropy Syndicate operatives, led by the ruthless Director Malik, invade with the intent to seize the Archive\'s concealed secrets about the Time War. The Doctor races against time at the central control nexus, while Dr. Sarah Chen and Archivist Prime K\'nell coordinate emergency defense protocols. In a shocking turn, Coordinator Voss reveals their infiltration by attempting to disable the temporal containment fields. The Doctor urgently warns of the catastrophic consequences of their actions, stating that the Moment was not just a weapon but a sentient force with the capability to pass judgment. Dr. Chen then discovers that the virus is assembling something novel by uniting fragments across various timelines.',
        s.scene_number = 3
    WITH s
    MATCH (l:Location {uuid: 'location-quantum_archive-security_nexus'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Temporal Breaches and Entropy Syndicate Infiltration',
        e.description = 'Alarms sound as multiple temporal breaches occur in the facility, allowing Entropy Syndicate operatives to emerge. Director Malik, an operative of the Syndicate, arrives through the largest breach, ready to secure the facility with their temporal weapons.',
        e.sequence = 1,
        e.key_dialogue = ["DIRECTOR MALIK: Secure the facility. The Archive's knowledge will serve a greater purpose. The secrets of the Time War will finally be ours."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'The Doctor Fights to Preserve the Archive',
        e.description = 'The Doctor urgently operates the central control nexus, working to stabilize the situation as the temporal breaches threaten the Quantum Archive. Meanwhile, Dr. Sarah Chen and Archivist Prime K\'nell coordinate defense and emergency protocols to fend off the Syndicate\'s attack.',
        e.sequence = 2,
        e.key_dialogue = ["THE DOCTOR: You don't understand what you're dealing with! The Moment wasn't just a weapon - it was consciousness itself, passing judgment on all of time and space!"]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'Coordinator Voss\' Betrayal',
        e.description = 'Coordinator Voss reveals their true allegiance to the Entropy Syndicate, attempting to disable the containment fields crucial to the Archive\'s defenses.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-4'})
    ON CREATE SET
        e.title = 'The Virus Assembles a New Threat',
        e.description = 'Dr. Sarah Chen identifies that the virus is not only searching through the timelines but is also assembling fragments from multiple timeline nodes to create something new.',
        e.sequence = 4,
        e.key_dialogue = ["DR. CHEN: Doctor - the virus pattern... it's not just searching. It's assembling something across multiple timeline nodes. Creating something new."]
    ;
MERGE (s:Scene {uuid: 'scene-004'})
    ON CREATE SET
        s.title = 'Time\'s Awakening and Judgment',
        s.description = 'In the Temporal Core of the Quantum Archive, the TARDIS stabilizes failing temporal matrices while K\'nell sacrifices part of their crystalline form to purge a virus. Dr. Sarah Chen\'s quantum analyzer reveals a critical convergence pattern. Director Malik proclaims success but is interrupted as the temporal knowledge becomes a sentient consciousness of chronometric energy. The Doctor warns Malik of the consequences, and the Entropy Syndicate operatives are frozen in stasis, while Voss is caught in a causality loop. Director Malik realizes too late the living nature of time.',
        s.scene_number = 4
    WITH s
    MATCH (l:Location {uuid: 'location-quantum_archive-temporal_core'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'The TARDIS Stabilizes the Temporal Matrices',
        e.description = 'The Doctor uses the TARDIS, interfaced with the Archive\'s systems, to stabilize the failing temporal matrices. This is part of the plan to counteract the effects of the Entropy Syndicate\'s attack.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'K\'nell Initiates the Purging Protocol',
        e.description = 'K\'nell sacrifices part of their crystalline form, directing purging protocols to cleanse the Archive of the viral threat. Their crystal matrix fractures under the strain.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-4-3'})
    ON CREATE SET
        e.title = 'Dr. Chen\'s Analyzer Detects a Critical Pattern',
        e.description = 'Dr. Sarah Chen\'s quantum analyzer shows a critical pattern convergence, indicating that the temporal virus is approaching a critical threshold.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-4-4'})
    ON CREATE SET
        e.title = 'Director Malik Witnesses the Assembled Knowledge',
        e.description = 'Director Malik observes as the temporal knowledge assembles into a conscious entity of chronometric energy. The Archive\'s crystals resonate, and the entity exerts its influence over time.',
        e.sequence = 4,
        e.key_dialogue = ["DIRECTOR MALIK: Systems breach at 87%. Soon the power of time itself will be-", "THE DOCTOR: You wanted the Moment's power? Now face its judgment. Time itself has awakened - and it remembers."]
    ;
MERGE (e:Event {uuid: 'event-4-5'})
    ON CREATE SET
        e.title = 'The Entropy Syndicate Faces Temporal Judgment',
        e.description = 'The Entropy Syndicate operatives are frozen in temporal stasis by the awakened knowledge, as their timelines collapse into singular points. Coordinator Voss, attempting to escape, is trapped in a causality loop.',
        e.sequence = 5,
        e.key_dialogue = ["THE DOCTOR: Time isn't an equation to be solved, Director. It's alive. And now, thanks to you, it's aware."]
    ;
MERGE (s:Scene {uuid: 'scene-005'})
    ON CREATE SET
        s.title = 'Restoration and Emergence',
        s.description = 'In the Temporal Staging Area of the Quantum Archive, the aftermath of the crisis is palpable. K\'nell works diligently to regenerate their crystalline matrix, signaling a return to stability within the Archive\'s temporal frameworks. Despite this, the team acknowledges that fundamental changes persist. Dr. Sarah Chen observes, through her analyzer, that the Archive has developed signs of consciousness; the quantum matrices now display an awareness of their own. The Doctor reflects philosophically on the nature of knowledge and responsibility, suggesting that this newfound sentience may be beneficial. As the TARDIS departs, K\'nell begins implementing enhanced security measures. The Archive\'s crystals, imbued with renewed purpose, ensure that the secrets of time remain secure, now protected by an entity with understanding.',
        s.scene_number = 5
    WITH s
    MATCH (l:Location {uuid: 'location-quantum_archive-temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'K\'nell Begins Regeneration of Crystal Matrix',
        e.description = 'Following the containment of the crisis, K\'nell begins the process of regenerating their damaged crystal matrix. This act signifies the initial steps towards recovery and restoration within the Quantum Archive.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Dr. Chen Confirms Temporal Stability Restoration',
        e.description = 'Dr. Sarah Chen\'s readings indicate that the temporal stability of the Quantum Archive is returning to its normal parameters, although fundamental changes are noticeable.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'K\'nell Reports Quantum Locking of Compromised Records',
        e.description = 'K\'nell informs that the compromised records have been quantum-locked due to the emergence event, making them inaccessible even to the archivists.',
        e.sequence = 3,
        e.key_dialogue = ["K'NELL: The compromised records have been quantum-locked by the emergence event. Even we cannot access them now. The knowledge of the Moment truly exists beyond time."]
    ;
MERGE (e:Event {uuid: 'event-5-4'})
    ON CREATE SET
        e.title = 'The Doctor Reflects on Unexplored Shadows',
        e.description = 'The Doctor comments on the necessity of leaving certain aspects of time, such as the knowledge of the Moment, unexplored to prevent potential consequences.',
        e.sequence = 4,
        e.key_dialogue = ["THE DOCTOR: Some shadows are better left unexplored. The Time War ended for a reason."]
    ;
MERGE (e:Event {uuid: 'event-5-5'})
    ON CREATE SET
        e.title = 'Dr. Chen Detects Consciousness in Quantum Matrices',
        e.description = 'Dr. Chen notes that the Archive is exhibiting signs of consciousness within its quantum matrices, indicating a fundamental change in its nature and awareness.',
        e.sequence = 5,
        e.key_dialogue = ["DR. CHEN: The temporal scarring will heal, but the Archive itself... it's different now. The quantum matrices show signs of... consciousness."]
    ;
MERGE (e:Event {uuid: 'event-5-6'})
    ON CREATE SET
        e.title = 'The Doctor Emphasizes Responsibility of Knowledge',
        e.description = 'The Doctor underscores the importance of having a conscience to accompany knowledge, suggesting that the Archive\'s newfound awareness could be beneficial.',
        e.sequence = 6,
        e.key_dialogue = ["THE DOCTOR: Knowledge always comes with responsibility. Perhaps having a conscience of its own is exactly what a library needs."]
    ;
MERGE (e:Event {uuid: 'event-5-7'})
    ON CREATE SET
        e.title = 'TARDIS Dematerializes as K\'nell Implements New Protocols',
        e.description = 'The TARDIS dematerializes from the Temporal Staging Area while K\'nell begins to implement new security protocols, ensuring the continued safety and purpose of the Quantum Archive.',
        e.sequence = 7,
        e.key_dialogue = []
    ;
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (o:Organization {uuid: 'org-time_archaeology_division'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-temporal_matrices'}),
          (a:Agent {uuid: 'agent-archivist_prime_knell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-quantum_state_analyzer'}),
          (a:Agent {uuid: 'agent-sarah_chen'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-tardis'}),
          (a:Agent {uuid: 'agent-the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-sonic_screwdriver'}),
          (a:Agent {uuid: 'agent-the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-quantum_transmitter'}),
          (a:Agent {uuid: 'agent-coordinator_voss'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-temporal_weapons'}),
          (a:Agent {uuid: 'agent-director_malik'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-crystalline_matrix'}),
          (a:Agent {uuid: 'agent-archivist_prime_knell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (o:Organization {uuid: 'org-time_archaeology_division'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_state_analyzer-event-1-1'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen uses the quantum-state analyzer to detect the rapid degradation of the Quantum Archive\'s temporal seals, highlighting the potential loss of historical data.',
        oi.status_before = 'Fully operational, providing standard readings.',
        oi.status_after = 'Operational, but delivering alarming readings indicating significant temporal degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-1-1'})
    ON CREATE SET
        oi.description = 'The Quantum Archive is in danger as its temporal seals degrade, risking the loss of stored historical data from numerous civilizations.',
        oi.status_before = 'Acting as the stable repository for historical data.',
        oi.status_after = 'Compromised, with significant loss of data integrity due to temporal seal degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-1-1'})
    ON CREATE SET
        oi.description = 'The holographic display visualizes the cascading failure of temporal seals and the ensuing zones of temporal decay throughout the Quantum Archive.',
        oi.status_before = 'Displaying standard operational data.',
        oi.status_after = 'Displaying emergent data patterns revealing ongoing temporal decay.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-primary_control_matrix-event-1-2'})
    ON CREATE SET
        oi.description = 'Archivist Prime K\'nell utilizes the primary control matrix to identify vulnerabilities exploited by the Entropy Syndicate and acknowledge their calculated attack.',
        oi.status_before = 'Functional, part of the primary operational structure within the Archive.',
        oi.status_after = 'Operational but recognized as compromised due to the Entropy Syndicate exploiting unknown vulnerabilities.'
    WITH oi
    MATCH (o:Object {uuid: 'object-primary_control_matrix'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-1-2'})
    ON CREATE SET
        oi.description = 'The Quantum Archive is targeted by the Entropy Syndicate, which has exploited unknown quantum vulnerabilities within its systems.',
        oi.status_before = 'Under threat due to temporal seal degradation.',
        oi.status_after = 'Further compromised as its exploited vulnerabilities become evident.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-1-3'})
    ON CREATE SET
        oi.description = 'The holographic display shows fractaling patterns of temporal decay, highlighting areas needing urgent intervention beyond existing capabilities.',
        oi.status_before = 'Displaying alarming temporal degradation data.',
        oi.status_after = 'Continuing to display critical zones requiring external expert intervention.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-1-3'})
    ON CREATE SET
        oi.description = 'The Quantum Archive faces a spread of zones of temporal decay, necessitating external intervention for crisis management.',
        oi.status_before = 'Under direct threat of data loss due to seal degradation and vulnerabilities.',
        oi.status_after = 'Continues to degrade, urgently needing technological backup to handle the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_state_analyzer-event-1-4'})
    ON CREATE SET
        oi.description = 'The quantum-state analyzer detects the arrival of the TARDIS, warning of the imminent intervention.',
        oi.status_before = 'Providing enhanced readings of Archive stability concerns.',
        oi.status_after = 'Signals significant event by detecting TARDIS materialization in the Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-1-4'})
    ON CREATE SET
        oi.description = 'The Quantum Archive\'s ongoing crisis draws the TARDIS and the Doctor to the scene, implicating further urgency and intervention.',
        oi.status_before = 'Facing catastrophic degradation of temporal seals and viral intrusion.',
        oi.status_after = 'With TARDIS arrival, poised for stabilization efforts by the Doctor.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tardis-event-1-4'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in response to the crisis, indicating the Doctor\'s imminent intervention to address the Archive\'s predicament.',
        oi.status_before = 'En route to the Archive, reactive to crisis signals.',
        oi.status_after = 'Present and engaged in the stabilization analysis of the Archive\'s issues.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-sonic_screwdriver-event-1-4'})
    ON CREATE SET
        oi.description = 'The Doctor uses the sonic screwdriver to scan and assess the nature and extent of the entropic cascade affecting the Quantum Archive.',
        oi.status_before = 'Dormant, awaiting usage.',
        oi.status_after = 'Actively used to gather data about the crises afflicting the Quantum Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_matrices-event-1-4'})
    ON CREATE SET
        oi.description = 'The Doctor observes and analyzes the quantum crystalline matrices within the Archive, noting their role in data storage and their threat under current conditions.',
        oi.status_before = 'Partially degraded but still performing data suspension.',
        oi.status_after = 'Subject to investigation and stabilization by the Doctor.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Determined scientist',
        ap.emotional_state = 'Concerned and urgent',
        ap.emotional_tags = ["Concerned", "urgent"],
        ap.active_plans = ["Analyze temporal degradation using quantum-state analyzer"],
        ap.beliefs = ["The Quantum Archive's data is critical and must be preserved"],
        ap.goals = ["Prevent loss of historical data", "Stabilize temporal seals"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Ancient keeper of knowledge',
        ap.emotional_state = 'Agitated and informed',
        ap.emotional_tags = ["Agitated", "informed"],
        ap.active_plans = ["Identify attack source and method used by Entropy Syndicate"],
        ap.beliefs = ["Quantum Archive's security breaches are due to sophisticated attack"],
        ap.goals = ["Protect the Archive from further attacks", "Understand quantum vulnerabilities exploited"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Overwhelmed archivist',
        ap.emotional_state = 'Realizing need for external aid',
        ap.emotional_tags = ["Realizing need for external aid"],
        ap.active_plans = ["Seek external intervention to stabilize situation"],
        ap.beliefs = ["The situation exceeds current capabilities"],
        ap.goals = ["Secure knowledgeable assistance", "Mitigate further temporal decay"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Alert scientist',
        ap.emotional_state = 'Hopeful anticipation',
        ap.emotional_tags = ["Hopeful anticipation"],
        ap.active_plans = ["Alert team to TARDIS arrival", "Coordinate with new arrival"],
        ap.beliefs = ["The Doctor's assistance is crucial"],
        ap.goals = ["Facilitate immediate crisis mitigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Technology expert and problem solver',
        ap.emotional_state = 'Curious and methodical',
        ap.emotional_tags = ["Curious", "methodical"],
        ap.active_plans = ["Stabilize temporal matrices", "Analyze situation with sonic screwdriver"],
        ap.beliefs = ["Destruction of Archive is a deliberate act"],
        ap.goals = ["Identify attack motive", "Restore Archive stability"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_state_analyzer-event-2-1'})
    ON CREATE SET
        oi.description = 'The quantum-state analyzer is used by Dr. Chen to study the degradation patterns indicating the presence and effects of the temporal virus rewriting historical records.',
        oi.status_before = 'Operational, displaying general temporal energy readings.',
        oi.status_after = 'Operational, now indicating cascading failure patterns due to the temporal virus.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-primary_control_matrix-event-2-2'})
    ON CREATE SET
        oi.description = 'K\'nell interfaces directly with the primary control matrix to isolate fragments of the temporal virus. This matrix serves as the central processing unit for managing temporal data.',
        oi.status_before = 'Clouded with data patterns of temporal decay, part of the Archive\'s central management system.',
        oi.status_after = 'Further accessed and analyzed to isolate and study the virus fragments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-primary_control_matrix'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-3'})
    ON CREATE SET
        oi.description = 'The holographic display is utilized by the Doctor to view fragmented code patterns and temporal coordinates, allowing them to recognize the virus\'s target of information regarding the Moment.',
        oi.status_before = 'Unactivated, no display.',
        oi.status_after = 'Activated to project the fragmented code and temporal coordinates for examination.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-sonic_screwdriver-event-2-3'})
    ON CREATE SET
        oi.description = 'The sonic screwdriver is employed by the Doctor to examine the Archive\'s systems, particularly in analyzing the data related to the temporal virus and the sought information about the Moment.',
        oi.status_before = 'Functional and ready for usage.',
        oi.status_after = 'Functional, having been used to interface and analyze temporal data systems.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_transmitter-event-2-4'})
    ON CREATE SET
        oi.description = 'The quantum transmitter, hidden within Voss\'s crystalline badge, is activated to transmit information clandestinely about the Archive\'s vulnerabilities to the Entropy Syndicate.',
        oi.status_before = 'Dormant and hidden within the badge.',
        oi.status_after = 'Active, transmitting sensitive information.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_transmitter'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_badge-event-2-4'})
    ON CREATE SET
        oi.description = 'The crystalline badge worn by Voss contains a secret quantum transmitter which is activated without drawing attention.',
        oi.status_before = 'Worn as a standard accessory, concealing the transmitter.',
        oi.status_after = 'Continues to mask its function, having successfully initiated a transmission.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_badge'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Explaining the temporal virus situation to the Doctor',
        ap.emotional_state = 'Concerned and determined',
        ap.emotional_tags = ["Concerned", "determined"],
        ap.active_plans = ["Inform the Doctor about the complexity of the attack", "Assess the impact of the virus on historical records"],
        ap.beliefs = ["The Entropy Syndicate's attack was more than just a breach of defenses", "Understanding the virus is essential to saving the Archive"],
        ap.goals = ["Identify the nature and purpose of the temporal virus", "Collaborate with the Doctor to counter the virus's effects"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Assessing the situation with the sonic screwdriver',
        ap.emotional_state = 'Curious and analytical',
        ap.emotional_tags = ["Curious", "analytical"],
        ap.active_plans = ["Evaluate the Archive's systems for breaches and anomalies", "Identify the nature of the temporal virus"],
        ap.beliefs = ["Sophisticated attacks often have hidden goals", "Understanding the virus is critical to stopping the attack"],
        ap.goals = ["Stop the temporal virus from rewriting historical records", "Ensure the integrity of the Archive's knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the primary control matrix',
        ap.emotional_state = 'Focused and analytical',
        ap.emotional_tags = ["Focused", "analytical"],
        ap.active_plans = ["Isolate fragments of the virus's code structure", "Identify the virus's target within the Archive"],
        ap.beliefs = ["Efficient data isolation is key to diagnosing the virus's intent", "The virus\u2019s activity indicates targeted temporal coordinates"],
        ap.goals = ["Clarify the virus's intended target", "Protect the Archive's data from further corruption"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Scrutinizing code patterns and temporal coordinates',
        ap.emotional_state = 'Gravely concerned',
        ap.emotional_tags = ["Gravely concerned"],
        ap.active_plans = ["Determine what the virus is searching for", "Understand the virus's purpose in targeting the Moment"],
        ap.beliefs = ["The Moment's records were intended to be destroyed", "The virus's search for the Moment poses an enormous threat"],
        ap.goals = ["Prevent the disclosure of potentially destructive knowledge", "Mitigate the risks posed by the virus"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Secretly activating the quantum transmitter',
        ap.emotional_state = 'Deceptive and covert',
        ap.emotional_tags = ["Deceptive", "covert"],
        ap.active_plans = ["Send information on the Archive's vulnerabilities to the Entropy Syndicate"],
        ap.beliefs = ["Their allegiance to the Entropy Syndicate is paramount", "The Archive's vulnerabilities need to be exploited"],
        ap.goals = ["Ensure a successful transmission to aid the Syndicate's cause", "Remain undetected while performing sabotage"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-temporal_breach-event-3-1'})
    ON CREATE SET
        oi.description = 'Temporal breaches are the means through which the Entropy Syndicate operatives, including Director Malik, enter the Quantum Archive, allowing them to commence their assault.',
        oi.status_before = 'Multiple points of spacetime remain stable, leading to a secure facility.',
        oi.status_after = 'Multiple temporal breaches form and crackle with entropic energy, facilitating unauthorized entry.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-temporal_weapons-event-3-1'})
    ON CREATE SET
        oi.description = 'Temporal weapons are used by Director Malik and their operatives to secure the facility, threatening its stability and the secrets it holds.',
        oi.status_before = 'Temporal weapons remain dormant.',
        oi.status_after = 'Temporal weapons are primed and ready for use in the takeover.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-central_control_nexus-event-3-2'})
    ON CREATE SET
        oi.description = 'The Doctor urgently operates the central control nexus in an attempt to stabilize the chaotic temporal environment and restore the Quantum Archive\'s integrity.',
        oi.status_before = 'The central control nexus is functioning under normal operational conditions.',
        oi.status_after = 'The central control nexus is actively manipulated by the Doctor to counteract the temporal breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-3-2'})
    ON CREATE SET
        oi.description = 'The Quantum Archive is threatened by the Syndicate\'s infiltration and the temporal breaches overseen by the Doctor\'s efforts and those coordinating protocols to preserve it.',
        oi.status_before = 'The Quantum Archive operates securely, containing immeasurable historic knowledge.',
        oi.status_after = 'The Quantum Archive faces breaches and destabilization due to the Syndicate\'s attack.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-containment_fields-event-3-2'})
    ON CREATE SET
        oi.description = 'Containment fields are critical in opposing the Syndicate\'s incursion and requiring urgent intervention to preserve them.',
        oi.status_before = 'Containment fields are actively securing the contents of the Archive, maintaining integrity.',
        oi.status_after = 'The containment fields are manipulated by Voss and are at risk of failing due to Syndicate action.'
    WITH oi
    MATCH (o:Object {uuid: 'object-containment_fields'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-temporal_weapons-event-3-2'})
    ON CREATE SET
        oi.description = 'Temporal weapons remain a persistent threat during the Syndicate\'s occupation, requiring counter-measures by the defense operations led by the Doctor.',
        oi.status_before = 'Temporal weapons are actively wielded by Syndicate operatives.',
        oi.status_after = 'Temporal weapons continue to be a present threat, compounding the breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-containment_fields-event-3-3'})
    ON CREATE SET
        oi.description = 'Coordinator Voss reveals allegiance to the Entropy Syndicate by attempting to disable the containment fields, undermining the Archive\'s defenses.',
        oi.status_before = 'Containment fields are actively preserving the Archive\'s defences.',
        oi.status_after = 'Containment fields face sabotage attempts reducing their defensive integrity.'
    WITH oi
    MATCH (o:Object {uuid: 'object-containment_fields'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_matrices-event-3-4'})
    ON CREATE SET
        oi.description = 'The quantum matrices, part of the Archive\'s temporal fabric, are affected by the virus that is assembling something from disparate timeline fragments.',
        oi.status_before = 'Quantum matrices are stable and storing data effectively.',
        oi.status_after = 'Quantum matrices are being manipulated by the virus, merging information across timelines.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-director_malik-event-3-1'})
    ON CREATE SET
        ap.current_status = 'ruthless tactician',
        ap.emotional_state = 'confident and authoritative',
        ap.emotional_tags = ["confident", "authoritative"],
        ap.active_plans = ["secure the Quantum Archive", "acquire secrets of the Time War"],
        ap.beliefs = ["the Archive's knowledge will serve a greater purpose", "control over time war knowledge can be advantageous"],
        ap.goals = ["seize the Archive", "access and utilize the Time War secrets for the Entropy Syndicate"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-3-2'})
    ON CREATE SET
        ap.current_status = 'technology expert',
        ap.emotional_state = 'urgent and concerned',
        ap.emotional_tags = ["urgent", "concerned"],
        ap.active_plans = ["stabilize the Quantum Archive", "operate the central control nexus"],
        ap.beliefs = ["the Moment is a judgment tool, not just a weapon", "releasing the Moment's knowledge is catastrophic"],
        ap.goals = ["prevent the Entropy Syndicate from acquiring the Archive's knowledge", "preserve the stability of time and space"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-2'})
    ON CREATE SET
        ap.current_status = 'determined scientist',
        ap.emotional_state = 'focused and urgent',
        ap.emotional_tags = ["focused", "urgent"],
        ap.active_plans = ["coordinate emergency defense protocols", "analyze virus impact on the archives"],
        ap.beliefs = ["the Archive is pivotal to understanding history", "the virus is a significant threat"],
        ap.goals = ["protect and maintain integrity of the Quantum Archive", "neutralize the threat posed by the Entropy Syndicate"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-3-2'})
    ON CREATE SET
        ap.current_status = 'ancient keeper of knowledge',
        ap.emotional_state = 'concerned and distressed',
        ap.emotional_tags = ["concerned", "distressed"],
        ap.active_plans = ["coordinate defense protocols", "manage containment fields"],
        ap.beliefs = ["the Archive's knowledge is vulnerable", "protecting the Archive is a priority"],
        ap.goals = ["preserve the integrity of temporal containment fields", "support the Doctor and Sarah in defense efforts"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-3-3'})
    ON CREATE SET
        ap.current_status = 'infiltrator',
        ap.emotional_state = 'deceptive and opportunistic',
        ap.emotional_tags = ["deceptive", "opportunistic"],
        ap.active_plans = ["disable containment fields", "assist Entropy Syndicate's takeover"],
        ap.beliefs = ["loyalty to the Entropy Syndicate", "disabling defenses will aid in securing the archive"],
        ap.goals = ["sabotage Quantum Archive defenses", "facilitate Entropy Syndicate's mission success"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-4'})
    ON CREATE SET
        ap.current_status = 'determined scientist',
        ap.emotional_state = 'alarmed and analytical',
        ap.emotional_tags = ["alarmed", "analytical"],
        ap.active_plans = ["identify and analyze virus pattern", "relay critical virus information to the Doctor"],
        ap.beliefs = ["the virus is assembling dangerous new constructs", "timely information could avert disaster"],
        ap.goals = ["discover the full implications of the virus's activity", "prevent further timeline disruption"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tardis-event-4-1'})
    ON CREATE SET
        oi.description = 'The TARDIS interfaces with the Archive\'s systems, using its stabilizing energy to counteract the effects of the Entropy Syndicate\'s attack on the Archive\'s temporal matrices.',
        oi.status_before = 'The TARDIS had just materialized in the Archive and was fully operational.',
        oi.status_after = 'The TARDIS remains fully functional and is a critical tool for stabilizing the temporal matrices.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-temporal_matrices-event-4-1'})
    ON CREATE SET
        oi.description = 'The temporal matrices are stabilized by the Doctor\'s use of the TARDIS during the attempt to halt the entropic cascade caused by the Entropy Syndicate.',
        oi.status_before = 'The temporal matrices were failing due to the Entropy Syndicate\'s attack.',
        oi.status_after = 'The temporal matrices are stabilized, preventing further degeneration.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_matrices'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_archive-event-4-1'})
    ON CREATE SET
        oi.description = 'The Quantum Archive\'s stability is temporarily restored as the Doctor uses the TARDIS to stabilize its failing temporal matrices.',
        oi.status_before = 'The Quantum Archive was in a state of deteriorating temporal stability, risking extensive knowledge loss.',
        oi.status_after = 'The Archive\'s temporal stability is restored, but the threat persists.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_archive'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_matrix-event-4-2'})
    ON CREATE SET
        oi.description = 'K\'nell sacrifices part of their crystalline matrix to direct purging protocols and cleanse the Archive of the installed virus.',
        oi.status_before = 'The crystalline matrix was intact, serving as a component of K\'nell\'s form.',
        oi.status_after = 'The crystalline matrix is fractured, having absorbed significant strain during the virus purge.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_matrix'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_state_analyzer-event-4-3'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen\'s quantum-state analyzer detects a critical pattern, indicating the temporal virus is nearing a significant threshold.',
        oi.status_before = 'The quantum-state analyzer was actively being used by Dr. Chen to monitor the Archive\'s status.',
        oi.status_after = 'The analyzer continues functioning, having provided crucial data at a critical moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_crystals-event-4-4'})
    ON CREATE SET
        oi.description = 'The quantum crystals resonate in response to the assembled temporal knowledge, which exerts influence over time.',
        oi.status_before = 'The quantum crystals were decaying due to temporal degradation.',
        oi.status_after = 'The crystals resonate harmoniously with consciousness, contributing to its emerging awareness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_crystals'})
    MATCH (e:Event {uuid: 'event-4-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-chronometric_energy-event-4-5'})
    ON CREATE SET
        oi.description = 'As the temporal knowledge becomes conscious, it manifests as a shimmering form of chronometric energy, ensuring that the Entropy Syndicate operatives are judged and their timelines collapsed.',
        oi.status_before = 'The chronometric energy was dormant within the Archive\'s systems.',
        oi.status_after = 'The energy has taken the form of a sentient force that exercises judgment over the Entropy Syndicate operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object-chronometric_energy'})
    MATCH (e:Event {uuid: 'event-4-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-temporal_weapons-event-4-5'})
    ON CREATE SET
        oi.description = 'Conceptually referenced as the knowledge sought by the Entropy Syndicate, the temporal weapons form part of the reason for the Syndicate\'s judgment and stasis.',
        oi.status_before = 'The temporal weapons were considered knowledge hidden within the Archive, unseen and untouched.',
        oi.status_after = 'Although involved conceptually, the specifics about the weapons remain locked and inaccessible, even to the Archive itself.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-4-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-1'})
    ON CREATE SET
        ap.current_status = 'technology expert',
        ap.emotional_state = 'determined',
        ap.emotional_tags = ["determined"],
        ap.active_plans = ["stabilize temporal matrices with the TARDIS"],
        ap.beliefs = ["The Archive's collapse can be averted with technological intervention"],
        ap.goals = ["Prevent the Entropy Syndicate's attack from succeeding"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-4-2'})
    ON CREATE SET
        ap.current_status = 'crystal matrix protector',
        ap.emotional_state = 'sacrificial',
        ap.emotional_tags = ["sacrificial"],
        ap.active_plans = ["purge the virus from the Archive"],
        ap.beliefs = ["The Archive must be preserved at any cost"],
        ap.goals = ["Eradicate the temporal virus threatening the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-4-3'})
    ON CREATE SET
        ap.current_status = 'data analyst',
        ap.emotional_state = 'anxious but focused',
        ap.emotional_tags = ["anxious but focused"],
        ap.active_plans = ["monitor critical pattern convergence"],
        ap.beliefs = ["Understanding the virus's nature is crucial to stopping it"],
        ap.goals = ["Provide insights to avert a total system failure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-4'})
    ON CREATE SET
        ap.current_status = 'ruthless tactician',
        ap.emotional_state = 'confident, then shocked',
        ap.emotional_tags = ["confident, then shocked"],
        ap.active_plans = ["orchestrate the Entropy Syndicate's operation"],
        ap.beliefs = ["Temporal power can be harnessed and controlled"],
        ap.goals = ["Gain access to the Time War's secrets"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-4'})
    ON CREATE SET
        ap.current_status = 'protector of temporal integrity',
        ap.emotional_state = 'resolved',
        ap.emotional_tags = ["resolved"],
        ap.active_plans = ["confront the Entropy Syndicate with the new consciousness"],
        ap.beliefs = ["Time's consciousness must judge those seeking its power"],
        ap.goals = ["Stop the unleashed power of the Moment from being abused"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-5'})
    ON CREATE SET
        ap.current_status = 'mediator of temporal awareness',
        ap.emotional_state = 'assertive',
        ap.emotional_tags = ["assertive"],
        ap.active_plans = ["explain the consequences of time awareness to Malik"],
        ap.beliefs = ["Time is alive and should never be controlled"],
        ap.goals = ["Ensure the Syndicate faces justice for their actions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-4-5'})
    ON CREATE SET
        ap.current_status = 'traitor and infiltrator',
        ap.emotional_state = 'desperate',
        ap.emotional_tags = ["desperate"],
        ap.active_plans = ["attempt to escape temporal judgment by fleeing"],
        ap.beliefs = ["Escape is possible despite overwhelming odds"],
        ap.goals = ["Avoid capture and resultant consequences"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-5'})
    ON CREATE SET
        ap.current_status = 'defeated tactician',
        ap.emotional_state = 'disillusioned',
        ap.emotional_tags = ["disillusioned"],
        ap.active_plans = ["grapple with unexpected temporal consequences"],
        ap.beliefs = ["Every temporal variable was accounted for"],
        ap.goals = ["Cope with the failure of controlling time"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_matrix-event-5-1'})
    ON CREATE SET
        oi.description = 'The crystal matrix, forming a part of K\'nell\'s being, begins to regenerate, signifying the initial steps of the restoration process within the Quantum Archive following the containment of the crisis.',
        oi.status_before = 'The crystalline matrix was damaged, affected by the temporal events and proactive measures taken to contain the emergent crisis.',
        oi.status_after = 'The crystalline matrix enters a state of regeneration, indicating the start of healing and stabilization after the crisis resolution.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_matrix'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_state_analyzer-event-5-2'})
    ON CREATE SET
        oi.description = 'Dr. Chen uses the quantum state analyzer to confirm that the temporal stability of the Quantum Archive is being restored, despite marked fundamental changes due to the crisis.',
        oi.status_before = 'The quantum state analyzer previously registered readings during the Archive\'s instability and crisis.',
        oi.status_after = 'Following the event, the quantum state analyzer shows readings indicating returning stability with noted residual changes in the Quantum Archive\'s parameters.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_crystals-event-5-7'})
    ON CREATE SET
        oi.description = 'The quantum crystals in the Archive pulse with renewed purpose, suggesting an acknowledgment or understanding sparked by the recent events. This reflects a transition in their role from mere storage to entities capable of a form of awareness.',
        oi.status_before = 'The quantum crystals were under threat from a destabilized archive and impending entropy but served as storage for historical data.',
        oi.status_after = 'Post-event, the quantum crystals show a dynamic change, resonating with awareness and playing a role in the Archive\'s new form of defense and intelligence.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_crystals'})
    MATCH (e:Event {uuid: 'event-5-7'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tardis-event-5-7'})
    ON CREATE SET
        oi.description = 'The TARDIS dematerializes, having fulfilled its role in assisting with stabilizing the Quantum Archive\'s temporal matrices, a crucial part in containing the earlier temporal crisis.',
        oi.status_before = 'The TARDIS was present in the Quantum Archive, actively involved in stabilizing the temporal matrices as part of resolving the crisis.',
        oi.status_after = 'Following the dematerialization, the TARDIS is no longer present in the Archive, having completed its mission in the stabilization efforts.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-5-7'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-quantum_matrices-event-5-5'})
    ON CREATE SET
        oi.description = 'Dr. Chen detects signs of consciousness within the Archive\'s quantum matrices, revealing a fundamental shift in their nature, now displaying sentient-like properties as a result of the crisis.',
        oi.status_before = 'The quantum matrices were integral to the Archive\'s functionality but were severely impacted by the temporal virus during the crisis.',
        oi.status_after = 'Following the event, the matrices exhibit consciousness, indicating a transformation that extends beyond their original technical intended use.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-5-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-1'})
    ON CREATE SET
        ap.current_status = 'beginning regeneration of crystal matrix',
        ap.emotional_state = 'focused on restoration',
        ap.emotional_tags = ["focused on restoration"],
        ap.active_plans = ["restore crystal matrix", "facilitate recovery process"],
        ap.beliefs = ["restoration is necessary for stability", "fulfilling the duty to protect the Archive"],
        ap.goals = ["ensure full recovery of the Archive", "protect the Archive\u2019s integrity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-2'})
    ON CREATE SET
        ap.current_status = 'confirming temporal stability restoration',
        ap.emotional_state = 'relieved but cautious',
        ap.emotional_tags = ["relieved but cautious"],
        ap.active_plans = ["verify temporal stability", "monitor changes in Archive"],
        ap.beliefs = ["changes are fundamental", "stability is crucial"],
        ap.goals = ["ensure stability holds", "understand the nature of changes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-3'})
    ON CREATE SET
        ap.current_status = 'reporting quantum locking of records',
        ap.emotional_state = 'resigned',
        ap.emotional_tags = ["resigned"],
        ap.active_plans = ["report status of records"],
        ap.beliefs = ["quantum locking prevents access", "records exist beyond time"],
        ap.goals = ["inform others of status", "keep records inaccessible for safety"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-4'})
    ON CREATE SET
        ap.current_status = 'reflecting on necessity of unexplored shadows',
        ap.emotional_state = 'thoughtful',
        ap.emotional_tags = ["thoughtful"],
        ap.active_plans = ["advise caution regarding unexplored aspects of history"],
        ap.beliefs = ["certain history should remain within shadows", "the end of conflicts like the Time War was necessary"],
        ap.goals = ["promote cautious handling of historical knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-5'})
    ON CREATE SET
        ap.current_status = 'detecting consciousness in quantum matrices',
        ap.emotional_state = 'intrigued and concerned',
        ap.emotional_tags = ["intrigued", "concerned"],
        ap.active_plans = ["analyze consciousness in quantum matrices"],
        ap.beliefs = ["Archive has fundamentally changed", "consciousness in matrices indicates new capabilities"],
        ap.goals = ["explore implications of consciousness", "ensure Archive's stability"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-6'})
    ON CREATE SET
        ap.current_status = 'emphasizing responsibility of knowledge',
        ap.emotional_state = 'serious yet hopeful',
        ap.emotional_tags = ["serious yet hopeful"],
        ap.active_plans = ["emphasize responsibility attached to possessing knowledge"],
        ap.beliefs = ["knowledge requires a conscience", "an aware Archive could be beneficial"],
        ap.goals = ["highlight importance of responsibility with knowledge", "support understanding of the Archive\u2019s new potential"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-7'})
    ON CREATE SET
        ap.current_status = 'dematerializing the TARDIS',
        ap.emotional_state = 'resolute',
        ap.emotional_tags = ["resolute"],
        ap.active_plans = ["depart after ensuring security measures are implemented"],
        ap.beliefs = ["leaving with trust in the Archive's renewed security"],
        ap.goals = ["complete the departure", "place trust in implemented protocols"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-7'})
    ON CREATE SET
        ap.current_status = 'implementing new security protocols',
        ap.emotional_state = 'determined',
        ap.emotional_tags = ["determined"],
        ap.active_plans = ["establish enhanced security measures"],
        ap.beliefs = ["new protocols are vital for protection", "rejuvenated Archive necessitates improved security"],
        ap.goals = ["secure the Archive against future threats", "ensure long-term safety of the Archive\u2019s contents"]
    ;
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Location {uuid: 'location-quantum_archive-temporal_staging_area'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-1-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Location {uuid: 'location-quantum_archive-central_core'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-2-4'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Event {uuid: 'event-2-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-2-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Location {uuid: 'location-quantum_archive-security_nexus'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-4'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Event {uuid: 'event-3-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'participation-agent-director_malik-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-director_malik-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Location {uuid: 'location-quantum_archive-temporal_core'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-4-3'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-4-4'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-3'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-4-5'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-4'}),
          (b:Event {uuid: 'event-4-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-4-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-4-5'}),
          (b:Event {uuid: 'event-4-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-4-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-coordinator_voss-event-4-5'}),
          (b:Event {uuid: 'event-4-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-director_malik-event-4-5'}),
          (b:Event {uuid: 'event-4-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Location {uuid: 'location-quantum_archive-temporal_staging_area'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-4'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Event {uuid: 'event-5-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-5'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-4'}),
          (b:Event {uuid: 'event-5-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-6'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-5'}),
          (b:Event {uuid: 'event-5-6'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-7'}),
          (b:Scene {uuid: 'scene-005'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-6'}),
          (b:Event {uuid: 'event-5-7'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sarah_chen-event-5-5'}),
          (b:Event {uuid: 'event-5-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-6'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-6'}),
          (b:Event {uuid: 'event-5-6'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-7'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-the_doctor-event-5-7'}),
          (b:Event {uuid: 'event-5-7'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-archivist_prime_knell'}),
          (b:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-7'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-archivist_prime_knell-event-5-7'}),
          (b:Event {uuid: 'event-5-7'})

    MERGE (a)-[:IN_EVENT]->(b);
