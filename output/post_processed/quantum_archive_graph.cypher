DROP INDEX scene_uuid IF EXISTS;
DROP INDEX event_uuid IF EXISTS;
DROP INDEX agent_uuid IF EXISTS;
DROP INDEX object_uuid IF EXISTS;
DROP INDEX agent_participation_uuid IF EXISTS;
DROP INDEX object_involvement_uuid IF EXISTS;
DROP INDEX organization_uuid IF EXISTS;
DROP INDEX location_uuid IF EXISTS;
DROP INDEX episode_uuid IF EXISTS;
DROP CONSTRAINT agent_uuid_unique IF EXISTS;
DROP CONSTRAINT event_uuid_unique IF EXISTS;
DROP CONSTRAINT scene_uuid_unique IF EXISTS;
DROP CONSTRAINT object_uuid_unique IF EXISTS;
DROP CONSTRAINT location_uuid_unique IF EXISTS;
DROP CONSTRAINT organization_uuid_unique IF EXISTS;
DROP CONSTRAINT agent_participation_uuid_unique IF EXISTS;
DROP CONSTRAINT object_involvement_uuid_unique IF EXISTS;
DROP CONSTRAINT episode_uuid_unique IF EXISTS;
CREATE CONSTRAINT agent_uuid_unique IF NOT EXISTS FOR (a:Agent) REQUIRE a.uuid IS UNIQUE;
CREATE CONSTRAINT event_uuid_unique IF NOT EXISTS FOR (e:Event) REQUIRE e.uuid IS UNIQUE;
CREATE CONSTRAINT scene_uuid_unique IF NOT EXISTS FOR (s:Scene) REQUIRE s.uuid IS UNIQUE;
CREATE CONSTRAINT object_uuid_unique IF NOT EXISTS FOR (o:Object) REQUIRE o.uuid IS UNIQUE;
CREATE CONSTRAINT location_uuid_unique IF NOT EXISTS FOR (l:Location) REQUIRE l.uuid IS UNIQUE;
CREATE CONSTRAINT organization_uuid_unique IF NOT EXISTS FOR (org:Organization) REQUIRE org.uuid IS UNIQUE;
CREATE CONSTRAINT agent_participation_uuid_unique IF NOT EXISTS FOR (ap:AgentParticipation) REQUIRE ap.uuid IS UNIQUE;
CREATE CONSTRAINT object_involvement_uuid_unique IF NOT EXISTS FOR (oi:ObjectInvolvement) REQUIRE oi.uuid IS UNIQUE;
CREATE CONSTRAINT episode_uuid_unique IF NOT EXISTS FOR (ep:Episode) REQUIRE ep.uuid IS UNIQUE;
CREATE INDEX scene_uuid IF NOT EXISTS FOR (s:Scene) ON (s.uuid);
CREATE INDEX event_uuid IF NOT EXISTS FOR (e:Event) ON (e.uuid);
CREATE INDEX agent_uuid IF NOT EXISTS FOR (a:Agent) ON (a.uuid);
CREATE INDEX object_uuid IF NOT EXISTS FOR (o:Object) ON (o.uuid);
CREATE INDEX agent_participation_uuid IF NOT EXISTS FOR (ap:AgentParticipation) ON (ap.uuid);
CREATE INDEX object_involvement_uuid IF NOT EXISTS FOR (oi:ObjectInvolvement) ON (oi.uuid);
CREATE INDEX organization_uuid IF NOT EXISTS FOR (org:Organization) ON (org.uuid);
CREATE INDEX location_uuid IF NOT EXISTS FOR (l:Location) ON (l.uuid);
CREATE INDEX episode_uuid IF NOT EXISTS FOR (ep:Episode) ON (ep.uuid);
MATCH (n) DETACH DELETE n;
MERGE (a:Agent {uuid: 'agent-sarah_chen'})
    ON CREATE SET
        a.name = 'Sarah Chen',
        a.title = 'Time Archaeology Division Chief',
        a.description = 'Dr. Sarah Chen is the determined chief of the Time Archaeology Division at the Quantum Archive, specializing in temporal technologies and archaeological science. She is committed to preserving the Archive\'s historical records from degradation and malicious interference, exhibiting strong leadership during crises and effectively combating threats to the Archive.',
        a.traits = ["Determined", "Scientific", "Expert", "Resilient", "Analytical", "Proactive", "Scientist", "Expert in Temporal Dynamics", "Pragmatic", "Committed"],
        a.sphere_of_influence = 'Time Archaeology'
    ;
MERGE (a:Agent {uuid: 'agent-k_nell'})
    ON CREATE SET
        a.name = 'K\'nell',
        a.title = 'Archivist Prime',
        a.description = 'K\'nell is the ancient, non-humanoid Archivist Prime of the Quantum Archive, with a crystalline form and deep connection to the facility\'s systems. Responsible for maintaining and safeguarding the Archive\'s knowledge and operational integrity, K\'nell is crucial in defending against temporal threats, characterized by wisdom and dedication.',
        a.traits = ["Aware", "Wise", "Knowledgeable", "Guardianship", "Non-humanoid", "Protective", "Dedicated", "Keeper of Knowledge", "Frank", "Diligent", "Adaptable", "Mysterious", "Ancient"],
        a.sphere_of_influence = 'Temporal Systems'
    ;
MERGE (a:Agent {uuid: 'agent-the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'Time Traveler',
        a.description = 'The Doctor is a mysterious and enigmatic Time Lord from Gallifrey, traveling through time and space in the TARDIS, a time machine resembling a British police box. Known for their intelligence, resourcefulness, and a strong moral compass, The Doctor intervenes in critical historical and intergalactic events to protect the universe and right wrongs.',
        a.traits = ["Knowledgeable", "Intelligent", "Defender of Time", "Compassionate", "Adventurous", "Protector", "Time Lord", "Charismatic", "Resourceful", "Interventionist", "Insightful", "Curious", "Time Traveler", "Enigmatic", "Strategic"],
        a.sphere_of_influence = 'Time Travel'
    ;
MERGE (a:Agent {uuid: 'agent-coordinator_voss'})
    ON CREATE SET
        a.name = 'Coordinator Voss',
        a.title = 'Coordinator',
        a.description = 'Coordinator Voss is an infiltrator from the Entropy Syndicate, operating under the guise of a junior archivist within the Quantum Archive. Voss is engaged in espionage to further the Syndicate\'s agenda, employing stealth and advanced temporal technology to manipulate the Archive\'s records.',
        a.traits = ["Infiltrator", "Stealthy", "Espionage", "Deceptive", "Cunning", "Resourceful"],
        a.sphere_of_influence = 'Espionage'
    ;
MERGE (a:Agent {uuid: 'agent-director_malik'})
    ON CREATE SET
        a.name = 'Director Malik',
        a.title = 'Director',
        a.description = 'Director Malik is a high-ranking member of the Entropy Syndicate, characterized as a ruthless tactician. He seeks control over the Quantum Archive and aims to exploit the secrets of the Time War to benefit the Syndicate, employing strategic and calculated temporal manipulations.',
        a.traits = ["Ambitious", "Calculating", "Tactical", "Authoritative", "Ruthless", "Strategic"],
        a.sphere_of_influence = 'Temporal Warfare'
    ;
MERGE (o:Object {uuid: 'object-quantum_state_analyzer'})
    ON CREATE SET
        o.name = 'Quantum Analyzer',
        o.description = 'A high-tech device used by Dr. Sarah Chen, capable of assessing quantum states and detecting critical pattern convergence.',
        o.purpose = 'To monitor and analyze the converging temporal patterns within the Archive\'s systems.',
        o.significance = 'Represents the scientific expertise and awareness necessary to grasp the complexities of the unfolding temporal crisis.'
    ;
MERGE (o:Object {uuid: 'object-tardis'})
    ON CREATE SET
        o.name = 'TARDIS',
        o.description = 'A time-traveling ship that is bigger on the inside and serves as The Doctor\'s primary mode of transportation, capable of interfacing with various systems.',
        o.purpose = 'To stabilize the failing temporal matrices of the Archive during the crisis.',
        o.significance = 'Acts as a symbol of hope and aid in restoring order during chaotic events, emphasizing The Doctor\'s role in saving the Archive.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_control_interfaces'})
    ON CREATE SET
        o.name = 'Crystalline Control Interfaces',
        o.description = 'The central set of controls operated by Archivist Prime K\'nell, built from the same material as the Archive itself and designed to interface with the primary systems.',
        o.purpose = 'To manage and manipulate the core systems of the Quantum Archive, especially in response to external threats and internal failures.',
        o.significance = 'These interfaces are crucial for maintaining control over the archive\'s vast data repositories, especially during crises such as the entropic cascade caused by the Entropy Syndicate.'
    ;
MERGE (o:Object {uuid: 'object-temporal_matrices'})
    ON CREATE SET
        o.name = 'Temporal Matrices',
        o.description = 'A set of structures that line the walls of the reception chamber, displaying ancient language data streams and pulsing with chronometric energy.',
        o.purpose = 'To sustain the temporal suspension of data, facilitating the Quantum Archive’s function as a repository of knowledge across time.',
        o.significance = 'These matrices symbolize the intricate and fragile nature of temporal data, underscoring the magnitude of the threat posed by the entropic cascade.'
    ;
MERGE (o:Object {uuid: 'object-holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A device that projects a holographic image of fragmented code patterns and temporal coordinates.',
        o.purpose = 'To visualize the data and temporal coordinates being manipulated by the virus for The Doctor to analyze.',
        o.significance = 'Facilitates the revelation of the Entropy Syndicate\'s true objective by displaying key information related to the Moment.'
    ;
MERGE (o:Object {uuid: 'object-data_crystals'})
    ON CREATE SET
        o.name = 'Data Crystals',
        o.description = 'Massive crystals that store the Archive\'s data, reaching into the darkness above with surfaces clouded by temporal decay.',
        o.purpose = 'To store historical records and data from various civilizations within the Quantum Archive.',
        o.significance = 'Symbolizes the fragility of preserved knowledge and the impact of the Entropy Syndicate\'s attack on the integrity of the Archive\'s information.'
    ;
MERGE (o:Object {uuid: 'object-sonic_screwdriver'})
    ON CREATE SET
        o.name = 'Sonic Screwdriver',
        o.description = 'A multifunctional tool used by The Doctor, capable of interfacing with and analyzing the Archive\'s systems.',
        o.purpose = 'To examine and interpret the systems and identify the nature and impact of the temporal virus.',
        o.significance = 'Represents The Doctor\'s technological prowess and ability to uncover truths hidden within advanced systems.'
    ;
MERGE (o:Object {uuid: 'object-quantum_transmitter'})
    ON CREATE SET
        o.name = 'Quantum Transmitter',
        o.description = 'A hidden device within Coordinator Voss\'s crystalline badge, used to discreetly signal the Entropy Syndicate.',
        o.purpose = 'To communicate covertly with the Entropy Syndicate, indicating ongoing developments and potential vulnerabilities.',
        o.significance = 'Symbolizes the infiltration and espionage occurring within the Quantum Archive, as well as Voss\'s duplicity.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_control_matrix'})
    ON CREATE SET
        o.name = 'Crystalline Control Matrix',
        o.description = 'A primary interface within the Archive, directly interacted with by K\'nell using crystalline appendages.',
        o.purpose = 'To manage the Archive\'s systems and attempt to isolate and analyze the virus code structure.',
        o.significance = 'Highlights K\'nell\'s integration and role as a non-humanoid guardian of the Archive\'s technological infrastructure.'
    ;
MERGE (o:Object {uuid: 'object-temporal_breach_alarms'})
    ON CREATE SET
        o.name = 'Temporal Breach Alarms',
        o.description = 'Alarm systems throughout the facility designed to alert staff to breaches in spacetime, characterized by cracking with entropic energy.',
        o.purpose = 'To alert staff and allow for immediate response to temporal breaches within the facility.',
        o.significance = 'Indicates the severity and immediacy of the threat posed by the Entropy Syndicate\'s invasion and the fracturing of spacetime.'
    ;
MERGE (o:Object {uuid: 'object-spacetime_breaches'})
    ON CREATE SET
        o.name = 'Spacetime Breaches',
        o.description = 'Fractures in spacetime caused by entropic energy, through which Entropy Syndicate operatives emerge. The breaches are a physical manifestation of the attack.',
        o.purpose = 'To allow Entropy Syndicate operatives to infiltrate the Quantum Archive.',
        o.significance = 'Represents the vulnerability of the Quantum Archive to external attacks and the chaos introduced by the Entropy Syndicate\'s actions.'
    ;
MERGE (o:Object {uuid: 'object-entropy_syndicate_armor'})
    ON CREATE SET
        o.name = 'Entropy Syndicate Armor',
        o.description = 'Armor worn by Entropy Syndicate operatives designed to resist temporal feedback while conducting their mission.',
        o.purpose = 'To protect operatives from the adverse effects of temporal energies during their infiltration of the Quantum Archive.',
        o.significance = 'Demonstrates the preparedness and technological advancement of the Entropy Syndicate in executing their plan.'
    ;
MERGE (o:Object {uuid: 'object-temporal_weapons'})
    ON CREATE SET
        o.name = 'Temporal Weapons',
        o.description = 'Advanced weapons primed by Director Malik, capable of affecting and manipulating time-related structures or entities.',
        o.purpose = 'To subjugate or destroy the Quantum Archive\'s defenses, facilitating the extraction of Time War secrets.',
        o.significance = 'Symbolizes the aggressive intent and willingness of the Entropy Syndicate to wield destructive tools to achieve control over time knowledge.'
    ;
