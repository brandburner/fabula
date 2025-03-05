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
        a.title = 'None',
        a.description = 'Jean-Luc Picard is the commanding officer of the USS Enterprise-D, renowned for his reflective wisdom and decisive leadership. In this moment, his calm composure and thoughtful inquiry underscore a mind that balances deep knowledge with genuine curiosity about the mysteries they uncover. His measured approach and unwavering dedication to duty reveal a leader who values diplomacy and exploration while remaining open to the profound lessons history and culture impart.',
        a.traits = ["Wise", "Authoritative", "Empathetic", "Contemplative"],
        a.sphere_of_influence = 'Interstellar exploration and command'
    ;
MERGE (a:Agent {uuid: 'agent_william_t_riker'})
    ON CREATE SET
        a.name = 'William T. Riker',
        a.title = 'Commander',
        a.description = 'William T. Riker is the first officer of the USS Enterprise-D, noted for his warm charm, strategic acumen, and intuitive decision-making. His balanced mix of confidence and approachability makes him an essential counterpart to Captain Picard. Riker demonstrates an ability to manage complex situations with a mix of pragmatism and optimism, ensuring the crew remains cohesive and resolute in the face of adversity.',
        a.traits = ["charming", "strategic", "resourceful", "optimistic"],
        a.sphere_of_influence = 'tactical operations and crew management'
    ;
MERGE (a:Agent {uuid: 'agent_data'})
    ON CREATE SET
        a.name = 'Data',
        a.title = 'None',
        a.description = 'Data is an android of remarkable analytical capability and insatiable curiosity. In this scene, his excitement at confronting a vast repository of ancient knowledge underscores his commitment to understanding both the technical and philosophical mysteries of the universe. His logical approach is balanced by a subtle yearning to experience and comprehend human emotions, making him a unique bridge between computation and consciousness in the service of exploration.',
        a.traits = ["Analytical", "Curious", "Logical", "Methodical"],
        a.sphere_of_influence = 'Science and technology analysis'
    ;
MERGE (a:Agent {uuid: 'agent_worf'})
    ON CREATE SET
        a.name = 'Worf',
        a.title = 'None',
        a.description = 'Worf is a vigilant and battle-hardened officer whose presence exudes strength and caution. In this archive setting, his guarded questions and keen senses reflect a seasoned warrior always alert to potential danger. His stoic demeanor and deep commitment to honor and duty highlight a personality forged by both Klingon heritage and Starfleet discipline, ensuring that every step into the unknown is met with a readiness to defend his crew.',
        a.traits = ["Vigilant", "Honorable", "Courageous", "Wary"],
        a.sphere_of_influence = 'Tactical operations and security'
    ;
MERGE (a:Agent {uuid: 'agent_janina_taur'})
    ON CREATE SET
        a.name = 'Janina Taur',
        a.title = 'Ensign',
        a.description = 'Janina Taur is a promising young officer freshly graduated from Starfleet Academy’s Class of 2362. Serving at the helm of the Enterprise-D, she is noted for her exemplary skill in navigation and quick thinking under pressure. Her fresh perspectives and dedication to duty reflect both her academic excellence and her potential for future leadership.',
        a.traits = ["Diligent", "Intelligent", "Optimistic", "Precise"],
        a.sphere_of_influence = 'Navigation and ship piloting'
    ;
MERGE (a:Agent {uuid: 'agent_deanna_troi'})
    ON CREATE SET
        a.name = 'Deanna Troi',
        a.title = 'Counselor',
        a.description = 'Deanna Troi serves as the USS Enterprise-D\'s counselor, uniquely gifted with empathic abilities that allow her to sense the emotional undercurrents of those around her. Her sensitivity to subtle emotional cues and psychic resonances provides invaluable insight during both personal interactions and critical decision-making processes. Troi’s deep connection to the crew and her intuitive grasp of the human condition make her a pivotal influence in bridging the gap between logic and feeling.',
        a.traits = ["empathetic", "perceptive", "intuitive", "insightful"],
        a.sphere_of_influence = 'emotional intelligence and interpersonal counseling'
    ;
MERGE (a:Agent {uuid: 'agent_geordi_la_forge'})
    ON CREATE SET
        a.name = 'Geordi La Forge',
        a.title = 'Chief Engineer',
        a.description = 'Geordi La Forge is the innovative chief engineer responsible for the flawless operation of the Enterprise-D’s advanced technological systems. With an exceptional technical mind and calm under pressure, he orchestrates complex operations, from routine maintenance to critical mission preparations in the transporter room. His leadership and ingenuity in troubleshooting keep the ship running at peak efficiency.',
        a.traits = ["innovative", "technically adept", "calm", "resourceful"],
        a.sphere_of_influence = 'Engineering and technical operations'
    ;
MERGE (a:Agent {uuid: 'agent_reginald_barclay'})
    ON CREATE SET
        a.name = 'Reginald Barclay',
        a.title = 'Lieutenant',
        a.description = 'Reginald Barclay is a talented lieutenant celebrated for his brilliant engineering mind and his recent success in resolving the Zibalian trade negotiations. Despite occasionally displaying social awkwardness, his determination and technical prowess consistently prove invaluable. His contributions in high-pressure situations underscore his commitment to excellence and his role as an indispensable support officer aboard the Enterprise-D.',
        a.traits = ["brilliant", "dedicated", "resilient", "innovative"],
        a.sphere_of_influence = 'Engineering support and problem resolution'
    ;
MERGE (a:Agent {uuid: 'agent_miles_obrien'})
    ON CREATE SET
        a.name = 'Miles O\'Brien',
        a.title = 'Transporter Chief',
        a.description = 'Miles O\'Brien is an experienced transporter chief on the Enterprise-D, renowned for his efficiency and steady management of the ship\'s transporter systems. His expertise ensures that the dematerialization and rematerialization processes occur flawlessly, safeguarding the crew during away missions. With practiced precision and calm determination, he plays a critical role in maintaining communication between the ship and its away teams.',
        a.traits = ["efficient", "experienced", "resourceful", "steady"],
        a.sphere_of_influence = 'Transporter operations and ship communications'
    ;
MERGE (a:Agent {uuid: 'agent_davies'})
    ON CREATE SET
        a.name = 'Davies',
        a.title = 'Ensign',
        a.description = 'Ensign Davies is a rising member of the Enterprise-D\'s security detail in the transporter room. Though still new to the fast-paced demands of deep space operations, Davies demonstrates a keen eye for detail and an earnest commitment to duty. Their readiness and attention to critical tasks contribute to the overall safety and success of away missions.',
        a.traits = ["alert", "dedicated", "attentive", "observant"],
        a.sphere_of_influence = 'Ship security and operations'
    ;
MERGE (a:Agent {uuid: 'agent_lal'})
    ON CREATE SET
        a.name = 'Lal',
        a.title = 'Ensign',
        a.description = 'Ensign Lal is a dedicated and vigilant member of the Enterprise-D\'s security detail stationed in the transporter room. Recognized for a focused demeanor and prompt responsiveness, Lal plays an essential role in ensuring that security protocols are strictly maintained during critical transporter operations. Their commitment to duty reinforces the robustness of the ship’s security framework during away missions.',
        a.traits = ["vigilant", "dedicated", "observant", "responsive"],
        a.sphere_of_influence = 'Ship security and tactical support'
    ;
MERGE (a:Agent {uuid: 'agent_ancient_hologram'})
    ON CREATE SET
        a.name = 'Ancient Hologram',
        a.title = 'None',
        a.description = 'The Ancient Hologram is the spectral envoy of a long-vanished civilization whose wisdom spans the ages. Appearing as a luminous, ethereal projection, the hologram embodies the mystique of a people who transcended physical form. In this archive, its measured revelations and cryptic explanations serve as a reminder of the impermanence of mortal existence, while also inviting the away team to engage with a legacy of profound knowledge and enigmatic intent.',
        a.traits = ["Mystical", "Enigmatic", "Ancient", "Reverent"],
        a.sphere_of_influence = 'Custodian of ancient knowledge and legacy'
    ;
MERGE (o:Object {uuid: 'object_padd_personal_access_display_device'})
    ON CREATE SET
        o.name = 'PADD',
        o.description = 'A sleek, handheld Personal Access Display Device that Captain Picard uses to review sensor readings and important mission data. It represents the cutting edge of portable technology within Starfleet, enabling rapid access to critical information during command operations.',
        o.purpose = 'To display and review sensor data and mission-critical information',
        o.significance = 'Symbolizes the integration of advanced technology into command decisions and operational efficiency on the Enterprise-D.'
    ;
MERGE (o:Object {uuid: 'object_main_viewscreen'})
    ON CREATE SET
        o.name = 'Main Viewscreen',
        o.description = 'A massive, curved display panel that dominates the forward wall of the main bridge. It projects live images of the starfield, showcasing regions like the Melatrite Nebula, and plays a central role in situational awareness and tactical analysis.',
        o.purpose = 'To provide real-time visual data and situational awareness during missions',
        o.significance = 'Acts as the primary interface between the starship and the cosmos, inspiring awe while serving as a practical tool for navigation and defense.'
    ;
MERGE (o:Object {uuid: 'object_holographic_display_emitter_system'})
    ON CREATE SET
        o.name = 'Holographic Display Emitter System',
        o.description = 'A state-of-the-art holographic display emitter system, installed in the USS Enterprise-D\'s observation lounge and upgraded during the last refit at Starbase 74 in 2369. It projects detailed and dynamic scans of Melatrite III and other astronomical phenomena, rendering complex data into vivid, three-dimensional images.',
        o.purpose = 'To project real-time holographic scans and visual data of celestial objects for analysis and strategic planning.',
        o.significance = 'The emitter system symbolizes the technological prowess and forward-thinking philosophy of Starfleet. It bridges the gap between scientific observation and intuitive insight, allowing the crew to visualize the mysteries of the cosmos and the ancient legacy of the prachin civilization.'
    ;
