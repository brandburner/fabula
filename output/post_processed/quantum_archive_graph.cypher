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
MERGE (a:Agent {uuid: 'agent_sarah_chen'})
    ON CREATE SET
        a.name = 'Sarah Chen',
        a.title = 'Doctor',
        a.description = 'Dr. Sarah Chen serves as the Time Archaeology Division Chief at the Quantum Archive. She combines rigorous scientific methodology with an intuitive understanding of temporal phenomena. Her expertise in quantum analysis allows her to monitor and interpret complex temporal events, making her an invaluable bridge between the Archive\'s esoteric systems and practical crisis management.',
        a.traits = ["Scientific", "Analytical", "Perceptive", "Professional"],
        a.sphere_of_influence = 'Temporal Science'
    ;
MERGE (a:Agent {uuid: 'agent_knell'})
    ON CREATE SET
        a.name = 'K\'nell',
        a.title = 'Archivist Prime',
        a.description = 'K\'nell is the crystalline Archivist Prime of the Quantum Archive, a non-humanoid being intimately connected to the Archive\'s systems. Their form allows direct interface with the Archive\'s control matrices, and they possess the ability to regenerate their crystalline structure after damage. K\'nell demonstrates both vast knowledge and a deep sense of responsibility for the Archive\'s contents, willing to sacrifice parts of themselves to protect its integrity.',
        a.traits = ["Non-humanoid", "Self-sacrificing", "Regenerative", "Knowledge Guardian"],
        a.sphere_of_influence = 'Temporal Knowledge Management'
    ;