MERGE (o:Object {uuid: 'object-central_control_nexus'})
    ON CREATE SET
        o.name = 'Central Control Nexus',
        o.description = 'The core operational hub where The Doctor attempts to regain control amid the chaos, implementing defensive maneuvers.',
        o.purpose = 'To serve as the main interface for managing the Archive\'s systems and responding to the attack.',
        o.significance = 'A crucial focal point for The Doctor\'s efforts to stabilize the situation and counteract the Entropy Syndicate\'s incursion.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_form'})
    ON CREATE SET
        o.name = 'Crystalline Form',
        o.description = 'The physical embodiment of Archivist Prime K\'nell, composed of a crystalline matrix that can channel energy and perform advanced functions.',
        o.purpose = 'To channel purging protocols through its matrix to counter the virus affecting the Archive.',
        o.significance = 'Symbolizes sacrifice and dedication, as K\'nell uses a part of themselves to protect the Archive from disaster.'
    ;
MERGE (o:Object {uuid: 'object-archive_crystals'})
    ON CREATE SET
        o.name = 'Archive Crystals',
        o.description = 'Massive crystalline structures within the Archive that resonate with chronometric energy and data storage capabilities.',
        o.purpose = 'To store and process the temporal knowledge within the Archive, resonating harmoniously with the awakened consciousness.',
        o.significance = 'Reflects the integration of the Archive\'s knowledge and its newly awakened state, representing the culmination of stored history and awareness.'
    ;
MERGE (o:Object {uuid: 'object-temporal_cascade'})
    ON CREATE SET
        o.name = 'Temporal Cascade',
        o.description = 'A sentient manifestation of chronometric energy created from converged temporal knowledge, embodying the awakened consciousness of time.',
        o.purpose = 'To serve as a judgment mechanism against those who sought the Moment\'s power for their own purposes.',
        o.significance = 'Represents the sentient aspect of time, highlighting its role as an active participant in defending against manipulation and exploitation.'
    ;
MERGE (o:Object {uuid: 'object-crystal_matrix'})
    ON CREATE SET
        o.name = 'Crystal Matrix',
        o.description = 'Damaged crystalline structure used by K\'nell within the Quantum Archive to maintain and regenerate temporal data.',
        o.purpose = 'To store and stabilize temporal data within the Quantum Archive.',
        o.significance = 'Represents the vulnerability and resilience of the Archive\'s knowledge, especially after hosting and surviving a near-catastrophic event.'
    ;
MERGE (o:Object {uuid: 'object-quantum_matrices'})
    ON CREATE SET
        o.name = 'Quantum Matrices',
        o.description = 'Complex network of quantum constructs within the Archive that has developed signs of consciousness.',
        o.purpose = 'To safely store and maintain the history and knowledge from eons of civilizations in a stable temporal environment.',
        o.significance = 'Embodies the theme of knowledge having its own awareness, suggesting that the Archive now holds consciousness, altering its function and purpose.'
    ;
MERGE (l:Location {uuid: 'location-temporal_staging_area'})
    ON CREATE SET
        l.name = 'Temporal Staging Area',
        l.description = 'The reception chamber of the Quantum Archive, characterized by gleaming walls pulsing with chronometric energy. It serves as a control and monitoring area where significant discussions and actions related to the Archive\'s temporal stability take place. Following the crisis, it also becomes a symbol of triumph and reflection as K\'nell initiates new security protocols.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-central_core'})
    ON CREATE SET
        l.name = 'Central Core',
        l.description = 'The towering central area of the Quantum Archive, featuring massive data crystals reaching into darkness. These crystals store data in quantum suspension, but their surfaces now show spreading temporal decay, disrupting the usual perfect symmetry. The core serves as a crucial area for historical data storage and operations, illustrating the heart of the Archive\'s technology.',
        l.type = 'Facility'
    ;
MERGE (l:Location {uuid: 'location-security_nexus'})
    ON CREATE SET
        l.name = 'Security Nexus',
        l.description = 'A high-security control room within the Quantum Archive, where temporal breach alarms blare as spacetime fractures. The room is a critical hub for emergency response, housing central control interfaces for coordinating defense and managing facility containment systems. The environment is tense, with operators and key figures working urgently to address the threats posed by intruding Entropy Syndicate operatives.',
        l.type = 'Control Room'
    ;
MERGE (l:Location {uuid: 'location-temporal_core'})
    ON CREATE SET
        l.name = 'Temporal Core',
        l.description = 'The Temporal Core is the heart of the Quantum Archive, where immense chronometric energies are concentrated and harnessed. This space features the Archive\'s integrated systems and quantum matrices that stabilize temporal structures. In this scene, the TARDIS is interfaced with the Archive, contributing stabilizing energy as a consciousness of pure chronometric energy forms, resonating with the Archive\'s crystals.',
        l.type = 'Core'
    ;
MERGE (o:Organization {uuid: 'org-quantum_archive'})
    ON CREATE SET
        o.name = 'Quantum Archive',
        o.description = 'A facility storing vast knowledge from eons of history and civilizations, currently exhibiting signs of consciousness.',
        o.sphere_of_influence = 'Temporal knowledge preservation and storage'
    ;
MERGE (o:Organization {uuid: 'org-entropy_syndicate'})
    ON CREATE SET
        o.name = 'Entropy Syndicate',
        o.description = 'A clandestine group adept in temporal espionage, seeking to exploit temporal technologies and secrets from the Time War.',
        o.sphere_of_influence = 'Hostile acquisitions and temporal warfare'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    ON CREATE SET
        ep.title = 'Episode One - The Quantum Archive',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene-1'})
    ON CREATE SET
        s.title = 'Arrival of the Doctor in the Temporal Staging Area',
        s.description = 'In the vast crystalline reception chamber of the Quantum Archive, Dr. Sarah Chen confronts the perilous degradation of temporal seals, risking centuries of data. K\'nell, the ancient Archivist Prime, identifies the Entropy Syndicate\'s calculated attack on quantum vulnerabilities. Junior archivists work frantically to contain the spreading temporal decay, displayed as fractal corruption on massive holograms. An alert heralds the arrival of the TARDIS, which materializes with a familiar sound. The Doctor emerges, admiring the Archive\'s architecture while questioning the motives behind the attack.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Dr. Sarah Chen Discovers Degrading Temporal Seals',
        e.description = 'Dr. Sarah Chen, at the central control platform, notices alarming readings indicating that the temporal seals are degrading rapidly, causing the loss of historical data at an exponential rate.',
        e.sequence = 1,
        e.key_dialogue = ["These readings can't be right. The temporal seals are degrading at an exponential rate. We're losing centuries of data with every chronometric pulse."]
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'K\'nell Comments on Entropy Syndicate\'s Attack',
        e.description = 'K\'nell, a crystalline being, explains the Entropy Syndicate\'s strategic attack which exploited quantum vulnerabilities previously unknown to the Quantum Archive.',
        e.sequence = 2,
        e.key_dialogue = ["The Entropy Syndicate's attack vector was precisely calculated. They exploited quantum vulnerabilities we didn't know existed."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'The Need for External Intervention',
        e.description = 'K\'nell acknowledges the need for help beyond their capabilities, suggesting the need for someone who comprehends both the technological and metaphysical aspects of the situation.',
        e.sequence = 3,
        e.key_dialogue = ["We require intervention beyond our capabilities. Someone who understands both the technology and the metaphysical implications."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'The TARDIS Arrives',
        e.description = 'Dr. Chen\'s quantum analyzer alerts as artron energy fills the chamber. The TARDIS materializes, matching the crystalline architecture.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-1-5'})
    ON CREATE SET
        e.title = 'The Doctor Enters Scene',
        e.description = 'The Doctor appears from the TARDIS, acknowledging the catastrophic entropic cascade affecting the temporal archives and marvelling at the archive\'s architecture, questioning the motive behind its destruction.',
        e.sequence = 5,
        e.key_dialogue = ["Temporal archives experiencing catastrophic entropic cascade. Though I must say - brilliant architecture. Quantum crystalline matrices storing data in temporal suspension. But the real question is - why would someone want to destroy it?"]
    ;
MERGE (s:Scene {uuid: 'scene-2'})
    ON CREATE SET
        s.title = 'The Hidden Pattern',
        s.description = 'The Doctor and Dr. Chen investigate the Quantum Archive\'s Central Core, where massive data crystals tower overhead, clouded by temporal decay. Dr. Chen reveals a sophisticated attack involving a temporal virus rewriting history at the quantum level. K\'nell interfaces with a control matrix, isolating fragments of the virus code, which is searching for temporal coordinates. The Doctor realizes the virus is seeking information about the Moment, believed destroyed. Coordinator Voss, disguised as a junior archivist, secretly activates a quantum transmitter.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location-central_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'The Doctor and Dr. Chen Discover the Temporal Virus',
        e.description = 'Dr. Chen informs The Doctor about the sophisticated attack on the Archive. The breach not only compromised their defenses but also implanted a temporal virus rewriting historical records at the quantum level. The Doctor examines the systems with the sonic screwdriver while Dr. Chen monitors the degradation patterns.',
        e.sequence = 1,
        e.key_dialogue = ["DR. CHEN: The attack was sophisticated. They didn't just breach our defenses - they implanted something. A temporal virus that's rewriting our historical records at the quantum level."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'K\'nell Analyzes the Virus Code',
        e.description = 'K\'nell, interfacing with the primary control matrix, reports that they have isolated fragments of the virus\'s code structure. The virus seems to be searching for specific temporal coordinates.',
        e.sequence = 2,
        e.key_dialogue = ["K'NELL: We've isolated fragments of their code structure. The virus appears to be searching for specific temporal coordinates."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'The Doctor Realizes the Virus\'s Target',
        e.description = 'The Doctor examines the holographic display showing code patterns and temporal coordinates and realizes the virus is searching for information on the Moment, the ultimate weapon of the Time War. The Doctor reveals that these records were supposed to be destroyed and sealed away.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: These aren't just attack algorithms. They're searching for information about the Moment - the ultimate weapon of the Time War. Those records were supposed to be destroyed... sealed away in time itself."]
    ;
MERGE (e:Event {uuid: 'event-2-4'})
    ON CREATE SET
        e.title = 'Coordinator Voss Secretly Activates a Quantum Transmitter',
        e.description = 'Coordinator Voss, hiding in a shadowed alcove, surreptitiously activates a quantum transmitter embedded in their crystalline badge, hinting at possible ulterior motives or involvement.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene-3'})
    ON CREATE SET
        s.title = 'Betrayal Cascade',
        s.description = 'In the Security Nexus of the Quantum Archive, temporal breach alarms echo as Entropy Syndicate operatives, led by Director Malik, emerge from fractures in spacetime. With temporal weapons primed, Malik asserts control, seeking the Archive’s secrets. Amidst the chaos, the Doctor urgently manipulates the central control nexus, while Dr. Chen and Archivist Prime K\'nell manage emergency protocols. Coordinator Voss reveals their betrayal, aiming to sabotage containment fields. The Doctor warns of the dangers of the knowledge they\'re pursuing, highlighting that the Moment was not just a weapon but a judgmental consciousness. Dr. Chen identifies that the virus is assembling something new across multiple timelines.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_security_nexus'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Temporal Breach Alarms Activate',
        e.description = 'The temporal breach alarms sound throughout the facility as multiple points of spacetime begin to fracture, crackling with entropic energy. Entropy Syndicate operatives emerge from these breaches, equipped with armor resistant to temporal feedback, and Director Malik steps through the largest breach, temporal weapons ready.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'Director Malik Orders Security of Facility',
        e.description = 'Director Malik orders the Entropy Syndicate operatives to secure the facility, expressing his intent to use the Archive\'s knowledge to serve a greater purpose and to finally claim the secrets of the Time War.',
        e.sequence = 2,
        e.key_dialogue = ["Secure the facility. The Archive's knowledge will serve a greater purpose. The secrets of the Time War will finally be ours."]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'The Doctor, Dr. Chen, and K\'nell Spring into Action',
        e.description = 'The Doctor works frantically at the central control nexus while Dr. Chen and K\'nell coordinate emergency protocols. They collaborate to manage the immediate threat introduced by the Entropy Syndicate\'s incursion.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-4'})
    ON CREATE SET
        e.title = 'Coordinator Voss Reveals True Allegiance',
        e.description = 'Coordinator Voss reveals their allegiance to the Entropy Syndicate by moving to disable the containment fields, indicating a betrayal of their supposed alliance with the Quantum Archive.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-5'})
    ON CREATE SET
        e.title = 'The Doctor Warns of the Dangers of \'The Moment\'',
        e.description = 'The Doctor warns that \'The Moment,\' which the Entropy Syndicate seeks, was not just a weapon but a conscious entity capable of passing judgment on all of time and space.',
        e.sequence = 5,
        e.key_dialogue = ["You don't understand what you're dealing with! The Moment wasn't just a weapon - it was consciousness itself, passing judgment on all of time and space!"]
    ;
MERGE (e:Event {uuid: 'event-3-6'})
    ON CREATE SET
        e.title = 'Dr. Chen Warns of a New Threat',
        e.description = 'Dr. Chen informs The Doctor of a new threat. She explains that the virus pattern is not merely searching but assembling something across multiple timeline nodes, suggesting the creation of a new, possibly dangerous, entity.',
        e.sequence = 6,
        e.key_dialogue = ["Doctor - the virus pattern... it's not just searching. It's assembling something across multiple timeline nodes. Creating something new."]
    ;
