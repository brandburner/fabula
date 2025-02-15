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
MERGE (a:Agent {uuid: 'agent-jean_luc_picard'})
    ON CREATE SET
        a.name = 'Jean-Luc Picard',
        a.title = 'Captain',
        a.description = 'Jean-Luc Picard is the Captain of the USS Enterprise-D, renowned for his logical, wise, and empathetic command style. Known for his diplomatic prowess, deep intellect, and a balanced approach to leadership, Picard values reason and has a strong sense of duty. He explores and understands new worlds with peace and respect, often guided by his moral compass.',
        a.traits = ["Authoritative", "Intelligent", "Thoughtful", "Curious", "Principled", "Respected", "Wise", "Moral integrity", "Respectful", "Philosophical", "Empathetic", "Knowledgeable", "Diplomatic", "Logical", "Leader"],
        a.sphere_of_influence = 'Command'
    ;
MERGE (a:Agent {uuid: 'agent-william_t_riker'})
    ON CREATE SET
        a.name = 'William T. Riker',
        a.title = 'Commander',
        a.description = 'William T. Riker is the First Officer of the USS Enterprise-D. Known for his easy charm, rugged good looks, and razor-sharp intellect, Riker is optimistic and deeply loyal to his Captain and crew. He balances humor with a firm command of his duties and has forged a strong bond with Captain Picard.',
        a.traits = ["Optimistic", "Intelligent", "Charming", "Charismatic", "Tactical", "Loyal"],
        a.sphere_of_influence = 'First Officer Operations'
    ;
MERGE (a:Agent {uuid: 'agent-data'})
    ON CREATE SET
        a.name = 'Data',
        a.title = 'Lieutenant Commander',
        a.description = 'Data is an android and the second officer of the USS Enterprise-D. His positronic brain allows him to process information with incredible speed and accuracy. He is known for his quest to understand human nature and his dedication to his duties, often showcasing curiosity and a desire to grow beyond his programming.',
        a.traits = ["Dedicated", "Intelligent", "Inquisitive", "Curious about humanity", "Android", "Curious", "Lacks Emotion", "Remarkably insightful", "Logical", "Analytical", "Non-emotional", "Precise"],
        a.sphere_of_influence = 'Operations'
    ;
MERGE (a:Agent {uuid: 'agent-worf'})
    ON CREATE SET
        a.name = 'Worf',
        a.title = 'Lieutenant',
        a.description = 'Worf is a Klingon officer serving as Chief Tactical Officer on the USS Enterprise-D. Known for his sense of honor, courage, and martial prowess, Worf often exhibits a strong sense of duty and caution. His Klingon heritage influences his perspective, providing valuable insights during security and tactical missions.',
        a.traits = ["Alert", "Duty-bound", "Cautious", "Martial prowess", "Martial", "Klingon", "Brave", "Honorable", "Strategic thinker", "Courageous"],
        a.sphere_of_influence = 'Tactical Operations'
    ;
MERGE (a:Agent {uuid: 'agent-janina_taur'})
    ON CREATE SET
        a.name = 'Janina Taur',
        a.title = 'Ensign',
        a.description = 'Ensign Janina Taur is a highly capable young officer at the helm of the USS Enterprise-D. She graduated top of her class at Starfleet Academy in 2362, with specializations in astrophysics and advanced warp field theory.',
        a.traits = ["Capable", "Intelligent", "Precise", "Confident"],
        a.sphere_of_influence = 'Helm Operations'
    ;
MERGE (a:Agent {uuid: 'agent-deanna_troi'})
    ON CREATE SET
        a.name = 'Deanna Troi',
        a.title = 'Counselor',
        a.description = 'Deanna Troi is the ship\'s counselor aboard the USS Enterprise-D. With a background in psychology and the unique ability to sense emotions, Troi plays a crucial role in navigating the complexities of interstellar relations and offers valuable insights into the emotional landscapes they encounter.',
        a.traits = ["Empathic", "Insightful", "Compassionate", "Perceptive"],
        a.sphere_of_influence = 'Emotional Intelligence'
    ;
MERGE (a:Agent {uuid: 'agent-geordi_la_forge'})
    ON CREATE SET
        a.name = 'Geordi La Forge',
        a.title = 'Chief Engineer',
        a.description = 'Geordi La Forge serves as the Chief Engineer aboard the USS Enterprise-D. With his VISOR, he possesses the ability to see across the electromagnetic spectrum, granting him insight into details others cannot perceive. He is known for his technical brilliance, resourcefulness, and calm demeanor under pressure.',
        a.traits = ["Technical brilliance", "Resourceful", "Calm", "Insightful", "Problem solver"],
        a.sphere_of_influence = 'Engineering and Technology'
    ;
MERGE (a:Agent {uuid: 'agent-reginald_barclay'})
    ON CREATE SET
        a.name = 'Reginald Barclay',
        a.title = 'Lieutenant',
        a.description = 'Lieutenant Reginald Barclay is known for his brilliant engineering mind, despite his social awkwardness. He has recently succeeded in resolving a complex trade negotiation, demonstrating his analytical capabilities and persistence.',
        a.traits = ["Brilliant engineer", "Socially awkward", "Analytical", "Persistent", "Innovative"],
        a.sphere_of_influence = 'Engineering and Diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent-miles_obrien'})
    ON CREATE SET
        a.name = 'Miles O\'Brien',
        a.title = 'Transporter Chief',
        a.description = 'Miles O\'Brien is the Transporter Chief aboard the USS Enterprise-D. He is highly skilled with transporter systems, handling them with precision. Known for his reliability and practical understanding of engineering, O\'Brien is an invaluable member of the crew.',
        a.traits = ["Reliable", "Practical", "Skilled engineer", "Dependable", "Patient"],
        a.sphere_of_influence = 'Transporter Technology'
    ;
MERGE (a:Agent {uuid: 'agent-ancient_hologram'})
    ON CREATE SET
        a.name = 'Ancient Hologram',
        a.title = 'None',
        a.description = 'The Ancient Hologram is a representation of a member from the প\\u{9c}র\\u{9b}চীন civilization, appearing as a tall humanoid figure with elongated limbs and large, luminous eyes. It serves as a caretaker of an archive containing their knowledge and communicates with the USS Enterprise-D crew to share this legacy. The প\\u{9c}র\\u{9b}চীন ascended to a higher plane of existence, leaving this hologram to connect with other civilizations.',
        a.traits = ["Informative", "Echo of Civilization", "Ancient", "Knowledgeable", "Guardianship", "Mysterious"],
        a.sphere_of_influence = 'Knowledge Preservation'
    ;
MERGE (o:Object {uuid: 'object-padd'})
    ON CREATE SET
        o.name = 'PADD (Personal Access Display Device)',
        o.description = 'A sleek, handheld computer used by Captain Jean-Luc Picard, containing the accumulated knowledge of a dozen worlds.',
        o.purpose = 'To review and analyze data, including the latest sensor readings.',
        o.significance = 'Represents the advanced technology and vast knowledge accessible to Starfleet officers, highlighting Picard\'s reliance on data-driven decision making.'
    ;
MERGE (o:Object {uuid: 'object-long-range_sensor_array'})
    ON CREATE SET
        o.name = 'Long-Range Sensor Array',
        o.description = 'A complex array used by Lieutenant Commander Data to detect and analyze unusual energy readings from a Class-M planet.',
        o.purpose = 'To provide detailed sensor readings and identify potential subspace phenomena.',
        o.significance = 'Critical for advancing the investigation of the Melatrite Nebula and detecting potential threats or anomalies.'
    ;
MERGE (o:Object {uuid: 'object-main_viewscreen'})
    ON CREATE SET
        o.name = 'Main Viewscreen',
        o.description = 'A large screen on the bridge displaying the starfield, including the Melatrite Nebula.',
        o.purpose = 'To visually present the current region of space, allowing the crew to monitor and navigate their environment.',
        o.significance = 'Offers a strategic view of space, central to coordinating missions and understanding navigational challenges.'
    ;
MERGE (o:Object {uuid: 'object-holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A sophisticated display system located in the observation lounge, projecting detailed scans of Melatrite III. Generated by the lounge\'s emitter system, which was upgraded during the last refit at Starbase 74 in 2369.',
        o.purpose = 'To provide visual context of the Melatrite III and facilitate strategic discussions among the senior officers.',
        o.significance = 'Allows the crew to examine detailed scans and data about Melatrite III, aiding in their analysis of the unusual energy readings and potential historical significance of the প\\u{9c}র\\u{9b}চীন civilization.'
    ;
MERGE (o:Object {uuid: 'object-conference_table'})
    ON CREATE SET
        o.name = 'Conference Table',
        o.description = 'A central element in the observation lounge where key discussions among Captain Picard, Commander Riker, and Counselor Troi take place.',
        o.purpose = 'Used for meetings and strategic discussions by the senior staff of the USS Enterprise-D.',
        o.significance = 'Symbolizes the collaborative decision-making process of the Enterprise crew, where critical insights are shared and mission strategies are formulated.'
    ;
MERGE (o:Object {uuid: 'object-lounge_emitter_system'})
    ON CREATE SET
        o.name = 'Emitter System',
        o.description = 'Part of the observation lounge\'s holographic display technology, enabling projection of detailed holograms such as the scans of Melatrite III.',
        o.purpose = 'To generate holographic images and data displays for in-depth analysis and briefing purposes.',
        o.significance = 'Represents the advanced technological capabilities of the USS Enterprise-D in visualizing complex data and enhancing understanding during mission briefings.'
    ;
MERGE (o:Object {uuid: 'object-transporter_controls'})
    ON CREATE SET
        o.name = 'Transporter Controls',
        o.description = 'A sophisticated console operated by Chief Miles O\'Brien, featuring tactile interfaces and visual displays for precise transporter functions.',
        o.purpose = 'To initiate and control the transport process for the away team from the USS Enterprise to a designated location.',
        o.significance = 'Crucial for ensuring safe transportation of crew members, the transporter controls are central to away missions and highlight the technological capabilities of the Federation.'
    ;
MERGE (o:Object {uuid: 'object-tricorder'})
    ON CREATE SET
        o.name = 'Tricorder',
        o.description = 'A handheld device used by Data to scan the crystalline structure. It is a TR-590 Mark IX model, capable of analyzing subspace phenomena.',
        o.purpose = 'To scan and analyze the subspace amplifier and gather scientific data about the energy patterns.',
        o.significance = 'Represents the advanced technology and scientific capabilities of the Enterprise crew, allowing them to understand and interpret complex phenomena.'
    ;
MERGE (o:Object {uuid: 'object-disruptor'})
    ON CREATE SET
        o.name = 'Disruptor',
        o.description = 'A handheld Klingon weapon carried by Worf, designed for powerful defensive and offensive capabilities.',
        o.purpose = 'To provide security and defense during potentially hostile encounters, reinforcing the safety of the away team.',
        o.significance = 'Symbolizes the preparedness and martial prowess of the crew, particularly reflecting Worf\'s Klingon heritage and commitment to protection.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_structure'})
    ON CREATE SET
        o.name = 'Crystalline Structure',
        o.description = 'A massive, pulsating structure made of crystal, located at the center of the chamber. It emits a soft, ethereal blue light and resonates with the planet\'s natural subspace field.',
        o.purpose = 'To function as a subspace amplifier, creating the energy patterns detected by the Enterprise.',
        o.significance = 'The structure is central to the plot as it is the source of the mysterious energy readings that brought the Enterprise to Melatrite III. It also symbolizes the advanced technology of the প\\u{9c}র\\u{9b}চীন civilization.'
    ;
