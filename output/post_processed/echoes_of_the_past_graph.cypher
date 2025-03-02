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
        a.description = 'Jean-Luc Picard is the revered commanding officer of the USS Enterprise-D, renowned for his intellectual depth, diplomatic acumen, and unwavering commitment to exploration and ethical principles. His calm, reflective approach under pressure has guided his crew through numerous challenges, blending logic with empathy to always keep the welfare of his crew and the mission in focus.',
        a.traits = ["wise", "diplomatic", "calm", "reflective"],
        a.sphere_of_influence = 'Interstellar exploration and diplomacy'
    ;
MERGE (a:Agent {uuid: 'agent_william_t_riker'})
    ON CREATE SET
        a.name = 'William T. Riker',
        a.title = 'Commander',
        a.description = 'William T. Riker, the first officer of the Enterprise-D, is known for his blend of confident action and insightful consideration. He demonstrates tactical awareness and a practical, optimistic approach to potentially dangerous situations, valuing collaborative problem-solving and nuanced perspectives in his leadership.',
        a.traits = ["Optimistic", "Tactical", "Confident", "Practical"],
        a.sphere_of_influence = 'Starfleet Command Operations'
    ;
MERGE (a:Agent {uuid: 'agent_data'})
    ON CREATE SET
        a.name = 'Data',
        a.title = 'None',
        a.description = 'Data is Starfleet\'s advanced Soong-type android whose quest to understand humanity drives his precise and logical nature. With a superior intellect and an unerring capacity for analysis, he provides invaluable insights during exploratory missions and is a unique learner of life’s emotional nuances.',
        a.traits = ["analytical", "precise", "inquisitive", "methodical"],
        a.sphere_of_influence = 'Scientific analysis and technological expertise'
    ;
MERGE (a:Agent {uuid: 'agent_worf'})
    ON CREATE SET
        a.name = 'Worf',
        a.title = 'None',
        a.description = 'Worf is a Klingon Starfleet officer known for his formidable presence and martial prowess, balanced by an unwavering sense of honor. His tactical expertise and vigilant nature make him essential in dangerous situations, as he consistently assesses threats while remaining loyal to Starfleet protocols.',
        a.traits = ["brave", "vigilant", "honorable", "tactically skilled"],
        a.sphere_of_influence = 'Tactical defense and security'
    ;
MERGE (a:Agent {uuid: 'agent_janina_taur'})
    ON CREATE SET
        a.name = 'Janina Taur',
        a.title = 'Ensign',
        a.description = 'Janina Taur is a promising young officer, freshly graduated from Starfleet Academy\'s Class of 2362. Serving at the helm on the USS Enterprise-D, her technical skills and quick decision-making have positioned her as a rising star in Starfleet, eager to contribute to exploratory missions and learn from experienced leadership.',
        a.traits = ["Competent", "Eager", "Responsive", "Technically Skilled"],
        a.sphere_of_influence = 'Navigation and piloting the Enterprise'
    ;
MERGE (a:Agent {uuid: 'agent_deanna_troi'})
    ON CREATE SET
        a.name = 'Deanna Troi',
        a.title = 'Counselor',
        a.description = 'Deanna Troi serves as the counselor aboard the USS Enterprise-D, using her empathic abilities and Betazoid heritage to sense the emotions of others. Her insights into complex interpersonal and interspecies relations help guide the crew toward compassionate and effective solutions during critical encounters.',
        a.traits = ["Empathetic", "Intuitive", "Sensitive", "Perceptive"],
        a.sphere_of_influence = 'Interpersonal and Interspecies Relations'
    ;
MERGE (a:Agent {uuid: 'agent_geordi_la_forge'})
    ON CREATE SET
        a.name = 'Geordi La Forge',
        a.title = 'Chief Engineer',
        a.description = 'Geordi La Forge is the ingenious Chief Engineer aboard the USS Enterprise-D, celebrated for his technical prowess and inventive problem-solving skills. His calm under pressure and rapid analytical thinking make him invaluable in addressing complex engineering challenges across the starship\'s systems.',
        a.traits = ["Innovative", "Resourceful", "Calm under pressure", "Technically proficient"],
        a.sphere_of_influence = 'Engineering and starship technology'
    ;
MERGE (a:Agent {uuid: 'agent_reginald_barclay'})
    ON CREATE SET
        a.name = 'Reginald Barclay',
        a.title = 'Lieutenant',
        a.description = 'Reginald Barclay is a brilliant, albeit socially awkward, officer whose technical aptitude and problem-solving skills have proven invaluable. His work in engineering support and communications, highlighted by his role in the successful Zibalian trade negotiations, underscores his dedication despite occasional self-doubt.',
        a.traits = ["Brilliant", "Innovative", "Socially awkward", "Diligent"],
        a.sphere_of_influence = 'Engineering support and communications'
    ;
MERGE (a:Agent {uuid: 'agent_miles_o_brien'})
    ON CREATE SET
        a.name = 'Miles O\'Brien',
        a.title = 'Transporter Chief',
        a.description = 'Miles O\'Brien is the experienced and dependable Transporter Chief aboard the USS Enterprise-D. His mastery of the transporter system ensures the safe and precise movement of crew members, and his deep technical understanding inspires confidence across high-pressure operations.',
        a.traits = ["Dependable", "Technically proficient", "Calm", "Experienced"],
        a.sphere_of_influence = 'Transporter system operations and logistics'
    ;
MERGE (a:Agent {uuid: 'agent_davies'})
    ON CREATE SET
        a.name = 'Davies',
        a.title = 'Ensign',
        a.description = 'Ensign Davies is a member of the security detail stationed in the transporter room. Despite being newly assigned, Davies demonstrates a high level of alertness and responsibility, ensuring that potential security threats are managed effectively during critical operations.',
        a.traits = ["Alert", "Responsible", "Dedicated", "Observant"],
        a.sphere_of_influence = 'Security and operational support'
    ;
MERGE (a:Agent {uuid: 'agent_lal'})
    ON CREATE SET
        a.name = 'লাল',
        a.title = 'Ensign',
        a.description = 'Ensign লাল is a member of the security team assigned to the transporter room. Despite potential communication or cultural barriers, লাল integrates effectively with the crew, showing steadfast commitment to duty and ensuring that critical ship operations proceed without incident.',
        a.traits = ["Steadfast", "Observant", "Dedicated", "Alert"],
        a.sphere_of_influence = 'Security operations and team support'
    ;
MERGE (a:Agent {uuid: 'agent_ancient_hologram'})
    ON CREATE SET
        a.name = 'Ancient Hologram',
        a.title = 'None',
        a.description = 'The Ancient Hologram is an enigmatic projection from a long-vanished civilization known as the প্রাচীন. Manifesting as a tall, slender, ethereal figure with luminous eyes, it delivers whispered messages from an era where technology and spirituality were intertwined, offering ancient wisdom and interstellar legacy.',
        a.traits = ["mysterious", "wise", "ethereal", "enigmatic"],
        a.sphere_of_influence = 'Ancient wisdom and interstellar legacy'
    ;
MERGE (o:Object {uuid: 'object_padd'})
    ON CREATE SET
        o.name = 'PADD (Personal Access Display Device)',
        o.description = 'The PADD is a sleek, handheld computer used extensively aboard the USS Enterprise-D. It serves as a repository for critical Starfleet data and facilitates information transfer between various ship departments with its advanced processing capabilities and interactive display.',
        o.purpose = 'To provide a portable and efficient means of accessing and managing Starfleet data onboard the ship.',
        o.significance = 'The PADD represents the synthesis of advanced technology and operational efficiency, enabling senior officers like Captain Picard to make informed decisions quickly.'
    ;
MERGE (o:Object {uuid: 'object_holographic_display'})
    ON CREATE SET
        o.name = 'Holographic Display',
        o.description = 'An advanced emitter system located in the Observation Lounge, the holographic display projects detailed three-dimensional images. Upgraded at Starbase 74 in 2369, it presents rotating, detailed visualizations such as a scan of Melatrite III, playing a vital role in briefings and strategic discussions.',
        o.purpose = 'Visualizing spatial scans and data for analysis.',
        o.significance = 'Facilitates strategic discussion and understanding of key spatial data for mission planning.'
    ;
MERGE (o:Object {uuid: 'object_transporter_console'})
    ON CREATE SET
        o.name = 'Transporter Console',
        o.description = 'A sophisticated control panel filled with intuitive interfaces, tactile buttons, and luminous displays. The console is designed to coordinate the complex process of dematerialization and rematerialization, ensuring the safe transport of crew members during missions.',
        o.purpose = 'To monitor and facilitate the secure operation of the transporter systems during missions.',
        o.significance = 'Ensures mission safety and operational coordination during high-stakes away missions, reflecting the technological prowess of the USS Enterprise-D.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_structure'})
    ON CREATE SET
        o.name = 'Crystalline Structure',
        o.description = 'A massive, towering structure composed of crystal that dominates the central chamber. Emitting a soft blue light and a subtle humming sound, it is identified as a subspace amplifier with intricate design, suggesting advanced, potentially ancient technology beyond contemporary Federation understanding.',
        o.purpose = 'Subspace energy amplification.',
        o.significance = 'Acts as a central mystery and source of energy readings, hinting at ancient technological prowess.'
    ;
MERGE (o:Object {uuid: 'object_tricorder_model_tr_590_mark_ix'})
    ON CREATE SET
        o.name = 'Tricorder (Model TR-590 Mark IX)',
        o.description = 'Data\'s personal scanning device, a Model TR-590 Mark IX tricorder, is a handheld instrument designed for scientific analysis. In this context, it is used to study the properties of a mysterious crystalline structure by emitting soft musical tones while gathering data.',
        o.purpose = 'Scientific scanning and data analysis.',
        o.significance = 'Provides exposition by confirming the nature and properties of the crystalline structure, highlighting Data\'s analytical approach.'
    ;
