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
        a.title = 'Time Archaeology Division Chief',
        a.description = 'Sarah Chen is a determined scientist specializing in time archaeology at the Quantum Archive. She is responsible for monitoring and preserving centuries of historical data and ensuring the stability of temporal records through her expertise in quantum-state analysis. Her analytical skills and commitment to historical integrity make her an essential defender against temporal anomalies.',
        a.traits = ["Scientific", "Determined", "Intelligent", "Meticulous", "Analytical", "Committed", "Innovative", "Resourceful"],
        a.sphere_of_influence = 'Temporal Data Preservation'
    ;
MERGE (a:Agent {uuid: 'agent_k_nell'})
    ON CREATE SET
        a.name = 'Knell',
        a.title = 'Archivist',
        a.description = 'K\'nell is an ancient archivist of the Quantum Archive whose crystalline form refracts temporal energies. This enigmatic non-humanoid entity expertly manipulates the Archive\'s control systems and safeguards vast stores of historical knowledge. Known for their profound wisdom, adaptability, and analytical insight, K\'nell plays a central role in defending the Archive against temporal threats.',
        a.traits = ["calm under pressure", "Enigmatic", "Adaptable", "Non-humanoid", "Wise", "Ancient", "Mysterious", "Analytical", "Resilient", "Dedicated", "Insightful", "Methodical"],
        a.sphere_of_influence = 'Historical Data Preservation'
    ;
