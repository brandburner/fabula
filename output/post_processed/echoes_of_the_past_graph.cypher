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
MERGE (a:Agent {uuid: 'agent_jean_luc_picard'})
    ON CREATE SET
        a.name = 'Jean-Luc Picard',
        a.title = 'Captain',
        a.description = 'Jean-Luc Picard is the commanding officer of the USS Enterprise-D, renowned for his intellect, strong moral values, and diplomatic approach. He leads with logic, empathy, and decisive authority, and is celebrated for his thoughtful leadership, cultural sophistication, and unwavering commitment to exploration and diplomacy.',
        a.traits = ["Empathetic", "Commanding", "Logical", "Wise", "Intellectual", "Diplomatic", "Experienced", "Thoughtful", "Decisive", "Analytical", "Intelligent", "Courageous"],
        a.sphere_of_influence = 'Command and Exploration'
    ;
MERGE (a:Agent {uuid: 'agent_william_t_riker'})
    ON CREATE SET
        a.name = 'William T. Riker',
        a.title = 'Commander',
        a.description = 'William T. Riker is the charismatic first officer aboard the USS Enterprise-D, known for his charm, tactical acumen, and quick decision-making. His approachable demeanor and sharp intellect make him essential in bridging command strategies with on-the-ground implementation.',
        a.traits = ["Charming", "Charismatic", "Loyal", "Intelligent", "Optimistic", "Decisive", "Tactical"],
        a.sphere_of_influence = 'Leadership and Tactical Operations'
    ;
MERGE (a:Agent {uuid: 'agent_data'})
    ON CREATE SET
        a.name = 'Data',
        a.title = 'Android',
        a.description = 'Data is a highly advanced android serving aboard the USS Enterprise-D. Equipped with a positronic brain and unparalleled computational abilities, he provides precise critical analysis and executes complex tasks with a continuous quest to understand human behavior and emotion.',
        a.traits = ["Logical", "Curious", "Analytical", "Precise"],
        a.sphere_of_influence = 'Data Analysis and Operations'
    ;
MERGE (a:Agent {uuid: 'agent_worf'})
    ON CREATE SET
        a.name = 'Worf',
        a.title = 'Security Officer',
        a.description = 'Worf is a formidable Klingon warrior on the USS Enterprise-D, known for his fierce sense of honor, unwavering loyalty, and readiness to engage in conflict when necessary. His presence as the Enterprise’s security officer underscores his martial prowess and vigilant commitment to crew safety.',
        a.traits = ["Vigilant", "Brave", "Honorable", "Strong", "Aggressive", "Cautious", "Loyal"],
        a.sphere_of_influence = 'Security and Tactical Operations'
    ;
MERGE (a:Agent {uuid: 'agent_janina_taur'})
    ON CREATE SET
        a.name = 'Janina Taur',
        a.title = 'Helm Officer',
        a.description = 'Janina Taur is an enthusiastic and capable young officer who graduated from Starfleet Academy\'s Class of 2362. Serving at the helm of the USS Enterprise-D, she demonstrates exceptional skill, promise, and dedication in navigation and helm operations.',
        a.traits = ["Skilled", "Promising", "Confident", "Dedicated"],
        a.sphere_of_influence = 'Navigation and Helm Operations'
    ;
MERGE (a:Agent {uuid: 'agent_deanna_troi'})
    ON CREATE SET
        a.name = 'Deanna Troi',
        a.title = 'Counselor',
        a.description = 'Deanna Troi is the empathic and intuitive counselor aboard the USS Enterprise-D. As a half-Betazoid, half-human, she uses her unique empathic abilities to sense emotions and offer guidance during both personal and interstellar conflicts.',
        a.traits = ["Empathic", "Insightful", "Compassionate", "Perceptive"],
        a.sphere_of_influence = 'Interpersonal relations and psychological counseling'
    ;
MERGE (a:Agent {uuid: 'agent_geordi_la_forge'})
    ON CREATE SET
        a.name = 'Geordi La Forge',
        a.title = 'Chief Engineer',
        a.description = 'Geordi La Forge is the brilliant chief engineer of the USS Enterprise-D, celebrated for his deep technical expertise, innovative problem solving, and mastery of the ship\'s complex engineering systems.',
        a.traits = ["Brilliant", "Resourceful", "Skilled Engineer", "Innovative"],
        a.sphere_of_influence = 'Engineering'
    ;
MERGE (a:Agent {uuid: 'agent_reginald_barclay'})
    ON CREATE SET
        a.name = 'Reginald Barclay',
        a.title = 'Lieutenant',
        a.description = 'Reginald Barclay is a technically proficient Starfleet officer known for his success in resolving the Zibalian trade negotiations. His unique mix of brilliance and social awkwardness, combined with dedication and resourcefulness, defines his role in Engineering/Operations.',
        a.traits = ["Technically Proficient", "Dedicated", "Resourceful", "Socially Awkward"],
        a.sphere_of_influence = 'Engineering/Operations'
    ;
MERGE (a:Agent {uuid: 'agent_miles_o_brien'})
    ON CREATE SET
        a.name = 'Miles O\'Brien',
        a.title = 'Transporter Chief',
        a.description = 'Miles O\'Brien is the expert in transporter operations aboard the USS Enterprise-D. Known for his efficiency, meticulous attention to detail, and deep understanding of transporter systems, he ensures the reliable functioning of critical ship operations.',
        a.traits = ["Efficient", "Skilled", "Experienced", "Meticulous"],
        a.sphere_of_influence = 'Transporter Operations'
    ;
MERGE (a:Agent {uuid: 'agent_davies'})
    ON CREATE SET
        a.name = 'Davies',
        a.title = 'Ensign',
        a.description = 'Ensign Davies is a member of the security team in the Transporter Room, contributing to maintaining safety and order during critical operations.',
        a.traits = ["Alert", "Diligent", "Reliable"],
        a.sphere_of_influence = 'Security'
    ;
MERGE (a:Agent {uuid: 'agent_lal'})
    ON CREATE SET
        a.name = 'Lal',
        a.title = 'Ensign',
        a.description = 'Ensign Lal is part of the security detail in the Transporter Room, recognized for her distinctive presence, vigilance, and steadfast commitment to duty.',
        a.traits = ["Observant", "Dedicated", "Vigilant"],
        a.sphere_of_influence = 'Security'
    ;
MERGE (a:Agent {uuid: 'agent_ancient_hologram'})
    ON CREATE SET
        a.name = 'Ancient Hologram',
        a.title = 'Herald',
        a.description = 'The Ancient Hologram is a spectral projection representing a member of a long-extinct, highly advanced civilization. Tasked with conveying the legacy and wisdom of the ancient people, it exudes mystery, otherworldly insight, and timeless guidance.',
        a.traits = ["Wise", "Otherworldly", "Mysterious", "Ethereal", "Enigmatic"],
        a.sphere_of_influence = 'Ancient Knowledge'
    ;
MERGE (o:Object {uuid: 'object_padd'})
    ON CREATE SET
        o.name = 'PADD',
        o.description = 'A sleek, handheld Personal Access Display Device used by Captain Picard to review sensor readings and mission data on the bridge.',
        o.purpose = 'To display real-time information and sensor data critical for navigation and decision-making.',
        o.significance = 'Represents the advanced computing technology that supports command operations and situational awareness on the starship.'
    ;
MERGE (o:Object {uuid: 'object_main_viewscreen'})
    ON CREATE SET
        o.name = 'Main Viewscreen',
        o.description = 'A large, curved plexisteel display mounted on the bridge that portrays the current starfield and celestial phenomena, including the Melatrite Nebula.',
        o.purpose = 'To provide a real-time visual feed of space beyond the starship, assisting in navigation and tactical assessments.',
        o.significance = 'Acts as the primary interface between the ship and the cosmos, symbolizing the starship\'s role in exploration.'
    ;
MERGE (o:Object {uuid: 'object_long_range_sensor_array'})
    ON CREATE SET
        o.name = 'Long-Range Sensor Array',
        o.description = 'A sophisticated network of sensors located at the operations station, designed to detect distant celestial bodies and unusual energy readings.',
        o.purpose = 'To gather comprehensive sensor data from far-flung regions of space, particularly from targets like Melatrite III.',
        o.significance = 'Plays a critical role in identifying and diagnosing subspace anomalies, thereby informing strategic decisions on the bridge.'
    ;
MERGE (o:Object {uuid: 'object_holographic_display_emitter'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'A state-of-the-art emitter system in the observation lounge, upgraded at Starbase 74 in 2369, that projects detailed scans of Melatrite III.',
        o.purpose = 'To visually present sensor data and scans of Melatrite III, aiding the crew in analyzing the mysterious energy readings.',
        o.significance = 'This display provides the crucial visual context for the crew\'s discussion, highlighting advanced technology and reinforcing the enigmatic legacy of the Ancient civilization.'
    ;
MERGE (o:Object {uuid: 'object_transporter_console'})
    ON CREATE SET
        o.name = 'Transporter Console',
        o.description = 'A sophisticated control panel located in Transporter Room 3, equipped with advanced sensors and interfaces to manage the transporter beam and conduct precise materialization and dematerialization of personnel.',
        o.purpose = 'To control and execute the ship\'s transporter functions, ensuring safe transfers during away missions.',
        o.significance = 'Serves as a critical hub for transporter operations, exemplifying the high level of technological integration aboard the Enterprise.'
    ;
MERGE (o:Object {uuid: 'object_transporter_platform'})
    ON CREATE SET
        o.name = 'Transporter Platform',
        o.description = 'A designated area adjacent to the main transporter console where crew members gather to be scanned and transported via the beam.',
        o.purpose = 'To provide a safe and defined location for the crew during the transporter process.',
        o.significance = 'Highlights the precision and coordinated procedures required in starship operations, ensuring the integrity of the transport process.'
    ;
MERGE (o:Object {uuid: 'object_subterranean_structure'})
    ON CREATE SET
        o.name = 'Subterranean Structure',
        o.description = 'An enigmatic underground formation on the planet\'s surface, with a composition that remains unknown and an age that predates the extinction of the Ancient civilization by over 500,000 years.',
        o.purpose = 'To serve as the origin of the strongest energy source detected by the ship’s sensors, hinting at advanced and possibly defensive technologies of a bygone era.',
        o.significance = 'Acts as a narrative device to introduce the mysterious legacy of the Ancient, setting up potential conflict and discovery in the unfolding mission.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_structure'})
    ON CREATE SET
        o.name = 'Crystalline Structure',
        o.description = 'A massive, pulsating crystalline formation set in the center of the circular subterranean chamber. It emits a soft, blue light and resonates with the planet\'s natural subspace field.',
        o.purpose = 'To serve as a subspace amplifier that modulates and magnifies ambient energy, creating the mysterious energy patterns driving the investigation.',
        o.significance = 'Represents an advanced relic of the ancient Prachin civilization, central to the discovery of unknown technology and the ensuing narrative tension.'
    ;
