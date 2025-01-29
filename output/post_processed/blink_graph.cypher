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
MERGE (a:Agent {uuid: 'agent-jeanluc_picard'})
    ON CREATE SET
        a.name = 'Jean-Luc Picard',
        a.title = 'Captain',
        a.description = 'Captain of the U.S.S. Enterprise-D, Jean-Luc Picard is a highly respected Starfleet officer known for his intelligence, diplomacy, and unwavering sense of duty. He is known for his thoughtful leadership and values logic, reason, and peace.',
        a.traits = ["Logical", "Intelligent", "Respected", "Empathic", "Diplomatic"],
        a.sphere_of_influence = 'Starship Command'
    ;
MERGE (a:Agent {uuid: 'agent-william_t_riker'})
    ON CREATE SET
        a.name = 'William T. Riker',
        a.title = 'Commander',
        a.description = 'First Officer of the U.S.S. Enterprise-D, William T. Riker is known for his charismatic presence, leadership skills, and quick thinking. He often serves as a trusted adviser to Captain Picard.',
        a.traits = ["Intelligent", "Trustworthy", "Charismatic", "Optimistic"],
        a.sphere_of_influence = 'Starship Operations'
    ;
MERGE (a:Agent {uuid: 'agent-data'})
    ON CREATE SET
        a.name = 'Data',
        a.title = 'Lieutenant Commander',
        a.description = 'An android officer serving on the U.S.S. Enterprise-D known for his positronic brain, which allows him to process information at incredible speeds. He is logical and highly skilled in a range of scientific and technical fields.',
        a.traits = ["Curious", "Android", "Skilled", "Logical"],
        a.sphere_of_influence = 'Operations and Science'
    ;
MERGE (a:Agent {uuid: 'agent-worf'})
    ON CREATE SET
        a.name = 'Worf',
        a.title = 'Lieutenant',
        a.description = 'A Klingon officer stationed on the U.S.S. Enterprise-D, known for his warrior code of honor and combat skills. Worf often provides tactical and security expertise.',
        a.traits = ["Klingon", "Courageous", "Warrior", "Honorable"],
        a.sphere_of_influence = 'Security and Tactics'
    ;
MERGE (a:Agent {uuid: 'agent-janina_taur'})
    ON CREATE SET
        a.name = 'Janina Taur',
        a.title = 'Ensign',
        a.description = 'A promising young officer serving as helmsman on the U.S.S. Enterprise-D. Janina Taur graduated at the top of her class in Starfleet Academy in 2362, specializing in astrophysics and warp field theory.',
        a.traits = ["Promising", "Intelligent", "Confident", "Skilled"],
        a.sphere_of_influence = 'Navigation'
    ;
MERGE (a:Agent {uuid: 'agent-deanna_troi'})
    ON CREATE SET
        a.name = 'Deanna Troi',
        a.title = 'Counselor',
        a.description = 'Counselor aboard the U.S.S. Enterprise-D, Deanna Troi is known for her empathic abilities, stemming from her half-Betazoid heritage. She is influential in navigating the emotional and psychological aspects of crew dynamics and interstellar relations.',
        a.traits = ["Supportive", "Perceptive", "Empathic", "Sensitive"],
        a.sphere_of_influence = 'Psychological Counseling'
    ;
MERGE (a:Agent {uuid: 'agent-geordi_la_forge'})
    ON CREATE SET
        a.name = 'Geordi La Forge',
        a.title = 'Chief Engineer',
        a.description = 'Chief Engineer of the U.S.S. Enterprise-D, Geordi La Forge is known for his exceptional engineering skills and the VISOR he uses to see the electromagnetic spectrum.',
        a.traits = ["Inventive", "Perceptive", "Adaptive", "Engineering expert"],
        a.sphere_of_influence = 'Engineering and Technology'
    ;
MERGE (a:Agent {uuid: 'agent-reginald_barclay'})
    ON CREATE SET
        a.name = 'Reginald Barclay',
        a.title = 'Lieutenant',
        a.description = 'An officer on the U.S.S. Enterprise-D, Lieutenant Reginald Barclay is known for his technical acumen and occasional social difficulties. He recently succeeded in resolving the Zibalian trade negotiations.',
        a.traits = ["Brilliant", "Socially awkward", "Technical expert", "Resourceful"],
        a.sphere_of_influence = 'Engineering and Technical Operations'
    ;
MERGE (a:Agent {uuid: 'agent-miles_obrien'})
    ON CREATE SET
        a.name = 'Miles O\'Brien',
        a.title = 'Transporter Chief',
        a.description = 'Chief transporter officer on the U.S.S. Enterprise-D, Miles O\'Brien is highly skilled in transporter operations and known for his practical problem-solving abilities.',
        a.traits = ["Dependable", "Skilled", "Efficient", "Pragmatic"],
        a.sphere_of_influence = 'Transporter Operations'
    ;
MERGE (a:Agent {uuid: 'agent-ancient_hologram'})
    ON CREATE SET
        a.name = 'Ancient Hologram',
        a.title = 'Hologram',
        a.description = 'A holographic representation of a member of the প্রাচীন species, displaying elongated limbs and luminous eyes. It serves as a guardian and guide in the ancient structure, conveying the history and knowledge of its creators.',
        a.traits = ["Communicative", "Wise", "Enigmatic", "Guardian"],
        a.sphere_of_influence = 'Knowledge and Communication'
    ;
MERGE (a:Agent {uuid: 'agent-ensign_davies'})
    ON CREATE SET
        a.name = 'Ensign Davies',
        a.title = 'None',
        a.description = 'Ensign Davies is a member of the security detail aboard the U.S.S. Enterprise-D, participating in away missions and ensuring crew safety.',
        a.traits = ["Dependable", "Observant", "Security-detail"],
        a.sphere_of_influence = 'Security'
    ;
MERGE (a:Agent {uuid: 'agent-ensign_লল_lal'})
    ON CREATE SET
        a.name = 'Ensign লাল (Lal)',
        a.title = 'None',
        a.description = 'Ensign লাল (Lal) is part of the security detail onboard the U.S.S. Enterprise-D, involved in away missions and ensuring crew safety.',
        a.traits = ["Vigilant", "Security-detail", "Dedicated"],
        a.sphere_of_influence = 'Security'
    ;
MERGE (o:Object {uuid: 'object-padd'})
    ON CREATE SET
        o.name = 'PADD',
        o.description = 'A sleek, handheld Personal Access Display Device used to review data.',
        o.purpose = 'To allow Captain Picard to review sensor data and reports.',
        o.significance = 'Symbolizes Captain Picard\'s connection to Starfleet\'s extensive knowledge and emphasizes the role of technology in decision-making.'
    ;
MERGE (o:Object {uuid: 'object-holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A display system that creates three-dimensional images, utilized in the Observation Lounge of the USS Enterprise-D to project detailed scans and representations.',
        o.purpose = 'To visualize and analyze complex data, such as the scan of Melatrite III, for the crew\'s discussions and strategic planning.',
        o.significance = 'Enhances understanding by providing a visual representation of strategic and scientific data, facilitating discussion and decision-making among the crew.'
    ;
MERGE (o:Object {uuid: 'object-lounge_emitter_system'})
    ON CREATE SET
        o.name = 'Lounge Emitter System',
        o.description = 'An advanced system developed to support the operation of the holographic display, allowing for accurate and high-resolution projection in the observation lounge.',
        o.purpose = 'To generate holograms such as the detailed scan of Melatrite III, aiding the crew in visualizing and analyzing complex data.',
        o.significance = 'Provides technological enhancement to facilitate the crew\'s analysis and discussions, highlighting the integration of advanced technology in starship operations.'
    ;
MERGE (o:Object {uuid: 'object-transporter_console'})
    ON CREATE SET
        o.name = 'Transporter Console',
        o.description = 'A state-of-the-art interface used to control the transporter systems, allowing for precise manipulation of matter during transport.',
        o.purpose = 'To manipulate the transporter systems, enabling safe and efficient transportation of personnel and equipment to and from the ship.',
        o.significance = 'The console is critical for the operation of transporter systems, ensuring the safe and efficient transport of personnel, vital to away missions.'
    ;
MERGE (o:Object {uuid: 'object-transporter_platform'})
    ON CREATE SET
        o.name = 'Transporter Platform',
        o.description = 'A specially designed surface where crew members stand when being transported to and from locations using the transporter technology.',
        o.purpose = 'To facilitate the dematerialization and rematerialization process during transportation of crew members.',
        o.significance = 'The transporter platform is essential for initiating safe and precise transportation from one location to another, integral to away missions like the one to the subterranean structure.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_structure'})
    ON CREATE SET
        o.name = 'Crystalline Structure',
        o.description = 'A massive crystalline structure located at the center of the subterranean chamber, pulsating with a soft, blue light and resonating with the planet\'s natural subspace field.',
        o.purpose = 'To resonate with the planet\'s natural subspace field and create the energy patterns detected by the U.S.S. Enterprise.',
        o.significance = 'The source of the mysterious energy readings, pivotal to the away team\'s exploration and understanding of the প্রাচীন civilization\'s legacy.'
    ;