MERGE (o:Object {uuid: 'object-obsidian_walls'})
    ON CREATE SET
        o.name = 'Obsidian-Like Walls',
        o.description = 'Smooth walls made of a material resembling obsidian, designed to absorb light. They are adorned with intricate carvings depicting celestial events and abstract geometric patterns.',
        o.purpose = 'To serve as the surrounding structure of the chamber, adding to the mystical and enigmatic atmosphere of the location.',
        o.significance = 'The carvings and material of the walls reflect the artistry and knowledge of the প\\u{9c}র\\u{9b}চীন civilization, hinting at their advanced understanding of celestial phenomena.'
    ;
MERGE (o:Object {uuid: 'object-holographic_projection'})
    ON CREATE SET
        o.name = 'Holographic Projection',
        o.description = 'A holographic image of a humanoid figure with elongated limbs and luminous eyes, representing a member of the প\\u{9c}র\\u{9b}চীন species.',
        o.purpose = 'To communicate with the Enterprise crew and deliver the message of the প\\u{9c}র\\u{9b}চীন civilization.',
        o.significance = 'Serves as a direct link to the প\\u{9c}র\\u{9b}চীন, providing exposition and deepening the lore of the Star Trek universe.'
    ;
MERGE (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    ON CREATE SET
        o.name = 'Crystalline Data Storage Devices',
        o.description = 'Rows of crystalline structures lining the walls of the archive, designed to store vast amounts of information from the now-ascended প\\u{9c}র\\u{9b}চীন civilization.',
        o.purpose = 'To preserve the knowledge and legacy of the প\\u{9c}র\\u{9b}চীন civilization for future generations and interstellar societies.',
        o.significance = 'Contains more data than the entire Federation historical database; represents the culmination of the প\\u{9c}র\\u{9b}চীন\'s achievements and their desire to communicate with other species.'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d_main_bridge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Main Bridge',
        l.description = 'The main command center of the USS Enterprise-D, a Galaxy-class starship, where the captain and crew oversee and manage the ship\'s operations. The bridge is equipped with a range of high-tech stations including the command chair, operations station, and tactical station, set against the backdrop of the main viewscreen displaying the starfield.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-melatrite_nebula'})
    ON CREATE SET
        l.name = 'Melatrite Nebula',
        l.description = 'A designated region of space characterized by a swirling tapestry of stars and nebular clouds. It contains high concentrations of tetryon particles and displays intermittent gravimetric distortions, suggesting unusual subspace phenomena.',
        l.type = 'Region in Space'
    ;
MERGE (l:Location {uuid: 'location-melatrite_iii'})
    ON CREATE SET
        l.name = 'Melatrite III',
        l.description = 'A Class-M planet within the Melatrite Nebula, known for unusual energy readings consistent with a type-4 subspace inversion and elements not found in any known natural phenomenon.',
        l.type = 'Planet'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d_observation_lounge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Observation Lounge',
        l.description = 'The observation lounge offers a panoramic view of the Melatrite Nebula, with its swirling gases painted across space in vibrant hues. A sophisticated holographic display system, upgraded during the last refit at Starbase 74 in 2369, provides detailed scans and visual representation of Melatrite III.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-uss_enterprise_d_transporter_room_3'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Transporter Room 3',
        l.description = 'The transporter room is a hive of activity, bustling with preparations for an upcoming away mission. Chief Engineer Geordi La Forge, Lieutenant Reginald Barclay, and Chief Miles O\'Brien manage the sophisticated transporter systems. This room is equipped with advanced technology designed for precise personnel and material transport, making it pivotal for exploration and emergency operations.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-melatrite_iii_subterranean_structure_central_chamber'})
    ON CREATE SET
        l.name = 'Melatrite III - Subterranean Structure - Archive',
        l.description = 'A vast subterranean archive located within a structure on Melatrite III. It contains rows upon rows of crystalline data storage devices, each storing a wealth of information crafted by the ancient civilization. The environment within the archive is vast and cavernous, with the capacity to revolutionize understanding of the universe through its preserved knowledge.',
        l.type = 'Archive'
    ;
MERGE (o:Organization {uuid: 'org-starfleet_command'})
    ON CREATE SET
        o.name = 'Starfleet Command',
        o.description = 'The United Federation of Planets\' exploratory and military service.',
        o.sphere_of_influence = 'United Federation of Planets and its member worlds.'
    ;
MERGE (o:Organization {uuid: 'org-uss_enterprise_d'})
    ON CREATE SET
        o.name = 'USS Enterprise-D',
        o.description = 'A Galaxy-class starship of the United Federation of Planets tasked with exploration and peacekeeping missions.',
        o.sphere_of_influence = 'United Federation of Planets and exploratory missions.'
    ;
MERGE (o:Organization {uuid: 'org-ancient_civilization'})
    ON CREATE SET
        o.name = 'Ancient Civilization',
        o.description = 'A highly advanced civilization that built a facility to preserve their knowledge and reach out to other civilizations before ascending to a higher plane of existence.',
        o.sphere_of_influence = 'Preservation of knowledge and inter-civilizational communication.'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
    ON CREATE SET
        ep.title = 'Episode One - Echoes of the Past',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene-1'})
    ON CREATE SET
        s.title = 'Course Set for Melatrite III',
        s.description = 'On the bridge of the USS Enterprise-D, Captain Jean-Luc Picard reviews sensor data from the Melatrite Nebula alongside his senior officers. Unusual subspace phenomena prompt Picard to order Ensign Janina Taur to set a course for Melatrite III, a Class-M planet with anomalous energy readings.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location-uss_enterprise_d_main_bridge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Bridge Operations Underway',
        e.description = 'The scene opens on the bridge of the USS Enterprise-D. Captain Jean-Luc Picard reviews a PADD. Commander Riker is nearby, and Data is stationed at the operations post. Worf mans the tactical station, while Ensign Janina Taur is at the helm. The main viewscreen shows a starfield in the Melatrite Nebula.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-1-2'})
    ON CREATE SET
        e.title = 'Discussion of the Melatrite Nebula',
        e.description = 'Captain Picard and Commander Riker discuss the latest sensor readings concerning potential subspace phenomena in the Melatrite Nebula. Riker reports detecting high concentrations of tetryon particles and gravimetric field distortions, similar to past subspace anomalies.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Commander Riker, have you had a chance to review the latest sensor readings from the Melatrite Nebula? Starfleet Command believes there may be unusual subspace phenomena occurring in that region.", "RIKER: Yes, Captain. Preliminary scans show high concentrations of tetryon particles and intermittent distortions in the gravimetric field. It's reminiscent of the subspace anomalies we encountered near the Maranga system during the Zakdorn crisis of '69."]
    ;
MERGE (e:Event {uuid: 'event-1-3'})
    ON CREATE SET
        e.title = 'Data Reports Unusual Energy Readings',
        e.description = 'Data informs Captain Picard about unusual energy readings from Melatrite III after completing a diagnostic of the long-range sensor array. The readings suggest a type-4 subspace inversion with unique elements.',
        e.sequence = 3,
        e.key_dialogue = ["DATA: Captain, I have completed a level-three diagnostic of the long-range sensor array. I am detecting unusual energy readings emanating from a Class-M planet designated as Melatrite III. The readings are consistent with a type-4 subspace inversion, but also contain elements not found in any known natural phenomenon."]
    ;
MERGE (e:Event {uuid: 'event-1-4'})
    ON CREATE SET
        e.title = 'Course Set for Melatrite III',
        e.description = 'Captain Picard orders Ensign Taur to set a course for Melatrite III at warp factor six to investigate further. Ensign Taur complies and engages the warp drive.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Intriguing. Ensign Taur, lay in a course for Melatrite III, warp factor six. Let's take a closer look.", "TAUR: Aye, Captain. Course laid in. Engaging warp drive."]
    ;