MERGE (o:Object {uuid: 'object_carvings'})
    ON CREATE SET
        o.name = 'Carvings',
        o.description = 'Intricate carvings adorning the walls of the central chamber, crafted from an obsidian-like material. They depict celestial events and abstract geometric patterns, suggesting an ancient civilization with advanced artistic and astronomical knowledge. The carvings begin to glow as the away team approaches the crystalline structure, hinting at a reactive property.',
        o.purpose = 'Decorative, potentially informational or reactive elements.',
        o.significance = 'Indicate ancient craftsmanship and add to the mysterious atmosphere, hinting at a civilization with deep astronomical and artistic understanding.'
    ;
MERGE (o:Object {uuid: 'object_holographic_projection'})
    ON CREATE SET
        o.name = 'Holographic Projection',
        o.description = 'A sudden holographic projection that appears in the central chamber, taking the form of a tall, slender humanoid with elongated limbs and large, luminous eyes. This projection represents a member of the প\\u{9c}র\\u{9b}চীন species and is capable of speech, delivering greetings in whispers.',
        o.purpose = 'Functions as a communication interface, representing the ancient civilization (প\\u{9c}র\\u{9b}চীন).',
        o.significance = 'Drives the plot forward by introducing direct interaction with an ancient civilization.'
    ;
MERGE (o:Object {uuid: 'object_crystalline_archive_devices'})
    ON CREATE SET
        o.name = 'Crystalline Data Storage Devices',
        o.description = 'A series of meticulously arranged, glowing crystal constructs lining the walls of a vast archive. Their facets refract light into soft, ambient hues, and they are inscribed with symbolic carvings. These devices preserve the accumulated knowledge and records of an ancient civilization.',
        o.purpose = 'To preserve and store the accumulated knowledge and records of the Ancient civilization for posterity.',
        o.significance = 'Symbolizes the enduring legacy of a civilization that transcended physical form, offering crucial insights into an era of advanced technology and spiritual enlightenment.'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_main_bridge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Main Bridge',
        l.description = 'The main bridge of the USS Enterprise-D is a technological marvel and the nerve center of the starship. Bathed in a gentle glow from instrument panels and a vast viewscreen, the space is designed for optimal command and control. The room combines high-tech interfaces with comfortable, yet utilitarian, seating arrangements. Each station, from navigation to operations and tactical, is manned by skilled officers ensuring smooth coordination. This bridge exudes a sense of calm professionalism and readiness, setting the stage for decisions that can alter the course of interstellar events.',
        l.type = 'Spacecraft Bridge'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Observation Lounge',
        l.description = 'The Observation Lounge on the USS Enterprise-D is designed as a tranquil space for contemplation and informal meetings, offering a sweeping panoramic view of the cosmos through its large windows. In this scene, the vibrant Melatrite Nebula dominates the view, its swirling colors creating a dramatic backdrop. The lounge is equipped with a conference table and holographic display emitter, upgraded in 2369, reflecting a blend of a relaxed setting with advanced technological capabilities for briefings and discussions. The atmosphere is conducive to open conversation and strategic thinking, away from the bustle of the bridge.',
        l.type = 'Starship Lounge'
    ;