MERGE (o:Object {uuid: 'object_transporter_console'})
    ON CREATE SET
        o.name = 'Transporter Console',
        o.description = 'A sophisticated control panel central to operating the Enterprise-D\'s transporter system, comprising multiple screens, tactile keypads, and intricate instrumentation. It is designed for precision management of the dematerialization and rematerialization processes essential to safe crew transitions.',
        o.purpose = 'To manage and coordinate transporter operations during away missions.',
        o.significance = 'The transporter console is pivotal for initiating secure and efficient transport operations, serving as the technological gateway between the ship and its away teams.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_structure_subspace_amplifier'})
    ON CREATE SET
        o.name = 'Crystalline Structure',
        o.description = 'A massive, pulsating crystalline structure located at the center of the chamber. It emits a soft, blue light and appears to function as a subspace amplifier, resonating with the planet\'s natural subspace field. The structure is imbued with alien engineering and exudes a quiet power that dominates its surroundings.',
        o.purpose = 'To amplify subspace energy and generate the mysterious energy patterns detected by the away team.',
        o.significance = 'This structure is central to the narrative as both a physical and symbolic anchor of the ancient civilization’s advanced technology and enigmatic legacy.'
    ;
MERGE (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    ON CREATE SET
        o.name = 'Tricorder TR-590 Mark IX',
        o.description = 'A state-of-the-art handheld scanning device used by Data to perform immediate diagnostic scans of the environment. The tricorder is equipped with advanced sensors and is essential for analyzing unfamiliar energy readings and phenomena.',
        o.purpose = 'To gather and analyze data regarding the subspace energy patterns and structural details within the chamber.',
        o.significance = 'The device underpins the scientific inquiry of the away team, enabling them to interpret and understand the complex technological and mysterious phenomena within this ancient structure.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    ON CREATE SET
        o.name = 'Crystalline Data Storage Devices',
        o.description = 'Advanced crystalline devices that form the backbone of the archive\'s storage system. Each device is intricately designed to house vast repositories of knowledge accumulated over millennia, with translucent facets that refract soft ambient light to create subtle displays of color.',
        o.purpose = 'To preserve and store the ancient data and records of the প	র	চীন civilization for future retrieval and study.',
        o.significance = 'They serve as a tangible link to a lost era, symbolizing the enduring value of knowledge and the legacy of a people who transcended physical limitations by encoding their history into enduring, enigmatic artifacts.'
    ;
MERGE (l:Location {uuid: 'location_enterprise_d_main_bridge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D Main Bridge',
        l.description = 'The main bridge of the USS Enterprise-D is a state-of-the-art command center that epitomizes streamlined efficiency and advanced technology. It is filled with high-tech consoles, a prominent command chair, and a vast, curved main viewscreen displaying real-time celestial images of starfields and nebulae from the Melatrite region. The atmosphere is one of calm authority, accompanied by the subtle hum of spacecraft systems and the coordinated energy of its crew.',
        l.type = 'Ship Bridge'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D Observation Lounge',
        l.description = 'A serene yet technologically advanced space featuring a panoramic view of the Melatrite Nebula, the Observation Lounge is outfitted with a spacious conference table surrounded by comfortable seating and ambient lighting. Large, curved windows frame a breathtaking vista of swirling nebular gases, while an upgraded holographic emitter system projects dynamic scans of celestial objects, blending contemplation with strategic analysis.',
        l.type = 'Observation Lounge'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    ON CREATE SET
        l.name = 'USS Enterprise-D Transporter Room 3',
        l.description = 'A bustling hub of activity, the Transporter Room is alive with the hum of advanced technology and rapid coordination among crew members. Bright control panels illuminate a central transporter platform surrounded by arrays of monitors and tactile consoles, setting an atmosphere charged with focused energy as officers and security personnel ensure every system is primed for the upcoming away mission.',
        l.type = 'Transporter Room'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    ON CREATE SET
        l.name = 'Melatrite III Subterranean Central Chamber',
        l.description = 'Carved deep within the subterranean structure of Melatrite III, this vast, circular chamber is composed of an obsidian-like material that absorbs light. Intricate carvings of celestial events and abstract geometric patterns adorn the walls while a massive crystalline structure at its center pulsates with a soft, blue light. The eerie atmosphere is accentuated by a constant musical hum, contributing to its enigmatic aura.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_archive'})
    ON CREATE SET
        l.name = 'Melatrite III Subterranean Archive',
        l.description = 'Nestled deep within the subterranean structure of Melatrite III, this vast archive features rows upon rows of crystalline data storage devices etched with cryptic carvings. Pulsating with a faint, otherworldly glow and imbued with a cool, recycled tang of ozone, the archive exudes an atmosphere heavy with the weight of time and mystery, evoking the lost sophistication of a bygone civilization.',
        l.type = 'Archive'
    ;
MERGE (o:Organization {uuid: 'org_starfleet_command'})
    ON CREATE SET
        o.name = 'Starfleet Command',
        o.description = 'Starfleet Command is the central authority overseeing interstellar missions, strategic planning, and the governance of exploration and defense within the Federation. It upholds principles of duty, diplomacy, and discovery, ensuring that its officers operate with discipline, technical excellence, and a spirit of exploration that furthers humanity\'s reach into the cosmos.',
        o.sphere_of_influence = 'Federation-wide military strategy and space exploration'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
    ON CREATE SET
        ep.title = 'Episode One - Echoes of the Past',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Charting the Anomaly',
        s.description = 'On the bridge of the USS Enterprise-D, the atmosphere is one of controlled curiosity and measured tension. The setting is defined by the soft hum of the warp core and the steady glow of the main viewscreen showcasing the swirling lights of the Melatrite Nebula. Captain Picard, seated in his dignified command chair and reviewing data on his PADD, sets the tone for a calm yet probing inquiry. Commander Riker and Lieutenant Commander Data offer technical insights about unusual sensor readings, hinting at subspace phenomena that may threaten nearby systems. This scene not only establishes the imminent investigation but also underlines the collaborative resolve and cautious optimism that define the crew’s character and mission.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_enterprise_d_main_bridge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Sensor Data Review',
        e.description = 'Captain Picard initiates a focused discussion as he queries Commander Riker about the latest sensor readings from the Melatrite Nebula, setting the investigative tone. Riker provides preliminary data on tetryon particles and gravimetric distortions, drawing a parallel to past subspace anomalies. Lieutenant Commander Data supplements the conversation with a level-three diagnostic that reveals energy readings from Melatrite III, hinting at unknown natural phenomenon. This exchange deepens the narrative tension by suggesting a threat that may disrupt vital star systems, compelling the crew to deliberate their next course of action.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Commander Riker, have you had a chance to review the latest sensor readings from the Melatrite Nebula? Starfleet Command believes there may be unusual subspace phenomena occurring in that region.", "RIKER: Yes, Captain. Preliminary scans show high concentrations of tetryon particles and intermittent distortions in the gravimetric field. It's reminiscent of the subspace anomalies we encountered near the Maranga system during the Zakdorn crisis of '69.", "DATA: Captain, I have completed a level-three diagnostic of the long-range sensor array. I am detecting unusual energy readings emanating from a Class-M planet designated as Melatrite III. The readings are consistent with a type-4 subspace inversion, but also contain elements not found in any known natural phenomenon."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Setting a Course for Investigation',
        e.description = 'Following the detailed examination of the sensor data, Captain Picard decisively instructs the crew to further explore the anomaly. He directs Ensign Taur to set a course for Melatrite III, specifying warp factor six. This order not only shifts the scene towards active investigation but also encapsulates the crew’s readiness to confront the unknown. The concise confirmation from Ensign Taur reinforces the disciplined focus of the bridge crew, as they prepare to change trajectory into the depths of space, driven by the promise of revelation and discovery.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Intriguing. Ensign Taur, lay in a course for Melatrite III, warp factor six. Let's take a closer look.", "TAUR: Aye, Captain. Course laid in. Engaging warp drive."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Echoes in the Observation Lounge',
        s.description = 'Inside the USS Enterprise-D Observation Lounge, the panoramic view of the vibrant Melatrite Nebula washes the room in a surreal cascade of violet, rose, and emerald hues. The large, curved viewscreen stretches overhead, displaying the swirling gases of distant space, while the holographic display emitter system projects a detailed scan of Melatrite III at the center of the conference table. The atmosphere is charged with a palpable blend of curiosity and apprehension as Captain Picard, Commander Riker, and Counselor Troi gather to decipher mysterious energy readings. The dialogue reveals both a scientific inquiry and a deeper, almost spiritual, connection to a long-forgotten civilization. The scene serves as a crucial narrative pivot, deepening the mystery and setting the stage for a broader cosmic exploration.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Revelations on the Holographic Display',
        e.description = 'Captain Picard initiates the conversation by directing attention to the displayed sensor readings of Melatrite III. In this moment, the crew is confronted with anomalies that hint at the delicate interplay of emotion and cosmic mystery. As he questions whether the readings suggest sentient activity, Commander Riker and Counselor Troi offer their insights, speculating on distress signals and emotional patterns that blend fear, longing, and hope. The dialogue not only surfaces their immediate concerns but also hints at a larger narrative involving an ancient, elusive civilization, setting in motion a chain of inquiry into the unknown.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Counselor, what are your impressions of these energy readings? Do they suggest any sentient involvement?", "TROI: The patterns are complex, Captain. I sense a mixture of emotions \u2013 fear, longing, but also a profound sense of hope. It's as if someone, or something, is reaching out across space, trying to communicate.", "RIKER: Could it be a distress signal? Perhaps a civilization facing some kind of cataclysm?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Echoes of a Forgotten Past',
        e.description = 'As the discussion deepens, Counselor Troi introduces a new layer to the mystery by describing a faint psychic resonance that feels disturbingly familiar. This revelation intertwines with Captain Picard\'s reflection on the ancient civilization, the প্রাচীন, whose remnants and enigmatic signatures still echo through the cosmos. The event heightens the narrative tension by blending scientific observation with an almost spiritual awareness of history and memory. The crew is left to ponder the possibility that this phenomenon might be a deliberate call from an ancient, transcended race—a call that may redefine their understanding of existence and the vast universe.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Possibly. Or it could be something else entirely. The Melatrite Nebula was once home to the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 (Ancient) civilization, a species that vanished over a million years ago, leaving behind only fragmented records and their signature on the cosmic background radiation. Their technology was said to be far beyond our understanding.", "TROI: Captain, I'm also detecting a faint psychic resonance. It feels... familiar, somehow. Like an echo from the past."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Preparations in Transporter Room 3',
        s.description = 'In the bustling USS Enterprise-D Transporter Room 3, the crew rallies around the imminent away mission with focused determination. The room is alive with the hum of advanced machinery and the precise clicks of consoles as each officer executes his role with military precision. Dim panel lighting accentuates the technical displays while the transporter console glows under the skilled hands of Chief Engineer La Forge. The atmosphere is a calculated blend of anticipation and caution, underscored by the weight of a mysterious energy source detected beneath an alien surface. This scene establishes the transition from routine operations to a moment of critical discovery and potential danger, setting the stage for exploration into the unknown.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'La Forge Announces System Readiness',
        e.description = 'In the opening moments, Chief Engineer Geordi La Forge confirms that the transporter systems are operating at optimal efficiency. He announces that the strongest energy source has been locked onto, emanating from a subterranean structure on the planet\'s surface. His clear and confident delivery sets a tone of technical mastery and determination. La Forge’s declaration not only underscores the precision with which the Enterprise’s systems are maintained but also initiates the crew’s anticipation of the mysterious energy signature that promises to propel their away mission into uncharted territory.',
        e.sequence = 1,
        e.key_dialogue = ["Transporter systems are operating at optimal efficiency. We've locked onto the strongest energy source on the planet's surface. It appears to be originating from a subterranean structure."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Data Unveils the Ancient Structure',
        e.description = 'Following La Forge\'s announcement, Data steps forward with a precise and analytical report about the detected structure. With his characteristic clarity, he explains that the unknown structure predates the extinction of the ancient civilization, the প্রাচীন, by at least five hundred thousand years. His detailed observation connects the energy signature with previous subspace anomalies, casting the discovery in a historical and scientific light. This moment deepens the intrigue, merging the realms of astrophysics and archaeology, and reinforces the stakes of their investigative mission.',
        e.sequence = 2,
        e.key_dialogue = ["The structure's composition is unknown, Chief. However, preliminary scans indicate that it predates the extinction of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 by at least five hundred thousand years. Its energy signature is consistent with the subspace readings we detected earlier."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Worf Warns of Potential Peril',
        e.description = 'Amid the technical exchange, Lieutenant Worf interjects with a forewarning of possible resistance. His measured caution reflects his Klingon warrior instincts and an awareness of the potential dangers lurking in ancient defensive technologies. By raising the possibility of hostile countermeasures, Worf introduces a palpable tension into the scene. His words serve as a reminder that while the mission is one of exploration, the unknown might harbor latent threats. This cautionary step is critical in ensuring that the crew remains vigilant in the face of uncertain peril.',
        e.sequence = 3,
        e.key_dialogue = ["We should prepare for possible resistance. The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were known to have powerful defensive technologies."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Picard Emphasizes Caution Over Aggression',
        e.description = 'Captain Jean-Luc Picard steps in to balance the building tension with a call for restraint. In his characteristically calm and authoritative tone, he underscores that the mission\'s objective is investigation rather than confrontation. Picard acknowledges Worf\'s concerns while steering the crew’s focus back to scientific exploration and discovery. His measured directive not only diffuses immediate tension but also reinforces the philosophical underpinnings of Starfleet\'s commitment to understanding over conflict, reminding everyone that knowledge is their prime directive.',
        e.sequence = 4,
        e.key_dialogue = ["Agreed, Lieutenant. But let's proceed with caution. Our primary objective is to investigate, not to engage in hostilities."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'O\'Brien Initiates the Transporter Sequence',
        e.description = 'With decisions consolidated and orders confirmed, Transporter Chief Miles O\'Brien delivers a succinct command that propels the mission forward. His single-word order marks the transition from deliberation to action, initiating the transporter sequence. Serving as the final technical cue in the scene, this moment encapsulates the seamless integration of human effort and advanced technology aboard the Enterprise. As the away team prepares for their beaming-out procedure, the room shifts from intense scrutiny and strategic planning to the precise mechanics of interstellar travel, setting the stage for what lies ahead on the distant world.',
        e.sequence = 5,
        e.key_dialogue = ["Energizing."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Crystal Echoes in the Dark',
        s.description = 'In the depths of Melatrite III’s subterranean structure, the away team finds themselves in a vast, circular chamber whose obsidian walls absorb every stray glimmer of light. Intricate carvings of celestial events and shifting geometric patterns adorn the surface, hinting at lost wisdom and ancient artistry. At the center of this mysterious environment, a massive crystalline structure pulses with a soft blue light and emits an almost musical hum. The atmosphere is thick with tension and wonder as Data uses his TR-590 Mark IX tricorder to analyze the subspace amplifier, while Worf’s unease fuels the crew\'s cautious approach. This scene is pivotal, marking the crew’s first direct encounter with an artifact of a bygone civilization, setting the stage for revelations about the vanished প্রাচীন that shape their understanding of time, legacy, and cosmic connectivity.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Arrival and Initial Analysis',
        e.description = 'The away team materializes inside the vast, circular chamber, immediately surrounded by an overwhelming sense of ancient mystery. The smooth, obsidian-like walls, adorned with ever-shifting carvings depicting cosmic events, absorb the light and set a brooding tone. Data quickly initiates a scan using his TR-590 Mark IX tricorder, marveling at the crystalline structure in the center that pulses with soft blue energy. Amid the ambient hum, Worf voices his apprehension about a possible trap, prompting Captain Picard to urge caution. This moment establishes both the science and the underlying suspense, as the crew confronts an environment that hints at secrets from an extinct civilization.',
        e.sequence = 1,
        e.key_dialogue = ["DATA: Fascinating. The crystalline structure appears to be a form of subspace amplifier. It is resonating with the planet's natural subspace field, creating the energy patterns we detected.", "WORF: I do not like this, Captain. It feels like a trap.", "PICARD: Perhaps, Lieutenant. Or perhaps it's something else entirely. Let's proceed cautiously."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Manifestation of the Ancient',
        e.description = 'As the team draws nearer to the pulsating crystalline structure, the auditory hum intensifies and the engraved carvings on the chamber walls start to glow with an ethereal light. The air shimmers with a strange energy, signaling a dramatic shift in atmosphere. In this heightened moment, a holographic projection suddenly coalesces before the crew—a tall, slender humanoid figure with elongated limbs and luminous eyes emerges. This spectral figure, representing a member of the long-extinct প্রাচীন civilization, greets them with a mysterious welcome, marking a profound turning point that deepens the mystery and underscores the significance of their discovery.',
        e.sequence = 2,
        e.key_dialogue = ["ANCIENT HOLOGRAM: Greetings. We are the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8. We have awaited your arrival."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'The Archive of Enduring Echoes',
        s.description = 'Deep beneath the surface of Melatrite III, the away team finds themselves in a vast, subterranean archive where the past speaks in silent, resonant whispers. The chamber is circular and imposing, its smooth, obsidian-like walls lined with innumerable crystalline data storage devices that glow with a soft, ethereal blue light. Intricate carvings of celestial events and shifting geometric patterns animate the darkness, lending an air of ancient mystery. The cool, dust-laden atmosphere is heavy with the scent of ozone and the weight of history. In this hallowed space, every ray of light and every subtle vibration underscores a critical turning point in the Enterprise’s journey: a quest to unearth knowledge from a civilization that transcended its physical form. The archive is not only a repository of data, but also a symbolic bridge connecting the present to a long-forgotten cosmic legacy.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_archive'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Reverence in the Archive',
        e.description = 'The away team steps into a vast archive where time seems suspended. Rows upon rows of crystalline data storage devices, set against dark, obsidian walls with glowing carvings, overwhelm the senses with their ancient majesty. Data is visibly excited as he analyzes the repository, recognizing that the archive holds more information than the entire Federation historical database. Captain Picard reflects on the potential of this discovery to revolutionize their understanding of the cosmos. The scene radiates both awe and cautious optimism, highlighting an unexpected turning point in their mission as the crew contemplates the cryptic messages embedded in the architecture of the long-lost civilization.',
        e.sequence = 1,
        e.key_dialogue = ["Data: 'This archive is remarkable, Captain. It contains more data than the entire Federation historical database. It would take centuries to analyze it all.'", "Picard: 'Indeed, Commander. This could revolutionize our understanding of the universe. But first, we need to understand the nature of this facility and the message the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 are trying to send.'"]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Revelation of the Ancients',
        e.description = 'As the chamber’s ambient hum intensifies, a holographic figure materializes, its luminous eyes and ethereal presence invoking the forgotten legacy of a civilization that once flourished. The Ancient Hologram guides the away team through the corridors of history, revealing that the archive was built to preserve and transmit the accumulated wisdom of its people. When Worf inquires about the fate of this ancient race, the hologram explains that they ascended to a higher plane of existence, leaving behind an echo of their consciousness within the archive. This stunning revelation deepens the mystery, challenging the crew to reconcile their mission with the profound legacy contained in these silent, crystalline guardians.',
        e.sequence = 2,
        e.key_dialogue = ["Ancient Hologram: 'We built this facility to preserve our knowledge and to reach out to other civilizations. We knew that our time was coming to an end, but we hoped that our legacy would endure.'", "Worf: 'What happened to your people?'", "Ancient Hologram: 'We ascended to a higher plane of existence, leaving behind our physical forms. But we left a part of ourselves within this archive, a memory, an echo, waiting for someone to listen.'"]
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
MATCH (a:Agent {uuid: 'agent_miles_obrien'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_padd_personal_access_display_device'}),
          (a:Agent {uuid: 'agent_jean_luc_picard'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
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
MATCH (a:Agent {uuid: 'agent_miles_obrien'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (o:Organization {uuid: 'org_starfleet_command'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_padd_personal_access_display_device_event_1_1'})
    ON CREATE SET
        oi.description = 'The PADD serves as Captain Picard\'s indispensable tool for accessing and reviewing critical sensor data during the discussion. It is the medium through which vital information about the Melatrite Nebula and Melatrite III is transmitted, facilitating his analysis and decision-making. Its data stream informs the narrative by linking technical details with command strategy, effectively driving the scene\'s investigative momentum.',
        oi.status_before = 'The PADD is in pristine condition, fully functional and securely in Picard\'s possession, representing the pinnacle of Starfleet\'s portable technology.',
        oi.status_after = 'After the event, the PADD remains in continuous use, displaying updated sensor readings and analysis data, its condition unchanged but its narrative importance heightened as a central element in the command process.'
    WITH oi
    MATCH (o:Object {uuid: 'object_padd_personal_access_display_device'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_main_viewscreen_event_1_1'})
    ON CREATE SET
        oi.description = 'The main viewscreen acts as the visual nexus for the bridge, projecting a detailed live image of the Melatrite Nebula. It not only establishes the cosmic setting for the event but also reinforces situational awareness by juxtaposing the vastness of space with the focused sensor readings discussed in the bridge. Its presence links the unfolding narrative with the physical reality of the starship\'s exploration, anchoring the dialogue in tangible imagery.',
        oi.status_before = 'Before the event, the viewscreen operates under normal parameters, displaying a calm, expansive view of the starfield and a clearly defined image of the Melatrite Nebula.',
        oi.status_after = 'Following the event, the viewscreen continues to operate with the same clarity, now subtly enhanced with overlays that reflect the updated sensor data, underscoring its role in maintaining the crew\'s awareness of the cosmic anomaly.'
    WITH oi
    MATCH (o:Object {uuid: 'object_main_viewscreen'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard sits regally in his command chair, his gaze fixed on the PADD as he carefully reviews the sensor readings. With poised hands and a steady demeanor, he scans the data while his eyes move methodically across the information displayed on his personal access device, exuding a commanding presence over the bridge.',
        ap.emotional_state = 'Picard\'s countenance is one of measured curiosity and authority; his exterior calm belies the deep concern stirring within as he contemplates potential threats. Despite displaying the composed assurance expected of a starship captain, internally he wrestles with a blend of cautious optimism and apprehension, aware that the outcome of this investigation may have far-reaching implications for his crew and the Federation.',
        ap.emotional_tags = ["Picard's countenance is one of measured curiosity", "authority; his exterior calm belies the deep concern stirring within as he contemplates potential threats. Despite displaying the composed assurance expected of a starship captain, internally he wrestles with a blend of cautious optimism", "apprehension, aware that the outcome of this investigation may have far-reaching implications for his crew", "the Federation."],
        ap.active_plans = ["Direct the review of sensor data to identify anomalies.", "Establish a course of investigation based on preliminary readings.", "Prepare contingency plans for any potential threat arising from the subspace phenomena."],
        ap.beliefs = ["Rational analysis and logical inquiry are vital in uncovering hidden truths.", "Leadership requires a balance of empathy and decisiveness.", "Thorough investigation of sensor data is key to ensuring the safety of star systems."],
        ap.goals = ["Short-term: Clarify the anomalous sensor readings immediately.", "Medium-term: Develop a comprehensive understanding of the potential subspace threat.", "Ultimate: Safeguard the USS Enterprise and the Federation by effectively addressing the unknown phenomena."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Commander Riker stands nearby with his arms crossed, exuding both confidence and a relaxed charm. Leaning against the command console, his posture indicates readiness and an analytical focus as he listens intently to Picard while intermittently referring to the sensor data and past experiences of similar anomalies.',
        ap.emotional_state = 'Riker\'s warm smile and approachable demeanor mask a quietly analytical mind that is ever-alert to subtle shifts in the situation. Externally, he projects a reassuring calm and optimism, yet inside he is meticulously weighing the risks based on past encounters. His internal state is marked by a blend of pragmatic caution and confidence in his experience, cognizant of the delicate balance between trust in his captain and his own strategic instincts.',
        ap.emotional_tags = ["Riker's warm smile", "approachable demeanor mask a quietly analytical mind that is ever-alert to subtle shifts in the situation. Externally, he projects a reassuring calm", "optimism, yet inside he is meticulously weighing the risks based on past encounters. His internal state is marked by a blend of pragmatic caution", "confidence in his experience, cognizant of the delicate balance between trust in his captain", "his own strategic instincts."],
        ap.active_plans = ["Confirm and interpret the sensor data alongside historical precedents.", "Support Picard in forming a tactical response based on known anomalies.", "Ensure that all crew members are prepared for any rapid changes in the situation."],
        ap.beliefs = ["Experience from past crises is invaluable in addressing new challenges.", "Team cohesion and effective communication are fundamental to mission success.", "A proactive yet measured approach is essential in navigating uncertain situations."],
        ap.goals = ["Short-term: Validate the preliminary sensor data with his own observational insights.", "Medium-term: Provide tactical recommendations that leverage past experiences.", "Ultimate: Maintain the safety and operational readiness of the USS Enterprise."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Data stands at the operations station, focused on his complex array of sensor outputs. He diligently executes a level-three diagnostic while calmly articulating the findings, methodically correlating the unusual energy readings with the signals detected from Melatrite III, and contributing precise information to the discussion.',
        ap.emotional_state = 'Data exhibits an air of controlled, analytical excitement, his voice even yet reflective of genuine intellectual curiosity. While his facial expression remains impassive, internally he processes the data with a fervent desire to unravel the unknown. He experiences a subtle interplay of logical rigor and an almost imperceptible yearning to bridge his computational insights with human understanding, revealing his commitment to uncovering the mystery behind the sensor anomalies.',
        ap.emotional_tags = ["Data exhibits an air of controlled, analytical excitement, his voice even yet reflective of genuine intellectual curiosity. While his facial expression remains impassive, internally he processes the data with a fervent desire to unravel the unknown. He experiences a subtle interplay of logical rigor", "an almost imperceptible yearning to bridge his computational insights with human underst", "ing, revealing his commitment to uncovering the mystery behind the sensor anomalies."],
        ap.active_plans = ["Refine sensor diagnostics to achieve a more detailed analysis.", "Correlate energy readings with established and unknown phenomena.", "Report critical findings to Captain Picard to aid in strategic decision-making."],
        ap.beliefs = ["Only factual, data-driven analysis can unveil the truth behind anomalies.", "Integrating advanced diagnostics with human intuition leads to comprehensive understanding.", "Continuous investigation of sensor data is essential in probing unexplained phenomena."],
        ap.goals = ["Short-term: Provide a precise diagnostic report on current energy readings.", "Medium-term: Deepen the analytical understanding of the type-4 subspace inversion.", "Ultimate: Contribute to the scientific breakthrough by uncovering the nature of the unknown phenomenon."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard is seated authoritatively in the command chair at the main bridge, his posture poised and reflective as he carefully reviews sensor data on his PADD. His eyes are intent on the display and his gestures deliberate as he issues concise orders, embodying a calm decisiveness that occupies the center of the bridge.',
        ap.emotional_state = 'Picard exudes a composed and measured exterior marked by confidence and quiet determination. Internally, he is engaged in a careful balance of curiosity and cautious skepticism toward the unknown, experiencing a blend of intellectual excitement and the solemn weight of command. Beneath his calm demeanor, he wrestles with the implications of the anomaly, driven by a deep-seated need to protect his crew while pursuing the truth.',
        ap.emotional_tags = ["Picard exudes a composed", "measured exterior marked by confidence", "quiet determination. Internally, he is engaged in a careful balance of curiosity", "cautious skepticism toward the unknown, experiencing a blend of intellectual excitement", "the solemn weight of comm", ". Beneath his calm demeanor, he wrestles with the implications of the anomaly, driven by a deep-seated need to protect his crew while pursuing the truth."],
        ap.active_plans = ["Direct the crew to investigate the unusual subspace phenomena.", "Gather and synthesize sensor data to form a coherent strategy.", "Prepare for potential confrontations with unknown cosmic forces."],
        ap.beliefs = ["The integrity and safety of the crew are paramount.", "Rational analysis and empirical evidence must guide decision-making.", "Exploration is essential for expanding the Federation's understanding of the cosmos."],
        ap.goals = ["Short-term: Ensure immediate attention to the sensor readings and set the course for Melatrite III.", "Medium-term: Successfully navigate the channeling of sensor data into actionable intelligence.", "Ultimate: Uncover the mysteries behind the subspace phenomenon to safeguard future exploration and maintain Starfleet Command's trust."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Ensign Taur is stationed confidently at the helm, her fingers dancing across the controls as she interprets the tactical data with precision. She responds promptly to Captain Picard\'s command, setting a course for Melatrite III with smooth, assured movements that reflect her training and natural aptitude for navigation.',
        ap.emotional_state = 'Taur maintains a composed exterior augmented by a quiet determination and focus. She feels a mixture of disciplined responsibility and the inevitable excitement of participating in a significant mission. Beneath her calm professionalism, there is an undercurrent of anticipation and a yearning for the opportunity to prove her capability in real-time interstellar operations.',
        ap.emotional_tags = ["Taur maintains a composed exterior augmented by a quiet determination", "focus. She feels a mixture of disciplined responsibility", "the inevitable excitement of participating in a significant mission. Beneath her calm professionalism, there is an undercurrent of anticipation", "a yearning for the opportunity to prove her capability in real-time interstellar operations."],
        ap.active_plans = ["Set and confirm the precise course to Melatrite III at warp factor six.", "Monitor navigation systems to ensure steady and accurate travel.", "Quickly adapt to any emerging challenges or anomalies that may arise during the course change."],
        ap.beliefs = ["Adherence to Starfleet protocols ensures mission success.", "Continuous learning and adaptation are vital in uncharted space.", "Trust in the chain of command and her own training empowers operational efficiency."],
        ap.goals = ["Short-term: Execute the captain\u2019s instruction by laying in the correct course efficiently.", "Medium-term: Maintain optimal navigation while monitoring for any deviations or hazards.", "Ultimate: Contribute to the overall mission success and establish her trajectory as an emerging leader within Starfleet."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_emitter_system_event_2_1'})
    ON CREATE SET
        oi.description = 'The holographic display emitter system serves as the dynamic centerpiece in the observation lounge by projecting a detailed, three-dimensional scan of Melatrite III. Its advanced technology transforms complex sensor data into vivid, visual narratives, enabling the crew to engage deeply with the cosmic anomalies. It functions not only as a tool for data presentation but also as an essential narrative device, framing the crew\'s dialogue around deep space mysteries and the possibility of ancient signals embedded in the readings.',
        oi.status_before = 'Prior to the event, the system was operating at peak efficiency, freshly upgraded to deliver high-resolution, dynamic images of celestial phenomena.',
        oi.status_after = 'After the event, the display continues to run flawlessly, maintaining its role as the focal point of the crew’s inquiry and a conduit for the visual representation of intricate subspace phenomena.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display_emitter_system'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands authoritatively in the observation lounge, his posture poised over the conference table as he studies the detailed sensor readings on the holographic display. His measured gestures and deliberate eye movements reveal a man deeply engaged in deciphering cosmic mysteries.',
        ap.emotional_state = 'Picard exudes a calm and reflective demeanor as he questions the sensor data, outwardly composed yet internally alert to the subtleties of interstellar signals. Beneath his steady exterior lies a complex mix of cautious curiosity and a resolute drive to understand potential threats, underscored by a quiet determination to safeguard the Enterprise and its crew.',
        ap.emotional_tags = ["Picard exudes a calm", "reflective demeanor as he questions the sensor data, outwardly composed yet internally alert to the subtleties of interstellar signals. Beneath his steady exterior lies a complex mix of cautious curiosity", "a resolute drive to underst", "potential threats, underscored by a quiet determination to safeguard the Enterprise", "its crew."],
        ap.active_plans = ["Determine if the sensor anomalies indicate sentient involvement.", "Evaluate historical data regarding the Ancient civilization for context.", "Outline a strategy for further investigation into the Melatrite III readings."],
        ap.beliefs = ["A commitment to methodical and evidence-based decision making.", "A deep respect for the wisdom of past civilizations.", "A conviction that careful inquiry leads to lasting understanding."],
        ap.goals = ["Short-term: Assess the immediate threat through detailed analysis of the holographic data.", "Medium-term: Correlate the sensor anomalies with historical patterns linked to ancient technologies.", "Ultimate: Ensure the crew's safety while unraveling the mysteries of the cosmos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Counselor Troi sits attentively at the conference table, her eyes fixed on the vivid holographic projection of Melatrite III. Her body is relaxed yet alert, and her poised demeanor belies the complexity of the empathic impressions she is receiving from the displayed data.',
        ap.emotional_state = 'Troi senses a layered and multifaceted emotional current emanating from the energy readings; outwardly, she projects a calm and thoughtful curiosity while inwardly she experiences a swirl of empathy, merging feelings of fear, longing, and a resonant hope. This inner confluence fuels her drive to understand the emotional subtext behind the cosmic signals, even as she navigates a subtle tension between professional detachment and personal sensitivity.',
        ap.emotional_tags = ["Troi senses a layered", "multifaceted emotional current emanating from the energy readings; outwardly, she projects a calm", "thoughtful curiosity while inwardly she experiences a swirl of empathy, merging feelings of fear, longing,", "a resonant hope. This inner confluence fuels her drive to underst", "the emotional subtext behind the cosmic signals, even as she navigates a subtle tension between professional detachment", "personal sensitivity."],
        ap.active_plans = ["Interpret the psychic resonance detected in the sensor data.", "Advise the Captain on the emotional implications of the readings.", "Bridge the gap between logical analysis and empathic understanding among the crew."],
        ap.beliefs = ["Trust in the power of empathy to reveal hidden truths.", "A conviction that emotions provide critical insights into unexplored phenomena.", "The belief that understanding internal signals is as important as technical data."],
        ap.goals = ["Short-term: Decode the complex emotional patterns evident in the holographic display.", "Medium-term: Provide strategic counsel based on her empathic insights.", "Ultimate: Establish a deeper connection between the ancient signals and the crew\u2019s current experience to guide future actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Commander Riker stands casually yet alert, leaning slightly against the conference table as he reviews the dynamic holographic display. His relaxed posture and measured expressions indicate a readiness to both question and support the unfolding analysis of the sensor data.',
        ap.emotional_state = 'Riker’s expression is a study in balanced optimism and cautious pragmatism. While his warm smile and confident tone suggest a natural ease with uncertainty, his attentive gaze quietly betrays a concern about the potential implications of the readings. His inner resolve to protect the crew mingles with an eagerness to explore the possibilities hinted at by the ancient signals, reflecting a complex interplay between hope and vigilance.',
        ap.emotional_tags = ["Riker\u2019s expression is a study in balanced optimism", "cautious pragmatism. While his warm smile", "confident tone suggest a natural ease with uncertainty, his attentive gaze quietly betrays a concern about the potential implications of the readings. His inner resolve to protect the crew mingles with an eagerness to explore the possibilities hinted at by the ancient signals, reflecting a complex interplay between hope", "vigilance."],
        ap.active_plans = ["Verify the sensor readings for any indications of distress or anomalies.", "Initiate contingency planning should the need for immediate action arise.", "Foster collaborative discussion among the team to better understand the unfolding mystery."],
        ap.beliefs = ["The importance of maintaining situational awareness at all times.", "Confidence in the chain of command and the strategic decisions made by leadership.", "A resolute optimism that thorough investigation can resolve emerging uncertainties."],
        ap.goals = ["Short-term: Clarify the immediate meaning behind the energy anomalies displayed.", "Medium-term: Contribute to assembling a coherent interpretation of the crew\u2019s findings.", "Ultimate: Ensure the safety and effective response of the crew while engaging with the deeper cosmic mystery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard sits resolutely at the conference table, his gaze fixed on the holographic display that illuminates the swirling hues of the Melatrite Nebula. He leans forward slightly, fingers steepled in thoughtful inquiry, projecting both authority and reflective calm as he listens to the unfolding analysis.',
        ap.emotional_state = 'Picard’s composed exterior belies a deep internal mix of intrigue and cautious optimism. While his measured tone and controlled gestures exude confidence, his eyes betray a contemplative intensity, wrestling with the weight of ancient mysteries and the potential implications of a psychic resonance that might reshape their understanding of the cosmos.',
        ap.emotional_tags = ["Picard\u2019s composed exterior belies a deep internal mix of intrigue", "cautious optimism. While his measured tone", "controlled gestures exude confidence, his eyes betray a contemplative intensity, wrestling with the weight of ancient mysteries", "the potential implications of a psychic resonance that might reshape their underst", "ing of the cosmos."],
        ap.active_plans = ["Gather and analyze additional sensor data regarding the subspace phenomena.", "Assess whether the psychic resonance indicates a deliberate message from an ancient civilization.", "Maintain diplomatic restraint while preparing for potential shifts in Starfleet protocol based on emerging evidence."],
        ap.beliefs = ["Rational inquiry is essential to uncovering hidden truths.", "Duty to explore and understand new phenomena transcends mere scientific curiosity.", "The Federation\u2019s commitment to peace and wise exploration must guide every decision."],
        ap.goals = ["Short-term: Clarify the nuances of the energy readings with input from his trusted officers.", "Medium-term: Secure detailed and corroborative data on the Ancient civilization\u2019s legacy.", "Ultimate: Ensure that the insights gleaned lead to a renewed and enlightened Starfleet mission of exploration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Counselor Troi sits with quiet intensity, her posture both relaxed and attentive as she surveys the holographic display. She gently clasps her hands on the table, her eyes soft yet focused, fully absorbed in interpreting the subtle psychic signals interwoven with the scientific data.',
        ap.emotional_state = 'Troi exudes a layered emotional complexity; on the surface, she is calm and empathetic, yet beneath that serenity lies an undercurrent of apprehension and longing. Her senses pick up not just the factual data but the lingering echoes of fear and hope, revealing an inner conflict between rational analysis and her profound empathic perceptions.',
        ap.emotional_tags = ["Troi exudes a layered emotional complexity; on the surface, she is calm", "empathetic, yet beneath that serenity lies an undercurrent of apprehension", "longing. Her senses pick up not just the factual data but the lingering echoes of fear", "hope, revealing an inner conflict between rational analysis", "her profound empathic perceptions."],
        ap.active_plans = ["Interpret the psychic resonance to uncover hidden emotional and historical messages.", "Subtly communicate her empathetic insights to influence the strategic direction of the inquiry.", "Probe deeper into the ancient psychic signals to determine if they signify a call for help or a warning."],
        ap.beliefs = ["Emotional intuition is a critical complement to empirical data.", "Every emotional residue holds a potential key to understanding deeper truths.", "Communication and empathy bridge the gap between the present and the echoes of ancient wisdom."],
        ap.goals = ["Short-term: Clearly articulate the intricate layers of the psychic resonance to her commanding officers.", "Medium-term: Influence the crew\u2019s approach by integrating her empathic findings with scientific observations.", "Ultimate: Foster a broader understanding that connects disparate civilizations through shared emotional and historical experiences."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Commander Riker stands confidently near the conference table, his arms crossed in a relaxed yet alert manner as he listens intently to the conversation. His slight smile and focused demeanor convey both reassurance and a readiness to pursue further investigation, balancing his natural charm with a strategic attentiveness.',
        ap.emotional_state = 'Riker’s outward optimism is tempered by a deep-seated concern for the crew and the potential dangers hinted at in the readings. His expressions mix approachable confidence with a measured caution, reflecting an internal dialogue that weighs intuitive judgments against the empirical data before him, all while striving to keep the team’s morale steady.',
        ap.emotional_tags = ["Riker\u2019s outward optimism is tempered by a deep-seated concern for the crew", "the potential dangers hinted at in the readings. His expressions mix approachable confidence with a measured caution, reflecting an internal dialogue that weighs intuitive judgments against the empirical data before him, all while striving to keep the team\u2019s morale steady."],
        ap.active_plans = ["Investigate the possibility that the energy patterns represent a distress signal from a collapsing civilization.", "Evaluate the implications of the psychic resonance on both crew safety and diplomatic engagement.", "Support Picard's command decisions by integrating empirical evidence with his strategic instincts."],
        ap.beliefs = ["Intuition is as vital as hard data when facing unknown challenges.", "Loyalty to the crew and Starfleet principles guides every action.", "A balanced approach of caution and proactive exploration best serves the mission."],
        ap.goals = ["Short-term: Seek clarification on the nature of the energy readings during the discussion.", "Medium-term: Gather further evidence to assess whether these phenomena indicate a crisis.", "Ultimate: Ensure the safety of the crew while advancing the mission of exploration into uncharted territories."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_1'})
    ON CREATE SET
        oi.description = 'The Transporter Console serves as the central control hub in the Transporter Room, displaying real-time system diagnostics and sensor readouts crucial to the mission. It is the interface through which La Forge confirms that the transporter systems are functioning flawlessly, as it locks onto the strongest energy source from the subterranean structure. Its high-resolution displays and tactile controls weave together data from multiple subsystems to provide a seamless operational picture, driving the narrative pace and technical precision of the event.',
        oi.status_before = 'Prior to the event, the console was operating under normal conditions, displaying standard system diagnostics and awaiting command inputs from the engineering team.',
        oi.status_after = 'Following La Forge\'s confirmation, the console now exhibits a locked signal tracking the powerful energy source, reflecting its updated state of readiness and the critical shift from routine diagnostics to active mission support.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_5'})
    ON CREATE SET
        oi.description = 'The transporter console serves as the heart of the transporter operations in this event. It displays detailed diagnostics and controls the sequence of dematerialization and rematerialization. O\'Brien uses it to monitor energy readings and system statuses, ensuring that every parameter meets the stringent safety requirements before energizing the transporter beam. Its responsive interface bridges the gap between human command and advanced machine precision, marking the transition from planning to action.',
        oi.status_before = 'Prior to the event, the console was fully operational with clear diagnostics displayed, indicating a stable and optimal condition ready for initiating the transporter sequence.',
        oi.status_after = 'After the command is issued, the console updates its status to reflect the energized state of the transporter systems, confirming that the energy beam is active and the transporter sequence has commenced successfully.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Chief Engineer Geordi La Forge stands at the transporter console with an assured stance, his hands deftly manipulating the control panel. He leans forward to examine the data readouts and confidently announces that the transporter systems are operating at optimum efficiency, his gestures precise and deliberate as he outlines the locked energy source from the subterranean structure.',
        ap.emotional_state = 'La Forge exhibits a calm and determined demeanor, his focused gaze and measured tone reflecting technical mastery. Beneath his composed exterior, a surge of quiet excitement and anticipation stirs, as he relishes the challenge of ensuring flawless system operation. Internally, he balances pride in his engineering expertise with a sense of responsibility for the mission’s success, remaining ever aware of the potential risks yet driven by an unwavering commitment to safety.',
        ap.emotional_tags = ["La Forge exhibits a calm", "determined demeanor, his focused gaze", "measured tone reflecting technical mastery. Beneath his composed exterior, a surge of quiet excitement", "anticipation stirs, as he relishes the challenge of ensuring flawless system operation. Internally, he balances pride in his engineering expertise with a sense of responsibility for the mission\u2019s success, remaining ever aware of the potential risks yet driven by an unwavering commitment to safety."],
        ap.active_plans = ["Ensure transporter systems remain at peak performance during the mission.", "Monitor and validate the incoming energy readings for further analysis.", "Coordinate with the away team to support a safe and efficient transition."],
        ap.beliefs = ["Precision and reliability of Starfleet technology are paramount.", "Thorough, methodical engineering is critical to overcoming unforeseen challenges.", "Safety and technical excellence form the foundation of mission success."],
        ap.goals = ["Short-term: Confirm and communicate transporter system readiness.", "Medium-term: Verify the energy source\u2019s characteristics and stability.", "Ultimate: Support the away mission with optimal technical oversight to ensure a successful investigation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Data stands at the operations station with an unfaltering, measured precision. His synthetic features remain inscrutable as he steps forward to present his analysis. Every gesture—whether a slight tilt of his head or the deliberate movement of his hand along the console—reinforces his commitment to empirical clarity while his posture exudes confidence and quiet authority.',
        ap.emotional_state = 'On the surface, Data’s voice remains impeccably calm and logical, his words flowing with detached clarity. Beneath this clinical exterior, however, there is a subtle undercurrent of intellectual excitement and a yearning to grasp a nuance of human emotion. His internal state is charged with a duality: the satisfaction of technical discovery intermingled with a persistent curiosity about the deeper, almost poetic mystery of the ancient structure\'s origins and significance.',
        ap.emotional_tags = ["On the surface, Data\u2019s voice remains impeccably calm", "logical, his words flowing with detached clarity. Beneath this clinical exterior, however, there is a subtle undercurrent of intellectual excitement", "a yearning to grasp a nuance of human emotion. His internal state is charged with a duality: the satisfaction of technical discovery intermingled with a persistent curiosity about the deeper, almost poetic mystery of the ancient structure's origins", "significance."],
        ap.active_plans = ["To deliver a precise, scientific explanation of the structure\u2019s composition and origin.", "To correlate its anomalous energy signature with previously recorded subspace incidents.", "To provide the commanding officers with actionable intelligence for a cautious yet informed investigation."],
        ap.beliefs = ["Objective analysis is essential for understanding both ancient technology and new phenomena.", "Empirical data must guide decision-making in uncertain situations.", "The pursuit of knowledge, even of long-forgotten histories, is fundamental to the Federation\u2019s progress."],
        ap.goals = ["Short-term: Accurately report the sensor readings and validate the analysis of the structure.", "Medium-term: Integrate the new findings into broader mission strategies and risk assessments.", "Ultimate: Enhance the Federation\u2019s understanding of ancient civilizations and their technologies through rigorous scientific inquiry."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Worf stands firmly, his posture rigid with readiness, as his eyes scan the transporter room with focused intensity. His hand rests near the hilt of his disruptor, and his stance is both protective and combat-ready. Every measured breath and slight shift of his weight underscores his commitment to safeguard the team, as he interjects with precise caution amid the technical dialogue.',
        ap.emotional_state = 'Outwardly, Worf projects a stoic calm and unwavering confidence, yet beneath the surface there is a charged tension fueled by years of Klingon warrior training. His emotions blend deep-seated vigilance, a subtle fear of latent threats, and an abiding determination to honor his duty. This internal conflict, mixing honor with a warrior’s instinct to preempt danger, shapes his every calculated word and gesture, illuminating his readiness to react against any sign of hostility.',
        ap.emotional_tags = ["Outwardly, Worf projects a stoic calm", "unwavering confidence, yet beneath the surface there is a charged tension fueled by years of Klingon warrior training. His emotions blend deep-seated vigilance, a subtle fear of latent threats,", "an abiding determination to honor his duty. This internal conflict, mixing honor with a warrior\u2019s instinct to preempt danger, shapes his every calculated word", "gesture, illuminating his readiness to react against any sign of hostility."],
        ap.active_plans = ["Ensure that every crew member remains alert to the possibility of unforeseen hostilities.", "Monitor sensor data for shifts in energy patterns that might signal defensive countermeasures.", "Prepare to initiate defensive protocols and engage swiftly should the situation escalate."],
        ap.beliefs = ["Caution in the face of the unknown is essential for the crew\u2019s safety.", "A warrior\u2019s honor is upheld by anticipating and neutralizing potential threats.", "Defensive readiness is not only a tactical necessity but a moral imperative for protecting the mission."],
        ap.goals = ["Short-term: Immediately communicate his concerns to bolster the crew\u2019s alertness.", "Medium-term: Coordinate with the away team to implement secure defensive measures.", "Ultimate: Ensure the preservation of crew safety and uphold the honor and integrity of Starfleet missions against any lurking perils."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Captain Jean-Luc Picard stands at the transporter room with a commanding yet measured presence. His posture is upright and composed as he uses subtle gestures to redirect the crew’s attention away from growing tension. His calm, deliberate movements and firm tone underline his intention to prioritize investigation and scientific inquiry over any potential for escalation.',
        ap.emotional_state = 'Picard exhibits a layered emotional state marked by calm determination and a deep sense of responsibility. Outwardly, his face reflects confidence and resolute authority, while his eyes reveal a quiet concern for the crew’s wellbeing. Beneath his composed exterior, he harbors a thoughtful awareness of the potential dangers that unchecked aggression may bring, balancing empathy with a commitment to rational exploration.',
        ap.emotional_tags = ["Picard exhibits a layered emotional state marked by calm determination", "a deep sense of responsibility. Outwardly, his face reflects confidence", "resolute authority, while his eyes reveal a quiet concern for the crew\u2019s wellbeing. Beneath his composed exterior, he harbors a thoughtful awareness of the potential dangers that unchecked aggression may bring, balancing empathy with a commitment to rational exploration."],
        ap.active_plans = ["Maintain a peaceful, investigative approach by diffusing heightened tensions.", "Redirect the crew\u2019s focus from confrontation to scientific data analysis.", "Ensure that every action taken is measured and aligned with Starfleet\u2019s principles of exploration over conflict."],
        ap.beliefs = ["Knowledge and understanding are paramount for both progress and peace.", "Diplomacy and careful inquiry are always preferable to reckless confrontation.", "Every mission should honor Starfleet\u2019s commitment to the preservation of life and the pursuit of truth."],
        ap.goals = ["Short-term: Stabilize the immediate atmosphere and prevent escalation in the transporter room.", "Medium-term: Guide the crew through a methodical investigation of the anomaly to gather actionable data.", "Ultimate: Uphold the Starfleet ideal of discovery and exploration with a lasting impact on interstellar diplomacy and scientific advancement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_obrien_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Miles O\'Brien stands firmly before the transporter console in Transporter Room 3, his posture assured and his hands moving with practiced precision across the intricate controls. His deliberate gestures and focused demeanor signal that he is executing the final critical command to energize the transporter sequence.',
        ap.emotional_state = 'O\'Brien projects calm determinism; his face is set with a steady confidence while his eyes reflect an inner focus borne of years of experience. Beneath his composed exterior, there lies a quiet intensity and dedication, as he balances technical expertise with concern for the crew\'s safety, making sure every step of the process is flawless.',
        ap.emotional_tags = ["O'Brien projects calm determinism; his face is set with a steady confidence while his eyes reflect an inner focus borne of years of experience. Beneath his composed exterior, there lies a quiet intensity", "dedication, as he balances technical expertise with concern for the crew's safety, making sure every step of the process is flawless."],
        ap.active_plans = ["Execute the transporter sequence with flawless technical precision.", "Verify that all systems function correctly to ensure the safe dematerialization and rematerialization of the away team.", "Coordinate with the bridge to confirm the successful initiation of the beam and maintain the timeline of the mission."],
        ap.beliefs = ["He believes in the infallibility of advanced Starfleet technology when expertly managed.", "He holds that crew safety is paramount in all operational decisions.", "He trusts the rigorous protocols and his extensive training to guide him in critical moments."],
        ap.goals = ["Short-term: Successfully energize the transporter to begin the away mission.", "Medium-term: Monitor and adjust transporter functionality to maintain optimal performance during the operation.", "Ultimate: Ensure the safety and security of the team while upholding Starfleet's commitment to exploration and diplomacy."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tricorder_tr590_mark_ix_event_4_1'})
    ON CREATE SET
        oi.description = 'The TR-590 Mark IX tricorder is actively used by Data to scan the room and analyze the enigmatic crystalline structure at the center of the chamber. Its advanced sensor suite captures nuanced subspace energy readings and provides critical data to illuminate the workings of the ancient technology, bridging the gap between Starfleet\'s scientific inquiry and the mysteries of the unknown.',
        oi.status_before = 'Before the event, the tricorder is in pristine condition, fully operational and securely held by Data, reflecting the latest in Starfleet\'s advanced technology.',
        oi.status_after = 'After the event, the tricorder continues its seamless operation, having recorded an extensive dataset of subspace energy patterns that will serve as a vital resource for further scientific analysis.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tricorder_tr590_mark_ix'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_subspace_amplifier_event_4_1'})
    ON CREATE SET
        oi.description = 'The crystalline structure is the epicenter of the event, its soft blue pulsations and resonant hum forming the backbone of the unfolding mystery. Serving as a subspace amplifier, it draws the attention of Data, triggers Worf’s defensive instincts, and piques Picard’s analytical curiosity. Its interaction with the surrounding carved walls and ambient energy underscores its role as both a technological marvel and a relic of an ancient civilization.',
        oi.status_before = 'Before the event, the crystalline structure exists silently at the center of the chamber, its energy pulsations subdued amid the ambient light and intricately carved surroundings.',
        oi.status_after = 'After the event, following the intensification of the ambient hum and the glowing carvings, the structure’s output becomes more dynamic, resonating at a heightened frequency that underlines its critical narrative significance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure_subspace_amplifier'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Data stands at the forefront of the chamber, methodically initiating a scan with his TR-590 Mark IX tricorder. His measured movements and precise gestures reflect an exacting focus as he zeroes in on the pulsating crystalline structure that dominates the room.',
        ap.emotional_state = 'Although Data\'s exterior remains logical and composed, there is a subtle excitement and wonder underlying his actions. He experiences a quiet internal yearning to bridge the gap between raw data and the aesthetic beauty of the mysterious ancient technology, all while maintaining his characteristic analytical detachment.',
        ap.emotional_tags = ["Although Data's exterior remains logical", "composed, there is a subtle excitement", "wonder underlying his actions. He experiences a quiet internal yearning to bridge the gap between raw data", "the aesthetic beauty of the mysterious ancient technology, all while maintaining his characteristic analytical detachment."],
        ap.active_plans = ["Complete a comprehensive scan of the subspace amplifier.", "Correlate the energy readings with historical data to identify anomalies.", "Document and relay precise sensor data to support further analysis."],
        ap.beliefs = ["Scientific inquiry is essential for unlocking universal mysteries.", "Every artifact holds potential knowledge regardless of its origin.", "Precision in data gathering forms the foundation of understanding."],
        ap.goals = ["Short-term: Accurately document and analyze the structure's energy output.", "Medium-term: Decipher the underlying subspace mechanisms at play.", "Ultimate: Contribute to Starfleet's broader comprehension of ancient technologies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Worf stands near the pulsating crystalline structure, his posture tense and ready as his hand remains near his disruptor. He surveys the room and the glowing carvings with a vigilant, measured expression, prepared to react at a moment\'s notice.',
        ap.emotional_state = 'Worf\'s face is a mask of controlled concern and stoic alertness. Externally, he voices apprehension about a possible trap, while internally, the instincts of a warrior and deep-seated suspicion of unknown dangers churn within him. His focus on protecting his team is underscored by a blend of honor, duty, and a personal readiness to face imminent threats.',
        ap.emotional_tags = ["Worf's face is a mask of controlled concern", "stoic alertness. Externally, he voices apprehension about a possible trap, while internally, the instincts of a warrior", "deep-seated suspicion of unknown dangers churn within him. His focus on protecting his team is underscored by a blend of honor, duty,", "a personal readiness to face imminent threats."],
        ap.active_plans = ["Evaluate the threat level posed by the subspace amplifier.", "Coordinate closely with Captain Picard to ensure the team's safety.", "Prepare immediate defensive action if the situation escalates."],
        ap.beliefs = ["Vigilance is paramount when confronting unfamiliar phenomena.", "Crew safety must always come before unbridled exploration.", "Ancient technologies can harbor unseen tactical dangers."],
        ap.goals = ["Short-term: Confirm the security of the immediate environment.", "Medium-term: Implement defensive measures if hostile activity is detected.", "Ultimate: Ensure the away team's successful and safe completion of the mission."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands with deliberate calm at the forefront of the chamber, guiding his team with measured authority. His composed stance, paired with attentive gestures and a steady gaze across the mysterious environment, underscores his readiness to confront the unknown with both caution and curiosity.',
        ap.emotional_state = 'Picard exudes a blend of thoughtful curiosity and measured caution. His calm exterior belies an inner resolve that balances the excitement of discovery with the responsibility of command. Beneath his reflective demeanor lies a careful calculation of risk and reward, merging intellectual inquiry with an empathetic concern for his crew\'s wellbeing.',
        ap.emotional_tags = ["Picard exudes a blend of thoughtful curiosity", "measured caution. His calm exterior belies an inner resolve that balances the excitement of discovery with the responsibility of comm", ". Beneath his reflective demeanor lies a careful calculation of risk", "reward, merging intellectual inquiry with an empathetic concern for his crew's wellbeing."],
        ap.active_plans = ["Guide the away team through the exploration of the central chamber.", "Integrate sensor data with intuitive judgment and historical context.", "Solicit and evaluate detailed input from all team members to determine next steps."],
        ap.beliefs = ["Diplomacy in exploration unlocks hidden truths.", "The preservation of life and knowledge should proceed in tandem.", "Every ancient mystery deserves both open inquiry and cautious examination."],
        ap.goals = ["Short-term: Secure the team's safe progression within the chamber.", "Medium-term: Decipher the significance of the crystalline structure\u2019s energy output.", "Ultimate: Uncover a legacy that could reshape the Federation\u2019s understanding of extinct civilizations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram materializes in the central chamber as a luminous, spectral figure. Standing gracefully before the pulsating crystalline structure, its tall, slender silhouette with elongated limbs and expansive, luminous eyes exudes an ethereal presence. It drifts effortlessly, its form slowly coalescing and dissipating around the edges, as if suspended between the realms of memory and energy.',
        ap.emotional_state = 'The hologram emanates a calm yet inscrutable aura, its presence seemingly untouched by time. While its tone is measured and welcoming, there is an underlying intensity that hints at millennia of hidden sorrow, pride, and quiet longing. Its spectral expression carries the weight of an ancient legacy that both invites connection and warns of inevitable change, leaving the away team to sense an emotional duality that defies simple explanation.',
        ap.emotional_tags = ["The hologram emanates a calm yet inscrutable aura, its presence seemingly untouched by time. While its tone is measured", "welcoming, there is an underlying intensity that hints at millennia of hidden sorrow, pride,", "quiet longing. Its spectral expression carries the weight of an ancient legacy that both invites connection", "warns of inevitable change, leaving the away team to sense an emotional duality that defies simple explanation."],
        ap.active_plans = ["Welcome and establish contact with the away team to initiate a dialogue about the ancient civilization.", "Guide the team through the significance of the crystalline structure and the chamber\u2019s mystical details.", "Reveal cryptic insights that hint at the lost wisdom and the transformative knowledge of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 culture."],
        ap.beliefs = ["Believes that the legacy of its people endures through the preservation of knowledge.", "Believes that the away team is destined to uncover the truths hidden within the chamber.", "Believes in the ultimate value of enlightenment and the continuity of ancient wisdom across time and space."],
        ap.goals = ["Short-term: To establish initial contact by delivering a measured and mysterious greeting.", "Medium-term: To guide the away team through the enigmatic environment and impart critical insights about the ancient technology.", "Ultimate: To ensure that the wisdom and legacy of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization is understood and preserved, influencing future interstellar exploration."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_data_storage_devices_event_5_1'})
    ON CREATE SET
        oi.description = 'The Crystalline Data Storage Devices play a crucial role in the unfolding narrative as silent custodians of an ancient civilization’s wisdom. Their translucent facets and subtle refractions of ambient light not only mesmerize the eye but also serve as a beacon of hidden knowledge, drawing Data’s analytical prowess and Picard’s contemplative inquiry. Their intricate design, embedded in the dark, obsidian walls, frames the entire archive and underscores the magnitude of the discovery.',
        oi.status_before = 'Before the event, the devices were arranged in orderly repose along the chamber walls, exuding a soft, passive luminescence that hinted at their dormant yet potent reservoirs of data.',
        oi.status_after = 'After the event, the devices appear to be activated by the presence and scrutiny of the away team, their ambient glow deepening and resonating with a newfound vibrancy as symbolic conduits of the long-lost civilization\'s legacy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_data_storage_devices_event_5_2'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices form the backbone of the vast archive, their translucent facets casting mesmerizing patterns of light across the chamber. They house an immense repository of the ancient civilization’s accumulated wisdom, serving as silent sentinels to the legacy and history embedded within the facility. Their presence not only underscores the technological prowess of the ancients, but also acts as an interactive canvas that enhances the hologram’s revelations as the ambient light shifts in response to the unfolding dialogue.',
        oi.status_before = 'Prior to the event, the devices were arranged systematically along the chamber walls, emitting a gentle, ambient glow that hinted at the depth of stored knowledge, each crystal pristine and undisturbed in their fixed positions.',
        oi.status_after = 'Following the event, the devices continue to radiate soft light, yet their role gains narrative prominence as they now visibly pulsate in sympathy with the holographic message, symbolizing the active transmission of ancient wisdom and inviting further exploration by the away team.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_data_storage_devices'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Data stands before the crystalline archive with measured precision, his posture upright and his gaze intent. He methodically operates his tricorder and scanning arrays, his elegant movements betraying his excitement as he absorbs every detail of the ancient data storage devices.',
        ap.emotional_state = 'Beneath his characteristically unflappable exterior, Data experiences an intense surge of enthusiasm and intellectual curiosity. His logical mind buzzes with the thrill of discovery, while an almost imperceptible yearning to understand the poetic nature of this ancient wisdom underlies his composed manner. This internal complexity harmonizes his scientific passion with a subtle, reflective awe.',
        ap.emotional_tags = ["Beneath his characteristically unflappable exterior, Data experiences an intense surge of enthusiasm", "intellectual curiosity. His logical mind buzzes with the thrill of discovery, while an almost imperceptible yearning to underst", "the poetic nature of this ancient wisdom underlies his composed manner. This internal complexity harmonizes his scientific passion with a subtle, reflective awe."],
        ap.active_plans = ["Conduct a comprehensive scan of the crystalline data", "Extract and catalog the archived knowledge for deeper analysis", "Establish correlations between the ancient technology and Federation records"],
        ap.beliefs = ["Every piece of data holds intrinsic value for historical progress", "Understanding ancient technologies advances future exploration", "Scientific inquiry is key in bridging past legacies with contemporary knowledge"],
        ap.goals = ["Short-term: Complete detailed diagnostics of the archive", "Medium-term: Analyze the interface between ancient and modern data systems", "Ultimate: Unravel the mysteries of the ancient civilization\u2019s legacy"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands authoritatively amidst the quiet majesty of the archive. His posture is calm and reflective as he surveys the endless rows of crystalline storage devices, engaging in thoughtful dialogue with his crew. Every measured step and discerning glance underscores his command and contemplative spirit.',
        ap.emotional_state = 'Picard exudes a composed yet profound reverence for the vastness of knowledge contained within the archive. His outward calm belies an inner conflict between cautious optimism and the heavy responsibility of discovery. While his facial expressions remain subdued, his eyes convey the weight of potential revelations and a deep personal connection to the historic legacy unfolding before him.',
        ap.emotional_tags = ["Picard exudes a composed yet profound reverence for the vastness of knowledge contained within the archive. His outward calm belies an inner conflict between cautious optimism", "the heavy responsibility of discovery. While his facial expressions remain subdued, his eyes convey the weight of potential revelations", "a deep personal connection to the historic legacy unfolding before him."],
        ap.active_plans = ["Interpret and contextualize the cryptic messages from the archive", "Ensure the integrity of the discovery for future generations", "Guide his crew to secure and document every transformative detail"],
        ap.beliefs = ["Cultural legacy and historical knowledge are key to progress", "True understanding requires balanced skepticism and open-minded exploration", "Duty and wisdom must guide every step in uncharted territory"],
        ap.goals = ["Short-term: Comprehend the initial data and symbolic messages", "Medium-term: Develop a structured plan for further investigation", "Ultimate: Leverage the discovery to broaden the Federation\u2019s understanding of the cosmos"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram materializes as a luminous, ethereal figure with elongated features and soft, pulsating light. It floats steadily in the archive corridor, gesturing slowly to guide the away team through the ancient passageways with deliberate, unhurried movements.',
        ap.emotional_state = 'Radiating an ancient calm fused with a silent urgency, the hologram projects an air of solemn wisdom. Internally, it harbors a bittersweet longing for a lost heritage yet remains resolutely composed, its spectral presence echoing both pride in its legacy and a quiet melancholy for what was left behind.',
        ap.emotional_tags = ["Radiating an ancient calm fused with a silent urgency, the hologram projects an air of solemn wisdom. Internally, it harbors a bittersweet longing for a lost heritage yet remains resolutely composed, its spectral presence echoing both pride in its legacy", "a quiet melancholy for what was left behind."],
        ap.active_plans = ["Communicate the profound legacy of its people to the crew.", "Guide the away team through the historical corridors to reveal hidden truths.", "Ensure that the ancient knowledge is transmitted accurately without misinterpretation."],
        ap.beliefs = ["Knowledge is the eternal bond that binds civilizations.", "Transcendence of physical form elevates consciousness beyond time.", "The legacy of a culture must be preserved for future understanding."],
        ap.goals = ["Short-term: Clearly convey the purpose and history of the archive.", "Medium-term: Facilitate an accurate understanding of the ancients' wisdom among the away team.", "Ultimate: Establish a bridge of interstellar communication to inspire ongoing exploration and discovery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Worf stands rigidly, his posture exuding a blend of alert vigilance and martial readiness. His eyes dart between the holographic projection and the intricately carved walls as he grips his disruptor, every muscle tensed and prepared for sudden action in the dimly lit archive corridor.',
        ap.emotional_state = 'Externally, Worf displays a stoic, unwavering determination, tempered by a deep-seated skepticism about the unknown. Beneath his controlled exterior, there is an underlying current of apprehension and a distrust of technologies and energies he cannot fully comprehend, reflecting the inner conflict between his warrior instincts and his duty as a Starfleet officer.',
        ap.emotional_tags = ["Externally, Worf displays a stoic, unwavering determination, tempered by a deep-seated skepticism about the unknown. Beneath his controlled exterior, there is an underlying current of apprehension", "a distrust of technologies", "energies he cannot fully comprehend, reflecting the inner conflict between his warrior instincts", "his duty as a Starfleet officer."],
        ap.active_plans = ["Survey the archive for any potential threats or traps.", "Maintain a defensive stance to protect the crew at all costs.", "Probe the hologram\u2019s information for inconsistencies that might indicate hidden danger."],
        ap.beliefs = ["Honor and duty demand unyielding vigilance in the face of uncertainty.", "The unknown must be met with skepticism and readiness for combat.", "Loyalty to the crew overrides all personal doubts when security is at stake."],
        ap.goals = ["Short-term: Identify any immediate dangers within the subterranean archive.", "Medium-term: Ensure that the away team remains secure while navigating the ancient facility.", "Ultimate: Uphold the Klingon values of honor and protection in the service of Starfleet."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands with measured authority at the forefront of the archival chamber, his calm gaze fixed on both the holographic figure and the crystalline walls. His posture is relaxed yet alert, with a subtle inclination towards the hologram as he listens intently and contemplates the revelations before him.',
        ap.emotional_state = 'Picard exudes a composed, reflective demeanor that balances intellectual curiosity with guarded caution. Outwardly, he is engaged and respectful, yet internally he wrestles with the weight of historical significance and the potential implications of this ancient legacy. A quiet determination underpins his thoughtful inquiry, as he balances hope with the responsibilities of command.',
        ap.emotional_tags = ["Picard exudes a composed, reflective demeanor that balances intellectual curiosity with guarded caution. Outwardly, he is engaged", "respectful, yet internally he wrestles with the weight of historical significance", "the potential implications of this ancient legacy. A quiet determination underpins his thoughtful inquiry, as he balances hope with the responsibilities of comm", "."],
        ap.active_plans = ["Facilitate a clear and diplomatic dialogue with the Ancient Hologram.", "Assimilate the historical data presented in order to enhance the Federation\u2019s understanding.", "Ensure that every element of the encounter is documented for deeper analysis."],
        ap.beliefs = ["The pursuit of knowledge is essential to the growth of civilization.", "Diplomacy and respectful inquiry are paramount even in the face of unprecedented phenomena.", "Understanding the past is key to navigating the future with wisdom."],
        ap.goals = ["Short-term: Extract critical details about the archive and its origins.", "Medium-term: Validate the authenticity and significance of the ancients\u2019 knowledge.", "Ultimate: Integrate this newfound wisdom into the broader mission of peaceful exploration and scientific advancement."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_enterprise_d_main_bridge'})
    MERGE (a)-[:LOCATED_IN]->(b);
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
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
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
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_2'}),
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
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_obrien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_obrien_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_obrien_event_3_5'}),
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
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
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
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
