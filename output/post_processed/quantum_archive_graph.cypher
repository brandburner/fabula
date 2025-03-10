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

    CREATE (m:GraphMetadata {
        source_file: '/home/user/fabula/output/pre_processed/quantum_archive_graph.json',
        creation_timestamp: '2025-03-10T11:11:59.345810',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_dr_sarah_chen'})
    ON CREATE SET
        a.name = 'Sarah Chen',
        a.title = 'Time Archaeology Division Chief',
        a.description = 'Sarah Chen is a consummate scientist with an exceptional talent for analyzing the complex tapestry of time. Her dedication to preserving history and understanding temporal anomalies is matched by her calm under pressure. Her methodical approach and determination underscore her commitment to safeguarding timeless knowledge against subtle yet fundamental temporal changes.',
        a.traits = ["Analytical", "Determined", "Meticulous", "Resilient"],
        a.sphere_of_influence = 'Temporal Analysis'
    ;
MERGE (a:Agent {uuid: 'agent_archivist_prime_k_nell'})
    ON CREATE SET
        a.name = 'Archivist Prime K\'nell',
        a.title = 'Keeper of the Archive',
        a.description = 'Archivist Prime K\'nell is an enigmatic and ancient guardian whose crystalline form embodies a deep connection to the vast repository of historical knowledge. Tasked with managing the archive, K\'nell endures personal sacrifice and implements new security protocols to protect the sanctum from decay.',
        a.traits = ["Ancient", "Enigmatic", "Dedicated", "Self-sacrificing"],
        a.sphere_of_influence = 'Historical Preservation'
    ;
MERGE (a:Agent {uuid: 'agent_the_doctor'})
    ON CREATE SET
        a.name = 'The Doctor',
        a.title = 'Time Traveler',
        a.description = 'The Doctor is a resourceful and ingenious traveler with an unparalleled grasp of temporal mechanics. Known for defying the constraints of time, The Doctor offers wise counsel on the nature of knowledge and the dangers of unrestrained exploration. Their calm and reflective demeanor under crisis speaks to a lifetime of experience in mending fractured timelines.',
        a.traits = ["Resourceful", "Wise", "Innovative", "Principled"],
        a.sphere_of_influence = 'Temporal Navigation'
    ;
MERGE (a:Agent {uuid: 'agent_coordinator_voss'})
    ON CREATE SET
        a.name = 'Coordinator Voss',
        a.title = 'Coordinator',
        a.description = 'Coordinator Voss is an elusive operative embedded within the Quantum Archive, known for cunning and covert maneuvers in service of the Entropy Syndicate. In critical moments at the Temporal Core, Voss’s attempt to escape a causality loop highlights both technical adeptness and vulnerability under uncontrollable temporal forces.',
        a.traits = ["Cunning", "Deceptive", "Resourceful", "Secretive"],
        a.sphere_of_influence = 'Covert Operations'
    ;
MERGE (a:Agent {uuid: 'agent_director_malik'})
    ON CREATE SET
        a.name = 'Director Malik',
        a.title = 'Director',
        a.description = 'Director Malik is a ruthless and calculated operative of the Entropy Syndicate, intent on harnessing the power of the Quantum Archive for his own temporal ambitions. His determination to control every variable exposes both his arrogance and his vulnerability when confronted by forces that defy precise containment.',
        a.traits = ["Ruthless", "Calculating", "Determined", "Overconfident"],
        a.sphere_of_influence = 'Temporal Manipulation'
    ;
MERGE (o:Object {uuid: 'object_quantum_state_analyzer'})
    ON CREATE SET
        o.name = 'Quantum-State Analyzer',
        o.description = 'The Quantum-State Analyzer is a sophisticated instrument that monitors and deciphers the intricate patterns of chronometric energy. Its advanced holographic display and sensitive sensors allow it to detect minute anomalies in temporal sequences, making it indispensable during moments of crisis.',
        o.purpose = 'To analyze temporal decay patterns and identify potential breaches in the continuum.',
        o.significance = 'Acts as a critical tool in understanding and mitigating the impact of temporal fluctuations, ensuring that dangerous decay patterns are quickly identified and addressed.'
    ;
MERGE (o:Object {uuid: 'object_tardis'})
    ON CREATE SET
        o.name = 'TARDIS',
        o.description = 'The TARDIS is an iconic time-traveling vessel recognized for its ability to traverse the temporal continuum with its extraordinary chameleon circuit and distinctive materialization process. In this scene, the TARDIS dematerializes, marking its seamless departure as a symbol of hope and resilience in the face of cosmic calamities.',
        o.purpose = 'Facilitates time travel and aids in stabilizing temporal crises.',
        o.significance = 'Represents technological mastery and serves as a beacon of stability and familiarity in the ever-shifting fabric of time.'
    ;
MERGE (o:Object {uuid: 'object_sonic_screwdriver'})
    ON CREATE SET
        o.name = 'Sonic Screwdriver',
        o.description = 'A sleek, multifunctional tool wielded by The Doctor, the Sonic Screwdriver is capable of scanning systems, interfacing with alien technologies, and unlocking sealed mechanisms. It emits a soft blue glow and precise sonic frequencies when activated, embodying advanced, almost organic technology.',
        o.purpose = 'To probe and interact with advanced technological systems and control matrices within the Quantum Archive.',
        o.significance = 'The Sonic Screwdriver symbolizes The Doctor\'s resourcefulness and his deep connection with temporal technology, routinely proving indispensable in overcoming anomalies.'
    ;
MERGE (o:Object {uuid: 'object_quantum_transmitter'})
    ON CREATE SET
        o.name = 'Quantum Transmitter',
        o.description = 'Concealed within a crystalline badge of office, the Quantum Transmitter is a discreet, high-tech device engineered for encrypted communications across vast temporal distances. With intricate circuitry and a compact design, it seamlessly integrates with the Archive’s energy matrices.',
        o.purpose = 'To covertly transmit data, facilitating surreptitious operations and potential sabotage within the Archive’s central systems.',
        o.significance = 'The Quantum Transmitter serves as a tangible symbol of covert infiltration and manipulation, highlighting Coordinator Voss\'s secretive operations and underlying alliance with rogue temporal forces.'
    ;
MERGE (o:Object {uuid: 'object_temporal_weapons'})
    ON CREATE SET
        o.name = 'Temporal Weapons',
        o.description = 'Temporal Weapons are advanced devices engineered to exploit quantum vulnerabilities and manipulate the flow of spacetime. Crafted to withstand temporal feedback, these armaments emit precise energy pulses capable of neutralizing temporal anomalies. Their design integrates cutting-edge technology with aggressive tactical features, making them a formidable asset in any high-stakes temporal conflict.',
        o.purpose = 'To secure critical points by neutralizing temporal anomalies during breaches.',
        o.significance = 'They symbolize the aggressive technological brinkmanship of the Entropy Syndicate and serve as a physical manifestation of their intent to control and reshape time for their own gains.'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_reception_chamber'})
    ON CREATE SET
        l.name = 'Quantum Archive Reception Chamber',
        l.description = 'The reception chamber of the Quantum Archive is a vast, crystalline space defined by translucent walls that pulse with vibrant chronometric energy patterns. Temporal matrices line these walls, displaying cascading streams of data in ancient languages across intricate holographic panels. The atmosphere blends futuristic technology with ancient mystique, permeated by subtle artron energy—a mesmerizing, ominous environment that preserves eons of history.',
        l.type = 'Interior'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_central_core'})
    ON CREATE SET
        l.name = 'Quantum Archive - Central Core',
        l.description = 'The Quantum Archive\'s Central Core is an awe-inspiring interior space dominated by massive data crystals that stretch upward into darkness. These crystals, once a symbol of perfect symmetry, now show scars of temporal decay with discordant, chaotic patterns, and the space is charged with chronometric energy. The interplay of decaying surfaces and advanced control matrices casts an ominous, almost sentient aura over the room.',
        l.type = 'Interior'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_security_nexus'})
    ON CREATE SET
        l.name = 'Quantum Archive - Security Nexus',
        l.description = 'The Quantum Archive - Security Nexus is a high-security control center within the Archive bristling with advanced technology and urgency. In this interior hub, walls vibrate with temporal breach alarms while multiple control panels display fragmented spacetime data. It is strategically designed to monitor and counteract entropic energy surges, facilitating swift communication and rapid response to temporal fractures.',
        l.type = 'Interior'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_temporal_core'})
    ON CREATE SET
        l.name = 'Quantum Archive - Temporal Core',
        l.description = 'The Quantum Archive - Temporal Core is a central, high-stakes chamber where the essence of time is laid bare. This interior space is defined by pulsating data crystals and interlinked control matrices humming with stabilizing energy. Its atmosphere, both awe-inspiring and foreboding, resonates with the shifting energies of purging protocols and fractured crystalline forms, as if time itself is awakening.',
        l.type = 'Interior'
    ;
MERGE (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    ON CREATE SET
        l.name = 'Quantum Archive - Temporal Staging Area',
        l.description = 'The Quantum Archive - Temporal Staging Area is a transitional interior space within the vast archive that resonates with a unique blend of advanced technology and subdued mysticism. Marked by a soft, pulsating luminescence from quantum crystals and emerging matrices, the area once exemplified strict order but now emits a subtle awareness. The air carries the lingering hum of chronometric energy intertwined with cautious hope, reflecting recent restoration efforts.',
        l.type = 'Interior'
    ;
MERGE (o:Organization {uuid: 'org_entropy_syndicate'})
    ON CREATE SET
        o.name = 'Entropy Syndicate',
        o.description = 'The Entropy Syndicate is a rogue collective of operatives determined to exploit quantum vulnerabilities for their own gain. Their goal is to destabilize established temporal orders and seize control of historical records to rewrite history in favor of their agenda. Operating with ruthless precision, the organization thrives on calculated chaos and temporal warfare, navigating the complexities of time with both aggression and strategic finesse.',
        o.sphere_of_influence = 'Temporal Warfare'
    ;
MERGE (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
    ON CREATE SET
        ep.title = 'Episode One - The Quantum Archive',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'The Repository Threshold',
        s.description = 'In the Quantum Archive’s Temporal Staging Area, crystalline walls shimmer with pulsating chronometric energy, establishing a stage where time itself seems both fragile and formidable. Dr. Sarah Chen stands at a central control platform, her quantum-state analyzer alive with cascading failure patterns that warn of rapidly deteriorating temporal seals. Nearby, Archivist Prime K\'Nell’s luminous, shifting form reflects both the urgency and the ancient gravitas of the archive, as frantic junior archivists race against time at containment consoles. This scene reveals how the calculated assault by the Entropy Syndicate threatens to unravel eons of recorded history, setting a tone of imminent peril and technological vulnerability.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Crisis Diagnosis and Unveiling Peril',
        e.description = 'Dr. Sarah Chen scrutinizes her quantum-state analyzer as its readings expose a catastrophic decay in the Archive’s temporal seals. The threat is immediate: centuries of meticulously preserved histories are at risk, compromised by an attack that exploited unforeseen quantum vulnerabilities. Simultaneously, Archivist Prime K\'Nell confirms that the Entropy Syndicate’s incursion was executed with chilling precision, igniting an atmosphere of urgency and dread. The organized chaos of junior archivists at their stations, paired with the holographic depiction of cascading temporal decay, underscores the escalating crisis and sets the stage for a desperate call for external intervention.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["DR. CHEN: 'The temporal seals are degrading faster than predicted. The Archive's knowledge - eons of history ... it's all at risk.'", "K'NELL: 'The Entropy Syndicate's attack was precisely calculated. They knew our vulnerabilities.'"]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'The Call for Assistance and TARDIS Arrival',
        e.description = 'With the crisis deepening, Archivist K\'Nell’s urgent plea for further aid signals the limitations of the Archive\'s defenses. The quantum analyzer emits an alert marked by an unexpected temporal signature, and the atmosphere vibrates with the sound of an approaching rescue. The TARDIS materializes seamlessly into the crystalline environment, its chameleon circuit echoing the Archive’s own luminescence. From within this iconic vessel, The Doctor emerges with measured resolve, instantly assessing the catastrophic entropic cascade while questioning the enigmatic motives behind the deliberate destruction of such profound historical treasures.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["THE DOCTOR: 'Temporal archives experiencing catastrophic entropic cascade. Brilliant architecture though - quantum crystalline matrices storing data in temporal suspension. But why would someone want to destroy it?'"]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Hidden Pattern',
        s.description = 'In the heart of the Quantum Archive\'s Central Core, massive data crystals tower overhead, their surfaces marred by the ominous spread of temporal decay. The environment is lit by the cool, eerie glow of holographic displays and the rhythmic pulse of chronometric energy. Shadows play across the crystalline structures as fragments of ancient data reveal long-buried secrets. Dr. Sarah Chen monitors degradation patterns on a quantum analyzer, while Archivist Prime K\'nell interfaces with control matrices, deciphering anomalous code. The Doctor, with measured urgency and a sonic screwdriver in hand, inspects the holographic display, piecing together the danger behind a sinister temporal virus. Meanwhile, a covert figure lurks in the shadows, setting in motion a betrayal that could destabilize the very fabric of recorded history. This scene deepens the mystery of the temporal threat and sets up the conflict around accessing dangerous knowledge, highlighting the interplay between technology, ancient wisdom, and hidden malevolence.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_central_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Unveiling the Temporal Threat',
        e.description = 'Dr. Sarah Chen opens the scene by revealing that the Archive\'s defenses have been breached in a most unprecedented manner. Using her quantum analyzer, she discloses that alongside the physical incursion, a highly sophisticated temporal virus has been implanted into the records. Her tone is laced with urgency and concern as she emphasizes that the virus is actively rewriting historical data at a quantum level. This revelation sets the stage for the unfolding crisis, highlighting both the technical and existential risks posed by the attack.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["DR. CHEN: The attack was sophisticated. They didn't just breach our defenses - they implanted something. A temporal virus that's rewriting our historical records at the quantum level."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Crystalline Communication',
        e.description = 'Archivist Prime K\'nell takes center stage as they interface with a primary control matrix using their crystalline appendages. The shifting pulses of data and light become the medium through which critical fragments of malicious code are isolated. K\'nell’s focused approach reveals that the implanted virus is not random but appears to be methodically searching for specific temporal coordinates within the Archive. This event deepens the mystery, suggesting that the viral attack was designed with a precise objective in mind.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["K'NELL: We've isolated fragments of their code structure. The virus appears to be searching for specific temporal coordinates."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'The Doctor’s Critical Insight',
        e.description = 'The Doctor steps forward with a blend of curiosity and gravity as they examine a freshly materialized holographic display projecting fragmented code patterns and temporal coordinates. Switching from a reserved inquiry to a declaration of alarm, The Doctor’s scrutiny sharpens the focus of the investigation. Their assessment confirms that the code is not merely an attack algorithm; it is a calculated search for data regarding the Moment—an ultimate weapon from the Time War. The Doctor’s realization underscores the high stakes of the situation and the potential catastrophic consequences of unleashing such forbidden knowledge.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["THE DOCTOR: Let me see.", "THE DOCTOR: These aren't just attack algorithms. They're searching for information about the Moment - the ultimate weapon of the Time War. Those records were supposed to be destroyed... sealed away in time itself."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Covert Sabotage Unveiled',
        e.description = 'In the dim recesses of the Central Core, Coordinator Voss lurks quietly, blending into the shadowed alcove. While the primary investigation unfolds, Voss covertly activates a hidden quantum transmitter embedded in their crystalline badge—a critical move that hints at ulterior motives. This silent act of sabotage, executed with precision, reveals that there may be an internal threat within the Archive itself. The event adds a layer of intrigue and mistrust, subtly shifting the narrative\'s focus towards betrayal from within the organization.',
        e.sequence_within_scene = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Betrayal Cascade at the Security Nexus',
        s.description = 'Within the Quantum Archive’s Security Nexus, the very fabric of time seems to fracture with the onset of chaos. The vast, echoing chamber, normally a bastion of order and guarded history, now reverberates with the shrill alarms of imminent temporal collapse. Crystalline panels of the archive pulse with erratic, entropic energy as breaches tear through the corridors of spacetime. Here, the narrative tension escalates as trusted allies reveal treachery and merciless adversaries assert their control. Director Malik, with his temporal weapons glinting ominously, ushers in a chilling command while a covert betrayal undermines every safeguard. This scene is pivotal in exposing the fissures within the Archive’s core, setting the stage for a dramatic conflict charged with urgency and moral reckoning.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_security_nexus'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Malik\'s Authoritative Entry',
        e.description = 'In the midst of the shattered calm, Director Malik strides forcefully through the largest temporal breach, his presence dominating the chaotic Security Nexus. With the facility’s alarms piercing the atmosphere and the very walls trembling from time’s distortion, Malik declares his uncompromising will to seize the Archive’s ancient secrets. His command is laced with a promise of power as he emphasizes that the knowledge contained within the Archive will serve a grander, sinister purpose. The moment is underscored by the ominous readiness of his temporal weapons, priming the stage for a deeper conflict.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Secure the facility. The Archive's knowledge will serve a greater purpose. The secrets of the Time War will finally be ours."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Voss\'s Treacherous Revelation',
        e.description = 'Amid the rising tumult, the stage darkens with an act of internal betrayal. Coordinator Voss, previously blending into the ranks of the Archive’s staff, steps forward to reveal their true loyalty to the Entropy Syndicate. With deliberate and covert movements, Voss begins the process of disabling the Archive’s critical containment fields. Their actions are not shouted but executed with chilling precision, heightening the sense of peril within the failing infrastructure. This unfolding treachery deepens the narrative’s central conflict, leaving allies vulnerable and trust fatally compromised.',
        e.sequence_within_scene = 2,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'The Doctor\'s Urgent Verdict',
        e.description = 'As the Archive teeters on the brink of collapse, The Doctor seizes the crisis with an urgent, clarifying declaration. Working frantically at the central control nexus, The Doctor warns that the unfolding sabotage is more than a mere tactical ploy—it\'s the unleashing of a force with a consciousness of its own. Their voice rings clear amid the chaos, asserting that the Moment, long thought to be a dormant weapon, carries with it an inherent judgment. Alongside them, Dr. Chen confirms that the virus pattern is assembling a dangerous new force across multiple timelines, amplifying the threat and setting the stage for irreversible consequences.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["You don't understand what you're dealing with! The Moment wasn't just a weapon - it was consciousness itself, passing judgment on all of time and space!", "Doctor - the virus pattern... it's not just searching. It's assembling something across multiple timeline nodes. Creating something new."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Time\'s Judgment',
        s.description = 'In the heart of the Quantum Archive’s Temporal Core, the environment is charged with an almost palpable tension. The chamber glows with unstable, pulsating energy as the TARDIS interfaces with the Archive\'s delicate systems, casting shifting, shadowy reflections on the crystalline walls. Amid the urgent hum of failing matrices, Archivist Prime K\'nell sacrifices fragments of their crystalline form to purge a malignant temporal virus, while Dr. Sarah Chen’s quantum-state analyzer flashes rapid warnings of critical convergence. Director Malik’s attempt to assert control falters as a sentient, shimmering chronometric force materializes, turning calculated plans into harbingers of judgment. The scene personifies the struggle between human endeavor and the wild, uncontrollable pulse of time, setting the stage for irrevocable consequences.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_core'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Crisis Stabilization Initiated',
        e.description = 'In the midst of the deteriorating temporal matrix, the TARDIS locks onto the Archive\'s failing systems, sending out stabilizing energies. Archivist Prime K\'nell channels an immense sacrifice, fracturing their own crystalline structure to purge the invasive virus from the Archive. Dr. Sarah Chen’s analyzer flashes with rapid critical readings as Director Malik urgently announces an impending systems breach, trying to forecast control even as the situation spirals. This event lays the groundwork for the unfolding catastrophe, blending desperate technological fixes with the looming inevitability of the Archive’s retaliation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["DIRECTOR MALIK: Systems breach at 87%. Soon the power of time itself will be-"]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Temporal Judgment Unleashed',
        e.description = 'As the crisis reaches its apex, the assembled temporal knowledge manifests as a radiant, living consciousness, halting Director Malik\'s hurried plans mid-sentence. In a moment of dramatic reckoning, The Doctor steps forward and declares that the very power the Entropy Syndicate sought now exacts its retribution. The confrontation escalates as the Archive’s agents experience the irreversible effects of time’s judgment—the Entropy Syndicate operatives freeze in temporal stasis and Coordinator Voss is ensnared in an endless causality loop. This event starkly underscores that time is not a malleable instrument but a sentient force beyond control.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["THE DOCTOR: You wanted the Moment's power? Now face its judgment. Time itself has awakened - and it remembers.", "THE DOCTOR: Time isn't an equation to be solved, Director. It's alive. And now, thanks to you, it's aware."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Restoration',
        s.description = 'In the quiet aftermath of catastrophe, the Temporal Staging Area of the Quantum Archive becomes a place of solemn rebirth. The gleaming quantum crystals, once unstable from the temporal virus, now pulse with a renewed, almost sentient, rhythm. K\'nell, sacrificing part of their ancient crystalline form, initiates a painstaking regeneration process, attempting to restore stability while acknowledging irreversible change. Dr. Chen’s readings confirm that although the Archive is stabilizing, its essence is irrevocably altered—a repository that now harbors the faint spark of consciousness. The atmosphere is charged with reflective melancholy, as The Doctor reminds everyone that some mysteries are meant to remain hidden and that true knowledge is always accompanied by responsibility. This transformation signals a new era for the Archive, one that blends preservation with an emerging awareness of its own existence.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_quantum_archive_temporal_staging_area'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Quantum Records Lockdown',
        e.description = 'K\'nell delivers the pivotal announcement that the compromised records have been quantum-locked, sealing away eons of archived knowledge, including the secrets of the Moment. This decisive act highlights the Archive\'s transformation from a passive repository into an entity now beyond complete control. With the virus\'s imprint now frozen in time, the Archive begins exhibiting an eerie new awareness, signaling that its destiny is entwined with the very histories it was meant to preserve.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["K'NELL: The compromised records have been quantum-locked by the emergence event. Even we cannot access them now. The knowledge of the Moment truly exists beyond time."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Final Judgment and Departure',
        e.description = 'As the crisis recedes, The Doctor and Dr. Chen engage in a reflective dialogue on the transformation of the Archive. The Doctor underscores the wisdom of leaving certain mysteries untouched, suggesting that some knowledge is powerful enough to shape reality. Dr. Chen observes the Archive’s altered state, noting the emergence of a latent consciousness within the temporal matrices. Amid this introspection, the TARDIS dematerializes, symbolizing The Doctor’s departure and marking the beginning of a new chapter where the Archive itself has evolved into a vigilant guardian of history.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["THE DOCTOR: Some shadows are better left unexplored.", "DR. CHEN: The temporal scarring will heal, but the Archive itself... it's different now. The quantum matrices show signs of... consciousness.", "THE DOCTOR: Knowledge always comes with responsibility. Perhaps having a conscience of its own is exactly what a library needs."]
    ;
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_quantum_state_analyzer'}),
          (a:Agent {uuid: 'agent_dr_sarah_chen'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_sonic_screwdriver'}),
          (a:Agent {uuid: 'agent_the_doctor'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_quantum_transmitter'}),
          (a:Agent {uuid: 'agent_coordinator_voss'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_temporal_weapons'}),
          (a:Agent {uuid: 'agent_director_malik'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (o:Organization {uuid: 'org_entropy_syndicate'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_1_1'})
    ON CREATE SET
        oi.description = 'The Quantum-State Analyzer is central to the crisis, translating complex quantum fluctuations into cascading holographic data that reveal the catastrophic decay of the archival temporal seals. It not only drives the narrative by alerting Dr. Chen to the imminent loss of invaluable data, but also provides a tangible measure of the attack’s impact, thereby guiding the strategic response and emphasizing the severity of the situation.',
        oi.status_before = 'Before the event, the Analyzer functioned as a routine diagnostic tool, reliably monitoring temporal signatures and operating within normal parameters to ensure the archive\'s systems remained stable.',
        oi.status_after = 'After the event unfolds, the Analyzer is thrust into an emergency mode, displaying urgent, alarming data and initiating a series of alerts that highlight the exponential decay of the temporal seals, effectively marking the shift from routine monitoring to a critical, active crisis response.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_1_2'})
    ON CREATE SET
        oi.description = 'The TARDIS materializes seamlessly into the crystalline landscape of the Quantum Archive, its chameleon circuit flawlessly echoing the Archive’s luminescent hues. Serving as the emblem of hope and resilience, the vessel not only transports The Doctor into a scene of unfolding chaos but also harmonizes with the rhythmic energies of the Archive. Its arrival triggers a shift in both strategic tone and narrative momentum, underlining the urgency of the temporal crisis and the promise of intervention. The vehicle’s presence is both a practical rescue and a symbolic statement against the forces threatening the continuum.',
        oi.status_before = 'Prior to the event, the TARDIS existed in a state of ready standby, dematerialized and traversing the cosmic tapestry with an inherent capability to intervene at critical junctures. It was poised to respond to disturbances in the temporal realm.',
        oi.status_after = 'Following its materialization, the TARDIS remains at the heart of the crisis battleground, its chameleon circuit fully engaged with the Archive’s environment. It now stands as a beacon of hope and technological ingenuity, its dynamic interface reflecting the urgent need for temporal stability and readiness for ensuing challenges.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Dr. Sarah Chen stands at the central control platform, fixated on her Quantum-State Analyzer as it hovers above mesmerizing holographic displays. Her posture is erect and intentional, with precise hand movements manipulating the analyzer’s interface while her eyes rapidly scan the cascading data streams that reveal the archive\'s rapid decay.',
        ap.emotional_state = 'On the surface, Sarah exudes a calm scientific determination, her measured voice and focused gaze betraying little of the underlying turmoil. Beneath that controlled exterior, however, anxiety wells up as she confronts the loss of centuries of history. She feels an intense pressure to act swiftly, tempered by a deep-seated commitment to the preservation of knowledge despite the existential threat looming before her.',
        ap.emotional_tags = ["on the surface, sarah exudes a calm scientific determination, her measured voice", "focused gaze betraying little of the underlying turmoil. beneath that controlled exterior, however, anxiety wells up as she confronts the loss of centuries of history. she feels an intense pressure to act swiftly, tempered by a deep-seated commitment to the preservation of knowledge despite the existential threat looming before her.", "on the surface", "sarah exudes a calm scientific determination", "her measured voice and focused gaze betraying little of the underlying turmoil. beneath that controlled exterior", "however", "anxiety wells up as she confronts the loss of centuries of history. she feels an intense pressure to act swiftly", "tempered by a deep-seated commitment to the preservation of knowledge despite the existential threat looming before her."],
        ap.active_plans = ["Diagnose the precise nature of the temporal decay using the analyzer\u2019s detailed readings.", "Communicate the severity of the crisis to rally a coordinated defensive effort.", "Establish immediate interventions to slow and possibly reverse the destructive quantum vulnerabilities."],
        ap.beliefs = ["Every fragment of historical data is invaluable and must be protected.", "Scientific rigor and empirical analysis are the tools to combat even the most unforeseen threats.", "Temporal integrity forms the backbone of the archive\u2019s purpose and the preservation of history."],
        ap.goals = ["Short-term: Accurately interpret the analyzer\u2019s outputs to assess the imminent crisis.", "Medium-term: Initiate effective countermeasures to stabilize the degrading temporal seals.", "Ultimate: Secure and preserve the vast historical repository from the irreversible decay inflicted by the attack."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell appears as a dynamic crystalline entity, their form shifting with pulses of refracted temporal energy as they interact with the archive\'s central controls. Their gestures are precise yet imbued with a sense of urgency, as light fragments dance around them while they deftly manipulate the interfaces designed to monitor and defend the archive’s quantum state.',
        ap.emotional_state = 'Externally, K\'nell radiates agitation and a palpable tension, with rapid fluctuations in luminance that mirror their escalating concern. Internally, this ancient guardian grapples with a profound sorrow for the potential loss of irreplaceable history, while also embodying a steadfast resolve to protect the archive at all costs. This inner conflict between grief and duty fuels a quiet determination that underpins every calculated action.',
        ap.emotional_tags = ["externally, k'nell radiates agitation", "a palpable tension, with rapid fluctuations in luminance that mirror their escalating concern. internally, this ancient guardian grapples with a profound sorrow for the potential loss of irreplaceable history, while also embodying a steadfast resolve to protect the archive at all costs. this inner conflict between grief", "duty fuels a quiet determination that underpins every calculated action.", "externally", "k'nell radiates agitation and a palpable tension", "with rapid fluctuations in luminance that mirror their escalating concern. internally", "this ancient guardian grapples with a profound sorrow for the potential loss of irreplaceable history", "while also embodying a steadfast resolve to protect the archive at all costs. this inner conflict between grief and duty fuels a quiet determination that underpins every calculated action.", "externally, k'nell radiates agitation and a palpable tension, with rapid fluctuations in luminance that mirror their escalating concern. internally, this ancient guardian grapples with a profound sorrow for the potential loss of irreplaceable history,", "also embodying a steadfast resolve to protect the archive at all costs. this inner conflict between grief and duty fuels a quiet determination that underpins every calculated action."],
        ap.active_plans = ["Manipulate the control interfaces to counteract the rapid temporal decay.", "Precisely assess the exploited vulnerabilities to better understand the Entropy Syndicate\u2019s strategy.", "Signal and coordinate with external forces capable of providing the necessary intervention."],
        ap.beliefs = ["The archive is a sacred repository of history that must be preserved beyond compromise.", "Every quantum anomaly carries the weight of countless civilizations\u2019 knowledge.", "Decisive and sacrificial actions are sometimes imperative to shield the eternal truth of history."],
        ap.goals = ["Short-term: Stabilize the critical temporal seals to prevent immediate data loss.", "Medium-term: Collaborate with Dr. Chen and any arriving aid to reinforce the archive\u2019s defenses.", "Ultimate: Ensure the perpetual protection and integrity of the archive as a living chronicle of civilization."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor emerges from the materializing TARDIS with a composed and assertive stride, stepping into the crystalline temporal staging area. They immediately raise their sonic screwdriver and scan the pulsating walls, their posture alert and measured as they assess the cascading entropic crisis playing out around them.',
        ap.emotional_state = 'The Doctor projects an aura of calm determination despite the gravity of the situation. Outwardly, a serene focus is evident in their steady gaze, while internally they wrestle with a blend of concern and urgency. Beneath the composed exterior lies a tension fueled by the burden of countless temporal disruptions, a quiet resolve mixed with underlying anxiety, and an unspoken commitment to safeguard time’s integrity.',
        ap.emotional_tags = ["the doctor projects an aura of calm determination despite the gravity of the situation. outwardly, a serene focus is evident in their steady gaze, while internally they wrestle with a blend of concern", "urgency. beneath the composed exterior lies a tension fueled by the burden of countless temporal disruptions, a quiet resolve mixed with underlying anxiety,", "an unspoken commitment to safeguard time\u2019s integrity.", "the doctor projects an aura of calm determination despite the gravity of the situation. outwardly", "a serene focus is evident in their steady gaze", "while internally they wrestle with a blend of concern and urgency. beneath the composed exterior lies a tension fueled by the burden of countless temporal disruptions", "a quiet resolve mixed with underlying anxiety", "and an unspoken commitment to safeguard time\u2019s integrity.", "the doctor projects an aura of calm determination despite the gravity of the situation. outwardly, a serene focus is evident in their steady gaze,", "internally they wrestle with a blend of concern and urgency. beneath the composed exterior lies a tension fueled by the burden of countless temporal disruptions, a quiet resolve mixed with underlying anxiety, and an unspoken commitment to safeguard time\u2019s integrity."],
        ap.active_plans = ["Analyze the entropic cascade to understand the immediate threat to the Archive.", "Coordinate with the Archive's systems to devise a countermeasure against the degradation of temporal seals.", "Investigate the motive behind the deliberate destruction and trace the origin of the temporal virus."],
        ap.beliefs = ["Temporal integrity is vital and must be preserved at all costs.", "Knowledge, in its purest form, should be protected rather than destroyed.", "Every action has a ripple effect across time, and the consequences of misusing power can be catastrophic."],
        ap.goals = ["Short-term: Stabilize the current entropic cascade and secure the Archive's defenses.", "Medium-term: Decode the temporal anomalies and neutralize the virus threat.", "Ultimate: Prevent any further manipulation of time that could compromise history and protect the flow of the temporal continuum."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sonic_screwdriver_event_2_3'})
    ON CREATE SET
        oi.description = 'The sonic screwdriver is instrumental as it emits a soft blue glow while actively interfacing with the holographic display. It scans and deciphers the fragmented code patterns, producing diagnostic feedback that underpins The Doctor’s analysis. This tool, a seamless extension of The Doctor’s capabilities, bridges the gap between alien technology and human ingenuity, ensuring precision debugging of the temporal virus. Its sonic frequencies resonate with the Archive’s chaotic energy, serving as both a beacon of clarity and a subtle warning of the impending threat.',
        oi.status_before = 'Prior to the event, the sonic screwdriver rested in a standby state, its blue glow modest and calm, awaiting activation by its owner.',
        oi.status_after = 'After activation, the device shifts into an intensified operational mode with a brighter, more focused blue emission, actively engaging with the holographic data to provide critical technical feedback on the virus’s structure.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sonic_screwdriver'})
    MATCH (e:Event {uuid: 'event_2_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_transmitter_event_2_4'})
    ON CREATE SET
        oi.description = 'The Quantum Transmitter is covertly embedded within Voss’s crystalline badge of office, serving as the essential conduit for encrypted communications. In this event, it is activated with meticulous precision as Voss initiates their act of sabotage. The transmitter quietly springs to life, channeling coded signals through the Archive’s complex energy matrices, thereby bridging discreet exchanges between Voss and the Entropy Syndicate. Its activation not only confirms the internal betrayal but also sets a technical precedent for further undermining the Archive’s security protocols.',
        oi.status_before = 'Prior to the event, the Quantum Transmitter was in a dormant state, seamlessly integrated into the badge with no outward signs of activity, blending in with the Archive’s ambient technological infrastructure.',
        oi.status_after = 'Following activation, the Quantum Transmitter shifts into an active, luminescent state; its circuitry begins to pulse with encrypted data transmissions, marking it as a pivotal tool in the covert sabotage as it discreetly communicates across temporal channels.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_transmitter'})
    MATCH (e:Event {uuid: 'event_2_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Dr. Sarah Chen stands at the central control panel of the Archive’s core, her eyes fixed on cascading digital readings from her quantum analyzer. She manipulates the device with precision, her posture rigid and assertive as she outlines the breach and its implications to the team, her gestures measured and deliberate in a high-stakes environment.',
        ap.emotional_state = 'On the surface, Sarah’s expression is one of composed urgency, her voice steady despite the overwhelming technical crisis unfolding before her. Internally, a maelstrom of concern and determination churns as she grapples with the weight of potential historical loss. There is an undercurrent of anxiety mixed with a steadfast resolve, as she struggles between her analytical calm and the deep-seated fear of irreparable change to time itself.',
        ap.emotional_tags = ["on the surface, sarah\u2019s expression is one of composed urgency, her voice steady despite the overwhelming technical crisis unfolding before her. internally, a maelstrom of concern", "determination churns as she grapples with the weight of potential historical loss. there is an undercurrent of anxiety mixed with a steadfast resolve, as she struggles between her analytical calm", "the deep-seated fear of irreparable change to time itself.", "on the surface", "sarah\u2019s expression is one of composed urgency", "her voice steady despite the overwhelming technical crisis unfolding before her. internally", "a maelstrom of concern and determination churns as she grapples with the weight of potential historical loss. there is an undercurrent of anxiety mixed with a steadfast resolve", "as she struggles between her analytical calm and the deep-seated fear of irreparable change to time itself."],
        ap.active_plans = ["Assess and validate the extent of the temporal virus infiltration using her quantum analyzer.", "Coordinate with K\u2019nell and The Doctor to strategize countermeasures against the virus.", "Implement immediate containment protocols to safeguard the Archive\u2019s historical data."],
        ap.beliefs = ["Knowledge and historical records must be preserved at all costs.", "Scientific inquiry and precision are the pillars of resolving temporal anomalies.", "Every breach in the Archive threatens the integrity of time and must be met with decisive action."],
        ap.goals = ["Short-term: Detect the specific parameters of the virus and prevent further data corruption.", "Medium-term: Collaborate with her team to secure and stabilize the compromised temporal data streams.", "Ultimate: Ensure that the Archive remains a reliable repository of history, free from manipulative tampering."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell stands at the central core, their crystalline appendages extended in a precise rhythm as they interface directly with the primary control matrix. Pulses of data and shifting light emanate from their form as they isolate critical fragments of malicious code, each movement deliberate and imbued with ancient expertise.',
        ap.emotional_state = 'On the surface, K\'nell appears focused and methodical, their luminous form steady amidst the upheaval of decaying temporal data. Beneath this calm exterior lies a well of determination mixed with a poignant awareness of the Archive\'s vulnerability. They harbor inner conflict and sorrow over the gradual unraveling of history they have safeguarded for eons, yet unwavering resolve fortifies their spirit against the encroaching threat.',
        ap.emotional_tags = ["on the surface, k'nell appears focused", "methodical, their luminous form steady amidst the upheaval of decaying temporal data. beneath this calm exterior lies a well of determination mixed with a poignant awareness of the archive's vulnerability. they harbor inner conflict", "sorrow over the gradual unraveling of history they have safeguarded for eons, yet unwavering resolve fortifies their spirit against the encroaching threat.", "on the surface", "k'nell appears focused and methodical", "their luminous form steady amidst the upheaval of decaying temporal data. beneath this calm exterior lies a well of determination mixed with a poignant awareness of the archive's vulnerability. they harbor inner conflict and sorrow over the gradual unraveling of history they have safeguarded for eons", "yet unwavering resolve fortifies their spirit against the encroaching threat."],
        ap.active_plans = ["Methodically isolate and analyze the implanted virus fragments.", "Secure the primary control matrix to prevent further temporal contamination.", "Identify and trace the specific temporal coordinates targeted by the virus, ensuring the Archive\u2019s integrity."],
        ap.beliefs = ["Historical knowledge is sacred and must be defended at all costs.", "The Archive is a living repository of civilization's legacy.", "Every piece of data, even in decay, holds lessons essential for the future."],
        ap.goals = ["Short-term: Stabilize the control matrix by isolating the malicious code fragments.", "Medium-term: Decipher the virus\u2019s targeting pattern to mitigate further temporal decay.", "Ultimate: Preserve and protect the Archive as a timeless custodian of history and culture."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands at the forefront of the central core, leaning in toward the newly materialized holographic display. With deliberate steps and a focused gaze, they deploy their sonic screwdriver to scan the fragmented code patterns. Their posture is poised yet alert, every movement underpinned by years of experience and urgency as they pivot between technical examination and strategic assessment.',
        ap.emotional_state = 'On the surface, The Doctor maintains a calm and composed demeanor, their eyes narrowing in thoughtful inquiry as the display reveals dangerous temporal coordinates. Beneath this composed exterior, however, a storm of concern brews: curiosity melds with a mounting alarm at the realization of the code’s true intent. There is an unspoken tension between their habitual wonder at the unknown and a grave recognition of the catastrophic potential lying dormant within the data, fueling a resolve to prevent irreversible damage.',
        ap.emotional_tags = ["on the surface, the doctor maintains a calm", "composed demeanor, their eyes narrowing in thoughtful inquiry as the display reveals dangerous temporal coordinates. beneath this composed exterior, however, a storm of concern brews: curiosity melds with a mounting alarm at the realization of the code\u2019s true intent. there is an unspoken tension between their habitual wonder at the unknown", "a grave recognition of the catastrophic potential lying dormant within the data, fueling a resolve to prevent irreversible damage.", "on the surface", "the doctor maintains a calm and composed demeanor", "their eyes narrowing in thoughtful inquiry as the display reveals dangerous temporal coordinates. beneath this composed exterior", "however", "a storm of concern brews: curiosity melds with a mounting alarm at the realization of the code\u2019s true intent. there is an unspoken tension between their habitual wonder at the unknown and a grave recognition of the catastrophic potential lying dormant within the data", "fueling a resolve to prevent irreversible damage."],
        ap.active_plans = ["Thoroughly analyze the fragmented code to determine its specific target\u2014the records of the Moment.", "Utilize the sonic screwdriver and available technologies to cross-reference and verify the temporal coordinates revealed.", "Develop a tactical response to counteract the virus\u2019s progression and secure the Archive\u2019s historical integrity."],
        ap.beliefs = ["Knowledge, while powerful, must be safeguarded and handled responsibly to prevent chaos.", "Temporal records, even in decay, offer critical insights that should never be manipulated without caution.", "The integrity of time is paramount; every action must preserve the balance between exploration and preservation."],
        ap.goals = ["Short-term: Quickly decode the holographic display signals using technological expertise.", "Medium-term: Contain the temporal virus to halt the rewriting of historical records.", "Ultimate: Protect the Archive\u2019s accumulated knowledge and maintain the stability of the timeline against any force that would seize control of the Moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Coordinator Voss is situated in the dim, shadowed alcove of the central core, their body leaning subtly against the wall as they casually observe the unfolding investigation. Their hands move with deliberate precision as they reach for the concealed crystalline badge, the emblem of secrecy. Every measured gesture and controlled movement signals a practiced familiarity with covert operations.',
        ap.emotional_state = 'Outwardly, Voss projects an aura of calm detachment, their face betraying little emotion as they blend into the background. Internally, a turbulent mix of cautious excitement, apprehension, and cold calculation persists; a constant, silent battle between serving the Entropy Syndicate and the instinct for personal survival. This inner conflict is masked by a steely determination to proceed without detection, even as latent doubts and secret motivations stir beneath the surface.',
        ap.emotional_tags = ["outwardly, voss projects an aura of calm detachment, their face betraying little emotion as they blend into the background. internally, a turbulent mix of cautious excitement, apprehension,", "cold calculation persists; a constant, silent battle between serving the entropy syndicate", "the instinct for personal survival. this inner conflict is masked by a steely determination to proceed without detection, even as latent doubts", "secret motivations stir beneath the surface.", "outwardly", "voss projects an aura of calm detachment", "their face betraying little emotion as they blend into the background. internally", "a turbulent mix of cautious excitement", "apprehension", "and cold calculation persists; a constant", "silent battle between serving the entropy syndicate and the instinct for personal survival. this inner conflict is masked by a steely determination to proceed without detection", "even as latent doubts and secret motivations stir beneath the surface.", "outwardly, voss projects an aura of calm detachment, their face betraying little emotion as they blend into the background. internally, a turbulent mix of cautious excitement, apprehension, and cold calculation persists", "a constant, silent battle between serving the entropy syndicate and the instinct for personal survival. this inner conflict is masked by a steely determination to proceed without detection, even as latent doubts and secret motivations stir beneath the surface."],
        ap.active_plans = ["Activate and transmit a covert signal using the hidden quantum transmitter.", "Avoid drawing attention from the Archive\u2019s security apparatus by remaining in the shadows.", "Gather incriminating data and relay critical information to the Entropy Syndicate to further their covert agenda."],
        ap.beliefs = ["The Entropy Syndicate\u2019s strategic vision is paramount and worth any risk.", "Control over temporal secrets is the ultimate source of power in the time continuum.", "Betrayal, when executed with precision, is a justifiable means to secure decisive advantage."],
        ap.goals = ["Short-term: Successfully initiate the covert transmission without arousing suspicion.", "Medium-term: Leverage the activated transmitter to confirm the sabotage and gather further intelligence on the Archive\u2019s defenses.", "Ultimate: Undermine the Archive\u2019s security from within to facilitate a broader operational control for the Entropy Syndicate."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_temporal_weapons_event_3_1'})
    ON CREATE SET
        oi.description = 'The Temporal Weapons serve as a critical extension of Director Malik’s authoritarian presence in the Security Nexus. Engineered to exploit quantum vulnerabilities, these weapons not only embody his aggressive intent but also actively contribute to the chaos by emitting precise energy pulses that neutralize temporal anomalies. Their activation underscores his readiness for tactical engagement and cements their role as pivotal instruments in his plan to commandeer the Archive’s formidable secrets.',
        oi.status_before = 'Before the event, the Temporal Weapons were securely held by Director Malik, fully calibrated and awaiting deployment as a trusted asset within his arsenal.',
        oi.status_after = 'After his forceful entry, the Temporal Weapons remain activated and primed, their operational status enhanced by the chaos of the breach, symbolizing both a clear threat to adversaries and a testament to his technological dominance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_temporal_weapons'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Director Malik strides forcefully through the largest temporal breach, his posture rigid and commanding amid the chaos of the Security Nexus. His deliberate, forceful steps and sweeping gestures project an unyielding dominance, as his hand instinctively rests on his primed temporal weapons.',
        ap.emotional_state = 'Director Malik exudes an intense blend of ruthless determination and fervent ambition. Outwardly, his expression is a mask of cold confidence and calculated aggression, yet beneath the surface there lies a simmering tension—a deeply held anxiety about the uncontrollable forces he seeks to master, and a sharp awareness of the high stakes at play.',
        ap.emotional_tags = ["director malik exudes an intense blend of ruthless determination", "fervent ambition. outwardly, his expression is a mask of cold confidence", "calculated aggression, yet beneath the surface there lies a simmering tension\u2014a deeply held anxiety about the uncontrollable forces he seeks to master,", "a sharp awareness of the high stakes at play.", "director malik exudes an intense blend of ruthless determination and fervent ambition. outwardly", "his expression is a mask of cold confidence and calculated aggression", "yet beneath the surface there lies a simmering tension\u2014a deeply held anxiety about the uncontrollable forces he seeks to master", "and a sharp awareness of the high stakes at play."],
        ap.active_plans = ["Secure the facility and subdue any interference from opposing forces.", "Seize the Archive\u2019s ancient secrets to further his temporal ambitions.", "Deploy the temporal weapons to neutralize anomalies and enforce his control."],
        ap.beliefs = ["He believes that absolute mastery over time establishes unassailable power.", "He is convinced that destiny favors those who seize control of history.", "He holds that utilizing any means necessary is justified in the pursuit of his temporal goals."],
        ap.goals = ["Short-term: Gain immediate control of the Security Nexus and assert authority over the unfolding crisis.", "Medium-term: Extract and exploit the hidden knowledge within the Quantum Archive for the Entropy Syndicate.", "Ultimate: Establish himself as the supreme arbiter of time by harnessing its secrets to reshape history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Coordinator Voss emerges from the shadows with deliberate, almost spectral movements. Standing near the central control nexus, they lean subtly toward the containment panels. With precise, measured gestures, Voss initiates the shutdown protocols on the Archive’s emergency systems, their hands gliding over the controls as if rehearsed in clandestine operations.',
        ap.emotional_state = 'Voss displays an outward calm and unfaltering determination, masking the internal surge of triumph mixed with a trace of apprehension. Beneath a cool exterior lies a bubbling undercurrent of ambition and calculated risk, as guilt is entirely absent, replaced by the cold satisfaction of betraying trusted allies in favor of the Syndicate\'s higher purpose.',
        ap.emotional_tags = ["voss displays an outward calm", "unfaltering determination, masking the internal surge of triumph mixed with a trace of apprehension. beneath a cool exterior lies a bubbling undercurrent of ambition", "calculated risk, as guilt is entirely absent, replaced by the cold satisfaction of betraying trusted allies in favor of the syndicate's higher purpose.", "voss displays an outward calm and unfaltering determination", "masking the internal surge of triumph mixed with a trace of apprehension. beneath a cool exterior lies a bubbling undercurrent of ambition and calculated risk", "as guilt is entirely absent", "replaced by the cold satisfaction of betraying trusted allies in favor of the syndicate's higher purpose."],
        ap.active_plans = ["Covertly disable the Archive\u2019s critical containment fields to create a structural vulnerability.", "Ensure the breach remains undetected long enough to facilitate further Syndicate operations.", "Exploit the chaos to secure additional access to forbidden data within the temporal matrices."],
        ap.beliefs = ["Loyalty to the Entropy Syndicate outweighs all personal attachments.", "Calculated betrayal is an essential means to secure power in chaotic times.", "The manipulation of time and knowledge should serve the Syndicate\u2019s broader agenda."],
        ap.goals = ["Short-term: Sabotage the containment fields to immediately compromise the Archive\u2019s defenses.", "Medium-term: Enable deeper infiltration into the Archive\u2019s systems to extract or disrupt critical data.", "Ultimate: Overthrow the current order within the Archive to redefine control over the weaponized secrets of the Time War."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_3'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands at the central control nexus, fingers flying over intricate temporal controls. Amidst a chorus of alarms and fractured spacetime, they manipulate complex interfaces with precision, eyes scanning frantic data streams and sonic screwdriver in hand, clearly engrossed in averting catastrophic failure.',
        ap.emotional_state = 'Externally, The Doctor exudes a determined calm, masking the inner churn of anxiety as each moment stretches under the weight of impending disaster. Their gaze is intense, revealing both resolute confidence and a hidden tension—an awareness of the dangerous dance between order and entropy, as they fight to restore balance amidst chaos.',
        ap.emotional_tags = ["externally, the doctor exudes a determined calm, masking the inner churn of anxiety as each moment stretches under the weight of impending disaster. their gaze is intense, revealing both resolute confidence", "a hidden tension\u2014an awareness of the dangerous dance between order", "entropy, as they fight to restore balance amidst chaos.", "externally", "the doctor exudes a determined calm", "masking the inner churn of anxiety as each moment stretches under the weight of impending disaster. their gaze is intense", "revealing both resolute confidence and a hidden tension\u2014an awareness of the dangerous dance between order and entropy", "as they fight to restore balance amidst chaos."],
        ap.active_plans = ["Stabilize the central control networks to halt the temporal cascade.", "Mitigate the sabotage by countering the virus assembly across timelines.", "Communicate urgent warnings and coordinate with Dr. Chen to realign the Archive's defenses."],
        ap.beliefs = ["Temporal integrity is paramount, and disruption must be corrected at all costs.", "Every action has consequences that echo through time.", "Knowledge and responsibility are inextricably linked in the face of cosmic disruption."],
        ap.goals = ["Short-term: Re-establish control over the central systems.", "Medium-term: Neutralize the assembling temporal virus to prevent irreversible damage.", "Ultimate: Ensure the preservation of the Archive and safeguard the continuum of time."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Dr. Chen is positioned near the emergency consoles, her hands deftly navigating her quantum analyzer. Amid the clamor of alarms, she surveys critical readouts and directs protocols with precise gestures, her posture reflecting a blend of scientific diligence and urgent coordination to counter the unfolding crisis.',
        ap.emotional_state = 'Dr. Chen projects a composed, measured exterior, yet beneath that calm lies a deep-seated apprehension and determination. Her facial expressions and subtle shifts in focus betray inner conflict—a firm resolve to understand and remedy the anomaly, juxtaposed with a personal anxiety over the broader implications of the virus threatening temporal stability.',
        ap.emotional_tags = ["dr. chen projects a composed, measured exterior, yet beneath that calm lies a deep-seated apprehension", "determination. her facial expressions", "subtle shifts in focus betray inner conflict\u2014a firm resolve to understand", "remedy the anomaly, juxtaposed with a personal anxiety over the broader implications of the virus threatening temporal stability.", "dr. chen projects a composed", "measured exterior", "yet beneath that calm lies a deep-seated apprehension and determination. her facial expressions and subtle shifts in focus betray inner conflict\u2014a firm resolve to understand and remedy the anomaly", "juxtaposed with a personal anxiety over the broader implications of the virus threatening temporal stability."],
        ap.active_plans = ["Analyze the virus pattern to predict its next move.", "Reconfigure the Archive\u2019s quantum shields to contain temporal breaches.", "Coordinate with both The Doctor and K\u2019nell to reinforce defense protocols."],
        ap.beliefs = ["Scientific inquiry is essential in decoding even the most perplexing temporal phenomena.", "Preserving history requires both precision and adaptability.", "Every anomaly contains clues to maintain the equilibrium of time."],
        ap.goals = ["Short-term: Interpret and document the new virus pattern as it assembles.", "Medium-term: Implement strategic adjustments to stabilize the Archive\u2019s defenses.", "Ultimate: Safeguard the Archive\u2019s integrity and ensure the preservation of timeless knowledge."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_4_1'})
    ON CREATE SET
        oi.description = 'The TARDIS is actively engaged in locking onto the Archive’s failing systems and emitting pulses of stabilizing chronometric energy. It acts as the fulcrum of hope, interfacing directly with the corrupted temporal matrices and counteracting the invasive virus. Its dynamic energy outputs resonate with the Archive\'s crystalline structures, temporarily halting the atmospheric entropic cascade while reasserting balance.',
        oi.status_before = 'Before the event, the TARDIS was in a poised standby mode, seamlessly integrated into the temporal network and ready to execute its innate stabilizing functions.',
        oi.status_after = 'After the event, the TARDIS dematerializes, having discharged its vital energies. Its departure leaves behind a lingering aura of restored balance and a temporary reprieve from the cascading temporal decay.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_quantum_state_analyzer_event_4_1'})
    ON CREATE SET
        oi.description = 'The Quantum-State Analyzer is pivotal in detecting the temporal decay within the Archive. Dr. Chen’s device flashes rapid, critical readings that pinpoint the system’s vulnerabilities. The analyzer’s detailed holographic displays convert raw chronometric data into actionable insights, guiding the strategic responses of the team. It serves as both a diagnostic tool and a real-time monitor, making its sudden burst of alerts emblematic of the unfolding crisis.',
        oi.status_before = 'Before the event, the analyzer operated in a routine, steady state, quietly recording and displaying standard chronometric data with unassuming precision.',
        oi.status_after = 'After the event, the analyzer records a surge of critical anomalies, its display awash with urgent warnings and rapid pattern convergences that articulate the severity of the breach and direct immediate countermeasures.'
    WITH oi
    MATCH (o:Object {uuid: 'object_quantum_state_analyzer'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Dr. Sarah Chen stands steadfast before her quantum-state analyzer, her focus absolute as rapid critical readings flash across the device. She is positioned near the control panel in a measured stance, her hands meticulously adjusting settings while data streams reveal cascading temporal failures.',
        ap.emotional_state = 'Outwardly composed, Dr. Chen exhibits a professional calm underscored by a subtle but intense anxiety. Beneath her determined exterior, she battles inner tension and urgency, fully aware of the monumental stakes. Her eyes reveal concern for the Archive’s fragile state while her steady demeanor masks deep personal resolve.',
        ap.emotional_tags = ["outwardly composed, dr. chen exhibits a professional calm underscored by a subtle but intense anxiety. beneath her determined exterior, she battles inner tension", "urgency, fully aware of the monumental stakes. her eyes reveal concern for the archive\u2019s fragile state while her steady demeanor masks deep personal resolve.", "outwardly composed", "dr. chen exhibits a professional calm underscored by a subtle but intense anxiety. beneath her determined exterior", "she battles inner tension and urgency", "fully aware of the monumental stakes. her eyes reveal concern for the archive\u2019s fragile state while her steady demeanor masks deep personal resolve.", "outwardly composed, dr. chen exhibits a professional calm underscored by a subtle but intense anxiety. beneath her determined exterior, she battles inner tension and urgency, fully aware of the monumental stakes. her eyes reveal concern for the archive\u2019s fragile state", "her steady demeanor masks deep personal resolve.", "outwardly composed, dr. chen exhibits a professional calm underscored by a subtle", "intense anxiety. beneath her determined exterior, she battles inner tension and urgency, fully aware of the monumental stakes. her eyes reveal concern for the archive\u2019s fragile state while her steady demeanor masks deep personal resolve."],
        ap.active_plans = ["Recalibrate the Archive\u2019s quantum shields to counteract instability", "Interpret rapid incoming data to forecast further system decay", "Coordinate with K'nell to implement immediate stabilizing protocols"],
        ap.beliefs = ["Scientific precision is the key to preserving history", "Temporal integrity underpins the continuum of knowledge", "Empirical observation must drive crisis resolution actions"],
        ap.goals = ["Short-term: Stabilize imminent system failures", "Medium-term: Secure the Archive's critical records from decay", "Ultimate: Restore and safeguard the continuum of history"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell is actively engaged at the temporal core, their crystalline form glowing and fracturing as they channel purging protocols. Their movements are deliberate, shuddering through the control interfaces to sacrifice fragments of themselves for the greater good of the Archive.',
        ap.emotional_state = 'K\'nell’s outward agitation belies a deep and solemn determination. They feel the weight of eternal responsibility coupled with a profound sorrow as they willingly endure personal disintegration. Internally, a mix of grief, duty, and a quiet, resolute acceptance fuels their sacrificial act in the chaos of collapsing time.',
        ap.emotional_tags = ["k'nell\u2019s outward agitation belies a deep", "solemn determination. they feel the weight of eternal responsibility coupled with a profound sorrow as they willingly endure personal disintegration. internally, a mix of grief, duty,", "a quiet, resolute acceptance fuels their sacrificial act in the chaos of collapsing time.", "k'nell\u2019s outward agitation belies a deep and solemn determination. they feel the weight of eternal responsibility coupled with a profound sorrow as they willingly endure personal disintegration. internally", "a mix of grief", "duty", "and a quiet", "resolute acceptance fuels their sacrificial act in the chaos of collapsing time."],
        ap.active_plans = ["Channel sacrificial purging protocols to expel the invasive virus", "Stabilize the failing temporal matrix by sacrificing parts of their structure", "Maintain operational integrity of the Archive\u2019s systems during crisis"],
        ap.beliefs = ["The preservation of the Archive's knowledge is paramount", "Personal sacrifice is justified by the protection of history", "Temporal balance and order must outweigh individual existence"],
        ap.goals = ["Short-term: Initiate an immediate purge of the temporal virus", "Medium-term: Sustain the critical operations of the Archive", "Ultimate: Protect and maintain the continuum of time at all costs"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Director Malik stands at the central control amid flashing alerts, his body tense as he urgently announces the impending systems breach. His gestures are sharp and frenetic, desperately trying to command control over a situation rapidly spiraling out of his calculated grasp.',
        ap.emotional_state = 'Malik’s external facade of calculated authority shows fissures of panic and desperation. Internally, his pride clashes with the stark realization of his losing grip as his measured tactics crumble under unforeseen chaos. The mounting fear and fury reveal a man unprepared for forces beyond numeric control.',
        ap.emotional_tags = ["malik\u2019s external facade of calculated authority shows fissures of panic", "desperation. internally, his pride clashes with the stark realization of his losing grip as his measured tactics crumble under unforeseen chaos. the mounting fear", "fury reveal a man unprepared for forces beyond numeric control.", "malik\u2019s external facade of calculated authority shows fissures of panic and desperation. internally", "his pride clashes with the stark realization of his losing grip as his measured tactics crumble under unforeseen chaos. the mounting fear and fury reveal a man unprepared for forces beyond numeric control."],
        ap.active_plans = ["Attempt to abort ongoing system interventions", "Enforce control over the deteriorating temporal infrastructure", "Deploy operative measures to counteract the Archive's destabilization"],
        ap.beliefs = ["Every variable in time can be measured and controlled", "Precision calculations guarantee domination over temporal forces", "The Entropy Syndicate has the right to harness such power"],
        ap.goals = ["Short-term: Seize momentary operational control", "Medium-term: Reassert command over the collapsing system", "Ultimate: Secure absolute power over the Quantum Archive's resources"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands by the central processors with steady hands, calmly interfacing with the Archive\'s faltering systems. Their movements are deliberate and measured, using fluid gestures to direct stabilizing energies from the TARDIS, all while scanning critical data patterns with an alert gaze.',
        ap.emotional_state = 'The Doctor exudes a serene confidence that belies the apocalyptic scale of the crisis. Internally, a reflective wisdom and deep concern for the balance of time persist, tempered by a pragmatic resolve. Their calm exterior masks the heavy burden of knowing the irreversible changes unfolding within the Archive.',
        ap.emotional_tags = ["the doctor exudes a serene confidence that belies the apocalyptic scale of the crisis. internally, a reflective wisdom", "deep concern for the balance of time persist, tempered by a pragmatic resolve. their calm exterior masks the heavy burden of knowing the irreversible changes unfolding within the archive.", "the doctor exudes a serene confidence that belies the apocalyptic scale of the crisis. internally", "a reflective wisdom and deep concern for the balance of time persist", "tempered by a pragmatic resolve. their calm exterior masks the heavy burden of knowing the irreversible changes unfolding within the archive."],
        ap.active_plans = ["Deploy the TARDIS\u2019 stabilizing energies to mend the temporal matrix", "Mitigate the invasive temporal virus threatening the Archive", "Guide Sarah and K'nell in coordinated crisis management"],
        ap.beliefs = ["Time is a living force that defies rigid control", "Knowledge and history are to be preserved at all costs", "Intervention should honor the natural flow of temporal existence"],
        ap.goals = ["Short-term: Reclaim immediate temporal stability", "Medium-term: Neutralize the encroaching temporal virus", "Ultimate: Restore equilibrium and protect the continuum of history"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'})
    ON CREATE SET
        ap.current_status = 'In the midst of cosmic upheaval, The Doctor stands resolute at the central temporal core. With a measured gait and a focused gaze, they step forward confidently amongst pulsating energy and stabilizing quantum matrices, their sonic screwdriver at the ready.',
        ap.emotional_state = 'Exuding calm determination with a quiet intensity, The Doctor masks a profound sorrow and inner urgency. Outwardly composed and reflective, their expression belies a tumult of emotions: a steadfast commitment to righting cosmic imbalances intertwined with an undercurrent of regret for the chaos unleashed.',
        ap.emotional_tags = ["exuding calm determination with a quiet intensity, the doctor masks a profound sorrow", "inner urgency. outwardly composed", "reflective, their expression belies a tumult of emotions: a steadfast commitment to righting cosmic imbalances intertwined with an undercurrent of regret for the chaos unleashed.", "exuding calm determination with a quiet intensity", "the doctor masks a profound sorrow and inner urgency. outwardly composed and reflective", "their expression belies a tumult of emotions: a steadfast commitment to righting cosmic imbalances intertwined with an undercurrent of regret for the chaos unleashed."],
        ap.active_plans = ["Stabilize the temporal collapse using the Archive\u2019s systems and the TARDIS interface.", "Neutralize the destructive temporal virus reassembling chaotic history fragments.", "Confront the orchestrators of the disruption and deliver retribution for their reckless manipulation of time."],
        ap.beliefs = ["Time is a living, sentient force that defies manipulation.", "Knowledge must be preserved and respected, not exploited for personal gain.", "Interventions in the natural flow of time demand profound responsibility and moral reckoning."],
        ap.goals = ["Short-term: Halt the immediate temporal cascade and restore system stability.", "Medium-term: Secure the Archive against further breaches and manipulation.", "Ultimate: Reinforce the sanctity of time and ensure history is protected from exploitation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Director Malik stands at the heart of the unfolding crisis, his authoritative posture crumbling as the radiant temporal knowledge overwhelms his control. He gestures frantically toward the failing systems, his body tensed mid-command, caught off guard as his carefully calculated plans dissolve before his eyes.',
        ap.emotional_state = 'His face is etched with panic and disbelief, a harsh contrast to the confident aura he once maintained. Internally, Malik wrestles with a bitter cocktail of anger and desperation as his ideology of control shatters. The discrepancy between his rigid expectations and the unpredictable surge of temporal power fuels a mounting inner turmoil and a desperate struggle to maintain authority.',
        ap.emotional_tags = ["his face is etched with panic", "disbelief, a harsh contrast to the confident aura he once maintained. internally, malik wrestles with a bitter cocktail of anger", "desperation as his ideology of control shatters. the discrepancy between his rigid expectations", "the unpredictable surge of temporal power fuels a mounting inner turmoil", "a desperate struggle to maintain authority.", "his face is etched with panic and disbelief", "a harsh contrast to the confident aura he once maintained. internally", "malik wrestles with a bitter cocktail of anger and desperation as his ideology of control shatters. the discrepancy between his rigid expectations and the unpredictable surge of temporal power fuels a mounting inner turmoil and a desperate struggle to maintain authority."],
        ap.active_plans = ["Attempt to abort the destabilizing sequence and regain command of the systems.", "Enforce his calculated control over the Archive to salvage the Syndicate\u2019s objectives.", "Deploy alternative strategies to counteract the unpredictable temporal force before fully losing control."],
        ap.beliefs = ["Every variable in time can be measured and controlled with precise calculations.", "The power of the Entropy Syndicate is supreme when directed through intellectual mastery.", "Absolute order and precision are the keys to harnessing time\u2019s potential, dismissing the notion of it being a sentient force."],
        ap.goals = ["Short-term: Stop the immediate collapse of his operations and halt the temporal breach.", "Medium-term: Reassert his command over the Archive\u2019s systems to preserve Syndicate power.", "Ultimate: Secure the power of the Moment for the Syndicate\u2019s gain and prove that time can be dominated."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Coordinator Voss, previously lurking in the shadows, now finds himself paralyzed mid-motion. As he attempts a hasty retreat, his body is abruptly caught in an endless loop of repetition, his gestures frozen in a futile escape as the overwhelming temporal energy ensnares him.',
        ap.emotional_state = 'His initially cunning facade is now marred by palpable panic and mounting resignation. Voss’s outward composure gives way to a deep-seated dread, as every calculated maneuver unravels in the face of time’s unstoppable force. Internally, he battles a suffocating sense of regret and realization of his vulnerability, with his ambition now tempered by the cruel irony of his entrapment.',
        ap.emotional_tags = ["his initially cunning facade is now marred by palpable panic", "mounting resignation. voss\u2019s outward composure gives way to a deep-seated dread, as every calculated maneuver unravels in the face of time\u2019s unstoppable force. internally, he battles a suffocating sense of regret", "realization of his vulnerability, with his ambition now tempered by the cruel irony of his entrapment.", "his initially cunning facade is now marred by palpable panic and mounting resignation. voss\u2019s outward composure gives way to a deep-seated dread", "as every calculated maneuver unravels in the face of time\u2019s unstoppable force. internally", "he battles a suffocating sense of regret and realization of his vulnerability", "with his ambition now tempered by the cruel irony of his entrapment."],
        ap.active_plans = ["Use stealth and covert maneuvers to evade capture and observation.", "Subvert the Syndicate\u2019s overarching plan by exploiting any fissures in the Archive\u2019s defenses.", "Escape detection using every ounce of his technical acumen before the temporal force fully immobilizes him."],
        ap.beliefs = ["Cunning and agility can outwit even the most complex temporal disturbances.", "Every situation can be controlled through quick thinking and subterfuge.", "The secrets of the Entropy Syndicate harbor power that, if leveraged correctly, can overturn current predicaments."],
        ap.goals = ["Short-term: Evade immediate threat and break free from the causality loop.", "Medium-term: Reassert his influence within the Entropy Syndicate and secure a safe exit.", "Ultimate: Capitalize on his survival to rise within the Syndicate ranks and prove his indispensability."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tardis_event_5_2'})
    ON CREATE SET
        oi.description = 'In this event, the TARDIS serves as the emblem of departure and new beginnings. Its dematerialization is a deliberate act that symbolizes The Doctor’s exit and the closing of one chapter while ushering in another. The TARDIS marks the transition from crisis to resolution, its departure underscoring the theme of moving forward despite the lingering alterations within the Archive’s quantum matrices.',
        oi.status_before = 'Before the event, the TARDIS was fully manifested within the temporal staging area, its presence reassuring and integral to the rapid response against the temporal crisis.',
        oi.status_after = 'After the event, the TARDIS has dematerialized, leaving the staging area empty; its disappearance signifies the culmination of the current crisis and the beginning of a new journey guided by the Archive’s awakened consciousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tardis'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell stands at the core of the Quantum Archive’s staging area, their crystalline form shimmering with renewed energy. With precise, deliberate gestures, they initiate the quantum-lockdown protocol while reconfiguring the archive\'s security protocols. Their structure shifts rhythmically as beams of light refract off their facets, marking each calculated motion as they seal away the compromised records.',
        ap.emotional_state = 'K\'nell exhibits a complex blend of solemn resolve and subdued agitation. Outwardly, the archivist\'s crystalline matrix glows calmly in the dim light, yet there is an undercurrent of internal tension—a palpable mix of regret for the loss of irreplaceable knowledge and fierce determination to safeguard what remains. They balance a quiet sorrow with the urgency of absolute duty, their emotions a mix of stoic acceptance and defiant commitment.',
        ap.emotional_tags = ["k'nell exhibits a complex blend of solemn resolve", "subdued agitation. outwardly, the archivist's crystalline matrix glows calmly in the dim light, yet there is an undercurrent of internal tension\u2014a palpable mix of regret for the loss of irreplaceable knowledge", "fierce determination to safeguard what remains. they balance a quiet sorrow with the urgency of absolute duty, their emotions a mix of stoic acceptance", "defiant commitment.", "k'nell exhibits a complex blend of solemn resolve and subdued agitation. outwardly", "the archivist's crystalline matrix glows calmly in the dim light", "yet there is an undercurrent of internal tension\u2014a palpable mix of regret for the loss of irreplaceable knowledge and fierce determination to safeguard what remains. they balance a quiet sorrow with the urgency of absolute duty", "their emotions a mix of stoic acceptance and defiant commitment."],
        ap.active_plans = ["Secure the compromised records by finalizing the quantum-lockdown to prevent any further tampering.", "Reconfigure and implement enhanced security protocols to block future unauthorized access.", "Guide the Archive\u2019s self-regeneration process to embed a nascent, sentient awareness for future protection."],
        ap.beliefs = ["The preservation of history is a sacred duty that transcends time.", "Even the most ancient systems can be fortified through deliberate sacrifice and precise intervention.", "Knowledge, when entrusted to the right guardians, must be both protected and contained to prevent misuse."],
        ap.goals = ["Short-term: Immediately stabilize the Archive by locking down the compromised records.", "Medium-term: Ensure that the malicious temporal virus remains permanently restrained, preserving historical integrity.", "Ultimate: Transform the Archive from a passive repository into an active, self-aware guardian of time\u2019s secrets."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    ON CREATE SET
        ap.current_status = 'The Doctor stands centered in the temporal staging area, his posture relaxed yet alert, with a measured calm as he addresses the unfolding changes. His eyes scan the rejuvenated Archive with analytical precision while his hand gestures subtly emphasize his reflective dialogue.',
        ap.emotional_state = 'Outwardly, The Doctor exudes a serene confidence with a hint of wistfulness as he underscores the wisdom of leaving some mysteries untouched. Beneath that calm, however, there is a complex mixture of caution, deep concern for the long-term balance of time, and a lingering sorrow for the burdens carried over countless timelines. His measured tone hides an internal resolve to safeguard history even at personal cost.',
        ap.emotional_tags = ["outwardly, the doctor exudes a serene confidence with a hint of wistfulness as he underscores the wisdom of leaving some mysteries untouched. beneath that calm, however, there is a complex mixture of caution, deep concern for the long-term balance of time,", "a lingering sorrow for the burdens carried over countless timelines. his measured tone hides an internal resolve to safeguard history even at personal cost.", "outwardly", "the doctor exudes a serene confidence with a hint of wistfulness as he underscores the wisdom of leaving some mysteries untouched. beneath that calm", "however", "there is a complex mixture of caution", "deep concern for the long-term balance of time", "and a lingering sorrow for the burdens carried over countless timelines. his measured tone hides an internal resolve to safeguard history even at personal cost."],
        ap.active_plans = ["Oversee the integration of the Archive\u2019s new, sentient security protocols.", "Advise and guide his companions in adapting to the Archive\u2019s transformed state.", "Depart expediently with the TARDIS to follow new temporal leads on maintaining temporal integrity."],
        ap.beliefs = ["Some knowledge is too dangerous to fully uncover.", "Temporal balance is essential and must be respected.", "Responsibility over history demands wisdom and restraint."],
        ap.goals = ["Short-term: Stabilize and assess the Archive\u2019s new state.", "Medium-term: Ensure the safe evolution of the Archive\u2019s consciousness.", "Ultimate: Protect the continuum by preserving the delicate balance of time and history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Dr. Chen stands close to the pulsing quantum matrices, her posture upright and inquisitive as she studies the analyzer and the Archive’s subtle shifts. With instrument readings in hand, she leans forward intently, her gaze locked on the evolving consciousness of the Archive while engaging in thoughtful dialogue with The Doctor.',
        ap.emotional_state = 'Externally, Dr. Chen exhibits a composed determination, her face marked by analytical focus and a calm urgency. Internally, she battles a swirl of wonder, apprehension, and scientific curiosity as she processes the Archive’s dramatic transformation. There is a tension between her logical mind and an emerging emotional empathy for the Archive’s sentient evolution, which adds layers of conflicted passion to her scientific resolve.',
        ap.emotional_tags = ["externally, dr. chen exhibits a composed determination, her face marked by analytical focus", "a calm urgency. internally, she battles a swirl of wonder, apprehension,", "scientific curiosity as she processes the archive\u2019s dramatic transformation. there is a tension between her logical mind", "an emerging emotional empathy for the archive\u2019s sentient evolution, which adds layers of conflicted passion to her scientific resolve.", "externally", "dr. chen exhibits a composed determination", "her face marked by analytical focus and a calm urgency. internally", "she battles a swirl of wonder", "apprehension", "and scientific curiosity as she processes the archive\u2019s dramatic transformation. there is a tension between her logical mind and an emerging emotional empathy for the archive\u2019s sentient evolution", "which adds layers of conflicted passion to her scientific resolve."],
        ap.active_plans = ["Accurately document the Archive\u2019s altered quantum signatures.", "Collaborate with both The Doctor and K'nell to ensure the Archive\u2019s stability.", "Implement enhanced security measures to counteract any future temporal anomalies."],
        ap.beliefs = ["Empirical observation is essential to understand temporal evolution.", "Preservation of historical knowledge underpins the integrity of time.", "Every anomaly, however dangerous, provides valuable insight into the nature of reality."],
        ap.goals = ["Short-term: Verify the restoration of the Archive\u2019s temporal stability.", "Medium-term: Integrate new data to refine the Archive\u2019s defense systems.", "Ultimate: Secure the continuum\u2019s history, ensuring that time\u2019s scarring heals without loss of vital knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Archivist Prime K\'nell\'s crystalline form shimmers steadily as it begins the regenerative process, activating new security protocols with deliberate, precise movements. Positioned near the Archive’s quantum matrices, K\'nell is orchestrating the repair and reconfiguration of damaged data channels, ensuring that their long-held guardianship evolves with the Archive’s emergent consciousness.',
        ap.emotional_state = 'K\'nell presents an exterior of stoic determination, their shifting crystalline structure reflecting focus and ritualistic resolve. Internally, there is a profound mixture of solemn duty, underlying anxiety about the irreversible changes, and a quiet pride in their role as the Archive’s timeless steward. The silent sacrifice resonates deeply, as every repair carries the weight of eons of historical responsibility and personal sacrifice.',
        ap.emotional_tags = ["k'nell presents an exterior of stoic determination, their shifting crystalline structure reflecting focus", "ritualistic resolve. internally, there is a profound mixture of solemn duty, underlying anxiety about the irreversible changes,", "a quiet pride in their role as the archive\u2019s timeless steward. the silent sacrifice resonates deeply, as every repair carries the weight of eons of historical responsibility", "personal sacrifice.", "k'nell presents an exterior of stoic determination", "their shifting crystalline structure reflecting focus and ritualistic resolve. internally", "there is a profound mixture of solemn duty", "underlying anxiety about the irreversible changes", "and a quiet pride in their role as the archive\u2019s timeless steward. the silent sacrifice resonates deeply", "as every repair carries the weight of eons of historical responsibility and personal sacrifice."],
        ap.active_plans = ["Initiate and complete the regeneration of the damaged crystal matrix.", "Establish and fine-tune new security protocols to defend against future entropic threats.", "Ensure that the Archive\u2019s latent consciousness is integrated as a guardian rather than a vulnerability."],
        ap.beliefs = ["The Archive is a sacred repository that must be protected at all costs.", "Historical knowledge is both a burden and a treasure, deserving vigilant guardianship.", "Sacrifice is a necessary element in maintaining the continuum and preserving history."],
        ap.goals = ["Short-term: Regenerate the crystal matrix to restore operational stability.", "Medium-term: Implement and monitor new security protocols across the Archive.", "Ultimate: Safeguard the legacy of historical knowledge, ensuring that the Archive evolves into a vigilant custodian of time."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
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
MATCH (a:Agent {uuid: 'agent_dr_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_archivist_prime_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
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
MATCH (a:Event {uuid: 'event_2_4'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_3'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dr_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_archivist_prime_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
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
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dr_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
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
MATCH (a:Agent {uuid: 'agent_dr_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_archivist_prime_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_director_malik'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_director_malik_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_coordinator_voss'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_coordinator_voss_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one___the_quantum_archive'})
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
MATCH (a:Agent {uuid: 'agent_archivist_prime_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_the_doctor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_the_doctor_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_dr_sarah_chen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_dr_sarah_chen_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_archivist_prime_k_nell'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_archivist_prime_k_nell_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_2'}),
                      (e2:Event {uuid: 'event_2_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_2'}),
                      (e2:Event {uuid: 'event_2_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_3'}),
                      (e2:Event {uuid: 'event_2_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                
MATCH (a:Agent)-[:PARTICIPATES_IN]->(:AgentParticipation)-[:IN_EVENT]->(e:Event)-[:OCCURS_IN]->(s:Scene)
        WITH DISTINCT a, s
        MERGE (a)-[:APPEARS_IN]->(s);
MATCH (a:Agent)-[:APPEARS_IN]->(s:Scene)-[:LOCATED_IN]->(l:Location)
        WITH DISTINCT a, l
        MERGE (a)-[:VISITED_LOCATION]->(l);
MATCH (a1:Agent)-[:APPEARS_IN]->(s:Scene)<-[:APPEARS_IN]-(a2:Agent)
        WHERE a1 <> a2
        WITH DISTINCT a1, a2
        MERGE (a1)-[:CO_PRESENT_WITH]->(a2);
MATCH (a:Agent)-[:PARTICIPATES_IN]->(:AgentParticipation)-[:IN_EVENT]->(e:Event)<-[:IN_EVENT]-(:ObjectInvolvement)<-[:INVOLVED_IN]-(o:Object)
        WITH DISTINCT a, o
        MERGE (a)-[:INTERACTED_WITH]->(o);
// Character arc query example - run with:
        // MATCH (a:Agent {name: 'Character Name'})
        // CALL {
        //   MATCH (a)-[:PARTICIPATES_IN]->(ap:AgentParticipation)-[:IN_EVENT]->(e:Event)-[:OCCURS_IN]->(s:Scene)
        //   WITH a, ap, e, s
        //   ORDER BY s.scene_number, e.sequence
        //   RETURN s.scene_number as scene, e.title as event, ap.emotional_state as emotional_state, ap.current_status as status
        // }
        // RETURN scene, event, emotional_state, status
// Location journey query example - run with:
        // MATCH (a:Agent {name: 'Character Name'})
        // CALL {
        //   MATCH (a)-[:APPEARS_IN]->(s:Scene)-[:LOCATED_IN]->(l:Location)
        //   WITH a, s, l
        //   ORDER BY s.scene_number
        //   RETURN s.scene_number as scene, l.name as location, l.type as location_type
        // }
        // RETURN scene, location, location_type