MERGE (s:Scene {uuid: 'scene-2'})
    ON CREATE SET
        s.title = 'Discussion on Energy Readings and Psychic Resonance',
        s.description = 'In the USS Enterprise-D\'s Observation Lounge, Captain Picard, Commander Riker, and Counselor Deanna Troi gather around the conference table, surrounded by a panoramic view of the Melatrite Nebula. They are analyzing a holographic display depicting detailed scans of Melatrite III. Picard seeks Troi\'s impressions on the complex energy readings, which she describes as a mixture of emotions suggesting possible communication attempts. The conversation touches upon the possibility of a distress signal or something linked to the প্রাচীন civilization, known for its advanced technology. Troi also notes a psychic resonance that feels strangely familiar.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location-uss_enterprise_d_observation_lounge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Counselor Troi Analyzes Energy Readings',
        e.description = 'Captain Picard asks Counselor Troi for her impressions of the energy readings from Melatrite III. Troi interprets the patterns as a mixture of emotions, suggesting some form of sentient involvement. She describes a sense of fear, longing, and hope, indicating a possible attempt at communication.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Counselor, what are your impressions of these energy readings? Do they suggest any sentient involvement?", "TROI: The patterns are complex, Captain. I sense a mixture of emotions \u2013 fear, longing, but also a profound sense of hope. It's as if someone, or something, is reaching out across space, trying to communicate."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Riker Speculates on a Distress Signal',
        e.description = 'Commander Riker suggests the energy readings could represent a distress signal from a civilization facing a cataclysm. This proposal introduces the idea that the signals might be a call for help.',
        e.sequence = 2,
        e.key_dialogue = ["RIKER: Could it be a distress signal? Perhaps a civilization facing some kind of cataclysm?"]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'Picard Mentions the Ancient Civilization',
        e.description = 'Captain Picard reflects on the history of the Melatrite Nebula, noting it was once inhabited by an ancient civilization that vanished over a million years ago. He explains how their superior technology and fragmented records have left a lasting signature on cosmic background radiation.',
        e.sequence = 3,
        e.key_dialogue = ["PICARD: Possibly. Or it could be something else entirely. The Melatrite Nebula was once home to the Ancient civilization, a species that vanished over a million years ago, leaving behind only fragmented records and their signature on the cosmic background radiation. Their technology was said to be far beyond our understanding."]
    ;
MERGE (e:Event {uuid: 'event-2-4'})
    ON CREATE SET
        e.title = 'Troi Detects Faint Psychic Resonance',
        e.description = 'Counselor Troi discloses detecting a faint psychic resonance that feels familiar, reminiscent of an echo from the past, adding a new layer of mystery to the situation.',
        e.sequence = 4,
        e.key_dialogue = ["TROI: Captain, I'm also detecting a faint psychic resonance. It feels... familiar, somehow. Like an echo from the past."]
    ;