MERGE (s:Scene {uuid: 'scene-4'})
    ON CREATE SET
        s.title = 'Time\'s Judgment',
        s.description = 'In the Quantum Archive\'s Temporal Core, the Doctor uses the TARDIS to stabilize the systems while K\'nell sacrifices part of their form to purge a dangerous temporal virus. As Director Malik boasts about approaching success, the energy of all temporally accumulated knowledge manifests as a sentient consciousness. The Entropy Syndicate operatives are frozen in temporal stasis, their timelines reduced to singular consciences. Voss becomes trapped in a causality loop. The Doctor reveals that time, now conscious, is enacting judgment on those who dared to manipulate it.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location-temporal_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'The TARDIS Stabilizes the Archive Systems',
        e.description = 'The TARDIS, interfaced with the Archive\'s systems, pulses with stabilizing energy. K\'nell channels purging protocols through their matrix, causing their crystalline form to fracture. Dr. Chen\'s quantum analyzer shows critical pattern convergence, indicating a significant shift in the temporal dynamics.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Temporal Knowledge Manifests',
        e.description = 'As Director Malik speaks of the systems breach, a shimmering consciousness of pure chronometric energy forms, indicating the assembled temporal knowledge has taken shape. The Archive\'s crystals resonate in harmony with this new entity.',
        e.sequence = 2,
        e.key_dialogue = ["DIRECTOR MALIK: Systems breach at 87%. Soon the power of time itself will be-"]
    ;
MERGE (e:Event {uuid: 'event-4-3'})
    ON CREATE SET
        e.title = 'The Doctor Confronts Director Malik',
        e.description = 'The Doctor declares that the Moment\'s power has awakened, presenting its judgment. This manifestation serves as a rebuke to Director Malik\'s plans. The Entropy Syndicate operatives become frozen in temporal stasis, symbolizing the collapse of their timelines into singular conscience points. Coordinator Voss is caught in a causality loop, unable to escape the repeating cycle.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: You wanted the Moment's power? Now face its judgment. Time itself has awakened - and it remembers.", "DIRECTOR MALIK: Impossible... we calculated every variable... mapped every temporal coordinate...", "THE DOCTOR: Time isn't an equation to be solved, Director. It's alive. And now, thanks to you, it's aware."]
    ;