MERGE (o:Object {uuid: 'object-obsidian_material'})
    ON CREATE SET
        o.name = 'Obsidian-like Material',
        o.description = 'Smooth material composing the chamber walls, which seems to absorb light, adorned with intricate carvings.',
        o.purpose = 'To serve as the architectural basis of the subterranean structure, possibly designed to maintain secrecy or isolate energy emissions.',
        o.significance = 'Reflects the advanced engineering and aesthetic values of the প্রাচীন civilization, contributing to the ominous and mysterious atmosphere.'
    ;
MERGE (o:Object {uuid: 'object-intricate_carvings'})
    ON CREATE SET
        o.name = 'Intricate Carvings',
        o.description = 'Carvings depicting celestial events and abstract geometric patterns that adorn the walls of the chamber, which glow with luminescence upon energy activation.',
        o.purpose = 'To convey historical information or cultural significance through visual storytelling, possibly containing encoded messages.',
        o.significance = 'Offer insights into the artistic and perhaps scientific accomplishments of the প্রাচীন civilization, enhancing narrative depth.'
    ;
MERGE (o:Object {uuid: 'object-subspace_amplifier'})
    ON CREATE SET
        o.name = 'Subspace Amplifier',
        o.description = 'A component or function of the crystalline structure enabling it to amplify subspace signals using the planet\'s natural field.',
        o.purpose = 'To amplify and transmit signals across vast distances, potentially as a means of communication or as a beacon.',
        o.significance = 'Indicates advanced technological capabilities of the প্রাচীন, highlighting their understanding and manipulation of subspace phenomena.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    ON CREATE SET
        o.name = 'Crystalline Data Storage Devices',
        o.description = 'Rows of crystalline devices in the archive, each containing a vast amount of preserved information from the প্রাচীন civilization, surpassing the entire Federation historical database.',
        o.purpose = 'To preserve the knowledge and legacy of the প্রাচীন civilization for future exploration and understanding by other civilizations.',
        o.significance = 'The devices hold more data than the entire Federation historical database, representing a vast repository of knowledge that could revolutionize the understanding of the universe.'
    ;
MERGE (o:Object {uuid: 'object-long_range_sensor_array'})
    ON CREATE SET
        o.name = 'Long Range Sensor Array',
        o.description = 'A sophisticated set of sensors designed to detect and analyze phenomena in distant regions of space.',
        o.purpose = 'To detect unusual energy readings and spatial phenomena.',
        o.significance = 'Key to discovering the unusual subspace phenomena emanating from Melatrite III, advancing the narrative by directing the crew\'s investigation.'
    ;
MERGE (o:Object {uuid: 'object-viewscreen'})
    ON CREATE SET
        o.name = 'Viewsceen',
        o.description = 'A large display on the USS Enterprise-D\'s bridge that shows the outside space scenery.',
        o.purpose = 'To present the starfield and any visual phenomena outside the ship to the bridge crew.',
        o.significance = 'Allows visual interaction with space, emphasizing the beauty and mystery of the Melatrite Nebula.'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d-main_bridge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Main Bridge',
        l.description = 'The bridge of the USS Enterprise-D, NCC-1701-D, operating under normal parameters. This is the central command center of the Galaxy-class starship. Captain Jean-Luc Picard sits in the command chair, with Lieutenant Commander Data at the operations station, Lieutenant Worf at the tactical station, and Ensign Janina Taur at the helm. The main viewscreen displays a starfield, specifically the Melatrite Nebula.',
        l.type = 'Spaceship Command Center'
    ;
MERGE (l:Location {uuid: 'location-space-melatrite_nebula'})
    ON CREATE SET
        l.name = 'Melatrite Nebula',
        l.description = 'A designated region of space characterized by its unusual subspace phenomena and visually depicted as a starfield on the main viewscreen of the USS Enterprise-D. Known to have high concentrations of tetryon particles and intermittent distortions in the gravimetric field.',
        l.type = 'Region of Space'
    ;
MERGE (l:Location {uuid: 'location-planet-melatrite_iii'})
    ON CREATE SET
        l.name = 'Planet Melatrite III',
        l.description = 'A Class-M planet located in the region of space designated as the Melatrite Nebula. Detected to have unusual energy readings consistent with a type-4 subspace inversion, indicating elements not found in any known natural phenomenon.',
        l.type = 'Planet'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d-observation_lounge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Observation Lounge',
        l.description = 'The observation lounge offers a panoramic view of the Melatrite Nebula, its swirling gases painted across space in vibrant hues. The lounge is equipped with a holographic display system, upgraded during the last refit at Starbase 74 in 2369, showing detailed scans of celestial bodies. It serves as a space for reflection and strategic discussions among the USS Enterprise-D\'s senior staff.',
        l.type = 'Starship Room'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d-transporter_room_3'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Transporter Room 3',
        l.description = 'This is a dynamic and technologically advanced room equipped for the dematerialization and rematerialization of personnel and objects for transport. It features a transporter platform and a main console operated by Transporter Chief Miles O\'Brien, designed to handle complex transport logistics and missions. The room is abuzz with activity as crew members prepare for an away mission to investigate unusual energy readings from a planet\'s surface.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location-melatrite_iii-subterranean_structure-central_chamber'})
    ON CREATE SET
        l.name = 'Melatrite III - Subterranean Structure - Central Chamber',
        l.description = 'A vast, circular chamber located within a subterranean structure on Melatrite III. The walls are made of a smooth, obsidian-like material that absorbs light and are adorned with intricate carvings depicting celestial events and abstract geometric patterns. In the center of the chamber is a massive crystalline structure pulsating with a soft, blue light, which is the source of the mysterious energy readings that drew the away team. The air is filled with a strange, almost musical hum, and the environment is activated by their presence, resulting in glowing carvings and a shimmering atmosphere.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location-melatrite_iii-subterranean_structure-archive'})
    ON CREATE SET
        l.name = 'Melatrite III - Subterranean Structure - Archive',
        l.description = 'A vast archive located within a subterranean structure on the planet Melatrite III. The archive contains rows upon rows of crystalline data storage devices, each housing more information than the entire Federation historical database. It was built by the প্রাচীন civilization to preserve their knowledge and communicate with other civilizations after their physical form ceased to exist.',
        l.type = 'Archive'
    ;
MERGE (l:Location {uuid: 'location-melatrite_iii'})
    ON CREATE SET
        l.name = 'Melatrite III',
        l.description = 'A Class-M planet within the Melatrite Nebula emitting unusual energy readings, including elements not found in any known natural phenomenon. It is the destination for the USS Enterprise-D to investigate.',
        l.type = 'Planet'
    ;
MERGE (o:Organization {uuid: 'org-us_s_star_fleet'})
    ON CREATE SET
        o.name = 'U.S. Starfleet',
        o.description = 'A space-based service maintained by the United Federation of Planets for exploration, defense, diplomacy, and peace-keeping.',
        o.sphere_of_influence = 'Galaxy - Primarily United Federation of Planets and surrounding territories'
    ;
MERGE (o:Organization {uuid: 'org-uss_enterprise_d'})
    ON CREATE SET
        o.name = 'U.S.S. Enterprise-D',
        o.description = 'A Galaxy-class starship, the fourth of her name, serving as the flagship of the United Federation of Planets\' Starfleet. It is dedicated to exploration, peacekeeping, and scientific research.',
        o.sphere_of_influence = 'Interstellar Exploration and Diplomacy'
    ;
MERGE (o:Organization {uuid: 'org-starfleet'})
    ON CREATE SET
        o.name = 'Starfleet',
        o.description = 'Starfleet is the deep-space exploratory and defense service maintained by the United Federation of Planets. It is dedicated to the peaceful exploration of space, scientific advancement, and the protection of Federation assets across the galaxy.',
        o.sphere_of_influence = 'Galaxy-wide Scientific Exploration and Defense'
    ;
MERGE (o:Organization {uuid: 'org-ancient_civilization'})
    ON CREATE SET
        o.name = 'প্রাচীন (Ancient) Civilization',
        o.description = 'The প্রাচীন were an ancient species that vanished over a million years ago. They left behind advanced technologies and an archive of their knowledge, aiming to preserve their legacy and communicate with other civilizations. Their influence persists through their remnants, such as the subspace amplifiers and holographic guides.',
        o.sphere_of_influence = 'Extinct Civilization - Cosmic Influence'
    ;