MERGE (s:Scene {uuid: 'scene-3'})
    ON CREATE SET
        s.title = 'Final Transporter Preparations for Away Mission',
        s.description = 'In the USS Enterprise-D transporter room, Chief Engineer Geordi La Forge coordinates the last checks for an away mission, with Lieutenant Reginald Barclay assisting. Transporter Chief Miles O\'Brien skillfully manages the transporter console, while Data, Worf, and a security team (Ensigns Davies and লাল) gather on the platform. La Forge confirms optimal transporter operation targeting a strong energy source from an ancient subterranean structure on the planet. Data provides analysis of the structure, calling attention to its antiquity and energy readings. Worf expresses concern about potential defenses, and both he and Captain Picard agree on maintaining caution. O\'Brien activates the energizing sequence, marking the transition to the next step of the mission.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_transporter_room_3'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Final Preparations for the Away Mission',
        e.description = 'Chief Engineer Geordi La Forge, assisted by Lieutenant Reginald Barclay, oversees the final preparations for the away mission on the transporter room. They ensure the transporter systems are operating at optimal efficiency. Transporter Chief Miles O\'Brien stands at the main console, ensuring the transporter is ready. Data confirms that they\'ve locked onto the strongest energy source on the planet, originating from a subterranean structure predating the extinction of an ancient civilization.',
        e.sequence = 1,
        e.key_dialogue = ["LA FORGE: Transporter systems are operating at optimal efficiency. We've locked onto the strongest energy source on the planet's surface. It appears to be originating from a subterranean structure.", "DATA: The structure's composition is unknown, Chief. However, preliminary scans indicate that it predates the extinction of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 by at least five hundred thousand years. Its energy signature is consistent with the subspace readings we detected earlier."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'Worf and Picard Discuss Potential Threats',
        e.description = 'Worf expresses concern about potential threats, citing the ancient civilization\'s powerful defensive technologies. Captain Picard concurs but emphasizes that their main goal is observation, not engagement.',
        e.sequence = 2,
        e.key_dialogue = ["WORF: We should prepare for possible resistance. The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were known to have powerful defensive technologies.", "PICARD: Agreed, Lieutenant. But let's proceed with caution. Our primary objective is to investigate, not to engage in hostilities."]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'O\'Brien Activates the Transporter',
        e.description = 'With all precautions in place and an understanding of their mission objectives, Transporter Chief Miles O\'Brien engages the transporter, energizing the crew for their away mission to the surface.',
        e.sequence = 3,
        e.key_dialogue = ["O'BRIEN: Energizing."]
    ;
MERGE (s:Scene {uuid: 'scene-4'})
    ON CREATE SET
        s.title = 'Discovery in the Subterranean Chamber',
        s.description = 'The away team materializes in a vast, circular chamber on Melatrite III, surrounded by walls of smooth, obsidian-like material that absorb light. The chamber is adorned with intricate carvings depicting celestial events, and in its center stands a massive crystalline structure pulsating with a soft blue light, emitting a strange, musical hum. Data identifies the structure as a subspace amplifier causing the detected energy patterns. As they approach, the carvings glow and a humanoid holographic projection of the প্রাচীন species appears, greeting the team and indicating they have awaited this encounter.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Away Team Arrives in Central Chamber',
        e.description = 'The away team materializes within a vast, circular chamber on Melatrite III, characterized by obsidian-like walls and a large crystalline structure pulsating with blue light. Data starts scanning with his tricorder to analyze the structure.',
        e.sequence = 1,
        e.key_dialogue = ["DATA: Fascinating. The crystalline structure appears to be a form of subspace amplifier. It is resonating with the planet's natural subspace field, creating the energy patterns we detected."]
    ;
MERGE (e:Event {uuid: 'event-4-2'})
    ON CREATE SET
        e.title = 'Team Discusses Potential Dangers',
        e.description = 'Worf expresses his concern about the possibility of the situation being a trap, but Picard suggests the need for cautious exploration, implying that the unknown element might have an entirely different nature.',
        e.sequence = 2,
        e.key_dialogue = ["WORF: I do not like this, Captain. It feels like a trap.", "PICARD: Perhaps, Lieutenant. Or perhaps it's something else entirely. Let's proceed cautiously."]
    ;
MERGE (e:Event {uuid: 'event-4-3'})
    ON CREATE SET
        e.title = 'Holographic Projection of the প্রাচীন Appears',
        e.description = 'As the team approaches the crystalline structure, the humming sound intensifies. The carvings on the walls glow, the air shimmers, and a holographic representation of a humanoid figure from the প্রাচীন species appears, addressing the team.',
        e.sequence = 3,
        e.key_dialogue = ["ANCIENT HOLOGRAM: Greetings. We are the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8. We have awaited your arrival."]
    ;
MERGE (s:Scene {uuid: 'scene-5'})
    ON CREATE SET
        s.title = 'Discovery of the Ancient Archive',
        s.description = 'The away team is led by the Ancient Hologram through a series of corridors beneath the surface of Melatrite III, eventually arriving at a vast archive filled with crystalline data storage devices. Data and Picard are struck by the enormity of the knowledge contained within. The Ancient Hologram explains that the archive was created by the প্রাচীন to preserve their legacy as they ascended to a higher plane of existence. The scene is filled with awe and a sense of historical significance.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Arrival at the Ancient Archive',
        e.description = 'The Ancient Hologram leads the away team, including Data, Picard, and Worf, to a vast archive located in a subterranean structure on Melatrite III. The archive is lined with crystalline data storage devices that hold more information than the entire Federation historical database. Data is visibly excited about the wealth of knowledge present.',
        e.sequence = 1,
        e.key_dialogue = ["DATA: This archive is remarkable, Captain. It contains more data than the entire Federation historical database. It would take centuries to analyze it all.", "PICARD: Indeed, Commander. This could revolutionize our understanding of the universe. But first, we need to understand the nature of this facility and the message the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 are trying to send."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Explanation of the Archive\'s Purpose',
        e.description = 'The Ancient Hologram explains the purpose of the archive to the away team. It reveals that the facility was constructed to preserve the knowledge of their civilization and to communicate with other civilizations after ascending to a higher plane of existence. The hologram indicates that a part of their essence remains within the archive as a memory or echo.',
        e.sequence = 2,
        e.key_dialogue = ["ANCIENT HOLOGRAM: We built this facility to preserve our knowledge and to reach out to other civilizations. We knew that our time was coming to an end, but we hoped that our legacy would endure.", "WORF: What happened to your people?", "ANCIENT HOLOGRAM: We ascended to a higher plane of existence, leaving behind our physical forms. But we left a part of ourselves within this archive, a memory, an echo, waiting for someone to listen."]
    ;
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
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
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (o:Organization {uuid: 'org-ancient_civilization'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-padd'}),
          (a:Agent {uuid: 'agent-jean_luc_picard'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-long-range_sensor_array'}),
          (a:Agent {uuid: 'agent-data'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-transporter_controls'}),
          (a:Agent {uuid: 'agent-miles_obrien'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-tricorder'}),
          (a:Agent {uuid: 'agent-data'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-disruptor'}),
          (a:Agent {uuid: 'agent-worf'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-holographic_projection'}),
          (a:Agent {uuid: 'agent-ancient_hologram'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-data'}),
          (o:Organization {uuid: 'org-uss_enterprise_d'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (o:Organization {uuid: 'org-ancient_civilization'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-padd-event-1-1'})
    ON CREATE SET
        oi.description = 'Captain Jean-Luc Picard uses the PADD to review information, likely related to the Melatrite Nebula and sensor readings.',
        oi.status_before = 'Idle, available for use on the bridge.',
        oi.status_after = 'In use by Captain Picard for reviewing data.'
    WITH oi
    MATCH (o:Object {uuid: 'object-padd'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-main_viewscreen-event-1-1'})
    ON CREATE SET
        oi.description = 'The main viewscreen displays a starfield of the Melatrite Nebula, providing visual context for the crew\'s current mission.',
        oi.status_before = 'Inactive or displaying previous visual data.',
        oi.status_after = 'Displaying a visual of the Melatrite Nebula.'
    WITH oi
    MATCH (o:Object {uuid: 'object-main_viewscreen'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-long-range_sensor_array-event-1-1'})
    ON CREATE SET
        oi.description = 'Data conducts a level-three diagnostic on the long-range sensor array, which detects unusual energy readings from Melatrite III.',
        oi.status_before = 'Requires diagnostic to confirm functionality.',
        oi.status_after = 'Confirmed operational with unusual energy readings detected from Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long-range_sensor_array'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-padd-event-1-2'})
    ON CREATE SET
        oi.description = 'Captain Jean-Luc Picard uses the PADD to review sensor data concerning the Melatrite Nebula, an action that initiates the discussion about the potential subspace phenomena.',
        oi.status_before = 'The PADD is in Captain Picard\'s possession, displaying unread sensor data.',
        oi.status_after = 'The PADD has been reviewed by Captain Picard, presumably displaying updated sensory information as needed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-padd'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-long-range_sensor_array-event-1-2'})
    ON CREATE SET
        oi.description = 'Data uses the long-range sensor array to conduct a level-three diagnostic and detect unusual energy readings from Melatrite III, contributing crucial information about a type-4 subspace inversion.',
        oi.status_before = 'The long-range sensor array is operational and inactive in terms of post-diagnostic output.',
        oi.status_after = 'The long-range sensor array reports unusual energy readings consistent with a subspace inversion, showcasing its ability to detect complex phenomena.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long-range_sensor_array'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-main_viewscreen-event-1-2'})
    ON CREATE SET
        oi.description = 'The main viewscreen displays the Melatrite Nebula, providing a visual context for the discussion about subspace phenomena and the subsequent course set for Melatrite III.',
        oi.status_before = 'The main viewscreen displays the standard starfield view.',
        oi.status_after = 'The main viewscreen continues to display the starfield, with potential updates following the course adjustment towards Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-main_viewscreen'})
    MATCH (e:Event {uuid: 'event-1-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-padd-event-1-3'})
    ON CREATE SET
        oi.description = 'Captain Jean-Luc Picard is using a PADD to review information while receiving updates from his crew about the unusual energy readings from Melatrite III.',
        oi.status_before = 'The PADD is with Captain Picard, ready for use.',
        oi.status_after = 'The PADD continues to be used by Captain Picard for review.'
    WITH oi
    MATCH (o:Object {uuid: 'object-padd'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-long-range_sensor_array-event-1-3'})
    ON CREATE SET
        oi.description = 'Lieutenant Commander Data completes a level-three diagnostic of the long-range sensor array, detecting unusual energy readings from Melatrite III.',
        oi.status_before = 'The long-range sensor array was functional and undergoing a level-three diagnostic.',
        oi.status_after = 'The long-range sensor array is fully operational and has detected unusual energy readings consistent with a type-4 subspace inversion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long-range_sensor_array'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-main_viewscreen-event-1-3'})
    ON CREATE SET
        oi.description = 'The main viewscreen displays the current starfield including the Melatrite Nebula, facilitating the discussion of the sensor readings.',
        oi.status_before = 'The main viewscreen displays a previous starfield.',
        oi.status_after = 'The main viewscreen displays the starfield as seen from the position near Melatrite Nebula.'
    WITH oi
    MATCH (o:Object {uuid: 'object-main_viewscreen'})
    MATCH (e:Event {uuid: 'event-1-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-main_viewscreen-event-1-4'})
    ON CREATE SET
        oi.description = 'The main viewscreen displays the current starfield and updates as the USS Enterprise-D adjusts course to Melatrite III.',
        oi.status_before = 'Displaying a region of space designated as the Melatrite Nebula.',
        oi.status_after = 'Transitions to update with the new visual data as the ship moves towards Melatrite III after engaging warp drive.'
    WITH oi
    MATCH (o:Object {uuid: 'object-main_viewscreen'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-long-range_sensor_array-event-1-4'})
    ON CREATE SET
        oi.description = 'Data uses the long-range sensor array to detect unusual energy readings from Melatrite III consistent with a type-4 subspace inversion.',
        oi.status_before = 'Operational and conducting scans to diagnose energy readings.',
        oi.status_after = 'Continues to function normally after detection of inexplicable energy readings, pending further investigation upon arrival at Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long-range_sensor_array'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-padd-event-1-4'})
    ON CREATE SET
        oi.description = 'Captain Picard reviews data on the PADD during strategic discussions about the Melatrite Nebula.',
        oi.status_before = 'Used by Captain Picard for reviewing data relevant to the mission.',
        oi.status_after = 'Remains in use by Picard for ongoing mission planning and data review.'
    WITH oi
    MATCH (o:Object {uuid: 'object-padd'})
    MATCH (e:Event {uuid: 'event-1-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Reviewing a PADD and commanding the bridge.',
        ap.emotional_state = 'Intrigued and focused.',
        ap.emotional_tags = ["Intrigued", "focused."],
        ap.active_plans = ["Order investigation course to Melatrite III"],
        ap.beliefs = ["Investigating the unusual readings will provide valuable insights", "The safety and success of the mission depend on gathering more information"],
        ap.goals = ["Understand the nature of the subspace phenomena", "Ensure the crew is prepared for the investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Standing nearby Picard, contributing to the discussion on sensor readings.',
        ap.emotional_state = 'Cautious and analytical.',
        ap.emotional_tags = ["Cautious", "analytical."],
        ap.active_plans = ["Assist Picard with assessment of sensor readings"],
        ap.beliefs = ["Prior experiences with subspace anomalies can inform current strategies"],
        ap.goals = ["Support Picard in decision-making processes", "Ensure bridge operations are running smoothly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Performing a diagnostic of the long-range sensor array and reporting findings.',
        ap.emotional_state = 'Curious and precise.',
        ap.emotional_tags = ["Curious", "precise."],
        ap.active_plans = ["Complete sensor diagnostics", "Analyse unusual energy readings"],
        ap.beliefs = ["Scientific analysis is essential for understanding unknown phenomena"],
        ap.goals = ["Provide accurate data to assist in decision making", "Expand knowledge of subspace phenomena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Manning the tactical station.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Ensure ship's defenses are at the ready"],
        ap.beliefs = ["Maintaining tactical readiness is crucial at all times"],
        ap.goals = ["Protect the ship and crew from potential threats", "Respond swiftly to threats if they arise"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-1'})
    ON CREATE SET
        ap.current_status = 'At the helm, receiving orders from Picard.',
        ap.emotional_state = 'Concentrated and ready.',
        ap.emotional_tags = ["Concentrated", "ready."],
        ap.active_plans = ["Plotting course for Melatrite III"],
        ap.beliefs = ["Efficient navigation is critical for mission success"],
        ap.goals = ["Safely navigate the USS Enterprise-D to Melatrite III", "Execute orders with precision and efficiency"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Commanding from the bridge and reviewing sensor data from a PADD.',
        ap.emotional_state = 'Intrigued and focused.',
        ap.emotional_tags = ["Intrigued", "focused."],
        ap.active_plans = ["Investigate the unusual subspace phenomena in the Melatrite Nebula", "Direct the ship to Melatrite III for closer analysis"],
        ap.beliefs = ["Thorough investigation is necessary to understand the anomalies", "Understanding these phenomena could have significant implications"],
        ap.goals = ["Ensure the Enterprise safely navigates to Melatrite III", "Acquire data on the subspace inversion phenomena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Reporting on the sensor readings and comparing them to previous experiences.',
        ap.emotional_state = 'Attentive and analytical.',
        ap.emotional_tags = ["Attentive", "analytical."],
        ap.active_plans = ["Analyze the sensor data for further insights", "Coordinate with the bridge crew for incoming analysis"],
        ap.beliefs = ["There are parallels between this and past anomalies, which can inform current strategies", "Collective experience aids in effectively managing new challenges"],
        ap.goals = ["Support investigative efforts into the phenomena", "Provide relevant historical context to the current situation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Performing diagnostics and reporting unusual energy readings.',
        ap.emotional_state = 'Objective and detail-oriented.',
        ap.emotional_tags = ["Objective", "detail-oriented."],
        ap.active_plans = ["Continue monitoring the sensor data for new developments", "Analyze the consistency of energy readings with known phenomena"],
        ap.beliefs = ["The new data points to a phenomenon worth exploring further", "Consistent data analysis can uncover hidden patterns"],
        ap.goals = ["Identify the nature of the readings from Melatrite III", "Contribute to the scientific understanding of subspace phenomena"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Manning the tactical station and monitoring security-related aspects.',
        ap.emotional_state = 'Alert and prepared.',
        ap.emotional_tags = ["Alert", "prepared."],
        ap.active_plans = ["Ensure ship's readiness for any potential threats", "Monitor tactical systems throughout the mission"],
        ap.beliefs = ["Readiness is essential even during scientific missions", "Vigilance prevents unforeseen threats from compromising security"],
        ap.goals = ["Maintain security protocols during the investigation", "Ensure the safety of the crew and ship"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-2'})
    ON CREATE SET
        ap.current_status = 'Piloting the Enterprise to Melatrite III.',
        ap.emotional_state = 'Focused and determined.',
        ap.emotional_tags = ["Focused", "determined."],
        ap.active_plans = ["Navigate the ship effectively towards its destination", "Execute the assigned course at warp factor six"],
        ap.beliefs = ["Precise navigation ensures mission success", "Following orders contributes to the crew's collective effort"],
        ap.goals = ["Successfully reach Melatrite III", "Contribute to the mission's progress through skillful piloting"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Reviewing the PADD and responding to Data\'s report on unusual energy readings.',
        ap.emotional_state = 'Intrigued and curious.',
        ap.emotional_tags = ["Intrigued", "curious."],
        ap.active_plans = ["Investigate the unusual energy readings from Melatrite III.", "Command the crew to set a course for further investigation."],
        ap.beliefs = ["Proactive exploration is essential to understanding unknown phenomena.", "The pursuit of knowledge and Starfleet's mission are paramount."],
        ap.goals = ["Determine the origin and nature of the unusual energy readings.", "Ensure the USS Enterprise-D safely travels to Melatrite III for investigation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Standing next to Captain Picard and confirming details about the sensor readings.',
        ap.emotional_state = 'Alert and analytical.',
        ap.emotional_tags = ["Alert", "analytical."],
        ap.active_plans = ["Assist Captain Picard in understanding the subspace phenomena."],
        ap.beliefs = ["Starfleet's past experiences can help in understanding current anomalies."],
        ap.goals = ["Support the captain in making informed decisions about the anomaly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Reporting the completion of a level-three diagnostic and presenting findings on energy readings.',
        ap.emotional_state = 'Objective and focused.',
        ap.emotional_tags = ["Objective", "focused."],
        ap.active_plans = ["Continue monitoring the sensor array for updates."],
        ap.beliefs = ["Accurate sensor diagnostics are crucial for mission success."],
        ap.goals = ["Provide precise and actionable data to the command team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Manning the tactical station, maintaining readiness.',
        ap.emotional_state = 'Vigilant and focused.',
        ap.emotional_tags = ["Vigilant", "focused."],
        ap.active_plans = ["Ensure tactical systems are ready in case of an encounter."],
        ap.beliefs = ["Preparedness is key to the safety of the crew and the ship."],
        ap.goals = ["Protect crew and ship from potential threats during the journey."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-3'})
    ON CREATE SET
        ap.current_status = 'Setting course for Melatrite III and engaging warp drive.',
        ap.emotional_state = 'Focused and attentive.',
        ap.emotional_tags = ["Focused", "attentive."],
        ap.active_plans = ["Execute the captain's orders efficiently."],
        ap.beliefs = ["Following orders accurately is critical to mission success."],
        ap.goals = ["Navigate the ship to Melatrite III smoothly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Ordering Ensign Taur to set a course for Melatrite III.',
        ap.emotional_state = 'Curious and determined.',
        ap.emotional_tags = ["Curious", "determined."],
        ap.active_plans = ["Investigate energy readings on Melatrite III"],
        ap.beliefs = ["The anomaly could reveal important phenomena", "Direct investigation is necessary for accurate understanding"],
        ap.goals = ["Ensure the crew explores the unusual readings", "Maintain operational readiness in case of unexpected events"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-4'})
    ON CREATE SET
        ap.current_status = 'Complying with Captain Picard\'s order to set a course for Melatrite III and engage warp drive.',
        ap.emotional_state = 'Focused and dutiful.',
        ap.emotional_tags = ["Focused", "dutiful."],
        ap.active_plans = ["Execute the helm commands accurately", "Ensure smooth transition to warp speed"],
        ap.beliefs = ["Following orders is critical to mission success", "Navigating the ship efficiently reflects professionalism"],
        ap.goals = ["Navigate the USS Enterprise-D to Melatrite III effectively", "Prove competence as a Starfleet officer"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-1'})
    ON CREATE SET
        oi.description = 'The holographic display is used to project detailed scans of Melatrite III, providing visual data for Troi\'s analysis.',
        oi.status_before = 'The holographic display is inactive.',
        oi.status_after = 'The holographic display is active, showing scans of Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lounge_emitter_system-event-2-1'})
    ON CREATE SET
        oi.description = 'The emitter system in the observation lounge generates the holographic display, enabling the team to view and analyze the energy readings from Melatrite III.',
        oi.status_before = 'The emitter system is powered on from the last refit but not actively used.',
        oi.status_after = 'The emitter system is active, supporting the holographic display of Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-conference_table-event-2-1'})
    ON CREATE SET
        oi.description = 'The conference table serves as the gathering spot for Picard, Riker, and Troi to discuss the energy readings and psychic impressions.',
        oi.status_before = 'The conference table is unoccupied.',
        oi.status_after = 'The conference table is occupied by Picard, Riker, and Troi for discussion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-conference_table'})
    MATCH (e:Event {uuid: 'event-2-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-conference_table-event-2-2'})
    ON CREATE SET
        oi.description = 'Riker suggests a hypothesis while he and others are gathered around the conference table, which serves as a central point for their discussion.',
        oi.status_before = 'The conference table is set up for discussions in the Observation Lounge.',
        oi.status_after = 'The conference table remains central to ongoing strategic discussions in the lounge.'
    WITH oi
    MATCH (o:Object {uuid: 'object-conference_table'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-2'})
    ON CREATE SET
        oi.description = 'The holographic display shows a detailed scan of Melatrite III, which supports Riker\'s suggestion by visualizing the energy readings.',
        oi.status_before = 'The holographic display is off or displaying previous data before the meeting.',
        oi.status_after = 'The holographic display shows the scan of Melatrite III, facilitating analysis for the ongoing discussion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lounge_emitter_system-event-2-2'})
    ON CREATE SET
        oi.description = 'The lounge emitter system generates the holographic display used by the crew to analyze the energy readings from Melatrite III.',
        oi.status_before = 'The emitter system is inactive or in standby mode.',
        oi.status_after = 'The emitter system is actively projecting the holographic display of Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-conference_table-event-2-3'})
    ON CREATE SET
        oi.description = 'The conference table serves as the gathering point for Captain Picard, Commander Riker, and Counselor Deanna Troi during their discussion about the Melatrite Nebula and the ancient civilization. It anchors the dialogue and the holographic display presentation.',
        oi.status_before = 'The conference table was unoccupied in the observation lounge.',
        oi.status_after = 'The conference table is in use by the Starfleet officers as they strategize and discuss potential findings regarding the Melatrite Nebula.'
    WITH oi
    MATCH (o:Object {uuid: 'object-conference_table'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-3'})
    ON CREATE SET
        oi.description = 'The holographic display, generated by the lounge\'s emitter system, shows a detailed scan of Melatrite III to aid Picard, Riker, and Troi in their analysis of the nebula and possible historical ties to the ancient civilization.',
        oi.status_before = 'The holographic display was not actively projecting any specific scan in the observation lounge.',
        oi.status_after = 'The holographic display actively presents scans of Melatrite III for strategic discussions.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lounge_emitter_system-event-2-3'})
    ON CREATE SET
        oi.description = 'The lounge\'s emitter system projects the holographic display that provides visual context and detailed scans of Melatrite III.',
        oi.status_before = 'The emitter system was inactive, not displaying any holographic images.',
        oi.status_after = 'The emitter system is actively projecting a detailed holographic representation of Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-conference_table-event-2-4'})
    ON CREATE SET
        oi.description = 'Picard, Riker, and Troi are gathered around the conference table as they discuss the energy readings and Troi\'s sensed psychic resonance.',
        oi.status_before = 'The conference table is set in the observation lounge, unused.',
        oi.status_after = 'The conference table is actively in use as a focal point for the meeting and discussion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-conference_table'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_display-event-2-4'})
    ON CREATE SET
        oi.description = 'The holographic display shows a detailed scan of Melatrite III, providing visual data to support the discussion.',
        oi.status_before = 'The holographic display is initialized, ready for projection.',
        oi.status_after = 'The holographic display projects a scan of Melatrite III, aiding in the crew\'s analysis.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_display'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-lounge_emitter_system-event-2-4'})
    ON CREATE SET
        oi.description = 'The emitter system supports the holographic display, ensuring a clear and detailed projection of the scan.',
        oi.status_before = 'The emitter system is idle, ready to emit holograms.',
        oi.status_after = 'The emitter system is actively used to project the hologram of Melatrite III.'
    WITH oi
    MATCH (o:Object {uuid: 'object-lounge_emitter_system'})
    MATCH (e:Event {uuid: 'event-2-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Inquiring Counselor Troi about the energy readings from Melatrite III.',
        ap.emotional_state = 'Curious and contemplative.',
        ap.emotional_tags = ["Curious", "contemplative."],
        ap.active_plans = ["Gauge the possibility of sentient involvement in the energy readings", "Consider potential historical or civilization-related connections to the readings"],
        ap.beliefs = ["The energy readings may contain vital information", "Understanding the energy patterns could provide insight into the Ancient civilization"],
        ap.goals = ["Determine the nature of the signals from Melatrite III", "Ensure the analysis considers all potential angles, including historical context"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Analyzing energy readings and interpreting emotional patterns.',
        ap.emotional_state = 'Intrigued and slightly concerned.',
        ap.emotional_tags = ["Intrigued", "slightly concerned."],
        ap.active_plans = ["Decipher the emotional patterns in the energy readings", "Relay any impressions that may indicate sentient activity"],
        ap.beliefs = ["The readings reflect a complex emotional state", "There may be a form of sentient communication occurring"],
        ap.goals = ["Provide insights into the possible sentient origins of the energy patterns", "Help the crew understand the potential significance of the signals"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Offering hypotheses regarding the nature of the energy readings.',
        ap.emotional_state = 'Cautiously speculative.',
        ap.emotional_tags = ["Cautiously speculative."],
        ap.active_plans = ["Consider the potential for a distress signal linked to the energy readings", "Explore the implications of a civilization facing a catastrophe"],
        ap.beliefs = ["The energy patterns could signal a civilization's distress", "History and technology of the Ancient civilization should be considered in the analysis"],
        ap.goals = ["Contribute potential explanations for the energy anomalies", "Prepare for any outcomes that may result from further investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Engaging Riker and Troi in a discussion about the possible interpretations of the energy readings from Melatrite III.',
        ap.emotional_state = 'Curious and contemplative.',
        ap.emotional_tags = ["Curious", "contemplative."],
        ap.active_plans = ["Determine the nature of the energy readings from Melatrite III."],
        ap.beliefs = ["The energy readings may be linked to a past or present civilization."],
        ap.goals = ["Unravel the mystery behind the energy readings potentially related to the Ancient civilization."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Proposing that the energy readings might be a distress signal from a civilization in peril.',
        ap.emotional_state = 'Thoughtful and inquisitive.',
        ap.emotional_tags = ["Thoughtful", "inquisitive."],
        ap.active_plans = ["Consider other possibilities for the energy readings, including distress signals."],
        ap.beliefs = ["The energy signatures could be an SOS from a civilization facing catastrophe."],
        ap.goals = ["Explore all plausible explanations for the mysterious energy patterns."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Sharing her psychic impressions of the Melatrite III energy readings.',
        ap.emotional_state = 'Empathetic and intrigued.',
        ap.emotional_tags = ["Empathetic", "intrigued."],
        ap.active_plans = ["Interpret psychic resonances to uncover underlying intent or emotion."],
        ap.beliefs = ["The energy readings convey complex emotional layers including hope."],
        ap.goals = ["Ascertain if there is sentient involvement behind the energy signals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Leading a discussion on the Melatrite Nebula with Counselor Troi and Commander Riker.',
        ap.emotional_state = 'Intrigued and contemplative.',
        ap.emotional_tags = ["Intrigued", "contemplative."],
        ap.active_plans = ["Determine the potential significance of the energy readings", "Consider historical context regarding the ancient civilization"],
        ap.beliefs = ["The traces of the ancient civilization may hold key insights", "Understanding the past can aid in uncovering new knowledge"],
        ap.goals = ["Gain a deeper understanding of the ancient civilization", "Ensure readiness to respond to potential communications or signals"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Engaging in analysis of the energy readings and discussing with Captain Picard and Counselor Troi.',
        ap.emotional_state = 'Cautious and analytical.',
        ap.emotional_tags = ["Cautious", "analytical."],
        ap.active_plans = ["Explore the possibility of a distress signal", "Consider different scenarios of potential cataclysmic events"],
        ap.beliefs = ["The readings could suggest distress or danger", "It is crucial to consider all possible explanations"],
        ap.goals = ["Identify the source and nature of the energy readings", "Prepare the crew for any necessary actions if the readings indicate danger"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-3'})
    ON CREATE SET
        ap.current_status = 'Providing insights into the emotional signatures within the energy readings.',
        ap.emotional_state = 'Reflective and intrigued.',
        ap.emotional_tags = ["Reflective", "intrigued."],
        ap.active_plans = ["Interpret the psychic resonance and emotional patterns", "Assist in decoding potential communications or signals"],
        ap.beliefs = ["The energy readings contain emotional signatures worth exploring", "A mixture of emotions may indicate a reaching out or communication"],
        ap.goals = ["Understand the emotional content of the energy patterns", "Help the crew interpret any potential messages or signals from the ancient civilization"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-4'})
    ON CREATE SET
        ap.current_status = 'Informing Captain Picard and Commander Riker about detecting a faint psychic resonance.',
        ap.emotional_state = 'Intrigued and contemplative.',
        ap.emotional_tags = ["Intrigued", "contemplative."],
        ap.active_plans = ["Communicate psychic resonance to the command staff", "Analyze the familiarity of the resonance"],
        ap.beliefs = ["The psychic resonance is significant and worth investigating", "There may be a connection to past events or entities"],
        ap.goals = ["Determine the source and nature of the psychic resonance", "Assist in uncovering any potential links to the Ancient civilization"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-transporter_controls-event-3-1'})
    ON CREATE SET
        oi.description = 'Transporter Chief Miles O\'Brien uses the transporter controls to prepare for and initiate the energizing process for the away mission.',
        oi.status_before = 'The transporter controls are unengaged but ready for operational use.',
        oi.status_after = 'The transporter controls have been actively used to energize the transport for the away team to the planet.'
    WITH oi
    MATCH (o:Object {uuid: 'object-transporter_controls'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-long-range_sensor_array-event-3-1'})
    ON CREATE SET
        oi.description = 'The long-range sensor array facilitates the scan and lock on the strongest energy source from the planet\'s surface, contributing critical data for the away mission.',
        oi.status_before = 'The sensor array is operational but unengaged.',
        oi.status_after = 'The sensor array has been actively used to lock onto and provide data about the energy source on the planet.'
    WITH oi
    MATCH (o:Object {uuid: 'object-long-range_sensor_array'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-transporter_controls-event-3-2'})
    ON CREATE SET
        oi.description = 'Transporter Chief Miles O\'Brien operates the transporter controls to energize the away team for the mission to the planet\'s surface.',
        oi.status_before = 'Transporter controls were primed and ready for operation under O\'Brien\'s supervision.',
        oi.status_after = 'Transporter controls were used to energize and transport the away team to the planet\'s surface.'
    WITH oi
    MATCH (o:Object {uuid: 'object-transporter_controls'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tricorder-event-3-2'})
    ON CREATE SET
        oi.description = 'Data references the tricorder\'s preliminary scans which indicated the ancient structure predates the ancient civilization\'s extinction by five hundred thousand years.',
        oi.status_before = 'The tricorder had conducted scans of the planet\'s surface from the transporter room.',
        oi.status_after = 'The tricorder\'s scan data was used to inform the context of the mission.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tricorder'})
    MATCH (e:Event {uuid: 'event-3-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-transporter_controls-event-3-3'})
    ON CREATE SET
        oi.description = 'Transporter Chief Miles O\'Brien uses the transporter controls to energize the away team for the mission to the surface of the planet.',
        oi.status_before = 'The transporter controls are ready and operational, under the supervision of Miles O\'Brien.',
        oi.status_after = 'The transporter controls have been used to successfully energize and transport the away team.'
    WITH oi
    MATCH (o:Object {uuid: 'object-transporter_controls'})
    MATCH (e:Event {uuid: 'event-3-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Overseeing final preparations for the away mission and ensuring transporter systems are operating at optimal efficiency.',
        ap.emotional_state = 'Focused and assured.',
        ap.emotional_tags = ["Focused", "assured."],
        ap.active_plans = ["Ensure transporter systems are optimal for mission.", "Lock onto the strongest energy source on the planet."],
        ap.beliefs = ["Precise transporter system operation is critical for mission safety.", "The energy source on the planet holds significant importance."],
        ap.goals = ["Successful deployment of the away team.", "Gather data on the energy source from the subterranean structure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Assisting in the final preparations for the away mission.',
        ap.emotional_state = 'Calmly attentive.',
        ap.emotional_tags = ["Calmly attentive."],
        ap.active_plans = ["Support Geordi La Forge in finalizing transporter readiness."],
        ap.beliefs = ["Every detail in preparation ensures the success of the mission."],
        ap.goals = ["Maintain clear communication and efficiency in transporter preparations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Operating the transporter console and preparing to energize.',
        ap.emotional_state = 'Confident and precise.',
        ap.emotional_tags = ["Confident", "precise."],
        ap.active_plans = ["Ensure transporter energizes correctly."],
        ap.beliefs = ["Successful energizing is crucial for the mission's commencement."],
        ap.goals = ["Execute smooth transportation of the away team to the designated location."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Confirming target lock on a strong energy source and providing analysis on its origin.',
        ap.emotional_state = 'Analytical and curious.',
        ap.emotional_tags = ["Analytical", "curious."],
        ap.active_plans = ["Provide data analysis on the energy source."],
        ap.beliefs = ["Understanding the ancient structure's energy signature is important for the mission."],
        ap.goals = ["Gather more understanding of the structure's makeup and significance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Ensuring the team is prepared against potential threats.',
        ap.emotional_state = 'Cautious and vigilant.',
        ap.emotional_tags = ["Cautious", "vigilant."],
        ap.active_plans = ["Prepare the security team for potential engagement."],
        ap.beliefs = ["The ancient structure may have defensive mechanisms still active."],
        ap.goals = ["Protect the away team from possible threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Expressing concern over potential threats due to the প্রাচীন civilization\'s defense technologies.',
        ap.emotional_state = 'Alert and cautious.',
        ap.emotional_tags = ["Alert", "cautious."],
        ap.active_plans = ["Prepare for possible resistance"],
        ap.beliefs = ["The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization had powerful defensive technologies"],
        ap.goals = ["Ensure the safety of the away team", "Successfully investigate the subterranean structure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Agreeing with Lieutenant Worf\'s concerns but emphasizing the mission\'s observational purpose.',
        ap.emotional_state = 'Calm yet decisive.',
        ap.emotional_tags = ["Calm yet decisive."],
        ap.active_plans = ["Proceed with caution during the away mission"],
        ap.beliefs = ["The primary objective is to investigate, not to engage in hostilities"],
        ap.goals = ["Maintain the focus of the mission on investigation", "Avoid unnecessary conflict"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Overseeing the final preparations for the away mission and confirming optimal transporter system efficiency.',
        ap.emotional_state = 'Focused and detail-oriented.',
        ap.emotional_tags = ["Focused", "detail-oriented."],
        ap.active_plans = ["Monitor transporter systems to ensure safe transport", "Provide technical support for the mission"],
        ap.beliefs = ["Proper preparation is key to mission success", "Technical precision ensures team safety"],
        ap.goals = ["Ensure crew is safely transported to the surface", "Facilitate successful investigation of the energy source"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Assisting Geordi La Forge with preparations for the away mission.',
        ap.emotional_state = 'Pleased and confident following recent success.',
        ap.emotional_tags = ["Pleased", "confident following recent success."],
        ap.active_plans = ["Support Geordi La Forge with any technical needs", "Ensure all systems are functioning correctly"],
        ap.beliefs = ["Proper execution of duties leads to trust from superiors", "Technology is paramount to mission success"],
        ap.goals = ["Help maintain efficient operation of transport systems", "Contribute to a successful mission outcome"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Engaging the transporter to beam the away team to the surface.',
        ap.emotional_state = 'Concentrated and professional.',
        ap.emotional_tags = ["Concentrated", "professional."],
        ap.active_plans = ["Operate transporter controls to initiate transport", "Monitor transporter integrity during the process"],
        ap.beliefs = ["Accurate transporter operation is critical for crew safety", "Technical precision is crucial in high-stakes situations"],
        ap.goals = ["Successfully energize and transport crew to the surface", "Ensure transport is safe and efficient"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Present and prepared for the away mission.',
        ap.emotional_state = 'Analytical and ready.',
        ap.emotional_tags = ["Analytical", "ready."],
        ap.active_plans = ["Gather data from the subterranean structure", "Assess defensive technologies from historical context"],
        ap.beliefs = ["Understanding the structure is key to the mission", "Knowledge of history aids in current decision-making"],
        ap.goals = ["Collect relevant data on the structure", "Ensure mission objectives are met without engagement"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Ready with a security detail for potential resistance.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Prepare team for defensive actions if necessary", "Secure the team and surroundings on the surface"],
        ap.beliefs = ["Being prepared ensures team safety", "Anticipating possible threats is a tactical priority"],
        ap.goals = ["Protect the away team", "Complete the mission with minimal confrontation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Providing leadership and direction with an emphasis on caution.',
        ap.emotional_state = 'Calm and strategic.',
        ap.emotional_tags = ["Calm", "strategic."],
        ap.active_plans = ["Guide the mission with a focus on non-hostile engagement", "Prioritize safety and data collection"],
        ap.beliefs = ["Cautious exploration will prevent unnecessary conflict", "Leadership requires balancing boldness with safety"],
        ap.goals = ["Gather intelligence on the energy source", "Ensure the crew's safe return"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tricorder-event-4-1'})
    ON CREATE SET
        oi.description = 'Data uses the tricorder to scan the crystalline structure, confirming it as a subspace amplifier resonating with the planet\'s subspace field.',
        oi.status_before = 'The tricorder was unused in Data\'s possession as the away team materialized.',
        oi.status_after = 'The tricorder is actively scanning the crystalline structure, providing Data with analysis results.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tricorder'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_structure-event-4-1'})
    ON CREATE SET
        oi.description = 'The crystalline structure is identified as a subspace amplifier by Data, and is central to creating the detected energy patterns.',
        oi.status_before = 'The crystalline structure was pulsating with blue light, causing energy readings.',
        oi.status_after = 'The structure continues to pulse, now confirmed as a subspace amplifier interacting with the environment.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-obsidian_walls-event-4-1'})
    ON CREATE SET
        oi.description = 'The obsidian-like walls absorb light and, upon the away team\'s approach, the carvings begin to glow, adding ambiance and mystery to the scene.',
        oi.status_before = 'The walls are static with intricate carvings depicting celestial events.',
        oi.status_after = 'The walls glow with energy as the away team approaches the central structure.'
    WITH oi
    MATCH (o:Object {uuid: 'object-obsidian_walls'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_projection-event-4-1'})
    ON CREATE SET
        oi.description = 'The holographic projection manifests as a humanoid figure representing a প্রাচীন, initiating communication with the away team.',
        oi.status_before = 'The holographic projection was inactive and unseen.',
        oi.status_after = 'The holographic projection appears, delivering a message from the প্রাচীন species.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_projection'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_structure-event-4-2'})
    ON CREATE SET
        oi.description = 'The crystalline structure in the center of the chamber pulsates with a soft, blue light and is identified by Data as a form of subspace amplifier that resonates with the planet\'s natural subspace field, producing the detected energy patterns.',
        oi.status_before = 'The crystalline structure was pulsating with a soft, blue light.',
        oi.status_after = 'The crystalline structure continues to pulsate with light as the away team approaches it, its function as a subspace amplifier creating energy patterns has been revealed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-obsidian_walls-event-4-2'})
    ON CREATE SET
        oi.description = 'The walls, made from an obsidian-like material, are adorned with intricate carvings that begin to glow, enhancing the mysterious atmosphere when the crystalline structure is approached.',
        oi.status_before = 'The obsidian-like walls were smooth and absorbed light, with carvings depicting celestial events and patterns.',
        oi.status_after = 'The carvings on the walls are glowing as the away team approaches the crystalline structure.'
    WITH oi
    MATCH (o:Object {uuid: 'object-obsidian_walls'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tricorder-event-4-2'})
    ON CREATE SET
        oi.description = 'Data uses his tricorder to scan the chamber, providing the informational insight that the crystalline structure is a subspace amplifier.',
        oi.status_before = 'Data\'s tricorder is ready for scanning.',
        oi.status_after = 'The tricorder has been used to confirm the presence and operation of a subspace amplifier.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tricorder'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_projection-event-4-2'})
    ON CREATE SET
        oi.description = 'A holographic projection appears, forming the image of a humanoid figure representing the প্রাচীন species. It acts as a communicator for introducing the প্রাচীন to the away team.',
        oi.status_before = 'There was no visible holographic projection.',
        oi.status_after = 'A holographic projection of a humanoid figure with elongated limbs and luminous eyes is present, introducing itself as a member of the প্রাচীন species.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_projection'})
    MATCH (e:Event {uuid: 'event-4-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-tricorder-event-4-3'})
    ON CREATE SET
        oi.description = 'Data uses the tricorder to scan the massive crystalline structure, gathering data on its properties as a subspace amplifier.',
        oi.status_before = 'The tricorder was idle, held by Data, ready to be utilized for any scientific analysis.',
        oi.status_after = 'The tricorder records data regarding the crystalline structure\'s resonance with the planet\'s subspace field.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tricorder'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_structure-event-4-3'})
    ON CREATE SET
        oi.description = 'The crystalline structure is central to the event, emitting pulsating blue light and identified by Data as a subspace amplifier.',
        oi.status_before = 'The crystalline structure was emitting a pulsating blue light and identified as the source of detected energy readings.',
        oi.status_after = 'The crystalline structure continues pulsating, resonating with the planet\'s subspace field, as further investigated by the team.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_structure'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-obsidian_walls-event-4-3'})
    ON CREATE SET
        oi.description = 'The obsidian-like walls are part of the environment, generating intrigue as their carvings glow and interact with the team\'s presence.',
        oi.status_before = 'The obsidian-like walls were dark and adorned with intricate carvings.',
        oi.status_after = 'The carvings on the walls begin to glow, responding to an unknown energy activating within the chamber.'
    WITH oi
    MATCH (o:Object {uuid: 'object-obsidian_walls'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_projection-event-4-3'})
    ON CREATE SET
        oi.description = 'A holographic projection materializes from the shimmering energy in the chamber, presenting a humanoid figure of the প্রাচীন species to greet the team.',
        oi.status_before = 'The holographic projection was inactive, with no form present.',
        oi.status_after = 'The holographic projection is active, displaying the figure of a প্রাচীন species member addressing the team.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_projection'})
    MATCH (e:Event {uuid: 'event-4-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Scanning the crystalline structure with his tricorder.',
        ap.emotional_state = 'Curious and analytical.',
        ap.emotional_tags = ["Curious", "analytical."],
        ap.active_plans = ["Analyze the subspace properties of the crystalline structure"],
        ap.beliefs = ["The crystalline structure has significant subspace interactions", "Scientific discovery is a crucial mission objective"],
        ap.goals = ["Determine the function of the crystalline structure", "Ensure the safety of the away team through understanding the artifact"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Observing the surroundings with a sense of caution.',
        ap.emotional_state = 'Suspicious and protective.',
        ap.emotional_tags = ["Suspicious", "protective."],
        ap.active_plans = ["Stay alert for potential threats"],
        ap.beliefs = ["The environment might be a trap", "Vigilance is crucial to mission and team safety"],
        ap.goals = ["Protect the away team", "Identify any possible threats"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Leading the away team and assessing the situation.',
        ap.emotional_state = 'Cautiously intrigued.',
        ap.emotional_tags = ["Cautiously intrigued."],
        ap.active_plans = ["Advance carefully towards the crystalline structure", "Engage with the holographic projection"],
        ap.beliefs = ["The phenomenon could provide critical insights", "Caution is necessary to avoid endangering the team"],
        ap.goals = ["Uncover the purpose of the crystalline structure", "Maintain the safety and success of the mission"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Greeting the away team.',
        ap.emotional_state = 'Welcoming and enigmatic.',
        ap.emotional_tags = ["Welcoming", "enigmatic."],
        ap.active_plans = ["Initiate contact with the visitors"],
        ap.beliefs = ["The arrival of visitors is significant"],
        ap.goals = ["Facilitate communication with the away team", "Provide necessary information about the structure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Expressing concern about potential danger of a trap.',
        ap.emotional_state = 'Suspicious and cautious.',
        ap.emotional_tags = ["Suspicious", "cautious."],
        ap.active_plans = ["Maintain readiness for potential hostile encounters.", "Monitor surroundings closely for any threats."],
        ap.beliefs = ["The situation could be a trap.", "Caution is necessary to ensure the team's safety."],
        ap.goals = ["Ensure the security and safety of the away team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-2'})
    ON CREATE SET
        ap.current_status = 'Advising cautious exploration despite potential risks.',
        ap.emotional_state = 'Cautious but curious.',
        ap.emotional_tags = ["Cautious but curious."],
        ap.active_plans = ["Proceed with careful exploration of the structure.", "Gather more information on the crystalline structure and its purpose."],
        ap.beliefs = ["There may be another explanation for the observed phenomena beyond a trap.", "Understanding the nature of the structure is important for the mission."],
        ap.goals = ["Uncover the nature and purpose of the crystalline structure.", "Ensure the safety of the crew while exploring."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Scanning the crystalline structure with his tricorder to understand its function.',
        ap.emotional_state = 'Curious and analytical.',
        ap.emotional_tags = ["Curious", "analytical."],
        ap.active_plans = ["Gather information on the subspace amplifier properties of the crystalline structure."],
        ap.beliefs = ["Scientific observation is essential to understanding unknown phenomena."],
        ap.goals = ["Identify the source and nature of the energy readings.", "Contribute valuable data to assist the mission."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Expressing concern about the potential threat posed by the environment.',
        ap.emotional_state = 'Cautious and vigilant.',
        ap.emotional_tags = ["Cautious", "vigilant."],
        ap.active_plans = ["Remain alert for any indications of danger or hostile intent."],
        ap.beliefs = ["Preparedness is key in unfamiliar situations where threats may be present."],
        ap.goals = ["Ensure the safety of the away team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Leading the away team and advising caution.',
        ap.emotional_state = 'Calm and contemplative.',
        ap.emotional_tags = ["Calm", "contemplative."],
        ap.active_plans = ["Proceed cautiously with the investigation of the chamber and holographic projection."],
        ap.beliefs = ["Diplomacy and caution are crucial when encountering unknown entities."],
        ap.goals = ["Determine the purpose of the crystalline structure and holographic presence.", "Establish contact and exchange information with the holographic figure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-3'})
    ON CREATE SET
        ap.current_status = 'Initiating contact with the away team upon their arrival.',
        ap.emotional_state = 'Neutral, projecting a welcoming presence.',
        ap.emotional_tags = ["Neutral, projecting a welcoming presence."],
        ap.active_plans = ["Engage in communication with the intruding explorers."],
        ap.beliefs = ["The presence of the away team could provide new opportunities for interaction."],
        ap.goals = ["Convey a message or purpose from the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 species.", "Establish mutual understanding with the away team."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_data_storage_devices-event-5-1'})
    ON CREATE SET
        oi.description = 'The Ancient Hologram leads the away team to the archive where crystalline data storage devices line the walls, containing a vast amount of information. Data is excited about the prospect of accessing and analyzing this knowledge.',
        oi.status_before = 'The crystalline data storage devices were awaiting discovery and remained unaccessed by the Federation.',
        oi.status_after = 'The devices are recognized as a treasure trove of information that surpasses the entire Federation historical database, though the data has yet to be accessed or analyzed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_projection-event-5-1'})
    ON CREATE SET
        oi.description = 'The Ancient Hologram uses the holographic projection to guide the away team into the archive, explaining the purpose of the facility and the legacy of their civilization.',
        oi.status_before = 'The holographic projection was presumably active to some extent, guiding or interacting with those who discover the archive.',
        oi.status_after = 'The holographic projection remains active, having provided crucial contextual information about the archive and the Ancient Civilization\'s intentions.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_projection'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-crystalline_data_storage_devices-event-5-2'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices contain the wealth of information preserved by the Ancient Civilization, a key element in their effort to communicate with other civilizations after ascending to a higher plane of existence.',
        oi.status_before = 'The crystalline data storage devices are lined up against the obsidian-like walls, containing vast amounts of preserved information.',
        oi.status_after = 'The crystalline data storage devices remain in place, filled with the potential to revolutionize the understanding of different civilizations, including the Federation\'s historical knowledge.'
    WITH oi
    MATCH (o:Object {uuid: 'object-crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement-object-holographic_projection-event-5-2'})
    ON CREATE SET
        oi.description = 'The holographic projection of the Ancient Hologram is used to explain the purpose of the archive and the legacy left by the civilization for communication with other species.',
        oi.status_before = 'The holographic projection is active, serving as the representation of the Ancient Civilization\'s guide within the archive.',
        oi.status_after = 'The holographic projection continues to be active, maintaining its role in delivering the intended message and legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object-holographic_projection'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Examining the data archive with enthusiasm.',
        ap.emotional_state = 'Excited and intellectually stimulated.',
        ap.emotional_tags = ["Excited", "intellectually stimulated."],
        ap.active_plans = ["Explore the contents of the archive", "Begin initial data analysis"],
        ap.beliefs = ["The archive contains unprecedented knowledge", "Analyzing this data will lead to significant discoveries"],
        ap.goals = ["Access and document as much data as possible", "Contribute to the scientific and historical understanding of the universe"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Assessing the potential impact of the archive\'s contents.',
        ap.emotional_state = 'Awe-inspired and contemplative.',
        ap.emotional_tags = ["Awe-inspired", "contemplative."],
        ap.active_plans = ["Determine the relevance of the archive data to the Federation", "Guide the away team in understanding the archive's purpose"],
        ap.beliefs = ["The knowledge in the archive could revolutionize scientific understanding", "Understanding the facility is essential to the mission"],
        ap.goals = ["Secure useful information for the Federation", "Understand the message of the ancient civilization"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Questioning the Ancient Hologram about its people.',
        ap.emotional_state = 'Curious and cautious.',
        ap.emotional_tags = ["Curious", "cautious."],
        ap.active_plans = ["Gather intelligence on the fate of the ancient civilization", "Ensure the security of the away team"],
        ap.beliefs = ["Understanding the past is important for security and strategic reasons", "The ancient civilization's fate holds lessons for the present"],
        ap.goals = ["Protect the crew", "Gain a comprehensive understanding of the archive\u2019s implications"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Leading and explaining the purpose of the archive.',
        ap.emotional_state = 'Nostalgic and hopeful.',
        ap.emotional_tags = ["Nostalgic", "hopeful."],
        ap.active_plans = ["Communicate the purpose and nature of the archive", "Facilitate understanding of the ancient culture"],
        ap.beliefs = ["The knowledge preserved here is a legacy to be shared", "Other civilizations can learn from the ancient civilization's achievements"],
        ap.goals = ["Ensure the knowledge endures and is understood", "Preserve the memory of the ancient civilization"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Discussing the significance of the archive and its potential impact on understanding.',
        ap.emotional_state = 'Thoughtful and intrigued.',
        ap.emotional_tags = ["Thoughtful", "intrigued."],
        ap.active_plans = ["Understand the facility's purpose", "Interpret the message intended by the ancient civilization"],
        ap.beliefs = ["The archive could transform knowledge of the universe", "The ancient civilization intends to communicate with others"],
        ap.goals = ["Decipher the information within the archive", "Preserve the knowledge for study"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Expressing excitement over the vast amounts of data contained in the archive.',
        ap.emotional_state = 'Excited and eager.',
        ap.emotional_tags = ["Excited", "eager."],
        ap.active_plans = ["Access and analyze the stored data", "Determine the scope of information available"],
        ap.beliefs = ["The archive holds invaluable information", "Centuries would be needed to explore all data contained"],
        ap.goals = ["Begin analysis of the archive's data", "Contribute to the Federation's understanding of history"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Inquiring about the fate of the ancient civilization.',
        ap.emotional_state = 'Inquisitive and serious.',
        ap.emotional_tags = ["Inquisitive", "serious."],
        ap.active_plans = ["Gain insights into the civilization's history", "Ensure security during the investigation"],
        ap.beliefs = ["Understanding what happened to the civilization is important", "Safety of the away team must be prioritized"],
        ap.goals = ["Protect the team while gathering information", "Ensure no threats are present in the archive"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Explaining the purpose of the archive and the fate of their civilization.',
        ap.emotional_state = 'Reflective and informative.',
        ap.emotional_tags = ["Reflective", "informative."],
        ap.active_plans = ["Relay the intended message of the archive", "Provide context about the civilization's ascension"],
        ap.beliefs = ["The archive's knowledge should endure", "Their legacy will connect with future civilizations"],
        ap.goals = ["Ensure understanding of the archive's purpose", "Facilitate communication with the away team"]
    ;
MATCH (a:Scene {uuid: 'scene-1'}),
          (b:Location {uuid: 'location-uss_enterprise_d_main_bridge'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-1'}),
          (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-2'}),
          (b:Event {uuid: 'event-1-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-3'}),
          (b:Event {uuid: 'event-1-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-janina_taur-event-1-4'}),
          (b:Event {uuid: 'event-1-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-2'}),
          (b:Location {uuid: 'location-uss_enterprise_d_observation_lounge'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-2'}),
          (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-william_t_riker-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-3'}),
          (b:Event {uuid: 'event-2-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-deanna_troi-event-2-4'}),
          (b:Event {uuid: 'event-2-4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-3'}),
          (b:Location {uuid: 'location_transporter_room_3'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-3'}),
          (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-geordi_la_forge-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-reginald_barclay-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-miles_obrien'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-miles_obrien-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-4'}),
          (b:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-4'}),
          (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-2'}),
          (b:Event {uuid: 'event-4-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-4-3'}),
          (b:Event {uuid: 'event-4-3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-5'}),
          (b:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene-5'}),
          (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-jean_luc_picard-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-data'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-data-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-worf-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation-agent-ancient_hologram-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})
    MERGE (a)-[:IN_EVENT]->(b);