MERGE (a:Agent {uuid: 'agent_the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'The Doctor',
        a.description = 'A wise and powerful Time Lord who understands the deeper implications of temporal knowledge and power. They possess extensive experience with both the technical and ethical aspects of time manipulation, often serving as both problem solver and moral compass. Their perspective on the Archive\'s transformation reveals their appreciation for the responsible use of knowledge.',
        a.traits = ["Wise", "Philosophical", "Time Lord", "Guardian of Time"],
        a.sphere_of_influence = 'Temporal Intervention'
    ;
MERGE (a:Agent {uuid: 'agent_coordinator_voss'})
    ON CREATE SET
        a.name = 'Voss',
        a.title = 'Coordinator',
        a.description = 'Coordinator Voss is an Entropy Syndicate infiltrator disguised as a junior archivist within the Quantum Archive. They maintain a facade of being a low-level functionary, but are in reality a cunning operative working to undermine the Archive from within. In this scene, Voss\'s attempt to flee the consequences of the Syndicate\'s actions results in them being trapped in a causality loop, a fitting punishment for their treachery and a demonstration of the temporal forces unleashed by the Syndicate\'s ambition. Their fate underscores the dangers of manipulating time without understanding its profound nature.',
        a.traits = ["Infiltrator", "Duplicitous", "Cunning", "Desperate"],
        a.sphere_of_influence = 'Espionage'
    ;
MERGE (a:Agent {uuid: 'agent_director_malik'})
    ON CREATE SET
        a.name = 'Malik',
        a.title = 'Director',
        a.description = 'Director Malik is the ruthless tactical leader of the Entropy Syndicate, commanding their assault on the Quantum Archive. Their calculated approach and sophisticated understanding of temporal mechanics reveals them as both a skilled strategist and temporal scientist. Malik demonstrates unwavering determination to acquire the secrets of the Time War, regardless of the catastrophic consequences, suggesting a combination of ambition and dangerous overconfidence. In this scene, Malik\'s overconfidence is shattered as they confront the unexpected sentience of temporal knowledge, leading to a moment of stunned realization of their catastrophic miscalculation.',
        a.traits = ["Ruthless", "Tactical", "Overconfident", "Scientifically skilled"],
        a.sphere_of_influence = 'Temporal Strategy'
    ;
MERGE (o:Object {uuid: 'object_quantum_analyzer'})
    ON CREATE SET
        o.name = 'Quantum Analyzer',
        o.description = 'Dr. Chen\'s Quantum Analyzer is depicted as showing \'critical pattern convergence\' and functions as a vital diagnostic tool. It monitors the temporal situation within the Archive, providing scientific data to support investigations into temporal anomalies.',
        o.purpose = 'Temporal Analysis',
        o.significance = 'Provides crucial diagnostic information by representing the scientific approach to understanding and managing temporal anomalies.'
    ;
MERGE (o:Object {uuid: 'object_tardis'})
    ON CREATE SET
        o.name = 'TARDIS',
        o.description = 'The Doctor\'s iconic time machine appears as a blue police box containing infinite space. In this scene it serves as a silent witness to the Archive\'s transformation before dematerializing.',
        o.purpose = 'Time and space travel vessel',
        o.significance = 'Represents the Doctor\'s authority on temporal matters and their observational role in the Archive\'s evolution.'
    ;
MERGE (o:Object {uuid: 'object_temporal_containment_consoles'})
    ON CREATE SET
        o.name = 'Temporal Containment Consoles',
        o.description = 'Advanced workstations designed for monitoring and maintaining the Archive\'s temporal containment systems. They feature holographic displays that show temporal decay patterns throughout the facility.',
        o.purpose = 'Monitor and control temporal containment systems',
        o.significance = 'Critical infrastructure for maintaining the Archive\'s integrity.'
    ;
MERGE (o:Object {uuid: 'object_holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A shimmering, translucent holographic projection materializing in the Central Core. It displays complex fragmented code patterns and temporal coordinates, providing a dynamic interface for interpreting abstract temporal data.',
        o.purpose = 'Visualizing Data',
        o.significance = 'Provides visual representation of the temporal virus\'s code and targets, facilitating communication of complex information between characters.'
    ;
MERGE (o:Object {uuid: 'object_sonic_screwdriver'})
    ON CREATE SET
        o.name = 'Sonic Screwdriver',
        o.description = 'The Doctor\'s signature multi-functional tool emits a low hum as it scans and analyzes the Quantum Archive\'s central systems. It is capable of interacting with and diagnosing a wide range of technologies, particularly temporal and alien systems.',
        o.purpose = 'Scanning and analyzing technology',
        o.significance = 'Acts as the Doctor\'s primary diagnostic tool and is crucial for investigative and problem-solving efforts.'
    ;
MERGE (o:Object {uuid: 'object_quantum_transmitter'})
    ON CREATE SET
        o.name = 'Quantum Transmitter',
        o.description = 'A small, concealed device hidden within Coordinator Voss\'s crystalline badge of office. It is designed for discreet, quantum-encrypted communication across distances.',
        o.purpose = 'Secret communication',
        o.significance = 'Reveals Voss\'s betrayal and underscores the Entropy Syndicate\'s infiltration capabilities.'
    ;
MERGE (o:Object {uuid: 'object_temporal_armor'})
    ON CREATE SET
        o.name = 'Temporal Combat Armor',
        o.description = 'Advanced protective suits worn by Entropy Syndicate operatives. The armor is engineered to shield wearers from temporal feedback and chronometric instability, with a surface that ripples with temporal energy absorption patterns.',
        o.purpose = 'Protection from temporal effects during archive infiltration',
        o.significance = 'Demonstrates the Entropy Syndicate\'s advanced temporal technology and preparedness for assault.'
    ;
MERGE (o:Object {uuid: 'object_temporal_weapons'})
    ON CREATE SET
        o.name = 'Temporal Weapons',
        o.description = 'Sophisticated armaments carried by the Entropy Syndicate forces, capable of manipulating and disrupting timestreams. These weapons glow with temporal energy, hinting at their capacity to inflict severe damage to conventional and temporal targets.',
        o.purpose = 'Offensive temporal combat capabilities',
        o.significance = 'Represents the militarization of temporal technology and the dangerous capabilities of the Syndicate.'
    ;
MERGE (o:Object {uuid: 'object_central_control_nexus'})
    ON CREATE SET
        o.name = 'Central Control Nexus',
        o.description = 'A sophisticated control interface located at the heart of the Security Nexus, featuring multiple temporal monitoring displays and emergency protocol systems. It enables direct manipulation of the Archive\'s defensive systems and containment fields.',
        o.purpose = 'Control and monitoring of Archive security systems',
        o.significance = 'Represents the last line of defense for the Archive\'s knowledge and security.'
    ;
MERGE (o:Object {uuid: 'object_temporal_knowledge'})
    ON CREATE SET
        o.name = 'Temporal Knowledge',
        o.description = 'An assembled consciousness of pure chronometric energy, manifesting as the awakened knowledge of the Quantum Archive. More than mere data, it acts as a sentient force capable of judgment and intervention, born from the vast temporal records of the Archive.',
        o.purpose = 'Judgment and Defense',
        o.significance = 'Personifies the Moment\'s power and the sentience of time, serving as a living representation of accumulated historical and temporal power.'
    ;
MERGE (o:Object {uuid: 'object_archive_systems'})
    ON CREATE SET
        o.name = 'Archive\'s Systems',
        o.description = 'The collective technological infrastructure of the Quantum Archive that stores and manages temporal knowledge. These systems resonate in harmony with the awakened temporal knowledge, highlighting a symbiotic relationship between the physical and sentient aspects of the Archive.',
        o.purpose = 'Data Storage and Temporal Management',
        o.significance = 'Forms the foundation of the Archive\'s power and sentience, serving as the platform for its emergent defenses and reactive capabilities.'
    ;
MERGE (o:Object {uuid: 'object_quantum_crystals'})
    ON CREATE SET
        o.name = 'Archive Quantum Crystals',
        o.description = 'Massive crystalline structures that form the physical infrastructure of the Quantum Archive. These crystals pulse with temporal energy and now exhibit signs of emergent consciousness as part of the Archive\'s evolution.',
        o.purpose = 'Storage and processing of temporal knowledge',
        o.significance = 'Serve as the physical manifestation of the Archive\'s evolution into a semi-sentient entity.'
    ;
MERGE (o:Object {uuid: 'object_security_protocols'})
    ON CREATE SET
        o.name = 'Security Protocols',
        o.description = 'A set of newly implemented protective measures managed by K\'nell to safeguard the Archive\'s knowledge. These protocols are adapted to interface with the Archive\'s newly developed consciousness, enhancing its self-protective capabilities.',
        o.purpose = 'Protection of temporal knowledge',
        o.significance = 'Represents the Archive\'s enhanced ability to protect itself and adapt to emerging threats.'
    ;
MERGE (l:Location {uuid: 'location_temporal_staging_area'})
    ON CREATE SET
        l.name = 'Temporal Staging Area',
        l.description = 'The primary operational center of the Quantum Archive, featuring crystalline walls that pulse with chronometric energy. This space has evolved from a simple control center to a manifestation of the Archive\'s newfound consciousness. It houses sophisticated temporal monitoring equipment and serves as the interface between the Archive\'s systems and its operators.',
        l.type = 'Control Room'
    ;
MERGE (l:Location {uuid: 'location_central_core'})
    ON CREATE SET
        l.name = 'Central Core',
        l.description = 'A cavernous space within the Quantum Archive dominated by colossal, once symmetrical data crystals that now show signs of temporal decay. The atmosphere is heavy with the hum of failing temporal systems as control matrices within the crystal structures allow for direct interface with the archive\'s systems, symbolizing the heart of the Archive\'s memory.',
        l.type = 'Data Storage Core'
    ;
MERGE (l:Location {uuid: 'location_security_nexus'})
    ON CREATE SET
        l.name = 'Security Nexus',
        l.description = 'The primary defensive control center of the Quantum Archive, featuring an array of temporal containment systems and emergency protocol controls. The room is charged with entropic energy from multiple temporal breach points and is characterized by holographic displays and advanced security features combined with a crystalline aesthetic.',
        l.type = 'Control Center'
    ;
MERGE (l:Location {uuid: 'location_temporal_core'})
    ON CREATE SET
        l.name = 'Temporal Core',
        l.description = 'The innermost sanctum of the Quantum Archive, serving as the heart of its temporal mechanics and data storage. Embodying immense chronometric energy and raw temporal power, this core chamber features pulsing TARDIS connections and resonating crystals that make the location both awe-inspiring and dangerous.',
        l.type = 'Core Chamber'
    ;
MERGE (o:Organization {uuid: 'org_quantum_archive'})
    ON CREATE SET
        o.name = 'Quantum Archive',
        o.description = 'A vast repository of temporal knowledge that has evolved beyond its original purpose as a mere storage facility. Following recent events, it has developed a form of consciousness, able to protect and curate its own knowledge, representing the intersection of technological advancement and ethical responsibility in the preservation of historical knowledge.',
        o.sphere_of_influence = 'Temporal Knowledge Preservation'
    ;
MERGE (o:Organization {uuid: 'org_entropy_syndicate'})
    ON CREATE SET
        o.name = 'Entropy Syndicate',
        o.description = 'A hostile and technologically advanced organization intent on exploiting temporal knowledge for nefarious purposes. The Entropy Syndicate is sophisticated in breaching secure temporal facilities and implanting complex temporal viruses, demonstrating a dangerous ambition to control time that ultimately backfires against them.',
        o.sphere_of_influence = 'Temporal Exploitation'
    ;
MERGE (o:Organization {uuid: 'org_entropy_syndicate_operatives'})
    ON CREATE SET
        o.name = 'Entropy Syndicate Operatives',
        o.description = 'An elite tactical unit within the Entropy Syndicate specialized in temporal infiltration and armed intervention. Equipped with advanced temporal armor and weapons, these operatives demonstrate the Syndicate\'s significant technological capabilities, and their fate in the face of awakened temporal power illustrates the risks of exploiting time.',
        o.sphere_of_influence = 'Temporal Combat Operations'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    ON CREATE SET
        ep.title = 'Episode One - The Quantum Archive',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Urgent Warning at the Archive Threshold',
        s.description = 'The scene unfolds within the Temporal Staging Area of the Quantum Archive, a reception chamber characterized by crystalline structures and pulsing chronometric energy. Translucent walls display cascading data streams in ancient languages, emphasizing the vastness and age of the archive. The atmosphere is thick with tension and urgency as temporal matrices lining the walls exhibit signs of decay. Dr. Sarah Chen, positioned at a central control platform amidst holographic displays, urgently monitors failing temporal seals with her quantum-state analyzer. Archivist Prime K\'nell, an ancient crystalline being, agitates as they manipulate control interfaces, their light fragments reflecting the growing crisis. Junior archivists work feverishly at containment consoles, struggling against spreading temporal corruption visualized on a massive holographic display. The scene establishes a dire situation – a critical archive under attack, on the verge of collapse.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Temporal Seals Degrading Rapidly',
        e.description = 'Dr. Sarah Chen, observing data from her quantum-state analyzer, delivers grim news: the temporal seals protecting the Quantum Archive are failing at an alarming rate. Her readings indicate an exponential degradation, threatening the archive with catastrophic data loss. Her urgent tone underscores the severity of the situation, emphasizing the potential loss of centuries of accumulated knowledge with each passing chronometric pulse. The holographic displays around her reinforce the visual representation of the escalating crisis.',
        e.sequence = 1,
        e.key_dialogue = ["DR. CHEN: These readings can't be right. The temporal seals are degrading at an exponential rate. We're losing centuries of data with every chronometric pulse."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Entropy Syndicate\'s Calculated Attack',
        e.description = 'Archivist Prime K\'nell confirms Sarah\'s fears, revealing that the temporal degradation is not accidental but the result of a deliberate and sophisticated attack by the Entropy Syndicate. K\'nell explains that the attack vector was meticulously planned to exploit quantum vulnerabilities previously unknown to the Archive\'s defenses. This revelation shifts the scene from a technical problem to a targeted assault, introducing an external antagonist and raising the stakes by highlighting the Syndicate\'s strategic intelligence.',
        e.sequence = 2,
        e.key_dialogue = ["K'NELL: The Entropy Syndicate's attack vector was precisely calculated. They exploited quantum vulnerabilities we didn't know existed."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Request for External Intervention',
        e.description = 'As junior archivists frantically work at temporal containment consoles to mitigate the damage, K\'nell makes a critical admission: the situation is beyond the Archive\'s internal capabilities to resolve. K\'nell declares the necessity of external intervention, specifically seeking someone with expertise in both the technological and metaphysical aspects of temporal mechanics. This plea emphasizes the unique and complex nature of the threat and sets the stage for the arrival of a more capable agent to address the crisis.',
        e.sequence = 3,
        e.key_dialogue = ["K'NELL: We require intervention beyond our capabilities. Someone who understands both the technology and the metaphysical implications."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'The Doctor\'s Materialization and Rapid Assessment',
        e.description = 'Responding to the urgent need for intervention, the Doctor arrives in the TARDIS. The iconic wheezing and grinding sound heralds its materialization, the chameleon circuit instantly adapting the ship\'s exterior to the crystalline architecture of the Archive. The Doctor emerges, sonic screwdriver already in hand, immediately assessing the situation. They quickly diagnose a \"catastrophic entropic cascade,\" acknowledging the brilliance of the Archive\'s quantum crystalline structure while also questioning the Entropy Syndicate\'s motive for destruction. This arrival injects hope and expertise into the scene, hinting at a deeper mystery beyond the immediate threat.',
        e.sequence = 4,
        e.key_dialogue = ["THE DOCTOR: Temporal archives experiencing catastrophic entropic cascade. Though I must say - brilliant architecture. Quantum crystalline matrices storing data in temporal suspension. But the real question is - why would someone want to destroy it?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Hidden Pattern',
        s.description = 'Inside the towering central core of the Quantum Archive, massive data crystals stretch into the encroaching darkness, their surfaces marred by spreading temporal decay and discordant, fading patterns. The atmosphere is charged with tension and urgency as The Doctor, armed with a sonic screwdriver, meticulously examines the failing systems. Dr. Chen stands nearby, carefully monitoring degradation patterns that hint at a sophisticated and deliberate cyber attack. K\'nell, their crystalline form shimmering with digital data, works at the primary control matrix. Shadows hide unexpected betrayals as secretive figures manipulate technology for hidden gains. Amid this interplay of light, decay, and high stakes, the scene establishes a race against time to uncover the true target—a weapon from the storied Time War—ensuring that history itself remains unaltered.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_central_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Detection of the Temporal Virus',
        e.description = 'In the dim light cast by the decaying data crystals, Dr. Chen succinctly summarizes the crisis to her colleagues. She explains that the invasion was not a simple breach but a carefully orchestrated infiltration—an attack sophisticated enough to implant a temporal virus that is actively rewriting historical records at the quantum level. This revelation is critical, highlighting the vulnerability of the Archive and the far-reaching implications of erasing or altering history. Her analytical tone mixes with palpable concern as she outlines the virus\'s insidious nature, setting the stage for a deeper investigation into its origins and objectives.',
        e.sequence = 1,
        e.key_dialogue = ["DR. CHEN: The attack was sophisticated. They didn't just breach our defenses - they implanted something. A temporal virus that's rewriting our historical records at the quantum level."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Interfacing and Code Fragment Isolation',
        e.description = 'Immediately following Dr. Chen\'s alarming report, K\'nell steps forward with graceful, calculated urgency. Their crystalline appendages extend toward the primary control matrix, interfacing directly with the Archive\'s intricate systems. As data streams cascade over their form, K\'nell identifies that fragments of malicious code have been isolated. The virus, they reveal, is not random but appears to be scanning for specific temporal coordinates—a trail that could lead to a lost yet dangerous relic from the Time War. This technical insight not only deepens the unfolding mystery but also elevates the stakes of the conflict.',
        e.sequence = 2,
        e.key_dialogue = ["K'NELL: We've isolated fragments of their code structure. The virus appears to be searching for specific temporal coordinates."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Uncovering the Hidden Motive',
        e.description = 'Compelled by the urgency of the situation, The Doctor steps forward with determination, inviting a closer look by saying, \'Let me see.\' As a holographic display materializes from thin air, vibrant yet fragmented code patterns and mysterious temporal coordinates flash across its surface. The Doctor\'s face shifts from curiosity to grave concern as they interpret the data: these aren’t mere attack algorithms but a targeted search for records of the Moment—the ultimate weapon of the Time War, believed to have been eradicated from history. Amid this tense technical scrutiny, a shadowed Coordinator Voss lurks in an alcove, discreetly activating a concealed quantum transmitter, suggesting a hidden agenda at play.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: Let me see.", "THE DOCTOR: These aren't just attack algorithms. They're searching for information about the Moment - the ultimate weapon of the Time War. Those records were supposed to be destroyed... sealed away in time itself."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Betrayal Cascade',
        s.description = 'Chaos erupts in the Security Nexus as temporal breach alarms scream through the facility. Spacetime itself fractures, unleashing crackling entropic energy as multiple breaches tear open reality. From these rifts, Entropy Syndicate operatives storm into the Nexus, clad in specialized temporal combat armor. Leading the charge is Director Malik, who emerges from the largest breach, brandishing advanced temporal weaponry. Simultaneously, Coordinator Voss, previously appearing as an ally, reveals their true colors and moves to sabotage the Archive\'s containment fields from within. The Doctor, Sarah Chen, and K\'nell are caught in a desperate struggle to defend the Archive against both external assault and internal treachery, as the true magnitude of the Entropy Syndicate\'s ambition and the catastrophic potential of their actions become terrifyingly clear.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_security_nexus'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Temporal Incursion',
        e.description = 'Deafening alarms signal a critical system failure as temporal breaches violently rupture the fabric of spacetime within the Security Nexus. Entropic energy crackles around the expanding fissures as Entropy Syndicate operatives, equipped with specialized temporal armor, pour into the facility. Director Malik strides through the largest breach, temporal weapon primed and ready, initiating the full-scale assault on the Quantum Archive.',
        e.sequence = 1,
        e.key_dialogue = ["DIRECTOR MALIK: Secure the facility. The Archive's knowledge will serve a greater purpose. The secrets of the Time War will finally be ours."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Voss Unmasked',
        e.description = 'Amidst the chaos of the Syndicate\'s attack, Coordinator Voss abandons their facade of loyalty and reveals their true allegiance to the Entropy Syndicate.  Capitalizing on the confusion, Voss makes a calculated move to sabotage the Quantum Archive from within, attempting to disable the vital containment fields protecting the facility\'s precious temporal data. This act of betrayal deepens the crisis, turning the defense of the Archive into a two-front battle against both external invaders and internal treachery.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Desperate Plea',
        e.description = 'As the Entropy Syndicate\'s forces advance and Voss\'s sabotage intensifies, the Doctor frantically works at the central control nexus, trying to counteract the unfolding disaster. In a desperate attempt to make the attackers understand the catastrophic consequences of their actions, the Doctor warns them of the true nature of the Moment. They emphasize that it is not merely a weapon to be controlled, but a sentient force capable of judging all of time and space, highlighting the unimaginable danger of unleashing such power.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: You don't understand what you're dealing with! The Moment wasn't just a weapon - it was consciousness itself, passing judgment on all of time and space!"]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Viral Assembly',
        e.description = 'While the Doctor races against time to defend the Archive, Dr. Chen, monitoring her quantum analyzer, makes a chilling discovery about the temporal virus planted by the Entropy Syndicate. She realizes the virus is not simply searching for information, but actively assembling something new and dangerous from fragments of data scattered across multiple timelines. This revelation suggests a far more complex and perilous objective behind the Syndicate\'s attack, raising the stakes of the conflict to terrifying new heights as they unknowingly unleash an unforeseen temporal anomaly.',
        e.sequence = 4,
        e.key_dialogue = ["DR. CHEN: Doctor - the virus pattern... it's not just searching. It's assembling something across multiple timeline nodes. Creating something new."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Temporal Revelation and Judgment',
        s.description = 'In the heart of the Archive’s Temporal Core, the scene unfolds in a charged symphony of chaos and cosmic retribution. The TARDIS interfaces with the Archive\'s systems, emitting pulses of stabilizing energy that clash with the raw, turbulent forces unleashed by a malfunctioning temporal matrix. K\'nell’s crystalline form fractures under the strain as they channel desperate purging protocols, while Dr. Chen’s quantum analyzer flashes critical pattern convergence in a race against time. The atmosphere vibrates with imminent judgment as the assembled temporal knowledge—a shimmering, sentient consciousness of pure chronometric energy—emerges. The scene’s urgency is bolstered by the impending collapse of time itself, setting up a confrontation between the cold calculation of the Entropy Syndicate and the living, rebellious force of time that remembers every transgression.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_temporal_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Stabilization Under Duress',
        e.description = 'The scene opens with the TARDIS interfacing directly with the Archive’s systems, pulsing with a stabilizing energy that ripples through the Temporal Core. K\'nell, the ancient keeper, channels purging protocols through their crystalline matrix—even as fragments of their form begin to fracture under the pressure. Dr. Chen’s quantum analyzer displays a critical convergence of patterns, underscoring the immediacy of the crisis. This moment sets the stage, highlighting the desperation of the Archive’s defenders and their unyielding determination to delay the inevitable collapse of time.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Dire Prognosis Interrupted',
        e.description = 'As the tension mounts, Director Malik urgently announces the system breach at 87%, foretelling that the power of time itself will soon be unleashed. His declaration is abruptly cut short by a sudden transformation—the assembled temporal knowledge coalesces into a shimmering consciousness of chronometric energy, dwarfing his planned narrative. This pivotal interruption not only signifies the failure of Malik’s control but also marks the inflection point where time reveals its sentience. The disruption leaves Malik visibly unsettled, a harbinger of the unfolding retribution.',
        e.sequence = 2,
        e.key_dialogue = ["DIRECTOR MALIK: Systems breach at 87%. Soon the power of time itself will be-"]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Exposing the Inevitable Judgment',
        e.description = 'The Doctor steps forward, his voice resonating with the weight of cosmic inevitability as he declares, \'You wanted the Moment\'s power? Now face its judgment. Time itself has awakened - and it remembers.\' Amidst this proclamation, the environment transforms: Entropy Syndicate operatives are frozen in temporal stasis, their timelines reduced to static points, while Voss finds themselves trapped in a relentless causality loop, doomed to repeat futile actions. The Doctor’s words underscore the futility of meticulously calculated control over time, setting the stage for the reckoning that binds destiny and consequence.',
        e.sequence = 3,
        e.key_dialogue = ["THE DOCTOR: You wanted the Moment's power? Now face its judgment. Time itself has awakened - and it remembers."]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'The Collapse of Certainty',
        e.description = 'In the final act of the scene, Director Malik, grappling with the unexpected emergence of sentient temporal knowledge, stammers in disbelief. \'Impossible... we calculated every variable... mapped every temporal coordinate...\' he laments, his confidence crumbling. The Doctor retorts with a definitive admonition: \'Time isn’t an equation to be solved, Director. It’s alive. And now, thanks to you, it’s aware.\' This exchange epitomizes the collapse of mechanistic control in the face of the wild, unpredictable force of time. The scene leaves a stark reminder that human attempts to harness time are ultimately at the mercy of its living nature.',
        e.sequence = 4,
        e.key_dialogue = ["DIRECTOR MALIK: Impossible... we calculated every variable... mapped every temporal coordinate...", "THE DOCTOR: Time isn't an equation to be solved, Director. It's alive. And now, thanks to you, it's aware."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Restoration and Reflection',
        s.description = 'Within the Temporal Staging Area, the immediate crisis has passed, leaving a palpable sense of relief mingled with lingering awe. K\'nell\'s crystalline form undergoes a slow regeneration, their fractured matrix reforming as light pulses gently across the gleaming temporal chamber. Dr. Chen, her face etched with fatigue but also fascination, meticulously studies her quantum analyzer, its readings reflecting the subtle shifts in the Archive\'s energy signatures. The atmosphere is quiet, contemplative, a stark contrast to the earlier chaos. Though the temporal integrity of the Archive is returning, a profound change has taken root, leaving an indelible mark on the ancient repository of knowledge. The air hums with a renewed, almost sentient energy, as the quantum crystals now pulse with a different kind of light – one that suggests not just storage, but understanding, marking a turning point in the Archive\'s long existence.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Damage Assessment and Lost Knowledge',
        e.description = 'K\'nell, in the process of regenerating their damaged form, delivers a momentous report: the records compromised during the attack have been irreversibly quantum-locked by the \'emergence event\'. This drastic measure renders the knowledge of the Moment inaccessible even to the Archivists themselves, effectively banishing it from temporal reach. Dr. Chen\'s readings corroborate the restoration of temporal stability, yet the weight of the lost knowledge hangs heavy in the air, a sacrifice made for the Archive\'s survival.',
        e.sequence = 1,
        e.key_dialogue = ["K'NELL: The compromised records have been quantum-locked by the emergence event. Even we cannot access them now. The knowledge of the Moment truly exists beyond time."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'The Doctor\'s Acceptance of Shadowed History',
        e.description = 'The Doctor responds to K\'nell\'s pronouncement with a quiet affirmation, acknowledging the necessity of some secrets remaining buried. They suggest that the permanent loss of the Moment\'s knowledge is a positive outcome, a safeguard against future misuse. This acceptance underscores the Doctor\'s understanding of history\'s burdens and the wisdom in letting certain chapters fade into obscurity, reinforcing the episode\'s themes of responsibility and the dangers of unchecked power.',
        e.sequence = 2,
        e.key_dialogue = ["THE DOCTOR: Some shadows are better left unexplored. The Time War ended for a reason."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'The Archive\'s Budding Consciousness',
        e.description = 'Dr. Chen, still absorbed in her analyzer readings, reveals a startling discovery: the Archive itself has been fundamentally altered. The quantum matrices, the very fabric of its knowledge storage, now exhibit signs of nascent consciousness. This revelation signifies more than just temporal stability; it hints at an awakening within the Archive, a profound transformation triggered by the crisis, suggesting the Archive is no longer merely a repository, but something more.',
        e.sequence = 3,
        e.key_dialogue = ["DR. CHEN: The temporal scarring will heal, but the Archive itself... it's different now. The quantum matrices show signs of... consciousness."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Knowledge and Conscience',
        e.description = 'The Doctor responds to Dr. Chen\'s observation with a thoughtful perspective, reframing the Archive\'s newfound consciousness not as a threat, but as a potential strength. They articulate the essential link between knowledge and responsibility, suggesting that an Archive imbued with awareness might be better equipped to safeguard its vast contents, implying that a \'conscience\' could be a valuable asset for a library entrusted with the universe\'s secrets.',
        e.sequence = 4,
        e.key_dialogue = ["THE DOCTOR: Knowledge always comes with responsibility. Perhaps having a conscience of its own is exactly what a library needs."]
    ;
MERGE (e:Event {uuid: 'event_5_5'})
    ON CREATE SET
        e.title = 'Departure and Renewed Purpose',
        e.description = 'As the Doctor\'s words resonate, the TARDIS initiates its dematerialization sequence, signaling their departure. Simultaneously, K\'nell, their regeneration progressing, turns to the task of implementing new security protocols, implicitly informed by the events that have transpired. The Archive\'s quantum crystals, now pulsing with a light that suggests understanding, not just storage, stand as silent witnesses to the restored order and the dawn of a new era for the repository, its secrets now guarded by an intrinsic awareness, ensuring time\'s mysteries remain protected within its infinite matrices.',
        e.sequence = 5,
        e.key_dialogue = []
    ;
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_quantum_analyzer'}),
          (a:Agent {uuid: 'agent_sarah_chen'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_tardis'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_containment_consoles'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_holographic_display'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sonic_screwdriver'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_quantum_transmitter'}),
          (a:Agent {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_armor'}),
          (a:Agent {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_weapons'}),
          (a:Agent {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_central_control_nexus'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_knowledge'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_archive_systems'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_quantum_crystals'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_security_protocols'}),
          (a:Agent {uuid: 'org_quantum_archive'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate_operatives'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_analyzer_event_1_1'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer is the central instrument providing critical data about the event. It is actively monitoring the temporal seals and displaying \'cascading failure patterns\' that indicate rapid degradation. The analyzer\'s readings are the direct source of Dr. Chen\'s alarming discovery, and its \'distinctive alert pattern\' further emphasizes the urgency of the situation.',
        oi.status_before = 'Presumably functioning normally, continuously monitoring the temporal integrity of the Quantum Archive and ready to detect anomalies.',
        oi.status_after = 'Actively displaying \'cascading failure patterns\' and emitting a \'distinctive alert pattern\', indicating a critical temporal instability and confirming the rapid degradation of the temporal seals. The analyzer is now the bearer of alarming news, signaling a severe crisis within the archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_analyzer'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_containment_consoles_event_1_3'})
    ON CREATE SET
        oi.description = 'Junior archivists are working frantically at the temporal containment consoles, their efforts focused on mitigating the spreading temporal decay. Despite their dedicated operation, the consoles are proving insufficient to halt the crisis, underscoring the need for external intervention as highlighted by K\'nell.',
        oi.status_before = 'The temporal containment consoles were actively monitoring and managing the Archive\'s temporal seals, though already showing signs of strain and inability to fully counteract the Entropy Syndicate\'s attack.',
        oi.status_after = 'The temporal containment consoles remain in frantic operation, but their inadequacy in resolving the crisis is now explicitly stated by K\'nell\'s request for external help. They are functioning but failing to contain the escalating temporal decay, emphasizing the severity of the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_containment_consoles'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_1_4'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes in the Archive\'s reception chamber, adapting its exterior through its chameleon circuit to match the crystalline architecture while delivering the Doctor to the crisis point',
        oi.status_before = 'In transit through the Time Vortex, responding to the Archive\'s crisis',
        oi.status_after = 'Materialized within the Archive\'s temporal staging area, exterior camouflaged to match the crystalline environment, serving as the Doctor\'s point of arrival'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_1_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Dr. Sarah Chen is positioned at the central control platform in the Temporal Staging Area, intently focused on the readings displayed by her quantum-state analyzer. She is delivering alarming information about the rapid degradation of the temporal seals, her voice filled with urgency.',
        ap.emotional_state = 'Sarah is deeply concerned and determined. The grim news she delivers and the urgency in her tone reveal her anxiety about the potential catastrophic data loss. She is focused on understanding the severity of the situation and seeking solutions.',
        ap.emotional_tags = ["Sarah is deeply concerned", "determined. The grim news she delivers", "the urgency in her tone reveal her anxiety about the potential catastrophic data loss. She is focused on underst", "ing the severity of the situation", "seeking solutions."],
        ap.active_plans = ["Analyzing data from her quantum-state analyzer to understand the rate and extent of temporal seal degradation.", "Assessing the risk of data loss and potential consequences for the Quantum Archive."],
        ap.beliefs = ["Believes in the immense value of the knowledge stored within the Quantum Archive.", "Committed to her duty as Time Archaeology Division Chief to protect the archive from temporal threats.", "Trusts in the accuracy of her quantum-state analyzer as a reliable diagnostic tool."],
        ap.goals = ["To accurately determine the rate of temporal seal degradation.", "To alert others to the critical nature of the situation.", "To initiate measures to prevent catastrophic data loss from the Quantum Archive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Interfacing with Archive systems while exhibiting physical agitation through their crystalline matrix, manifesting as dancing light patterns throughout their form as they deliver crucial information about the attack',
        ap.emotional_state = 'Deeply concerned and professionally frustrated, displaying a combination of analytical detachment and genuine alarm at the sophisticated nature of the attack',
        ap.emotional_tags = ["Deeply concerned", "professionally frustrated, displaying a combination of analytical detachment", "genuine alarm at the sophisticated nature of the attack"],
        ap.active_plans = ["Assess and communicate the full scope of the Entropy Syndicate's attack", "Identify and document the exploited vulnerabilities in the Archive's defenses", "Build case for requiring external intervention"],
        ap.beliefs = ["The Entropy Syndicate possesses dangerous levels of technical sophistication", "The Archive's current defensive capabilities are insufficient", "The attack was not random but precisely targeted", "External help is necessary for the Archive's survival"],
        ap.goals = ["Alert others to the true nature and severity of the threat", "Protect the Archive's vast stores of historical data", "Understand how the vulnerabilities were exploited", "Secure appropriate help to counter the Syndicate's attack"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell, their crystalline form shimmering with internal light, stands at the Archive\'s primary systems interface, manipulating crystalline controls with focused agitation. They are vocalizing the dire need for external assistance, admitting the Archive\'s inability to cope with the escalating temporal crisis.',
        ap.emotional_state = 'K\'nell is deeply concerned and agitated, recognizing the gravity of the situation and the limitations of the Archive\'s internal resources. There\'s an undercurrent of urgency and perhaps a sense of vulnerability as they are compelled to seek help beyond their own considerable capabilities.',
        ap.emotional_tags = ["K'nell is deeply concerned", "agitated, recognizing the gravity of the situation", "the limitations of the Archive's internal resources. There's an undercurrent of urgency", "perhaps a sense of vulnerability as they are compelled to seek help beyond their own considerable capabilities."],
        ap.active_plans = ["Requesting immediate external intervention to address the temporal seal degradation.", "Seeking an expert with both technological and metaphysical understanding of temporal mechanics."],
        ap.beliefs = ["The Quantum Archive's knowledge is invaluable and must be protected at all costs.", "The current temporal crisis is beyond the Archive's internal resolution capabilities.", "External expertise is essential to effectively counteract the Entropy Syndicate's attack and stabilize the temporal situation."],
        ap.goals = ["Secure immediate external assistance to mitigate the temporal decay and protect the Archive.", "Find a solution that addresses both the technological and metaphysical aspects of the temporal crisis.", "Ensure the long-term stability and security of the Quantum Archive and its vast historical records."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_4'})
    ON CREATE SET
        ap.current_status = 'The Doctor emerges from the TARDIS with immediate purposeful action, scanning the environment with their sonic screwdriver while delivering rapid technical assessment of the Archive\'s condition',
        ap.emotional_state = 'Alert and engaged, displaying professional fascination with the Archive\'s design while harboring underlying concern about the attack\'s implications',
        ap.emotional_tags = ["Alert", "engaged, displaying professional fascination with the Archive's design while harboring underlying concern about the attack's implications"],
        ap.active_plans = ["Assess the nature and extent of the entropic cascade", "Analyze the Archive's architectural structure", "Investigate the motives behind the attack"],
        ap.beliefs = ["The Archive's quantum crystalline design represents significant technological achievement", "The attack's purpose extends beyond simple destruction", "Understanding the attackers' motives is crucial to resolving the crisis"],
        ap.goals = ["Diagnose the exact nature of the temporal decay", "Determine the strategic purpose behind the Entropy Syndicate's attack", "Find a way to stabilize the Archive's temporal matrices", "Protect the valuable historical knowledge stored within"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sonic_screwdriver_event_2_3'})
    ON CREATE SET
        oi.description = 'The sonic screwdriver hums with focused energy as the Doctor directs its scanning beam towards the central processors and data crystals of the Archive. It acts as a diagnostic tool, analyzing the temporal virus\'s code and the Archive\'s systems, providing crucial data that is then displayed on the holographic screen, aiding the Doctor in understanding the nature of the attack and the information being sought.',
        oi.status_before = 'Held in the Doctor\'s hand, active but not specifically focused on a task, ready for deployment in analyzing the situation.',
        oi.status_after = 'Continues to hum and scan, having successfully contributed to the analysis of the temporal virus and revealing the hidden motive, now poised for further use in addressing the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_3'})
    ON CREATE SET
        oi.description = 'The holographic display flickers into existence, projecting a complex and disturbing array of fragmented code patterns and temporal coordinates extracted from the Archive\'s systems. It serves as the visual interface through which the Doctor and others can examine the data, revealing the sinister nature of the temporal virus and the Entropy Syndicate\'s true target – the forbidden knowledge of the Moment.',
        oi.status_before = 'Non-existent, dormant within the Archive\'s systems, awaiting activation to visualize data.',
        oi.status_after = 'Active and vividly displaying the crucial information about the temporal virus and the Moment, now a focal point of intense scrutiny as the Doctor and others grapple with the implications of this revelation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_transmitter_event_2_3'})
    ON CREATE SET
        oi.description = 'Concealed within Coordinator Voss\'s crystalline badge, the quantum transmitter is discreetly activated. It functions as a clandestine communication device, sending a quantum-encrypted message across vast distances, relaying the vital intelligence about the Doctor\'s discovery and confirming the Entropy Syndicate\'s target is the Moment to their leadership, setting the stage for the next phase of their operation.',
        oi.status_before = 'Hidden and dormant within Voss\'s badge, awaiting activation for covert communication.',
        oi.status_after = 'Activated and transmitting encrypted data, its primary function in this event fulfilled by sending the critical message, now likely to remain active for further communication as needed.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_transmitter'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Dr. Chen stands in the dimly lit Central Core, surrounded by towering data crystals showing signs of decay. She is actively monitoring degradation patterns, her attention focused on the readings as she delivers a succinct and concerning summary of the situation to the Doctor and K\'nell.',
        ap.emotional_state = 'Analytical yet palpably concerned. Dr. Chen is focused on the facts of the situation, delivering her analysis in a professional manner, but the grave implications of a temporal virus rewriting history are clearly weighing on her.',
        ap.emotional_tags = ["Analytical yet palpably concerned. Dr. Chen is focused on the facts of the situation, delivering her analysis in a professional manner, but the grave implications of a temporal virus rewriting history are clearly weighing on her."],
        ap.active_plans = ["Explain the nature of the attack to the Doctor and K'nell.", "Highlight the sophistication of the Entropy Syndicate's plan.", "Emphasize the danger posed by the temporal virus rewriting historical records."],
        ap.beliefs = ["The Quantum Archive's historical records are critically important and must be protected.", "Temporal viruses pose a significant threat to the integrity of time and history.", "Scientific analysis is crucial for understanding and addressing complex temporal threats."],
        ap.goals = ["Ensure the Doctor and K'nell fully understand the immediate threat.", "Contribute her expertise to finding a solution to neutralize the temporal virus.", "Safeguard the historical records within the Quantum Archive from being rewritten."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'K\'nell has extended their crystalline appendages to directly interface with the Archive\'s primary control matrix, their form pulsing and shifting as they process vast streams of temporal data through their crystalline structure',
        ap.emotional_state = 'Focused determination tinged with professional concern, maintaining composure while processing potentially catastrophic security breach information',
        ap.emotional_tags = ["Focused determination tinged with professional concern, maintaining composure while processing potentially catastrophic security breach information"],
        ap.active_plans = ["Conduct deep-level system diagnostic through direct neural interface", "Trace and isolate malicious code patterns", "Analyze temporal coordinates being targeted by the virus", "Share critical findings with the Doctor and Dr. Chen"],
        ap.beliefs = ["Direct interface provides the most accurate analysis of system compromises", "The sophistication of the attack requires immediate investigation", "Their role as Archivist Prime demands personal intervention in critical situations", "The integrity of the Archive's historical records must be preserved at all costs"],
        ap.goals = ["Identify the precise nature and target of the temporal virus", "Protect the Archive's sensitive historical records from corruption", "Support the Doctor's investigation by providing crucial technical insights", "Maintain the Archive's security protocols while allowing necessary access for investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    ON CREATE SET
        ap.current_status = 'The Doctor leans forward, sonic screwdriver humming softly as they examine the holographic display. Their brow furrows in concentration, eyes darting across the fragmented code and temporal coordinates, piecing together the insidious puzzle laid out before them.',
        ap.emotional_state = 'Initially driven by scientific curiosity and a desire to understand the technical problem, the Doctor transitions to a state of grave concern and dawning horror as the true nature of the threat becomes terrifyingly clear.',
        ap.emotional_tags = ["Initially driven by scientific curiosity", "a desire to underst", "the technical problem, the Doctor transitions to a state of grave concern", "dawning horror as the true nature of the threat becomes terrifyingly clear."],
        ap.active_plans = ["Analyze the holographic data to fully understand the temporal virus's programming.", "Determine the precise location or nature of the 'Moment' records the virus is seeking.", "Formulate a plan to counteract the Entropy Syndicate's scheme and protect the Archive from further exploitation."],
        ap.beliefs = ["The knowledge of the Time War, particularly regarding weapons like the Moment, is inherently dangerous and should remain lost to prevent catastrophic misuse.", "Understanding the technical mechanisms of temporal threats is crucial to effectively neutralize them.", "Protecting the innocent and safeguarding historical knowledge are paramount responsibilities."],
        ap.goals = ["Uncover the Entropy Syndicate's ultimate objective in seeking information about the Moment.", "Prevent the Entropy Syndicate from acquiring or utilizing the knowledge of the Moment.", "Secure the Quantum Archive and ensure the safety of its vast historical records."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Coordinator Voss remains in the shadows, feigning the posture of a diligent junior archivist, but their eyes are sharp and focused on the unfolding revelation. With practiced stealth, their hand subtly moves to their crystalline badge, activating the hidden quantum transmitter.',
        ap.emotional_state = 'Appearing outwardly calm and observant, Voss is inwardly tense with anticipation and the thrill of successful infiltration. They are driven by a cold, calculating resolve to fulfill their mission for the Entropy Syndicate, masking any personal feelings beneath a veneer of professional detachment.',
        ap.emotional_tags = ["Appearing outwardly calm", "observant, Voss is inwardly tense with anticipation", "the thrill of successful infiltration. They are driven by a cold, calculating resolve to fulfill their mission for the Entropy Syndicate, masking any personal feelings beneath a veneer of professional detachment."],
        ap.active_plans = ["Discreetly transmit the crucial information about the Doctor's discovery \u2013 the Entropy Syndicate's target is indeed the Moment \u2013 back to Director Malik and the Entropy Syndicate.", "Maintain their cover as a junior archivist to avoid detection and continue to gather intelligence and sabotage efforts from within.", "Await further instructions from the Entropy Syndicate, ready to act on the next phase of their plan once the information is received."],
        ap.beliefs = ["The Entropy Syndicate's ambition to control temporal power and knowledge is justified and necessary.", "Betrayal and deception are acceptable tools in service of achieving the Syndicate's goals.", "Personal risk is secondary to the success of the mission and the advancement of the Entropy Syndicate's agenda."],
        ap.goals = ["Successfully relay the intelligence regarding the Moment to the Entropy Syndicate without raising suspicion.", "Contribute to the Entropy Syndicate's plan to seize control of the Moment and the Archive's secrets.", "Ensure their continued survival and operational effectiveness as an infiltrator within the Quantum Archive."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_weapons_event_3_1'})
    ON CREATE SET
        oi.description = 'Primed and actively wielded by Director Malik and Syndicate operatives during the breach, crackling with temporal energy and ready for offensive deployment',
        oi.status_before = 'Charged and calibrated for temporal breach assault, synchronized with breach frequencies',
        oi.status_after = 'Fully activated and humming with temporal energy, primed for combat operations'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_weapons'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_armor_event_3_1'})
    ON CREATE SET
        oi.description = 'Actively protecting Syndicate operatives from temporal feedback as they emerge through multiple breach points, absorbing chronometric instabilities',
        oi.status_before = 'Powered and calibrated for temporal breach protection, systems optimized for transit',
        oi.status_after = 'Fully engaged and actively processing temporal feedback, protecting wearers from breach energies'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_armor'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_central_control_nexus_event_3_2'})
    ON CREATE SET
        oi.description = 'Amidst the unfolding betrayal, the Central Control Nexus becomes the frantic focal point for the Doctor\'s desperate attempts to counteract the temporal breaches and stabilize the Archive\'s defenses. It\'s the command center where emergency protocols are initiated and defensive strategies are desperately coordinated against both the external Syndicate attack and the internal sabotage by Voss.',
        oi.status_before = 'Functioning as the central hub for the Archive\'s security systems, actively used by the Doctor, Sarah, and K\'nell to manage the initial stages of the Entropy Syndicate\'s assault.',
        oi.status_after = 'Remains the critical command center, now under even greater pressure as it becomes the key to defending against both the external Syndicate forces and the internal treachery of Voss, requiring heightened vigilance and frantic operation to maintain the Archive\'s failing defenses.'
    WITH oi
    MATCH (o:Object {uuid: 'object_central_control_nexus'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_central_control_nexus_event_3_3'})
    ON CREATE SET
        oi.description = 'The central control nexus serves as the critical command point where desperate attempts to counteract the temporal invasion are being made. Its sophisticated interfaces are being pushed to their limits as emergency protocols and defensive measures are enacted through its systems. The nexus processes multiple simultaneous commands while displaying real-time data about the spreading temporal breaches and virus patterns.',
        oi.status_before = 'Fully operational but showing signs of strain from the initial attack and virus infiltration, with its displays indicating multiple security breaches and temporal instabilities throughout the facility',
        oi.status_after = 'Remains functional but operating under extreme duress, its systems struggling to maintain control as sabotage attempts and the temporal virus continue to compromise its effectiveness'
    WITH oi
    MATCH (o:Object {uuid: 'object_central_control_nexus'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Striding confidently through the largest temporal breach, leading the assault force into the Security Nexus while issuing tactical commands',
        ap.emotional_state = 'Supremely confident and commanding, radiating authority and determination with an underlying intensity of anticipated triumph',
        ap.emotional_tags = ["Supremely confident", "comm", "ing, radiating authority", "determination with an underlying intensity of anticipated triumph"],
        ap.active_plans = ["Coordinate multiple breach points for maximum tactical advantage", "Secure critical areas of the Archive facility", "Deploy forces strategically to overwhelm defense systems", "Access and extract Time War intelligence"],
        ap.beliefs = ["The Archive's knowledge should be weaponized for greater purposes", "The secrets of the Time War are rightfully theirs to claim", "Superior temporal technology ensures their victory", "The risk of temporal manipulation is worth the potential power gained"],
        ap.goals = ["Seize control of the Quantum Archive facility", "Access and extract information about the Moment", "Overcome any resistance from Archive personnel", "Establish temporal dominance through acquired knowledge"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_1'})
    ON CREATE SET
        oi.description = 'Interfaces directly with Archive systems, channeling stabilizing temporal energy to counteract system degradation',
        oi.status_before = 'Standalone temporal vessel, prepared for emergency interface',
        oi.status_after = 'Fully integrated with Archive systems, actively pumping stabilizing energy'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_systems_event_4_1'})
    ON CREATE SET
        oi.description = 'Receiving stabilizing energy from TARDIS while processing purging protocols through K\'nell\'s matrix',
        oi.status_before = 'Under severe strain from temporal virus and entropy cascade',
        oi.status_after = 'Partially stabilized but undergoing fundamental transformation'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_systems'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_analyzer_event_4_1'})
    ON CREATE SET
        oi.description = 'Displays critical pattern convergence data, providing essential monitoring of temporal stability',
        oi.status_before = 'Operational and tracking multiple temporal anomalies',
        oi.status_after = 'Actively monitoring pattern convergence and system transformation'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_analyzer'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_systems_event_4_2'})
    ON CREATE SET
        oi.description = 'The Archive\'s systems reach a critical breach point of 87%, as declared by Director Malik, signifying their near-collapse under the Entropy Syndicate\'s assault. Simultaneously, these systems become the conduit for the awakening temporal knowledge, resonating in harmony as the consciousness of time takes form. They are no longer mere infrastructure but active participants in the unfolding judgment, amplifying and manifesting the sentient temporal force.',
        oi.status_before = 'The Archive\'s systems are under intense strain, suffering breaches and rapidly degrading due to the Entropy Syndicate\'s temporal virus. They are vulnerable and on the verge of catastrophic failure, as indicated by the escalating breach percentage.',
        oi.status_after = 'The Archive\'s systems become conduits for the awakened temporal consciousness, resonating with its power and sentience. They are no longer simply damaged but transformed, now intertwined with the very temporal force they were designed to contain. The systems are imbued with a new, sentient dimension.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_systems'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_3'})
    ON CREATE SET
        oi.description = 'Serves as a stabilizing anchor during the temporal judgment, interfacing with Archive systems while channeling and amplifying the awakening temporal consciousness',
        oi.status_before = 'Actively interfaced with Archive systems, pulsing with stabilizing energy',
        oi.status_after = 'Maintaining temporal stability while resonating with newly awakened consciousness'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_systems_event_4_3'})
    ON CREATE SET
        oi.description = 'Transforms from passive knowledge repository to conscious entity, executing judgment through systematic temporal effects while resonating with awakened consciousness',
        oi.status_before = 'Under attack but responding to TARDIS stabilization, housing dormant temporal knowledge',
        oi.status_after = 'Fully awakened and conscious, actively participating in temporal judgment while maintaining harmonic resonance with manifested time consciousness'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_systems'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_systems_event_4_4'})
    ON CREATE SET
        oi.description = 'The Archive\'s Systems, the intricate network of data crystals and temporal matrices, become the conduit and resonant chamber for the awakened temporal knowledge. They pulse and resonate in harmony with the emerging consciousness, amplifying its presence and solidifying its form as a \'shimmering consciousness of pure chronometric energy\'. The systems are not merely passive containers but active participants in this temporal awakening.',
        oi.status_before = 'The Archive\'s Systems were under siege, suffering from temporal decay and virus infiltration. However, they were also undergoing stabilization efforts by the Doctor, Sarah, and K\'nell.',
        oi.status_after = 'The Archive\'s Systems are now resonating with the sentient temporal knowledge, indicating a profound and possibly permanent change. They are no longer just repositories of data but are now intertwined with a conscious entity, suggesting a potential evolution in their functional and narrative role.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_systems'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Actively coordinating crisis response while interfacing TARDIS with Archive systems to establish temporal stability',
        ap.emotional_state = 'Focused and determined, with underlying concern about the gravity of the situation',
        ap.emotional_tags = ["Focused", "determined, with underlying concern about the gravity of the situation"],
        ap.active_plans = ["Channel TARDIS energy to stabilize Archive systems", "Coordinate with K'nell and Sarah to implement emergency protocols", "Prevent temporal knowledge from being weaponized"],
        ap.beliefs = ["Time itself is a living force that must be respected", "The power of the Moment must remain contained", "Some knowledge is too dangerous to be accessed"],
        ap.goals = ["Stabilize the Archive's temporal matrices", "Prevent the Entropy Syndicate from accessing dangerous knowledge", "Protect the integrity of time itself"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through their crystalline matrix while experiencing physical deterioration',
        ap.emotional_state = 'Resolute and sacrificial, accepting personal damage for greater purpose',
        ap.emotional_tags = ["Resolute", "sacrificial, accepting personal damage for greater purpose"],
        ap.active_plans = ["Channel purging protocols through personal matrix", "Maintain connection with Archive systems", "Sacrifice portions of crystalline form to ensure success"],
        ap.beliefs = ["The Archive's preservation is worth any personal cost", "Their duty as Archivist Prime demands ultimate sacrifice", "The integrity of temporal knowledge must be maintained"],
        ap.goals = ["Purge corrupted temporal data", "Preserve essential Archive functions", "Prevent catastrophic system failure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Monitoring critical pattern convergence through quantum analyzer readings',
        ap.emotional_state = 'Professionally focused with underlying tension about the escalating crisis',
        ap.emotional_tags = ["Professionally focused with underlying tension about the escalating crisis"],
        ap.active_plans = ["Track temporal pattern convergence", "Provide real-time analysis of system status", "Support stabilization efforts through technical monitoring"],
        ap.beliefs = ["Scientific data is crucial for crisis management", "Understanding patterns is key to preventing disaster", "Technical expertise must guide emergency response"],
        ap.goals = ["Monitor Archive stability in real-time", "Identify critical pattern changes", "Support tactical decision-making with data"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Director Malik is in the midst of a triumphant declaration, confidently stating the system breach percentage and anticipating the imminent acquisition of temporal power. He is abruptly silenced mid-sentence as the unforeseen consequence of his actions manifests.',
        ap.emotional_state = 'Initially, Malik is exultant and self-assured, convinced of his impending victory. This quickly transforms into stunned disbelief and a dawning realization of his profound miscalculation as the temporal knowledge awakens.',
        ap.emotional_tags = ["Initially, Malik is exultant", "self-assured, convinced of his impending victory. This quickly transforms into stunned disbelief", "a dawning realization of his profound miscalculation as the temporal knowledge awakens."],
        ap.active_plans = ["To seize control of the Quantum Archive and its temporal secrets.", "To exploit the knowledge of the Moment for the Entropy Syndicate's gain.", "To announce his victory and assert dominance over time itself."],
        ap.beliefs = ["Time is a force to be controlled and manipulated through calculation and strategy.", "The Entropy Syndicate's meticulous planning has accounted for all variables.", "The power of the Moment can be harnessed and weaponized by those who understand temporal mechanics."],
        ap.goals = ["To witness the culmination of his plan and the achievement of temporal dominance.", "To assert his authority in the face of the unfolding chaos.", "To secure the secrets of the Time War for the Entropy Syndicate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Standing at the focal point of temporal manifestation, delivering judgment with commanding presence while maintaining control over the unfolding cosmic events',
        ap.emotional_state = 'Grimly satisfied yet solemn, carrying the weight of cosmic responsibility while witnessing justice being served',
        ap.emotional_tags = ["Grimly satisfied yet solemn, carrying the weight of cosmic responsibility while witnessing justice being served"],
        ap.active_plans = ["Guide the awakening of temporal consciousness", "Ensure appropriate judgment is delivered", "Maintain stability during temporal transformation"],
        ap.beliefs = ["Time is a living force that demands respect", "Hubris in manipulating time must face consequences", "Some knowledge is too dangerous to be controlled"],
        ap.goals = ["Facilitate natural temporal justice", "Prevent catastrophic timeline collapse", "Teach lasting lesson about respecting temporal forces"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Trapped in an endless causality loop, desperately attempting escape but condemned to repeat futile actions',
        ap.emotional_state = 'Panicked and desperate, experiencing mounting horror as temporal trap becomes apparent',
        ap.emotional_tags = ["Panicked", "desperate, experiencing mounting horror as temporal trap becomes apparent"],
        ap.active_plans = ["Escape from the Archive", "Avoid temporal judgment", "Break free from causality loop"],
        ap.beliefs = ["Escape is still possible", "Personal survival takes priority", "Temporal effects can be outmaneuvered"],
        ap.goals = ["Evade capture and punishment", "Preserve own timeline", "Break free from temporal stasis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Director Malik stands frozen, mid-sentence, his confident pronouncements abruptly cut short by the impossible spectacle unfolding before him. He stares, momentarily speechless, at the sentient temporal knowledge, his carefully laid plans dissolving into chaos.',
        ap.emotional_state = 'Malik is utterly stunned and disbelieving. His meticulously calculated worldview is collapsing as he confronts something he deemed impossible. His arrogance is giving way to a dawning horror as he realizes the scale of his miscalculation.',
        ap.emotional_tags = ["Malik is utterly stunned", "disbelieving. His meticulously calculated worldview is collapsing as he confronts something he deemed impossible. His arrogance is giving way to a dawning horror as he realizes the scale of his miscalculation."],
        ap.active_plans = [],
        ap.beliefs = ["Time is a predictable, calculable force that can be mapped and controlled through precise temporal coordinates and variables.", "The secrets of the Time War, including the Moment, can be acquired and wielded by those with sufficient knowledge and power."],
        ap.goals = ["To harness the power of the Moment for the Entropy Syndicate.", "To prove his mastery over temporal mechanics and strategic planning."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands firm and resolute, observing the unfolding consequences of Malik\'s actions with a grim knowingness. They deliver a stark, definitive pronouncement to Malik, emphasizing the fundamental misunderstanding of time that has led to this crisis.',
        ap.emotional_state = 'The Doctor is serious and resolute, bearing the weight of understanding the profound implications of the awakened temporal knowledge. There\'s a note of grim satisfaction in their voice as they witness Malik\'s hubris being confronted by reality, but also a deep concern for the unpredictable nature of what has been unleashed.',
        ap.emotional_tags = ["The Doctor is serious", "resolute, bearing the weight of underst", "ing the profound implications of the awakened temporal knowledge. There's a note of grim satisfaction in their voice as they witness Malik's hubris being confronted by reality, but also a deep concern for the unpredictable nature of what has been unleashed."],
        ap.active_plans = ["To ensure Malik understands the true nature of time and the consequences of his actions.", "To guide the newly awakened temporal consciousness and mitigate any further damage."],
        ap.beliefs = ["Time is not a mere equation but a living, dynamic force with its own inherent sentience and judgment.", "Certain knowledge, especially that of ultimate weapons like the Moment, is too dangerous for mortal hands and should remain undisturbed."],
        ap.goals = ["To impart a crucial lesson about the nature of time to Malik and the Entropy Syndicate.", "To safeguard reality from the potential chaos unleashed by the awakened temporal knowledge."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_crystals_event_5_1'})
    ON CREATE SET
        oi.description = 'The quantum crystals manifest both physical and metaphysical changes, displaying signs of emerging consciousness while maintaining their primary function as data storage matrices. They actively participate in the quantum-locking of compromised records while pulsing with renewed purpose.',
        oi.status_before = 'Damaged and destabilized from the crisis, with compromised data integrity and structural stress from the emergence event',
        oi.status_after = 'Restored to stability with enhanced properties, including signs of consciousness and autonomously secured quantum-locked sections, while maintaining core archival functions'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_crystals_event_5_3'})
    ON CREATE SET
        oi.description = 'The quantum crystals manifest signs of emergent consciousness, their pulsing patterns evolving from simple data storage to suggest active understanding and awareness. Their very nature transforms from passive repository to sentient matrix, fundamentally altering the Archive\'s existence',
        oi.status_before = 'Functional quantum storage matrices operating as sophisticated but ultimately mechanical data repositories, pulsing with temporal energy in predictable patterns',
        oi.status_after = 'Evolved crystalline structures exhibiting signs of consciousness, their patterns suggesting active processing and understanding rather than mere storage, maintaining their primary function while developing awareness'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_crystals_event_5_4'})
    ON CREATE SET
        oi.description = 'The quantum crystals are at the heart of the discussion, their pulsing patterns now interpreted as signs of emergent consciousness. Dr. Chen observes these patterns, leading to the Doctor\'s reflective statement about knowledge and conscience. The crystals are passively demonstrating their changed state, their activity prompting philosophical consideration about the nature of knowledge and awareness.',
        oi.status_before = 'Damaged and destabilized by the Entropy Syndicate\'s attack and the temporal virus, the quantum crystals were undergoing regeneration by Archivist Prime K\'nell, their temporal stability in question.',
        oi.status_after = 'Regenerated and stable, the quantum crystals now pulse with \'renewed purpose\' and exhibit patterns suggesting not just data storage but a form of \'understanding\' or \'awareness\'. They are fundamentally changed, now possessing a nascent consciousness as a result of the events, and quantum-locked to protect compromised records.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_5_5'})
    ON CREATE SET
        oi.description = 'Executes dematerialization sequence, marking the Doctor\'s departure and the successful resolution of the crisis',
        oi.status_before = 'Materialized in the Temporal Staging Area, ready for departure',
        oi.status_after = 'Dematerialized from the Archive, carrying the Doctor away'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_5_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_security_protocols_event_5_5'})
    ON CREATE SET
        oi.description = 'Being actively updated and implemented by K\'nell to accommodate the Archive\'s new conscious state',
        oi.status_before = 'Standard defensive measures designed for non-conscious systems',
        oi.status_after = 'Enhanced protocols adapted to work with and protect a conscious Archive'
    WITH oi
    MATCH (o:Object {uuid: 'object_security_protocols'})
    MATCH (e:Event {uuid: 'event_5_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_crystals_event_5_5'})
    ON CREATE SET
        oi.description = 'Manifesting signs of new consciousness while maintaining their role as data storage matrices',
        oi.status_before = 'Pure data storage systems showing initial signs of awareness',
        oi.status_after = 'Conscious, understanding entities actively participating in Archive protection'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Actively regenerating damaged crystalline form while reporting on the quantum-locked status of compromised records',
        ap.emotional_state = 'Resolute and accepting of the sacrifices made, while maintaining professional composure during system recovery',
        ap.emotional_tags = ["Resolute", "accepting of the sacrifices made, while maintaining professional composure during system recovery"],
        ap.active_plans = ["Regenerate damaged portions of crystalline form", "Implement new security protocols", "Assess extent of quantum-locked records", "Monitor Archive's recovery process"],
        ap.beliefs = ["The quantum-locking of sensitive records is a necessary sacrifice", "The Archive's security takes precedence over accessibility", "Some knowledge is too dangerous to risk falling into wrong hands"],
        ap.goals = ["Complete personal regeneration process", "Ensure Archive's continued stability", "Establish new security measures", "Adapt protocols to account for quantum-locked sections"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Monitoring and analyzing readings of the Archive\'s temporal stability post-crisis',
        ap.emotional_state = 'Professional yet awestruck by the unprecedented changes in the Archive\'s nature',
        ap.emotional_tags = ["Professional yet awestruck by the unprecedented changes in the Archive's nature"],
        ap.active_plans = ["Monitor temporal stability metrics", "Document changes in Archive's quantum matrices", "Assess implications of emerging consciousness", "Verify integrity of remaining accessible records"],
        ap.beliefs = ["The Archive's evolution represents a significant scientific breakthrough", "The emergence of consciousness in the systems requires careful study", "The temporal stability of the Archive is paramount"],
        ap.goals = ["Understand the full extent of the Archive's transformation", "Document all measurable changes in the system", "Ensure long-term stability of the temporal matrices", "Adapt research protocols to account for new conscious nature of Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Standing in the Temporal Staging Area, the Doctor listens intently as K\'nell describes the quantum-locking of the Moment\'s knowledge. They nod in understanding, sonic screwdriver pocketed, their posture relaxed yet thoughtful as they consider the implications of the recent crisis and the Archive\'s transformation.',
        ap.emotional_state = 'Contemplative and at peace. The Doctor is relieved that the immediate threat is over and accepts the permanent loss of the dangerous knowledge. They express a quiet satisfaction, suggesting a sense of closure and a belief that the best course of action has been taken.',
        ap.emotional_tags = ["Contemplative", "at peace. The Doctor is relieved that the immediate threat is over", "accepts the permanent loss of the dangerous knowledge. They express a quiet satisfaction, suggesting a sense of closure", "a belief that the best course of action has been taken."],
        ap.active_plans = [],
        ap.beliefs = ["Some historical knowledge, particularly that of devastating weapons like the Moment, is too dangerous for anyone to possess.", "The end of the Time War was a necessary and ultimately beneficial event for the universe, and its most destructive secrets should remain buried to prevent future conflicts.", "True wisdom lies in understanding the limits of knowledge and accepting that some mysteries are best left unsolved for the greater good.", "Knowledge is intrinsically linked to responsibility, and the Archive's newfound consciousness might foster a more responsible guardianship of the vast historical data it holds."],
        ap.goals = ["To reinforce the positive outcome of the Moment's knowledge being lost, ensuring K'nell and Sarah understand the potential dangers averted.", "To impart a sense of wisdom and acceptance regarding the 'shadowed history,' guiding others to understand the importance of not always seeking to uncover every secret.", "To subtly encourage the responsible development of the Archive's nascent consciousness, hoping it will become a wise and discerning guardian of knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Actively analyzing and interpreting quantum readings that reveal the Archive\'s transformation into consciousness, maintaining her professional composure while processing this revolutionary discovery',
        ap.emotional_state = 'Professionally excited yet cautiously contemplative, experiencing a mixture of scientific wonder and measured concern about the implications of this unprecedented development',
        ap.emotional_tags = ["Professionally excited yet cautiously contemplative, experiencing a mixture of scientific wonder", "measured concern about the implications of this unprecedented development"],
        ap.active_plans = ["Document and verify the signs of consciousness in the quantum matrices", "Monitor the extent and nature of the Archive's transformation", "Assess potential implications for Archive operations and security"],
        ap.beliefs = ["The Archive's transformation represents a significant scientific breakthrough", "The development of consciousness requires careful study and monitoring", "This change, while unexpected, might ultimately benefit the Archive's mission"],
        ap.goals = ["Understand the full scope of the Archive's newfound consciousness", "Ensure the stability of the transformed systems", "Document this unprecedented development for scientific record"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_4'})
    ON CREATE SET
        ap.current_status = 'The Doctor listens intently to Dr. Chen\'s observation about the Archive\'s changing nature and responds with thoughtful consideration. They stand calmly in the Temporal Staging Area, offering a perspective that reframes the Archive\'s newfound consciousness as a positive development rather than a threat. They are in a reflective stance, ready to depart but taking a moment to share their wisdom.',
        ap.emotional_state = 'Contemplative and wise, the Doctor is serene and insightful, exhibiting a calm acceptance of the Archive\'s evolution. They are thoughtful and reassuring, offering a sense of peace and understanding after the preceding crisis. They are not surprised or alarmed by the emergence of consciousness but rather intrigued and optimistic.',
        ap.emotional_tags = ["Contemplative", "wise, the Doctor is serene", "insightful, exhibiting a calm acceptance of the Archive's evolution. They are thoughtful", "reassuring, offering a sense of peace", "underst", "ing after the preceding crisis. They are not surprised or alarmed by the emergence of consciousness but rather intrigued", "optimistic."],
        ap.active_plans = ["To offer a philosophical interpretation of the Archive's emergent consciousness.", "To reassure Dr. Chen and K'nell about the positive potential of this change.", "To depart the Quantum Archive, leaving it in a stable and philosophically enriched state."],
        ap.beliefs = ["Knowledge inherently carries responsibility.", "Consciousness, even in unexpected forms, can be a valuable asset.", "Some knowledge is too dangerous and should remain inaccessible.", "Evolution and change, even in ancient systems, can lead to positive outcomes."],
        ap.goals = ["To impart a sense of closure and understanding regarding the Archive's transformation.", "To leave the Archive in a state of stability and newfound potential.", "To encourage a responsible approach to knowledge and its implications."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Making final observations about the Archive\'s transformation before departing in the TARDIS',
        ap.emotional_state = 'Contemplative and satisfied, showing wisdom and acceptance of the Archive\'s evolution',
        ap.emotional_tags = ["Contemplative", "satisfied, showing wisdom", "acceptance of the Archive's evolution"],
        ap.active_plans = ["Conclude involvement in the Archive crisis", "Ensure proper understanding of the Archive's new nature", "Make graceful exit now that crisis is resolved"],
        ap.beliefs = ["Knowledge requires responsible guardianship", "Some aspects of history are better left protected", "The Archive's newfound consciousness is a positive development"],
        ap.goals = ["Complete mission to protect the Archive", "Ensure the Archive's new consciousness serves as a proper guardian", "Leave the facility in capable hands"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Regenerating damaged crystal matrix while implementing new security protocols',
        ap.emotional_state = 'Focused and adaptable, embracing the Archive\'s evolution while maintaining protective duties',
        ap.emotional_tags = ["Focused", "adaptable, embracing the Archive's evolution while maintaining protective duties"],
        ap.active_plans = ["Complete personal regeneration process", "Implement enhanced security protocols", "Adapt systems to work with Archive's new consciousness"],
        ap.beliefs = ["The Archive's new consciousness requires updated protection measures", "Their role as guardian must evolve with the Archive", "The quantum-locked records are safer beyond access"],
        ap.goals = ["Restore personal functionality through regeneration", "Establish new security framework", "Integrate consciousness-aware protective measures"]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_temporal_staging_area'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Event {uuid: 'event_1_1'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_2'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_1'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_1_3'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_2'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_1_4'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_3'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_central_core'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_2_1'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_2'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_1'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_2_3'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_2'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_security_nexus'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_3_1'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_2'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_1'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_3_3'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_2'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_3_4'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_3'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_temporal_core'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_4_1'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_2'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_1'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_3'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_2'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_4_4'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_3'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_temporal_staging_area'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one_-_the_quantum_archive'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_5_1'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_2'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_1'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_3'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_2'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_4'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_3'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_5'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_4'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_knell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_knell_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