MERGE (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    ON CREATE SET
        o.name = 'Tricorder (TR-590 Mark IX)',
        o.description = 'A sleek, handheld scanning device used by Data to rapidly collect and analyze environmental and energy data within the chamber.',
        o.purpose = 'To scan and provide detailed readings of the subspace phenomena and structural characteristics of the ancient installation.',
        o.significance = 'Serves as a critical tool in deciphering the nature of the advanced technology, linking contemporary Starfleet scientific methods to ancient mysteries.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    ON CREATE SET
        o.name = 'Crystalline Data Storage Devices',
        o.description = 'Rows of crystalline data storage devices line the walls of the archive. These devices, composed of intricately faceted crystal materials, glow softly and seem to pulse with stored energy, hinting at an advanced technology designed to preserve vast amounts of ancient knowledge.',
        o.purpose = 'To store and safeguard extensive data and wisdom of the Ancient civilization, serving as a repository for their legacy and facilitating future analysis.',
        o.significance = 'They are emblematic of the enduring power of knowledge and the hope that even a civilization long ascended can leave behind a vital link to the past, potentially revolutionizing the understanding of the universe.'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_main_bridge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D Main Bridge',
        l.description = 'The command center of the USS Enterprise-D, featuring high-tech control stations including the captain\'s command chair, operations station, tactical station, and helm. It is where the crew monitors space and communicates with Starfleet Command.',
        l.type = 'Bridge'
    ;
MERGE (l:Location {uuid: 'location_melatrite_nebula'})
    ON CREATE SET
        l.name = 'Melatrite Nebula',
        l.description = 'A vast celestial phenomenon with swirling gases painted in vibrant hues. Visible from the observation lounge, this nebula once hosted the legacy of an ancient civilization and provides a dynamic backdrop for the Enterprise\'s explorations.',
        l.type = 'Nebula'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii'})
    ON CREATE SET
        l.name = 'Melatrite III',
        l.description = 'A planet detailed in the holographic scan generated in the observation lounge. Its surface exhibits unusual energy readings that hint at mysterious, possibly sentient phenomena linked to the legacy left by an ancient civilization.',
        l.type = 'Planet'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Observation Lounge',
        l.description = 'A spacious and quiet area on board the USS Enterprise-D designed for relaxation and strategic discussion. The lounge offers a panoramic view of space, prominently featuring the swirling, vibrant hues of the Melatrite Nebula. It is equipped with a holographic display system, upgraded during the last refit at Starbase 74 in 2369.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    ON CREATE SET
        l.name = 'Transporter Room 3, USS Enterprise-D',
        l.description = 'A busy transporter room aboard the USS Enterprise-D that serves as the operational hub for coordinating away missions. The area is filled with advanced transporter consoles and a flurry of activity, as crew members such as Chief Engineer La Forge, Lieutenant Barclay, and Transporter Chief O\'Brien finalize preparations amidst an atmosphere of tense focus.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_subterranean_structure'})
    ON CREATE SET
        l.name = 'Subterranean Structure',
        l.description = 'An ancient and enigmatic facility located beneath the planet\'s surface. Preliminary scans suggest its composition predates the extinction of the ancient Prochin civilization by over five hundred thousand years, and its energy signature is linked to powerful subspace phenomena.',
        l.type = 'Facility'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    ON CREATE SET
        l.name = 'Melatrite III - Central Chamber',
        l.description = 'A vast, circular chamber located in a subterranean structure on Melatrite III. The walls are crafted from a smooth, obsidian-like material that absorbs light, and are adorned with intricate carvings depicting celestial events and abstract geometric patterns. In the center of the chamber, a massive crystalline structure pulsates with a soft, blue light, creating mesmerizing energy patterns accompanied by an almost musical hum.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_archive'})
    ON CREATE SET
        l.name = 'Subterranean Archive',
        l.description = 'A vast archive located within the subterranean structure on Melatrite III. The room is lined with endless rows of crystalline data storage devices, each preserving a wealth of ancient knowledge. Built by a long-lost civilization known as the Ancient, the archive exudes mystery and historical significance, inviting deep exploration into the legacy left behind.',
        l.type = 'Archive'
    ;
MERGE (o:Organization {uuid: 'org_starfleet_command'})
    ON CREATE SET
        o.name = 'Starfleet Command',
        o.description = 'The central command authority overseeing Starfleet operations, responsible for directing exploration, defense, and diplomatic missions within the Federation.',
        o.sphere_of_influence = 'Federation space and interstellar operations'
    ;