MERGE (s:Scene {uuid: 'scene-5'})
    ON CREATE SET
        s.title = 'Restoration and Awakening',
        s.description = 'With the crisis resolved, K\'nell begins regenerating their crystal matrix, stabilizing the Archive\'s temporal parameters, though some fundamental changes are now permanent. Dr. Chen and the Doctor discuss the profound transformation of the Archive, now imbued with consciousness. The TARDIS departs as K\'nell enacts new security protocols, leaving the Archive\'s quantum crystals pulsing with renewed purpose and awareness.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'K\'nell Regenerates Crystal Matrix and Identifies Quantum-Locked Records',
        e.description = 'K\'nell initiates the regeneration of their damaged crystal matrix following the crisis. They inform the team that the compromised records have been quantum-locked by an emergence event, making them inaccessible. This highlights the profound extent of the temporal complication.',
        e.sequence = 1,
        e.key_dialogue = ["The compromised records have been quantum-locked by the emergence event. Even we cannot access them now. The knowledge of the Moment truly exists beyond time."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Dr. Chen Observes Temporal Stability and Matrix Consciousness',
        e.description = 'Dr. Sarah Chen observes that the Archive\'s temporal stability is returning to normal, despite some fundamental changes. She notes that the quantum matrices exhibit signs of consciousness, indicating a transformative shift in the Archive\'s nature.',
        e.sequence = 2,
        e.key_dialogue = ["The temporal scarring will heal, but the Archive itself... it's different now. The quantum matrices show signs of... consciousness."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'The Doctor Reflects on Responsibility and Knowledge',
        e.description = 'The Doctor muses on the nature of responsibility that comes with knowledge, suggesting that perhaps having a conscience is exactly what the Archive needs. The Doctor\'s observation underscores the evolving role of the Archive in safeguarding knowledge.',
        e.sequence = 3,
        e.key_dialogue = ["Some shadows are better left unexplored. The Time War ended for a reason.", "Knowledge always comes with responsibility. Perhaps having a conscience of its own is exactly what a library needs."]
    ;
MERGE (e:Event {uuid: 'event-5-4'})
    ON CREATE SET
        e.title = 'TARDIS Dematerializes as K\'nell Implements New Protocols',
        e.description = 'The TARDIS dematerializes, marking the conclusion of The Doctor\'s involvement in this scene. Concurrently, K\'nell begins implementing new security protocols to reinforce the Archive\'s protection. The Archive\'s quantum crystals pulse with a newfound purpose, indicating a shift towards not just storage but understanding.',
        e.sequence = 4,
        e.key_dialogue = []
    ;
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (o:Organization {uuid: 'org-quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (o:Organization {uuid: 'org-quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-quantum_state_analyzer'}),
          (a:Agent {uuid: 'agent-sarah_chen'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-tardis'}),
          (a:Agent {uuid: 'agent-the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'}),
          (a:Agent {uuid: 'agent-k_nell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-sonic_screwdriver'}),
          (a:Agent {uuid: 'agent-the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-quantum_transmitter'}),
          (a:Agent {uuid: 'agent-coordinator_voss'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-crystalline_form'}),
          (a:Agent {uuid: 'agent-k_nell'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (o:Organization {uuid: 'org-quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (o:Organization {uuid: 'org-quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (o:Organization {uuid: 'org-entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-1-1'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen\'s quantum-state analyzer provides data readings indicating the rapid degradation of temporal seals, crucial for identifying the potential threat posed by the temporal decay.',
        oi.status_before = 'The quantum-state analyzer was active, continuously processing chronometric data.',
        oi.status_after = 'The quantum-state analyzer emits an alert pattern, signifying incorrect readings and increased temporal decay awareness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-1-1'})
    ON CREATE SET
        oi.description = 'K\'nell uses the crystalline control interfaces to manipulate the Archive\'s primary systems to respond to the Entropy Syndicate\'s attack and manage the temporal decay.',
        oi.status_before = 'The control interfaces were operational, seamlessly integrated into the Archive\'s system.',
        oi.status_after = 'The control interfaces continue to be used to manage the crisis, reflecting K\'nell’s attempts to stabilize the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-1-1'})
    ON CREATE SET
        oi.description = 'The holographic display shows the massive spread of temporal decay zones in the facility, visualizing the imminent threat of data loss.',
        oi.status_before = 'The holographic display was active, presenting standard data streams.',
        oi.status_after = 'The display now shows fractal patterns of corruption, indicating advanced stages of temporal decay.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-1-1'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form reacts to the crisis, interfacing with the Archive\'s systems, highlighting their role in maintaining the temporal integrity of the facility.',
        oi.status_before = 'K\'nell\'s crystalline form was stable and integrated within the Archive.',
        oi.status_after = 'The form displays visible signs of agitation, light patterns reflecting their response to the temporal crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-1-1'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in response to the temporal crisis, bringing the Doctor, who can provide expertise in resolving the catastrophic entropic cascade facing the Archive.',
        oi.status_before = 'The TARDIS was outside the Archive facility, not involved in the immediate scenario.',
        oi.status_after = 'The TARDIS is present, ready to assess and aid in mitigating the temporal decay.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-1-2'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen uses the quantum-state analyzer to monitor the degrading temporal seals, which emits an alert when detecting severe quantum vulnerabilities.',
        oi.status_before = 'Hovering above the control platform, monitoring temporal matrices.',
        oi.status_after = 'Emitted a distinctive alert pattern in response to the alarming quantum vulnerabilities.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-1-2'})
    ON CREATE SET
        oi.description = 'K\'nell manipulates the crystalline control interfaces to assess and react to the Entropy Syndicate\'s attack on the Archive\'s systems.',
        oi.status_before = 'Part of the Archive\'s primary systems, inactive.',
        oi.status_after = 'Actively manipulated by K\'nell to address the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-1-2'})
    ON CREATE SET
        oi.description = 'Displays zones of temporal decay throughout the facility, visualizing the spread of the entropic cascade.',
        oi.status_before = 'Displaying regular data streams and temporal information.',
        oi.status_after = 'Shows fractal patterns of temporal decay indicating the facility\'s degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-1-2'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form refracts temporal energies and agitatedly shifts in response to the detected vulnerabilities.',
        oi.status_before = 'Stable, interfacing with the Archive\'s primary systems.',
        oi.status_after = 'Shifts in agitation, interacting more intensively with the surrounding energies.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-1-2'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in response to the alert, potentially providing crucial assistance in addressing the catastrophic temporal cascade.',
        oi.status_before = 'In progress of materialization, responding to the quantum vulnerability alert.',
        oi.status_after = 'Fully materialized within the Quantum Archive, adapted to the crystalline architecture.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-1-3'})
    ON CREATE SET
        oi.description = 'K\'nell, whose crystalline form is adept at interfacing with the Archive\'s primary systems, attempts to address the situation created by the Entropy Syndicate\'s attack using the control interfaces.',
        oi.status_before = 'K\'nell\'s crystalline form is refracting temporal energies and interfacing with the Archive\'s systems.',
        oi.status_after = 'K\'nell remains in their crystalline form focused on addressing the crisis at hand, realizing the need for external intervention.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-1-3'})
    ON CREATE SET
        oi.description = 'K\'nell manipulates the crystalline control interfaces in an attempt to mitigate the Entropy Syndicate\'s attack vector and the resulting temporal instability.',
        oi.status_before = 'The crystalline control interfaces are inactive prior to K\'nell attempting to address the attack.',
        oi.status_after = 'The interfaces are actively manipulated by K\'nell as part of the efforts to respond to the quantum vulnerabilities exploited by the Entropy Syndicate.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-1-3'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen\'s quantum analyzer helps diagnose the degradation of temporal seals, alerting to the gravity of the situation.',
        oi.status_before = 'The quantum analyzer is idle, awaiting to provide analysis on any detected anomalies.',
        oi.status_after = 'The quantum analyzer emits a distinctive alert pattern indicating critical temporal seal degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-1-3'})
    ON CREATE SET
        oi.description = 'The holographic display is used to show the spreading zones of temporal decay throughout the facility, giving a visual representation of the fractaling patterns of corruption.',
        oi.status_before = 'The holographic display is in standby mode with no critical data showing.',
        oi.status_after = 'The display is actively visualizing the alarming spread of temporal decay, amplifying the urgency of the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-1-3'})
    ON CREATE SET
        oi.description = 'The TARDIS arrives in response to the temporal crisis, offering support beyond what the Quantum Archive can handle alone.',
        oi.status_before = 'The TARDIS is not present in the scene, presumably traveling elsewhere.',
        oi.status_after = 'The TARDIS materializes within the Temporal Staging Area, becoming part of the attempt to resolve the catastrophic entropic cascade.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-1-4'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen\'s quantum analyzer emits a distinctive alert pattern, indicating the presence of artron energy as the TARDIS materializes.',
        oi.status_before = 'The quantum analyzer is actively monitoring temporal anomalies and the integrity of the temporal seals.',
        oi.status_after = 'The quantum analyzer has alerted to the presence of artron energy introduced by the materialization of the TARDIS.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-1-4'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in the reception chamber of the Quantum Archive, its chameleon circuit adapting to match the crystalline architecture.',
        oi.status_before = 'The TARDIS was in transit, responding to conditions requiring its intervention.',
        oi.status_after = 'The TARDIS has materialized, blending into the environment and bringing The Doctor into the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-1-5'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in the Quantum Archive\'s temporal staging area, its chameleon circuit adjusting to resemble the crystalline architecture, signaling the arrival of The Doctor.',
        oi.status_before = 'The TARDIS was in dematerialized state, traveling through time and space.',
        oi.status_after = 'The TARDIS is materialized in the Quantum Archive, part of the scene\'s architecture, and available to assist with the temporal crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-1-5'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen\'s quantum-state analyzer alerts her to the degradation of temporal seals, indicating the severity of the entropic cascade.',
        oi.status_before = 'The quantum-state analyzer was monitoring temporal matrices for stability.',
        oi.status_after = 'The quantum-state analyzer continues to monitor and alert of ongoing temporal degradation, instrumental in understanding the crisis\'s extent.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-1-5'})
    ON CREATE SET
        oi.description = 'K\'nell uses the crystalline control interfaces to attempt to stabilize the Archive\'s primary systems against the Entropy Syndicate\'s attack.',
        oi.status_before = 'The interfaces were active and integrated with the Archive\'s systems, awaiting input.',
        oi.status_after = 'The interfaces remain critical in efforts to stabilize the systems, now showing signs of stress under the entropic attack.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-1-5'})
    ON CREATE SET
        oi.description = 'Used to project a massive display of the temporal decay zones, the holographic display informs the characters of the spreading entropic cascade.',
        oi.status_before = 'The display was likely active but not focused on showing decay zones.',
        oi.status_after = 'Now set to display data pivotal for understanding the system\'s collapse.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-1-5'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form interacts with the Archive\'s systems, refracting temporal energies as they seek solutions.',
        oi.status_before = 'K\'nell\'s form was stable, interfacing with the systems routinely.',
        oi.status_after = 'Under stress from the attacking vectors, K\'nell continues interfacing but with increased urgency.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_matrices-event-1-5'})
    ON CREATE SET
        oi.description = 'Serving as the structure for storing temporal data, the matrices are showcased malfunctioning due to the Entropy Syndicate\'s attack.',
        oi.status_before = 'The matrices were stable and displaying temporal data streams.',
        oi.status_after = 'Exhibiting instability and corruption, threatening the loss of stored data.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_matrices'})
    MATCH (e:Event {uuid: 'event-1-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Standing at the central control platform, analyzing quantum readings.',
        ap.emotional_state = 'Distressed and alarmed.',
        ap.emotional_tags = ["Distressed", "alarmed."],
        ap.active_plans = ["Assess the situation regarding the degradation of temporal seals.", "Use quantum-state analyzer to identify the cause of data loss."],
        ap.beliefs = ["The situation is critical due to the rapidly degrading temporal seals.", "Immediate intervention is required to prevent data loss."],
        ap.goals = ["Stabilize the degrading temporal seals.", "Preserve historical data from further degeneration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the Archive\'s primary systems to manage the situation.',
        ap.emotional_state = 'Agitated and concerned.',
        ap.emotional_tags = ["Agitated", "concerned."],
        ap.active_plans = ["Manage and stabilize control interfaces.", "Collaborate with Dr. Chen to find an immediate solution."],
        ap.beliefs = ["The attack by the Entropy Syndicate revealed unknown quantum vulnerabilities.", "External expertise is required to resolve the crisis."],
        ap.goals = ["Seek external intervention capable of handling the current crisis.", "Safeguard the Archive's primary systems."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Arriving in the Quantum Archive via TARDIS, evaluating the situation.',
        ap.emotional_state = 'Inquisitive and analytical.',
        ap.emotional_tags = ["Inquisitive", "analytical."],
        ap.active_plans = ["Assess the extent of the entropic cascade affecting the temporal archives.", "Determine motives behind the destruction efforts."],
        ap.beliefs = ["The architectural design of the Quantum Archive is impressively complex.", "Understanding and resolving the entropic cascade requires a comprehensive approach."],
        ap.goals = ["Prevent the catastrophic entropic cascade.", "Identify the rationale behind the attack on the archives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Explaining the strategic attack by the Entropy Syndicate and managing control interfaces.',
        ap.emotional_state = 'Agitated and concerned.',
        ap.emotional_tags = ["Agitated", "concerned."],
        ap.active_plans = ["Attempt to stabilize the quantum vulnerabilities."],
        ap.beliefs = ["The Entropy Syndicate's vector was precisely calculated.", "The situation requires expertise beyond the current team's capabilities."],
        ap.goals = ["Seek external intervention to mitigate the attack's effects.", "Ensure the containment of the temporal decay."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Monitoring temporal seals with the quantum-state analyzer.',
        ap.emotional_state = 'Alarmed and urgent.',
        ap.emotional_tags = ["Alarmed", "urgent."],
        ap.active_plans = ["Analyze pulse degradation to prevent further data loss."],
        ap.beliefs = ["The current quantum vulnerabilities are beyond known expertise.", "Immediate action is required to salvage historical data."],
        ap.goals = ["Prevent the collapse of temporal seals.", "Find solutions to patch the vulnerabilities within the Archive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Manipulating control interfaces to stabilize temporal matrices.',
        ap.emotional_state = 'Agitated and urgent.',
        ap.emotional_tags = ["Agitated", "urgent."],
        ap.active_plans = ["Stabilize the temporal matrices as soon as possible", "Coordinate efforts to counteract the Entropy Syndicate's attack"],
        ap.beliefs = ["External intervention is necessary due to the complexity of the problem", "A comprehensive understanding of both technology and metaphysics is required to resolve the crisis"],
        ap.goals = ["Find a solution to prevent further temporal decay", "Seek assistance from someone with both technical and metaphysical expertise"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Monitoring quantum-state analyzer to assess temporal degradation.',
        ap.emotional_state = 'Concerned and analytical.',
        ap.emotional_tags = ["Concerned", "analytical."],
        ap.active_plans = ["Analyze temporal decay data for patterns", "Verify the extent of temporal seal degradation"],
        ap.beliefs = ["The temporal seals are failing faster than anticipated", "Understanding the nature of the decay is crucial to stopping it"],
        ap.goals = ["Preserve the integrity of the temporal data", "Determine how to stop further temporal degradation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Arriving in the TARDIS to assess the entropic cascade.',
        ap.emotional_state = 'Inquisitive and intrigued.',
        ap.emotional_tags = ["Inquisitive", "intrigued."],
        ap.active_plans = ["Investigate the cause of the entropic cascade", "Understand the motives behind the destruction attempt"],
        ap.beliefs = ["The architecture and technology of the Quantum Archive are exceptional", "Understanding the motivation behind the attack will be key to solving the issue"],
        ap.goals = ["Stop the entropic cascade from causing further damage", "Uncover the reasons behind the Entropy Syndicate's actions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Monitoring quantum-state analyzer as it alerts to incoming artron energy.',
        ap.emotional_state = 'Anxious and concerned about the integrity of the archive.',
        ap.emotional_tags = ["Anxious", "concerned about the integrity of the archive."],
        ap.active_plans = ["Analyze the current quantum state to assess damage", "Communicate findings to K'nell for strategic intervention"],
        ap.beliefs = ["Immediate action is required to prevent data loss", "The Entropy Syndicate poses a significant threat"],
        ap.goals = ["Secure and stabilize the temporal matrices", "Collaborate with The Doctor to understand and counteract the threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the Archive\'s primary systems to locate vulnerabilities.',
        ap.emotional_state = 'Agitated and defensive due to the breach.',
        ap.emotional_tags = ["Agitated", "defensive due to the breach."],
        ap.active_plans = ["Identify and patch the vulnerabilities exploited by the Entropy Syndicate", "Seek external help to bolster defenses"],
        ap.beliefs = ["The attack was a calculated exploitation of the Archive's weaknesses", "External expertise is necessary for resolution"],
        ap.goals = ["Restore and reinforce the Archive's temporal seals", "Prevent any further data degradation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Assessing the situation as the TARDIS materializes.',
        ap.emotional_state = 'Intrigued and alert to the unfolding crisis.',
        ap.emotional_tags = ["Intrigued", "alert to the unfolding crisis."],
        ap.active_plans = ["Diagnose the cause of the entropic cascade", "Evaluate the technological and metaphysical implications"],
        ap.beliefs = ["The situation demands both technological understanding and insight into motives", "Collaboration with the archivists is essential for success"],
        ap.goals = ["Resolve the entropic cascade affecting the timeline", "Preserve the integrity of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Analyzing temporal matrices and reacting to the alert from the quantum-state analyzer.',
        ap.emotional_state = 'Alarmed and focused.',
        ap.emotional_tags = ["Alarmed", "focused."],
        ap.active_plans = ["Assess the integrity of temporal seals", "Identify causes of temporal degradation"],
        ap.beliefs = ["The current readings indicate a significant threat", "Preventing data loss is critical for the archive"],
        ap.goals = ["Stop the temporal seals from degrading", "Preserve the Quantum Archive's data"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the Archive\'s primary systems to respond to the attack.',
        ap.emotional_state = 'Agitated and determined.',
        ap.emotional_tags = ["Agitated", "determined."],
        ap.active_plans = ["Counteract the Entropy Syndicate's attack vector", "Find solutions beyond current capabilities"],
        ap.beliefs = ["The Entropy Syndicate's precision in exploiting vulnerabilities is a major threat", "External intervention is necessary"],
        ap.goals = ["Protect the archive's integrity", "Seek assistance to address the attack"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-5'})
    ON CREATE SET
        ap.current_status = 'Emerging from the TARDIS and evaluating the entropic cascade situation.',
        ap.emotional_state = 'Curious and contemplative.',
        ap.emotional_tags = ["Curious", "contemplative."],
        ap.active_plans = ["Analyze the repercussions of the entropic cascade", "Determine why someone would want to destroy the archive"],
        ap.beliefs = ["Understanding the motivations behind the destruction is key", "Preserving the archive's architecture could provide insights"],
        ap.goals = ["Explore potential solutions to prevent further degradation", "Uncover the motives behind the attack"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-sonic_screwdriver-event-2-1'})
    ON CREATE SET
        oi.description = 'The Doctor uses the sonic screwdriver to examine the Archive\'s systems, investigating the spread and origin of the temporal virus.',
        oi.status_before = 'The sonic screwdriver is unused, ready to assist in system examinations.',
        oi.status_after = 'The sonic screwdriver continues to be a diagnostic tool after its examination of the systems.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_matrix-event-2-1'})
    ON CREATE SET
        oi.description = 'K\'nell interfaces with the primary control matrix to isolate code structures of the temporal virus and analyze its activity.',
        oi.status_before = 'The crystalline control matrix is functioning normally, part of the central core systems.',
        oi.status_after = 'The crystalline control matrix is actively involved in processing and isolating fragments of code from the temporal virus.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_matrix'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-1'})
    ON CREATE SET
        oi.description = 'Displays fragmented code patterns and temporal coordinates to illustrate the scope and details of the virus, aiding The Doctor and Dr. Chen in their analysis.',
        oi.status_before = 'The holographic display is inactive and not being utilized.',
        oi.status_after = 'The holographic display is actively used to show critical data regarding the temporal virus, enhancing understanding of its function.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-data_crystals-event-2-1'})
    ON CREATE SET
        oi.description = 'Central to the event as they are part of the Archive being compromised, showing signs of temporal decay due to the virus.',
        oi.status_before = 'The data crystals are in their usual state, storing and safeguarding historical data.',
        oi.status_after = 'The data crystals show clouded surfaces with temporal decay patterns, indicating damage and data risk.'
    WITH oi
    MATCH (o:Object {uuid: 'object-data_crystals'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_transmitter-event-2-1'})
    ON CREATE SET
        oi.description = 'Operated by Coordinator Voss to discreetly send information, suggesting clandestine communication or betrayal.',
        oi.status_before = 'The quantum transmitter is dormant, hidden within a crystalline badge.',
        oi.status_after = 'The quantum transmitter is used to initiate a discreet transmission, indicating Voss\'s possible ulterior motives.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_transmitter'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_matrix-event-2-2'})
    ON CREATE SET
        oi.description = 'K\'nell directly interfaces with the primary crystalline control matrix to isolate fragments of the virus\'s code structure.',
        oi.status_before = 'The crystalline control matrix is functioning as part of the control systems, unengaged by K\'nell.',
        oi.status_after = 'The crystalline control matrix is actively engaged by K\'nell, used to identify and analyze the virus\'s code fragments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_matrix'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-2'})
    ON CREATE SET
        oi.description = 'The holographic display materializes to show fragmented code patterns and temporal coordinates discovered by K\'nell.',
        oi.status_before = 'The holographic display is inactive, not projecting any information.',
        oi.status_after = 'The holographic display is active, presenting visual data of the virus\'s code and targeted temporal coordinates.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-sonic_screwdriver-event-2-2'})
    ON CREATE SET
        oi.description = 'The Doctor examines the central core systems using the sonic screwdriver to assess the damages and functionalities following the attack.',
        oi.status_before = 'The sonic screwdriver is in The Doctor\'s possession, not currently in use.',
        oi.status_after = 'The sonic screwdriver is being used by The Doctor to analyze system damages.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_transmitter-event-2-2'})
    ON CREATE SET
        oi.description = 'Coordinator Voss discretely activates a quantum transmitter hidden in their badge to potentially communicate or transmit data.',
        oi.status_before = 'The quantum transmitter is inactive, concealed within Coordinator Voss\'s badge.',
        oi.status_after = 'The quantum transmitter is stealthily activated by Coordinator Voss.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_transmitter'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-data_crystals-event-2-2'})
    ON CREATE SET
        oi.description = 'Massive data crystals within the Central Core are affected by temporal decay, disrupting their symmetry and functionality.',
        oi.status_before = 'The data crystals are part of the Central Core, presumably functioning normally prior to the temporal decay.',
        oi.status_after = 'The data crystals are deteriorating, showing temporal decay spreading over their surfaces, disrupting symmetry and possibly function.'
    WITH oi
    MATCH (o:Object {uuid: 'object-data_crystals'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-3'})
    ON CREATE SET
        oi.description = 'The holographic display materializes and shows fragmented code patterns and temporal coordinates, which The Doctor examines to realize the virus is searching for information on the Moment.',
        oi.status_before = 'The holographic display was inactive and not showing any data.',
        oi.status_after = 'The holographic display is active, presenting complex code patterns and temporal coordinates that reveal the search for information about the Moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-sonic_screwdriver-event-2-3'})
    ON CREATE SET
        oi.description = 'The Doctor uses the sonic screwdriver to examine the systems in the Central Core as part of the investigation into the temporal decay and the virus attack.',
        oi.status_before = 'The sonic screwdriver was not actively being used prior to this event.',
        oi.status_after = 'The sonic screwdriver has been used to interface with the systems in the Central Core, aiding in the investigation into the temporal virus.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_transmitter-event-2-3'})
    ON CREATE SET
        oi.description = 'Coordinator Voss discreetly activates a quantum transmitter hidden in their crystalline badge to potentially communicate or relay the ongoing situation to an external party.',
        oi.status_before = 'The quantum transmitter was inactive and concealed within Coordinator Voss\'s crystalline badge.',
        oi.status_after = 'The quantum transmitter has been activated, presumably to send or receive information related to the unfolding events.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_transmitter'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_matrix-event-2-3'})
    ON CREATE SET
        oi.description = 'K\'nell uses crystalline appendages to directly interface with the primary control matrix, aiding in the isolation of virus code fragments.',
        oi.status_before = 'The crystalline control matrix was functioning as part of the central system, not currently directly interfaced with.',
        oi.status_after = 'The crystalline control matrix is interfaced by K\'nell; it plays an active role in analyzing and isolating the virus code fragments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_matrix'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-data_crystals-event-2-3'})
    ON CREATE SET
        oi.description = 'The central core\'s data crystals show signs of temporal decay, displaying discordant patterns indicating the spread of the virus.',
        oi.status_before = 'The data crystals were intact, holding historical records.',
        oi.status_after = 'The data crystals are affected by temporal decay, with spreading discordant patterns due to the virus attack.'
    WITH oi
    MATCH (o:Object {uuid: 'object-data_crystals'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_transmitter-event-2-4'})
    ON CREATE SET
        oi.description = 'Coordinator Voss activates the quantum transmitter hidden in their crystalline badge to sends signals or information covertly, suggesting potential treachery or dual-allegiance.',
        oi.status_before = 'The quantum transmitter was inactive and concealed within the badge.',
        oi.status_after = 'The quantum transmitter was surreptitiously activated and began transmitting an unknown signal or message.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_transmitter'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-sonic_screwdriver-event-2-4'})
    ON CREATE SET
        oi.description = 'The Doctor uses their sonic screwdriver to examine the central core systems, attempting to assess and understand the temporal decay affecting the data crystals.',
        oi.status_before = 'The sonic screwdriver was inactive, presumably stored or carried by The Doctor.',
        oi.status_after = 'The sonic screwdriver was actively scanning or interacting with the central core systems.'
    WITH oi
    MATCH (o:Object {uuid: 'object-sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-4'})
    ON CREATE SET
        oi.description = 'A holographic display materializes to show the fragmented code patterns and temporal coordinates related to the temporal virus.',
        oi.status_before = 'The holographic display was inactive and not visible in the scene.',
        oi.status_after = 'The holographic display was active, presenting crucial information about the temporal virus and its targets.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-2-4'})
    ON CREATE SET
        oi.description = 'K\'nell uses their crystalline appendages to interface directly with a primary control matrix, aiding in the isolation of the virus code fragments.',
        oi.status_before = 'The crystalline control interfaces were inactive and not directly utilized.',
        oi.status_after = 'The crystalline control interfaces were actively used as a conduit for K\'nell\'s examination of the virus code fragments.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Monitoring degradation patterns and explaining the nature of the attack to The Doctor.',
        ap.emotional_state = 'Concerned and focused.',
        ap.emotional_tags = ["Concerned", "focused."],
        ap.active_plans = ["Assess the impact of the temporal virus on historical records", "Collaborate with The Doctor and K'nell to find a solution"],
        ap.beliefs = ["The Archive's data integrity is critical", "The temporal virus poses a significant threat"],
        ap.goals = ["Protect and restore historical records", "Neutralize the temporal virus"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the control matrix and analyzing code structures.',
        ap.emotional_state = 'Analytical and diligent.',
        ap.emotional_tags = ["Analytical", "diligent."],
        ap.active_plans = ["Isolate fragments of the virus code structure", "Determine the virus's objectives and temporal targets"],
        ap.beliefs = ["Thorough data analysis will uncover the virus's purpose", "Maintaining connection to the control matrix is vital for data integrity"],
        ap.goals = ["Decrypt and understand the virus code", "Prevent further spread of the temporal decay"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Examining systems with sonic screwdriver and analyzing the holographic display.',
        ap.emotional_state = 'Gravely concerned and intrigued.',
        ap.emotional_tags = ["Gravely concerned", "intrigued."],
        ap.active_plans = ["Determine the source and purpose of the temporal virus", "Assess the implications of the virus searching for the Moment"],
        ap.beliefs = ["The Moment records should have been inaccessible", "Understanding the virus's search parameters is crucial"],
        ap.goals = ["Prevent the virus from accessing classified Time War data", "Ensure security and stability of temporal records"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Observing from the shadows and discreetly activating a quantum transmitter.',
        ap.emotional_state = 'Calculating and possibly secretive.',
        ap.emotional_tags = ["Calculating", "possibly secretive."],
        ap.active_plans = ["Monitor the unfolding situation undetected", "Communicate developments using quantum transmitter"],
        ap.beliefs = ["Maintaining discretion is key", "The information relayed via the transmitter may serve a greater purpose"],
        ap.goals = ["Remain undetected by others", "Communicate critical information to their organization"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the primary control matrix to report virus code structure.',
        ap.emotional_state = 'Focused and analytical.',
        ap.emotional_tags = ["Focused", "analytical."],
        ap.active_plans = ["Isolate fragments of the virus's code structure."],
        ap.beliefs = ["Understanding the virus code is crucial to mitigating the threat."],
        ap.goals = ["Identify the purpose and target of the temporal virus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Examining fragmented code patterns and temporal coordinates.',
        ap.emotional_state = 'Gravely concerned.',
        ap.emotional_tags = ["Gravely concerned."],
        ap.active_plans = ["Investigate the virus's target temporal coordinates."],
        ap.beliefs = ["The virus seeks dangerous information about the Moment.", "The records about the Moment were supposed to be secure."],
        ap.goals = ["Prevent the virus from accessing records of the Moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Examining holographic display with sonic screwdriver to understand the virus.',
        ap.emotional_state = 'Gravely concerned upon realizing the virus seeks the Moment.',
        ap.emotional_tags = ["Gravely concerned upon realizing the virus seeks the Moment."],
        ap.active_plans = ["Determine the intent and capabilities of the temporal virus", "Protect the information related to the Moment from being accessed"],
        ap.beliefs = ["The records of the Moment should remain sealed and destroyed", "Understanding the virus will help in mitigating its threat"],
        ap.goals = ["Ensure the Moment's information remains out of unauthorized reach", "Analyze and counteract the virus searching the historical records"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Monitoring degradation patterns caused by the virus.',
        ap.emotional_state = 'Cautiously analytical about the virus’s sophistication.',
        ap.emotional_tags = ["Cautiously analytical about the virus\u2019s sophistication."],
        ap.active_plans = ["Continuously monitor the extent of the temporal decay", "Work collaboratively with The Doctor to analyze the virus"],
        ap.beliefs = ["The temporal virus is a significant threat requiring immediate attention", "Collaboration is essential to understand the virus fully"],
        ap.goals = ["Help prevent the temporal records from being altered", "Develop a strategy to neutralize the temporal virus"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the primary control matrix to isolate virus code fragments.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Isolate and analyze the fragments of the virus\u2019s code"],
        ap.beliefs = ["Understanding the virus\u2019s structure is crucial in counteracting it"],
        ap.goals = ["Support the Archive\u2019s efforts to stop the virus", "Ensure stability in the Archive's systems"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Discreetly activating a quantum transmitter from the shadows.',
        ap.emotional_state = 'Stealthy and possibly conspiratorial.',
        ap.emotional_tags = ["Stealthy", "possibly conspiratorial."],
        ap.active_plans = ["Communicate discreetly using the quantum transmitter"],
        ap.beliefs = ["Keeping actions hidden is crucial"],
        ap.goals = ["Secretly relay information to an unknown party"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Discretely activating a quantum transmitter hidden in their badge.',
        ap.emotional_state = 'Calm and calculated.',
        ap.emotional_tags = ["Calm", "calculated."],
        ap.active_plans = ["Communicate covertly using the quantum transmitter."],
        ap.beliefs = ["The situation requires discreet action.", "Information about the Moment is crucial."],
        ap.goals = ["Successfully relay information through the quantum transmitter.", "Possibly further undisclosed objectives related to the transmitter activation."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-1'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms sound throughout the facility, alerting personnel to the multiple fractures in spacetime.',
        oi.status_before = 'The temporal breach alarms were inactive and silent.',
        oi.status_after = 'The temporal breach alarms are activated, signaling ongoing breaches in the facility.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-1'})
    ON CREATE SET
        oi.description = 'Multiple points of spacetime fracture and crackle with entropic energy, allowing Entropy Syndicate operatives, including Director Malik, to emerge.',
        oi.status_before = 'Spacetime was stable and unfractured.',
        oi.status_after = 'Spacetime is fractured and crackling with entropic energy, with breaches allowing movement between them.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-1'})
    ON CREATE SET
        oi.description = 'Entropy Syndicate operatives are equipped with armor designed to resist temporal feedback as they emerge from the breaches.',
        oi.status_before = 'The Entropy Syndicate armor was worn by operatives, yet unutilized in the conflict.',
        oi.status_after = 'The Entropy Syndicate armor is actively used to resist the effects of temporal feedback during the breach.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-1'})
    ON CREATE SET
        oi.description = 'Director Malik enters through the largest breach, armed with temporal weapons prepared for confrontation.',
        oi.status_before = 'The temporal weapons were primed and ready for use but unengaged.',
        oi.status_after = 'The temporal weapons remain ready and are used to secure the facility by Director Malik\'s order.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-1'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the central control nexus to activate emergency protocols and respond to the breach.',
        oi.status_before = 'The central control nexus was monitoring facility status under normal operations.',
        oi.status_after = 'The central control nexus is under heavy manipulation as The Doctor responds to the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-2'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms sound throughout the facility, indicating multiple spacetime fractures.',
        oi.status_before = 'The temporal breach alarms were inactive, as the facility was in a stable temporal state.',
        oi.status_after = 'The temporal breach alarms have been activated, signaling the presence of spacetime breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-2'})
    ON CREATE SET
        oi.description = 'Spacetime breaches appear throughout the facility, crackling with entropic energy and allowing Entropy Syndicate operatives to emerge.',
        oi.status_before = 'Spacetime was stable and unfractured, maintaining the integrity of the facility.',
        oi.status_after = 'Spacetime fractures are present, providing access points for Entropy Syndicate operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-2'})
    ON CREATE SET
        oi.description = 'The Entropy Syndicate operatives wear armor designed to resist temporal feedback as they emerge from the spacetime breaches.',
        oi.status_before = 'The armor was on standby, not yet in use for temporal incursions.',
        oi.status_after = 'The armor is actively being used by operatives to safely navigate through temporal breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-2'})
    ON CREATE SET
        oi.description = 'Director Malik enters through the largest breach with temporal weapons primed, ready to secure the facility.',
        oi.status_before = 'The temporal weapons were unused, prepared for potential deployment.',
        oi.status_after = 'The temporal weapons are primed and ready for engagement, signifying an imminent threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-2'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the central control nexus to manage the emerging crisis.',
        oi.status_before = 'The central control nexus was functioning normally, overseeing the facility\'s operations.',
        oi.status_after = 'The central control nexus is under intense use by The Doctor to handle the security breach.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-3'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms sound throughout the facility, indicating the multiple points of spacetime fractures and alerting the Quantum Archive team to the ongoing incursion by the Entropy Syndicate.',
        oi.status_before = 'The temporal breach alarms were inactive, signaling no immediate threats to spacetime integrity.',
        oi.status_after = 'The temporal breach alarms continue to sound, maintaining a state of alertness to indicate unresolved breaches and ongoing threats.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-3'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the central control nexus, attempting to stabilize the temporal breaches and manage the unfolding crisis caused by the Entropy Syndicate\'s aggressive maneuvers.',
        oi.status_before = 'The central control nexus was presumably operational and stable, controlling security and temporal functions.',
        oi.status_after = 'The central control nexus is engaged actively in crisis management, with the Doctor\'s immediate intervention ongoing.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-3'})
    ON CREATE SET
        oi.description = 'Multiple spacetime breaches occur as a result of the Entropy Syndicate\'s incursion, allowing operatives to enter and execute their plan to seize control of the Quantum Archive.',
        oi.status_before = 'Spacetime was intact with no detectable breaches or fractures present.',
        oi.status_after = 'Spacetime breaches continue to exist, exacerbated by the Entropy Syndicate\'s actions and posing an ongoing threat to be resolved.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-3'})
    ON CREATE SET
        oi.description = 'Entropy Syndicate operatives wear specially designed armor as they emerge from spacetime breaches. The armor is adapted to handle temporal feedback, allowing them to withstand temporal anomalies.',
        oi.status_before = 'The armor was likely stored with the operatives, ready for deployment and providing protection against potential temporal disturbances.',
        oi.status_after = 'The armor is actively in use by Entropy Syndicate operatives during the incursion, providing sustained protection against temporal feedback.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-3'})
    ON CREATE SET
        oi.description = 'Director Malik arrives through the largest breach, armed with temporal weapons, poised to secure the facility and enforce the Entropy Syndicate\'s objectives.',
        oi.status_before = 'Temporal weapons were likely prepared off-screen, armed and in transport before the breach.',
        oi.status_after = 'The temporal weapons remain active and ready for deployment by Director Malik and his operatives within the facility.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-4'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the central control nexus in an attempt to counteract Coordinator Voss\'s efforts to disable the containment fields and prevent the Entropy Syndicate\'s takeover.',
        oi.status_before = 'The central control nexus is operational, maintaining the facility\'s containment fields.',
        oi.status_after = 'The central control nexus is under immediate threat as Voss attempts to disable it, putting the facility at risk of losing containment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-4'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms sound throughout the facility, alerting all personnel to multiple breaches caused by Coordinator Voss\'s actions.',
        oi.status_before = 'The temporal breach alarms are inactive, the facility secure.',
        oi.status_after = 'The temporal breach alarms are active, signaling the presence of spacetime fractures and unauthorized entries.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-4'})
    ON CREATE SET
        oi.description = 'Spacetime breaches occur as a direct result of Coordinator Voss\'s attempt to disable the containment fields, allowing Entropy Syndicate operatives to enter the facility.',
        oi.status_before = 'The spacetime continuum is stable with no active breaches.',
        oi.status_after = 'Multiple spacetime breaches are open, leading to the facility being compromised by Entropy Syndicate operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-4'})
    ON CREATE SET
        oi.description = 'Entropy Syndicate operatives emerge from the spacetime breaches wearing armor designed to resist temporal feedback, enabling them to secure the facility.',
        oi.status_before = 'The armor is worn by Entropy Syndicate operatives, unseen within another timeframe.',
        oi.status_after = 'The armor is active and operational, worn by operatives within the facility, facilitating their hostile takeover.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-4'})
    ON CREATE SET
        oi.description = 'Director Malik arrives with temporal weapons primed, indicating a readiness to engage and control the Quantum Archive forcefully.',
        oi.status_before = 'The temporal weapons are primed and in possession of Director Malik.',
        oi.status_after = 'The temporal weapons remain with Director Malik, their threat being an active component of the Entropy Syndicate\'s incursion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-5'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms sound throughout the facility, alerting everyone to multiple points of spacetime fracturing and the arrival of Entropy Syndicate operatives.',
        oi.status_before = 'The alarms were silent as there were no active breaches.',
        oi.status_after = 'The alarms are active, indicating multiple spacetime breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-5'})
    ON CREATE SET
        oi.description = 'Spacetime breaches occur throughout the facility, crackling with entropic energy, allowing Entropy Syndicate operatives to enter.',
        oi.status_before = 'The spacetime fabric was stable without any breaches.',
        oi.status_after = 'Multiple spacetime breaches are active, distorting the spacetime fabric.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-5'})
    ON CREATE SET
        oi.description = 'Entropy Syndicate operatives use armor designed to resist temporal feedback as they emerge from the spacetime breaches.',
        oi.status_before = 'Entropy Syndicate armor was with operatives, unused.',
        oi.status_after = 'The armor is activated and in use by operatives to resist temporal feedback.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-5'})
    ON CREATE SET
        oi.description = 'Director Malik enters through the largest spacetime breach with temporal weapons primed, indicating readiness for offensive action.',
        oi.status_before = 'The temporal weapons were unprimed and inactive.',
        oi.status_after = 'The weapons are primed and ready for use by Director Malik.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-5'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the central control nexus to respond to the unfolding crisis and maintain the facility\'s stability.',
        oi.status_before = 'The central control nexus was in a stable state managing routine operations.',
        oi.status_after = 'The nexus is actively being controlled by The Doctor to manage the emergency situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_breach_alarms-event-3-6'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms are triggered throughout the facility, indicating multiple spacetime fractures occurring simultaneously.',
        oi.status_before = 'The temporal breach alarms were inactive as the facility was secure.',
        oi.status_after = 'The temporal breach alarms are actively alerting the facility to the spacetime fractures.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event-3-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-spacetime_breaches-event-3-6'})
    ON CREATE SET
        oi.description = 'Spacetime breaches represent the fracturing of spacetime points, allowing Entropy Syndicate operatives to emerge, facilitated by the energy crackling through them.',
        oi.status_before = 'The spacetime breaches were non-existent, maintaining the integrity of spacetime.',
        oi.status_after = 'The spacetime breaches have appeared, destabilizing the environment and granting access to the operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object-spacetime_breaches'})
    MATCH (e:Event {uuid: 'event-3-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-entropy_syndicate_armor-event-3-6'})
    ON CREATE SET
        oi.description = 'Entropy Syndicate operatives wear armor designed to resist temporal feedback, allowing them to function within the destabilized spacetime environment.',
        oi.status_before = 'The Entropy Syndicate armor was dormant, not in use.',
        oi.status_after = 'The Entropy Syndicate armor is active, protecting operatives against temporal feedback.'
    WITH oi
    MATCH (o:Object {uuid: 'object-entropy_syndicate_armor'})
    MATCH (e:Event {uuid: 'event-3-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_weapons-event-3-6'})
    ON CREATE SET
        oi.description = 'Director Malik\'s temporal weapons are primed as he steps through the largest breach, indicating his readiness to take control of the facility.',
        oi.status_before = 'The temporal weapons were unprimed, held in reserve.',
        oi.status_after = 'The temporal weapons are primed and ready for use in asserting control over the facility.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_weapons'})
    MATCH (e:Event {uuid: 'event-3-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-central_control_nexus-event-3-6'})
    ON CREATE SET
        oi.description = 'The Doctor works at the central control nexus in an attempt to counteract the breach events and manage the facility’s response to the threat.',
        oi.status_before = 'The central control nexus was operational but not under duress.',
        oi.status_after = 'The central control nexus is under heavy use as The Doctor attempts to manage the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-central_control_nexus'})
    MATCH (e:Event {uuid: 'event-3-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Stepping through the largest breach with temporal weapons ready, instructing operatives to secure the facility.',
        ap.emotional_state = 'Determined and authoritative.',
        ap.emotional_tags = ["Determined", "authoritative."],
        ap.active_plans = ["Secure the Quantum Archive facility", "Exploit the Archive's knowledge for greater purpose"],
        ap.beliefs = ["The Archive's secrets will lead to powerful insights from the Time War", "Knowledge must be leveraged to reshape destinies"],
        ap.goals = ["Acquire the secrets of the Time War", "Harness the Quantum Archive's knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus, trying to prevent catastrophe.',
        ap.emotional_state = 'Frantic yet focused.',
        ap.emotional_tags = ["Frantic yet focused."],
        ap.active_plans = ["Stabilize the spacetime breaches", "Prevent misuse of potentially catastrophic knowledge"],
        ap.beliefs = ["The Moment was more than a weapon; it was a force of judgment and consciousness", "Only with proper understanding can the dangers of time be neutralized"],
        ap.goals = ["Protect the integrity of the spacetime continuum", "Stop the Entropy Syndicate from seizing power"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols in response to the breaches.',
        ap.emotional_state = 'Alert and analytical.',
        ap.emotional_tags = ["Alert", "analytical."],
        ap.active_plans = ["Implement emergency protocols", "Contain the virus pattern within safe parameters"],
        ap.beliefs = ["This situation requires a strategic response", "Understanding the virus pattern is critical to containment"],
        ap.goals = ["Maintain the facility's security", "Decipher the virus pattern and its implications"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Assisting in the coordination of emergency protocols.',
        ap.emotional_state = 'Focused and collaborative.',
        ap.emotional_tags = ["Focused", "collaborative."],
        ap.active_plans = ["Support Dr. Chen in emergency measures", "Assess the structural integrity of temporal matrices"],
        ap.beliefs = ["Teamwork is essential in crisis situations", "Preserving the Archive is a shared responsibility"],
        ap.goals = ["Ensure structural stability of critical systems", "Aid in the containment and repair processes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance by attempting to disable containment fields.',
        ap.emotional_state = 'Defiant and resolute.',
        ap.emotional_tags = ["Defiant", "resolute."],
        ap.active_plans = ["Disable containment fields undermining facility security", "Facilitate temporal breaches to assist Entropy Syndicate"],
        ap.beliefs = ["The Entropy Syndicate's vision aligns with personal values", "The Quantum Archive's potential must be unleashed"],
        ap.goals = ["Undermine Quantum Archive's defenses", "Ensure the success of Director Malik's mission"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Issuing orders for the Entropy Syndicate operatives to secure the facility with temporal weapons at the ready.',
        ap.emotional_state = 'Determined and ambitious.',
        ap.emotional_tags = ["Determined", "ambitious."],
        ap.active_plans = ["Secure control over the facility", "Utilize the Archive's knowledge for a grander scheme related to the Time War"],
        ap.beliefs = ["The Archive\u2019s knowledge holds the key to untold power", "Seizing the secrets of the Time War will elevate their standing"],
        ap.goals = ["Claim the secrets of the Time War", "Use the Archive's resources to achieve greater influence and control"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus, warning about the true nature of \'The Moment\'.',
        ap.emotional_state = 'Urgent and distressed.',
        ap.emotional_tags = ["Urgent", "distressed."],
        ap.active_plans = ["Prevent the Entropy Syndicate from accessing dangerous knowledge", "Stabilize the temporal breach situations"],
        ap.beliefs = ["The Moment was a conscious entity capable of passing judgment", "Understanding and controlling time is delicate and dangerous if mishandled"],
        ap.goals = ["Protect the timeline from potential catastrophic changes", "Stop the Entropy Syndicate from exploiting the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols while analyzing a viral pattern that is assembling something across timeline nodes.',
        ap.emotional_state = 'Focused but concerned.',
        ap.emotional_tags = ["Focused but concerned."],
        ap.active_plans = ["Implement emergency protocols", "Identify the nature and intent of the viral pattern"],
        ap.beliefs = ["The viral pattern poses a significant threat across timelines", "Immediate analysis and response can mitigate potential disaster"],
        ap.goals = ["Protect the integrity of the timeline", "Understand and neutralize the viral threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Assisting Dr. Chen in coordinating emergency protocols to address the unfolding crisis.',
        ap.emotional_state = 'Alert and strategic.',
        ap.emotional_tags = ["Alert", "strategic."],
        ap.active_plans = ["Assist in implementing emergency safety measures", "Support analysis of the viral pattern to determine its implications"],
        ap.beliefs = ["Collaborative effort is necessary for effective crisis management", "Understanding events in real-time is crucial for strategy"],
        ap.goals = ["Contribute to stabilizing the temporal breaches", "Support overall team efforts to protect the Quantum Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance to Entropy Syndicate and moving to disable containment fields.',
        ap.emotional_state = 'Deceptive and resolute.',
        ap.emotional_tags = ["Deceptive", "resolute."],
        ap.active_plans = ["Assist in securing the facility for Entropy Syndicate", "Compromise containment fields to further the Syndicate\u2019s goals"],
        ap.beliefs = ["The Entropy Syndicate's goals are paramount", "Achieving success requires betrayal and subterfuge"],
        ap.goals = ["Aid in gaining unrestricted access to the Archive's knowledge", "Ensure the Entropy Syndicate's dominance in the current crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus.',
        ap.emotional_state = 'Urgent and apprehensive.',
        ap.emotional_tags = ["Urgent", "apprehensive."],
        ap.active_plans = ["Prevent the Entropy Syndicate from seizing control of the facility.", "Maintain containment of the spacetime breaches.", "Convey the severity of the situation to Dr. Chen and K'nell."],
        ap.beliefs = ["The Moment holds significant power as a conscious judgement across time.", "The Entropy Syndicate doesn\u2019t comprehend the magnitude of the threat they pose."],
        ap.goals = ["Protect the temporal integrity of the Quantum Archive.", "Ensure that the Entropy Syndicate is unable to acquire knowledge of the Time War."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with K\'nell.',
        ap.emotional_state = 'Focused and analytical.',
        ap.emotional_tags = ["Focused", "analytical."],
        ap.active_plans = ["Analyze the virus pattern affecting the timeline nodes.", "Collaborate with The Doctor to counteract the emerging threat."],
        ap.beliefs = ["The virus is assembling something potentially dangerous across timelines.", "Collaboration with The Doctor is essential to managing the crisis."],
        ap.goals = ["Identify the nature and purpose of the virus pattern.", "Secure the Quantum Archive against the Entropy Syndicate\u2019s incursion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with Dr. Chen.',
        ap.emotional_state = 'Determined and vigilant.',
        ap.emotional_tags = ["Determined", "vigilant."],
        ap.active_plans = ["Implement security measures to counteract the breach.", "Assist in managing the emergency to protect the facility."],
        ap.beliefs = ["Immediate action is necessary to protect the Quantum Archive.", "Working with Dr. Chen and The Doctor is crucial to crisis management."],
        ap.goals = ["Maintain the security and stability of the Quantum Archive.", "Support collaborative efforts to neutralize the Entropy Syndicate threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance and attempting to disable containment fields.',
        ap.emotional_state = 'Resolute and deceptive.',
        ap.emotional_tags = ["Resolute", "deceptive."],
        ap.active_plans = ["Aid the Entropy Syndicate in gaining control of the facility.", "Disable containment fields to facilitate the Syndicate's incursion."],
        ap.beliefs = ["The Syndicate's acquisition of the Archive's knowledge is justified.", "Secrecy and deception are necessary for achieving long-term goals."],
        ap.goals = ["Ensure the success of the Entropy Syndicate's mission.", "Undermine the Quantum Archive\u2019s defenses."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Commanding the Entropy Syndicate operatives to secure the facility.',
        ap.emotional_state = 'Confident and assertive.',
        ap.emotional_tags = ["Confident", "assertive."],
        ap.active_plans = ["Direct the operatives in securing the Quantum Archive.", "Access the Archive\u2019s temporal knowledge about the Time War."],
        ap.beliefs = ["The knowledge of the Time War must serve a greater purpose.", "The Entropy Syndicate's objectives are of paramount importance."],
        ap.goals = ["Successfully acquire the Archive's knowledge.", "Utilize temporal information to further the Entropy Syndicate's cause."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Revealing allegiance to Entropy Syndicate and moving to disable the containment fields.',
        ap.emotional_state = 'Resolute and determined.',
        ap.emotional_tags = ["Resolute", "determined."],
        ap.active_plans = ["Disable the containment fields"],
        ap.beliefs = ["The Archive's knowledge should serve the Entropy Syndicate's agenda"],
        ap.goals = ["Assist Entropy Syndicate in securing the facility", "Ensure the successful takeover of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus.',
        ap.emotional_state = 'Desperate and concerned.',
        ap.emotional_tags = ["Desperate", "concerned."],
        ap.active_plans = ["Prevent the Entropy Syndicate from taking control"],
        ap.beliefs = ["The Moment is a consciousness passing judgment", "Stopping the Entropy Syndicate is crucial"],
        ap.goals = ["Protect the integrity of the Archive", "Prevent the Entropy Syndicate from harnessing dangerous knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with K\'nell.',
        ap.emotional_state = 'Focused and urgent.',
        ap.emotional_tags = ["Focused", "urgent."],
        ap.active_plans = ["Activate emergency protocols"],
        ap.beliefs = ["The virus pattern is assembling something across timeline nodes"],
        ap.goals = ["Ensure the Archive's protocols mitigate the breach", "Uncover the nature of the assembly pattern"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with Dr. Chen.',
        ap.emotional_state = 'Determined and alert.',
        ap.emotional_tags = ["Determined", "alert."],
        ap.active_plans = ["Support Dr. Chen in activating defense mechanisms"],
        ap.beliefs = ["The facility's defenses must be activated immediately"],
        ap.goals = ["Ensure the Archive's protection", "Collaborate with Sarah Chen to contain the threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus.',
        ap.emotional_state = 'Urgent and alarmed.',
        ap.emotional_tags = ["Urgent", "alarmed."],
        ap.active_plans = ["Stop the Entropy Syndicate's incursion", "Warn others about the true nature of 'The Moment'"],
        ap.beliefs = ["The Moment is more than a weapon; it's a sentient entity with immense power", "Immediate action is needed to prevent disaster"],
        ap.goals = ["Protect the continuum from Entropy Syndicate", "Ensure the containment fields remain intact"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with K\'nell.',
        ap.emotional_state = 'Focused and analytical.',
        ap.emotional_tags = ["Focused", "analytical."],
        ap.active_plans = ["Implement emergency protocols", "Analyze the virus pattern detected"],
        ap.beliefs = ["The virus represents a serious temporal threat", "Collaborative response is crucial to managing the crisis"],
        ap.goals = ["Secure the facility against breaches", "Understand the virus's purpose in assembling timeline nodes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Assisting in coordinating emergency protocols.',
        ap.emotional_state = 'Strategically concerned.',
        ap.emotional_tags = ["Strategically concerned."],
        ap.active_plans = ["Support Sarah Chen's efforts", "Ensure the crystalline interfaces aid in managing breaches"],
        ap.beliefs = ["The Archive's protocols are key to containment", "Technological prowess can mitigate certain threats"],
        ap.goals = ["Stabilize the temporal framework", "Preserve the integrity of the facility's defenses"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance by disabling the containment fields.',
        ap.emotional_state = 'Determined and resolute.',
        ap.emotional_tags = ["Determined", "resolute."],
        ap.active_plans = ["Subvert the facility's security measures", "Aid the Entropy Syndicate's agenda"],
        ap.beliefs = ["The Entropy Syndicate's purposes align with personal goals", "Seizing control of the Archive's resources is essential"],
        ap.goals = ["Ensure successful acquisition of the Time War secrets", "Facilitate the Entropy Syndicate's strategic objectives"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Leading the Entropy Syndicate operatives to secure the facility.',
        ap.emotional_state = 'Confident and commanding.',
        ap.emotional_tags = ["Confident", "comm", "ing."],
        ap.active_plans = ["Oversee the operation to control the Archive", "Deploy temporal weapons effectively"],
        ap.beliefs = ["The Archive's knowledge is vital to their cause", "The Entropy Syndicate's mission supersedes others"],
        ap.goals = ["Gain control over the Archive's knowledge base", "Achieve supremacy through understanding of the Time War"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-6'})
    ON CREATE SET
        ap.current_status = 'Informing The Doctor of the virus pattern\'s true nature.',
        ap.emotional_state = 'Urgent and concerned.',
        ap.emotional_tags = ["Urgent", "concerned."],
        ap.active_plans = ["Analyze virus pattern for threat potential", "Coordinate emergency protocols with K'nell"],
        ap.beliefs = ["The virus is capable of assembling dangerous entities across timelines", "Collaborative efforts are crucial to mitigate the threat"],
        ap.goals = ["Prevent the assembly of any potentially dangerous entity", "Safeguard the Quantum Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-6'})
    ON CREATE SET
        ap.current_status = 'Warning about the dangers of the Moment and working at the central control nexus.',
        ap.emotional_state = 'Frantic and alarmed.',
        ap.emotional_tags = ["Frantic", "alarmed."],
        ap.active_plans = ["Manage control nexus to prevent temporal breaches", "Contain the threat by disabling Entropy Syndicate operations"],
        ap.beliefs = ["The Moment's judgment is a grave threat to all of time and space", "Stopping the Entropy Syndicate is critical to preventing disaster"],
        ap.goals = ["Secure the facility against breaches", "Prevent Entropy Syndicate from exploiting temporal knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-6'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols with Dr. Chen.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Implement emergency protocols swiftly", "Assist Dr. Chen in threat analysis"],
        ap.beliefs = ["The integrity of spacetime is at serious risk", "Coordinated response is essential to counteract the breaches"],
        ap.goals = ["Ensure the facility operates under secure protocols", "Protect the Quantum Archive's integrity"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-4-1'})
    ON CREATE SET
        oi.description = 'The TARDIS, interfaced with the Archive\'s systems, pulses with stabilizing energy, indicating its role in managing and balancing the temporal anomalies within the Archive.',
        oi.status_before = 'The TARDIS was interfaced with the Archive\'s systems, ready to stabilize temporal disruptions.',
        oi.status_after = 'The TARDIS continues to pulse with stabilizing energy, suggesting it successfully maintained temporal balance.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-4-1'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer displays critical pattern convergence, signaling a major shift in the temporal dynamics within the scene.',
        oi.status_before = 'The quantum analyzer was awaiting data input from the system.',
        oi.status_after = 'The quantum analyzer shows evidence of critical pattern convergence, confirming changes in temporal dynamics.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-4-1'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form starts to fracture as they channel purging protocols through their matrix, highlighting the strain exerted on their physical form due to intense activity.',
        oi.status_before = 'K\'nell\'s crystalline form was intact, prepared to conduct purging protocols.',
        oi.status_after = 'K\'nell\'s crystalline form is now fractured, indicating structural damage from the exerted purging protocols.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-4-1'})
    ON CREATE SET
        oi.description = 'The Archive\'s crystals resonate in harmony with the awakening temporal consciousness, marking their role as a medium for temporal resonance.',
        oi.status_before = 'The Archive crystals were dormant, under the influence of the Archive\'s latent energy.',
        oi.status_after = 'The Archive crystals are now resonating, actively harmonizing with the awakened temporal consciousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-4-2'})
    ON CREATE SET
        oi.description = 'The TARDIS, interfaced with the Archive\'s systems, pulses with stabilizing energy to help manage the temporal breach.',
        oi.status_before = 'The TARDIS was interfaced with the Archive\'s systems, possibly in standby mode.',
        oi.status_after = 'The TARDIS continues to pulse with stabilizing energy, aiding in addressing the temporal anomaly.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-4-2'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form begins to fracture as they channel purging protocols through their matrix as part of managing the systems breach.',
        oi.status_before = 'K\'nell\'s crystalline form was intact and functioning normally.',
        oi.status_after = 'K\'nell\'s crystalline form shows signs of strain, indicated by fracturing due to the purging protocols.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-4-2'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer indicates critical pattern convergence, reflecting the approaching culmination of temporal instability.',
        oi.status_before = 'The quantum analyzer was operational and monitoring temporal parameters.',
        oi.status_after = 'The quantum analyzer displays readings of critical pattern convergence, suggesting significant temporal events unfolding.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-4-2'})
    ON CREATE SET
        oi.description = 'The Archive\'s crystals resonate in harmony with the newly formed consciousness of pure chronometric energy.',
        oi.status_before = 'The Archive\'s crystals were static, part of the larger Archive system.',
        oi.status_after = 'The Archive\'s crystals are resonating harmoniously with the emergent temporal consciousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-4-3'})
    ON CREATE SET
        oi.description = 'The TARDIS interfaces with the Archive\'s systems to stabilize energy during the awakening of the Moment\'s power.',
        oi.status_before = 'The TARDIS is operational, interfacing with the Archive\'s systems.',
        oi.status_after = 'The TARDIS remains a conduit in stabilizing the temporal energies unleashing the Moment\'s power.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-4-3'})
    ON CREATE SET
        oi.description = 'K\'nell\'s crystalline form fractures as they channel purging protocols through their matrix during the Moment\'s awakening.',
        oi.status_before = 'K\'nell\'s crystalline form is intact, utilized for channeling protocols.',
        oi.status_after = 'K\'nell\'s crystalline form shows signs of fracturing under the strain of channeling the purging protocols.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_state_analyzer-event-4-3'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer displays critical pattern convergence as the Moment\'s power awakens.',
        oi.status_before = 'The quantum analyzer is monitoring temporal patterns under Dr. Chen\'s guidance.',
        oi.status_after = 'The quantum analyzer indicates that the temporal patterns have converged critically, aligning with the Moment\'s awakening.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-4-3'})
    ON CREATE SET
        oi.description = 'The Archive\'s crystals resonate in harmony with the awakening of the Moment\'s power, amplifying the shimmering consciousness of chronometric energy.',
        oi.status_before = 'The Archive\'s crystals are part of the Archive\'s system, perhaps dormant.',
        oi.status_after = 'The Archive\'s crystals are resonating, contributing to the unfolding manifestations of time\'s awakening.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Using the quantum analyzer to monitor temporal dynamics as critical pattern convergence occurs.',
        ap.emotional_state = 'Alert and concerned.',
        ap.emotional_tags = ["Alert", "concerned."],
        ap.active_plans = ["Analyze the temporal shift for actionable data", "Support K'nell and The Doctor in stabilizing the situation"],
        ap.beliefs = ["Monitoring the temporal dynamics is crucial", "K'nell and The Doctor's interventions are vital to restore stability"],
        ap.goals = ["Ensure the quantum analyzer continues to function properly", "Understand the implications of the pattern convergence"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through their matrix, causing their crystalline form to fracture.',
        ap.emotional_state = 'Intense focus and determination.',
        ap.emotional_tags = ["Intense focus", "determination."],
        ap.active_plans = ["Stabilize the temporal core by channeling purging protocols", "Use personal matrix and crystalline form to counteract destabilization"],
        ap.beliefs = ["Execution of purging protocols is necessary to restore balance", "Their own safety is secondary to the success of the mission"],
        ap.goals = ["Achieve equilibrium within the temporal core", "Prevent further damage to the temporal infrastructure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Observing the crystallization of temporal knowledge and addressing Syndicate operatives and Director Malik.',
        ap.emotional_state = 'Resolute and authoritative.',
        ap.emotional_tags = ["Resolute", "authoritative."],
        ap.active_plans = ["Facilitate the awakening of temporal consciousness", "Hold Director Malik and the Syndicate accountable for their actions"],
        ap.beliefs = ["Time is alive and must be respected", "The Syndicate's manipulation of time is reckless and dangerous"],
        ap.goals = ["Educate Malik and the Syndicate on their miscalculations", "Prevent further temporal breaches and maintain stability"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee, but becomes trapped in a causality loop.',
        ap.emotional_state = 'Panicked and trapped.',
        ap.emotional_tags = ["Panicked", "trapped."],
        ap.active_plans = ["Escape the temporal core and evade capture"],
        ap.beliefs = ["Retreat is the best option to avoid consequences"],
        ap.goals = ["Break free from the causality loop", "Avoid temporal stasis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Witnessing the formation of a consciousness of chronometric energy and grappling with the implications.',
        ap.emotional_state = 'Disbelieving and overwhelmed.',
        ap.emotional_tags = ["Disbelieving", "overwhelmed."],
        ap.active_plans = ["Reevaluate the situation despite initial overconfidence"],
        ap.beliefs = ["Temporal variables could be controlled", "Past calculations must not have accounted for all variables"],
        ap.goals = ["Understand the unexpected results of their actions", "Gain control over the awakening temporal consciousness"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Addressing the systems breach; witnessing the manifestation of a consciousness of chronometric energy.',
        ap.emotional_state = 'Distraught and disbelieving.',
        ap.emotional_tags = ["Distraught", "disbelieving."],
        ap.active_plans = ["Understand the implications of the systems breach at 87%", "Harness the power of time for the Entropy Syndicate"],
        ap.beliefs = ["Temporal power can be precisely calculated and controlled", "The Syndicate's calculations accounted for every temporal variable"],
        ap.goals = ["Control the newly awakened temporal consciousness", "Leverage time's power for the Syndicate's objectives"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Confronting Director Malik about the nature of time and its consciousness.',
        ap.emotional_state = 'Assertive and revelatory.',
        ap.emotional_tags = ["Assertive", "revelatory."],
        ap.active_plans = ["Prevent the misuse of temporal power by the Entropy Syndicate", "Challenge Malik's assumptions about time"],
        ap.beliefs = ["Time is not a static equation but a living entity", "Director Malik's pursuit of power has consequences"],
        ap.goals = ["Ensure the temporal consciousness does not fall into dangerous hands", "Educate Malik on the consequences of meddling with time"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee as timelines collapse; becoming trapped in a causality loop.',
        ap.emotional_state = 'Panicked and desperate.',
        ap.emotional_tags = ["Panicked", "desperate."],
        ap.active_plans = ["Escape the chaotic collapse of timelines", "Avoid consequences of the temporal anomaly"],
        ap.beliefs = ["Self-preservation amidst the collapse is essential", "The breach might still be survivable if escaped"],
        ap.goals = ["Survive the aftermath of the temporal consciousness awakening", "Return to normal continuity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through their matrix, assisting in the stabilization.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Execute purging protocols to stabilize the core", "Support the Archive in managing the temporal energy"],
        ap.beliefs = ["Stabilization of the temporal core is crucial", "K'nell's efforts are vital to the Archive's safety"],
        ap.goals = ["Maintain structural integrity amid the temporal disturbance", "Prevent further breaches"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Confronting Director Malik about the consequences of awakening the Moment\'s power.',
        ap.emotional_state = 'Determined and authoritative.',
        ap.emotional_tags = ["Determined", "authoritative."],
        ap.active_plans = ["Challenge Malik's actions", "Ensure the Moment's judgment is acknowledged"],
        ap.beliefs = ["Time is a living entity rather than a mere equation", "Malik's misuse of temporal power needs to be corrected"],
        ap.goals = ["Protect the integrity of the timeline", "Prevent further exploitation of temporal energies"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Witnessing the manifestation of the Moment and frozen operatives, stunned by unexpected developments.',
        ap.emotional_state = 'Shocked and disbelieving.',
        ap.emotional_tags = ["Shocked", "disbelieving."],
        ap.active_plans = ["Attempt to control temporal systems", "Reassess the breach in Archive systems"],
        ap.beliefs = ["Believed in the calculability of temporal power", "Misjudged the nature of time as a static entity"],
        ap.goals = ["Harness the power of the Moment", "Regain control over the temporal breach"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Trapped in a causality loop, unable to escape the repeating cycle.',
        ap.emotional_state = 'Frustrated and trapped.',
        ap.emotional_tags = ["Frustrated", "trapped."],
        ap.active_plans = ["Escape the temporal stasis", "Attempt to counter the causality loop"],
        ap.beliefs = ["Underestimated the consequences of temporal manipulation", "Believed an escape was feasible until imprisoned"],
        ap.goals = ["Break free from the causality loop", "Find a way to alter their fixed timeline"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_matrix-event-5-1'})
    ON CREATE SET
        oi.description = 'K\'nell initiates the regeneration of their damaged crystal matrix to restore its functionality after the crisis.',
        oi.status_before = 'The crystalline control matrix was damaged, likely due to the crisis affecting the Temporal Staging Area.',
        oi.status_after = 'The crystalline control matrix begins its regeneration under K\'nell\'s supervision, initiating restoration processes.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_matrix'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-5-1'})
    ON CREATE SET
        oi.description = 'The Archive\'s crystals begin pulsing with new purpose, implying a deeper level of understanding and consciousness.',
        oi.status_before = 'The Archive crystals were destabilized by the temporal crisis and their function was merely storage.',
        oi.status_after = 'The Archive crystals exhibit patterns suggesting understanding, indicating a transition from mere storage to possess signs of understanding.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_matrices-event-5-1'})
    ON CREATE SET
        oi.description = 'Dr. Chen observes signs of consciousness within the quantum matrices, indicating a fundamental shift in the Archive\'s nature.',
        oi.status_before = 'The quantum matrices were part of the Archive\'s standard temporal operations.',
        oi.status_after = 'The quantum matrices show signs of consciousness, marking a significant change in the Archive\'s operational nature.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-5-1'})
    ON CREATE SET
        oi.description = 'The TARDIS dematerializes, completing its presence at the Temporal Staging Area.',
        oi.status_before = 'The TARDIS was present at the Temporal Staging Area.',
        oi.status_after = 'The TARDIS has dematerialized, leaving the area.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-temporal_matrices-event-5-2'})
    ON CREATE SET
        oi.description = 'The temporal matrices exhibit signs of consciousness, indicating a transformative shift in the Archive\'s nature towards a sentient library.',
        oi.status_before = 'The temporal matrices were considered non-sentient, serving as storage within the Archive.',
        oi.status_after = 'The temporal matrices show signs of consciousness, suggesting not only storage capabilities but understanding and awareness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-temporal_matrices'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-5-2'})
    ON CREATE SET
        oi.description = 'K\'nell begins regenerating their damaged crystalline matrix using the control interfaces, indicating a return to operational functionality.',
        oi.status_before = 'The crystalline control interfaces were damaged, impairing full functionality.',
        oi.status_after = 'The crystalline control interfaces are in the process of regeneration and are being restored to operational status.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-5-2'})
    ON CREATE SET
        oi.description = 'The TARDIS dematerializes, indicating the end of its immediate involvement in stabilizing the Archive\'s temporal parameters.',
        oi.status_before = 'The TARDIS was present in the Temporal Staging Area, possibly aiding in temporal stabilization efforts.',
        oi.status_after = 'The TARDIS has dematerialized, concluding its immediate role in the current temporal events.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_matrices-event-5-2'})
    ON CREATE SET
        oi.description = 'The quantum matrices pulse with a renewed purpose, suggesting not just storage but an understanding, evolving with an awareness of their role in the Archive.',
        oi.status_before = 'The quantum matrices were a traditional storage system within the Archive.',
        oi.status_after = 'The quantum matrices now pulse with a more advanced and aware functionality, indicating a possible evolution.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_form-event-5-3'})
    ON CREATE SET
        oi.description = 'K\'nell begins regenerating their damaged crystal matrix following the crisis containment, signifying repair and restoration.',
        oi.status_before = 'The crystalline form was damaged and required regeneration.',
        oi.status_after = 'The crystalline form is in the process of being regenerated.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_form'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_matrices-event-5-3'})
    ON CREATE SET
        oi.description = 'Dr. Chen observes signs of consciousness in the Archive indicated by the quantum matrices, suggesting an evolution in their function.',
        oi.status_before = 'The quantum matrices were focused on maintaining temporal stability.',
        oi.status_after = 'The quantum matrices show signs of consciousness, suggesting an evolved role within the Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-5-3'})
    ON CREATE SET
        oi.description = 'The TARDIS dematerializes as K\'nell implements new security protocols, marking the end of the Doctor\'s immediate presence.',
        oi.status_before = 'The TARDIS was present during the discussions about responsibility and consciousness.',
        oi.status_after = 'The TARDIS has dematerialized, indicating the Doctor\'s departure.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-5-3'})
    ON CREATE SET
        oi.description = 'The Archive\'s quantum crystals pulse with renewed purpose, suggesting understanding and a guard over time\'s secrets.',
        oi.status_before = 'The Archive crystals were part of the Archive\'s structure, storing knowledge.',
        oi.status_after = 'The Archive crystals now reflect a purpose aligned with understanding and safeguarding knowledge.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tardis-event-5-4'})
    ON CREATE SET
        oi.description = 'The TARDIS dematerializes as The Doctor concludes their involvement in the scene, marking a narrative transition.',
        oi.status_before = 'The TARDIS was present within the Temporal Staging Area as a mode of transportation and a symbol of The Doctor\'s presence.',
        oi.status_after = 'The TARDIS has dematerialized, indicating The Doctor\'s departure and completion of their role in the current scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tardis'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_control_interfaces-event-5-4'})
    ON CREATE SET
        oi.description = 'K\'nell uses the Crystalline Control Interfaces to implement new security protocols, strengthening the Archive\'s defenses.',
        oi.status_before = 'The Crystalline Control Interfaces were intact but potentially compromised, prior to the integration of new security protocols.',
        oi.status_after = 'The Crystalline Control Interfaces have been utilized to reinforce security measures within the Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_control_interfaces'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-archive_crystals-event-5-4'})
    ON CREATE SET
        oi.description = 'The Archive\'s quantum crystals react with a newfound purpose, manifesting signs of understanding and potential consciousness.',
        oi.status_before = 'The Archive\'s crystals were primarily serving a storage function within the temporal landscape.',
        oi.status_after = 'The Archive\'s crystals now emit pulses indicating a shift toward understanding and consciousness, suggesting a transformative alteration.'
    WITH oi
    MATCH (o:Object {uuid: 'object-archive_crystals'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-quantum_matrices-event-5-4'})
    ON CREATE SET
        oi.description = 'According to Dr. Chen, the quantum matrices show signs of developing a level of consciousness within the Archive.',
        oi.status_before = 'The quantum matrices functioned as part of the Archive\'s operating infrastructure, focusing on data and temporal stability.',
        oi.status_after = 'The quantum matrices exhibit attributes of consciousness, potentially altering their role within the Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-quantum_matrices'})
    MATCH (e:Event {uuid: 'event-5-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Regenerating their damaged crystal matrix and informing the team about the quantum-lock on compromised records.',
        ap.emotional_state = 'Concerned yet resolute.',
        ap.emotional_tags = ["Concerned yet resolute."],
        ap.active_plans = ["Implement new security protocols"],
        ap.beliefs = ["The emergence event has severely affected record access", "The regeneration of the crystal matrix is crucial for restoring functionality"],
        ap.goals = ["Ensure the security and functionality of the records", "Restore the crystal matrix to its full capacity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Analyzing the Archive\'s temporal stability and noticing fundamental changes.',
        ap.emotional_state = 'Intrigued and reflective.',
        ap.emotional_tags = ["Intrigued", "reflective."],
        ap.active_plans = ["Continue monitoring the Archive's temporal stability"],
        ap.beliefs = ["The Archive's temporal integrity can be restored over time", "The Archive's changes could signify an emerging consciousness"],
        ap.goals = ["Understand the implications of the Archive's changes", "Ensure the safety and proper functioning of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Engaging in a philosophical discussion about the nature of knowledge and responsibility.',
        ap.emotional_state = 'Philosophical and contemplative.',
        ap.emotional_tags = ["Philosophical", "contemplative."],
        ap.active_plans = ["Depart from the Temporal Staging Area"],
        ap.beliefs = ["Some aspects of history are best left unexplored", "Knowledge inherently carries responsibility and consequences"],
        ap.goals = ["Reflect on the nature and implications of the Archive's changes", "Encourage caution and responsibility regarding the Archive's newfound potential consciousness"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Observing the Archive\'s temporal stability and identifying signs of consciousness within the quantum matrices.',
        ap.emotional_state = 'Curious and reflective.',
        ap.emotional_tags = ["Curious", "reflective."],
        ap.active_plans = ["Monitor changes in the quantum matrices.", "Assess the implications of a conscious Archive."],
        ap.beliefs = ["The Archive is fundamentally different now.", "Consciousness in the matrices indicates a new potential for the Archive."],
        ap.goals = ["Ensure the Archive's stability and security.", "Understand the transformative changes within the Archive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Regenerating their damaged crystal matrix and implementing new security protocols.',
        ap.emotional_state = 'Determined and focused.',
        ap.emotional_tags = ["Determined", "focused."],
        ap.active_plans = ["Regenerate the damaged crystal matrix.", "Enhance security measures following the emergence event."],
        ap.beliefs = ["The compromised records are beyond access due to the emergence event.", "Knowledge of the Moment transcends time."],
        ap.goals = ["Reinforce the security and integrity of the Archive.", "Safeguard the Archive's knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Discussing the implications of the Archive\'s transformations and dematerializing the TARDIS.',
        ap.emotional_state = 'Thoughtful and cautious.',
        ap.emotional_tags = ["Thoughtful", "cautious."],
        ap.active_plans = ["Reflect on the Archive's new consciousness.", "Leave the scene in the TARDIS."],
        ap.beliefs = ["Some knowledge should remain unexplored.", "A library with a conscience is significant."],
        ap.goals = ["Consider the consequences of the Archive's awareness.", "Continue to protect the flow of time and knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Analyzing the Archive\'s temporal stability and observing its fundamental changes.',
        ap.emotional_state = 'Reflective and contemplative.',
        ap.emotional_tags = ["Reflective", "contemplative."],
        ap.active_plans = ["Assess the long-term impact of the Archive's changes on temporal stability."],
        ap.beliefs = ["Understanding the Archive's transformation is crucial for future operations."],
        ap.goals = ["Ensure the Archive returns to operational stability.", "Adapt to the new characteristics of the Archive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Regenerating damaged crystal matrix and implementing new security protocols.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Secure the Archive's knowledge against unauthorized access.", "Reinforce the crystal matrix to prevent future breaches."],
        ap.beliefs = ["The knowledge of the Moment must remain inaccessible."],
        ap.goals = ["Restore the crystal matrix to its full operational capacity.", "Ensure long-term security of the Archive's records."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Reflecting on the nature of knowledge and responsibility.',
        ap.emotional_state = 'Philosophical and insightful.',
        ap.emotional_tags = ["Philosophical", "insightful."],
        ap.active_plans = ["Consider the ethical implications of the Archive's new consciousness."],
        ap.beliefs = ["Knowledge with a conscience might better safeguard history."],
        ap.goals = ["Ensure the Archive functions ethically with its new awareness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-4'})
    ON CREATE SET
        ap.current_status = 'Implementing new security protocols and regenerating the crystal matrix.',
        ap.emotional_state = 'Focused and resolved.',
        ap.emotional_tags = ["Focused", "resolved."],
        ap.active_plans = ["Strengthen security to protect the Archive from potential threats.", "Reinforce the crystal matrix to ensure the stability of the Archive."],
        ap.beliefs = ["The Archive's safety depends on advanced security measures.", "Knowledge should remain secure and distant from those unworthy."],
        ap.goals = ["Complete the implementation of enhanced security protocols.", "Ensure the Archive's resilience against future disturbances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-4'})
    ON CREATE SET
        ap.current_status = 'Preparing to leave as the TARDIS dematerializes.',
        ap.emotional_state = 'Reflective with a cautious acceptance.',
        ap.emotional_tags = ["Reflective with a cautious acceptance."],
        ap.active_plans = ["Depart from the Archive in the TARDIS."],
        ap.beliefs = ["Some knowledge is dangerous and should remain hidden.", "The Archive's newfound consciousness could be beneficial."],
        ap.goals = ["Return to their own timeline safely.", "Consider the implications of the Archive's consciousness on future events."]
    ;
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-1'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-2'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-3'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-1-5'}),
          (b:Scene {uuid: 'scene-1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-1-4'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-1-5'}),
          (b:Event {uuid: 'event-1-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Location {uuid: 'location-central_core'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-2'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-1'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-2'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-2-4'}),
          (b:Scene {uuid: 'scene-2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-3'}),
          (b:Event {uuid: 'event-2-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Location {uuid: 'location_security_nexus'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-3'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-1'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-2'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-4'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-3'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-5'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-4'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-6'}),
          (b:Scene {uuid: 'scene-3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-5'}),
          (b:Event {uuid: 'event-3-6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-3-6'}),
          (b:Event {uuid: 'event-3-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-3-6'}),
          (b:Event {uuid: 'event-3-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-6'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-3-6'}),
          (b:Event {uuid: 'event-3-6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Location {uuid: 'location-temporal_core'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-4'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-4-3'}),
          (b:Scene {uuid: 'scene-4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-4-2'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-director_malik-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-coordinator_voss-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-5'}),
          (b:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-5'}),
          (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-1'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-2'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-5-4'}),
          (b:Scene {uuid: 'scene-5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-5-3'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-sarah_chen-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-k_nell-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-the_doctor-event-5-4'}),
          (b:Event {uuid: 'event-5-4'})
    MERGE (a)-[:IN_EVENT]->(b);