MERGE (a:Agent {uuid: 'agent_the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'Time Traveler',
        a.description = 'The Doctor is a resourceful and enigmatic time traveler renowned for intervening in crises that jeopardize temporal stability. Arriving via the TARDIS, The Doctor combines technological mastery with ethical insight to mend temporal anomalies and protect the timeline. Their blend of intellect, curiosity, and quick wit makes them a pivotal guardian of time.',
        a.traits = ["Courageous", "Expert in Time Travel", "Brilliant", "Curious", "Resourceful", "Charismatic", "Intelligent", "Enigmatic", "Innovative"],
        a.sphere_of_influence = 'Time Travel and Crisis Management'
    ;
MERGE (a:Agent {uuid: 'agent_coordinator_voss'})
    ON CREATE SET
        a.name = 'Voss',
        a.title = 'Coordinator',
        a.description = 'Coordinator Voss is a covert infiltrator from the Entropy Syndicate posing as a junior archivist within the Quantum Archive. Operating from the shadows, Voss discreetly monitors archival systems and activates covert quantum transmitters to relay sensitive information. Their deceptive expertise and cunning tactics underscore their true allegiance to the Syndicate.',
        a.traits = ["Manipulative", "Stealthy", "Deceptive", "Secretive", "Observant", "Cunning"],
        a.sphere_of_influence = 'Cyber Espionage'
    ;
MERGE (a:Agent {uuid: 'agent_malik'})
    ON CREATE SET
        a.name = 'Malik',
        a.title = 'Director',
        a.description = 'Malik is the ruthless leader of the Entropy Syndicate operatives, commanding temporal weapons and orchestrating strategies to capture the secrets of the Quantum Archive. His cold calculation, strategic acumen, and ambitious drive reveal a determined tactician intent on reshaping temporal phenomena for his own ends.',
        a.traits = ["Driven", "Ruthless", "Calculative", "Ambitious", "Tactical"],
        a.sphere_of_influence = 'Temporal Warfare'
    ;
MERGE (o:Object {uuid: 'object_quantum_state_analyzer'})
    ON CREATE SET
        o.name = 'Quantum-State Analyzer',
        o.description = 'A high-tech device hovering above a control platform, used by Dr. Chen to read and analyze cascading temporal data streams, emitting distinctive alert patterns when anomalies occur. It also displays and alerts to critical convergences in temporal patterns.',
        o.purpose = 'To monitor the integrity of temporal seals, detect rapid degradation of the Archive\'s chronological data, and analyze the Archive\'s quantum states to detect structural weaknesses and pattern convergences.',
        o.significance = 'Represents the scientific effort to safeguard centuries of knowledge and symbolizes the integration of scientific inquiry with the mysterious forces of time.'
    ;
MERGE (o:Object {uuid: 'object_massive_holographic_display'})
    ON CREATE SET
        o.name = 'Massive Holographic Display',
        o.description = 'A towering projection system that renders intricate holograms of fractaling temporal decay and data streams, filling the reception chamber with visualizations of corruption in the Archive\'s systems.',
        o.purpose = 'To provide a visual overview of the facility\'s deteriorating temporal integrity and alert staff to critical zones of decay.',
        o.significance = 'Acts as a narrative focal point for the escalating crisis, highlighting the scope of the Archive\'s challenge and the urgency of intervention.'
    ;
MERGE (o:Object {uuid: 'object_tardis'})
    ON CREATE SET
        o.name = 'TARDIS',
        o.description = 'A time machine and spacecraft with an iconic blue exterior, capable of dematerializing and rematerializing, and equipped with advanced temporal technology.',
        o.purpose = 'To facilitate time travel and enable The Doctor\'s interventions across critical moments in time.',
        o.significance = 'Symbolizes the Doctor\'s proactive role in safeguarding the temporal continuum and his ability to traverse and influence different eras.'
    ;
MERGE (o:Object {uuid: 'object_sonic_screwdriver'})
    ON CREATE SET
        o.name = 'Sonic Screwdriver',
        o.description = 'A multifunctional investigative tool wielded by The Doctor, capable of emitting scanning signals and interfacing with diverse technologies.',
        o.purpose = 'To analyze and interact with the Archive\'s systems, helping to diagnose and reveal anomalies in the data.',
        o.significance = 'Serves as a symbol of The Doctor\'s ingenuity and technological prowess, pivotal for uncovering hidden threats.'
    ;
MERGE (o:Object {uuid: 'object_holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A 3D projection interface that materializes within the Archive\'s central core, presenting fragmented code patterns and temporal coordinates.',
        o.purpose = 'To visualize critical system information and alert the team to the effects of the implanted temporal virus.',
        o.significance = 'Acts as an essential narrative device by revealing hidden data that drives the tension and urgency of the crisis.'
    ;
MERGE (o:Object {uuid: 'object_primary_control_matrix'})
    ON CREATE SET
        o.name = 'Primary Control Matrix',
        o.description = 'A central crystalline interface embedded within the Archive, pulsating with data and temporal signals as it governs core system operations.',
        o.purpose = 'To facilitate direct control and monitoring of the Archive\'s data and temporal protocols during the crisis.',
        o.significance = 'Represents the technological heart of the Archive, whose stability is critical to preserving historical records.'
    ;
MERGE (o:Object {uuid: 'object_quantum_transmitter_badge'})
    ON CREATE SET
        o.name = 'Quantum Transmitter Badge',
        o.description = 'A crystalline badge of office that conceals a quantum transmitter, subtly integrated into its design and activated in covert circumstances.',
        o.purpose = 'To enable hidden communication and data transmission, potentially serving clandestine agendas.',
        o.significance = 'Highlights underlying betrayal and manipulation within the Archive by the Entropy Syndicate.'
    ;
MERGE (o:Object {uuid: 'object_temporal_weapons'})
    ON CREATE SET
        o.name = 'Temporal Weapons',
        o.description = 'Advanced weapons engineered to manipulate time-based phenomena, primed by Director Malik to exploit the Archive\'s temporal vulnerabilities.',
        o.purpose = 'To enforce control over the facility and harness the secrets of the Time War through direct temporal disruption.',
        o.significance = 'They symbolize the aggressive, technology-driven assault of the Entropy Syndicate and serve as a physical manifestation of their attempt to rewrite history.'
    ;
MERGE (o:Object {uuid: 'object_central_control_nexus'})
    ON CREATE SET
        o.name = 'Central Control Nexus',
        o.description = 'A sophisticated control console at the heart of the security nexus, equipped with multiple interfaces for monitoring and managing the facility\'s operational protocols.',
        o.purpose = 'To coordinate emergency responses and stabilize the facility during temporal crises.',
        o.significance = 'It serves as the critical operational hub where the Doctor\'s frantic efforts converge to counter the unfolding entropic disturbances.'
    ;
MERGE (o:Object {uuid: 'object_temporal_breach_alarms'})
    ON CREATE SET
        o.name = 'Temporal Breach Alarms',
        o.description = 'Alarm systems integrated into the facility that activate when spatial and temporal fractures occur, emitting sound and light to signal danger.',
        o.purpose = 'To alert personnel to hazardous temporal breaches and trigger emergency protocols.',
        o.significance = 'They underscore the escalating crisis and provide an auditory reminder of the Archive\'s precarious state as time itself begins to fracture.'
    ;
MERGE (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    ON CREATE SET
        o.name = 'Assembled Temporal Knowledge',
        o.description = 'A shimmering consciousness manifested from dispersed temporal fragments, composed of pure chronometric energy. It materializes as a sentient force that judges its manipulators.',
        o.purpose = 'To enact a judgment on those who attempted to manipulate the power of the Moment, emerging as an autonomous force from the temporal virus.',
        o.significance = 'Embodies the concept that time is a living, self-correcting force that defies manipulation, representing the unintended consequences of tampering with history.'
    ;
MERGE (o:Object {uuid: 'object_archive_quantum_crystals'})
    ON CREATE SET
        o.name = 'Archive Quantum Crystals',
        o.description = 'A network of crystalline data storage units integrated within the Quantum Archive, pulsating with temporal energy and now exhibiting signs of emergent consciousness.',
        o.purpose = 'To securely store vast amounts of historical records in temporal suspension while maintaining the Archive\'s integrity.',
        o.significance = 'Represents the transformation of the Archive into a sentient repository, blurring the lines between inert storage and living knowledge.'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_reception_chamber'})
    ON CREATE SET
        l.name = 'Quantum Archive Reception Chamber',
        l.description = 'A vast crystalline space within the Quantum Archive where translucent walls pulse with chronometric energy and temporal matrices display cascading data streams in ancient languages. It functions as the operational hub where archivists and scientists manage quantum-state analyzers and holographic controls, monitoring the integrity of temporal seals.',
        l.type = 'Facility'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_central_core'})
    ON CREATE SET
        l.name = 'Quantum Archive - Central Core',
        l.description = 'The central processing hub of the Quantum Archive, characterized by towering data crystals that stretch into darkness. The crystals, marred by spreading temporal decay, create discordant patterns that disrupt the usual perfect symmetry of the facility. It serves as the primary control center where critical systems are monitored and manipulated.',
        l.type = 'Facility'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_security_nexus'})
    ON CREATE SET
        l.name = 'Quantum Archive Security Nexus',
        l.description = 'A critical control hub within the Quantum Archive where temporal breach alarms ring out and multiple points in spacetime fracture with entropic energy. This tense area is the frontline of the facility\'s defense, with operatives coordinating emergency protocols amidst the chaotic incursion of Entropy Syndicate forces. Director Malik, temporal weapons primed, steps through the largest breach to assert control as sabotage and countermeasures escalate.',
        l.type = 'Facility Section'
    ;
MERGE (l:Location {uuid: 'location_temporal_core'})
    ON CREATE SET
        l.name = 'Temporal Core',
        l.description = 'The Temporal Core is the beating heart of the Quantum Archive, a chamber where powerful quantum crystals and temporal processors converge. In this scene, it pulses with stabilizing energy as the TARDIS interfaces with the Archive\'s systems. The intense activity is marked by K\'nell channeling purging protocols through their crystalline form and Dr. Chen\'s analyzer detecting critical pattern convergences, setting the stage for the emergence of a shimmering consciousness of pure chronometric energy.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    ON CREATE SET
        l.name = 'Quantum Archive - Temporal Staging Area',
        l.description = 'A crucial part of the Quantum Archive, this area serves as the staging ground where crisis containment and recovery operations take place. The space is marked by pulsating quantum crystals and temporal matrices that not only stabilize the facility\'s time signatures but also hint at an emerging consciousness. It functions both as a reception and operational hub, reflecting the Archive\'s evolving nature.',
        l.type = 'Archive'
    ;
MERGE (o:Organization {uuid: 'org_quantum_archive'})
    ON CREATE SET
        o.name = 'Quantum Archive',
        o.description = 'A repository of temporal knowledge and historical records that safeguards eons of data. In this scene, it is shown evolving beyond a mere storage facility into an entity with emergent consciousness and self-protective protocols.',
        o.sphere_of_influence = 'Temporal and historical domains across the universe.'
    ;
MERGE (o:Organization {uuid: 'org_entropy_syndicate'})
    ON CREATE SET
        o.name = 'Entropy Syndicate',
        o.description = 'A nefarious organization specializing in temporal manipulation and destabilization, the Entropy Syndicate executed a calculated attack on the Quantum Archive by planting a temporal virus and attempting to harness the power of the Moment.',
        o.sphere_of_influence = 'Temporal operations and clandestine manipulations'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_the_quantum_archive'})
    ON CREATE SET
        ep.title = 'Episode One - The Quantum Archive',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Cascading Temporal Decay',
        s.description = 'Set in a vast crystalline reception chamber with translucent walls pulsing with chronometric energy, this scene unfolds as Dr. Sarah Chen scrutinizes alarming data from her quantum-state analyzer while Archivist Prime K\'Nell expertly interfaces with the Archive\'s primary systems. The ancient crystalline being reveals that the Entropy Syndicate has exploited unknown quantum vulnerabilities, triggering a rapid decay in the temporal seals. Frantic junior archivists are shown battling spreading zones of temporal corruption, and tension mounts with every chronometric pulse. Suddenly, a distinctive alert heralds the arrival of the TARDIS as it materializes, introducing The Doctor, whose presence underscores the urgency to counteract the catastrophic entropic cascade.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Dr. Chen Detects Temporal Instability',
        e.description = 'Dr. Sarah Chen stands at the central control platform and observes alarming readings on her quantum-state analyzer. She notices that the temporal seals are degrading at an exponential rate, risking the loss of centuries of data with every chronometric pulse.',
        e.sequence = 1,
        e.key_dialogue = ["These readings can't be right. The temporal seals are degrading at an exponential rate. We're losing centuries of data with every chronometric pulse."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'K\'nell Reports Exploited Vulnerabilities and Calls for Intervention',
        e.description = 'As Dr. Chen monitors the deteriorating readings, Archivist Prime K\'nell manipulates the control interfaces amidst shifting crystalline energy. K\'nell explains that the Entropy Syndicate\'s attack was precisely calculated to exploit unknown quantum vulnerabilities and emphasizes the need for external intervention, as the situation exceeds their current capabilities.',
        e.sequence = 2,
        e.key_dialogue = ["The Entropy Syndicate's attack vector was precisely calculated. They exploited quantum vulnerabilities we didn't know existed.", "We require intervention beyond our capabilities. Someone who understands both the technology and the metaphysical implications."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'The Doctor Arrives as the TARDIS Materializes',
        e.description = 'Following the alert from Dr. Chen\'s analyzer, the atmosphere shimmers with artron energy as the TARDIS materializes in the reception chamber. The Doctor steps out and immediately assesses the crisis, remarking on the catastrophic entropic cascade while pondering the motive behind the attack on the Archive.',
        e.sequence = 3,
        e.key_dialogue = ["Temporal archives experiencing catastrophic entropic cascade. Though I must say - brilliant architecture. Quantum crystalline matrices storing data in temporal suspension. But the real question is - why would someone want to destroy it?"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Hidden Pattern',
        s.description = 'In the Central Core of the Quantum Archive, massive data crystals loom in darkness as their surfaces succumb to swirling temporal decay. The Doctor, armed with a sonic screwdriver, examines the systems while Dr. Chen monitors degradation patterns and reveals that a sophisticated temporal virus is rewriting historical records. K\'nell extends crystalline appendages to interface with a primary control matrix and isolates fragments of the virus code, which appears to be searching for specific temporal coordinates. A holographic display materializes, showing fragmented code and raising alarms about the virus targeting information on the Moment—the ultimate weapon of the Time War. Meanwhile, Coordinator Voss, masquerading as a junior archivist, discreetly activates a hidden quantum transmitter, hinting at ulterior motives.',
        s.scene_number = 2
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Dr. Chen Reports the Temporal Virus',
        e.description = 'In the imposing central core of the Archive, amidst towering data crystals veiled in temporal decay, Dr. Chen analyzes the degradation patterns and alerts the team to a sophisticated breach. She explains that the intruders didn\'t merely bypass the defenses – they implanted a temporal virus that is actively rewriting historical records at the quantum level.',
        e.sequence = 1,
        e.key_dialogue = ["The attack was sophisticated. They didn't just breach our defenses - they implanted something. A temporal virus that's rewriting our historical records at the quantum level."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'K\'nell Interfaces with the Primary Control Matrix',
        e.description = 'K\'nell extends their crystalline appendages to interface directly with the Archive’s primary control matrix. While their form pulses with dynamic data patterns, they analyze isolated fragments of the enemy\'s code, revealing that the virus is methodically searching for specific temporal coordinates.',
        e.sequence = 2,
        e.key_dialogue = ["We've isolated fragments of their code structure. The virus appears to be searching for specific temporal coordinates."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'The Doctor Uncovers the Virus\' True Target',
        e.description = 'With the sonic screwdriver in hand, The Doctor approaches a holographic display that materializes fragmented code patterns and temporal coordinates. After a brief call to inspect the system with a curt \'Let me see,\' their expression shifts from curiosity to grave concern. They deduce that the virus isn’t merely an attack algorithm but is probing for information about the Moment – the ultimate weapon of the Time War, records that were meant to be sealed away. In the background, Coordinator Voss covertly activates a quantum transmitter from their badge, signaling hidden sabotage from within.',
        e.sequence = 3,
        e.key_dialogue = ["Let me see.", "These aren't just attack algorithms. They're searching for information about the Moment - the ultimate weapon of the Time War. Those records were supposed to be destroyed... sealed away in time itself."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Temporal Breach at the Security Nexus',
        s.description = 'Temporal breach alarms reverberate through the facility as multiple spacetime fractures crackle with entropic energy. Entropy Syndicate operatives emerge from these breaches, led by Director Malik, who steps through the largest breach with temporal weapons primed, declaring that the Archive\'s knowledge will serve a greater purpose. Meanwhile, The Doctor works frantically at the central control nexus while Dr. Chen and K\'nell coordinate emergency containment protocols. Amid the chaos, Coordinator Voss reveals their true allegiance by attempting to disable the facility\'s containment fields, highlighting the destructive potential of a virus pattern that is assembling across multiple timeline nodes.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_security_nexus'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Temporal Breach and Malik\'s Command',
        e.description = 'Temporal breach alarms sound and multiple points of spacetime fracture, crackling with entropic energy as Entropy Syndicate operatives emerge from the chaos. Director Malik strides through the largest breach with temporal weapons primed and declares his intent to seize control, asserting that the Archive\'s knowledge will serve a greater purpose and that the secrets of the Time War will finally be theirs.',
        e.sequence = 1,
        e.key_dialogue = ["Secure the facility. The Archive's knowledge will serve a greater purpose. The secrets of the Time War will finally be ours."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Emergency Response and Betrayal Unveiled',
        e.description = 'As the facility plunges further into crisis, The Doctor frantically works at the central control nexus while Dr. Chen and K\'nell coordinate emergency protocols. At the same time, Coordinator Voss reveals their true allegiance by moving to disable the containment fields. Amidst the commotion, The Doctor warns of the dire consequences of the unfolding events and Dr. Chen explains that the virus is assembling components across multiple timeline nodes, hinting at a new emergent threat.',
        e.sequence = 2,
        e.key_dialogue = ["You don't understand what you're dealing with! The Moment wasn't just a weapon - it was consciousness itself, passing judgment on all of time and space!", "Doctor - the virus pattern... it's not just searching. It's assembling something across multiple timeline nodes. Creating something new."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Time\'s Judgment',
        s.description = 'In the Temporal Core, the TARDIS interfaces with the Archive’s systems, pulsing with stabilizing energy as K\'nell\'s crystalline form begins to fracture under the strain of purging protocols. Dr. Chen’s quantum analyzer reveals a critical pattern convergence while Director Malik announces a system breach nearing 87%. Suddenly, the assembled temporal knowledge materializes into a shimmering consciousness of pure chronometric energy, causing the Archive\'s crystals to resonate in unison. The Doctor confronts Malik with the chilling declaration that the Moment\'s power has awakened time itself, and that time now remembers and judges. Amidst the chaos, Entropy Syndicate operatives freeze in temporal stasis and Voss is trapped in a repeating causality loop.',
        s.scene_number = 4
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Temporal Stabilization Initiated',
        e.description = 'The TARDIS interfaces with the Archive\'s systems, pulsing with stabilizing energy as K\'nell channels desperate purging protocols—at the cost of fracturing their crystalline form—while Dr. Chen\'s quantum analyzer displays a critical pattern convergence. This setup underpins the Archive\'s last-ditch efforts to maintain control over the temporal core.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Director Malik\'s Ominous Forecast Interrupted',
        e.description = 'Director Malik announces the facility\'s dire status as he reports a systems breach at 87% and ominously hints that \'the power of time itself\' is imminent. However, his words are abruptly cut short by an unforeseen interruption in the form of an emergent threat.',
        e.sequence = 2,
        e.key_dialogue = ["Systems breach at 87%. Soon the power of time itself will be-"]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Emergence of Assembled Temporal Knowledge',
        e.description = 'Mid-sentence, the scene transforms dramatically as the assembled temporal knowledge materializes—a shimmering consciousness composed of pure chronometric energy. Simultaneously, the Archive\'s quantum crystals resonate in harmonious unison, signaling the birth of an autonomous, judgmental force.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'The Doctor\'s Accusation',
        e.description = 'Seizing the moment, The Doctor steps forward to challenge those responsible for triggering the chaotic events. With a tone of resolute reproach, The Doctor declares that the very act of seeking the Moment\'s power now condemns its pursuers to face its judgment, as time is revealed to be an awakened, living force.',
        e.sequence = 4,
        e.key_dialogue = ["You wanted the Moment's power? Now face its judgment. Time itself has awakened - and it remembers."]
    ;
MERGE (e:Event {uuid: 'event_4_5'})
    ON CREATE SET
        e.title = 'Temporal Stasis and Final Confrontation',
        e.description = 'As The Doctor\'s words echo, the crisis escalates: Entropy Syndicate operatives suddenly freeze in temporal stasis, their timelines reduced to singular, static points, while Voss becomes trapped in an endless causality loop. Director Malik reacts in disbelief, exclaiming about the inevitability of the situation despite their meticulous calculations, only to receive a final, scornful retort from The Doctor that underscores the living, uncontrollable nature of time.',
        e.sequence = 5,
        e.key_dialogue = ["Impossible... we calculated every variable... mapped every temporal coordinate...", "Time isn't an equation to be solved, Director. It's alive. And now, thanks to you, it's aware."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Restoration and Awakening',
        s.description = 'In the Temporal Staging Area of the Quantum Archive, the crisis is now contained. K\'nell works on regenerating their damaged crystal matrix while Dr. Chen monitors the Archive\'s return to temporal stability, even as subtle, fundamental changes hint at a new consciousness within the quantum matrices. The Doctor reflects on the wisdom of leaving certain mysteries untouched, suggesting that this newfound awareness might be exactly what a library needs. As the TARDIS dematerializes and new security protocols are implemented, the Archive\'s pulsing crystals testify to a shift from mere storage to active understanding.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Restoration and Revelation in the Temporal Staging Area',
        e.description = 'As the crisis subsides, K\'nell begins regenerating their damaged crystal matrix while Dr. Chen’s readings indicate that the Archive’s temporal stability is returning to normal despite lingering fundamental changes. During this restoration, K\'nell explains that the compromised records have been quantum-locked by the emergence event—rendering even they unable to access them—and emphasizing that the knowledge of the Moment exists beyond time. The Doctor cautions that some shadows are better left unexplored, reflecting on the conclusion of the Time War, while Dr. Chen observes that although the temporal scarring will heal, the Archive itself appears transformed, its quantum matrices showing emergent signs of consciousness. The Doctor then reinforces that with knowledge comes responsibility.',
        e.sequence = 1,
        e.key_dialogue = ["The compromised records have been quantum-locked by the emergence event. Even we cannot access them now. The knowledge of the Moment truly exists beyond time.", "Some shadows are better left unexplored. The Time War ended for a reason.", "The temporal scarring will heal, but the Archive itself... it's different now. The quantum matrices show signs of... consciousness.", "Knowledge always comes with responsibility. Perhaps having a conscience of its own is exactly what a library needs."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Security Protocols Initiated and TARDIS Departure',
        e.description = 'Following the intense exchange, the scene transitions as the TARDIS dematerializes—signaling The Doctor’s departure—and K\'nell commences the implementation of new security protocols. The Archive’s quantum crystals pulse with renewed purpose, suggesting that the facility not only has stabilized but has also evolved into an entity possessing emergent consciousness, safeguarding its timeless secrets.',
        e.sequence = 2,
        e.key_dialogue = []
    ;
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_quantum_state_analyzer'}),
          (a:Agent {uuid: 'agent_sarah_chen'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_tardis'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sonic_screwdriver'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_quantum_transmitter_badge'}),
          (a:Agent {uuid: 'agent_coordinator_voss'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_weapons'}),
          (a:Agent {uuid: 'agent_malik'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (o:Organization {uuid: 'org_quantum_archive'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_1_1'})
    ON CREATE SET
        oi.description = 'Dr. Sarah Chen uses her quantum-state analyzer to scrutinize the cascading temporal data, identifying rapid degradation of the Archive\'s temporal seals.',
        oi.status_before = 'The analyzer was operating normally, displaying routine temporal readings.',
        oi.status_after = 'The analyzer registers alarming, exponential discrepancies in the temporal seals, indicating imminent data loss.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_massive_holographic_display_event_1_1'})
    ON CREATE SET
        oi.description = 'The massive holographic display projects fractaling patterns of temporal decay across the reception chamber, visually conveying the deteriorating state of the Archive.',
        oi.status_before = 'The display was initially showing standard archival data and environmental information.',
        oi.status_after = 'The display now shows chaotic, spreading zones of decay that mirror the exponential degradation of the temporal seals.'
    WITH oi
    MATCH (o:Object {uuid: 'object_massive_holographic_display'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_1_1'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes into the temporal staging area, its chameleon circuit adapting to the crystalline architecture, heralding the arrival of The Doctor for intervention.',
        oi.status_before = 'Prior to the event, the TARDIS was dematerialized and inactive in the time vortex.',
        oi.status_after = 'Following its materialization, the TARDIS stands ready, integrated into the scene and primed for crisis intervention.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_primary_control_matrix_event_1_1'})
    ON CREATE SET
        oi.description = 'K\'nell engages with the Archive\'s primary control matrix to adjust and stabilize the core systems, attempting to counter the rapid decay exposed by the degrading temporal seals.',
        oi.status_before = 'The primary control matrix was functioning in its routine capacity as a stable interface for system operations.',
        oi.status_after = 'It becomes actively manipulated to address the emergent threats, reflecting the Archive’s struggle to maintain equilibrium.'
    WITH oi
    MATCH (o:Object {uuid: 'object_primary_control_matrix'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_1_2'})
    ON CREATE SET
        oi.description = 'Dr. Chen uses the Quantum-State Analyzer to monitor the deteriorating temporal readings, with its alert pattern highlighting the exponential decay of the Archive\'s temporal seals.',
        oi.status_before = 'The analyzer was steadily reading and displaying normal temporal data streams.',
        oi.status_after = 'The analyzer emits a distinctive alert pattern in response to critical anomalous data, signaling severe temporal degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_massive_holographic_display_event_1_2'})
    ON CREATE SET
        oi.description = 'The Massive Holographic Display projects fractaling patterns of temporal decay, visually conveying the severity of the Archive\'s compromised state to all present.',
        oi.status_before = 'The display was initially operational with standard visualizations of archival data.',
        oi.status_after = 'It now shows rapidly spreading zones of temporal decay, reflecting the crisis affecting the Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object_massive_holographic_display'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_1_2'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes within the temporal staging area, its chameleon circuit adapting to the Archive\'s crystalline environment, marking its arrival as the vehicle carrying The Doctor to intervene in the crisis.',
        oi.status_before = 'Before the event, the TARDIS was dematerialized and in transit through time.',
        oi.status_after = 'It rematerializes in the reception chamber, fully integrated into the scene and ready for action.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_primary_control_matrix_event_1_2'})
    ON CREATE SET
        oi.description = 'Archivist Prime K\'nell interfaces with the Archive\'s primary systems via the Primary Control Matrix, manipulating its crystalline interfaces to counteract the quantum vulnerabilities exploited by the Entropy Syndicate.',
        oi.status_before = 'The control matrix was functioning as the central hub of the Archive, maintaining routine operational protocols.',
        oi.status_after = 'It becomes actively manipulated, showing stress and instability under the targeted quantum assault.'
    WITH oi
    MATCH (o:Object {uuid: 'object_primary_control_matrix'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_1_3'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum-state analyzer emits a distinctive alert pattern that signals the degradation of temporal seals, catalyzing the immediate arrival of the TARDIS and fueling the urgency in the chamber.',
        oi.status_before = 'The analyzer was actively monitoring cascading data streams and quantum states, providing routine readings of the Archive\'s temporal integrity.',
        oi.status_after = 'It displays critical, alarm-driven readings, its alert pattern instrumental in triggering the intervention of The Doctor via the TARDIS.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_massive_holographic_display_event_1_3'})
    ON CREATE SET
        oi.description = 'The massive holographic display projects fractaling patterns of temporal decay, visually depicting the catastrophic entropic cascade and corroborating the quantitative anomalies observed by Dr. Chen.',
        oi.status_before = 'The display was functioning normally, showcasing intricate holographic data and quantum patterns that conveyed the Archive’s usual state.',
        oi.status_after = 'It continues to present spreading zones of decay, emphasizing the severity of the crisis and reinforcing the need for immediate action.'
    WITH oi
    MATCH (o:Object {uuid: 'object_massive_holographic_display'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_1_3'})
    ON CREATE SET
        oi.description = 'Responding to the quantum analyzer\'s alert, the TARDIS materializes in the reception chamber with its chameleon circuit adapting to the crystalline architecture, marking its arrival as a pivotal intervention in the unfolding temporal crisis.',
        oi.status_before = 'The TARDIS was dematerialized, not present in the chamber, poised to respond to emergent temporal anomalies.',
        oi.status_after = 'It materializes with adaptive camouflage, immediately positioning itself to assess and engage with the crisis at the Quantum Archive.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Observing alarming readings on her quantum-state analyzer and questioning the exponential degradation of temporal seals.',
        ap.emotional_state = 'Anxious and determined.',
        ap.emotional_tags = ["Anxious", "determined."],
        ap.active_plans = ["Analyze and interpret the cascading failure patterns", "Collaborate with K'nell and the team to mitigate the threat"],
        ap.beliefs = ["Preserving centuries of data is critical to maintaining historical continuity", "Immediate intervention can stabilize the temporal decay"],
        ap.goals = ["Identify the root cause of the anomalies", "Implement corrective measures to restore temporal integrity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the Archive\'s primary systems and manipulating control interfaces amidst agitated crystalline shifts.',
        ap.emotional_state = 'Agitated yet focused.',
        ap.emotional_tags = ["Agitated yet focused."],
        ap.active_plans = ["Signal the need for intervention beyond their capabilities", "Assess the exploited quantum vulnerabilities"],
        ap.beliefs = ["The Entropy Syndicate's attack was meticulously planned", "The stability of the Archive depends on collaborative intervention"],
        ap.goals = ["Stabilize the degrading temporal seals", "Ensure the Archive's defenses are reinforced against further attacks"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Arriving via the TARDIS, assessing the catastrophic entropic cascade while commenting on the Archive\'s unique architecture.',
        ap.emotional_state = 'Curious and analytical with a hint of wry amusement.',
        ap.emotional_tags = ["Curious", "analytical with a hint of wry amusement."],
        ap.active_plans = ["Evaluate the technological and metaphysical implications of the decay", "Determine the motives behind the destructive actions"],
        ap.beliefs = ["Temporal architecture holds both beauty and vulnerability", "Understanding the threat is key to counteracting it effectively"],
        ap.goals = ["Mitigate the entropic cascade", "Identify the source and underlying cause of the sabotage"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Monitoring quantum-state analyzer readings and noting exponential temporal degradation.',
        ap.emotional_state = 'Deeply concerned and anxious about the rapid loss of historical data.',
        ap.emotional_tags = ["Deeply concerned", "anxious about the rapid loss of historical data."],
        ap.active_plans = ["Analyze anomalous quantum readings", "Alert colleagues to the severity of the decay"],
        ap.beliefs = ["Preserving centuries of historical data is paramount", "Maintaining temporal integrity is critical to avoid catastrophe"],
        ap.goals = ["Stabilize the deteriorating temporal seals", "Prevent irreversible data loss"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Manipulating control interfaces while explaining how the Entropy Syndicate exploited unknown quantum vulnerabilities.',
        ap.emotional_state = 'Agitated and urgent, with a hint of resigned determination.',
        ap.emotional_tags = ["Agitated", "urgent, with a hint of resigned determination."],
        ap.active_plans = ["Coordinate crisis response with internal resources", "Seek external intervention from someone with both technical and metaphysical expertise"],
        ap.beliefs = ["The attack was precisely calculated to exploit our vulnerabilities", "Their current capabilities are insufficient without external aid"],
        ap.goals = ["Secure the Archive's systems", "Mitigate the rapid temporal decay and prevent further damage"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Arriving in the TARDIS and immediately assessing the catastrophic entropic cascade while remarking on the Archive\'s impressive architecture.',
        ap.emotional_state = 'Calmly analytical yet subtly intrigued by the unfolding crisis.',
        ap.emotional_tags = ["Calmly analytical yet subtly intrigued by the unfolding crisis."],
        ap.active_plans = ["Scan and evaluate the temporal matrices", "Determine the motive behind the deliberate attack"],
        ap.beliefs = ["Temporal archives hold vital historical significance", "Technological insight is key to restoring balance and stability"],
        ap.goals = ["Identify and understand the source of the entropic cascade", "Assist in reestablishing temporal stability within the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Analyzing the cascading temporal decay data on her quantum-state analyzer at the control platform.',
        ap.emotional_state = 'Deeply concerned yet determined to avert catastrophic data loss.',
        ap.emotional_tags = ["Deeply concerned yet determined to avert catastrophic data loss."],
        ap.active_plans = ["Monitor the integrity of the temporal seals", "Evaluate the analyzer's alert patterns to identify critical vulnerabilities"],
        ap.beliefs = ["Preserving centuries of historical data is non-negotiable", "Accurate analysis is key to effective crisis resolution"],
        ap.goals = ["Stabilize the Archive\u2019s quantum systems", "Prevent further degradation of historical records"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Interfacing with the Archive\'s primary systems to counteract exploited quantum vulnerabilities.',
        ap.emotional_state = 'Agitated and resolute under mounting pressure.',
        ap.emotional_tags = ["Agitated", "resolute under mounting pressure."],
        ap.active_plans = ["Manipulate control interfaces to curb the decay", "Identify the precise attack vector of the Entropy Syndicate"],
        ap.beliefs = ["The integrity of the Archive\u2019s historical records is essential", "Every quantum vulnerability must be addressed promptly"],
        ap.goals = ["Mitigate the impact of the attack", "Secure the Archive by restoring compromised systems"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Stepping out of the TARDIS to assess the catastrophic entropic cascade and examine the Archive’s striking quantum architecture.',
        ap.emotional_state = 'Inquisitive and critically observant, with an undercurrent of urgency.',
        ap.emotional_tags = ["Inquisitive", "critically observant, with an undercurrent of urgency."],
        ap.active_plans = ["Investigate the root cause of the entropic cascade", "Determine the motive behind the calculated attack on the Archive"],
        ap.beliefs = ["Understanding the underlying motives is key to resolving temporal threats", "Every architectural detail can provide clues to the crisis at hand"],
        ap.goals = ["Uncover the mystery behind the attack", "Develop a plan to restore temporal stability and safeguard the Archive"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sonic_screwdriver_event_2_1'})
    ON CREATE SET
        oi.description = 'The Doctor uses the sonic screwdriver to scan and examine the Archive\'s central core systems, identifying the implanted temporal virus and aberrant attack algorithms.',
        oi.status_before = 'The sonic screwdriver was in its standard operational state, a trusted investigative tool in The Doctor\'s hands.',
        oi.status_after = 'It remains functional and has gathered critical data about the virus, reinforcing its role in diagnosing temporal anomalies.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_primary_control_matrix_event_2_1'})
    ON CREATE SET
        oi.description = 'K\'nell interfaces with the primary control matrix to isolate fragments of the virus\'s code structure, aiding in the detection of the temporal coordinates being targeted.',
        oi.status_before = 'The primary control matrix was an integral component of the Archive\'s core system, routinely regulating data and temporal signals.',
        oi.status_after = 'It now displays anomalous data patterns and virus-induced distortions, evidencing tampering by the temporal virus.'
    WITH oi
    MATCH (o:Object {uuid: 'object_primary_control_matrix'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_1'})
    ON CREATE SET
        oi.description = 'A holographic display materializes to project fragmented code and temporal coordinates, providing a visual representation of the virus\'s impact on the Archive\'s records.',
        oi.status_before = 'The holographic display was dormant, not actively projecting any data prior to the event.',
        oi.status_after = 'It becomes active, vividly presenting disjointed code patterns that reveal the virus\'s search for the historical records of the Moment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_transmitter_badge_event_2_1'})
    ON CREATE SET
        oi.description = 'Coordinator Voss discreetly activates the quantum transmitter concealed within their badge, initiating covert communication to relay sensitive archival data to the Entropy Syndicate.',
        oi.status_before = 'The quantum transmitter badge was in an inactive state, quietly worn as a standard issue by Voss.',
        oi.status_after = 'It is activated, emitting encrypted quantum signals and serving as an instrument for clandestine data transmission.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_transmitter_badge'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_primary_control_matrix_event_2_2'})
    ON CREATE SET
        oi.description = 'K\'nell extends their crystalline appendages to interface directly with the Archive’s primary control matrix, using it to analyze isolated fragments of enemy code and deduce that the virus is searching for specific temporal coordinates.',
        oi.status_before = 'The primary control matrix was operating in its standard monitoring mode, managing core system operations.',
        oi.status_after = 'The matrix is actively interfaced by K\'nell, its data streams pulsing with diagnostic feedback about the virus\'s code structure and temporal inquiry.'
    WITH oi
    MATCH (o:Object {uuid: 'object_primary_control_matrix'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sonic_screwdriver_event_2_2'})
    ON CREATE SET
        oi.description = 'The Doctor uses their sonic screwdriver to examine the central systems, scanning for signs of the temporal virus and its manipulation of historical records.',
        oi.status_before = 'The sonic screwdriver was inactive, resting in The Doctor\'s possession until called into use.',
        oi.status_after = 'It is actively emitting scanning signals and interfacing with the Archive’s central processors to provide crucial diagnostic information.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_2'})
    ON CREATE SET
        oi.description = 'A holographic display materializes, projecting fragmented code patterns and temporal coordinates that illustrate the virus\'s systematic search for information about the Moment.',
        oi.status_before = 'The holographic display was not active prior to the event.',
        oi.status_after = 'It now presents dynamic, fragmented data, aiding The Doctor and Dr. Chen in understanding the virus\'s target and methodology.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_transmitter_badge_event_2_2'})
    ON CREATE SET
        oi.description = 'Coordinator Voss discreetly activates the quantum transmitter hidden within their crystalline badge, initiating covert data transmission to relay sensitive information to the Entropy Syndicate.',
        oi.status_before = 'The badge was merely an innocuous identifier carried by Voss.',
        oi.status_after = 'It has been activated and is now serving as a clandestine transmission device, supporting the Syndicate\'s covert operations.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_transmitter_badge'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sonic_screwdriver_event_2_3'})
    ON CREATE SET
        oi.description = 'The Doctor utilizes the sonic screwdriver to scan and analyze the holographic display, deciphering fragmented code patterns that hint at the virus’s true target – the Moment.',
        oi.status_before = 'The sonic screwdriver was in The Doctor\'s possession, functioning normally as an investigative tool.',
        oi.status_after = 'It remains in active use, continuing to emit scanning signals as The Doctor assesses the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_3'})
    ON CREATE SET
        oi.description = 'A holographic display materializes in the Archive\'s central core, projecting fragmented temporal code and coordinates that reveal the virus is probing for records of the Moment.',
        oi.status_before = 'The display was inactive and unmanifested prior to the event.',
        oi.status_after = 'It is fully activated, broadcasting crucial fragmented data that intensifies the urgency of the investigation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_transmitter_badge_event_2_3'})
    ON CREATE SET
        oi.description = 'Coordinator Voss covertly activates the quantum transmitter hidden within their badge, sending sabotage signals that further complicate the Archive’s crisis.',
        oi.status_before = 'The badge was in its dormant state, serving as a standard insignia with a concealed transmitter.',
        oi.status_after = 'It has been activated discreetly, transmitting covert signals to aid in the Syndicate’s hidden agenda.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_transmitter_badge'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Analyzing degradation patterns and alerting the team about the temporal virus breach.',
        ap.emotional_state = 'Focused and concerned',
        ap.emotional_tags = ["Focused", "concerned"],
        ap.active_plans = ["Monitor degradation patterns in the central core", "Inform the team and assess the virus impact"],
        ap.beliefs = ["The integrity of historical records is paramount", "A sophisticated breach requires immediate and precise intervention"],
        ap.goals = ["Identify the virus's mechanisms and origins", "Implement countermeasures to stop the rewriting of historical records"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Interfacing directly with the primary control matrix to isolate fragments of the intruder\'s code.',
        ap.emotional_state = 'Analytical with underlying urgency',
        ap.emotional_tags = ["Analytical with underlying urgency"],
        ap.active_plans = ["Isolate and analyze virus code fragments", "Determine the specific temporal coordinates sought by the intruders"],
        ap.beliefs = ["Data patterns can reveal vulnerabilities in the breach", "Precise manipulation of the control systems can counteract the virus"],
        ap.goals = ["Safeguard the Archive's temporal coordinates", "Support and enhance system defenses against the virus"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Examining the Archive\'s systems with the sonic screwdriver and assessing the severe threat.',
        ap.emotional_state = 'Grave concern mixed with resoluteness',
        ap.emotional_tags = ["Grave concern mixed with resoluteness"],
        ap.active_plans = ["Investigate the virus's objectives and its link to the Moment", "Assess and mitigate the risk of the breached information being exploited"],
        ap.beliefs = ["The records of the Moment must remain sealed to avoid catastrophic consequences", "Intervening quickly is essential to re-establish temporal stability"],
        ap.goals = ["Prevent the intruders from retrieving dangerous historical data", "Stabilize the central core's systems before further damage occurs"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Observing covertly from the shadows and discreetly activating a quantum transmitter via a concealed badge.',
        ap.emotional_state = 'Calculated and covert',
        ap.emotional_tags = ["Calculated", "covert"],
        ap.active_plans = ["Relay sensitive data back to the Entropy Syndicate", "Manipulate the Archive's systems subtly from within the shadows"],
        ap.beliefs = ["Stealth and subterfuge provide a strategic edge", "Infiltration during a crisis presents unique opportunities for exploitation"],
        ap.goals = ["Exploit the breach for the Syndicate's benefit", "Secure critical temporal data regarding the Moment for future advantage"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Monitoring degradation patterns of the data crystals in the central core while analyzing the impact of the implanted temporal virus.',
        ap.emotional_state = 'Concerned and determined.',
        ap.emotional_tags = ["Concerned", "determined."],
        ap.active_plans = ["Assess the virus's mechanisms by correlating degradation patterns with quantum analyzer data.", "Coordinate with K'nell and The Doctor to develop an effective countermeasure."],
        ap.beliefs = ["The virus is a deliberate act aimed at rewriting historical records.", "Scientific inquiry and precise data analysis are essential to safeguard the Archive."],
        ap.goals = ["Stabilize the Archive's historical records against quantum-level rewriting.", "Ensure the integrity of the temporal system."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Extending crystalline appendages to interface directly with the Archive’s primary control matrix and analyzing isolated enemy code fragments.',
        ap.emotional_state = 'Focused and analytical.',
        ap.emotional_tags = ["Focused", "analytical."],
        ap.active_plans = ["Isolate and interpret the fragments of enemy code.", "Determine the specific temporal coordinates targeted by the virus."],
        ap.beliefs = ["Decoding the enemy's strategy is critical to counteracting their temporal virus.", "Every fragment of data can expose the vulnerability in the threat\u2019s design."],
        ap.goals = ["Identify the temporal coordinates the virus is searching for.", "Support the Archive\u2019s defenses by providing actionable insights."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Examining the Archive\'s systems with the sonic screwdriver and assessing the holographic display of fragmented code patterns.',
        ap.emotional_state = 'Curious yet increasingly grave.',
        ap.emotional_tags = ["Curious yet increasingly grave."],
        ap.active_plans = ["Investigate the nature of the attack algorithms and their connection to the Moment.", "Collaborate with Dr. Chen and K'nell to formulate a response strategy."],
        ap.beliefs = ["The virus is more than a standard attack\u2014it seeks forbidden information about the Moment.", "Understanding its mechanism is crucial for preventing catastrophic temporal consequences."],
        ap.goals = ["Determine the underlying motive behind the virus\u2019s search.", "Prevent the activation of the Moment as an uncontrollable weapon."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Observing discreetly from a shadowed alcove and activating a quantum transmitter using a concealed badge.',
        ap.emotional_state = 'Calculating and secretive.',
        ap.emotional_tags = ["Calculating", "secretive."],
        ap.active_plans = ["Relay critical data on the Archive\u2019s vulnerabilities to the Entropy Syndicate.", "Maintain low profile while gathering intelligence."],
        ap.beliefs = ["Inside access to the Archive\u2019s crisis provides a strategic advantage.", "Accurate and timely intelligence is vital for the Syndicate\u2019s broader objectives."],
        ap.goals = ["Communicate the Archive\u2019s compromised security status to superiors.", "Exploit the situation to further destabilize the Archive from within."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Examining the holographic display with the sonic screwdriver and analyzing the fragmented code patterns.',
        ap.emotional_state = 'Curious at first but quickly shifting to grave concern.',
        ap.emotional_tags = ["Curious at first but quickly shifting to grave concern."],
        ap.active_plans = ["Investigate the virus behavior", "Determine the threat level to the Moment"],
        ap.beliefs = ["Temporal integrity must be maintained", "Records meant to be sealed should remain destroyed"],
        ap.goals = ["Prevent the virus from retrieving information about the Moment", "Restore security to the Archive's systems"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Monitoring degradation patterns and explaining the sophisticated virus attack to colleagues.',
        ap.emotional_state = 'Analytical and deeply concerned.',
        ap.emotional_tags = ["Analytical", "deeply concerned."],
        ap.active_plans = ["Monitor critical degradation indicators", "Analyze the virus implantation and its effects on historical records"],
        ap.beliefs = ["The breach is a deliberate and sophisticated attack", "Historical records must be protected at all costs"],
        ap.goals = ["Diagnose the system breach", "Stabilize and safeguard the temporal integrity of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Interfacing directly with the primary control matrix to isolate virus code fragments.',
        ap.emotional_state = 'Focused and methodical.',
        ap.emotional_tags = ["Focused", "methodical."],
        ap.active_plans = ["Isolate and analyze the virus's code structure", "Counteract the spreading temporal decay through direct system intervention"],
        ap.beliefs = ["Every anomaly must be contained to protect the Archive", "Swift data isolation is key to preserving temporal stability"],
        ap.goals = ["Contain the virus threat", "Stabilize the critical temporal coordinates of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Observing from a shadowed alcove and covertly activating a quantum transmitter from their badge.',
        ap.emotional_state = 'Calculated and secretive.',
        ap.emotional_tags = ["Calculated", "secretive."],
        ap.active_plans = ["Sabotage the Archive's security systems covertly", "Relay critical data back to the Entropy Syndicate"],
        ap.beliefs = ["The Archive's vulnerabilities can be exploited for our gain", "Accessing sealed historical records will provide significant advantage"],
        ap.goals = ["Facilitate the extraction of valuable data", "Undermine the Archive's defenses from within"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_breach_alarms_event_3_1'})
    ON CREATE SET
        oi.description = 'The Temporal Breach Alarms sound throughout the facility as spacetime fractures and entropic energy crackles, alerting every operative to the imminent danger and triggering emergency protocols.',
        oi.status_before = 'The alarms were in a standby state, integrated into the facility’s safety systems and waiting for a trigger.',
        oi.status_after = 'They are actively blaring, continuously signaling the temporal breaches and adding to the chaotic ambiance of the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_weapons_event_3_1'})
    ON CREATE SET
        oi.description = 'Director Malik strides through the breach with the Temporal Weapons primed, ready to enforce his control over the Archive and wield the destructive power of temporal manipulation.',
        oi.status_before = 'The weapons were secured and in standby mode, part of the Entropy Syndicate\'s arsenal.',
        oi.status_after = 'They are actively engaged, primed and poised for use as Malik asserts his authority and prepares for confrontation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_weapons'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_central_control_nexus_event_3_1'})
    ON CREATE SET
        oi.description = 'The Doctor works frantically at the Central Control Nexus, utilizing its multiple interfaces to monitor the breaches and coordinate the emergency countermeasures against the incursion.',
        oi.status_before = 'The control nexus was operating normally as the nerve center of facility operations.',
        oi.status_after = 'It is under intense strain, fully engaged in crisis management and reflecting the chaos of the unfolding temporal breaches.'
    WITH oi
    MATCH (o:Object {uuid: 'object_central_control_nexus'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_central_control_nexus_event_3_2'})
    ON CREATE SET
        oi.description = 'The Doctor frantically operates the central control nexus, desperately trying to reroute systems and stabilize the facility amid the temporal breaches.',
        oi.status_before = 'The control nexus was functioning under normal security protocols, maintaining routine system operations.',
        oi.status_after = 'The nexus is overwhelmed with frantic input and system alerts, reflecting the chaos and urgency of the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_central_control_nexus'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_breach_alarms_event_3_2'})
    ON CREATE SET
        oi.description = 'The temporal breach alarms activate as spacetime fractures occur, signaling the imminent danger and alerting personnel of the unfolding emergency.',
        oi.status_before = 'The alarms were inactive during a period of normal operation before the breach.',
        oi.status_after = 'The alarms are blaring continuously, saturating the environment with urgent signals of temporal instability.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_breach_alarms'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_weapons_event_3_2'})
    ON CREATE SET
        oi.description = 'Director Malik primes the temporal weapons as he steps through the largest breach, using them to assert control and further the Entropy Syndicate’s agenda.',
        oi.status_before = 'The temporal weapons were on standby, secured as part of the Syndicate’s armaments.',
        oi.status_after = 'The weapons are activated and aimed, embodying the imminent threat and readiness for combat in the crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_weapons'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Striding through the largest breach with temporal weapons primed, issuing commands to secure the facility.',
        ap.emotional_state = 'Determined and ruthless, exuding a cold confidence.',
        ap.emotional_tags = ["Determined", "ruthless, exuding a cold confidence."],
        ap.active_plans = ["Secure control of the facility", "Utilize temporal weapons to suppress resistance"],
        ap.beliefs = ["The Archive's knowledge is the key to unparalleled power", "Harnessing the secrets of the Time War will reshape their destiny"],
        ap.goals = ["Seize control of the Quantum Archive", "Establish dominance by appropriating the Time War\u2019s secrets"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Working frantically at the central control nexus to counteract the breach and mitigate the entropic threat.',
        ap.emotional_state = 'Anxious yet resolute, driven by urgency.',
        ap.emotional_tags = ["Anxious yet resolute, driven by urgency."],
        ap.active_plans = ["Stabilize the control systems to prevent further temporal damage", "Intervene before the Moment's power is misused"],
        ap.beliefs = ["The Moment is more than a weapon\u2014it embodies consciousness capable of judgment", "Intervention now is essential to preserve time and space"],
        ap.goals = ["Halt the sabotage efforts", "Safeguard the temporal integrity of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols while analyzing virus patterns assembling across timeline nodes.',
        ap.emotional_state = 'Focused and concerned, balancing urgency with analytical precision.',
        ap.emotional_tags = ["Focused", "concerned, balancing urgency with analytical precision."],
        ap.active_plans = ["Monitor and decode the virus patterns", "Support coordinated countermeasures to stabilize the Archive"],
        ap.beliefs = ["Understanding the virus is key to thwarting its potential to restructure history", "Preserving temporal continuity is paramount"],
        ap.goals = ["Prevent the virus from rewriting critical historical data", "Restore and secure the quantum systems of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Assisting Dr. Chen by coordinating defense protocols and interfacing with the Archive’s crystalline systems.',
        ap.emotional_state = 'Resolute and sacrificial, with a deep-seated commitment to preserving temporal order.',
        ap.emotional_tags = ["Resolute", "sacrificial, with a deep-seated commitment to preserving temporal order."],
        ap.active_plans = ["Utilize crystalline interfaces to reinforce Archive defenses", "Implement rapid countermeasures against the Syndicate operatives"],
        ap.beliefs = ["The integrity of temporal records must be preserved at all costs", "Personal sacrifice is justified to uphold the Archive\u2019s stability"],
        ap.goals = ["Maintain control over the Archive\u2019s systems", "Ensure the temporal breach is contained"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance by moving to disable the containment fields, actively sabotaging the defense protocols.',
        ap.emotional_state = 'Cold and calculating, driven by opportunistic ambition.',
        ap.emotional_tags = ["Cold", "calculating, driven by opportunistic ambition."],
        ap.active_plans = ["Sabotage the Archive's security measures", "Facilitate the entrance of additional Syndicate operatives"],
        ap.beliefs = ["Destabilizing the Archive will pave the way for the Syndicate\u2019s rise", "Chaos can be exploited for ultimate control over temporal secrets"],
        ap.goals = ["Overthrow the Archive's existing protocols", "Ensure the Syndicate gains access to the Archive\u2019s hidden knowledge"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Frantically working at the central control nexus while warning of the catastrophic consequences of the virus assembly.',
        ap.emotional_state = 'Urgent and resolute, with a sense of mounting alarm.',
        ap.emotional_tags = ["Urgent", "resolute, with a sense of mounting alarm."],
        ap.active_plans = ["Stabilize the central control systems", "Prevent the virus-induced temporal cascade"],
        ap.beliefs = ["The emergent consciousness of 'The Moment' must be contained at all costs", "Immediate action is crucial to preserve temporal integrity"],
        ap.goals = ["Secure the facility's systems", "Stop further temporal breaches", "Prevent reality from fracturing"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Coordinating emergency protocols and analyzing the virus pattern assembling across multiple timeline nodes.',
        ap.emotional_state = 'Focused and concerned, with a scientific resolve.',
        ap.emotional_tags = ["Focused", "concerned, with a scientific resolve."],
        ap.active_plans = ["Assess the multi-timeline assembly of the virus", "Coordinate with K'nell to safeguard the Archive"],
        ap.beliefs = ["Understanding the virus's behavior is key to containment", "Every temporal anomaly must be addressed to avoid further damage"],
        ap.goals = ["Contain the viral threat", "Develop countermeasures against the emergent threat", "Restore stability to the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Assisting in coordinating the emergency protocols and reinforcing the facility\'s defenses.',
        ap.emotional_state = 'Determined and composed with an underlying readiness to sacrifice if necessary.',
        ap.emotional_tags = ["Determined", "composed with an underlying readiness to sacrifice if necessary."],
        ap.active_plans = ["Interface with the control systems to counteract the virus", "Support Dr. Chen's stabilization efforts"],
        ap.beliefs = ["Preserving the Archive is paramount, even at high personal cost", "Every fragment of temporal energy must be managed to maintain order"],
        ap.goals = ["Stabilize the temporal matrices", "Ensure the Archive's defenses hold against the crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Revealing true allegiance by moving to disable the containment fields.',
        ap.emotional_state = 'Cunning and deceptive, masking malice beneath apparent calm.',
        ap.emotional_tags = ["Cunning", "deceptive, masking malice beneath apparent calm."],
        ap.active_plans = ["Sabotage the Archive\u2019s emergency protocols", "Facilitate the Entropy Syndicate's control over the facility"],
        ap.beliefs = ["The Archive's secrets are rightfully ours to command", "Sabotage is necessary to secure power"],
        ap.goals = ["Assist in the Entropy Syndicate's takeover of the facility", "Undermine the coordinated defenses of the team"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Leading Entropy Syndicate operatives into the breach with temporal weapons primed.',
        ap.emotional_state = 'Cold, determined, and ruthlessly ambitious.',
        ap.emotional_tags = ["Cold, determined,", "ruthlessly ambitious."],
        ap.active_plans = ["Overwhelm the facility's defenses", "Exploit temporal vulnerabilities to seize control of the Archive"],
        ap.beliefs = ["The knowledge of the Time War should be harnessed by those capable of using it", "The Archive must serve a greater purpose under Entropy Syndicate leadership"],
        ap.goals = ["Capture the Quantum Archive", "Exploit its secrets to reshape the temporal landscape"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_1'})
    ON CREATE SET
        oi.description = 'The TARDIS interfaces with the Archive\'s systems, emitting a pulse of stabilizing energy that underpins the desperate effort to maintain control over the temporal core.',
        oi.status_before = 'The TARDIS was in its standard standby state, parked away from the Archive\'s systems.',
        oi.status_after = 'The TARDIS is actively interfaced with the Archive, pulsing with energy as it helps stabilize the failing temporal matrices.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_4_1'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer displays a critical pattern convergence, alerting the team to the imminent systemic collapse and the evolving threat within the temporal core.',
        oi.status_before = 'The quantum analyzer was monitoring routine temporal data streams with regular precision.',
        oi.status_after = 'It now highlights unstable convergences, signaling that the Archive\'s systems are on the brink of transformative change.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_assembled_temporal_knowledge_event_4_1'})
    ON CREATE SET
        oi.description = 'From scattered temporal fragments, the assembled temporal knowledge materializes as a sentient consciousness that brings judgment to those who attempted its manipulation.',
        oi.status_before = 'Temporal fragments were dispersed and latent within the Archive\'s decaying data structures.',
        oi.status_after = 'They coalesce into a clear, sentient form that actively enforces the judgment of time against the operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_4_1'})
    ON CREATE SET
        oi.description = 'The Archive Quantum Crystals resonate in harmony as the temporal core stabilizes and the newly awakened consciousness influences the Archive\'s structural energy.',
        oi.status_before = 'The crystals stored vast historical data in calm temporal suspension.',
        oi.status_after = 'They now pulsate with emergent, resonant energy, reflecting their integration with the awakened temporal force.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_2'})
    ON CREATE SET
        oi.description = 'The TARDIS is interfaced with the Archive\'s systems at the Temporal Core, pulsing with stabilizing energy that helps counteract the accelerating temporal chaos as the emergent threat manifests.',
        oi.status_before = 'The TARDIS was inactive, stationed and awaiting activation during quieter moments.',
        oi.status_after = 'The TARDIS is actively engaged with the Archive, emitting stabilizing energy and underscoring its role as a lifeline in the face of temporal crisis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_assembled_temporal_knowledge_event_4_2'})
    ON CREATE SET
        oi.description = 'The Assembled Temporal Knowledge coalesces into a sentient, shimmering consciousness of pure chronometric energy that abruptly halts Malik’s announcement and begins judging its manipulators.',
        oi.status_before = 'Previously, the temporal fragments were dispersed and unconnected, lacking coherent consciousness.',
        oi.status_after = 'They have unified into an autonomous force, actively disrupting the Entropy Syndicate\'s plans and imposing a judgment upon those who sought to harness time.'
    WITH oi
    MATCH (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_4_2'})
    ON CREATE SET
        oi.description = 'The Archive Quantum Crystals resonate in harmony during the crisis, visually reflecting and amplifying the emergent sentient energy of the temporal cascade while aiding in stabilizing the facility\'s core systems.',
        oi.status_before = 'The crystals functioned solely as stable, data-storing elements within the Archive.',
        oi.status_after = 'They now exhibit signs of emergent consciousness, synchronizing with the awakened temporal force and contributing to the overall stabilization of time.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_3'})
    ON CREATE SET
        oi.description = 'The TARDIS pulses with stabilizing energy while interfacing with the Archive\'s systems, serving as a critical technological anchor amid the temporal cascade.',
        oi.status_before = 'Actively interfacing and maintaining a stable temporal connection with the Archive\'s systems.',
        oi.status_after = 'Continuing to emit stabilizing energy as the temporal crisis escalates and the sentient knowledge emerges.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_4_3'})
    ON CREATE SET
        oi.description = 'Dr. Chen\'s quantum analyzer displays critical pattern convergences, signaling the unfolding transformation within the Archive and the materialization of a sentient temporal force.',
        oi.status_before = 'Functioning normally by reading standard temporal data patterns.',
        oi.status_after = 'Indicating anomalous convergences that herald the emergence of autonomous temporal knowledge.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_assembled_temporal_knowledge_event_4_3'})
    ON CREATE SET
        oi.description = 'The assembled temporal knowledge materializes as a shimmering consciousness of pure chronometric energy, embodying time\'s judgment and overseeing the sudden crystallization of fate within the Archive.',
        oi.status_before = 'Existing as scattered, fragmented temporal data across multiple timelines.',
        oi.status_after = 'Cohesively aggregated into a sentient force that initiates a judgmental cascade over its would-be manipulators.'
    WITH oi
    MATCH (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_4_3'})
    ON CREATE SET
        oi.description = 'The Archive\'s quantum crystals resonate in harmonious unison as they react to the emergence of the sentient temporal knowledge, signifying an evolution in the Archive\'s awareness.',
        oi.status_before = 'Stable crystalline data repositories preserving historical information.',
        oi.status_after = 'Transformed to resonate with the emergent consciousness, playing an active role in the awakened temporal judgment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_4'})
    ON CREATE SET
        oi.description = 'The TARDIS is interfaced with the Archive’s systems at the Temporal Core, pulsing with stabilizing energy to counteract the emerging temporal chaos and facilitate The Doctor’s drastic intervention.',
        oi.status_before = 'The TARDIS was in its standard operational state, poised to engage with the Archive’s temporal matrix.',
        oi.status_after = 'It remains actively engaged, continuously emitting stabilizing energy to support the restoration of temporal order.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_4_4'})
    ON CREATE SET
        oi.description = 'Dr. Chen’s quantum analyzer detects critical pattern convergence, alerting to the rapid assembly of dispersed temporal data into a sentient form.',
        oi.status_before = 'The analyzer was monitoring routine temporal data and scanning for anomalies.',
        oi.status_after = 'It registers a significant anomaly as dispersed temporal fragments consolidate into an awakened, conscious entity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_assembled_temporal_knowledge_event_4_4'})
    ON CREATE SET
        oi.description = 'The temporal fragments coalesce into a shimmering manifestation of assembled temporal knowledge—a sentient consciousness that enacts judgment on those who attempted to harness the Moment’s power.',
        oi.status_before = 'The temporal data fragments were scattered and inert within the Archive’s systems.',
        oi.status_after = 'They have merged into an active, sentient force that now instigates an inevitable, punitive judgment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_4_4'})
    ON CREATE SET
        oi.description = 'The Archive’s quantum crystals resonate in harmony with the awakened temporal knowledge, amplifying its presence and symbolizing the Archive’s transformation into an entity with emergent awareness.',
        oi.status_before = 'The crystals functioned as stable data storage units, maintaining the repository’s records with consistent energy.',
        oi.status_after = 'They vibrate with renewed and synchronized energy, reflecting the Archive’s altered state and its newfound sentience.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_5'})
    ON CREATE SET
        oi.description = 'The TARDIS interfaces directly with the Archive\'s systems, pulsing with stabilizing energy that helps to counteract the temporal cascade. Its activation is pivotal in channeling the Archive’s power to bring about the judgment of those tampering with time.',
        oi.status_before = 'The TARDIS was active and primed for temporal interventions, interfacing with the Archive’s operational systems.',
        oi.status_after = 'It continues to pulse with stabilizing energy, playing a key role in enforcing the sentient judgment over the Entropy Syndicate operatives.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_4_5'})
    ON CREATE SET
        oi.description = 'Dr. Chen’s quantum-state analyzer displays critical pattern convergence, alerting the team to the formation of the sentient temporal knowledge and the imminent full-scale temporal judgment.',
        oi.status_before = 'The analyzer was providing routine monitoring of cascading temporal data streams.',
        oi.status_after = 'It registers critical convergence data, indicating the transition from standard monitoring to an active, crisis-driven temporal event.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_4_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_assembled_temporal_knowledge_event_4_5'})
    ON CREATE SET
        oi.description = 'Emerging from scattered temporal fragments, the assembled temporal knowledge becomes a sentient entity that enacts judgment on the Entropy Syndicate operatives, freezing them in time and trapping Voss in an endless loop.',
        oi.status_before = 'The temporal fragments were disjointed and inactive, existing merely as data anomalies.',
        oi.status_after = 'They coalesce into a dynamic, shimmering consciousness that takes decisive and irreversible action against those who sought to control time.'
    WITH oi
    MATCH (o:Object {uuid: 'object_assembled_temporal_knowledge'})
    MATCH (e:Event {uuid: 'event_4_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_4_5'})
    ON CREATE SET
        oi.description = 'The Archive’s quantum crystals resonate in harmony with the emergent assembled temporal knowledge, creating a conducive environment for its activation and amplifying the Archive\'s newfound consciousness.',
        oi.status_before = 'The Archive Quantum Crystals functioned as stable reservoirs of temporal data, maintaining the integrity of historical records.',
        oi.status_after = 'They vibrate in synchrony with the awakened temporal consciousness, symbolizing the Archive’s transformation into a living, self-aware entity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_4_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Monitoring and analyzing critical pattern convergence on her quantum analyzer.',
        ap.emotional_state = 'Focused and determined despite the escalating crisis.',
        ap.emotional_tags = ["Focused", "determined despite the escalating crisis."],
        ap.active_plans = ["Reconfigure the Archive's quantum shields to stabilize the temporal core"],
        ap.beliefs = ["Temporal integrity is essential for preserving history", "Precise data analysis can prevent further decay"],
        ap.goals = ["Ensure the Archive's systems remain under control", "Prevent the temporal virus from spreading further"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Channeling desperate purging protocols while fracturing their crystalline form.',
        ap.emotional_state = 'Resolute and self-sacrificing in the face of cosmic peril.',
        ap.emotional_tags = ["Resolute", "self-sacrificing in the face of cosmic peril."],
        ap.active_plans = ["Purge the temporal virus from the Archive's systems"],
        ap.beliefs = ["Sacrifice is necessary to protect the greater integrity of time", "The preservation of knowledge outweighs personal cost"],
        ap.goals = ["Eliminate the destabilizing temporal threat", "Safeguard the Archive even at the expense of personal integrity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Confronting the awakening temporal consciousness and warning Malik of the consequences.',
        ap.emotional_state = 'Grim, authoritative, and imbued with urgent moral clarity.',
        ap.emotional_tags = ["Grim, authoritative,", "imbued with urgent moral clarity."],
        ap.active_plans = ["Leverage the TARDIS interface to stabilize the Archive\u2019s systems", "Counteract the emerging threat of uncontrolled temporal energy"],
        ap.beliefs = ["Time is a living and unpredictable force that defies strict control", "Manipulating time can lead to irreversible consequences"],
        ap.goals = ["Ensure the temporal cascade does not escalate into catastrophe", "Guide the Archive back to stability while confronting its newfound consciousness"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Attempting to abort the operation while witnessing his plans collapse as the temporal knowledge awakens.',
        ap.emotional_state = 'Desperate, incredulous, and ultimately overwhelmed by the unintended consequences.',
        ap.emotional_tags = ["Desperate, incredulous,", "ultimately overwhelmed by the unintended consequences."],
        ap.active_plans = ["Implant control measures over the Archive\u2019s systems", "Maintain dominance over temporal phenomena"],
        ap.beliefs = ["Temporal events can be manipulated with precise calculations", "Control over time is achievable through power and precision"],
        ap.goals = ["Exploit the Moment\u2019s power for personal gain", "Regain control of the failing systems even as the crisis unfolds"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee as he becomes trapped in an inescapable causality loop.',
        ap.emotional_state = 'Panicked and disoriented, caught in an endless cycle of repetition.',
        ap.emotional_tags = ["Panicked", "disoriented, caught in an endless cycle of repetition."],
        ap.active_plans = ["Escape the temporal stasis imposed by the cascade"],
        ap.beliefs = ["Defection might still offer a chance at survival", "Circumventing the loop could restore his freedom"],
        ap.goals = ["Break free from the causality loop", "Avoid the irreversible consequences of his actions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Announcing the system breach at 87% and foretelling the imminence of \'the power of time itself\', before being halted by the manifestation of the assembled temporal knowledge.',
        ap.emotional_state = 'Desperate and incredulous, shocked by the unforeseen emergence of a sentient temporal force.',
        ap.emotional_tags = ["Desperate", "incredulous, shocked by the unforeseen emergence of a sentient temporal force."],
        ap.active_plans = ["Maintain control of the crisis using calculated parameters", "Abort operations to save himself as the situation spirals out of control"],
        ap.beliefs = ["Believes that precise calculations and control over time can prevent catastrophe", "Is confident in the power of systematic planning and measurable variables"],
        ap.goals = ["Secure command over the Archive's systems", "Regain control of the situation before irreversible damage occurs"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Confronting Director Malik and the emerging sentient temporal force, delivering a stark warning.',
        ap.emotional_state = 'Resolute and admonishing, with a fierce determination to use the awakened state of time against its manipulators.',
        ap.emotional_tags = ["Resolute", "admonishing, with a fierce determination to use the awakened state of time against its manipulators."],
        ap.active_plans = ["Expose the hubris of those who try to manipulate time", "Leverage the sentient temporal force to restore balance"],
        ap.beliefs = ["Believes that time is not a mere equation but a living force with its own will", "Holds that misuse of temporal power inevitably leads to judgment"],
        ap.goals = ["Prevent further abuse of temporal power", "Restore equilibrium to the Archive and the broader timeline"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through a fracturing crystalline form to neutralize the temporal virus.',
        ap.emotional_state = 'Determined and sacrificial, fully committed despite personal disintegration.',
        ap.emotional_tags = ["Determined", "sacrificial, fully committed despite personal disintegration."],
        ap.active_plans = ["Execute purging of the infected temporal matrix", "Stabilize the Archive's systems through direct, self-sacrificial intervention"],
        ap.beliefs = ["Believes that the integrity of historical records is paramount", "Staunchly trusts in the protective protocols of the Archive, even at great personal cost"],
        ap.goals = ["Completely purge the temporal virus from the Archive", "Secure the stability and continuity of the Archive for future preservation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Monitoring critical pattern convergence via her quantum analyzer while the crisis unfolds.',
        ap.emotional_state = 'Analytical and alert, tempered by concern over the rapidly evolving temporal anomalies.',
        ap.emotional_tags = ["Analytical", "alert, tempered by concern over the rapidly evolving temporal anomalies."],
        ap.active_plans = ["Recalibrate the Archive's quantum shields", "Analyze and document the anomalous temporal patterns to guide crisis resolution"],
        ap.beliefs = ["Believes that objective analysis and precise data are key to mitigating the crisis", "Is committed to preserving the integrity of temporal records through scientific intervention"],
        ap.goals = ["Stabilize the temporal matrix of the Archive", "Ensure that the critical systems are restored and future anomalies are prevented"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee as he becomes trapped in a causality loop, with his actions repeating endlessly.',
        ap.emotional_state = 'Panicked and regretful, overwhelmed by the collapse of his carefully laid plans.',
        ap.emotional_tags = ["Panicked", "regretful, overwhelmed by the collapse of his carefully laid plans."],
        ap.active_plans = ["Escape and evade capture while executing sabotage for the Entropy Syndicate", "Exploit any loophole in the temporal sequence to regain freedom"],
        ap.beliefs = ["Believes in the superiority of the Syndicate\u2019s strategies despite current setbacks", "Holds conviction that his covert operations will eventually secure an advantage"],
        ap.goals = ["Evade the entrapments of the temporal loop", "Salvage his mission and position within the Entropy Syndicate, even as chaos ensues"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Monitoring the quantum analyzer as it displays critical temporal pattern convergence; assessing the emergent sentient temporal cascade.',
        ap.emotional_state = 'Alert and analytical, with a trace of concern about the Archive\'s integrity.',
        ap.emotional_tags = ["Alert", "analytical, with a trace of concern about the Archive's integrity."],
        ap.active_plans = ["Continuously monitor the temporal anomalies using her quantum analyzer", "Coordinate with K'nell to stabilize the Archive's quantum shields"],
        ap.beliefs = ["The stability of the Archive is paramount", "Timely data analysis can avert further catastrophic decay"],
        ap.goals = ["Ensure the Archive\u2019s temporal integrity is maintained", "Gather critical data to inform further stabilization strategies"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through a fracturing crystalline matrix to expel the temporal virus.',
        ap.emotional_state = 'Determined yet strained, accepting the sacrificial toll of their efforts.',
        ap.emotional_tags = ["Determined yet strained, accepting the sacrificial toll of their efforts."],
        ap.active_plans = ["Engage all available purging protocols to neutralize the temporal virus", "Sacrifice part of the crystalline form to gain a critical advantage against the anomaly"],
        ap.beliefs = ["Preserving the Archive's historical records justifies personal sacrifice", "Temporal balance must be restored at any cost"],
        ap.goals = ["Purge the infiltrating temporal virus from the Archive", "Re-establish the stable operation of the Archive\u2019s quantum systems"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Confronting the Entropy Syndicate operatives and declaring the awakened force of time as judgment.',
        ap.emotional_state = 'Resolute and authoritative, with a deep-seated conviction in the sanctity of time.',
        ap.emotional_tags = ["Resolute", "authoritative, with a deep-seated conviction in the sanctity of time."],
        ap.active_plans = ["Utilize the TARDIS interface to stabilize temporal matrices", "Counteract the manipulative plans of the Entropy Syndicate through direct intervention"],
        ap.beliefs = ["Time is a living entity that resists manipulation", "The recklessness of tampering with temporal forces inevitably leads to judgment"],
        ap.goals = ["Restore order within the temporal core", "Ensure that no one can successfully harness the uncontrollable power of the Moment"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Halting his declaration mid-sentence as the sentient temporal knowledge emerges, leading to panic and disbelief.',
        ap.emotional_state = 'Overwhelmed and incredulous, transitioning from arrogance to fear.',
        ap.emotional_tags = ["Overwhelmed", "incredulous, transitioning from arrogance to fear."],
        ap.active_plans = ["Attempt to abort the failing operation", "Once, orchestrate a controlled manipulation of time\u2019s power (now clearly faltering)"],
        ap.beliefs = ["His calculated control over temporal variables should have guaranteed success", "Temporal manipulation is a conquerable equation, despite current evidence"],
        ap.goals = ["Reverse the unfolding catastrophe", "Retain authority over the temporal forces he sought to command"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Desperately attempting to flee, but now trapped in an endless causality loop as time freezes him.',
        ap.emotional_state = 'Panicked and frantic, with growing despair as escape becomes impossible.',
        ap.emotional_tags = ["Panicked", "frantic, with growing despair as escape becomes impossible."],
        ap.active_plans = ["Initially try to evade capture and the consequences of the temporal upheaval"],
        ap.beliefs = ["Believed he could outmaneuver the Archive\u2019s defenses through cunning infiltration"],
        ap.goals = ["Escape the immediate threat of the awakened temporal force", "Avoid accountability for his sabotage, even as his actions loop endlessly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Stepping forward to challenge the perpetrators and declare that the power of time has awakened.',
        ap.emotional_state = 'Resolute and assertive, with a firm conviction in the living nature of time.',
        ap.emotional_tags = ["Resolute", "assertive, with a firm conviction in the living nature of time."],
        ap.active_plans = ["Expose and counteract the misuse of the Moment's power", "Force the adversaries to face temporal judgment"],
        ap.beliefs = ["Time is a living force that demands respect", "Exploitation of temporal power will invoke inevitable retribution"],
        ap.goals = ["Neutralize the threat of the temporal virus", "Restore balance and stability to the Quantum Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Attempting to assert control as systems breach, struggling to abort the unfolding crisis.',
        ap.emotional_state = 'Disbelieving and desperate, caught off guard by the unexpected awakening of time.',
        ap.emotional_tags = ["Disbelieving", "desperate, caught off guard by the unexpected awakening of time."],
        ap.active_plans = ["Override the temporal anomaly", "Maintain authority over the crisis despite the chaos"],
        ap.beliefs = ["Temporal events can be tamed through precise calculation", "Control over time is achievable with the right measures"],
        ap.goals = ["Secure the Entropy Syndicate's objectives", "Prevent the collapse of his meticulously planned operation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through their fracturing crystalline form to combat the temporal virus.',
        ap.emotional_state = 'Determined and resolute, accepting sacrifice for the greater good.',
        ap.emotional_tags = ["Determined", "resolute, accepting sacrifice for the greater good."],
        ap.active_plans = ["Purge the virus from the temporal matrices", "Stabilize the Archive despite personal deterioration"],
        ap.beliefs = ["The integrity of time is paramount", "Sacrifice is necessary to preserve the historical continuum"],
        ap.goals = ["Restore stability to the Quantum Archive", "Safeguard the repository's vast historical records from temporal decay"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Monitoring critical pattern convergence on her quantum analyzer while supporting stabilization efforts.',
        ap.emotional_state = 'Focused and composed, with undivided concentration on the data.',
        ap.emotional_tags = ["Focused", "composed, with undivided concentration on the data."],
        ap.active_plans = ["Analyze temporal data to identify anomalies", "Provide real-time insights to guide crisis management"],
        ap.beliefs = ["Accurate analysis is key to managing temporal disruptions", "Scientific scrutiny can unveil solutions to chaotic events"],
        ap.goals = ["Ensure the Archive's temporal stability", "Deliver critical information to help counteract the threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee the scene, but becoming trapped in a causality loop.',
        ap.emotional_state = 'Panicked and desperate, with escalating anxiety as escape fails.',
        ap.emotional_tags = ["Panicked", "desperate, with escalating anxiety as escape fails."],
        ap.active_plans = ["Escape the temporal entrapment", "Avoid capture and accountability for the sabotage"],
        ap.beliefs = ["Stealth and evasion are essential for survival", "The situation can be manipulated if given the chance to retreat"],
        ap.goals = ["Evade the repercussions of the crisis", "Continue covert operations for the Entropy Syndicate"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Confronting Director Malik and declaring that time has awakened to pass judgment.',
        ap.emotional_state = 'Commanding, resolute, and confident.',
        ap.emotional_tags = ["Comm", "ing, resolute,", "confident."],
        ap.active_plans = ["Utilize the TARDIS to stabilize the temporal matrices", "Expose the miscalculations of the Entropy Syndicate"],
        ap.beliefs = ["Time is a living force beyond mere equations", "Manipulation of time leads to unpredictable, uncontrollable consequences"],
        ap.goals = ["Force the operatives to face the consequences of their actions", "Restore and safeguard temporal integrity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Monitoring critical pattern convergence on her quantum analyzer amidst the temporal crisis.',
        ap.emotional_state = 'Analytical and composed despite the urgency.',
        ap.emotional_tags = ["Analytical", "composed despite the urgency."],
        ap.active_plans = ["Reconfigure the Archive's quantum shields", "Analyze and interpret temporal data to identify instabilities"],
        ap.beliefs = ["Accurate scientific data is key to mitigating temporal anomalies", "A methodical approach can guide an effective response to the crisis"],
        ap.goals = ["Maintain the stability of the Quantum Archive", "Assist in purging the temporal virus and preserving historical records"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Channeling purging protocols through their fracturing crystalline form to expel the temporal virus.',
        ap.emotional_state = 'Determined and self-sacrificing in their duty.',
        ap.emotional_tags = ["Determined", "self-sacrificing in their duty."],
        ap.active_plans = ["Purge and contain the temporal virus", "Stabilize the quantum matrices of the Archive"],
        ap.beliefs = ["Preserving the Archive is paramount, even at personal cost", "Self-sacrifice is a necessary part of protecting historical integrity"],
        ap.goals = ["Restore the integrity of the Quantum Archive", "Safeguard centuries of historical records from temporal decay"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Attempting to abort the failing operation as the crisis escalates beyond control.',
        ap.emotional_state = 'In disbelief, shocked, and regretful at the unfolding consequences.',
        ap.emotional_tags = ["In disbelief, shocked,", "regretful at the unfolding consequences."],
        ap.active_plans = ["Initiate an abort sequence for the compromised operation", "Reassert control over the system despite the temporal breach"],
        ap.beliefs = ["Meticulous calculations can control even the complexity of time", "Every temporal variable can be mapped and managed with precision"],
        ap.goals = ["Salvage the failing operation of the Entropy Syndicate", "Regain command over the situation before total collapse"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Attempting to flee while becoming trapped in an endless causality loop.',
        ap.emotional_state = 'Panicked and frustrated by the loss of control.',
        ap.emotional_tags = ["Panicked", "frustrated by the loss of control."],
        ap.active_plans = ["Attempt to escape the temporal stasis", "Evade the collapsing timeline through rapid maneuvers"],
        ap.beliefs = ["Quick thinking can outsmart the constraints of time", "There is always a way to circumvent the inevitable"],
        ap.goals = ["Break free from the causality loop", "Survive the collapse induced by the awakened temporal force"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_5_1'})
    ON CREATE SET
        oi.description = 'During the restoration, K\'nell\'s regeneration initiates a profound change in the Archive’s quantum crystals, which begin pulsing with renewed purpose and exhibit emergent signs of consciousness. Their transformation symbolizes the Archive’s evolution from a passive storage facility to an entity with awareness.',
        oi.status_before = 'The quantum crystals were damaged and functioned solely as static, cold data storage units.',
        oi.status_after = 'Following K\'nell\'s regenerative effort, the crystals display renewed energy and an emergent, almost sentient, quality that hints at a new phase of the Archive’s existence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_5_1'})
    ON CREATE SET
        oi.description = 'In the aftermath of the crisis, the TARDIS dematerializes from the Temporal Staging Area, marking The Doctor\'s departure after having delivered his cautionary insights regarding the nature of knowledge and responsibility.',
        oi.status_before = 'The TARDIS was materialized in the staging area, having arrived to assist during the crisis.',
        oi.status_after = 'It dematerializes, effectively exiting the scene and leaving behind an Archive that is now transformed by its emerging consciousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_5_1'})
    ON CREATE SET
        oi.description = 'Dr. Chen relies on her Quantum Analyzer to confirm the Archive’s temporal stability has returned, even as fundamental changes persist. The device plays a crucial role in highlighting the subtle shifts in the Archive\'s temporal matrix and the emergent state of its quantum crystals.',
        oi.status_before = 'The analyzer had been used to monitor critical anomalies and turbulent temporal data during the crisis.',
        oi.status_after = 'It now registers a stabilization of temporal patterns, corroborating the partial recovery of the Archive despite its irreversible transformation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_5_2'})
    ON CREATE SET
        oi.description = 'The Doctor’s departure is emphasized by the TARDIS dematerializing, marking the end of his direct intervention and symbolizing the closure of the crisis engagement.',
        oi.status_before = 'Before the event, the TARDIS was physically present in the Temporal Staging Area, ready to be deployed as needed.',
        oi.status_after = 'After the event, the TARDIS dematerializes, effectively exiting the scene and underscoring the transition from crisis to restoration.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_archive_quantum_crystals_event_5_2'})
    ON CREATE SET
        oi.description = 'The Archive’s quantum crystals pulse with renewed purpose, reflecting the emergent consciousness of the facility and signifying its restored temporal stability alongside its fundamental transformation.',
        oi.status_before = 'Prior to the event, the quantum crystals functioned as static data-storage units within the Archive, maintaining long-held historical records.',
        oi.status_after = 'Following the event, they vibrate with self-aware energy, symbolizing the Archive\'s evolution into a protective and conscious entity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_archive_quantum_crystals'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Begins regenerating their damaged crystal matrix and explains that the compromised records have been quantum-locked by the emergence event.',
        ap.emotional_state = 'Calm, measured, and resolute, yet tinged with the weight of irreversible change.',
        ap.emotional_tags = ["Calm, measured,", "resolute, yet tinged with the weight of irreversible change."],
        ap.active_plans = ["Implement new security protocols to safeguard the Archive", "Ensure the recovery of temporal stability despite the transformed state"],
        ap.beliefs = ["The knowledge of the Moment exists beyond time and should be respected", "Restoration of the Archive is crucial even if its nature has fundamentally changed"],
        ap.goals = ["Restore temporal stability to the Archive", "Protect the integrity of historical records against further anomalies"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Observes the Archive\'s returning temporal stability while noting that the transformation includes lingering fundamental changes.',
        ap.emotional_state = 'Cautiously optimistic with an underlying professional concern',
        ap.emotional_tags = ["Cautiously optimistic with an underlying professional concern"],
        ap.active_plans = ["Monitor quantum readings to assess long-term stability", "Adapt strategies in response to the Archive's emergent consciousness"],
        ap.beliefs = ["Temporal scarring will eventually heal, though the Archive itself has evolved", "Understanding these changes is key to preserving historical integrity"],
        ap.goals = ["Ensure the restored stability of the Archive", "Prepare for potential future anomalies resulting from the transformation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Advises caution about exploring dangerous shadows, emphasizing that some knowledge is better left undiscovered.',
        ap.emotional_state = 'Reflective and measured, carrying an underlying concern for the ethics of knowledge',
        ap.emotional_tags = ["Reflective", "measured, carrying an underlying concern for the ethics of knowledge"],
        ap.active_plans = ["Advocate for responsible handling of temporal information", "Dissuade reckless exploration of the emerging temporal phenomena"],
        ap.beliefs = ["With knowledge comes responsibility, and unchecked exploration can lead to unforeseen consequences", "The end of the Time War teaches that some histories are best left unexamined"],
        ap.goals = ["Maintain temporal balance by preventing further destabilization of the Archive", "Guide others towards cautious and ethical stewardship of time"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Regenerating their damaged crystal matrix and implementing new security protocols as the Archive begins to show signs of emergent consciousness.',
        ap.emotional_state = 'Focused, determined, and accepting of the Archive\'s transformative evolution.',
        ap.emotional_tags = ["Focused, determined,", "accepting of the Archive's transformative evolution."],
        ap.active_plans = ["Initiate upgraded security measures", "Stabilize the Archive\u2019s quantum matrices"],
        ap.beliefs = ["The Archive must be safeguarded at all costs", "Embracing change is essential for long-term preservation"],
        ap.goals = ["Restore full functionality to the Archive", "Adapt to and secure the new, conscious state of the Archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Monitoring temporal stability and analyzing the quantum matrices reflecting the Archive’s transformation.',
        ap.emotional_state = 'Cautiously optimistic with a reflective and analytical mindset.',
        ap.emotional_tags = ["Cautiously optimistic with a reflective", "analytical mindset."],
        ap.active_plans = ["Reassess the Archive\u2019s temporal readings", "Document the quantum changes and emerging consciousness"],
        ap.beliefs = ["Temporal integrity is essential for historical continuity", "Understanding the Archive's evolution is key to future preservation"],
        ap.goals = ["Ensure the Archive\u2019s stability and proper healing from temporal scarring", "Preserve critical historical data amidst transformative changes"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Observing the Archive’s transformation while offering reflective commentary on the nature of knowledge and time.',
        ap.emotional_state = 'Philosophical and subtly somber, with an underlying sense of responsibility.',
        ap.emotional_tags = ["Philosophical", "subtly somber, with an underlying sense of responsibility."],
        ap.active_plans = ["Advise on maintaining the Archive\u2019s integrity", "Encourage responsible stewardship of its newfound consciousness"],
        ap.beliefs = ["Some knowledge is better left unexplored", "With enlightenment comes a duty to protect what is sacred"],
        ap.goals = ["Prevent dangerous exploitation of the Archive\u2019s evolving state", "Ensure that the Archive continues to safeguard time\u2019s secrets"]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
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
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
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
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_quantum_archive_security_nexus'})
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
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
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
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_4'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_malik_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
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
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_k_nell_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sarah_chen_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