MERGE (o:Organization {uuid: 'org-প্রাচীন'})
    ON CREATE SET
        o.name = 'প্রাচীন (Ancient)',
        o.description = 'The প্রাচীন, also referred to as Ancients, are a long-extinct civilization known for their advanced technology and wisdom. They have left behind various artifacts and facilities, such as the subspace amplifier and knowledge archives, hoping to communicate with and guide future civilizations.',
        o.sphere_of_influence = 'Knowledge preservation and communication'
    ;
MERGE (o:Organization {uuid: 'org-pracheen'})
    ON CREATE SET
        o.name = 'প্রাচীন (Pracheen)',
        o.description = 'The প্রাচীন is an ancient civilization that transcended to a higher plane of existence, leaving behind their knowledge in an archive for other civilizations to discover.',
        o.sphere_of_influence = 'Knowledge and Communication'
    ;
MERGE (s:Scene {uuid: 'scene-001'})
    ON CREATE SET
        s.title = 'Initial Investigation of the Melatrite Nebula',
        s.description = 'The scene is set on the main bridge of the USS Enterprise-D, operating under normal parameters. It is a serene and organized environment with a focus on duty. Captain Jean-Luc Picard is seated in the command chair, and Commander William T. Riker stands nearby. Lieutenant Commander Data is conducting operations at his station, while Lieutenant Worf oversees the tactical station. Ensign Janina Taur steers the helm. They are reviewing data related to unusual phenomena in a region of space called the Melatrite Nebula. Commander Riker reports on sensor readings showing unusual subspace anomalies, and Data detects energy patterns emanating from Melatrite III. Picard commands Ensign Taur to set a course towards the planet at warp factor six, as they prepare to investigate further.',
        s.scene_number = 1
    WITH s
    MATCH (l:Location {uuid: 'location-uss_enterprise_bridge'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Picard Inquires About Sensor Readings from Melatrite Nebula',
        e.description = 'Captain Jean-Luc Picard, while seated in the command chair, asks Commander William T. Riker about the recent sensor readings from the Melatrite Nebula. Starfleet Command has identified possible unusual subspace phenomena in the area, sparking interest and investigation.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Commander Riker, have you had a chance to review the latest sensor readings from the Melatrite Nebula? Starfleet Command believes there may be unusual subspace phenomena occurring in that region."]
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Riker Discusses Subspace Anomalies with Picard',
        e.description = 'Commander William T. Riker reports to Captain Picard that preliminary scans have identified high concentrations of tetryon particles alongside intermittent gravimetric field distortions in the Melatrite Nebula. These anomalies are reminiscent of those experienced near the Maranga system during the Zakdorn crisis of \'69.',
        e.sequence = 2,
        e.key_dialogue = ["RIKER: Yes, Captain. Preliminary scans show high concentrations of tetryon particles and intermittent distortions in the gravimetric field. It's reminiscent of the subspace anomalies we encountered near the Maranga system during the Zakdorn crisis of '69."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'Data Reports Unusual Energy Readings from Melatrite III',
        e.description = 'Lieutenant Commander Data reports that he has completed a level-three diagnostic of the long-range sensor array and detected unusual energy readings from Melatrite III, consistent with a type-4 subspace inversion, yet containing elements that are not present in any known natural phenomenon.',
        e.sequence = 3,
        e.key_dialogue = ["DATA: Captain, I have completed a level-three diagnostic of the long-range sensor array. I am detecting unusual energy readings emanating from a Class-M planet designated as Melatrite III. The readings are consistent with a type-4 subspace inversion, but also contain elements not found in any known natural phenomenon."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'Picard Orders Course to Melatrite III',
        e.description = 'Following the intriguing report from Data, Captain Picard orders Ensign Taur to plot a course to Melatrite III, setting the warp drive to factor six to investigate further.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Intriguing. Ensign Taur, lay in a course for Melatrite III, warp factor six. Let's take a closer look.", "TAUR: Aye, Captain. Course laid in. Engaging warp drive."]
    ;
MERGE (s:Scene {uuid: 'scene-002'})
    ON CREATE SET
        s.title = 'Echoes of the Ancients',
        s.description = 'The observation lounge of the USS Enterprise-D provides a breathtaking view of the Melatrite Nebula, with its vivid gases. Captain Picard, Commander Riker, and Counselor Deanna Troi convene at a conference table. A holographic display projects a detailed image of Melatrite III. Picard seeks Troi\'s insights on complex energy readings from the planet, suggesting possible sentient involvement. Troi senses emotions of fear, longing, and hope, hinting at an attempt at communication. The conversation touches on the প্রাচীন (Ancient) civilization, an advanced species that vanished a million years ago.',
        s.scene_number = 2
    WITH s
    MATCH (l:Location {uuid: 'location-uss_enterprise_d-observation_lounge'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Captain Picard Consults Counselor Troi on Energy Readings',
        e.description = 'Captain Picard, Commander Riker, and Counselor Deanna Troi convene in the observation lounge of the USS Enterprise-D to discuss the unusual energy readings from Melatrite III. Picard inquires about Troi\'s impressions of the readings, probing for any signs of sentient involvement.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Counselor, what are your impressions of these energy readings? Do they suggest any sentient involvement?"]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Counselor Troi Senses Emotions in the Energy Patterns',
        e.description = 'Counselor Troi shares her insights on the energy patterns detected from Melatrite III, revealing a mixture of emotions such as fear, longing, and hope. She perceives these as attempts at communication from an unknown source.',
        e.sequence = 2,
        e.key_dialogue = ["TROI: The patterns are complex, Captain. I sense a mixture of emotions \u2013 fear, longing, but also a profound sense of hope. It's as if someone, or something, is reaching out across space, trying to communicate."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'Commander Riker Speculates on the Nature of the Signal',
        e.description = 'Commander Riker suggests that the energy patterns might be a distress signal from a civilization undergoing a crisis, prompting further speculation about the origins of the phenomena.',
        e.sequence = 3,
        e.key_dialogue = ["RIKER: Could it be a distress signal? Perhaps a civilization facing some kind of cataclysm?"]
    ;
MERGE (e:Event {uuid: 'event-2-4'})
    ON CREATE SET
        e.title = 'Picard Reflects on the প্রাচীন Civilization',
        e.description = 'Captain Picard reflects on the history of the প্রাচীন civilization, which once inhabited the Melatrite Nebula. He contemplates the possibility that these energy readings could be linked to this ancient and technologically advanced species.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Possibly. Or it could be something else entirely. The Melatrite Nebula was once home to the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 (Ancient) civilization, a species that vanished over a million years ago, leaving behind only fragmented records and their signature on the cosmic background radiation. Their technology was said to be far beyond our understanding."]
    ;
MERGE (e:Event {uuid: 'event-2-5'})
    ON CREATE SET
        e.title = 'Troi Detects a Faint Psychic Resonance',
        e.description = 'Troi mentions detecting a faint psychic resonance that seems familiar to her, likening it to an echo from the past. This further complicates the mystery of the energy patterns from Melatrite III.',
        e.sequence = 5,
        e.key_dialogue = ["TROI: Captain, I'm also detecting a faint psychic resonance. It feels... familiar, somehow. Like an echo from the past."]
    ;
MERGE (s:Scene {uuid: 'scene-003'})
    ON CREATE SET
        s.title = 'Prepping the Away Mission to Melatrite III',
        s.description = 'The scene unfolds in Transporter Room 3 of the USS Enterprise-D, where final preparations for an away mission to Melatrite III are underway. Chief Engineer Geordi La Forge supervises alongside Lieutenant Reginald Barclay, who recently succeeded in resolving the Zibalian trade negotiations. They coordinate with Transporter Chief Miles O\'Brien, whose adept skill at the transporter console ensures optimal systems functioning. Joining the away team are Data, Worf, and two security officers, Ensigns Davies and লাল. Discussion revolves around the unknown structure on the planet\'s surface, potentially linked to the extinct প্রাচীন civilization. Caution is emphasized by Picard in anticipation of the civilization\'s rumored defense technologies, but the primary goal remains investigation. With the transporter operational, O’Brien initiates the beam-down process.',
        s.scene_number = 3
    WITH s
    MATCH (l:Location {uuid: 'location-uss_enterprise_d-transporter_room_3'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Transporter Systems Preparations for Away Mission',
        e.description = 'Chief Engineer Geordi La Forge, assisted by Lieutenant Reginald Barclay, oversees the final preparations of the transporter systems for an away mission. They lock onto the strongest energy source originating from a subterranean structure on the planet\'s surface. Transporter Chief Miles O\'Brien stands ready at the main console.',
        e.sequence = 1,
        e.key_dialogue = ["LA FORGE: Transporter systems are operating at optimal efficiency. We've locked onto the strongest energy source on the planet's surface. It appears to be originating from a subterranean structure."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'Data Provides Analysis on the Structure',
        e.description = 'Data provides analysis on the mysterious structure, explaining that its composition is unknown and it predates the extinction of the প্রাচীন by at least five hundred thousand years. He mentions its energy signature aligns with the subspace readings detected earlier.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: The structure's composition is unknown, Chief. However, preliminary scans indicate that it predates the extinction of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 by at least five hundred thousand years. Its energy signature is consistent with the subspace readings we detected earlier."]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'Worf Suggests Preparing for Resistance',
        e.description = 'Worf expresses concern about potential resistance due to the প্রাচীন\'s known defensive technologies, advocating for preparedness in the upcoming mission.',
        e.sequence = 3,
        e.key_dialogue = ["WORF: We should prepare for possible resistance. The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were known to have powerful defensive technologies."]
    ;
MERGE (e:Event {uuid: 'event-3-4'})
    ON CREATE SET
        e.title = 'Picard Orders Caution in the Mission',
        e.description = 'Picard agrees with Worf\'s assessment but emphasizes the need for caution, stating that the investigation is their primary objective, not engaging in hostilities.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Agreed, Lieutenant. But let's proceed with caution. Our primary objective is to investigate, not to engage in hostilities."]
    ;
MERGE (e:Event {uuid: 'event-3-5'})
    ON CREATE SET
        e.title = 'Transporter Energizes the Away Team',
        e.description = 'Transporter Chief Miles O\'Brien initiates the transport process, energizing the away team for their mission onto the planet\'s surface.',
        e.sequence = 5,
        e.key_dialogue = ["O'BRIEN: Energizing."]
    ;
MERGE (s:Scene {uuid: 'scene-004'})
    ON CREATE SET
        s.title = 'Encounter with the Past - Subspace Resonance',
        s.description = 'The away team materializes within a vast, circular chamber on Melatrite III. The environment is dominated by a smooth, obsidian-like material that absorbs light, creating an ambiance of mystery and awe. The chamber\'s walls are intricately carved with celestial events and abstract patterns. At its center, a massive crystalline structure pulsates with a soft, blue light, serving as the origin of mysterious energy readings. As Data begins his analysis of this subspace amplifier, expressing fascination, Worf expresses unease, suspecting a potential trap. Picard advises caution, emphasizing open-minded investigation. Tension builds as the carvings begin to glow and the air hums with intensifying energy. An Ancient Hologram appears, introducing itself and revealing the awaited arrival of the crew.',
        s.scene_number = 4
    WITH s
    MATCH (l:Location {uuid: 'location-melatrite_iii-subterranean_structure-central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'The Away Team Materializes in the Chamber',
        e.description = 'The away team materializes inside a vast, circular chamber made of obsidian-like material, which absorbs light. The chamber features intricate carvings of celestial events and abstract geometric patterns. The air is filled with a strange, almost musical hum, and a massive crystalline structure pulses with a blue light at the center.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Data Scans the Crystalline Structure',
        e.description = 'Data begins scanning the crystalline structure using his tricorder. He determines that it is a subspace amplifier resonating with the planet\'s natural subspace field, creating the energy patterns they detected.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: Fascinating. The crystalline structure appears to be a form of subspace amplifier. It is resonating with the planet's natural subspace field, creating the energy patterns we detected."]
    ;
MERGE (e:Event {uuid: 'event-4-3'})
    ON CREATE SET
        e.title = 'Worf Expresses Distrust and Picard Responds',
        e.description = 'Worf expresses his discomfort, suggesting it feels like a trap, while Picard suggests caution, leaving room for the possibility of an alternative understanding.',
        e.sequence = 3,
        e.key_dialogue = ["WORF: I do not like this, Captain. It feels like a trap.", "PICARD: Perhaps, Lieutenant. Or perhaps it's something else entirely. Let's proceed cautiously."]
    ;
MERGE (e:Event {uuid: 'event-4-4'})
    ON CREATE SET
        e.title = 'The Ancient Hologram Appears',
        e.description = 'As they approach the crystalline structure, the energy intensifies, and a holographic projection of a humanoid figure with elongated limbs and large, luminous eyes appears. It identifies itself as a member of the প্রাচীন species and states that the প্রাচীন have awaited the team\'s arrival.',
        e.sequence = 4,
        e.key_dialogue = ["ANCIENT HOLOGRAM: Greetings. We are the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8. We have awaited your arrival."]
    ;
MERGE (s:Scene {uuid: 'scene-005'})
    ON CREATE SET
        s.title = 'Unveiling the Timeless Archive',
        s.description = 'The scene unfolds in a vast, subterranean archive on the planet Melatrite III, a place shrouded in the dust of forgotten ages. The away team, accompanied by an Ancient Hologram, navigates a labyrinth of corridors to arrive at this monumental repository of knowledge. Crystalline data storage devices line the walls, offering insights beyond anything the Federation has ever known. Data, with palpable excitement, remarks on the remarkable scope of the archive. Captain Picard acknowledges its potential to transform their understanding of the universe but stresses the importance of deciphering the message left by the প্রাচীন. The Ancient Hologram reveals that its creators had transcended to a higher existence, leaving behind their memories and consciousness within the archive for others to uncover.',
        s.scene_number = 5
    WITH s
    MATCH (l:Location {uuid: 'location-melatrite_iii-subterranean_structure-archive'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Discovery of the Vast Archive',
        e.description = 'The Ancient Hologram guides the away team through a series of corridors into a vast archive filled with crystalline data storage devices. Data expresses excitement at the potential knowledge contained within, noting its surpassing the entire Federation historical database in volume.',
        e.sequence = 1,
        e.key_dialogue = ["DATA: This archive is remarkable, Captain. It contains more data than the entire Federation historical database. It would take centuries to analyze it all."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Picard Recognizes the Potential of the Facility',
        e.description = 'Captain Picard acknowledges the significance of the archive, noting its potential to revolutionize understanding of the universe. He emphasizes the need to comprehend the nature of the facility and the message the প্রাচীন intended to convey.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Indeed, Commander. This could revolutionize our understanding of the universe. But first, we need to understand the nature of this facility and the message the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 are trying to send."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'Ancient Hologram Explains the Purpose of the Facility',
        e.description = 'The Ancient Hologram elaborates on the rationale behind constructing the facility, which was to preserve knowledge and reach out to future civilizations. It reveals that while the প্রাচীন ascended to a higher plane, they left a part of their consciousness within the archive.',
        e.sequence = 3,
        e.key_dialogue = ["ANCIENT HOLOGRAM: We built this facility to preserve our knowledge and to reach out to other civilizations. We knew that our time was coming to an end, but we hoped that our legacy would endure.", "WORF: What happened to your people?", "ANCIENT HOLOGRAM: We ascended to a higher plane of existence, leaving behind our physical forms. But we left a part of ourselves within this archive, a memory, an echo, waiting for someone to listen."]
    ;
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-data'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (o:Organization {uuid: 'org-pracheen'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ensign_davies'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ensign_লল_lal'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-padd'}),
          (a:Agent {uuid: 'agent-jeanluc_picard'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-transporter_console'}),
          (a:Agent {uuid: 'agent-miles_obrien'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-transporter_platform'}),
          (a:Agent {uuid: 'agent-miles_obrien'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (o:Organization {uuid: 'org-us_s_star_fleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (o:Organization {uuid: 'org-us_s_star_fleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-data'}),
          (o:Organization {uuid: 'org-us_s_star_fleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (o:Organization {uuid: 'org-us_s_star_fleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (o:Organization {uuid: 'org-us_s_star_fleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-data'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ensign_লল_lal'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ensign_davies'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-data'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (o:Organization {uuid: 'org-starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (o:Organization {uuid: 'org-প্রাচীন'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (o:Organization {uuid: 'org-pracheen'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-padd-event-1-1'})
    ON CREATE SET
        oi.description = 'Captain Picard uses the PADD to review data from the recent sensor readings related to the Melatrite Nebula. The PADD contains crucial information about potential unusual subspace phenomena that has caught Starfleet\'s interest.',
        oi.status_before = 'The PADD is in Captain Picard\'s possession, containing updated data about the Melatrite Nebula.',
        oi.status_after = 'The PADD continues to hold the data about the Melatrite Nebula as Picard uses it to inform his queries to Riker.'
    WITH oi
    MATCH (o:Object {uuid: 'object-padd'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Seated in the command chair, initiating a discussion about sensor readings.',
        ap.emotional_state = 'Curious and focused, with a hint of concern for the unusual phenomena.',
        ap.emotional_tags = ["Curious", "focused, with a hint of concern for the unusual phenomena."],
        ap.active_plans = ["Gather information from Riker", "Evaluate potential threats or opportunities related to the nebula"],
        ap.beliefs = ["Trusts in the competence and insights of his crew", "Approaches situations with logic and rationality"],
        ap.goals = ["Ensure safety of the Enterprise", "Investigate and understand the subspace phenomena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Standing near the command chair, engaged in dialogue with Picard.',
        ap.emotional_state = 'Calm and confident, interested in the scientific curiosity presented by the nebula.',
        ap.emotional_tags = ["Calm", "confident, interested in the scientific curiosity presented by the nebula."],
        ap.active_plans = ["Review and summarize sensor data for Picard", "Assist Picard in determining the next steps"],
        ap.beliefs = ["Confidence in his ability to handle complex situations", "Values thorough analysis and teamwork"],
        ap.goals = ["Support Picard's command decisions", "Contribute to the successful execution of the mission"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Reporting findings on subspace anomalies to Picard.',
        ap.emotional_state = 'Optimistic and thoughtful, with a touch of nostalgia for past missions.',
        ap.emotional_tags = ["Optimistic", "thoughtful, with a touch of nostalgia for past missions."],
        ap.active_plans = ["Identify connections between current phenomena and past experiences", "Provide actionable insights to Picard"],
        ap.beliefs = ["Learning from past experiences improves current mission success", "Thorough investigations are crucial"],
        ap.goals = ["Ensure readiness for any potential challenges", "Advance exploration of unexplored phenomena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Listening to Riker\'s report on subspace anomalies.',
        ap.emotional_state = 'Contemplative and attentive, open to Riker\'s analysis of the situation.',
        ap.emotional_tags = ["Contemplative", "attentive, open to Riker's analysis of the situation."],
        ap.active_plans = ["Consider Riker's insights for strategic decisions", "Evaluate implications of the subspace phenomena"],
        ap.beliefs = ["Trusts in Riker's experience and judgment", "The crew's experiences enhance understanding and problem-solving"],
        ap.goals = ["Make informed decisions about the nebula", "Maintain safety and operational efficacy of the Enterprise"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Receiving Data\'s report on energy readings from Melatrite III.',
        ap.emotional_state = 'Intrigued and contemplative, considering the implications of Data\'s report.',
        ap.emotional_tags = ["Intrigued", "contemplative, considering the implications of Data's report."],
        ap.active_plans = ["Evaluate the significance of Data's findings", "Formulate plans based on new information"],
        ap.beliefs = ["Data's analytical abilities provide crucial insights", "Scientific anomalies often indicate new opportunities"],
        ap.goals = ["Determine the cause of unusual phenomena", "Ensure crew preparedness for investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Providing a technical report on Melatrite III energy readings.',
        ap.emotional_state = 'Methodical and analytical, focused on delivering precise information.',
        ap.emotional_tags = ["Methodical", "analytical, focused on delivering precise information."],
        ap.active_plans = ["Conduct thorough diagnostic analyses", "Offer detailed findings to assist command decisions"],
        ap.beliefs = ["Scientific exploration is a fundamental mission of Starfleet", "Advanced diagnostics aid in mission success"],
        ap.goals = ["Gather accurate data on Melatrite III", "Support decision-making with comprehensive analysis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Instructing Ensign Taur to set a course for Melatrite III.',
        ap.emotional_state = 'Determined and decisive, eager to advance the investigation.',
        ap.emotional_tags = ["Determined", "decisive, eager to advance the investigation."],
        ap.active_plans = ["Proceed to Melatrite III to investigate anomalies", "Prepare crew for potential new discoveries"],
        ap.beliefs = ["Exploration is the core mission of the Enterprise", "Leadership requires swift and informed actions"],
        ap.goals = ["Investigate Melatrite III", "Uncover the source and implications of energy readings"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-janina_taur-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Executing Picard\'s order to lay in a course for Melatrite III.',
        ap.emotional_state = 'Confident and focused, demonstrating professional competence.',
        ap.emotional_tags = ["Confident", "focused, demonstrating professional competence."],
        ap.active_plans = ["Verify and execute the course plotting with precision", "Maintain optimal ship navigation"],
        ap.beliefs = ["Starfleet training prepares for real-world challenges", "Following orders ensures mission success"],
        ap.goals = ["Safely navigate the Enterprise to Melatrite III", "Demonstrate capability and reliability in helm operations"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-1'})
    ON CREATE SET
        oi.description = 'The holographic display, part of the observation lounge\'s advanced emitter system, was used to present detailed scans of Melatrite III to Captain Picard, Commander Riker, and Counselor Troi. It served as a visual aid to support their discussion about the energy readings.',
        oi.status_before = 'The holographic display was in standby mode, ready to project any required visual data.',
        oi.status_after = 'The holographic display dynamically presented images of Melatrite III, actively supporting the discussion of the energy readings.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lounge_emitter_system-event-2-1'})
    ON CREATE SET
        oi.description = 'The lounge\'s emitter system, upgraded for precision, facilitated the creation of the holographic display, showcasing scans of Melatrite III to aid in the assessment by Picard, Riker, and Troi.',
        oi.status_before = 'The emitter system was operational, finely calibrated from its recent upgrade at Starbase 74.',
        oi.status_after = 'The emitter system was actively projecting detailed holograms of the scans, vital to the strategic meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-2'})
    ON CREATE SET
        oi.description = 'The holographic display was integral in portraying the energy patterns from Melatrite III, assisting Troi in conveying the complex emotions she sensed within the readings.',
        oi.status_before = 'The holographic display was actively displaying relevant data on Melatrite III.',
        oi.status_after = 'Continued to show detailed energy patterns, enhancing Troi\'s explanation of the emotional complexities detected.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lounge_emitter_system-event-2-2'})
    ON CREATE SET
        oi.description = 'The lounge emitter system operated seamlessly, supporting the visual depiction of Melatrite III\'s energy data, which Troi used to explain the emotional undercurrents she perceived.',
        oi.status_before = 'The emitter system was functioning optimally to render holographic displays.',
        oi.status_after = 'Maintained high-quality emissions, facilitating the ongoing visualization of crucial energy data.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-3'})
    ON CREATE SET
        oi.description = 'The holographic display provided a visual context for Riker\'s hypothesis about a potential distress signal emanating from Melatrite III.',
        oi.status_before = 'Displayed dynamic representations of Melatrite III and associated energy data.',
        oi.status_after = 'Remained actively engaged, showcasing visual data to prompt further speculation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lounge_emitter_system-event-2-3'})
    ON CREATE SET
        oi.description = 'The emitter system continued to deliver precise holographic representations of energy phenomena, aiding in Riker\'s analysis of the possible distress signal.',
        oi.status_before = 'Operational, involved in producing visual content for analysis.',
        oi.status_after = 'Consistently emitted detailed holograms, supporting strategic discussions.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-4'})
    ON CREATE SET
        oi.description = 'During Picard\'s reflections on the প্রাচীন civilization, the holographic display continued to provide detailed imagery of Melatrite III and the surrounding space, illustrating the potential link to the ancient species.',
        oi.status_before = 'Actively projecting images related to the energy readings and historical context.',
        oi.status_after = 'Persisted in showing images, integral to enriching the narrative on the প্রাচীন civilization.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lounge_emitter_system-event-2-4'})
    ON CREATE SET
        oi.description = 'Supported the ongoing discussion by rendering holographic content that highlighted Picard\'s contemplation of the প্রাচীন civilization\'s potential connection to current readings.',
        oi.status_before = 'Capably rendering visuals for the meeting\'s focus on potential historical links.',
        oi.status_after = 'Continued to assist with high-quality projections, sustaining analytical exploration.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-holographic_display-event-2-5'})
    ON CREATE SET
        oi.description = 'The display was crucial in portraying the ongoing energy and psychic resonance patterns detected by Troi, augmenting her revelation of the familiarity within the signals.',
        oi.status_before = 'Displaying complex energy readings related to the recent insights.',
        oi.status_after = 'Continued active involvement in visualizing data integral to Troi’s empathic detection.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-lounge_emitter_system-event-2-5'})
    ON CREATE SET
        oi.description = 'Leveraged for displaying the nuanced energy patterns from Melatrite III, essential for Troi\'s identification of a faint psychic resonance.',
        oi.status_before = 'Employed in producing detailed imagery of energy resonances.',
        oi.status_after = 'Remained functional, providing ongoing visual support to facilitate key discussions.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Consulting Counselor Troi in the observation lounge.',
        ap.emotional_state = 'Focused and contemplative, with an underlying curiosity.',
        ap.emotional_tags = ["Focused", "contemplative, with an underlying curiosity."],
        ap.active_plans = ["Seek Counselor Troi's insights on the energy readings."],
        ap.beliefs = ["Energy readings may suggest something significant, potentially involving sentient beings.", "Counselor Troi's empathic abilities are invaluable for understanding complex situations."],
        ap.goals = ["Determine the nature of the unusual energy readings from Melatrite III.", "Assess if there is any potential threat or opportunity linked to the energy readings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Providing impressions on the energy readings.',
        ap.emotional_state = 'Empathetic and introspective, with a hint of intrigue.',
        ap.emotional_tags = ["Empathetic", "introspective, with a hint of intrigue."],
        ap.active_plans = ["Evaluate the emotional components of the energy readings.", "Connect with possible sentient involvement through empathic senses."],
        ap.beliefs = ["The energy patterns may contain emotional signatures or attempts at communication.", "Understanding emotional components can provide insights into the situation."],
        ap.goals = ["Discern any sentient emotion or consciousness in the energy readings.", "Aid the crew in making sense of the unusual phenomena on Melatrite III."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Participating in the consultation with Picard and Troi.',
        ap.emotional_state = 'Engaged and thoughtful, with a practical mindset.',
        ap.emotional_tags = ["Engaged", "thoughtful, with a practical mindset."],
        ap.active_plans = ["Review and discuss sensor readings with the team."],
        ap.beliefs = ["Unusual subspace phenomena might have broad implications, potentially linking to past experiences, such as the Zakdorn crisis."],
        ap.goals = ["Support Picard and Troi in interpreting the Melatrite III energy readings.", "Ensure the team's readiness to act on the collected data."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Sharing insights on the emotional patterns detected.',
        ap.emotional_state = 'Sensitive and contemplative, with a tinge of empathy.',
        ap.emotional_tags = ["Sensitive", "contemplative, with a tinge of empathy."],
        ap.active_plans = ["Communicate the detected emotional impressions to Picard and Riker."],
        ap.beliefs = ["There could be an emotional origin to the energy patterns.", "Feelings like longing and hope suggest attempts at communication."],
        ap.goals = ["Facilitate the understanding of the energy patterns' nature.", "Determine possible sentient involvement behind the readings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Listening to Counselor Troi\'s insights.',
        ap.emotional_state = 'Reflective and attentive, with an open mind.',
        ap.emotional_tags = ["Reflective", "attentive, with an open mind."],
        ap.active_plans = ["Consider the implications of Troi's emotional analysis."],
        ap.beliefs = ["Emotional insight provides a crucial dimension to technical data interpretation."],
        ap.goals = ["Develop an informed understanding of Melatrite III energy readings.", "Decide the appropriate course of action based on new insights."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Engaging with Troi\'s analysis of the energy patterns.',
        ap.emotional_state = 'Attentive and curious, with a strategic outlook.',
        ap.emotional_tags = ["Attentive", "curious, with a strategic outlook."],
        ap.active_plans = ["Examine Troi's assessment for operational considerations."],
        ap.beliefs = ["Understanding an emotional dimension is integral to comprehensively assessing the situation."],
        ap.goals = ["Support Picard in making an informed decision regarding the energy patterns."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Speculating on the nature of the energy signal.',
        ap.emotional_state = 'Reasoned and concerned, with a hint of apprehension.',
        ap.emotional_tags = ["Reasoned", "concerned, with a hint of apprehension."],
        ap.active_plans = ["Propose potential explanations for the detected energy patterns."],
        ap.beliefs = ["The unusual energy signals could indicate a civilization in distress."],
        ap.goals = ["Identify practical responses to the potential distress signal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Considering Riker\'s hypothesis.',
        ap.emotional_state = 'Analytical and poised, with an open mind.',
        ap.emotional_tags = ["Analytical", "poised, with an open mind."],
        ap.active_plans = ["Review and weigh potential scenarios presented by Riker."],
        ap.beliefs = ["Command needs to remain responsive to all potential revelations about the energy readings."],
        ap.goals = ["Determine how to proceed based on presented speculations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Listening to Riker\'s hypothesis.',
        ap.emotional_state = 'Considerate and perceptive, attuning to the subtext.',
        ap.emotional_tags = ["Considerate", "perceptive, attuning to the subtext."],
        ap.active_plans = ["Evaluate Riker's interpretation against her emotional insights."],
        ap.beliefs = ["Combining Riker's strategic insight with empathic impressions is vital for understanding."],
        ap.goals = ["Bridge the gap between technical and emotional data for a comprehensive understanding."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Reflecting on the প্রাচীন civilization\'s history.',
        ap.emotional_state = 'Cautiously optimistic and intrigued by historical significance.',
        ap.emotional_tags = ["Cautiously optimistic", "intrigued by historical significance."],
        ap.active_plans = ["Consider historical context to understand current phenomena."],
        ap.beliefs = ["Understanding the past provides insights into present-day mysteries."],
        ap.goals = ["Use knowledge of \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization to interpret vague energy readings."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Listening to Picard\'s reflection on the প্রাচীন civilization.',
        ap.emotional_state = 'Engaged and intrigued, with analytical interest.',
        ap.emotional_tags = ["Engaged", "intrigued, with analytical interest."],
        ap.active_plans = ["Evaluate historical context with an aim to operationalize insights."],
        ap.beliefs = ["The past civilizations' technology and history may be keys to understanding current puzzles."],
        ap.goals = ["Support the discernment of historical insights relevant to the mission."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Considering Picard’s insights regarding the প্রাচীন civilization.',
        ap.emotional_state = 'Thoughtfully introspective, immersing in historical analysis.',
        ap.emotional_tags = ["Thoughtfully introspective, immersing in historical analysis."],
        ap.active_plans = ["Integrate Picard\u2019s insights into her understanding of the energy patterns."],
        ap.beliefs = ["A historical perspective combined with emotional sensing can yield deeper comprehension."],
        ap.goals = ["Facilitate a nuanced understanding of the energy anomalies in historical context."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-5'})
    ON CREATE SET
        ap.current_status = 'Detecting a faint psychic resonance.',
        ap.emotional_state = 'Intrigued and sensitive, with a sense of familiarity and recognition.',
        ap.emotional_tags = ["Intrigued", "sensitive, with a sense of familiarity", "recognition."],
        ap.active_plans = ["Probe the psychic resonance for clues or connections."],
        ap.beliefs = ["Psychic resonance may suggest deeper links to past experiences or knowledge."],
        ap.goals = ["Understand psychic resonance and its implication on present energy patterns.", "Contribute emotional and psychic insights to mission's aims."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-5'})
    ON CREATE SET
        ap.current_status = 'Assessing Troi\'s detection of psychic resonance.',
        ap.emotional_state = 'Speculative and focused on synthesis of all insights.',
        ap.emotional_tags = ["Speculative", "focused on synthesis of all insights."],
        ap.active_plans = ["Incorporate Troi's detection into strategic analysis."],
        ap.beliefs = ["Psychic phenomena can offer valuable information unavailable through other means."],
        ap.goals = ["Formulate an action plan based on psychic and technical input."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-5'})
    ON CREATE SET
        ap.current_status = 'Observing Troi\'s assessment of the psychic resonance.',
        ap.emotional_state = 'Attentive and speculative, engaging with the mystery.',
        ap.emotional_tags = ["Attentive", "speculative, engaging with the mystery."],
        ap.active_plans = ["Consider operational implications of Troi\u2019s discovery."],
        ap.beliefs = ["Comprehensive evaluation should include all facets of data, technical and psychic."],
        ap.goals = ["Assist in fleshing out mission strategies based on gathered insights."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-transporter_console-event-3-1'})
    ON CREATE SET
        oi.description = 'The transporter console is utilized by Chief Miles O\'Brien to finalize preparations and lock onto the energy source on the planet\'s surface, ensuring accurate transportation for the away mission.',
        oi.status_before = 'The transporter console is in standby mode, ready for operation.',
        oi.status_after = 'The transporter console is actively engaged in locking onto the energy source, facilitating the transport operation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-transporter_console'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-long_range_sensor_array-event-3-2'})
    ON CREATE SET
        oi.description = 'The long-range sensor array provides crucial data that Data uses to analyze the composition and energy signature of the mysterious structure on the planet, confirming its ancient origin and linking it to prior subspace readings.',
        oi.status_before = 'The long-range sensor array is gathering data on the planetary structure.',
        oi.status_after = 'The long-range sensor array has completed data collection, providing vital information used in the analysis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long_range_sensor_array'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-transporter_platform-event-3-5'})
    ON CREATE SET
        oi.description = 'The transporter platform is the site where the away team, including Data, Worf, and other crew members, stand in preparation for being transported to the planet\'s surface.',
        oi.status_before = 'The transporter platform is unoccupied, waiting for the away team to step on.',
        oi.status_after = 'The transporter platform is vacated as the away team is dematerialized and transported to the planet.'
    WITH oi
    MATCH (o:Object {uuid: 'object-transporter_platform'})
    MATCH (e:Event {uuid: 'event-3-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Picard agrees with Worf\'s concerns but emphasizes the need for caution.',
        ap.emotional_state = 'Calm and rational, displaying a sense of responsibility and leadership.',
        ap.emotional_tags = ["Calm", "rational, displaying a sense of responsibility", "leadership."],
        ap.active_plans = ["Proceed with caution during the investigation."],
        ap.beliefs = ["The mission's primary objective is investigation, not engagement."],
        ap.goals = ["Ensure a safe investigation of the structure.", "Gather as much information as possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Riker supports the away team mission.',
        ap.emotional_state = 'Supportive and focused on the task.',
        ap.emotional_tags = ["Supportive", "focused on the task."],
        ap.active_plans = ["Monitor the mission from the Enterprise and ensure team safety."],
        ap.beliefs = ["Trust in the proficiency of the away team."],
        ap.goals = ["Assist Captain Picard in handing this mission.", "Ensure mission success without conflict."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Data provides a detailed analysis of the subspace structure.',
        ap.emotional_state = 'Analytical and curious.',
        ap.emotional_tags = ["Analytical", "curious."],
        ap.active_plans = ["Gather data about the energy signatures and structure."],
        ap.beliefs = ["Understanding the structure\u2019s origin is crucial for mission success."],
        ap.goals = ["Contribute precise information to aid in the investigation.", "Learn about the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-worf-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Expresses concern about potential resistance.',
        ap.emotional_state = 'Wary and vigilant, driven by duty.',
        ap.emotional_tags = ["Wary", "vigilant, driven by duty."],
        ap.active_plans = ["Prepare for potential threats during the mission."],
        ap.beliefs = ["Anticipating danger leads to preparedness."],
        ap.goals = ["Protect the away team from any potential threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-janina_taur-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Ready to assist in the mission at the helm.',
        ap.emotional_state = 'Confident and eager.',
        ap.emotional_tags = ["Confident", "eager."],
        ap.active_plans = ["Support the away team from the bridge."],
        ap.beliefs = ["Precision and timing are critical for a successful mission."],
        ap.goals = ["Ensure the U.S.S. Enterprise is ready for a quick response, if required."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-geordi_la_forge-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Oversees transporter system readiness.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Ensure transporter systems are operating at optimal efficiency."],
        ap.beliefs = ["Technological precision ensures mission success."],
        ap.goals = ["Support the away mission by guaranteeing optimal transporter function."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-reginald_barclay-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Assists in preparing transporter systems.',
        ap.emotional_state = 'Nervous yet determined.',
        ap.emotional_tags = ["Nervous yet determined."],
        ap.active_plans = ["Support Geordi in ensuring transporter readiness."],
        ap.beliefs = ["Attention to detail is key to overcoming challenges."],
        ap.goals = ["Aid in successful deployment of the away team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-miles_obrien-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Conducts the transport of the away team.',
        ap.emotional_state = 'Confident and precise.',
        ap.emotional_tags = ["Confident", "precise."],
        ap.active_plans = ["Ensure a successful transmission to the planet's surface."],
        ap.beliefs = ["Experience ensures reliable transporter operations."],
        ap.goals = ["Secure a safe transport of personnel to the location."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Interacts with the away team, explaining the purpose of the facility.',
        ap.emotional_state = 'Serene and informational.',
        ap.emotional_tags = ["Serene", "informational."],
        ap.active_plans = ["Communicate the history and purpose of the facility."],
        ap.beliefs = ["Preserving knowledge is crucial for continuity."],
        ap.goals = ["Guide intelligent species to understand our achievements and knowledge."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_structure-event-4-1'})
    ON CREATE SET
        oi.description = 'The crystalline structure, located at the center of the chamber, is the source of the mysterious energy readings observed by the away team. It emits a soft, pulsating blue light, contributing to the chamber\'s illumination.',
        oi.status_before = 'The crystalline structure is actively pulsing with a blue light, generating energy readings.',
        oi.status_after = 'The structure continues to pulse with blue light, now drawing the attention of the away team for further investigation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-obsidian_material-event-4-1'})
    ON CREATE SET
        oi.description = 'The chamber\'s walls, constructed of obsidian-like material, absorb light, creating an oppressive darkness that challenges the away team\'s visibility.',
        oi.status_before = 'The walls are dark, absorbing ambient light and physical illumination from the environment.',
        oi.status_after = 'The walls remain unchanged in composition but are scrutinized by the away team as they proceed within the chamber.'
    WITH oi
    MATCH (o:Object {uuid: 'object-obsidian_material'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-intricate_carvings-event-4-1'})
    ON CREATE SET
        oi.description = 'The carvings, which depict celestial and abstract patterns, appear on the chamber walls, adding a complex layer of cultural and historical significance to the site.',
        oi.status_before = 'Carvings are static, portraying etched designs without any illumination.',
        oi.status_after = 'The carvings retain their form but take on increased narrative significance following initial observations by the away team.'
    WITH oi
    MATCH (o:Object {uuid: 'object-intricate_carvings'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_structure-event-4-2'})
    ON CREATE SET
        oi.description = 'The crystalline structure is scanned by Data\'s tricorder and determined to be functioning as a subspace amplifier, resonating with the planet\'s natural subspace field and generating detectable energy patterns.',
        oi.status_before = 'The structure is emitting energy patterns and pulsating with light.',
        oi.status_after = 'Its function as a subspace amplifier is confirmed and understood, though it remains in operation as before.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_structure-event-4-4'})
    ON CREATE SET
        oi.description = 'As the away team approaches, the crystalline structure amplifies its energy output, causing the chamber\'s carvings to glow and a holographic projection to appear, indicating a significant interaction.',
        oi.status_before = 'The structure is actively pulsing and resonating with energy.',
        oi.status_after = 'Following interaction, the structure continues pulsing, having facilitated the appearance of the Ancient Hologram.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Leading the away team upon materialization in the chamber.',
        ap.emotional_state = 'Curious yet cautious about the unknown environment.',
        ap.emotional_tags = ["Curious yet cautious about the unknown environment."],
        ap.active_plans = ["Assess the environment.", "Ensure the safety of the team."],
        ap.beliefs = ["Cautious exploration leads to discovery.", "There is potential for learning from what the unknown holds."],
        ap.goals = ["Explore the source of the energy readings.", "Gather data for Starfleet Command."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Scans the environment using his tricorder.',
        ap.emotional_state = 'Inquisitive, focusing on understanding the chamber\'s features.',
        ap.emotional_tags = ["Inquisitive, focusing on underst", "ing the chamber's features."],
        ap.active_plans = ["Conduct scans with the tricorder.", "Collect preliminary data on the energy readings."],
        ap.beliefs = ["Rational analysis can uncover the structure's purpose."],
        ap.goals = ["Identify and analyze the source of the energy patterns.", "Expand knowledge of ancient civilizations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-worf-event-4-1'})
    ON CREATE SET
        ap.current_status = 'On high alert, monitoring for potential threats.',
        ap.emotional_state = 'Vigilant and slightly tense, suspecting potential danger.',
        ap.emotional_tags = ["Vigilant", "slightly tense, suspecting potential danger."],
        ap.active_plans = ["Monitor for threats to the team's safety.", "Ensure readiness to respond to danger."],
        ap.beliefs = ["The unknown often harbors threats."],
        ap.goals = ["Protect the team from potential dangers.", "Investigate without risking lives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Conducting a detailed scan of the crystalline structure.',
        ap.emotional_state = 'Intrigued by the complexity and elegance of the technology.',
        ap.emotional_tags = ["Intrigued by the complexity", "elegance of the technology."],
        ap.active_plans = ["Analyze the crystalline structure's functionality.", "Document all findings for further study."],
        ap.beliefs = ["Uncovering advanced technology expands current scientific understanding."],
        ap.goals = ["Determine the purpose of the subspace amplifier.", "Report findings to Captain Picard."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-worf-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Expressing distrust and concern to Captain Picard.',
        ap.emotional_state = 'Skeptical and cautious, wary of potential deception.',
        ap.emotional_tags = ["Skeptical", "cautious, wary of potential deception."],
        ap.active_plans = ["Communicate concerns about potential threats.", "Advocate for defensive preparedness."],
        ap.beliefs = ["Unfamiliar circumstances potentially harbor threats."],
        ap.goals = ["Ensure the team's defensive readiness.", "Prevent any potential traps."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Reassuring Worf while encouraging cautious exploration.',
        ap.emotional_state = 'Balanced pragmatism, open to both logical and alternative possibilities.',
        ap.emotional_tags = ["Balanced pragmatism, open to both logical", "alternative possibilities."],
        ap.active_plans = ["Explore cautiously while evaluating potential threats.", "Consider multiple interpretations of the events."],
        ap.beliefs = ["Cautious optimism and open-mindedness enable discovery."],
        ap.goals = ["Navigate the situation without bias.", "Encourage team's analytical thinking."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-4'})
    ON CREATE SET
        ap.current_status = 'Observing the appearance of the Ancient Hologram.',
        ap.emotional_state = 'Intellectual curiosity mixed with a sense of historical importance.',
        ap.emotional_tags = ["Intellectual curiosity mixed with a sense of historical importance."],
        ap.active_plans = ["Engage with the Ancient Hologram to gain insight.", "Maintain diplomacy while gathering information."],
        ap.beliefs = ["Interpreting the messages of the past can guide the present."],
        ap.goals = ["Understand the intent of the hologram.", "Preserve and learn from ancient knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-4-4'})
    ON CREATE SET
        ap.current_status = 'Analyzing the Ancient Hologram\'s projection and intent.',
        ap.emotional_state = 'Interested in unraveling the technical aspects and narratives.',
        ap.emotional_tags = ["Interested in unraveling the technical aspects", "narratives."],
        ap.active_plans = ["Carry out detailed scans of the projection.", "Cross-reference data with historical records."],
        ap.beliefs = ["Data-driven analysis can reveal the truth underlying the holographic narrative."],
        ap.goals = ["Document the technology used by the civilization.", "Establish the message's broader implications."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-worf-event-4-4'})
    ON CREATE SET
        ap.current_status = 'Remaining vigilant, skeptical of the projection’s intent.',
        ap.emotional_state = 'Cautious regarding potential deception by the projection.',
        ap.emotional_tags = ["Cautious regarding potential deception by the projection."],
        ap.active_plans = ["Evaluate potential security threats from the hologram.", "Be prepared to act if the situation escalates."],
        ap.beliefs = ["Projected appearances can mask hidden dangers."],
        ap.goals = ["Protect the team against unforeseen threats.", "Ensure the team's safe retreat if necessary."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-4-4'})
    ON CREATE SET
        ap.current_status = 'Introducing themselves to the away team as the প্রাচীন species.',
        ap.emotional_state = 'Composed, with an undercurrent of anticipation for fulfilling its purpose.',
        ap.emotional_tags = ["Composed, with an undercurrent of anticipation for fulfilling its purpose."],
        ap.active_plans = ["Deliver the intended message to the away team.", "Clarify the presence and history of the Ancient civilization."],
        ap.beliefs = ["Sharing knowledge with others will preserve the civilization's legacy."],
        ap.goals = ["Engage effectively with the newcomers.", "Convey the civilization\u2019s intended message."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_data_storage_devices-event-5-1'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices are identified by Data as a potentially vast repository of ancient knowledge, surpassing the entire Federation historical database in volume.',
        oi.status_before = 'Hidden within the vast archive, these devices were largely unknown and unexamined by Federation personnel.',
        oi.status_after = 'Recognized as a crucial source of potentially transformative information, prompting excitement and curiosity from the away team.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-obsidian_material-event-5-1'})
    ON CREATE SET
        oi.description = 'The obsidian-like material forms the walls of the archive, contributing to the ancient, mysterious atmosphere of the environment.',
        oi.status_before = 'Part of the structural composition of the subterranean chamber and unexplored.',
        oi.status_after = 'Acknowledged as part of the setting, enhancing the ambience of mystery surrounding the ancient facility.'
    WITH oi
    MATCH (o:Object {uuid: 'object-obsidian_material'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-intricate_carvings-event-5-1'})
    ON CREATE SET
        oi.description = 'The intricate carvings depict celestial events and geometric patterns, adding to the enigmatic and historical significance of the archive\'s environment.',
        oi.status_before = 'Existing as unexplored artistry adorning the archival chamber.',
        oi.status_after = 'Acknowledged and contributing to the setting\'s profound sense of antiquity and mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object-intricate_carvings'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_data_storage_devices-event-5-2'})
    ON CREATE SET
        oi.description = 'Picard acknowledges these devices as key to potentially revolutionizing the understanding of the universe, indicating their importance and value.',
        oi.status_before = 'Recognized as a source of valuable knowledge, following initial discovery by the away team.',
        oi.status_after = 'Emphasized as holding revolutionary potential for universal understanding.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-crystalline_data_storage_devices-event-5-3'})
    ON CREATE SET
        oi.description = 'The Ancient Hologram explains these devices as repositories of the প্রাচীন\'s legacy, crucial for preserving knowledge and extending their consciousness.',
        oi.status_before = 'Viewed as part of a significant archive with revolutionary knowledge by the away team.',
        oi.status_after = 'Further understood as the prachin\'s intentional legacy to communicate and preserve their consciousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event-5-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-data-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Analyzing and admiring the data archive.',
        ap.emotional_state = 'Excited and curious.',
        ap.emotional_tags = ["Excited", "curious."],
        ap.active_plans = ["Access and review the vast amount of information contained within the archive."],
        ap.beliefs = ["The archive is a remarkable opportunity to expand knowledge beyond the current Federation database."],
        ap.goals = ["Analyze the data for insights into ancient civilization's history and technology."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Observing the archive.',
        ap.emotional_state = 'Impressed and contemplative.',
        ap.emotional_tags = ["Impressed", "contemplative."],
        ap.active_plans = ["Assess the potential significance of the information within the archive."],
        ap.beliefs = ["Understanding the archive could lead to significant advancements in knowledge."],
        ap.goals = ["Determine the implications of the archive for the Federation's understanding of the universe."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Guiding the away team through the archive.',
        ap.emotional_state = 'Purposeful and informative.',
        ap.emotional_tags = ["Purposeful", "informative."],
        ap.active_plans = ["Facilitate the understanding of the archive\u2019s contents by the away team."],
        ap.beliefs = ["The archive is a legacy to preserve knowledge and reach out to future civilizations."],
        ap.goals = ["Ensure the archive's knowledge is accessed and utilized by other civilizations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Reflecting on the significance of the archive.',
        ap.emotional_state = 'Thoughtful and cautious.',
        ap.emotional_tags = ["Thoughtful", "cautious."],
        ap.active_plans = ["Understand the broader implications of the facility and the knowledge it contains."],
        ap.beliefs = ["The facility could revolutionize understanding of the universe."],
        ap.goals = ["Unravel the intentions and messages conveyed by the ancient civilization."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Explaining the purpose and history of the facility.',
        ap.emotional_state = 'Reverent and hopeful.',
        ap.emotional_tags = ["Reverent", "hopeful."],
        ap.active_plans = ["Communicate the historical and existential journey of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8."],
        ap.beliefs = ["The time and physical forms of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were finite, but their knowledge can endure."],
        ap.goals = ["Impart the legacy and message left by the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 to those who may understand and learn."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-worf-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Engaging in dialogue with the hologram.',
        ap.emotional_state = 'Respectful and intrigued.',
        ap.emotional_tags = ["Respectful", "intrigued."],
        ap.active_plans = ["Gain insights into the fate and transformation of the ancient civilization."],
        ap.beliefs = ["It is crucial to understand the events that led to the civilization's transformation."],
        ap.goals = ["Learn about the historical trajectory and fate of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization."]
    ;
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Location {uuid: 'location-uss_enterprise_bridge'})

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
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-1-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'participation-agent-janina_taur-event-1-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-janina_taur-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Location {uuid: 'location-uss_enterprise_d-observation_lounge'})

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
MATCH (a:Event {uuid: 'event-2-5'}),
          (b:Scene {uuid: 'scene-002'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-2-4'}),
          (b:Event {uuid: 'event-2-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-deanna_troi-event-2-5'}),
          (b:Event {uuid: 'event-2-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-2-5'}),
          (b:Event {uuid: 'event-2-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-2-5'}),
          (b:Event {uuid: 'event-2-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Location {uuid: 'location-uss_enterprise_d-transporter_room_3'})

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
MATCH (a:Event {uuid: 'event-3-5'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-4'}),
          (b:Event {uuid: 'event-3-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-3-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-3-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-william_t_riker-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'participation-agent-worf-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-worf-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'participation-agent-janina_taur-event-3-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-janina_taur-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'participation-agent-geordi_la_forge-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-geordi_la_forge-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (b:AgentParticipation {uuid: 'participation-agent-reginald_barclay-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-reginald_barclay-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (b:AgentParticipation {uuid: 'participation-agent-miles_obrien-event-3-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-miles_obrien-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Location {uuid: 'location-melatrite_iii-subterranean_structure-central_chamber'})

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
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'participation-agent-worf-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-worf-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-4-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'participation-agent-worf-event-4-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-worf-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'participation-agent-worf-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-worf-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-4-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-4-4'}),
          (b:Event {uuid: 'event-4-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Location {uuid: 'location-melatrite_iii-subterranean_structure-archive'})

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
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'participation-agent-data-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-data-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeanluc_picard'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeanluc_picard-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-ancient_hologram-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'participation-agent-worf-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-worf-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