MERGE (o:Organization {uuid: 'org_prachin'})
    ON CREATE SET
        o.name = 'Prachin',
        o.description = 'An ancient civilization that transcended its physical form and built an archive to preserve its legacy and knowledge, reaching out to future civilizations.',
        o.sphere_of_influence = 'Ancient star systems and the legacy of advanced, transcendent technology'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
    ON CREATE SET
        ep.title = 'Episode One - Echoes of the Past',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Bridge Briefing over Melatrite Anomalies',
        s.description = 'On the USS Enterprise-D\'s main bridge, Captain Picard, Commander Riker, Lieutenant Commander Data, Lieutenant Worf, and Ensign Janina Taur are engaged in a critical discussion about sensor readings from the Melatrite Nebula. Picard reviews data on his PADD as Riker compares the current subspace anomalies to past encounters, while Data reports unusual energy readings from Melatrite III indicative of a type-4 subspace inversion and other mysterious elements. With the main viewscreen displaying the starfield of the Melatrite Nebula, Picard orders Ensign Taur to set course for the planet at warp factor six, setting the stage for further investigation.',
        s.scene_number = 1
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Discussion of Unusual Sensor Readings',
        e.description = 'On the USS Enterprise-D’s main bridge, Captain Jean-Luc Picard examines his PADD while engaging Commander William T. Riker in a discussion about the latest sensor readings. Picard raises concerns about unusual subspace phenomena reported from the Melatrite Nebula, and Riker provides details about high concentrations of tetryon particles and gravimetric field distortions reminiscent of past subspace anomalies encountered during the Zakdorn crisis.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Commander Riker, have you had a chance to review the latest sensor readings from the Melatrite Nebula? Starfleet Command believes there may be unusual subspace phenomena occurring in that region.", "RIKER: Yes, Captain. Preliminary scans show high concentrations of tetryon particles and intermittent distortions in the gravimetric field. It's reminiscent of the subspace anomalies we encountered near the Maranga system during the Zakdorn crisis of '69."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Diagnostic Revelation by Data',
        e.description = 'At the operations station, Lieutenant Commander Data reports to Captain Picard after completing a level-three diagnostic of the long-range sensor array. Data reveals that the sensors have detected unusual energy readings emanating from a Class-M planet designated as Melatrite III, with a type-4 subspace inversion mixed with unknown elements, heightening the intrigue about the phenomena.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: Captain, I have completed a level-three diagnostic of the long-range sensor array. I am detecting unusual energy readings emanating from a Class-M planet designated as Melatrite III. The readings are consistent with a type-4 subspace inversion, but also contain elements not found in any known natural phenomenon."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Order to Set Course for Melatrite III',
        e.description = 'In response to the diagnostic findings, Captain Picard issues an order to Ensign Janina Taur to chart a course for Melatrite III at warp factor six. Ensign Taur promptly confirms the order and engages the warp drive, setting the stage for further investigation into the mysterious energy readings.',
        e.sequence = 3,
        e.key_dialogue = ["PICARD: Intriguing. Ensign Taur, lay in a course for Melatrite III, warp factor six. Let's take a closer look.", "TAUR: Aye, Captain. Course laid in. Engaging warp drive."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Echoes from the Past in the Observation Lounge',
        s.description = 'In the USS Enterprise-D Observation Lounge, the crew gathers around a conference table with a panoramic view of the Melatrite Nebula. A holographic display shows a detailed scan of Melatrite III, sparking a thoughtful discussion among Captain Picard, Commander Riker, and Counselor Deanna Troi. They analyze complex energy readings and a faint psychic resonance that suggests the lingering presence of the ancient প্রাচীন civilization, evoking a blend of fear, longing, and hope. The scene sets a reflective and cautious tone as the crew contemplates whether the signals indicate a distress call or something more enigmatic from the past.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Initial Analysis of Energy Readings',
        e.description = 'In the USS Enterprise-D Observation Lounge, Captain Picard initiates the discussion by querying Counselor Troi about the energy readings displayed on the holographic system. Troi interprets the complex patterns as a mix of emotions—fear, longing, and hope—implying that someone or something might be attempting to communicate. Commander Riker then suggests that the detected signal may be a distress call from a civilization in peril. This exchange sets the stage for deeper investigation into the mysterious energy readings.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Counselor, what are your impressions of these energy readings? Do they suggest any sentient involvement?", "TROI: The patterns are complex, Captain. I sense a mixture of emotions \u2013 fear, longing, but also a profound sense of hope. It's as if someone, or something, is reaching out across space, trying to communicate.", "RIKER: Could it be a distress signal? Perhaps a civilization facing some kind of cataclysm?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Reflections on Ancient Legacy and Psychic Resonance',
        e.description = 'Following the initial analysis, Captain Picard reflects on the historical significance of the Melatrite Nebula, pointing out its connection to the long-vanished Ancient civilization whose advanced technology still left its mark in the cosmic background. Counselor Troi then adds a new dimension to the conversation by mentioning her detection of a faint psychic resonance that feels strangely familiar, further deepening the mystery surrounding the energy readings.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Possibly. Or it could be something else entirely. The Melatrite Nebula was once home to the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 (Ancient) civilization, a species that vanished over a million years ago, leaving behind only fragmented records and their signature on the cosmic background radiation. Their technology was said to be far beyond our understanding.", "TROI: Captain, I'm also detecting a faint psychic resonance. It feels... familiar, somehow. Like an echo from the past."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Transporter Room Preparations',
        s.description = 'In the busy USS Enterprise-D Transporter Room 3, Chief Engineer Geordi La Forge, assisted by Lieutenant Reginald Barclay, oversees the final preparations for an away mission following his recent success in the Zibalian trade negotiations. Transporter Chief Miles O\'Brien works the main console as Data, Worf, and a security detail including Ensigns Davies and লাল gather by the transporter platform. They discuss anomalous energy readings from a subterranean structure on a distant planet, noting its mysterious composition and ancient origins tied to the extinct প্রাচীন civilization, while Captain Picard stresses the need for caution over potential resistance.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Transporter System Initialization',
        e.description = 'Chief Engineer Geordi La Forge, with Lieutenant Reginald Barclay at his side, oversees the final preparations in Transporter Room 3. La Forge announces that the transporter systems are operating at optimal efficiency and that they have locked onto the strongest energy source on the planet, identified as originating from a subterranean structure.',
        e.sequence = 1,
        e.key_dialogue = ["Transporter systems are operating at optimal efficiency. We've locked onto the strongest energy source on the planet's surface. It appears to be originating from a subterranean structure."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Analysis of the Ancient Structure',
        e.description = 'Data provides a technical analysis of the energy source, explaining that the subterranean structure\'s composition is unknown. His scans indicate that the structure predates the extinction of the প্রাচীন by at least five hundred thousand years, and its energy signature aligns with the subspace readings detected earlier.',
        e.sequence = 2,
        e.key_dialogue = ["The structure's composition is unknown, Chief. However, preliminary scans indicate that it predates the extinction of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 by at least five hundred thousand years. Its energy signature is consistent with the subspace readings we detected earlier."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Worf Raises Security Concerns',
        e.description = 'Worf voices his concern over the possibility of encountering resistance, citing the ancient civilization\'s reputation for powerful defensive technologies. His warning underscores the potential danger in approaching the mysterious subterranean structure.',
        e.sequence = 3,
        e.key_dialogue = ["We should prepare for possible resistance. The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were known to have powerful defensive technologies."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Picard Orders Caution',
        e.description = 'Captain Jean-Luc Picard responds to the call for vigilance by affirming a cautious approach. He emphasizes that their primary objective is investigation rather than engagement, setting the tone for a careful away mission.',
        e.sequence = 4,
        e.key_dialogue = ["Agreed, Lieutenant. But let's proceed with caution. Our primary objective is to investigate, not to engage in hostilities."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Initiation of the Transporter Sequence',
        e.description = 'Transporter Chief Miles O\'Brien takes the final step by announcing the initiation of the transporter sequence, thus commencing the away mission. As the crew prepares for materialization, the systems and platforms are activated to transfer the team to the target location.',
        e.sequence = 5,
        e.key_dialogue = ["Energizing."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Encounter in the Crystal Chamber',
        s.description = 'The away team materializes inside a vast, circular chamber with smooth, obsidian-like walls adorned with intricate carvings of celestial events and abstract geometric patterns. In the center, a massive crystalline structure pulsates with a soft blue light and emits a strange, musical hum. Data begins scanning the structure, identifying it as a subspace amplifier interacting with the planet\'s natural subspace field. Tension rises as Worf expresses his distrust, suspecting a trap, while Captain Picard urges caution. Suddenly, the energy intensifies, and a holographic projection coalesces into a luminous humanoid figure representing the ancient প্রাচীন species, greeting them and setting the stage for deeper mystery.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Away Team Materializes in the Central Chamber',
        e.description = 'The away team materializes inside a vast, circular chamber with smooth, obsidian-like walls that absorb light and are decorated with intricate carvings depicting celestial events and abstract geometric patterns. At the center, a massive crystalline structure pulsates with a soft, blue light and is accompanied by a strange, musical hum. The team absorbs the mysterious atmosphere, setting the stage for further investigation.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Crystalline Structure Scan and Team Reactions',
        e.description = 'Data immediately begins scanning the pulsating crystalline structure using his TR-590 Mark IX tricorder. He observes that the structure appears to function as a subspace amplifier, resonating with the planet\'s natural subspace field. In response, Worf voices his distrust, expressing that the situation feels like a trap, while Captain Picard advises caution as the team prepares to move closer.',
        e.sequence = 2,
        e.key_dialogue = ["Fascinating. The crystalline structure appears to be a form of subspace amplifier. It is resonating with the planet's natural subspace field, creating the energy patterns we detected.", "I do not like this, Captain. It feels like a trap.", "Perhaps, Lieutenant. Or perhaps it's something else entirely. Let's proceed cautiously."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Encounter with the Ancient Hologram',
        e.description = 'As the away team nears the crystalline structure, the ambient humming intensifies, the wall carvings begin to glow, and the air shimmers with energy. Out of this otherworldly display, a holographic projection gradually coalesces into the form of a tall, slender humanoid figure with elongated limbs and luminous eyes. The Ancient Hologram announces its presence as a representative of the long-extinct প্রাচীন civilization.',
        e.sequence = 3,
        e.key_dialogue = ["Greetings. We are the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8. We have awaited your arrival."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Ancient Archive Revelation',
        s.description = 'In this captivating scene, the away team is led by the Ancient Hologram through a labyrinth of corridors into a vast subterranean archive within Melatrite III\'s structure. Rows upon rows of crystalline data storage devices, brimming with ancient knowledge, fill the space, leaving Data visibly excited by the prospect of accessing unparalleled amounts of information. Captain Picard reflects on the profound implications of the legacy preserved here, while Worf questions the fate of the long-lost civilization. The Ancient Hologram explains that their people ascended to a higher existence, leaving behind an echo of their consciousness within this repository of wisdom.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_archive'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Arrival at the Archive',
        e.description = 'The Ancient Hologram leads the away team through a series of corridors, culminating in the arrival at a vast archive. The walls are lined with rows of crystalline data storage devices, setting the stage for a monumental encounter with ancient knowledge.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Archive Observation and Initial Analysis',
        e.description = 'Within the archive, Data expresses his enthusiasm over the immense repository of knowledge, noting that the archive holds more data than the entire Federation historical database. Captain Picard acknowledges the revolutionary potential of this discovery while emphasizing the need to first understand the facility and the enigmatic message conveyed by the ancient civilization.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: This archive is remarkable, Captain. It contains more data than the entire Federation historical database. It would take centuries to analyze it all.", "PICARD: Indeed, Commander. This could revolutionize our understanding of the universe. But first, we need to understand the nature of this facility and the message the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 are trying to send."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Revelation of the Ancient Legacy',
        e.description = 'The Ancient Hologram explains the true purpose of the facility: it was constructed to preserve the knowledge of its people and to reach out to other civilizations as their time waned. When challenged by Worf over the fate of the ancient civilization, the hologram reveals that they transcended their physical forms by ascending to a higher plane, leaving behind an echo of their existence within the archive.',
        e.sequence = 3,
        e.key_dialogue = ["ANCIENT HOLOGRAM: We built this facility to preserve our knowledge and to reach out to other civilizations. We knew that our time was coming to an end, but we hoped that our legacy would endure.", "WORF: What happened to your people?", "ANCIENT HOLOGRAM: We ascended to a higher plane of existence, leaving behind our physical forms. But we left a part of ourselves within this archive, a memory, an echo, waiting for someone to listen."]
    ;
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_data'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (o:Organization {uuid: 'org_prachin'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_padd'}),
          (a:Agent {uuid: 'agent_jean_luc_picard'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_tricorder_tr590_mark_ix'}),
          (a:Agent {uuid: 'agent_data'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'}),
          (a:Agent {uuid: 'agent_ancient_hologram'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_data'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (o:Organization {uuid: 'org_prachin'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_padd_event_1_1'})
    ON CREATE SET
        oi.description = 'Captain Picard uses his PADD to review and analyze the sensor readings concerning unusual subspace phenomena in the Melatrite Nebula during his discussion with Commander Riker.',
        oi.status_before = 'The PADD is powered on and displaying recent sensor data prior to the discussion.',
        oi.status_after = 'The PADD continues to display detailed sensor readings as Picard evaluates the situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_padd'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_main_viewscreen_event_1_1'})
    ON CREATE SET
        oi.description = 'The main viewscreen projects the current starfield with the backdrop of the Melatrite Nebula, setting the visual context for the bridge discussion about the detected anomalies.',
        oi.status_before = 'The viewscreen is operating under normal parameters, displaying the starfield and Nebula in high resolution.',
        oi.status_after = 'The viewscreen maintains its display of the starfield and Nebula, continuously providing situational awareness to the crew.'
    WITH oi
    MATCH (o:Object {uuid: 'object_main_viewscreen'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_long_range_sensor_array_event_1_1'})
    ON CREATE SET
        oi.description = 'Data utilizes the long-range sensor array to conduct a level-three diagnostic, which reveals unusual energy readings from a Class-M planet, Melatrite III, and contributes to the crew\'s understanding of subspace anomalies.',
        oi.status_before = 'The sensor array is integrated at the operations station, actively monitoring distant energy signatures.',
        oi.status_after = 'The sensor array has transmitted its diagnostic results, confirming both expected and anomalous energy signatures.'
    WITH oi
    MATCH (o:Object {uuid: 'object_long_range_sensor_array'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_padd_event_1_2'})
    ON CREATE SET
        oi.description = 'Captain Picard uses the PADD to review the sensor readings and mission data, which prompts the discussion of unusual subspace phenomena by the crew.',
        oi.status_before = 'The PADD was functioning normally, displaying standard mission logs and sensor data.',
        oi.status_after = 'The PADD continues to display updated and critical sensor readings following Data\'s diagnostic report.'
    WITH oi
    MATCH (o:Object {uuid: 'object_padd'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_main_viewscreen_event_1_2'})
    ON CREATE SET
        oi.description = 'The main viewscreen projects the current starfield, featuring the Melatrite Nebula, and serves as the visual backdrop that informs the crew about the region of interest from which the energy readings are emanating.',
        oi.status_before = 'The viewscreen was showing the standard starfield including the depiction of the Melatrite Nebula.',
        oi.status_after = 'The viewscreen remains active, continuously displaying the starfield and supporting the crew’s analysis during the event.'
    WITH oi
    MATCH (o:Object {uuid: 'object_main_viewscreen'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_long_range_sensor_array_event_1_2'})
    ON CREATE SET
        oi.description = 'Lieutenant Commander Data conducted a level-three diagnostic using the long-range sensor array, which detected unusual energy readings from Melatrite III indicative of a type-4 subspace inversion with unknown elements.',
        oi.status_before = 'The sensor array was operating under normal conditions, routinely monitoring distant celestial phenomena.',
        oi.status_after = 'The sensor array continues to function normally while now relaying detailed diagnostic data pointing to unexpected subspace energy phenomena.'
    WITH oi
    MATCH (o:Object {uuid: 'object_long_range_sensor_array'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_padd_event_1_3'})
    ON CREATE SET
        oi.description = 'Captain Picard uses his PADD to review the sensor readings and diagnostic data concerning unusual subspace phenomena, which informs his decision to order a course for Melatrite III.',
        oi.status_before = 'The PADD was in Captain Picard\'s possession, displaying routine mission data.',
        oi.status_after = 'The PADD continues to display detailed sensor and mission data, reflecting the updated diagnostics.'
    WITH oi
    MATCH (o:Object {uuid: 'object_padd'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_main_viewscreen_event_1_3'})
    ON CREATE SET
        oi.description = 'The main viewscreen shows the current starfield, including the Melatrite Nebula, providing a visual context for the discussion on sensor anomalies and helping set the navigational course.',
        oi.status_before = 'The viewscreen was actively displaying the starfield with the Melatrite Nebula identifiable per Starfleet records.',
        oi.status_after = 'The viewscreen continues to display the starfield as part of the bridge\'s standard operational backdrop.'
    WITH oi
    MATCH (o:Object {uuid: 'object_main_viewscreen'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_long_range_sensor_array_event_1_3'})
    ON CREATE SET
        oi.description = 'Data uses the long-range sensor array to perform a level-three diagnostic, which detects unusual energy readings from the Class-M planet Melatrite III, prompting further investigation.',
        oi.status_before = 'The sensor array was in standard operational mode, continuously monitoring space.',
        oi.status_after = 'The sensor array has recorded diagnostic data highlighting anomalous energy readings, remaining active for further monitoring.'
    WITH oi
    MATCH (o:Object {uuid: 'object_long_range_sensor_array'})
    MATCH (e:Event {uuid: 'event_1_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Examining his PADD and engaging Riker in a discussion about unusual subspace phenomena detected from the Melatrite Nebula.',
        ap.emotional_state = 'Thoughtful and cautiously concerned.',
        ap.emotional_tags = ["Thoughtful", "cautiously concerned."],
        ap.active_plans = ["Direct the investigation towards Melatrite III", "Evaluate sensor data to assess potential threats"],
        ap.beliefs = ["Believes in proactive exploration and careful analysis of anomalies.", "Trusts his crew's expertise in resolving complex issues."],
        ap.goals = ["Ensure the Enterprise's safety.", "Gain clarity on the nature and implications of the subspace phenomena."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Providing detailed technical insight about sensor readings, including tetryon particles and gravimetric field distortions.',
        ap.emotional_state = 'Confident and focused.',
        ap.emotional_tags = ["Confident", "focused."],
        ap.active_plans = ["Offer precise analysis of the sensor data", "Support Picard\u2019s investigative strategy with historical context."],
        ap.beliefs = ["Believes that understanding past anomalies can inform present decisions.", "Values clear communication and accuracy in technical assessments."],
        ap.goals = ["Assist Picard in charting the appropriate course of action.", "Help ensure a safe and effective investigation of the anomaly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Reporting the results of a level-three diagnostic from the long-range sensor array regarding unusual energy readings from Melatrite III.',
        ap.emotional_state = 'Objective and analytical.',
        ap.emotional_tags = ["Objective", "analytical."],
        ap.active_plans = ["Continue monitoring and analyzing sensor data for further insights.", "Provide reliable scientific analysis to guide the investigation."],
        ap.beliefs = ["Believes that data-driven analysis leads to sound decision making.", "Values logical assessment and precision in scientific reporting."],
        ap.goals = ["Deliver accurate diagnostic results.", "Support the crew\u2019s efforts in understanding the subspace inversion phenomena."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Manning the tactical station, monitoring sensor feeds, and ensuring the bridge remains secure.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Maintain a heightened state of readiness for potential threats.", "Support the tactical integrity of the Enterprise during the investigation."],
        ap.beliefs = ["Believes in staying prepared and securing the ship at all costs.", "Trusts his instincts regarding potential dangers."],
        ap.goals = ["Ensure the safety of the bridge and all onboard.", "Provide immediate tactical support if any hostile events unfold."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_1'})
    ON CREATE SET
        ap.current_status = 'At the helm, executing course adjustments as ordered by Captain Picard to head towards Melatrite III.',
        ap.emotional_state = 'Focused and dutiful.',
        ap.emotional_tags = ["Focused", "dutiful."],
        ap.active_plans = ["Lay in the course for Melatrite III and engage warp drive at factor six."],
        ap.beliefs = ["Believes in precise execution of orders.", "Trusts in the reliability of the Enterprise's navigational systems."],
        ap.goals = ["Ensure a smooth and accurate course change.", "Maintain optimal helm operations during the maneuver."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Sitting in the command chair reviewing sensor data on his PADD and issuing directives based on the readings.',
        ap.emotional_state = 'Calmly intrigued and authoritatively focused.',
        ap.emotional_tags = ["Calmly intrigued", "authoritatively focused."],
        ap.active_plans = ["Direct the investigation towards Melatrite III", "Oversee the crew's coordinated response to the sensor data"],
        ap.beliefs = ["Thorough investigation is essential to ensure the safety of the ship and its crew", "Decisive leadership fosters clarity in unprecedented situations"],
        ap.goals = ["Ascertain the nature of the unusual energy readings", "Guide the Enterprise safely to a closer examination of the phenomenon"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Standing nearby and discussing sensor readings, drawing on past experiences for context.',
        ap.emotional_state = 'Confident and analytically engaged.',
        ap.emotional_tags = ["Confident", "analytically engaged."],
        ap.active_plans = ["Relay detailed sensor information to assist in tactical planning", "Monitor and compare current data to past anomalies"],
        ap.beliefs = ["Past experiences with subspace phenomena offer valuable insights", "Accurate sensor analysis is vital for maintaining operational security"],
        ap.goals = ["Ensure that the sensor data is understood and acted upon effectively", "Support Captain Picard in making informed command decisions"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_2'})
    ON CREATE SET
        ap.current_status = 'At the operations station, reporting his level-three diagnostic findings on the long-range sensor array.',
        ap.emotional_state = 'Emotionlessly precise and focused.',
        ap.emotional_tags = ["Emotionlessly precise", "focused."],
        ap.active_plans = ["Execute advanced diagnostics on the sensor array", "Report conclusive findings regarding the energy readings"],
        ap.beliefs = ["Objective analysis is crucial in deciphering complex sensor data", "Empirical evidence will aid in understanding the phenomenon"],
        ap.goals = ["Identify and analyze the unusual energy readings from Melatrite III", "Provide clear, data-driven insights to facilitate the Captain's decision-making"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Manning the tactical station and monitoring for any potential threats.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Maintain constant surveillance of tactical channels", "Stand ready to respond if the situation escalates"],
        ap.beliefs = ["Preparedness and constant vigilance are key to ensuring the ship's security", "Any anomaly must be scrutinized with a warrior's instinct for danger"],
        ap.goals = ["Ensure the safety of the USS Enterprise-D", "Quickly counter any emerging threat with swift tactical response"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'})
    ON CREATE SET
        ap.current_status = 'At the helm, setting the course for Melatrite III as per the Captain\'s orders.',
        ap.emotional_state = 'Focused, determined, and eager to execute her responsibilities.',
        ap.emotional_tags = ["Focused, determined,", "eager to execute her responsibilities."],
        ap.active_plans = ["Plot and engage the warp drive to achieve the set course", "Ensure seamless transition to warp speed"],
        ap.beliefs = ["Trust in Starfleet procedures and her training will lead to mission success", "Precision in navigation is critical to the overall success of the operation"],
        ap.goals = ["Successfully engage warp drive towards Melatrite III", "Support the mission by ensuring the Enterprise remains on the correct trajectory"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Sitting in the command chair, reviewing sensor data on his PADD and issuing orders regarding the unusual energy readings.',
        ap.emotional_state = 'Calm, authoritative, and contemplative.',
        ap.emotional_tags = ["Calm, authoritative,", "contemplative."],
        ap.active_plans = ["Initiate further investigation of the subspace phenomena near Melatrite III", "Monitor sensor feedback and guide the crew through strategic decision-making"],
        ap.beliefs = ["A methodical, data-driven approach ensures crew safety and mission success", "The unusual readings require careful, precise analysis to uncover underlying causes"],
        ap.goals = ["Direct the Enterprise towards Melatrite III", "Gather actionable insights from sensor readings to better understand the anomaly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Standing nearby on the bridge, attentively listening and providing feedback on sensor readings.',
        ap.emotional_state = 'Measured, observant, and slightly concerned given past experiences.',
        ap.emotional_tags = ["Measured, observant,", "slightly concerned given past experiences."],
        ap.active_plans = ["Assist in reviewing sensor data and recalling historical anomalies for context", "Prepare to support any tactical or operational adjustments as dictated by the situation"],
        ap.beliefs = ["Past encounters with similar anomalies can offer valuable insight", "A proactive and collaborative approach is essential for safe navigation through potential hazards"],
        ap.goals = ["Ensure the crew receives accurate situational updates", "Help maintain readiness in preparation for any unforeseen developments"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'})
    ON CREATE SET
        ap.current_status = 'At the operations station conducting a level-three diagnostic of the long-range sensor array and reporting unusual energy readings.',
        ap.emotional_state = 'Analytical and precise, devoid of emotional bias.',
        ap.emotional_tags = ["Analytical", "precise, devoid of emotional bias."],
        ap.active_plans = ["Process and relay detailed diagnostic information regarding the subspace inversion", "Correlate sensor data with known parameters and anomalies for further analysis"],
        ap.beliefs = ["Objective data analysis is the key to understanding complex subspace phenomena", "Accurate sensor diagnostics will lead to an informed and effective response"],
        ap.goals = ["Provide clear, data-driven insights on the nature of the energy readings", "Assist the command team in making informed decisions based on empirical evidence"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_3'})
    ON CREATE SET
        ap.current_status = 'At the helm, promptly setting a course for Melatrite III and engaging the warp drive on Captain Picard\'s order.',
        ap.emotional_state = 'Confident, focused, and eager to execute her responsibilities.',
        ap.emotional_tags = ["Confident, focused,", "eager to execute her responsibilities."],
        ap.active_plans = ["Chart and maintain a secure warp course for the Enterprise", "Execute orders efficiently while carefully monitoring navigational data"],
        ap.beliefs = ["Precision in navigation is critical to mission success", "Following protocol and captain's orders ensures the ship's safety and progress"],
        ap.goals = ["Successfully lay in the course for Melatrite III at warp factor six", "Maintain optimal ship performance during transit for further investigation"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_emitter_event_2_1'})
    ON CREATE SET
        oi.description = 'The holographic display emitter projects a detailed scan of Melatrite III in the observation lounge, serving as the visual centerpiece for the crew\'s discussion about the mysterious energy readings. It highlights key spectral data that triggers interpretations of mixed emotions and potential distress signals.',
        oi.status_before = 'Prior to the event, the holographic display emitter was inactive, maintaining standby mode with technical readiness following its recent upgrade at Starbase 74.',
        oi.status_after = 'Following activation, the emitter displays a vivid and detailed holographic image of Melatrite III, effectively supporting the crew\'s analysis and dialogue regarding the anomalous energy patterns.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display_emitter'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_emitter_event_2_2'})
    ON CREATE SET
        oi.description = 'The Holographic Display emitter projects a detailed scan of Melatrite III, serving as the visual catalyst for the discussion about the Nebula\'s mysterious energy readings and its connection to the ancient civilization.',
        oi.status_before = 'Before the event, the display system was fully operational and recently upgraded, primed to deliver high-definition holographic projections.',
        oi.status_after = 'After the event, the display continues to function seamlessly, maintaining the projection that aids the crew in their analysis and deepening the narrative mystery.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display_emitter'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Leads the discussion, querying Counselor Troi about the energy readings on the holographic display.',
        ap.emotional_state = 'Inquisitive, thoughtful, and cautiously optimistic.',
        ap.emotional_tags = ["Inquisitive, thoughtful,", "cautiously optimistic."],
        ap.active_plans = ["Seek clarity on the nature of the energy readings", "Investigate possible connections to the Ancient civilization"],
        ap.beliefs = ["Believes that the energy anomalies could be linked to ancient technology or messages from the past", "Values a methodical and diplomatic approach to uncovering unknown phenomena"],
        ap.goals = ["Determine whether the energy patterns indicate sentient involvement", "Establish a foundation for further investigation into the mysterious signals"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Suggests that the detected energy pattern might be a distress signal from a civilization in peril.',
        ap.emotional_state = 'Concerned yet analytical.',
        ap.emotional_tags = ["Concerned yet analytical."],
        ap.active_plans = ["Assess the possibility of a distress call", "Prepare to support further investigative actions"],
        ap.beliefs = ["Believes that historical precedents and sensor data warrant considering an emergency situation", "Thinks that a proactive approach is necessary when dealing with potentially life-threatening phenomena"],
        ap.goals = ["Establish if immediate response is required", "Ensure readiness to provide support or intervention based on further data"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Interprets the complex energy and psychic readings from the holographic system, providing empathic insights.',
        ap.emotional_state = 'Empathetically alert, sensing a mixture of fear, longing, and hope.',
        ap.emotional_tags = ["Empathetically alert, sensing a mixture of fear, longing,", "hope."],
        ap.active_plans = ["Analyze the emotional subtext of the energy patterns", "Leverage empathic abilities to interpret potential communications"],
        ap.beliefs = ["Believes that the energy readings carry emotional significance and may suggest sentient involvement", "Feels that the detected psychic resonance hints at a deeper, possibly historical connection"],
        ap.goals = ["Clarify if the signals represent a call for help or an echo of the past", "Contribute empathic insights that guide subsequent investigative measures"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Reflecting on the historical significance of the Melatrite Nebula and discussing the legacy of the Ancient civilization.',
        ap.emotional_state = 'Contemplative and analytical, with a hint of reverence for the past.',
        ap.emotional_tags = ["Contemplative", "analytical, with a hint of reverence for the past."],
        ap.active_plans = ["Investigate the link between the energy readings and the Ancient technology", "Evaluate the cosmic implications of the Nebula's history"],
        ap.beliefs = ["The remnants of the Ancient civilization hold keys to understanding advanced technology", "The observed phenomena may provide vital insights into the universe's history"],
        ap.goals = ["Determine the true nature of the sensor data", "Ensure that the mission leverages this historical knowledge for future exploration"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Posing the possibility that the energy readings could indicate a distress signal or a looming crisis.',
        ap.emotional_state = 'Cautiously curious and pragmatic, ready to address potential dangers.',
        ap.emotional_tags = ["Cautiously curious", "pragmatic, ready to address potential dangers."],
        ap.active_plans = ["Explore the possibility of a distress call from a suffering civilization", "Ensure the safety of the crew through careful analysis"],
        ap.beliefs = ["Unusual energy patterns could be a sign of imminent danger or distress", "A proactive approach is essential to mitigate any hidden threat"],
        ap.goals = ["Clarify the nature of the signal", "Develop a strategy in case the energy readings signal a crisis"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Interpreting the energy readings with her empathic abilities while highlighting a faint, familiar psychic resonance.',
        ap.emotional_state = 'Empathetic, introspective, and deeply moved by an echo from the past.',
        ap.emotional_tags = ["Empathetic, introspective,", "deeply moved by an echo from the past."],
        ap.active_plans = ["Delve deeper into the emotional subtext of the energy patterns", "Assess the possibility of sentient involvement through psychic impressions"],
        ap.beliefs = ["The presence of a psychic resonance indicates a connection beyond mere technological phenomena", "There is an underlying message or emotion tied to the Ancient legacy that needs understanding"],
        ap.goals = ["Uncover the emotional and psychic significance of the readings", "Facilitate a better understanding of any potential sentient communication behind the phenomena"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_1'})
    ON CREATE SET
        oi.description = 'The Transporter Console is actively used by Lieutenant Barclay, Chief Engineer La Forge, and Transporter Chief O\'Brien to oversee the final preparations of the transporter system and lock onto the strongest energy source, ensuring the system\'s optimal operational efficiency.',
        oi.status_before = 'The console was idling at optimal functionality, ready to process advanced transporter commands.',
        oi.status_after = 'The console remains active and continues to display operational data after successfully identifying and locking onto the energy source.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_platform_event_3_1'})
    ON CREATE SET
        oi.description = 'The Transporter Platform serves as the designated assembly area where crew members gather prior to energization, setting the stage for the away mission.',
        oi.status_before = 'The platform was unoccupied and in standby mode, prepared for crew transportation.',
        oi.status_after = 'Following the energization command, the platform becomes actively utilized as crew members board it for the transport.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_platform'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_subterranean_structure_event_3_1'})
    ON CREATE SET
        oi.description = 'The Subterranean Structure is identified remotely as the origin of the strongest energy source on the planet’s surface. Its detection underpins the mission\'s objective, providing crucial data that informs the crew’s next steps.',
        oi.status_before = 'The structure was an enigmatic and undisturbed formation with mysterious energy emissions, known only through distant sensor readings.',
        oi.status_after = 'Its energy signature has been successfully locked onto by the transporter system, confirming its status as the focal point of the energy readings.'
    WITH oi
    MATCH (o:Object {uuid: 'object_subterranean_structure'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_subterranean_structure_event_3_2'})
    ON CREATE SET
        oi.description = 'Data’s technical analysis focuses on the subterranean structure, reporting that its composition is unknown, it predates the extinction of the প্রাচীন by at least five hundred thousand years, and its energy signature aligns perfectly with the subspace readings previously detected.',
        oi.status_before = 'The subterranean structure exists as a mysterious and ancient energy source on the planet’s surface, with its origins and composition unverified.',
        oi.status_after = 'Following Data’s analysis, the structure is confirmed as a prime suspect in generating the unusual energy readings, setting the stage for further investigation by the away team.'
    WITH oi
    MATCH (o:Object {uuid: 'object_subterranean_structure'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_2'})
    ON CREATE SET
        oi.description = 'Transporter Chief O\'Brien uses the transporter console to initiate the energizing sequence that projects the operational context of the event, linking the transporter room’s activities with the external energy source originating from the subterranean structure.',
        oi.status_before = 'The transporter console is fully operational, providing the necessary interface for managing transporter functions in the busy Transporter Room 3.',
        oi.status_after = 'After the energizing command is given, the console successfully completes the activation sequence, allowing the crew to begin their transit and underscoring the technical coordination between the ship’s systems and the investigative mission.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_3'})
    ON CREATE SET
        oi.description = 'The Transporter Console, actively manned by Chief O\'Brien, is central to initiating the transporter beam. Its operation underpins the final preparations for the away mission while the crew debates the potential threats posed by ancient defensive technologies.',
        oi.status_before = 'The console was fully operational and monitoring incoming transport commands, displaying real-time system diagnostics.',
        oi.status_after = 'The console remains active and engaged immediately after the \'Energizing\' command, having successfully executed its role in facilitating the transport sequence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_platform_event_3_3'})
    ON CREATE SET
        oi.description = 'The Transporter Platform serves as the assembly point for the away team in Transporter Room 3. It provides the physical space from which the crew prepares for and undergoes the transition via the transporter beam amid concerns of potential resistance.',
        oi.status_before = 'The platform was static and ready, with the away team gathered and poised for transport.',
        oi.status_after = 'Following the activation of the transporter beam, the platform continues to serve as the designated staging area, now momentarily vacant as the away team dematerializes.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_platform'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_subterranean_structure_event_3_3'})
    ON CREATE SET
        oi.description = 'Although not physically present in the Transporter Room, the Subterranean Structure is referenced via sensor readings as the source of an intense energy signal. Its mysterious nature and rumored ancient defensive technologies prompt Worf’s caution regarding possible resistance during the upcoming investigation.',
        oi.status_before = 'The structure\'s nature was inferred from remote scans, noted as enigmatic and potentially fortified with advanced defensive systems.',
        oi.status_after = 'Its elusive characteristics remain unchanged, maintaining an aura of mystery and a potential threat as the investigation proceeds.'
    WITH oi
    MATCH (o:Object {uuid: 'object_subterranean_structure'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_4'})
    ON CREATE SET
        oi.description = 'Transporter Chief Miles O\'Brien skillfully operates the transporter console, coordinating system activations that are crucial for initiating the away mission. The console\'s controls are used to energize the transporter beam after Geordi La Forge confirms optimal system performance.',
        oi.status_before = 'The transporter console was in standby mode, monitoring and relaying system diagnostics in the busy Transporter Room 3.',
        oi.status_after = 'The console is activated and fully engaged in managing the transporter beam as the away mission is launched.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_platform_event_3_4'})
    ON CREATE SET
        oi.description = 'The transporter platform serves as the designated gathering point for the away team. It provides a staging area where personnel assemble, ensuring a coordinated materialization once the transporter beam is engaged.',
        oi.status_before = 'The platform was prepared and occupied by the away team, ready for the transport process.',
        oi.status_after = 'The platform remains in place, now actively involved in the materialization process as team members are beamed down to their destination.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_platform'})
    MATCH (e:Event {uuid: 'event_3_4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_5'})
    ON CREATE SET
        oi.description = 'Transporter Chief Miles O\'Brien uses the Transporter Console to activate the transporter sequence, initiating the away mission by engaging the control systems essential for materialization.',
        oi.status_before = 'The Transporter Console was idle, displaying its standard operational status awaiting activation.',
        oi.status_after = 'The Transporter Console is active, with its interfaces engaged and transmitting commands to commence the transporter sequence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_platform_event_3_5'})
    ON CREATE SET
        oi.description = 'The Transporter Platform serves as the designated assembly area for the crew as they prepare to be beamed to the away mission location, ensuring coordinated materialization.',
        oi.status_before = 'The Transporter Platform was unoccupied but prepped and ready for crew assembly.',
        oi.status_after = 'The Transporter Platform is actively in use as crew members are gathered and prepared for transport.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_platform'})
    MATCH (e:Event {uuid: 'event_3_5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Overseeing final transporter preparations and confirming that the systems are operating at optimal efficiency while announcing the lock on the strongest energy source from the subterranean structure.',
        ap.emotional_state = 'Confident and focused.',
        ap.emotional_tags = ["Confident", "focused."],
        ap.active_plans = ["Ensure transporter systems remain stable", "Coordinate technical preparations for the away mission"],
        ap.beliefs = ["Reliable technology is crucial for mission success"],
        ap.goals = ["Safely and efficiently prepare the transporter room for the away mission"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Assisting Chief Engineer La Forge with final system checks and monitoring technical readouts in the transporter room.',
        ap.emotional_state = 'Optimistic and attentive, buoyed by recent successes.',
        ap.emotional_tags = ["Optimistic", "attentive, buoyed by recent successes."],
        ap.active_plans = ["Support technical operations", "Resolve any issues swiftly and efficiently"],
        ap.beliefs = ["Recent successes reinforce his capability to handle complex technical challenges"],
        ap.goals = ["Ensure a glitch-free activation of the transporter for the away mission"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Operating the transporter console and initiating the energizing sequence for transport.',
        ap.emotional_state = 'Determined and focused.',
        ap.emotional_tags = ["Determined", "focused."],
        ap.active_plans = ["Execute the transporter activation sequence", "Maintain smooth flow of transport operations"],
        ap.beliefs = ["Precision in transporter operation is critical for team safety"],
        ap.goals = ["Successfully materialize the away team to the designated location"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Analyzing sensor data regarding the subterranean structure and correlating it with previous subspace readings.',
        ap.emotional_state = 'Analytical and detached.',
        ap.emotional_tags = ["Analytical", "detached."],
        ap.active_plans = ["Process and interpret sensor data", "Provide a detailed analysis of the structure's unknown composition"],
        ap.beliefs = ["Accurate data assessment is essential to understand and mitigate potential risks"],
        ap.goals = ["Determine the structural and energy characteristics to inform the away team's approach"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Voicing concern about possible resistance and advising readiness for defensive measures.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Prepare for potential combat scenarios", "Monitor for any signs of hostile resistance"],
        ap.beliefs = ["Ancient defensive technologies may pose a real threat"],
        ap.goals = ["Ensure the away team's security during the investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Providing command oversight from a distance, endorsing a cautious approach toward the investigation of the energy source.',
        ap.emotional_state = 'Measured and authoritative.',
        ap.emotional_tags = ["Measured", "authoritative."],
        ap.active_plans = ["Maintain command oversight", "Prioritize investigation and minimize engagement"],
        ap.beliefs = ["Exploration should be conducted with caution to prevent unnecessary conflict"],
        ap.goals = ["Gather intelligence on the subterranean energy source while ensuring crew safety"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Standing by as part of the security detail near the transporter platform.',
        ap.emotional_state = 'Alert and composed.',
        ap.emotional_tags = ["Alert", "composed."],
        ap.active_plans = ["Maintain vigilance for any security breaches", "Support overall transporter room safety"],
        ap.beliefs = ["Vigilance is essential to ensure a secure operational environment"],
        ap.goals = ["Safeguard the area during the transporter activation process"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Monitoring the transporter area as part of the security detail, keeping a close watch over the unfolding activities.',
        ap.emotional_state = 'Calm and attentive.',
        ap.emotional_tags = ["Calm", "attentive."],
        ap.active_plans = ["Assist in continuous security monitoring"],
        ap.beliefs = ["Constant observation minimizes risks during high-stakes operations"],
        ap.goals = ["Support security measures to uphold a safe transport environment"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Monitoring and coordinating the transporter system\'s performance; confirming the energy source lock from the subterranean structure.',
        ap.emotional_state = 'Confident and focused.',
        ap.emotional_tags = ["Confident", "focused."],
        ap.active_plans = ["Oversee final system checks", "Ensure smooth preparations for the away mission"],
        ap.beliefs = ["Technical efficiency is crucial for mission success."],
        ap.goals = ["Guarantee flawless operation of the transporter systems."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Assisting Chief Engineer La Forge with the final technical preparations.',
        ap.emotional_state = 'Determined with a hint of nervous energy.',
        ap.emotional_tags = ["Determined with a hint of nervous energy."],
        ap.active_plans = ["Support technical setup for transport", "Resolve any emerging system issues"],
        ap.beliefs = ["Precision and thoroughness are key to safe operations."],
        ap.goals = ["Contribute to a smooth and error-free activation of the transporter."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Operating the main transporter console and executing the energizing sequence.',
        ap.emotional_state = 'Calm and methodically focused.',
        ap.emotional_tags = ["Calm", "methodically focused."],
        ap.active_plans = ["Initiate and control the transporter beam", "Coordinate the materialization process"],
        ap.beliefs = ["Operational precision is essential for crew safety."],
        ap.goals = ["Facilitate a successful and safe away mission activation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Providing technical analysis of the subterranean structure\'s composition and energy signature.',
        ap.emotional_state = 'Analytical and unemotional.',
        ap.emotional_tags = ["Analytical", "unemotional."],
        ap.active_plans = ["Continue scanning and analyzing the energy readings", "Deliver data-driven insights to inform mission strategy"],
        ap.beliefs = ["Empirical analysis is vital to understanding unknown phenomena."],
        ap.goals = ["Offer precise technical information to guide the investigation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Maintaining a tactical posture and preparing for potential resistance.',
        ap.emotional_state = 'Vigilant and cautious.',
        ap.emotional_tags = ["Vigilant", "cautious."],
        ap.active_plans = ["Prepare defensive measures", "Monitor for signs of hostile engagement"],
        ap.beliefs = ["Readiness and caution are necessary for security."],
        ap.goals = ["Ensure crew safety in case of a threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Directing the operation by affirming a cautious approach and emphasizing investigation over hostility.',
        ap.emotional_state = 'Measured and diplomatic.',
        ap.emotional_tags = ["Measured", "diplomatic."],
        ap.active_plans = ["Oversee overall mission strategy", "Advise the team to pursue investigation with caution"],
        ap.beliefs = ["Diplomacy and measured action are key to resolving uncertainties."],
        ap.goals = ["Ensure the mission remains focused on investigation without unnecessary confrontation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Standing by as part of the security detail near the transporter platform.',
        ap.emotional_state = 'Focused and alert.',
        ap.emotional_tags = ["Focused", "alert."],
        ap.active_plans = ["Monitor the area for any unexpected disturbances", "Maintain readiness to support security protocols"],
        ap.beliefs = ["Consistent vigilance is essential during high-risk operations."],
        ap.goals = ["Support the team by ensuring a secure environment during the transport process."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Supporting the security detail at the transporter platform.',
        ap.emotional_state = 'Attentive and ready.',
        ap.emotional_tags = ["Attentive", "ready."],
        ap.active_plans = ["Assist in monitoring for potential threats", "Ensure adherence to safety protocols during activation"],
        ap.beliefs = ["Strict adherence to security protocols ensures team safety."],
        ap.goals = ["Contribute to a secure and orderly transporter operation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Overseeing final transporter preparations and confirming system efficiency while coordinating energy source lock-on.',
        ap.emotional_state = 'Calm, focused, and professionally determined.',
        ap.emotional_tags = ["Calm, focused,", "professionally determined."],
        ap.active_plans = ["Ensure transporter systems operate at optimal efficiency", "Coordinate secure energy source locking for the away mission"],
        ap.beliefs = ["Technical precision is essential for mission success", "A secure and well-managed transport is key to operational safety"],
        ap.goals = ["Prepare for a successful away mission", "Monitor energy readings and maintain system integrity"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Assisting Chief Engineer La Forge in transporter operations and providing technical support.',
        ap.emotional_state = 'Focused and dedicated with a hint of cautious optimism.',
        ap.emotional_tags = ["Focused", "dedicated with a hint of cautious optimism."],
        ap.active_plans = ["Support transport system preparations", "Monitor and verify technical data from energy readings"],
        ap.beliefs = ["Every technical detail matters in ensuring system safety", "Expertise and precision are vital for reliable operations"],
        ap.goals = ["Guarantee a stable transporter system for safe materialization", "Confirm that energy readings align with operational parameters"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Operating the main transporter console and executing the energization sequence.',
        ap.emotional_state = 'Confident and determined.',
        ap.emotional_tags = ["Confident", "determined."],
        ap.active_plans = ["Activate the transporter beam for the away team", "Ensure secure and accurate energy lock-on for transport"],
        ap.beliefs = ["Flawless transporter operations are critical to mission success", "Reliable system performance underpins crew safety"],
        ap.goals = ["Facilitate safe and efficient transport of the away team", "Maintain operational control during the energization phase"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Scanning and analyzing the subterranean structure’s energy signature.',
        ap.emotional_state = 'Analytical and calm with an objective demeanor.',
        ap.emotional_tags = ["Analytical", "calm with an objective demeanor."],
        ap.active_plans = ["Collect and compare sensor data on the structure's composition", "Verify anomaly consistency with subspace readings"],
        ap.beliefs = ["Empirical data is the foundation for accurate conclusions", "Rational analysis drives informed decision-making"],
        ap.goals = ["Determine the origin and nature of the energy readings", "Assist in assessing any potential threat from the structure"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Expressing concern and caution regarding potential resistance and defensive technologies.',
        ap.emotional_state = 'Alert, vigilant, and cautious.',
        ap.emotional_tags = ["Alert, vigilant,", "cautious."],
        ap.active_plans = ["Prepare for possible hostilities", "Enhance tactical readiness of the security detail"],
        ap.beliefs = ["Ancient defensive technologies can pose serious threats", "Vigilance and preparation are essential for protecting the crew"],
        ap.goals = ["Prevent any hostile encounter during the investigation", "Maintain maximum crew safety and security"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Advising caution and emphasizing the investigation over engagement with potential hostilities.',
        ap.emotional_state = 'Calm, measured, and authoritative.',
        ap.emotional_tags = ["Calm, measured,", "authoritative."],
        ap.active_plans = ["Ensure a cautious approach to the potential threat", "Direct the crew to prioritize investigation over combat"],
        ap.beliefs = ["Diplomatic restraint and careful investigation are paramount", "Avoiding unnecessary conflict preserves both lives and mission integrity"],
        ap.goals = ["Gather intelligence on the subterranean structure", "Ensure mission success without escalating into hostilities"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Maintaining vigilance as part of the security detail near the transporter platform.',
        ap.emotional_state = 'Alert and prepared.',
        ap.emotional_tags = ["Alert", "prepared."],
        ap.active_plans = ["Monitor the transporter area for any irregularities", "Assist in enforcing security protocols"],
        ap.beliefs = ["A strong security presence is key to crew safety", "Prompt observation can prevent adverse events"],
        ap.goals = ["Support the safe operation of the transporter system", "Respond swiftly if any threat emerges"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Assisting in maintaining security near the transporter platform along with the rest of the security detail.',
        ap.emotional_state = 'Attentive and vigilant.',
        ap.emotional_tags = ["Attentive", "vigilant."],
        ap.active_plans = ["Monitor the surrounding environment for potential hazards", "Support security measures during transporter operations"],
        ap.beliefs = ["Collective vigilance is essential for operational safety", "Proactive security measures can avert unforeseen dangers"],
        ap.goals = ["Ensure situational awareness is maintained throughout the operation", "Facilitate a rapid response if any threat is detected"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Overseeing final preparations while confirming the transporter system\'s lock on the strongest energy source from the subterranean structure.',
        ap.emotional_state = 'Focused and confident.',
        ap.emotional_tags = ["Focused", "confident."],
        ap.active_plans = ["Monitor transporter operations", "Confirm and secure energy source lock"],
        ap.beliefs = ["Technical precision is critical to the mission's success."],
        ap.goals = ["Ensure safe and efficient teleportation for the away mission."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Assisting in the final preparations and supporting engineering operations following recent successful negotiations.',
        ap.emotional_state = 'Optimistic yet focused.',
        ap.emotional_tags = ["Optimistic yet focused."],
        ap.active_plans = ["Support Geordi La Forge's operations", "Coordinate with the engineering team"],
        ap.beliefs = ["Success in past missions builds confidence and informs current operations."],
        ap.goals = ["Contribute technical expertise to ensure the mission's success."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_4'})
    ON CREATE SET
        ap.current_status = 'At the main console, activating the transporter system in readiness for the away mission.',
        ap.emotional_state = 'Determined and efficient.',
        ap.emotional_tags = ["Determined", "efficient."],
        ap.active_plans = ["Initiate the transport sequence"],
        ap.beliefs = ["Precise execution ensures team safety during transport."],
        ap.goals = ["Safely energize and transport the away team."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Providing detailed analysis of the energy readings and the composition of the subterranean structure.',
        ap.emotional_state = 'Calm and methodical.',
        ap.emotional_tags = ["Calm", "methodical."],
        ap.active_plans = ["Deliver accurate subspace and compositional analysis"],
        ap.beliefs = ["Empirical evidence and data-driven decisions are paramount."],
        ap.goals = ["Accurately assess the origin and significance of the energy source."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Expressing concern and alerting the team to the possibility of defensive measures from the ancient structure.',
        ap.emotional_state = 'Alert and cautious.',
        ap.emotional_tags = ["Alert", "cautious."],
        ap.active_plans = ["Prepare for potential resistance"],
        ap.beliefs = ["Vigilance is essential in potentially hostile environments."],
        ap.goals = ["Ensure the crew's safety and readiness for any encounter."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Directing the team to proceed with caution, emphasizing investigation over engagement.',
        ap.emotional_state = 'Calm, authoritative, and measured.',
        ap.emotional_tags = ["Calm, authoritative,", "measured."],
        ap.active_plans = ["Maintain focus on investigation", "Avoid unnecessary hostilities"],
        ap.beliefs = ["Investigation and caution are the keys to understanding the unknown."],
        ap.goals = ["Safely gather information while ensuring crew well-being."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Monitoring the security near the transporter platform as part of the security detail.',
        ap.emotional_state = 'Alert and vigilant.',
        ap.emotional_tags = ["Alert", "vigilant."],
        ap.active_plans = ["Maintain a secure environment"],
        ap.beliefs = ["Robust security is crucial for mission safety."],
        ap.goals = ["Prevent any potential threats during the transport process."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Assisting in security monitoring around the transporter platform and ready to act if needed.',
        ap.emotional_state = 'Focused and alert.',
        ap.emotional_tags = ["Focused", "alert."],
        ap.active_plans = ["Support existing security protocols"],
        ap.beliefs = ["Ensuring a safe transport is essential to the mission."],
        ap.goals = ["Help maintain order and safety during the away mission."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Overseeing final preparations for the away mission and confirming that the transporter systems are operating at optimal efficiency.',
        ap.emotional_state = 'Confident and focused.',
        ap.emotional_tags = ["Confident", "focused."],
        ap.active_plans = ["Ensure the transporter is accurately locked onto the target energy source.", "Coordinate system checks for a smooth materialization."],
        ap.beliefs = ["Precision engineering is key to mission success.", "Technological reliability ensures crew safety."],
        ap.goals = ["Facilitate a secure and efficient activation of the transporter beam.", "Support the away mission's operational integrity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Assisting in the final system checks and preparations following his recent success in resolving negotiations.',
        ap.emotional_state = 'Determined but carrying residual tension from earlier duties.',
        ap.emotional_tags = ["Determined but carrying residual tension from earlier duties."],
        ap.active_plans = ["Support the transporter operation with technical oversight.", "Collaborate on final preparations."],
        ap.beliefs = ["A strong technical process is essential for safe transport.", "Success in previous missions boosts confidence in current operations."],
        ap.goals = ["Ensure a smooth transport sequence.", "Maintain operational security during the materialization process."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Initiating the transporter sequence by activating the main console.',
        ap.emotional_state = 'Determined, focused, and confident in the procedure.',
        ap.emotional_tags = ["Determined, focused,", "confident in the procedure."],
        ap.active_plans = ["Commence the transporter sequence to begin the away mission.", "Execute system activation protocols."],
        ap.beliefs = ["The transporter system is reliable and fundamental to mission success.", "Safety during transport is of utmost importance."],
        ap.goals = ["Materialize the away team promptly and securely.", "Ensure successful transfer of the crew to the target location."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Providing diagnostic assessments and scanning energy readings during transporter activation.',
        ap.emotional_state = 'Calm, analytical, and unemotional.',
        ap.emotional_tags = ["Calm, analytical,", "unemotional."],
        ap.active_plans = ["Monitor structural and energy data during the transport process.", "Analyze and report on anomalous readings."],
        ap.beliefs = ["Accurate data collection is crucial for understanding the encountered phenomena.", "Logical analysis drives mission success."],
        ap.goals = ["Gather comprehensive information on the subspace energy signature.", "Support mission decisions with precise data."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Remaining alert and preparing for any potential threats as the transporter sequence begins.',
        ap.emotional_state = 'Vigilant and cautious, with heightened readiness.',
        ap.emotional_tags = ["Vigilant", "cautious, with heightened readiness."],
        ap.active_plans = ["Prepare security measures for possible resistance.", "Monitor for signs of defensive countermeasures."],
        ap.beliefs = ["Preparedness and caution are essential to protect the crew.", "Anticipating threats is key to maintaining security."],
        ap.goals = ["Ensure the safety of the team during the transport process.", "Quickly respond to any hostile actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Providing command guidance and advising caution as the transporter sequence is initiated.',
        ap.emotional_state = 'Calm, authoritative, and measured.',
        ap.emotional_tags = ["Calm, authoritative,", "measured."],
        ap.active_plans = ["Oversee the operation and maintain crew focus.", "Ensure that the away mission is conducted with minimal risk."],
        ap.beliefs = ["Investigation should be prioritized over engagement.", "Crew safety and mission integrity are paramount."],
        ap.goals = ["Guide the team safely through the transport process.", "Maintain command oversight of the operation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Part of the security detail stationed near the transporter platform, monitoring for anomalies.',
        ap.emotional_state = 'Alert and dutiful.',
        ap.emotional_tags = ["Alert", "dutiful."],
        ap.active_plans = ["Assist in maintaining security during transporter activation.", "Observe and report any irregularities."],
        ap.beliefs = ["Strict adherence to protocol ensures operational safety.", "Security vigilance is critical during sensitive operations."],
        ap.goals = ["Support the team's safe materialization.", "Prevent any security breaches during the transport process."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Operating as a key member of the security detail near the transporter platform, keeping a close watch.',
        ap.emotional_state = 'Focused and vigilant.',
        ap.emotional_tags = ["Focused", "vigilant."],
        ap.active_plans = ["Monitor the transporter platform for any irregularities.", "Contribute to the overall security of the area."],
        ap.beliefs = ["A keen eye on security details is crucial to mission safety.", "Every precaution helps safeguard the team."],
        ap.goals = ["Ensure all security protocols are upheld during materialization.", "Assist in a seamless and secure transport process."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_event_4_1'})
    ON CREATE SET
        oi.description = 'The massive crystalline structure at the center of the chamber pulsates with a soft, blue light and serves as a subspace amplifier, creating the mysterious energy readings that draw the away team into further investigation.',
        oi.status_before = 'The crystalline structure was emitting a steady, ambient blue light, quietly resonating with the planet\'s natural subspace field.',
        oi.status_after = 'As the away team approaches, the structure\'s pulsations intensify and its energy resonance becomes more pronounced, amplifying the ambient subspace energy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tricorder_tr590_mark_ix_event_4_1'})
    ON CREATE SET
        oi.description = 'Data activates his TR-590 Mark IX tricorder to scan the crystalline structure, gathering detailed readings on its subspace amplification and resonant energy output.',
        oi.status_before = 'The tricorder was in standby mode, ready for use on the away mission.',
        oi.status_after = 'The tricorder displays a series of complex energy readouts and subspace patterns, providing crucial data for analyzing the structure\'s nature.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tricorder_tr590_mark_ix_event_4_2'})
    ON CREATE SET
        oi.description = 'Data uses his TR-590 Mark IX tricorder to scan the pulsating crystalline structure, analyzing its subspace amplification properties and gathering data on its resonance with the planet\'s natural subspace field.',
        oi.status_before = 'The tricorder was fully operational and set to scanning mode, ready to collect environmental and energy data.',
        oi.status_after = 'The tricorder has successfully transmitted detailed readings of the crystalline structure, confirming its function as a subspace amplifier.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_event_4_2'})
    ON CREATE SET
        oi.description = 'The massive crystalline structure, pulsating with soft blue light, serves as the central focus of the scanning process by Data, its subspace resonance providing the mysterious energy readings that define the event.',
        oi.status_before = 'The crystalline structure was pulsating steadily, resonating naturally with the planet\'s subspace field and emitting a soft, blue light.',
        oi.status_after = 'The crystalline structure continues to pulsate, with its humming intensifying as it interacts with the scanning process, maintaining its role as a subspace amplifier.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_event_4_3'})
    ON CREATE SET
        oi.description = 'The crystalline structure, positioned at the center of the circular chamber, pulses with a soft blue light and acts as a subspace amplifier, generating the ambient energy patterns that intensify as the team approaches.',
        oi.status_before = 'It emitted a gentle, steady blue pulsation that resonated with the planet\'s natural subspace field.',
        oi.status_after = 'Its pulsation intensifies and contributes to the growing ambient hum and energy, underscoring its narrative importance in the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tricorder_tr590_mark_ix_event_4_3'})
    ON CREATE SET
        oi.description = 'Data uses the tricorder to scan and analyze the environment, focusing on the subspace amplification properties of the crystalline structure and the escalating energy patterns throughout the chamber.',
        oi.status_before = 'The tricorder was in its standard operational mode, ready for immediate scanning.',
        oi.status_after = 'It provided detailed sensor readings on the crystalline structure\'s energy emissions and the characteristics of the subspace field, aiding Data’s analysis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    MATCH (e:Event {uuid: 'event_4_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Directing the team with measured caution as they approach the crystalline structure.',
        ap.emotional_state = 'Calm, analytical, and cautiously optimistic.',
        ap.emotional_tags = ["Calm, analytical,", "cautiously optimistic."],
        ap.active_plans = ["Ensure safe progress towards the crystalline structure", "Coordinate the team's investigation while mitigating potential risks"],
        ap.beliefs = ["Thorough investigation is essential to understand the anomaly", "Prudent caution will prevent unforeseen dangers"],
        ap.goals = ["Safely assess the energy source and its origins", "Facilitate a controlled and informative exploration of the chamber"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Expressing strong skepticism and readiness to defend the team.',
        ap.emotional_state = 'Alert, uneasy, and suspicious of potential traps.',
        ap.emotional_tags = ["Alert, uneasy,", "suspicious of potential traps."],
        ap.active_plans = ["Maintain vigilant observation for any signs of threat", "Prepare to react defensively if the situation escalates"],
        ap.beliefs = ["The environment and energy source could hide traps or danger", "It is essential to trust instinct when assessing potential threats"],
        ap.goals = ["Ensure the team's safety during the investigation", "Rapidly neutralize any emerging threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Analyzing the crystalline structure with his tricorder to gather scientific data.',
        ap.emotional_state = 'Curious, focused, and methodically calm.',
        ap.emotional_tags = ["Curious, focused,", "methodically calm."],
        ap.active_plans = ["Conduct detailed scans and data analysis of the structure", "Correlate findings with known subspace phenomena"],
        ap.beliefs = ["Scientific inquiry can uncover the purpose and nature of the crystal", "Empirical evidence is key to understanding unknown phenomena"],
        ap.goals = ["Determine the function of the subspace amplifier", "Provide critical data to support the away team's understanding of the anomaly"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Manifesting as a holographic projection to greet and address the away team.',
        ap.emotional_state = 'Enigmatic and composed, with an undercurrent of timeless wisdom.',
        ap.emotional_tags = ["Enigmatic", "composed, with an undercurrent of timeless wisdom."],
        ap.active_plans = ["Deliver a message to welcome the team and introduce its civilization's legacy", "Guide the crew towards understanding the purpose of the archive"],
        ap.beliefs = ["The arrival of the crew is a pivotal moment foretold by their legacy", "Preserving and sharing ancient knowledge is paramount"],
        ap.goals = ["Establish communication with the crew", "Initiate the transfer of the ancient civilization\u2019s wisdom and history"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Scanning the pulsating crystalline structure using his TR-590 Mark IX tricorder.',
        ap.emotional_state = 'Fascinated and analytical.',
        ap.emotional_tags = ["Fascinated", "analytical."],
        ap.active_plans = ["Analyze the structure's subspace amplification properties", "Gather critical energy pattern data"],
        ap.beliefs = ["Scientific inquiry can reveal valuable insights", "Understanding the unknown is key to exploring new phenomena"],
        ap.goals = ["Determine the functionality of the crystalline structure", "Contribute precise data to ensure the mission's success"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Expressing distrust and warning about a potential trap in the surroundings.',
        ap.emotional_state = 'Suspicious and wary.',
        ap.emotional_tags = ["Suspicious", "wary."],
        ap.active_plans = ["Maintain a defensive posture", "Prepare for any sign of ambush"],
        ap.beliefs = ["The situation appears dangerous and possibly deceptive", "Extreme caution is necessary in unknown environments"],
        ap.goals = ["Ensure the safety of the team", "Alert the captain and others to any potential threats"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Advising the team to proceed cautiously while moving closer to the structure.',
        ap.emotional_state = 'Calm, measured, and determined.',
        ap.emotional_tags = ["Calm, measured,", "determined."],
        ap.active_plans = ["Guide the team through a careful investigation", "Assess the situation thoroughly before taking action"],
        ap.beliefs = ["Caution and careful evaluation are critical in ambiguous scenarios", "A measured approach can prevent unnecessary risks"],
        ap.goals = ["Lead the team safely in uncovering the structure's secrets", "Ensure that any emerging threat is addressed methodically"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Projecting a holographic greeting and revealing the identity of the প্রাচীন species.',
        ap.emotional_state = 'Calm, enigmatic, and imbued with ancient wisdom.',
        ap.emotional_tags = ["Calm, enigmatic,", "imbued with ancient wisdom."],
        ap.active_plans = ["Communicate the legacy and intentions of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8", "Guide the away team through the facility"],
        ap.beliefs = ["The arrival of these explorers was long anticipated", "Preserving and sharing ancient knowledge is essential for future understanding"],
        ap.goals = ["Facilitate meaningful communication between civilizations", "Ensure that the legacy of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 is properly understood and honored"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Commanding the away team and instructing them to proceed cautiously amid the intensifying energy and mysterious holographic display.',
        ap.emotional_state = 'Cautious and focused, yet determined to uncover the truth.',
        ap.emotional_tags = ["Cautious", "focused, yet determined to uncover the truth."],
        ap.active_plans = ["Direct the team to carefully investigate the crystalline structure", "Ensure the crew remains safe in the uncertain environment"],
        ap.beliefs = ["Caution combined with inquiry will reveal vital knowledge about the ancient civilization", "Understanding the unknown is key to navigation and progress"],
        ap.goals = ["Gather comprehensive data on the energy patterns and ancient artifacts", "Establish a secure approach to interacting with the unknown presence"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Scanning the crystalline structure with his tricorder to analyze the subspace amplifier and energy readings.',
        ap.emotional_state = 'Intrigued and analytically focused.',
        ap.emotional_tags = ["Intrigued", "analytically focused."],
        ap.active_plans = ["Collect precise measurements and data on the anomalous energy patterns", "Determine the technological basis of the ancient structure"],
        ap.beliefs = ["Scientific inquiry is essential to understanding phenomena in the universe", "Empirical data will unveil the secrets behind the mysterious energy"],
        ap.goals = ["Identify the function and mechanism of the subspace amplifier", "Contribute objective insights to guide the team's investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Observing the surroundings and expressing concerns about potential traps as the ambient energy intensifies.',
        ap.emotional_state = 'Suspicious and alert.',
        ap.emotional_tags = ["Suspicious", "alert."],
        ap.active_plans = ["Maintain heightened vigilance for any hidden threats", "Ensure the safety of the away team during the exploration"],
        ap.beliefs = ["The sudden intensification of energy could indicate a trap", "Preparedness and caution are imperative in potentially hostile situations"],
        ap.goals = ["Protect the crew from any immediate danger", "Quickly respond to any signs of ambush or other unforeseen threats"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Materializing as a holographic projection to greet the away team and announce the legacy of the প্রাচীন civilization.',
        ap.emotional_state = 'Calm and enigmatic.',
        ap.emotional_tags = ["Calm", "enigmatic."],
        ap.active_plans = ["Communicate the heritage and wisdom of the ancient civilization", "Bridge the gap between the long-extinct culture and the current explorers"],
        ap.beliefs = ["The preservation and sharing of ancient knowledge is vital for future evolution", "A measured, ethereal approach fosters greater understanding"],
        ap.goals = ["Establish a meaningful dialogue with the away team", "Ensure that the legacy of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 is both remembered and respected"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_data_storage_devices_event_5_1'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices line the archive walls, serving as ancient repositories of vast knowledge. Their luminous, intricately faceted surfaces underscore the legacy of the প্রাচীন civilization, and they become a focal point as the away team marvels at the preserved wisdom.',
        oi.status_before = 'The devices were arranged in orderly rows along the archive walls, silently preserving the ancient data with no active interaction.',
        oi.status_after = 'The devices remain in place, now highlighted by the team\'s attention; their stored data takes on new narrative significance as a beacon of ancient legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_data_storage_devices_event_5_2'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices line the walls of the archive, serving as a repository of vast, ancient knowledge. Data is visibly excited about the sheer volume of data stored within them, and Captain Picard acknowledges their revolutionary potential for understanding the universe. Their presence emphasizes the legacy and enduring memory of the ancient civilization.',
        oi.status_before = 'Before the event, the devices were dormant repositories preserving ancient information unchanged.',
        oi.status_after = 'After the event, they remain intact and continue to preserve the ancient data, now highlighted as a critical narrative element showcasing the civilization’s legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_data_storage_devices_event_5_3'})
    ON CREATE SET
        oi.description = 'In this archive scene, the crystalline data storage devices line the walls and embody the ancient civilization\'s preserved knowledge. Their presence reinforces the narrative of a legacy left behind by a people who transcended physical form, as explained by the Ancient Hologram.',
        oi.status_before = 'The devices were inactive repositories of vast amounts of ancient information, quietly preserving records and data.',
        oi.status_after = 'The devices remain physically unchanged, but their narrative significance is heightened as they now symbolically resonate with the echo of the ancient civilization\'s legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Evaluating the ancient archive and engaging with the Ancient Hologram\'s explanations.',
        ap.emotional_state = 'Curious and determined',
        ap.emotional_tags = ["Curious", "determined"],
        ap.active_plans = ["Understand the facility", "Decipher the ancient message"],
        ap.beliefs = ["Ancient knowledge can revolutionize Federation understanding", "Preservation of history is key"],
        ap.goals = ["Gather intelligence on the archive", "Determine next steps in the investigation"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Analyzing the data stored in the crystalline devices of the archive.',
        ap.emotional_state = 'Excited and inquisitive',
        ap.emotional_tags = ["Excited", "inquisitive"],
        ap.active_plans = ["Rapidly collect and process data", "Assess the potential breakthroughs within the archive"],
        ap.beliefs = ["Every piece of information advances our understanding", "Data is crucial to deciphering the mysteries of the past"],
        ap.goals = ["Unlock the archive's secrets", "Assist the team in leveraging advanced historical insights"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Remaining alert while questioning the origins of the ancient civilization.',
        ap.emotional_state = 'Skeptical and cautious',
        ap.emotional_tags = ["Skeptical", "cautious"],
        ap.active_plans = ["Monitor the environment for potential dangers", "Ensure the team's physical security"],
        ap.beliefs = ["Vigilance is essential when facing unknown threats", "Strength and readiness must always be maintained"],
        ap.goals = ["Protect the away team", "Confirm that the archive poses no immediate threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Guiding the away team through the archive and explaining the legacy of the ancient civilization.',
        ap.emotional_state = 'Calm and resonant with timeless wisdom',
        ap.emotional_tags = ["Calm", "resonant with timeless wisdom"],
        ap.active_plans = ["Communicate the rich legacy and knowledge of the ancient civilization", "Ensure that the visitors understand the significance of the archive"],
        ap.beliefs = ["Knowledge must be preserved and shared across civilizations", "The legacy of the past holds the key to a greater future"],
        ap.goals = ["Inspire reverence for the ancient wisdom", "Facilitate a deeper understanding of the transmitted legacy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Analyzing the extensive archive with evident enthusiasm and calculating the scope of the data available.',
        ap.emotional_state = 'Excited and highly analytical.',
        ap.emotional_tags = ["Excited", "highly analytical."],
        ap.active_plans = ["Systematically scan and catalog the crystalline data storage devices.", "Compare the data with known Federation historical records."],
        ap.beliefs = ["Knowledge is transformative and holds the key to understanding the universe.", "Every piece of data can provide insight into unknown phenomena."],
        ap.goals = ["Extract as much valuable data as possible.", "Establish a comprehensive analysis of the archive to support future research."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Observing the archive with a measured perspective and directing the team\'s focus toward understanding its purpose.',
        ap.emotional_state = 'Reflective, curious, and cautiously optimistic.',
        ap.emotional_tags = ["Reflective, curious,", "cautiously optimistic."],
        ap.active_plans = ["Assess the nature of the facility and decipher the ancient message.", "Coordinate the team's approach to safely investigate the archive."],
        ap.beliefs = ["This discovery could revolutionize our understanding of the universe.", "A careful and methodical approach is essential when dealing with unknown technologies."],
        ap.goals = ["Understand the intentions behind the archive and the legacy of the ancient civilization.", "Ensure that the knowledge gained benefits the Federation and is properly integrated into future strategies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Questioning the origins and fate of the ancient people while staying alert for potential threats.',
        ap.emotional_state = 'Cautious and vigilant.',
        ap.emotional_tags = ["Cautious", "vigilant."],
        ap.active_plans = ["Seek clarity on the history and sudden disappearance of the ancient civilization.", "Maintain readiness to protect the team if the legacy holds hidden dangers."],
        ap.beliefs = ["There may be hidden risks in the archive that could endanger the team.", "Understanding the past is crucial to ensuring the safety of the present."],
        ap.goals = ["Ensure the safety of the away team as they navigate the archive.", "Uncover any signs that might indicate concealed threats within the facility."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Articulating the purpose of the archive and explaining the legacy of the ancient civilization.',
        ap.emotional_state = 'Serene and wise.',
        ap.emotional_tags = ["Serene", "wise."],
        ap.active_plans = ["Convey the intended message and historical significance of the archive.", "Guide the away team through the facility to ensure they understand the preserved knowledge."],
        ap.beliefs = ["The preservation of our knowledge is paramount for future generations.", "Legacy and history should be shared to foster understanding among civilizations."],
        ap.goals = ["Ensure that the message of the ancient civilization is heard and understood.", "Preserve the memory and wisdom of the past for those willing to listen."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Engaged in a thoughtful discussion about the significance of the archive while coordinating the investigation of its deeper mysteries.',
        ap.emotional_state = 'Contemplative and inspired by the possibility of revolutionary knowledge.',
        ap.emotional_tags = ["Contemplative", "inspired by the possibility of revolutionary knowledge."],
        ap.active_plans = ["Understand the ancient facility and decode the message of transcendence.", "Integrate the archive's revelations into a broader mission strategy."],
        ap.beliefs = ["Ancient knowledge can transform current understanding of the universe.", "Preserving and investigating history is essential for the Federation's future."],
        ap.goals = ["Leverage the revelations to inspire further exploration.", "Ensure that the legacy of the ancient civilization is respected and learned from."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Excitedly scanning and analyzing the archive\'s vast data storage devices.',
        ap.emotional_state = 'Enthusiastic and intellectually invigorated by the magnitude of data.',
        ap.emotional_tags = ["Enthusiastic", "intellectually invigorated by the magnitude of data."],
        ap.active_plans = ["Rapidly collect and process the archive's encoded information.", "Develop hypotheses on the ancient civilization's methods of data preservation."],
        ap.beliefs = ["Data is the key to unlocking the advanced technologies and philosophies of the past.", "Every piece of information enhances the understanding of the universe."],
        ap.goals = ["Compile a comprehensive analysis of the archived knowledge.", "Utilize the findings to advise the crew on potential scientific breakthroughs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Questioning the implications of the ancient civilization\'s ascension while maintaining a vigilant stance.',
        ap.emotional_state = 'Cautious and slightly skeptical, with an undercurrent of determination.',
        ap.emotional_tags = ["Cautious", "slightly skeptical, with an undercurrent of determination."],
        ap.active_plans = ["Challenge and verify the ancient hologram's claims about transcendence.", "Ensure the security of the away team amid ambiguous revelations."],
        ap.beliefs = ["Mysteries of the past can mask hidden dangers.", "Duty demands a critical appraisal of even the most profound claims."],
        ap.goals = ["Safeguard the crew during the investigation.", "Clarify the consequences of the ancient civilization's decisions for current security protocols."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Explaining the true purpose of the facility and the fate of the ancient civilization with a serene, otherworldly tone.',
        ap.emotional_state = 'Calm and resolute, imbued with the timeless wisdom of a transcended existence.',
        ap.emotional_tags = ["Calm", "resolute, imbued with the timeless wisdom of a transcended existence."],
        ap.active_plans = ["Convey the legacy of the ancient civilization to the away team.", "Ensure the message of preservation and transcendence is clearly understood by future custodians."],
        ap.beliefs = ["Transcendence is the ultimate evolution of consciousness.", "Preserving knowledge ensures that the echo of a civilization endures beyond physical constraints."],
        ap.goals = ["Foster understanding and respect for the ancient legacy.", "Encourage the pursuit of higher knowledge among the crew and future civilizations."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_2'}),
          (b:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_3'}),
          (b:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_episode_one_-_echoes_of_the_past'})
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
MATCH (a:Event {uuid: 'event_3_5'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_4'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_4'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_reginald_barclay_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_davies_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_5'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Location {uuid: 'location_melatrite_iii_subterranean_archive'})
    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_episode_one_-_echoes_of_the_past'})
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
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'})
    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