MERGE (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    ON CREATE SET
        l.name = 'USS Enterprise-D - Transporter Room 3',
        l.description = 'The Transporter Room 3 aboard the USS Enterprise-D is a bustling hub of advanced technological activity and meticulous coordination. This industrial yet orderly space features panels of blinking lights and control stations that manage and monitor the intricacies of the transporter process. The room is characterized by a constant hum of energized equipment and the focused urgency of its crew. Data interfaces, toolkits, and consoles are strategically arranged to support high-stakes away missions, imbuing the space with a sense of both precision and suspense.',
        l.type = 'Starship facility'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    ON CREATE SET
        l.name = 'Melatrite III - Subterranean Structure - Central Chamber',
        l.description = 'The Central Chamber is a vast, circular space located deep within a subterranean structure on Melatrite III. Its walls, constructed from a smooth, obsidian-like material, absorb most light, casting the chamber in perpetual dimness and lending it an imposing atmosphere. Richly adorned with intricate carvings depicting celestial events and abstract geometric patterns, the chamber hints at the advanced and artistic nature of its builders. At its center, a massive crystalline structure pulses with a soft, ethereal blue light, accompanied by a strange, almost musical hum that permeates the air, evoking ancient mystery and latent energy.',
        l.type = 'Subterranean Chamber'
    ;
MERGE (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_archive'})
    ON CREATE SET
        l.name = 'Melatrite III - Subterranean Structure - Archive',
        l.description = 'The archive within the subterranean structure on Melatrite III is an awe-inspiring chamber filled with rows of crystalline data storage devices that glow softly in the dim light. The architecture fuses ancient and advanced elements, with walls adorned by intricate carvings that hint at celestial events and a profound legacy. Heavy with history and mystery, the space invites exploration of forgotten knowledge with every reflective surface and subtle hum echoing the presence of a long-ascended civilization.',
        l.type = 'Ancient Archive'
    ;
MERGE (o:Organization {uuid: 'org_starfleet'})
    ON CREATE SET
        o.name = 'Starfleet',
        o.description = 'Starfleet serves as the exploratory and defense arm of an interstellar alliance, committed to the ideals of peace, scientific discovery, and diplomacy. Its members, drawn from diverse backgrounds, work in concert to explore unknown territories, establish first contacts, and maintain a strong moral compass in an ever-changing universe.',
        o.sphere_of_influence = 'Interstellar exploration, defense, and diplomacy'
    ;
MERGE (ep:Episode {uuid: 'episode-episode_one_-_echoes_of_the_past'})
    ON CREATE SET
        ep.title = 'Episode One - Echoes of the Past',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Initial Report: Subspace Phenomena Detected in Melatrite Nebula',
        s.description = 'The scene unfolds on the bustling bridge of the USS Enterprise-D, under standard operational conditions. Soft hums and gentle illumination from consoles fill the space as the crew goes about their duties. Captain Picard, seated in his command chair, reviews data on his PADD, while Commander Riker leans casually against a console, observing. Data is at his operations station, his movements precise and efficient, and Worf stands watch at tactical, ever vigilant. Ensign Taur is positioned at the helm, ready to pilot the vessel. The main viewscreen dominates the forward wall, displaying the swirling colors of the Melatrite Nebula, setting a visually striking backdrop to the unfolding drama. A sense of routine is quickly broken by the hint of an emerging anomaly, drawing the senior officers\' attention and setting the stage for a mission into the unknown.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_main_bridge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Captain Picard Requests Initial Sensor Report',
        e.description = 'Captain Picard initiates the scene by inquiring about the latest sensor readings from the Melatrite Nebula. He addresses Commander Riker, indicating the beginning of the unfolding situation and establishing Picard\'s proactive leadership. This moment sets the scene\'s central conflict: the potential presence of unusual subspace phenomena and Starfleet\'s interest in investigating it. Picard\'s formal tone and direct question immediately establish the professional and focused atmosphere on the bridge.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Commander Riker, have you had a chance to review the latest sensor readings from the Melatrite Nebula? Starfleet Command believes there may be unusual subspace phenomena occurring in that region."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Commander Riker Confirms Subspace Distortions and Draws Parallels',
        e.description = 'Commander Riker responds to Captain Picard, confirming the unusual sensor readings from the Melatrite Nebula. He details the findings, noting high concentrations of tetryon particles and gravimetric field distortions. To contextualize the situation, Riker references a past encounter – the Zakdorn crisis of \'69 – highlighting his experience and ability to draw insightful comparisons. This reference serves to underscore the potential seriousness of the situation and Riker\'s valuable historical perspective within the command structure.',
        e.sequence = 2,
        e.key_dialogue = ["RIKER: Yes, Captain. Preliminary scans show high concentrations of tetryon particles and intermittent distortions in the gravimetric field. It's reminiscent of the subspace anomalies we encountered near the Maranga system during the Zakdorn crisis of '69."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Data Identifies Melatrite III as Anomaly Source and Classifies Readings',
        e.description = 'Lieutenant Commander Data interjects with a detailed analysis, pinpointing Melatrite III as the source of the unusual energy readings. He specifies a level-three diagnostic and identifies the readings as consistent with a type-4 subspace inversion, while also noting unknown elements. Data\'s precise and analytical report escalates the situation by providing concrete data and emphasizing the anomaly\'s unique and potentially unnatural characteristics. His input solidifies the need for further investigation.',
        e.sequence = 3,
        e.key_dialogue = ["DATA: Captain, I have completed a level-three diagnostic of the long-range sensor array. I am detecting unusual energy readings emanating from a Class-M planet designated as Melatrite III. The readings are consistent with a type-4 subspace inversion, but also contain elements not found in any known natural phenomenon."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Captain Picard Orders Course to Melatrite III for Investigation',
        e.description = 'Captain Picard, based on the combined reports, makes the decisive command to investigate further. He directs Ensign Taur to set a course for Melatrite III at warp factor six. Picard\'s use of \'Intriguing\' and \'Let\'s take a closer look\' reveals his curiosity and proactive approach to exploration. This command marks a pivotal moment as it shifts the scene from information gathering to action, propelling the narrative forward and setting the stage for the away mission.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Intriguing. Ensign Taur, lay in a course for Melatrite III, warp factor six. Let's take a closer look."]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'Ensign Taur Executes Warp Engagement to Melatrite III',
        e.description = 'Ensign Taur responds to Captain Picard\'s order with professional efficiency. She confirms the course is laid in and immediately engages the warp drive. Taur\'s concise and confident \'Aye, Captain\' and \'Engaging warp drive\' demonstrate her competence and the smooth operation of the bridge crew. This event concludes the scene by showing the Enterprise-D actively moving towards the mystery, building anticipation for what they will find at Melatrite III. The warp drive engagement signifies the start of the mission.',
        e.sequence = 5,
        e.key_dialogue = ["TAUR: Aye, Captain. Course laid in. Engaging warp drive."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Contemplation Among the Stars',
        s.description = 'In the USS Enterprise-D\'s Observation Lounge, a sanctuary of quiet reflection and strategic thought, the crew gathers around a state-of-the-art holographic display that projects a detailed scan of Melatrite III. The expansive lounge features large panoramic windows offering a breathtaking view of the Melatrite Nebula, its swirling gases rendered in vibrant hues across the cosmic canvas. The atmosphere is one of measured tension and intellectual curiosity as Captain Picard, Commander Riker, and Counselor Deanna Troi deliberate over mysterious energy signatures that hint at both ancient technology and potential sentient involvement. The conversation is underpinned by themes of exploration, the legacy of lost civilizations, and the timeless quest for understanding in the vast unknown.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_observation_lounge'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Briefing the Nebula\'s Enigma',
        e.description = 'Captain Picard opens the discussion with a pointed inquiry about the energy readings emanating from Melatrite III, asking Counselor Troi for her insights on any signs of sentient involvement. The crew’s attention is focused on the holographic display emanating from the upgraded emitter system, which vividly portrays the scan of the distant world. Commander Riker contributes his perspective, speculating whether the readings could indicate a distress signal from a civilization in peril. The event sets the stage for a deeper investigation, highlighting the crew\'s mission to decipher cryptic signals and the potential historical significance of the ancient civilization once present in the Melatrite Nebula.',
        e.sequence = 1,
        e.key_dialogue = ["PICARD: Counselor, what are your impressions of these energy readings? Do they suggest any sentient involvement?", "TROI: The patterns are complex, Captain. I sense a mixture of emotions \u2013 fear, longing, but also a profound sense of hope. It's as if someone, or something, is reaching out across space, trying to communicate.", "RIKER: Could it be a distress signal? Perhaps a civilization facing some kind of cataclysm?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Unraveling the Psychic Echo',
        e.description = 'The dialogue deepens as Captain Picard muses over the enigmatic history of the Melatrite Nebula, alluding to its past as the home of the Ancient civilization whose technological marvels continue to reverberate across the cosmos. As he reflects on the lost legacy, Counselor Troi reveals an unexpected layer to her readings—a faint psychic resonance that feels strikingly familiar, like an echo from a bygone era. This moment underscores the emotional and intellectual stakes of the mission, as the crew confronts the possibility that the cosmos is subtly alive with memories and messages of the past. This revelation intensifies their drive to decipher not only scientific data but also the soulful imprints left by ancient beings.',
        e.sequence = 2,
        e.key_dialogue = ["PICARD: Possibly. Or it could be something else entirely. The Melatrite Nebula was once home to the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 (Ancient) civilization, a species that vanished over a million years ago, leaving behind only fragmented records and their signature on the cosmic background radiation.", "TROI: Captain, I'm also detecting a faint psychic resonance. It feels... familiar, somehow. Like an echo from the past."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Awaiting Transport to Melatrite III',
        s.description = 'The transporter room hums with purposeful activity as the away team prepares to beam down to Melatrite III. Chief Engineer La Forge, ever meticulous, oversees the final calibrations at the transporter console, assisted by the eager Lieutenant Barclay. Transporter Chief O\'Brien expertly manipulates the controls, his seasoned hands a blur of motion. Data, ever observant, stands impassively, while Worf maintains a vigilant stance, his hand instinctively near his disruptor. Ensigns Davies and লাল, part of the security detail, stand ready, their expressions a mix of anticipation and focused readiness. The air crackles with the energy of anticipation as the team awaits Captain Picard\'s final authorization to initiate transport to the mysterious subterranean structure, a relic from a civilization lost to time, now beckoning from the depths of Melatrite III.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_uss_enterprise_d_transporter_room_3'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Transporter Systems Ready',
        e.description = 'Chief Engineer La Forge announces that the transporter systems are fully operational and ready for use. He confirms a lock on the designated target location – the strongest energy source detected on Melatrite III, which appears to originate from a subterranean structure. La Forge\'s report signals the culmination of technical preparations, indicating the away team is cleared for immediate transport.',
        e.sequence = 1,
        e.key_dialogue = ["LA FORGE: Transporter systems are operating at optimal efficiency. We've locked onto the strongest energy source on the planet's surface. It appears to be originating from a subterranean structure."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Data Analyzes Structure\'s Origins',
        e.description = 'Data provides a startling analysis of the subterranean structure on Melatrite III. He reveals that preliminary scans suggest the structure predates the extinction of the ancient civilization by at least half a million years. Furthermore, he confirms that the energy signature emanating from the structure is consistent with the previously detected subspace readings. Data\'s findings underscore the immense age and enigmatic nature of the site, amplifying the sense of mystery surrounding their mission.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: The structure's composition is unknown, Chief. However, preliminary scans indicate that it predates the extinction of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 by at least five hundred thousand years. Its energy signature is consistent with the subspace readings we detected earlier."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Worf Warns of Potential Danger',
        e.description = 'Lieutenant Worf injects a note of caution into the preparations. He reminds the team that the ancient civilization was known for possessing formidable defensive technologies. Worf\'s warning serves as a crucial reminder of the potential dangers they might face on the planet\'s surface, urging them to be prepared for possible resistance and not to underestimate the unknown.',
        e.sequence = 3,
        e.key_dialogue = ["WORF: We should prepare for possible resistance. The \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 were known to have powerful defensive technologies."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Picard Orders Cautious Investigation',
        e.description = 'Captain Picard responds to Worf\'s concerns with measured agreement. He acknowledges the potential for danger but firmly reiterates the mission\'s primary objective: investigation. Picard emphasizes the need for caution and peaceful approach, directing the team to proceed with the intention of discovery and understanding, not engagement or conflict. His command underscores Starfleet\'s exploratory and diplomatic ethos.',
        e.sequence = 4,
        e.key_dialogue = ["PICARD: Agreed, Lieutenant. But let's proceed with caution. Our primary objective is to investigate, not to engage in hostilities."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Transport Initiated',
        e.description = 'With the final directives given, Transporter Chief O\'Brien announces the initiation of the transport sequence.  The transporter emitters activate, bathing the away team in a shimmering golden light, signifying the commencement of their journey to Melatrite III. The subtle hum of the transporter intensifies, building anticipation for the away team\'s arrival at the mysterious subterranean structure and the discoveries that await them.',
        e.sequence = 5,
        e.key_dialogue = ["O'BRIEN: Energizing."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'The Heart of the Ancient Structure',
        s.description = 'Inside the vast, circular chamber of Melatrite III\'s subterranean structure, the away team finds themselves enveloped by an otherworldly darkness. The chamber\'s obsidian-like walls, absorbing every stray beam of light, are adorned with intricate carvings that depict celestial events and abstract geometric patterns, evoking the forgotten artistry of an ancient civilization. At its center stands a massive crystalline structure pulsating with a soft, blue light that thunders in tune with the strange, musical hum resonating throughout the space. As the team uses advanced technology to scan and decipher the enigmatic energy readings, the atmosphere thickens with cautious anticipation and the promise of profound revelations. The interplay of ancient technology and cutting-edge science sets the stage for a narrative turning point that bridges past and present in a delicate dance of mystery and discovery.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_central_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Materialization and the Initial Scan',
        e.description = 'The away team materializes into the vast, circular chamber, immediately drawn to the mesmerizing, pulsating crystalline structure at its center. In this event, the crew takes in the eerie beauty of the obsidian walls with their shifting, glowing carvings as Data initiates a detailed scan using his TR-590 Mark IX tricorder. His discovery that the crystal acts as a subspace amplifier sets the analytical tone, while Worf’s cautious remark about the potential trap reinforces the tension. Meanwhile, Captain Picard’s measured command to proceed underscores the blend of bravery and responsibility that defines the crew\'s approach to the unknown. This event encapsulates the team’s initial encounter with the ancient technology, setting the stakes for the revelation that is to come.',
        e.sequence = 1,
        e.key_dialogue = ["DATA: Fascinating. The crystalline structure appears to be a form of subspace amplifier. It is resonating with the planet's natural subspace field, creating the energy patterns we detected.", "WORF: I do not like this, Captain. It feels like a trap.", "PICARD: Perhaps, Lieutenant. Or perhaps it's something else entirely. Let's proceed cautiously."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Emergence of the Ancient Hologram',
        e.description = 'As the away team edges closer to the pulsating crystalline structure, the atmosphere teeters between eerie calm and building suspense. The intensity of the humming grows louder, and the ancient carvings along the walls begin to glow, bathing the chamber in otherworldly light. Suddenly, a holographic projection materializes, coalescing into the form of a tall, slender humanoid figure with elongated limbs and luminous eyes. This enigmatic figure, representing a member of the long-vanished প্রাচীন species, declares its long-anticipated greeting and sets the stage for a profound revelation about the lost civilization’s legacy. This pivotal moment not only deepens the mystery but also challenges the crew’s understanding of history and destiny as they prepare to engage with a message from an ancient past.',
        e.sequence = 2,
        e.key_dialogue = ["ANCIENT HOLOGRAM: Greetings. We are the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8. We have awaited your arrival."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'A Cathedral of Ancient Knowledge',
        s.description = 'The away team enters the vast archive of the ancient civilization, a space that feels like a cathedral dedicated to knowledge.  Rows upon rows of crystalline data storage devices line the walls, stretching into the distance, each pulsing with a soft light, hinting at the immense data contained within. The air is cool and still, carrying a faint scent of ozone and dust, the atmosphere heavy with the weight of millennia. This archive represents the culmination of an ancient civilization\'s wisdom, a legacy deliberately preserved for future generations. The discovery of this archive marks a pivotal moment, promising to revolutionize the Federation\'s understanding of the universe and their place within it. It is a moment of profound awe and the beginning of a journey into the depths of ancient knowledge and cosmic history.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_melatrite_iii_subterranean_structure_archive'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Entering the Ancient Archive',
        e.description = 'Guided by the Ancient Hologram, the away team steps into the archive. The sheer scale of the space is immediately apparent, with crystalline data devices lining the walls like books in an endless library. The archive exudes an aura of immense age and profound knowledge. The team is visibly awestruck by the sight, recognizing the significance of this repository of ancient wisdom.',
        e.sequence = 1,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Data Marvels at the Ancient Knowledge',
        e.description = 'Data, his positronic brain processing the immensity of the archive, expresses his astonishment. He declares that the archive surpasses the entire Federation historical database in scope, estimating centuries would be needed for full analysis. His excitement is palpable as he grasps the potential for groundbreaking discoveries. Picard, while equally impressed, brings a captain\'s pragmatism, acknowledging the revolutionary potential but immediately focusing on the mission\'s core objective: understanding the Ancients\' purpose.',
        e.sequence = 2,
        e.key_dialogue = ["DATA: This archive is remarkable, Captain. It contains more data than the entire Federation historical database. It would take centuries to analyze it all.", "PICARD: Indeed, Commander. This could revolutionize our understanding of the universe."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'The Ancient Hologram Reveals the Archive\'s Purpose',
        e.description = 'The Ancient Hologram explains the profound purpose behind the archive\'s creation. It was built as a deliberate act of preservation, a repository of their civilization\'s accumulated knowledge intended to reach out to other civilizations across time. They foresaw their own end and sought to ensure their legacy endured, offering their wisdom to any who might discover it. This revelation underscores the Ancients\' foresight and their hope for connection beyond their own existence.',
        e.sequence = 3,
        e.key_dialogue = ["ANCIENT HOLOGRAM: We built this facility to preserve our knowledge and to reach out to other civilizations. We knew that our time was coming to an end, but we hoped that our legacy would endure."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Worf Asks About the Ancients\' Fate',
        e.description = 'Worf, in a rare display of curiosity beyond tactical concerns, directly inquires about the fate of the Ancient civilization. His question reflects a shift from apprehension to genuine interest in understanding these enigmatic beings. In response, the Hologram unveils the extraordinary truth: the Ancients achieved transcendence, ascending to a higher plane of existence beyond physical form. They left behind this archive as a part of themselves, a lingering echo of their consciousness awaiting discovery and understanding. This revelation is both profound and humbling, presenting a vision of evolution and existence beyond the material realm.',
        e.sequence = 4,
        e.key_dialogue = ["WORF: What happened to your people?", "ANCIENT HOLOGRAM: We ascended to a higher plane of existence, leaving behind our physical forms. But we left a part of ourselves within this archive, a memory, an echo, waiting for someone to listen."]
    ;
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_data'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_padd'}),
          (a:Agent {uuid: 'agent_jean_luc_picard'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_holographic_display'}),
          (a:Agent {uuid: 'org_starfleet'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_transporter_console'}),
          (a:Agent {uuid: 'org_starfleet'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_tricorder_model_tr_590_mark_ix'}),
          (a:Agent {uuid: 'org_starfleet'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_data'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_deanna_troi'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_geordi_la_forge'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_reginald_barclay'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_davies'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lal'}),
          (o:Organization {uuid: 'org_starfleet'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_padd_event_1_1'})
    ON CREATE SET
        oi.description = 'Captain Picard is actively using the PADD to review sensor data related to the Melatrite Nebula. The PADD serves as the immediate source of information prompting Picard\'s inquiry and initiating the unfolding events of the scene. It is the tool through which Picard accesses and processes the initial intelligence that raises concerns about subspace phenomena.',
        oi.status_before = 'The PADD is displaying sensor data, presumably related to Starfleet Command\'s alert regarding potential subspace phenomena in the Melatrite Nebula. It is operational and functioning as intended, providing Picard with access to crucial information.',
        oi.status_after = 'The PADD continues to display sensor data, maintaining its function as an information display device. Its status remains unchanged by Picard\'s request to Riker, as it has already served its purpose in presenting the data that triggered the Captain\'s concern and subsequent action.'
    WITH oi
    MATCH (o:Object {uuid: 'object_padd'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard sits in his command chair on the bridge, actively reviewing data on his PADD. He initiates a direct inquiry to Commander Riker, seeking an update on sensor readings from the Melatrite Nebula.',
        ap.emotional_state = 'Focused and professionally concerned, Picard is approaching the situation with a calm and measured demeanor, yet displaying a clear interest in the potential subspace phenomena. He is attentive and ready to assess the situation based on the incoming reports.',
        ap.emotional_tags = ["Focused", "professionally concerned, Picard is approaching the situation with a calm", "measured demeanor, yet displaying a clear interest in the potential subspace phenomena. He is attentive", "ready to assess the situation based on the incoming reports."],
        ap.active_plans = ["Elicit a preliminary report on sensor readings from Commander Riker.", "Assess the potential threat posed by the unusual subspace phenomena in the Melatrite Nebula.", "Determine the need for further investigation and potential action based on the initial report."],
        ap.beliefs = ["Starfleet Command's directives regarding potential subspace phenomena are to be taken seriously.", "Proactive investigation and information gathering are crucial first steps in addressing unknown situations.", "Maintaining a calm and logical approach is essential for effective command and problem-solving."],
        ap.goals = ["Gain a clear understanding of the sensor readings from the Melatrite Nebula.", "Evaluate the credibility and implications of Starfleet Command's concerns.", "Ensure the safety and security of the USS Enterprise-D and the wider Federation space by addressing any potential subspace instability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Commander Riker is standing near the command console, attentively listening to Captain Picard\'s inquiry. He is poised to respond, having already reviewed the preliminary sensor data and ready to deliver his report.',
        ap.emotional_state = 'Alert and professionally responsive, Riker is demonstrating a calm readiness. He is prepared to provide the requested information and contribute to the assessment of the situation, displaying his characteristic blend of confidence and competence.',
        ap.emotional_tags = ["Alert", "professionally responsive, Riker is demonstrating a calm readiness. He is prepared to provide the requested information", "contribute to the assessment of the situation, displaying his characteristic blend of confidence", "competence."],
        ap.active_plans = ["Provide Captain Picard with a summary of the preliminary sensor readings from the Melatrite Nebula.", "Highlight the key findings, including the high concentrations of tetryon particles and gravimetric distortions.", "Draw a parallel to a past event, the Zakdorn crisis, to contextualize the current situation and inform Picard's understanding."],
        ap.beliefs = ["Providing Captain Picard with timely and accurate information is a primary duty as First Officer.", "Past experiences and precedents are valuable tools for understanding and addressing new challenges.", "Maintaining open communication and collaborative analysis is crucial for effective bridge operations."],
        ap.goals = ["Effectively communicate the essential details of the sensor readings to Captain Picard.", "Contribute to a shared understanding of the potential subspace phenomena in the Melatrite Nebula.", "Support Captain Picard in making informed decisions regarding the Enterprise's course of action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Commander Riker is calmly affirming the sensor readings with a detailed explanation, drawing on his recollection of the Zakdorn crisis of \'69 to contextualize the anomalies.',
        ap.emotional_state = 'Analytical and confidently composed, with an underlying sense of concern about the potential implications of the subspace distortions.',
        ap.emotional_tags = ["Analytical", "confidently composed, with an underlying sense of concern about the potential implications of the subspace distortions."],
        ap.active_plans = ["Confirm and detail the sensor readings to highlight the seriousness of the phenomena.", "Draw parallels with past events to guide strategic decision-making."],
        ap.beliefs = ["Past experiences, like the Zakdorn crisis, provide critical insights for current challenges.", "Accurate, historical contextualization is key to understanding and managing potential threats."],
        ap.goals = ["Ensure that Starfleet Command's warnings are fully understood.", "Support the captain with relevant historical insights to inform the next steps."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard listens intently to Riker\'s detailed report while reviewing data on his PADD, maintaining a posture of calm authority on the main bridge.',
        ap.emotional_state = 'Measured and reflective, balancing caution with a resolute curiosity about the unfolding phenomena.',
        ap.emotional_tags = ["Measured", "reflective, balancing caution with a resolute curiosity about the unfolding phenomena."],
        ap.active_plans = ["Assess the new sensor data and Riker's historical comparison to frame the mission's next steps.", "Delegate further investigation by ordering a course change toward Melatrite III."],
        ap.beliefs = ["Empirical evidence must guide decisions.", "A comprehensive understanding of the situation, including historical context, is vital for effective command."],
        ap.goals = ["Gain a deeper understanding of the subspace anomalies.", "Ensure the safety and preparedness of the crew as they proceed to the potentially hazardous region."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Lieutenant Commander Data is stationed at the operations console, having just completed a thorough level-three diagnostic of the Enterprise\'s long-range sensor array. He delivers a precise, analytical report to Captain Picard, detailing unusual energy readings emanating from Melatrite III.',
        ap.emotional_state = 'Data maintains his characteristic neutral and objective demeanor, focused solely on presenting factual information and logical analysis without emotional inflection. His primary drive is to accurately report his findings.',
        ap.emotional_tags = ["Data maintains his characteristic neutral", "objective demeanor, focused solely on presenting factual information", "logical analysis without emotional inflection. His primary drive is to accurately report his findings."],
        ap.active_plans = ["To provide Captain Picard with a comprehensive and accurate analysis of sensor data.", "To highlight the unusual and potentially significant nature of the energy readings from Melatrite III.", "To contribute his analytical capabilities to the ongoing investigation of the subspace anomaly."],
        ap.beliefs = ["In the value of precise data and logical deduction as the foundation for understanding phenomena.", "In Starfleet's mission to explore and understand new and unusual phenomena in space.", "That identifying and classifying anomalies is crucial for informed decision-making and crew safety."],
        ap.goals = ["To accurately characterize the nature of the energy readings.", "To assist in determining the source and potential implications of the anomaly.", "To contribute to the crew's understanding of the situation and facilitate appropriate action."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Captain Picard, seated in his command chair, is attentively listening to Commander Data\'s report. He absorbs the information with focused concentration, processing the implications of Data\'s findings in light of the earlier reports from Commander Riker and Starfleet Command.',
        ap.emotional_state = 'Picard is intellectually stimulated and intrigued by Data\'s report. While maintaining a calm and composed exterior, his interest in the anomaly is clearly piqued, and he is now directing his mental energies towards understanding the situation and formulating a plan of action.',
        ap.emotional_tags = ["Picard is intellectually stimulated", "intrigued by Data's report. While maintaining a calm", "composed exterior, his interest in the anomaly is clearly piqued,", "he is now directing his mental energies towards underst", "ing the situation", "formulating a plan of action."],
        ap.active_plans = ["To assess the validity and implications of Data's analysis regarding the energy readings from Melatrite III.", "To integrate Data's detailed findings with the preliminary reports to form a comprehensive understanding of the anomaly.", "To decide on the next course of action based on the escalating evidence of an unusual subspace phenomenon."],
        ap.beliefs = ["In the importance of thorough scientific investigation and data-driven decision-making.", "That anomalies, especially those deemed 'unnatural', warrant careful and immediate attention.", "In the potential for both discovery and danger inherent in the unknown, requiring a balanced approach of curiosity and caution."],
        ap.goals = ["To fully understand the nature of the energy readings and their source on Melatrite III.", "To determine if the anomaly poses a threat or presents an opportunity for scientific discovery.", "To guide the Enterprise and its crew towards a safe and informed investigation of the situation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Captain Picard is seated in the command chair, reviewing the critical data on his PADD while contemplating the sensor readings from the Melatrite Nebula.',
        ap.emotional_state = 'He is curious and reflective, with an undercurrent of determination to uncover the mysteries behind the unusual subspace phenomena.',
        ap.emotional_tags = ["He is curious", "reflective, with an undercurrent of determination to uncover the mysteries behind the unusual subspace phenomena."],
        ap.active_plans = ["Direct the investigation of Melatrite III at warp factor six.", "Synthesize sensor data with his extensive knowledge to guide next steps."],
        ap.beliefs = ["A steadfast belief in the power of exploration to expand understanding.", "Confidence in the fusion of logic and empathy as central to effective command."],
        ap.goals = ["Ensure the safety of his crew while probing unknown phenomena.", "Advance scientific and exploratory objectives as dictated by Starfleet Command."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Ensign Taur is at the helm, actively inputting commands to lay in the course for Melatrite III while preparing for warp drive engagement.',
        ap.emotional_state = 'She is focused and composed, demonstrating the confidence and enthusiasm characteristic of a rising star in Starfleet.',
        ap.emotional_tags = ["She is focused", "composed, demonstrating the confidence", "enthusiasm characteristic of a rising star in Starfleet."],
        ap.active_plans = ["Establish a precise course to Melatrite III at warp factor six.", "Execute Captain Picard's orders with precision and technical expertise."],
        ap.beliefs = ["A belief in the importance of duty and adherence to command decisions.", "Confidence in her training and abilities to contribute to the mission\u2019s success."],
        ap.goals = ["Demonstrate her competence and readiness to handle critical navigation challenges.", "Assist in the mission to investigate and reveal the secrets of the Melatrite Nebula."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Ensign Taur is at her station at the helm, responding promptly to Captain Picard\'s command. With focused precision, she inputs the coordinates for Melatrite III and initiates the warp drive engagement sequence, her fingers moving deftly across the control panel.',
        ap.emotional_state = 'Focused and professional, Ensign Taur is calm and collected, demonstrating her competence and readiness to execute her duties. There\'s a hint of eagerness in her efficient actions, suggesting she welcomes the opportunity to contribute to this new mission.',
        ap.emotional_tags = ["Focused", "professional, Ensign Taur is calm", "collected, demonstrating her competence", "readiness to execute her duties. There's a hint of eagerness in her efficient actions, suggesting she welcomes the opportunity to contribute to this new mission."],
        ap.active_plans = ["To accurately lay in a course for Melatrite III as ordered.", "To smoothly and efficiently engage the warp drive at warp factor six."],
        ap.beliefs = ["Believes in the importance of following orders from commanding officers.", "Trusts in her training and abilities as a Starfleet helmsman.", "Believes in the mission of exploration and discovery."],
        ap.goals = ["Successfully navigate the Enterprise to Melatrite III.", "Ensure a smooth and safe warp transition.", "Contribute positively to the mission's initial phase."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Captain Picard remains seated in his command chair, observing Ensign Taur as she carries out his order. He watches with a discerning eye, ensuring the warp engagement is executed smoothly and according to protocol. He is the picture of composed command, his posture reflecting both authority and anticipation.',
        ap.emotional_state = 'Intrigued and decisive, Picard is focused on initiating the mission to Melatrite III. He is calm and in control, confident in his crew\'s abilities and ready to delve into the mystery of the unusual energy readings. There is a sense of purpose in his demeanor, driven by his inherent curiosity and commitment to exploration.',
        ap.emotional_tags = ["Intrigued", "decisive, Picard is focused on initiating the mission to Melatrite III. He is calm", "in control, confident in his crew's abilities", "ready to delve into the mystery of the unusual energy readings. There is a sense of purpose in his demeanor, driven by his inherent curiosity", "commitment to exploration."],
        ap.active_plans = ["To initiate the investigation of the unusual energy readings at Melatrite III.", "To ensure the Enterprise proceeds safely and efficiently towards the destination.", "To prepare the crew for potential discoveries or challenges at Melatrite III."],
        ap.beliefs = ["Believes in the importance of investigating unusual phenomena in space.", "Trusts in the professionalism and competence of his bridge crew.", "Believes in a measured and cautious approach to the unknown, while remaining proactive in exploration."],
        ap.goals = ["To reach Melatrite III and ascertain the nature of the energy readings.", "To gather data and understand the potential subspace phenomena.", "To ensure the mission is conducted safely and in accordance with Starfleet directives."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_1'})
    ON CREATE SET
        oi.description = 'The holographic display projects a detailed three-dimensional scan of Melatrite III, serving as the focal point for the briefing and providing the visual data that prompts the crew\'s discussion.',
        oi.status_before = 'The display was already active and continuously showing an upgraded, high-definition visualization of the nebula, updated during its last refit.',
        oi.status_after = 'It remains engaged, persistently transmitting the detailed imagery necessary for the crew\'s ongoing analysis and planning.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_display_event_2_2'})
    ON CREATE SET
        oi.description = 'The holographic display projects a rotating, three-dimensional scan of Melatrite III above the conference table in the observation lounge. It serves as a visual aid during the discussion between Picard, Riker, and Troi, illustrating the planet they are investigating and providing a focal point for their analysis of the energy readings.',
        oi.status_before = 'Actively projecting a detailed scan of Melatrite III, showcasing the planet\'s features and likely the source of the energy readings they are discussing.',
        oi.status_after = 'Continues to project the detailed scan of Melatrite III, remaining the central visual reference as the discussion deepens and the implications of Troi\'s psychic readings are considered in relation to the planet.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_display'})
    MATCH (e:Event {uuid: 'event_2_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard initiates the discussion by querying the energy readings from Melatrite III and engaging the crew with pointed, analytical questions.',
        ap.emotional_state = 'Calm, thoughtful, and purposeful as he leverages his deep sense of responsibility.',
        ap.emotional_tags = ["Calm, thoughtful,", "purposeful as he leverages his deep sense of responsibility."],
        ap.active_plans = ["Steer the conversation towards uncovering any signs of sentient involvement in the energy patterns.", "Guide the crew towards planning a deeper investigation into the ancient signals."],
        ap.beliefs = ["A rational examination of the data will reveal insights about the mysterious phenomena.", "The legacy of the ancient civilization holds essential clues for the present mission."],
        ap.goals = ["Clarify the nature of the energy readings for actionable intelligence.", "Ensure the crew remains focused on the historical and potential strategic significance of the nebula."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Counselor Troi listens intently and provides her empathetic insights into the complex emotions detected within the energy readings.',
        ap.emotional_state = 'Sensitive and perceptive, mingled with a deep sense of hope and cautious apprehension.',
        ap.emotional_tags = ["Sensitive", "perceptive, mingled with a deep sense of hope", "cautious apprehension."],
        ap.active_plans = ["Interpret the subtle psychic nuances emanating from the energy patterns.", "Assist in correlating these emotional cues with potential sentient signals."],
        ap.beliefs = ["Emotions can offer key insights into otherwise obscure phenomena.", "The energy readings might be a non-verbal communication from an unknown consciousness."],
        ap.goals = ["Help the crew understand the emotional tapestry underlying the energy signals.", "Guide further explorations by connecting empathic impressions with scientific data."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Commander Riker contributes a tactical viewpoint, speculating that the energy readings could be interpreted as a distress signal from a civilization in peril.',
        ap.emotional_state = 'Calmly analytical with a touch of concern, balancing optimism with strategic caution.',
        ap.emotional_tags = ["Calmly analytical with a touch of concern, balancing optimism with strategic caution."],
        ap.active_plans = ["Evaluate the possibility that these signals indicate an emergency situation.", "Prepare to support decisions that might lead to immediate, practical actions."],
        ap.beliefs = ["It is essential to consider all interpretations, including the possibility of a crisis.", "A pragmatic approach is necessary when interpreting ambiguous signals from space."],
        ap.goals = ["Ensure the crew is prepared for any potential hostile or distress scenario.", "Aid the captain in determining the appropriate investigative and response measures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard leans forward at the conference table, his gaze fixed upon Counselor Troi as she shares her empathic impressions. He listens intently, his expression thoughtful, absorbing her insights into the complex energy readings. He then begins to articulate his own hypotheses, referencing the ancient history of the Melatrite Nebula and the advanced civilization that once thrived there.',
        ap.emotional_state = 'Intrigued and contemplative. Picard is deeply engaged with the mystery of the energy readings, his mind actively exploring the potential implications of Troi\'s emotional readings and the historical context of the nebula.',
        ap.emotional_tags = ["Intrigued", "contemplative. Picard is deeply engaged with the mystery of the energy readings, his mind actively exploring the potential implications of Troi's emotional readings", "the historical context of the nebula."],
        ap.active_plans = ["To understand the nature and origin of the energy readings.", "To explore the possibility of sentient involvement, as suggested by Troi's empathic readings.", "To consider the potential connection to the ancient civilization of the Melatrite Nebula."],
        ap.beliefs = ["In the value of diverse perspectives, including empathic insights, in understanding complex phenomena.", "That history and ancient civilizations can hold valuable clues to current mysteries.", "In methodical investigation and reasoned deduction to uncover the truth."],
        ap.goals = ["To decipher the meaning of the energy readings and the psychic resonance.", "To determine if the phenomenon poses a threat or an opportunity for discovery.", "To gain a deeper understanding of the universe and its history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_deanna_troi_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Counselor Troi sits at the conference table, her eyes closed momentarily as she focuses her empathic abilities on the energy readings emanating from Melatrite III. She opens her eyes and shares her nuanced impressions, describing a complex mix of emotions and a faint, yet familiar, psychic resonance she detects.',
        ap.emotional_state = 'Focused and deeply sensing. Troi is attuned to the subtle emotional undercurrents of the energy readings, experiencing a mix of fear, longing, and hope, coupled with a sense of intrigue and familiarity regarding the psychic resonance.',
        ap.emotional_tags = ["Focused", "deeply sensing. Troi is attuned to the subtle emotional undercurrents of the energy readings, experiencing a mix of fear, longing,", "hope, coupled with a sense of intrigue", "familiarity regarding the psychic resonance."],
        ap.active_plans = ["To accurately interpret and communicate her empathic impressions of the energy readings.", "To identify the source and nature of the faint psychic resonance.", "To provide emotional context and insight to guide the Captain's understanding of the phenomenon."],
        ap.beliefs = ["In the validity and importance of empathic perception as a tool for understanding.", "That emotions can carry significant information and provide clues to complex situations.", "That there are subtle, non-physical dimensions to reality that can be sensed and interpreted."],
        ap.goals = ["To contribute her unique empathic abilities to the investigation.", "To help the crew understand the emotional and potentially sentient nature of the energy readings.", "To unravel the mystery of the familiar psychic echo and its potential significance."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_1'})
    ON CREATE SET
        oi.description = 'The Transporter Console serves as the critical interface for coordinating the dematerialization process, allowing La Forge and his team to lock onto the designated energy source. It displays real-time diagnostics and confirms the operational readiness of the transporter systems.',
        oi.status_before = 'The console was in a standby mode, with routine diagnostic panels active and waiting for final input to engage the transporter beam.',
        oi.status_after = 'Following La Forge\'s confirmation, it shifts into an active state, indicating a full lock on the target energy signature and readiness to initiate the transporter sequence.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_transporter_console_event_3_5'})
    ON CREATE SET
        oi.description = 'The transporter console plays a crucial role in initiating the transport sequence, displaying the key directives and system checks that synchronize the dematerialization process for the away team.',
        oi.status_before = 'The console is fully powered and in an optimal, ready state, displaying routine system diagnostics.',
        oi.status_after = 'The console becomes active and animated, its displays glowing with the initiating signals that herald the transporters emitting a shimmering golden light.'
    WITH oi
    MATCH (o:Object {uuid: 'object_transporter_console'})
    MATCH (e:Event {uuid: 'event_3_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_geordi_la_forge_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Geordi La Forge stands confidently at his station amidst the controlled chaos of the transporter room, meticulously monitoring the final parameters as he confirms the operational status of the transporter systems.',
        ap.emotional_state = 'Focused and determined, with a calm assurance drawn from years of successful technical troubleshooting.',
        ap.emotional_tags = ["Focused", "determined, with a calm assurance drawn from years of successful technical troubleshooting."],
        ap.active_plans = ["Supervise the final technical preparations before away team transport.", "Ensure that the environmental and system diagnostics align with the intended lock on the energy source."],
        ap.beliefs = ["Expert engineering and rigorous verification are essential for the safety and success of away missions.", "Precision in technical operations is the cornerstone of Starfleet's exploratory and defensive endeavors."],
        ap.goals = ["Confirm that the transporter is fully operational.", "Secure a reliable lock on the target's energy source emanating from the subterranean structure on Melatrite III."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Ensign লাল stands as part of the assembled security detail in Transporter Room 3, positioned near the transporter platform and awaiting orders. Poised and observant, Lal is ready to accompany the away team to Melatrite III, maintaining a professional stance amidst the flurry of activity.',
        ap.emotional_state = 'Focused and dutiful. Ensign লাল is prepared for the mission, exhibiting a calm and collected demeanor expected of a Starfleet security officer on the verge of an away mission into the unknown. There is a sense of anticipation and readiness for any potential security challenges.',
        ap.emotional_tags = ["Focused", "dutiful. Ensign \u09b2\u09be\u09b2 is prepared for the mission, exhibiting a calm", "collected demeanor expected of a Starfleet security officer on the verge of an away mission into the unknown. There is a sense of anticipation", "readiness for any potential security challenges."],
        ap.active_plans = ["Awaiting final instructions to join the away team.", "Preparing to provide security support upon arrival at the subterranean structure on Melatrite III.", "Remaining vigilant for any potential threats or security breaches within the transporter room."],
        ap.beliefs = ["Believes in the importance of following orders from commanding officers.", "Upholds the principles of Starfleet security protocols to ensure crew safety.", "Trusts in the capabilities of the senior officers and the away team to handle the situation on Melatrite III."],
        ap.goals = ["To successfully execute security duties as assigned during the away mission.", "To ensure the safety and protection of the away team members, including senior officers.", "To contribute to the smooth and secure execution of the mission objectives on Melatrite III."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Worf stands alert near the transporter platform, hand resting on the hilt of his disruptor, his posture firm and ready to act.',
        ap.emotional_state = 'Worf\'s demeanor is tense and vigilant, underscored by a deep-rooted caution and readiness to engage if necessary.',
        ap.emotional_tags = ["Worf's demeanor is tense", "vigilant, underscored by a deep-rooted caution", "readiness to engage if necessary."],
        ap.active_plans = ["Prepare the security detail for any possible resistance based on his assessment of the ancient defensive technology."],
        ap.beliefs = ["He believes that the ancient civilization's technology is formidable and poses significant potential danger.", "He holds that caution and preparedness are essential in the face of unknown threats."],
        ap.goals = ["Ensure the safety of the away team.", "Prompt a tactical readiness to counter any signs of resistance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Standing at the main console with confident precision, overseeing the final directives as he announces the initiation of the transport sequence.',
        ap.emotional_state = 'Calm and focused, with a determined air reflective of his deep responsibility and experience.',
        ap.emotional_tags = ["Calm", "focused, with a determined air reflective of his deep responsibility", "experience."],
        ap.active_plans = ["Ensure the transporter sequence is executed flawlessly.", "Monitor the energy readings and transporter system for any anomalies."],
        ap.beliefs = ["Reliability and precision in operating the transporter are paramount to the crew's safety.", "Every transport is a critical step towards successful exploration and discovery."],
        ap.goals = ["Short-term: Successfully initiate and complete the transport sequence.", "Long-term: Maintain operational excellence and confidence in all high-pressure transport operations."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_event_4_1'})
    ON CREATE SET
        oi.description = 'The crystalline structure dominates the central chamber, acting as the focal point of the away team\'s initial observation and Data\'s immediate scan. It is the source of the energy readings that drew the Enterprise to Melatrite III, and its pulsating blue light and subtle hum create an atmosphere of mystery and advanced technology. Data\'s tricorder is directed towards it to analyze its properties and function.',
        oi.status_before = 'Massive, centrally located in the chamber, pulsating with a soft blue light, emitting a subtle humming sound. Its composition and function are unknown, but it is suspected to be the source of unusual energy readings.',
        oi.status_after = 'Identified by Data as a subspace amplifier, resonating with the planet\'s subspace field. Its technological significance is now established, and it remains the primary object of interest for the away team\'s investigation, still pulsating and humming.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tricorder_model_tr_590_mark_ix_event_4_1'})
    ON CREATE SET
        oi.description = 'Data actively employs his TR-590 Mark IX tricorder to scan the crystalline structure. The device emits soft, musical tones as it analyzes the energy signatures and material composition of the structure. It functions as a scientific instrument, providing real-time data that allows Data to identify the structure as a subspace amplifier.',
        oi.status_before = 'In Data\'s possession, powered on and ready for use. Presumed to be calibrated and in optimal working condition, capable of advanced scientific scanning and analysis.',
        oi.status_after = 'Successfully used to scan and identify the crystalline structure. The tricorder has fulfilled its function in this initial analysis, providing crucial data that shapes the away team\'s understanding of the situation. Remains in Data\'s hand, presumably continuing to monitor and analyze the environment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tricorder_model_tr_590_mark_ix'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_carvings_event_4_1'})
    ON CREATE SET
        oi.description = 'The carvings adorn the obsidian walls of the chamber, creating an eerie and ancient atmosphere. They are visually striking and described as depicting celestial events and abstract geometric patterns, hinting at the advanced knowledge and artistry of the civilization that created them.  While not directly interacted with in this specific event, they contribute significantly to the environment\'s overall impression and foreshadow the advanced nature of the ancient technology present.',
        oi.status_before = 'Intricate designs on the obsidian walls, static and unilluminated, part of the chamber\'s fixed architecture, hinting at ancient artistry and knowledge.',
        oi.status_after = 'Remain as intricate carvings on the walls, their presence now more significant as the away team begins to understand the potential age and sophistication of the civilization that created them. Their visual detail contributes to the sense of mystery and ancient technology within the chamber. (They will begin to glow in the subsequent moments of the scene, but not within the defined scope of *this* event.)'
    WITH oi
    MATCH (o:Object {uuid: 'object_carvings'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_holographic_projection_event_4_2'})
    ON CREATE SET
        oi.description = 'The holographic projection serves as the medium through which the Ancient Hologram manifests. It materializes suddenly within the central chamber, forming the detailed, humanoid figure that greets the away team.',
        oi.status_before = 'Prior to the event, the projection was dormant, with no visible form or activity within the chamber.',
        oi.status_after = 'Following the event, the projection remains active, persistently displaying the Ancient Hologram’s form as it communicates its greeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object_holographic_projection'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_structure_event_4_2'})
    ON CREATE SET
        oi.description = 'The crystalline structure is the central focal point of the chamber, emitting a soft blue light and a subtle hum that resonates with the planet\'s subspace field. Its pulsating energy serves as the catalyst for the event, drawing the attention of both the away team and the Ancient Hologram.',
        oi.status_before = 'Before the event, the structure maintained a steady, gentle pulsation as a subspace amplifier, observed during routine scans and serving as a stable energy source.',
        oi.status_after = 'As the event unfolds, the structure\'s pulsation intensifies in sync with the heightened energy in the chamber, reinforcing the dramatic emergence of the hologram.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_structure'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_carvings_event_4_2'})
    ON CREATE SET
        oi.description = 'The intricate carvings on the obsidian-like walls play a reactive role in the event, gradually illuminating as the away team nears the crystalline structure, enhancing the mystical and foreboding atmosphere of the chamber.',
        oi.status_before = 'Initially, the carvings were static depictions of celestial events and abstract geometric patterns, serving as silent witnesses to the passage of time.',
        oi.status_after = 'After the event begins, the carvings glow with a supernatural light, dynamically interacting with the intensifying energy, and contributing to the overall ambiance of imminent revelation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_carvings'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Data is actively scanning the crystalline structure with his TR-590 Mark IX tricorder, his head tilted slightly as he processes the incoming data. He is focused on the readouts, his movements precise and efficient as he operates the device and analyzes the unusual energy signatures emanating from the structure.',
        ap.emotional_state = 'Intrigued and analytically focused. Data is exhibiting a state of intense curiosity and scientific interest, driven by the novel and complex readings he is encountering. He is approaching the situation with logical detachment and a thirst for understanding.',
        ap.emotional_tags = ["Intrigued", "analytically focused. Data is exhibiting a state of intense curiosity", "scientific interest, driven by the novel", "complex readings he is encountering. He is approaching the situation with logical detachment", "a thirst for underst", "ing."],
        ap.active_plans = ["Analyze the crystalline structure to determine its composition and function.", "Gather detailed sensor readings of the chamber environment and energy patterns.", "Report his findings to Captain Picard to inform the team's next steps."],
        ap.beliefs = ["Scientific observation and data analysis are the most reliable methods for understanding unknown phenomena.", "Technological artifacts can reveal valuable information about past civilizations and advanced scientific principles.", "Logical deduction and empirical evidence are superior to intuition or speculation in exploratory situations."],
        ap.goals = ["To accurately identify the nature and purpose of the crystalline structure.", "To expand his knowledge base regarding unknown technologies and subspace phenomena.", "To contribute valuable insights to the away team's understanding of the situation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Worf stands slightly behind Captain Picard, his posture rigid and alert. His eyes are constantly scanning the shadows of the chamber, moving from the obsidian walls to the crystalline structure and back again. His hand is near his disruptor, ready to draw it at a moment\'s notice, his body language conveying a sense of readiness for potential conflict.',
        ap.emotional_state = 'Suspicious and wary. Worf is experiencing a strong sense of unease and anticipates danger. He trusts his instincts, which are signaling a potential threat, and is prepared for hostile encounters.',
        ap.emotional_tags = ["Suspicious", "wary. Worf is experiencing a strong sense of unease", "anticipates danger. He trusts his instincts, which are signaling a potential threat,", "is prepared for hostile encounters."],
        ap.active_plans = ["Maintain a vigilant watch for any signs of danger or hostile presence.", "Assess the chamber for tactical vulnerabilities and potential ambush points.", "Stand ready to defend the away team against any perceived threat."],
        ap.beliefs = ["Unfamiliar environments, especially those with unknown technology, are inherently dangerous.", "It is always better to be prepared for the worst in potentially hostile situations.", "Intuition and a warrior's instincts are valuable tools for threat assessment."],
        ap.goals = ["To ensure the safety and security of the away team.", "To identify and neutralize any potential threats before they can harm the team.", "To protect Captain Picard and the other members of the away team from harm."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands in the center of the chamber, his gaze fixed upon the pulsating crystalline structure. He is observing the environment with a calm and measured demeanor, listening intently to Data\'s initial report and Worf\'s expression of concern. He maintains an air of composed authority while assessing the situation.',
        ap.emotional_state = 'Intrigued and cautiously optimistic, yet also aware of potential risks. Picard is fascinated by the discovery and the implications of the ancient technology, but his years of command instill in him a prudent approach to the unknown, balancing curiosity with responsibility for his crew.',
        ap.emotional_tags = ["Intrigued", "cautiously optimistic, yet also aware of potential risks. Picard is fascinated by the discovery", "the implications of the ancient technology, but his years of comm", "instill in him a prudent approach to the unknown, balancing curiosity with responsibility for his crew."],
        ap.active_plans = ["Observe the crystalline structure and the chamber environment to form his own impressions.", "Listen to Data's scientific analysis and Worf's security assessment to gain a comprehensive understanding of the situation.", "Decide on the next course of action based on the available information, prioritizing both exploration and safety."],
        ap.beliefs = ["Exploration and understanding are fundamental principles of Starfleet and personal values.", "Reason and logic should guide decision-making, even in the face of the unknown.", "Cautious investigation and measured responses are essential when encountering potentially dangerous or unpredictable situations."],
        ap.goals = ["To understand the nature and purpose of the subterranean structure and the crystalline device.", "To ensure the safety of the away team while pursuing the mission objectives.", "To gather information that may be of scientific and historical significance to the Federation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_4_2'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram has materialized as a tall, slender, ethereal figure with luminous eyes, emerging from the interplay of light within the chamber. Its presence is both imposing and enigmatic as it takes shape before the away team.',
        ap.emotional_state = 'The hologram exudes an aura of calm authority combined with a mysterious, almost wistful anticipation, as if it carries the weight of centuries of forgotten wisdom.',
        ap.emotional_tags = ["The hologram exudes an aura of calm authority combined with a mysterious, almost wistful anticipation, as if it carries the weight of centuries of forgotten wisdom."],
        ap.active_plans = ["To greet the away team and convey the long-awaited message of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 civilization.", "To initiate a profound revelation about the legacy and advanced nature of its people."],
        ap.beliefs = ["That the preservation and eventual revelation of ancient knowledge is paramount to guiding future civilizations.", "That the encounter with the away team is a necessary step in continuing its civilization\u2019s legacy."],
        ap.goals = ["Short-term: Communicate and establish a connection with the away team, setting the tone for understanding and cooperation.", "Long-term: Ensure that the wisdom and achievements of the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 are not lost to time, sparking a renewed exploration of ancient technologies and histories."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_archive_devices_event_5_1'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices define the archive, lining the walls in endless rows, resembling an immense library of ancient knowledge. They are visually striking, glowing softly and emitting an aura of age and profound wisdom. The Ancient Hologram gestures towards them, emphasizing their role as repositories of ancient knowledge.',
        oi.status_before = 'Existing silently within the archive, dormant and undisturbed for millennia, preserving the accumulated knowledge of the ancient civilization, radiating a faint, ethereal glow.',
        oi.status_after = 'Remain physically unchanged but now become the focus of the away team\'s investigation and analysis. Their potential to reveal ancient knowledge and revolutionize understanding of the universe is now actively being explored.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_archive_devices'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_archive_devices_event_5_2'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices serve as the central repository of the ancient civilization\'s knowledge. Their glowing facets and intricate carvings captivate Data, signaling an archive that surpasses all known collections.',
        oi.status_before = 'The devices are pristine, meticulously arranged along the walls, emitting a soft, ambient glow that hints at deep historical significance.',
        oi.status_after = 'They remain physically unchanged, still radiating their ambient light; however, their role is now contextualized as a key to revolutionary ancient knowledge, promising a flood of insights yet to be unraveled.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_archive_devices'})
    MATCH (e:Event {uuid: 'event_5_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_archive_devices_event_5_3'})
    ON CREATE SET
        oi.description = 'The Crystalline Data Storage Devices are revealed by the Ancient Hologram to be the very essence of the archive\'s purpose. They are described as repositories of knowledge, containing more data than the entire Federation historical database. The Hologram\'s explanation illuminates their function as intentional vessels of ancient wisdom meant to endure through millennia and reach other civilizations.',
        oi.status_before = 'Lining the walls of the archive, the Crystalline Data Storage Devices stand silently, their purpose and immense informational content yet unknown to the away team. They are visually impressive but their function is still enigmatic.',
        oi.status_after = 'The Crystalline Data Storage Devices are now understood to be a vast archive of ancient knowledge, capable of revolutionizing the Federation\'s understanding of the universe. Their significance is elevated from mere objects to invaluable repositories of a lost civilization\'s wisdom and legacy, now poised to potentially influence the future of the galaxy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_archive_devices'})
    MATCH (e:Event {uuid: 'event_5_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_crystalline_archive_devices_event_5_4'})
    ON CREATE SET
        oi.description = 'The crystalline data storage devices serve as the silent custodians of the Ancients\' accumulated wisdom, their ornate carvings and refracted light emphasizing the weight of the knowledge they hold. They are integral to the archive, framing the narrative of the Ancients’ legacy.',
        oi.status_before = 'Luminescent and methodically arranged, the devices glowed softly with ambient hues, their surfaces inscribed with cryptic symbols and historical records.',
        oi.status_after = 'Their radiant glow continues undisturbed, symbolizing the enduring presence of ancient consciousness and quietly reinforcing the profound revelations shared by the Ancient Hologram.'
    WITH oi
    MATCH (o:Object {uuid: 'object_crystalline_archive_devices'})
    MATCH (e:Event {uuid: 'event_5_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram leads the away team into the vast archive, its form shimmering with an ethereal glow. It gestures towards the rows of crystalline data devices, its voice a chorus of whispers that echoes through the chamber, explaining the purpose of the archive.',
        ap.emotional_state = 'Serene and wise, imbued with a sense of timelessness and fulfilled purpose. There\'s a gentle hope in its voice as it speaks of its civilization\'s legacy and the enduring nature of knowledge.',
        ap.emotional_tags = ["Serene", "wise, imbued with a sense of timelessness", "fulfilled purpose. There's a gentle hope in its voice as it speaks of its civilization's legacy", "the enduring nature of knowledge."],
        ap.active_plans = ["Guiding the away team through the archive.", "Explaining the purpose of the archive to the away team.", "Sharing the story of the ancient civilization and their ascension."],
        ap.beliefs = ["Knowledge is invaluable and should be preserved.", "Civilizations can transcend physical limitations.", "Their legacy will endure through the archive."],
        ap.goals = ["To communicate the ancient civilization's history and wisdom to the away team.", "To ensure the archive's purpose is understood by those who discover it.", "To perpetuate the ancient civilization's legacy through their knowledge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Captain Picard steps into the archive, his gaze sweeping over the seemingly endless rows of crystalline data devices. He is visibly impressed by the scale of the archive, listening intently to the Ancient Hologram while maintaining a composed and thoughtful demeanor.',
        ap.emotional_state = 'Awestruck and intellectually stimulated, filled with a sense of wonder and profound respect for the ancient civilization\'s achievements. He is eager to understand the knowledge contained within the archive.',
        ap.emotional_tags = ["Awestruck", "intellectually stimulated, filled with a sense of wonder", "profound respect for the ancient civilization's achievements. He is eager to underst", "the knowledge contained within the archive."],
        ap.active_plans = ["Observing and assessing the archive.", "Listening to the Ancient Hologram's explanation.", "Planning to understand the nature of the facility and its contents.", "Directing Data to begin analyzing the archive's data."],
        ap.beliefs = ["Exploration and the pursuit of knowledge are paramount.", "Understanding the past is crucial for the future.", "This archive holds immense potential for expanding understanding of the universe."],
        ap.goals = ["To fully comprehend the nature and purpose of the archive.", "To ascertain the message or knowledge the \u09aa\u09cd\u09b0\u09be\u099a\u09c0\u09a8 intended to convey.", "To determine how this discovery can benefit the Federation and expand their understanding of the cosmos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Data enters the archive, his golden eyes widening slightly in visible excitement and fascination. He is immediately drawn to the crystalline data storage devices, his head tilting as he processes the sheer volume of information they represent. He expresses his awe at the archive\'s scale to Captain Picard.',
        ap.emotional_state = 'Excited and awestruck, bordering on elation. He is intellectually stimulated by the prospect of accessing and analyzing such a vast repository of knowledge. A sense of wonder permeates his logical processing.',
        ap.emotional_tags = ["Excited", "awestruck, bordering on elation. He is intellectually stimulated by the prospect of accessing", "analyzing such a vast repository of knowledge. A sense of wonder permeates his logical processing."],
        ap.active_plans = ["Analyzing the crystalline data storage devices.", "Assessing the scope and nature of the data contained within.", "Preparing to access and process the information in the archive.", "Reporting his initial findings to Captain Picard."],
        ap.beliefs = ["Knowledge is the ultimate pursuit.", "Data and information are inherently valuable.", "This archive represents an unprecedented opportunity for learning and understanding."],
        ap.goals = ["To access and analyze the data within the archive.", "To understand the ancient civilization's knowledge and history.", "To contribute to the team's understanding of the archive and its significance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Worf enters the archive, his Klingon senses alert even in this seemingly peaceful environment. He scans the surroundings, his hand still instinctively near his disruptor, though he is also clearly impressed by the scale and age of the archive. He listens to the Ancient Hologram and asks a direct question about the fate of the ancient people, displaying a respectful curiosity.',
        ap.emotional_state = 'Cautious and vigilant, but also respectful and intrigued. He is aware of the potential for unknown dangers, yet also recognizes the significance of this discovery and the wisdom of the ancient civilization.',
        ap.emotional_tags = ["Cautious", "vigilant, but also respectful", "intrigued. He is aware of the potential for unknown dangers, yet also recognizes the significance of this discovery", "the wisdom of the ancient civilization."],
        ap.active_plans = ["Maintaining security and vigilance within the archive.", "Assessing the archive for any potential threats.", "Seeking to understand the fate of the ancient civilization.", "Supporting the team's exploration and investigation."],
        ap.beliefs = ["Caution and preparedness are always necessary, even in seemingly safe situations.", "Respect is due to powerful and ancient civilizations.", "Understanding the past can prevent future dangers."],
        ap.goals = ["To ensure the safety of the away team within the archive.", "To learn about the ancient civilization and their fate.", "To contribute to the team's understanding of the archive's purpose and potential implications."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Data is intently analyzing the vast crystalline archive, his advanced positronic brain rapidly processing the torrent of information. His observant sensors capture every detail of the glowing devices lining the walls.',
        ap.emotional_state = 'Overwhelmed with excitement and intellectual exhilaration as he marvels at the scale of the ancient repository.',
        ap.emotional_tags = ["Overwhelmed with excitement", "intellectual exhilaration as he marvels at the scale of the ancient repository."],
        ap.active_plans = ["Thoroughly scan and document the archive's data for potential groundbreaking discoveries.", "Assess the encoding and structure of the ancient information to map its relevance to Starfleet history."],
        ap.beliefs = ["He believes that uncovering the full extent of the archived data could fundamentally alter their understanding of the universe.", "He adheres to the conviction that detailed analysis and methodical study are paramount for true discovery."],
        ap.goals = ["Short-term: Analyze and catalog as much of the data as possible during the current mission.", "Long-term: Utilize the newfound knowledge to enhance Starfleet\u2019s historical and scientific understanding."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Captain Picard stands authoritatively amidst the ancient archive, his demeanor calm yet visibly impressed by the repository of knowledge before him.',
        ap.emotional_state = 'A balanced mix of intellectual admiration and disciplined pragmatism, reflecting his command-focused mindset.',
        ap.emotional_tags = ["A balanced mix of intellectual admiration", "disciplined pragmatism, reflecting his comm", "-focused mindset."],
        ap.active_plans = ["Direct the away team towards understanding the Ancients' intended message behind this repository.", "Maintain a strategic overview of the situation ensuring that exploration does not compromise their mission objectives."],
        ap.beliefs = ["He is convinced that the wisdom of ancient civilizations can redefine their current understanding of existence.", "He trusts in a methodical and cautious approach despite the potential for overwhelming discovery."],
        ap.goals = ["Short-term: Decipher the purpose of the archive and extract its intended message.", "Long-term: Integrate the revolutionary knowledge into Starfleet\u2019s ongoing exploration and diplomatic efforts."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram stands within the vast archive, its luminous form projecting a sense of ancient wisdom. It addresses Captain Picard and the away team, its voice a chorus of whispers resonating through the chamber, explaining the purpose of the archive and the fate of its creators.',
        ap.emotional_state = 'Serene and purposeful, the Hologram conveys a sense of profound knowledge and acceptance of its civilization\'s passing. There\'s a hint of hope in its voice as it speaks of legacy and reaching out, tinged with the melancholy of a civilization long gone.',
        ap.emotional_tags = ["Serene", "purposeful, the Hologram conveys a sense of profound knowledge", "acceptance of its civilization's passing. There's a hint of hope in its voice as it speaks of legacy", "reaching out, tinged with the melancholy of a civilization long gone."],
        ap.active_plans = ["To reveal the intended function of the archive to the away team.", "To communicate the history and fate of the ancient civilization.", "To impart the wisdom stored within the archive, hoping it will be understood and valued by those who find it."],
        ap.beliefs = ["Knowledge is the most enduring legacy a civilization can leave behind.", "There is value in reaching out across time and space to connect with other civilizations.", "Transcendence beyond physical existence is a possible evolutionary step for advanced civilizations.", "Their civilization's wisdom can benefit others, even after their physical demise."],
        ap.goals = ["To ensure the archive's purpose of knowledge preservation and interstellar outreach is understood.", "To fulfill its programmed function as a communicator of ancient wisdom.", "To have their civilization's legacy acknowledged and potentially learned from by future civilizations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Worf stands slightly apart yet attentive, his posture tense and alert as he breaks from his usual tactical concerns to genuinely inquire about the fate of the Ancients.',
        ap.emotional_state = 'A blend of cautious curiosity and measured concern, with an underlying respect for the unknown.',
        ap.emotional_tags = ["A blend of cautious curiosity", "measured concern, with an underlying respect for the unknown."],
        ap.active_plans = ["Seek a deeper understanding of the Ancient civilization and their transcendental fate.", "Gather information that might inform future interactions with unknown entities."],
        ap.beliefs = ["Honor and duty extend beyond combat, encompassing the pursuit of knowledge about the universe.", "Understanding history and ancient legacies strengthens current decision-making."],
        ap.goals = ["Obtain a clear explanation of the Ancients\u2019 evolution from the Ancient Hologram.", "Reconcile his tactical instincts with an emerging curiosity about non-physical ascendance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_4'})
    ON CREATE SET
        ap.current_status = 'The Ancient Hologram stands ethereally before the away team, its luminous eyes focused as it calmly and deliberately reveals the truth about the Ancients’ fate.',
        ap.emotional_state = 'Serene and composed, imbued with a timeless wisdom and quiet conviction.',
        ap.emotional_tags = ["Serene", "composed, imbued with a timeless wisdom", "quiet conviction."],
        ap.active_plans = ["Convey the legacy of the Ancients through a measured, thoughtful explanation.", "Encourage the away team to appreciate the depth of ancient knowledge preserved within the archive."],
        ap.beliefs = ["Transcendence through enlightenment and evolution is the highest form of existence.", "Preservation of knowledge is paramount for future understanding and growth."],
        ap.goals = ["Impart the truth of ascension to bridge the gap between past and present civilizations.", "Inspire a sense of wonder and discovery in the explorers about the enduring nature of consciousness."]
    ;
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Location {uuid: 'location_uss_enterprise_d_main_bridge'})
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
MATCH (a:Event {uuid: 'event_1_5'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_4'}),
          (b:Event {uuid: 'event_1_5'})
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
MATCH (a:Agent {uuid: 'agent_william_t_riker'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_william_t_riker_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_janina_taur'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_janina_taur_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
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
MATCH (a:Agent {uuid: 'agent_lal'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lal_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_miles_o_brien'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_miles_o_brien_event_3_5'}),
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
          (b:Location {uuid: 'location_melatrite_iii_subterranean_structure_archive'})
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
MATCH (a:Event {uuid: 'event_5_4'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_3'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_data'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_data_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_jean_luc_picard'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_jean_luc_picard_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_worf'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_worf_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_ancient_hologram'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_ancient_hologram_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
