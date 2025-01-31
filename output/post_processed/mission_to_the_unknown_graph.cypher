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
MERGE (a:Agent {uuid: 'agent-jeff_garvey'})
    ON CREATE SET
        a.name = 'Jeff Garvey',
        a.title = 'None',
        a.description = 'A character in a vulnerable state, Jeff Garvey is lying on the ground and slowly regains consciousness in a hostile jungle on the planet Kembel. He exhibits confusion and sudden pain, indicating a troubled mental state. As he recalls his purpose of killing, it becomes clear that he is a lethal character, driven by violent instincts.',
        a.traits = ["Determined", "Confused", "Lethal", "Possibly unstable"],
        a.sphere_of_influence = 'Violence'
    ;
MERGE (a:Agent {uuid: 'agent-marc_cory'})
    ON CREATE SET
        a.name = 'Marc Cory',
        a.title = 'Special Security Service Agent',
        a.description = 'A dedicated Space Security agent tasked with preventing intergalactic threats. He displays determination and resourcefulness, though he occasionally becomes overwhelmed by the enormity of his mission. Cory is driven by a strong sense of duty and a will to protect Earth from dangers, particularly the Daleks.',
        a.traits = ["Resourceful", "Determined", "Urgent", "Serious", "Brave", "Risk-taker"],
        a.sphere_of_influence = 'Space Security'
    ;
MERGE (a:Agent {uuid: 'agent-gordon_lowery'})
    ON CREATE SET
        a.name = 'Gordon Lowery',
        a.title = 'Captain',
        a.description = 'Captain of the expedition\'s scout ship, Gordon Lowery displays a pragmatic and no-nonsense attitude. He is focused on preparing the rescue beacon and demonstrates determination and urgency in his tasks. His pragmatic nature sometimes leads to frustration, but ultimately he is loyal to his mission and crew.',
        a.traits = ["Pragmatic", "Determined", "Nervous", "Horrified", "Frustrated", "Loyal", "Responsible"],
        a.sphere_of_influence = 'Space Exploration'
    ;
MERGE (a:Agent {uuid: 'agent-sara_kingdom'})
    ON CREATE SET
        a.name = 'Sara Kingdom',
        a.title = 'Agent',
        a.description = 'A Special Security Service agent, Sara Kingdom exhibits fierce loyalty to her duties but harbors a ruthless determination to achieve her goals. She has proven to be a skilled fighter, unafraid of using lethal force to fulfill her missions. Her stern demeanor betrays little warmth, yet she is capable of intense feelings beneath the surface.',
        a.traits = ["Determined", "Ruthless", "Loyal", "Skilled fighter"],
        a.sphere_of_influence = 'Special Operations'
    ;
MERGE (a:Agent {uuid: 'agent-malpha'})
    ON CREATE SET
        a.name = 'Malpha',
        a.title = 'None',
        a.description = 'A representative from one of the outer galaxies, Malpha is part of an alliance initially formed to conquer the Solar System. He exhibits arrogance and confidence, believing strongly in his superiority and the might of his forces. Malpha is ambitious, seeking power and control, and does not hesitate to call for the extermination of perceived threats.',
        a.traits = ["Power-seeking", "Confident", "Arrogant", "Ambitious"],
        a.sphere_of_influence = 'Outer Galaxies'
    ;
MERGE (a:Agent {uuid: 'agent-mavic_chen'})
    ON CREATE SET
        a.name = 'Mavic Chen',
        a.title = 'Guardian of the Solar System',
        a.description = 'Mavic Chen is a powerful politician and the Guardian of the Solar System. He is ambitious, cunning, and willing to betray allies for his own gain. Chen seeks ultimate power and control, and believes in using whatever means necessary to achieve his goals, including working with the Daleks.',
        a.traits = ["Manipulative", "Cunning", "Ruthless", "Ambitious"],
        a.sphere_of_influence = 'Politics'
    ;
MERGE (a:Agent {uuid: 'agent-bors'})
    ON CREATE SET
        a.name = 'Bors',
        a.title = 'None',
        a.description = 'Bors is a brutish and intimidating figure who is one of the last remnants of criminality on Desperus. Strong and aggressive, he seeks to maintain power over those weaker than him, often using violence to assert his dominance. He has a sharp temper and is not afraid to intimidate or harm others.',
        a.traits = ["Intimidating", "Aggressive", "Brutish", "Violent"],
        a.sphere_of_influence = 'Criminal Underworld'
    ;
MERGE (a:Agent {uuid: 'agent-garge'})
    ON CREATE SET
        a.name = 'Garge',
        a.title = 'None',
        a.description = 'Garge is a dangerous and unscrupulous survivor of Desperus\' criminal underworld. He heavily relies on brute force and intimidation to achieve his goals. Garge is Bors\' partner in crime and shares the same ruthless values. He\'s prone to violence but is also strategically clever.',
        a.traits = ["Ruthless", "Dangerous", "Violent", "Strategic"],
        a.sphere_of_influence = 'Criminal Underworld'
    ;
MERGE (o:Object {uuid: 'object-gun'})
    ON CREATE SET
        o.name = 'Gun',
        o.description = 'A firearm that appears from Garvey\'s belt, likely semi-automatic, designed for personal protection and potentially lethal use.',
        o.purpose = 'To provide Garvey with a means of defense or attack against perceived threats in the hostile surroundings of Kembel.',
        o.significance = 'Represents Garvey\'s shift from confusion to a determined mindset focused on aggression. It indicates his transition into a more dangerous and unstable state of mind.'
    ;
MERGE (o:Object {uuid: 'object-ray_gun'})
    ON CREATE SET
        o.name = 'Ray Gun',
        o.description = 'A futuristic energy weapon used by Marc Cory. The ray gun has a sleek design, featuring a trigger mechanism and a barrel that emits a concentrated beam of energy.',
        o.purpose = 'To disable or eliminate threats in hostile environments, serving as a protection for its user.',
        o.significance = 'Represents the constant danger of violence and survival in the hostile setting, emphasizing the moral dilemmas faced by the characters.'
    ;
MERGE (o:Object {uuid: 'object-varga_thorn'})
    ON CREATE SET
        o.name = 'Varga Thorn',
        o.description = 'A sharp, pointed thorn from the Varga plant, known for its toxic properties. In this scene, it is lodged deeply in the palm of Lowery\'s hand, signifying the danger present in the jungle and the effect of pestilent plant life.',
        o.purpose = 'To illustrate the link between Varga plants and the Daleks, emphasizing the potential danger associated with their presence.',
        o.significance = 'Serves as a pivotal plot device to reveal the Daleks\' ongoing influence and plans, foreshadowing future conflicts and the transformation of individuals.'
    ;
MERGE (o:Object {uuid: 'object-id_card'})
    ON CREATE SET
        o.name = 'ID Card',
        o.description = 'A personal identification card issued by Space Security Service, providing verification of Cory\'s authority and status as an agent. It bears his name and details about his role within the organization.',
        o.purpose = 'To identify Cory as a Space Security Service agent and grant him certain privileges and authority.',
        o.significance = 'Establishes Cory\'s credentials and enforces his leadership over Lowery, highlighting themes of authority and trust within the narrative.'
    ;
MERGE (o:Object {uuid: 'object-dalek_supreme'})
    ON CREATE SET
        o.name = 'Dalek Supreme',
        o.description = 'The Dalek Supreme is a significant variant of the Dalek species, characterized by its aerodynamic, jet black casing. This special casing distinguishes it from the regular Daleks which are typically gunmetal blue-grey and silver. The Supreme is the highest authority among the Daleks, presiding over their operations and military strategies.',
        o.purpose = 'To lead and coordinate Dalek operations and responses during the conference and to assert control over the proceedings.',
        o.significance = 'The presence of the Dalek Supreme indicates the seriousness of the Daleks\' mission and their readiness to engage in their plans for universal domination. It represents the pinnacle of their hierarchy.'
    ;
MERGE (o:Object {uuid: 'object-dalek_patrol'})
    ON CREATE SET
        o.name = 'Dalek Security Patrol',
        o.description = 'A group of Dalek units configured for reconnaissance and tactical operations, equipped with advanced sensors and weaponry for tracking intruders.',
        o.purpose = 'To track and close in on alien spacecraft, ensuring security measures are executed effectively.',
        o.significance = 'The Dalek security patrol represents the relentless pursuit of the Daleks in their quest to eliminate any threats to their plans.'
    ;
MERGE (o:Object {uuid: 'object-rescue_beacon'})
    ON CREATE SET
        o.name = 'Rescue Beacon',
        o.description = 'A small device used for sending alerts and signals for distress situations. It is designed to record messages and transmit them over space to alert nearby vessels or organizations to a distress call.',
        o.purpose = 'To broadcast a warning message regarding the Dalek invasion and the impending destruction of the galaxy.',
        o.significance = 'Cory\'s recorded message through the rescue beacon represents his desperate hope to save his galaxy and serves as a catalyst for the impending conflict between the Daleks and Earth.'
    ;
MERGE (o:Object {uuid: 'object-outer_galaxy_ship'})
    ON CREATE SET
        o.name = 'Outer Galaxy Ship',
        o.description = 'A large, advanced spaceship from an outer galaxy that flies overhead during the scene. It is not of human design and features technology beyond that available in the current time period.',
        o.purpose = 'To transport beings or cargo across vast distances in space, suggesting a connection to a larger conflict potentially involving the Daleks.',
        o.significance = 'Represents the wider galactic involvement and the escalating stakes of the situation, indicating that threats extend beyond just the Vargas and the Daleks.'
    ;
MERGE (o:Object {uuid: 'object-conference_table'})
    ON CREATE SET
        o.name = 'Conference Table',
        o.description = 'The conference table is a large, circular table that serves as the meeting point for the emissaries from the seven galaxies. It is technologically integrated to facilitate communications and discussions among the representatives. The table is likely adorned with holographic displays for presentations or strategic discussions.',
        o.purpose = 'To facilitate discussions and agreements among the allied representatives as they scheme together for the conquest of Earth and other galaxies.',
        o.significance = 'Represents the alliance formed between the Daleks and the representatives of the outer galaxies, signifying their intent to conquer Earth first. It is a focal point of their malefic plans.'
    ;
MERGE (o:Object {uuid: 'object-tarnnium_core'})
    ON CREATE SET
        o.name = 'Taranium Core',
        o.description = 'A small device made of Taranium, a rare and powerful mineral. It glows with a faint, eerie light and is essential for power systems.',
        o.purpose = 'To serve as a critical component for the Time Destructor, a weapon being developed by the Daleks.',
        o.significance = 'Represents the key to the Daleks\' plans for universal domination and the threat they pose to the entire Solar System.'
    ;
MERGE (o:Object {uuid: 'object-gear_on_ship'})
    ON CREATE SET
        o.name = 'Ship from the planet Gearon',
        o.description = 'A spaceship that has just arrived from the planet Gearon. Its design is sleek and advanced, symbolizing the technological prowess of the Gearon people. The ship is equipped for interstellar travel and represents the forces aligned against the Daleks.',
        o.purpose = 'To transport individuals from the planet Gearon to another location, likely in connection with the Great Alliance.',
        o.significance = 'Heralds the arrival of new allies in the confrontation against the Daleks and signifies the expanding conflict surrounding the Great Alliance.'
    ;
MERGE (o:Object {uuid: 'object-great_alliance'})
    ON CREATE SET
        o.name = 'The Great Alliance',
        o.description = 'A coalition of various factions and planets coming together to combat the Dalek threat. The concept of the alliance is pivotal to the unfolding narrative as it indicates the collective effort against a common enemy.',
        o.purpose = 'To coordinate efforts between different planets and beings to prepare for the impending war against the Daleks.',
        o.significance = 'Symbolizes hope and unity among the factions in the face of a common adversary, the Daleks, and marks a crucial turning point in the narrative.'
    ;
MERGE (o:Object {uuid: 'object-capsule'})
    ON CREATE SET
        o.name = 'Capsule',
        o.description = 'A small container used for launching distress signals. It houses the recording apparatus to send messages back to Earth.',
        o.purpose = 'To record and transmit messages of distress to other ships or to Earth.',
        o.significance = 'Represents a lifeline for characters stranded in a hostile environment; the hope of sending a message back for help.'
    ;
MERGE (o:Object {uuid: 'object-treaty'})
    ON CREATE SET
        o.name = 'Treaty',
        o.description = 'A formal agreement made between the seven great powers of the outer galaxies, signifying their alliance and shared ambitions for galactic domination.',
        o.purpose = 'To solidify the agreement among the various factions for joint military and political actions.',
        o.significance = 'Marks a pivotal moment in the narrative as it unites the outer galaxies under the Daleks\' influence, foreshadowing a concerted effort against Earth.'
    ;
MERGE (l:Location {uuid: 'location-jungle'})
    ON CREATE SET
        l.name = 'Jungle',
        l.description = 'A dense, tropical jungle setting, characterized by thick vegetation, tall trees, and an oppressive atmosphere. The area is teeming with wildlife and contains hidden dangers, such as carnivorous flora and lurking predators. The humidity is high, and the sounds of nature fill the air, creating an eerie and unpredictable environment.',
        l.type = 'Planetary Environment'
    ;
MERGE (l:Location {uuid: 'location-kembel_jungle'})
    ON CREATE SET
        l.name = 'Kembel Jungle',
        l.description = 'A dense jungle filled with tall trees, thick foliage, and the sounds of unseen animals. The jungle has a threatening and hostile atmosphere, amplified by the presence of plants like the Varga that can attack and the general sense of danger. Visibility is limited due to the dense undergrowth and the creeping vines.',
        l.type = 'Jungle'
    ;
MERGE (l:Location {uuid: 'location-outside_the_ship'})
    ON CREATE SET
        l.name = 'Outside the ship',
        l.description = 'The scene takes place outside a rocket ship on the planet Desperus, characterized by its treacherous, swampy environment. The area is dark and damp, filled with thick foliage and overgrown vegetation typical of a hostile alien world. The atmosphere is tense as the Vargas, dangerous carnivorous plants, are edging closer to the rocket ship, posing a significant threat to the characters. Above, a larger spaceship from an outer galaxy passes overhead, hinting at the larger dangers at play.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-rocket_ship'})
    ON CREATE SET
        l.name = 'Rocket Ship',
        l.description = 'A damaged rocket ship, where Marc Cory and Gordon Lowery are attempting repairs. Inside, it is filled with various tools and equipment necessary for flight. The exterior is exposed to the elements outside the jungle, and there are concerns about safety and impending attacks from both hostile creatures and enemies.',
        l.type = 'Rocket Ship'
    ;
MERGE (l:Location {uuid: 'location-inside_the_ship'})
    ON CREATE SET
        l.name = 'Inside the ship',
        l.description = 'Location mentioned in scene: Inside the ship',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-unknown_ship'})
    ON CREATE SET
        l.name = 'Unknown Ship',
        l.description = 'An unspecified spacecraft where characters find themselves after an unfortunate landing. The ship is equipped with various control panels and a communication system, indicating it is capable of interstellar travel. The environment inside the ship feels tense, particularly as it relates to the apparent danger posed by the Daleks and the increasing pressure on the main characters.',
        l.type = 'Ship'
    ;
MERGE (l:Location {uuid: 'location-mira'})
    ON CREATE SET
        l.name = 'Mira',
        l.description = 'Mira is a dense jungle planet characterized by its thick undergrowth, towering trees, and a humid atmosphere. The area surrounding the ship is marked by swampy ground, with stagnation evident in pools of water. The environment is hostile, with various dangerous plants and creatures, notably the venomous Varga thorns that can cause severe harm.',
        l.type = 'Planet'
    ;
MERGE (l:Location {uuid: 'location-dalek_control_room'})
    ON CREATE SET
        l.name = 'Dalek control room',
        l.description = 'A stark, metallic chamber filled with high-tech communication and monitoring equipment, where the Daleks convene to receive updates and coordinate their operations. The room is dominated by the imposing presence of the Dalek Supreme, whose jet black casing contrasts sharply with the gunmetal blue-grey and silver of the other Daleks. The atmosphere is tense as the machine creatures focus on their tasks and await orders.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-clearing'})
    ON CREATE SET
        l.name = 'Clearing',
        l.description = 'An open area surrounded by dense jungle where Cory and Lowery\'s rocket ship was located. It is characterized by its visibility and lack of cover, making it a vulnerable spot for the crew, which ultimately leads to the ship\'s destruction by Dalek forces.',
        l.type = 'Clearing'
    ;
MERGE (l:Location {uuid: 'location-conference_room'})
    ON CREATE SET
        l.name = 'Conference room',
        l.description = 'A large and imposing space within the Dalek city where emissaries from the seven systems have gathered. It is characterized by its stark metallic design, designed for the presence of Daleks and their allies. The atmosphere is tense, with the Dalek Supreme present to oversee the meeting and a sense of urgency surrounding discussions of an impending threat.',
        l.type = 'Scene Location'
    ;
MERGE (l:Location {uuid: 'location-kembel'})
    ON CREATE SET
        l.name = 'Kembel',
        l.description = 'Kembel is known as the most hostile planet in the universe, largely avoided by other civilizations. It features treacherous terrain and an inhospitable environment, making it an ideal secret base for the nefarious Daleks to establish operations.',
        l.type = 'Planet'
    ;
MERGE (l:Location {uuid: 'location-dalek_city'})
    ON CREATE SET
        l.name = 'Dalek City',
        l.description = 'A hidden city belonging to the Daleks, characterized by its metallic structures and advanced technology. The city is a hive of activity, with Daleks controlling various operations. The atmosphere here is tense, as it is dedicated to the Daleks\' nefarious plans for galactic conquest.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location-mira-jungle'})
    ON CREATE SET
        l.name = 'Mira Jungle',
        l.description = 'A dense jungle featuring tall trees, thick underbrush, and an oppressive atmosphere with damp and decay. The ground is swampy, with stagnant pools of water and a variety of plants that create a dangerous environment. Sounds of distant creatures can often be heard, and there is a sense of lurking danger.',
        l.type = 'Jungle'
    ;
MERGE (l:Location {uuid: 'location-freighter_xm2'})
    ON CREATE SET
        l.name = 'Freighter XM2',
        l.description = 'Inside the damaged spaceship Freighter XM2, the atmosphere is tense as Space Security agent Cory attempts to contact a rescue ship. The control panels are functional but suspect, indicating possible damage from a recent crash. There is a sense of urgency as Cory works to restore communication and redeem the dire predicament they find themselves in.',
        l.type = 'Spaceship'
    ;
MERGE (l:Location {uuid: 'location-mira-clearing'})
    ON CREATE SET
        l.name = 'Mira Clearing',
        l.description = 'A small clearing surrounded by tall trees and dense foliage. Inhabitants of this area include dangerous Varga plants, which are carnivorous and have been modified for defensive purposes by the Daleks. The ground is uneven, muddy, and swamp-like, making movement treacherous.',
        l.type = 'Clearing'
    ;
MERGE (l:Location {uuid: 'location-varga_lab'})
    ON CREATE SET
        l.name = 'Varga Laboratory',
        l.description = 'The Varga plants have been artificially developed in laboratories by the Daleks to enhance their natural predatory abilities. These plants are designed to create a protective environment for Dalek operations, serving as both a weapon and a natural security measure.',
        l.type = 'Laboratory'
    ;
MERGE (l:Location {uuid: 'location-outer_galaxy'})
    ON CREATE SET
        l.name = 'Outer Galaxy',
        l.description = 'A vast region of space located outside the immediate vicinity of the known universe, containing unknown planets and civilizations. It is referenced as the origin of a huge craft seen flying overhead.',
        l.type = 'Galaxy'
    ;
MERGE (l:Location {uuid: 'location-gearons_planet'})
    ON CREATE SET
        l.name = 'Planet Gearon',
        l.description = 'A distant planet from which the newly arrived spaceship originates. While details about its characteristics are unknown, it is significant enough to be mentioned in the context of the Daleks\' plans.',
        l.type = 'Planet'
    ;
MERGE (o:Organization {uuid: 'org-space_security_service'})
    ON CREATE SET
        o.name = 'Space Security Service',
        o.description = 'A government organization tasked with maintaining the safety and security of space travel and other planetary activities, often involved in intelligence and operations against threats to the Solar System.',
        o.sphere_of_influence = 'Space security and intelligence operations'
    ;
MERGE (o:Organization {uuid: 'org-daleks'})
    ON CREATE SET
        o.name = 'Daleks',
        o.description = 'A race of mutant creatures encased in metal shells, the Daleks are known for their ruthless pursuit of power and control. They seek to exterminate all life forms they deem inferior and have been known to create synthetic life forms, such as Vargas, for their protection.',
        o.sphere_of_influence = 'Various planets, including Kembel'
    ;
MERGE (o:Organization {uuid: 'org-dalek_patrol'})
    ON CREATE SET
        o.name = 'Dalek Patrol',
        o.description = 'A tactical security unit of Daleks tasked with locating and neutralizing threats against their operations, particularly targeting intruding alien spacecraft.',
        o.sphere_of_influence = 'Dalek Operations'
    ;
MERGE (o:Organization {uuid: 'org-great_alliance'})
    ON CREATE SET
        o.name = 'Great Alliance',
        o.description = 'An alliance formed by the Daleks and other civilizations, including the inhabitants of the planet Gearon, intended to further their mutual goals of domination.',
        o.sphere_of_influence = 'Galactic Power Dynamics'
    ;
MERGE (o:Organization {uuid: 'org-seven_systems'})
    ON CREATE SET
        o.name = 'Seven Systems',
        o.description = 'A coalition of alien representatives from various systems seeking to form an alliance with the Daleks for mutual benefits, although they are unaware of the true intentions of the Daleks.',
        o.sphere_of_influence = 'Intergalactic Politics'
    ;
MERGE (o:Organization {uuid: 'org-special_security_service'})
    ON CREATE SET
        o.name = 'Special Security Service (SSS)',
        o.description = 'A government agency in the Solar System responsible for maintaining security and order. They are on the lookout for threats, including dealing with individuals like Marc Cory and the Daleks.',
        o.sphere_of_influence = 'Security and Law Enforcement'
    ;
MERGE (o:Organization {uuid: 'org-outer_galaxies'})
    ON CREATE SET
        o.name = 'Outer Galaxies Alliance',
        o.description = 'An alliance of several alien races formed to conquer the Solar System, united under the leadership of the Daleks. The members collectively believe in their superiority and the inevitable domination of Earth and its colonies.',
        o.sphere_of_influence = 'Galactic Expansion'
    ;
MERGE (o:Organization {uuid: 'org-dalek_alliance'})
    ON CREATE SET
        o.name = 'Dalek Alliance',
        o.description = 'A coalition formed by the Daleks and the representatives from various outer galaxies, united to achieve conquest over the Solar System and other galaxies. Their objective is to bring destruction and establish Dalek supremacy.',
        o.sphere_of_influence = 'Outer Galaxies and the Solar System'
    ;
MERGE (o:Organization {uuid: 'org-criminal_underworld'})
    ON CREATE SET
        o.name = 'Criminal Underworld of Desperus',
        o.description = 'A group of surviving criminals on the planet Desperus who engage in various illegal activities, using violence and intimidation to maintain power.',
        o.sphere_of_influence = 'Desperus'
    ;
MERGE (o:Organization {uuid: 'org-sss'})
    ON CREATE SET
        o.name = 'Special Security Service',
        o.description = 'The military and intelligence organization responsible for ensuring the safety and security of the Solar System, often operating undercover to combat threats.',
        o.sphere_of_influence = 'Politics and Operations'
    ;
MERGE (o:Organization {uuid: 'org-alliance_of_outer_galaxies'})
    ON CREATE SET
        o.name = 'Alliance of Outer Galaxies',
        o.description = 'A coalition formed by various alien races brought together to assist the Daleks in their plans of invasion and conquest, pledging allegiances to create a formidable military force.',
        o.sphere_of_influence = 'Outer Galaxies'
    ;
MERGE (s:Scene {uuid: 'scene-001'})
    ON CREATE SET
        s.title = 'Awakening in the Jungle',
        s.description = 'In the inhospitable jungles of Kembel, Jeff Garvey lies on the ground, barely conscious. As he wakes up in confusion, he suddenly experiences intense pain, pressing his hands against his temples. After the agonizing moment passes, Garvey calms down and smiles, standing up as he retrieves a gun from his belt. He then mouths a chilling mantra of intent: \'I must kill.\'',
        s.scene_number = 1
    WITH s
    MATCH (l:Location {uuid: 'location-kembel_jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-1-1'})
    ON CREATE SET
        e.title = 'Jeff Garvey Wakes in Kembel Jungle',
        e.description = 'Garvey wakes with a start in the jungle, confused and in pain. He presses his hands to his temples as he experiences agony, but the pain eventually passes. Calmer now, Garvey smiles and rises to his feet, pulling a gun from his belt as he recalls his mission.',
        e.sequence = 1,
        e.key_dialogue = ["I, I remember now. I must, I must kill. Must kill. Must kill."]
    ;
MERGE (s:Scene {uuid: 'scene-002'})
    ON CREATE SET
        s.title = 'The Descent into Madness',
        s.description = 'The scene takes place outside a damaged rocket ship in the dense jungles of Kembel. Daylight is filtering through the thick canopy, creating a muted, tense atmosphere. Marc Cory and Gordon Lowery are busy attempting to repair their rocket ship amidst the sounds of the jungle, including a loud screech that hints at lurking danger. As they work, Garvey, a hidden figure, is drawn closer by a primal urge to kill, driven by the effects of a Varga thorn. The confrontation escalates unexpectedly when Cory shoots Garvey, leading to an emotional outburst from Lowery, who grapples with feelings of betrayal and loss. In the aftermath, Cory examines the thorn embedded in Garvey\'s flesh, foreshadowing the dark transformation associated with the Varga species. The scene ends with Garvey lying motionless, but hints at his disturbing, gradual metamorphosis into a Varga plant.',
        s.scene_number = 2
    WITH s
    MATCH (l:Location {uuid: 'location-kembel_jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-2-1'})
    ON CREATE SET
        e.title = 'Cory and Lowery Repair Rocket Ship',
        e.description = 'Marc Cory and Gordon Lowery are attempting to repair their rocket ship in the jungle. Lowery expresses frustration about the planet, while Cory insists on continuing the job despite the noise from the jungle. They are momentarily distracted by a loud screeching sound.',
        e.sequence = 1,
        e.key_dialogue = ["Why you ever wanted to land on a planet like this in the first place I'll never know. This is getting on my nerves.", "I hate to think what kind of an animal makes a noise like that.", "Yes, all the more reason to stop talking and get on with the job."]
    ;
MERGE (e:Event {uuid: 'event-2-2'})
    ON CREATE SET
        e.title = 'Garvey Attempts to Kill Cory and Lowery',
        e.description = 'Hidden in the dense foliage of the jungle, Jeff Garvey prepares to kill Cory and Lowery but is instead shot by Cory before he can fire. Lowery mourns Garvey\'s apparent death, and Cory examines Garvey to discover a Varga thorn embedded in his neck.',
        e.sequence = 2,
        e.key_dialogue = ["You've killed him. You've killed Jeff!", "It was him or you.", "Careful, don't prick yourself with it or you'll end up the way Garvey is. I'd have to kill you."]
    ;
MERGE (e:Event {uuid: 'event-2-3'})
    ON CREATE SET
        e.title = 'Cory and Lowery Enter Rocket Ship',
        e.description = 'Cory and Lowery hastily enter their rocket ship after Garvey falls, realizing the severity of the situation. Garvey lies potentially dead on the ground, but begins to twitch moments later, indicating unearthly changes.',
        e.sequence = 3,
        e.key_dialogue = ["Let's get back into the ship.", "What about his personal effects?"]
    ;
MERGE (s:Scene {uuid: 'scene-003'})
    ON CREATE SET
        s.title = 'Unraveling the Dalek Threat',
        s.description = 'Inside the damaged ship, Space Security agent Marc Cory engages in a tense dialogue with his pilot, Gordon Lowery. Cory, confronting the death of his partner Garvey, reveals the grave threat posed by the Daleks as they work on establishing a communication link with a freighter. Outside the ship, Garvey’s transformation into a Varga begins as he twitches with life, a chilling reminder of the danger the team faces. Tension mounts as Cory insists on trying to contact Freighter XM2 while Lowery expresses doubt about their equipment\'s functionality, revealing they are marooned on a hostile planet, potentially under Dalek control.',
        s.scene_number = 3
    WITH s
    MATCH (l:Location {uuid: 'location-damaged_space_ship'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-3-1'})
    ON CREATE SET
        e.title = 'Cory Reveals His Identity and Intentions to Lowery',
        e.description = 'Cory informs Lowery that, with Garvey dead, he has important information to share regarding their situation. He hands Lowery his ID from the Space Security Service, asserting his authority.',
        e.sequence = 1,
        e.key_dialogue = ["I didn't intend to tell you anything, but since we're stuck on this planet and Garvey's dead, there are some facts that you're entitled to know.", "I might have known. Space Security Service. Licensed to kill."]
    ;
MERGE (e:Event {uuid: 'event-3-2'})
    ON CREATE SET
        e.title = 'Cory Explains the Daleks\' Threat',
        e.description = 'Cory explains the situation regarding the Daleks, outlining their history and recent activities, which include taking control of many planets and potentially being a threat to Earth.',
        e.sequence = 2,
        e.key_dialogue = ["I suppose you've heard of the Daleks?", "They haven't been active in our galaxy for some time now, but that doesn't mean they've exactly been sitting around."]
    ;
MERGE (e:Event {uuid: 'event-3-3'})
    ON CREATE SET
        e.title = 'Garvey Starts Transforming into a Varga',
        e.description = 'Outside the ship, Garvey\'s feet and legs begin to twitch with life as he starts his transformation into a Varga plant. His human features are disappearing, covered by white spines.',
        e.sequence = 3,
        e.key_dialogue = []
    ;
MERGE (e:Event {uuid: 'event-3-4'})
    ON CREATE SET
        e.title = 'Cory Attempts to Contact Freighter XM2',
        e.description = 'Cory uses the ship\'s radio equipment to make contact with Freighter XM2, indicating urgency to establish communication for rescue or help.',
        e.sequence = 4,
        e.key_dialogue = ["Freighter XM2, freighter XM2. Come in, please. Come in, please!"]
    ;
MERGE (e:Event {uuid: 'event-3-5'})
    ON CREATE SET
        e.title = 'Lowery Questions the Situation',
        e.description = 'Lowery expresses skepticism about the situation. He raises concerns about the ship being potentially damaged and challenges Cory to ensure the equipment is tested.',
        e.sequence = 5,
        e.key_dialogue = ["Can you make it work?", "It may have been damaged in the crash."]
    ;
MERGE (e:Event {uuid: 'event-3-6'})
    ON CREATE SET
        e.title = 'Cory Stresses the Importance of Contacting Help',
        e.description = 'Cory insists that they must keep trying to contact Freighter XM2 despite Lowery\'s concerns about possibly malfunctioning equipment.',
        e.sequence = 6,
        e.key_dialogue = ["We've just got to take our chance that it hasn't been damaged. Freighter XM2. Come in, please. Come in, please! (static) It's useless."]
    ;
MERGE (e:Event {uuid: 'event-3-7'})
    ON CREATE SET
        e.title = 'Cory Provides Information on Varga Plants',
        e.description = 'Cory explains the nature of Varga plants to Lowery, detailing their deadly effects and connection to the Daleks. He emphasizes their significance in understanding the current danger.',
        e.sequence = 7,
        e.key_dialogue = ["A thorn from a Varga plant. A thing part animal, part vegetable. Looks like a cactus. The poison attacks the brain."]
    ;
MERGE (s:Scene {uuid: 'scene-004'})
    ON CREATE SET
        s.title = 'The Dalek Supreme\'s Command',
        s.description = 'In the dimly lit Dalek control room, the atmosphere is tense as the Dalek Supreme, encased in jet black, enters amidst its gunmetal blue-grey and silver counterparts. The room is alive with the mechanical sounds of Dalek machinery. The Supreme demands reports from its subordinates regarding the status of the alien spacecraft and the upcoming conference. The first Dalek reports that emissaries from seven planets will arrive as arranged, while a second Dalek confirms the location of the alien ship. The Supreme repeatedly emphasizes the necessity for total destruction of the ship and its occupants, asserting the Dalek\'s relentless pursuit of their enemies.',
        s.scene_number = 4
    WITH s
    MATCH (l:Location {uuid: 'location-dalek_control_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-4-1'})
    ON CREATE SET
        e.title = 'Dalek Supreme Receives Reports',
        e.description = 'The Dalek Supreme enters the control room and expects to receive updates on the latest developments from the assembled Daleks. The first Dalek reports on the emissaries from the seven planets, confirming their scheduled arrival. Following this, the Supreme inquires about security, prompting another Dalek to reveal the positioning of an alien spacecraft. The Dalek Supreme orders that the ship and its occupants must be totally destroyed.',
        e.sequence = 1,
        e.key_dialogue = ["DALEK SUPREME: I will receive your reports. First, space monitor control.", "DALEK 1: Space monitor control. The emissaries from the seven planets will arrive as arranged.", "DALEK SUPREME: Then the conference will begin at first sun.", "DALEK SUPREME: The ship and its occupants must be totally destroyed. Destroyed! Destroyed!", "DALEK 2: It will be done."]
    ;
MERGE (s:Scene {uuid: 'scene-005'})
    ON CREATE SET
        s.title = 'Closing In',
        s.description = 'Outside a rocket ship, two characters, Marc Cory and Gordon Lowery, are preparing a rescue beacon as they are slowly being encircled by three Vargas, alien creatures that move by dragging their roots along the ground. Lowery is focused on assembling the recording mechanism for the beacon, while Cory is on the lookout for potential threats. Tensions rise as Cory insists that they need to hurry, suspecting that the Daleks are already aware of their presence. Lowery debates the nature of the Vargas, questioning if they might have grown naturally, but Cory asserts that they were engineered by the Daleks for protection. The scene highlights the urgency of their situation and their determination to escape.',
        s.scene_number = 5
    WITH s
    MATCH (l:Location {uuid: 'location-rocket_ship'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-5-1'})
    ON CREATE SET
        e.title = 'Cory Reports Presence of Vargas',
        e.description = 'Lowery and Cory are outside the rocket ship when Cory warns Lowery about the approaching Vargas, explaining that they move very slowly by dragging themselves using their roots.',
        e.sequence = 1,
        e.key_dialogue = ["Anything out there?", "Vargas. They're closing in."]
    ;
MERGE (e:Event {uuid: 'event-5-2'})
    ON CREATE SET
        e.title = 'Lowery Works on Rescue Beacon',
        e.description = 'Lowery is busy preparing the rescue beacon, specifically the recording mechanism for the emergency message, while Cory urges him to finish quickly.',
        e.sequence = 2,
        e.key_dialogue = ["This is the recording part. Let's hope it wasn't damaged in the crash.", "Hurry up and attach it then."]
    ;
MERGE (e:Event {uuid: 'event-5-3'})
    ON CREATE SET
        e.title = 'Cory Expresses Concern About Daleks',
        e.description = 'Cory warns Lowery that they must hurry because the Daleks are likely aware of their location and will come for them soon. Lowery expresses doubt about the presence of Daleks.',
        e.sequence = 3,
        e.key_dialogue = ["I don't know how long we've got. But the Daleks must know we're here. They'll be coming for us soon.", "Well I still think you're jumping to conclusions, you know."]
    ;
MERGE (e:Event {uuid: 'event-5-4'})
    ON CREATE SET
        e.title = 'Debate About the Origin of Varga Plants',
        e.description = 'Cory argues that the Varga plants are synthetic creations of the Daleks, while Lowery suggests they could potentially grow naturally in the environment.',
        e.sequence = 4,
        e.key_dialogue = ["Take my word for it, they're here all right.", "Yes, but couldn't these Varga things grow here naturally? I mean, it's possible, isn't it?"]
    ;
MERGE (s:Scene {uuid: 'scene-006'})
    ON CREATE SET
        s.title = 'Daleks Formulate Their Strategy',
        s.description = 'In a dense jungle, a Dalek security patrol discusses their tactics for approaching an alien spacecraft. The atmosphere is tense as they prepare to close in on their target from two separate directions. The scene showcases the methodical and relentless nature of the Daleks as they execute their orders.',
        s.scene_number = 6
    WITH s
    MATCH (l:Location {uuid: 'location-jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-6-1'})
    ON CREATE SET
        e.title = 'Dalek Security Patrol Plans Tactics',
        e.description = 'The Dalek security patrol reviews the information received about an unidentified alien spacecraft. They decide to close in on it using two separate approaches.',
        e.sequence = 1,
        e.key_dialogue = ["Acceptor readings indicated alien space craft. We will close on it from two directions.", "We obey."]
    ;
MERGE (s:Scene {uuid: 'scene-007'})
    ON CREATE SET
        s.title = 'The Approach of Danger',
        s.description = 'In a desolate setting outside a rocket ship on the hostile planet Kembel, space security agents Cory and Lowery are scrutinizing the horizon as they prepare to send an SOS signal. The atmosphere is tense, with the threat of the carnivorous Vargas lurking nearby. Lowery expresses a desire to shoot at the Vargas, but Cory warns him that it would be futile since they regenerate quickly. Lowery assures Cory that the beacon they are attempting to activate is standard safety equipment meant to transmit their distress signal to any listening outposts in the galaxy. As they discuss their plans, the tension escalates with the arrival of an unidentified massive craft overhead, heightening the sense of impending danger, especially with the possible involvement of the Daleks threatening their galaxy.',
        s.scene_number = 7
    WITH s
    MATCH (l:Location {uuid: 'location-rocket_ship'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-7-1'})
    ON CREATE SET
        e.title = 'Cory and Lowery Discuss Danger',
        e.description = 'Cory and Lowery express their concern about the approaching Vargas, discussing the futility of fighting them and the necessity of using the beacon to signal for help. Lowery prepares the rocket launcher to send an SOS message into orbit.',
        e.sequence = 1,
        e.key_dialogue = ["Those things are getting too close for comfort. I'll fix them.", "It's no good, Lowery. They'll only grow again as fast as you can shoot them.", "Get back to the beacon. You sure it'll work?", "Well, it should work. It's standard safety equipment on all rocket ships.", "From what we know about the Daleks, we've got to be picked up.", "And all we have to do is to stay alive until they get here."]
    ;
MERGE (e:Event {uuid: 'event-7-2'})
    ON CREATE SET
        e.title = 'Cory and Lowery Spot Huge Craft',
        e.description = 'Cory and Lowery are startled by the appearance of a huge craft that passes overhead, sparking a moment of awe and concern about its implications, particularly related to the Daleks\' involvement.',
        e.sequence = 2,
        e.key_dialogue = ["That's the biggest rocket ship I've ever seen. It's like nothing we've got.", "It's from an outer galaxy.", "Yes, but what's it doing in a God-forsaken planet like this?", "I don't know, but I'll tell you this. There's something very big going on here, and if the Daleks are involved you can bet your life our whole galaxy is in danger."]
    ;
MERGE (s:Scene {uuid: 'scene-008'})
    ON CREATE SET
        s.title = 'The Great Alliance Emerges',
        s.description = 'In a dense, foreboding jungle, a Dalek patrol stands vigilant, having just observed the arrival of a spaceship from the planet Gearon. The atmosphere is tense and charged, as the Daleks prepare for the implications of this new arrival. Their metallic forms glisten under the dappled light filtering through the canopy while they converse about the significance of the ship. Dalek 1 identifies the craft as hailing from Gearon, while Dalek 2 reflects on the broader consequence of this event, calling it the beginning of the Great Alliance. With the new information in hand, the Daleks resume their advance, closing in on the rocket ship, indicating a sense of impending confrontation.',
        s.scene_number = 8
    WITH s
    MATCH (l:Location {uuid: 'location-jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-8-1'})
    ON CREATE SET
        e.title = 'Dalek Patrol Observes Spaceship Arrival',
        e.description = 'The Dalek patrol notices the arrival of the spaceship from the planet Gearon. They recognize it as the beginning of the Great Alliance, signifying an important moment in their plan. The Daleks resume their advance, closing in on the rocket ship.',
        e.sequence = 1,
        e.key_dialogue = ["The ship from the planet Gearon.", "And the beginning of the Great Alliance."]
    ;
MERGE (s:Scene {uuid: 'scene-009'})
    ON CREATE SET
        s.title = 'The Daleks\' Arrival',
        s.description = 'Outside the rocket ship, agent Marc Cory and pilot Gordon Lowery experience a tense moment as they realize they are not alone. Lowery, having completed the assembly for the distress signal launcher, prepares to record a message, but Cory warns him of an approaching threat. They crouch in the bushes to hide as two Daleks glide into view, quickly followed by two more. As the Daleks confirm that the ship\'s crew is missing, they order the destruction of the ship. Cory and Lowery are filled with horror as the Daleks unleash their firepower on the ship, watching it disintegrate before them. In the midst of their escape, Lowery accidentally gets pricked by a Varga thorn, which causes panic and urgency as they must flee further into the jungle while the Daleks prepare to search for them.',
        s.scene_number = 9
    WITH s
    MATCH (l:Location {uuid: 'location-mira-jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-9-1'})
    ON CREATE SET
        e.title = 'Cory and Lowery Discuss Distress Signal',
        e.description = 'Cory urges Lowery to be quiet as he senses movement nearby, indicating that they should be cautious. Lowery asks if it could be Vargas, but Cory rushes him, emphasizing the need for them to escape and suggesting that they launch the distress signal later.',
        e.sequence = 1,
        e.key_dialogue = ["Cory: Shush.", "Cory: There's something out there moving.", "Lowery: Vargas?", "Cory: No. Moving too quickly. Come on, we've got to get away."]
    ;
MERGE (e:Event {uuid: 'event-9-2'})
    ON CREATE SET
        e.title = 'Daleks Arrive and Destroy the Ship',
        e.description = 'As Cory and Lowery attempt to escape, they spot four Daleks glide into the clearing. The Daleks check the ship then order its destruction. Lowery watches in horror as his ship is totally obliterated by the Daleks.',
        e.sequence = 2,
        e.key_dialogue = ["Lowery: Cory! Daleks!", "Cory: Get down and don't make a sound!", "Dalek 2: The ship is empty. The crew has gone.", "Dalek 1: We will search for them. Destroy the ship. Fire!"]
    ;
MERGE (e:Event {uuid: 'event-9-3'})
    ON CREATE SET
        e.title = 'Lowery Gets Stung by Varga Thorn',
        e.description = 'Lowery, panicking after the destruction of the ship, pushes through dense bushes only to recoil in shock from pain. He discovers a Varga thorn embedded in his hand, tears it out, and begins sucking at the wound to try and recover from the poison.',
        e.sequence = 3,
        e.key_dialogue = ["Lowery: It's just falling apart!", "Cory: Come on, man, come on. They'll be looking for us now!"]
    ;
MERGE (s:Scene {uuid: 'scene-010'})
    ON CREATE SET
        s.title = 'The Gathering of Allies',
        s.description = 'In the dark and foreboding conference room of the Dalek city on Kembel, representatives from seven alien systems have gathered for a crucial meeting. The atmosphere is tense, filled with anticipation as the Dalek Supreme prepares to commence the assembly with its various emissaries present. Malpha, representing one of the outer galaxies, makes a dramatic entrance as the last delegate before the meeting can begin. He disrupts the proceedings by announcing the presence of a hostile influence among them, creating an air of unease. The Dalek Supreme, however, reassures the delegates that the intruders\' spaceship has been destroyed and that the beings are being hunted down. Malpha’s concern about the possibility of the beings sending a message through the universe is met with the Dalek Supreme\'s insistence that they will not have the time to do so, reiterating the Daleks’ assurance of their extermination.',
        s.scene_number = 10
    WITH s
    MATCH (l:Location {uuid: 'location-conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-10-1'})
    ON CREATE SET
        e.title = 'Dalek Supreme Calls Meeting to Order',
        e.description = 'With the arrival of Malpha, the Dalek Supreme announces that the meeting can now begin, signaling the start of their discussion.',
        e.sequence = 1,
        e.key_dialogue = ["DALEK SUPREME: With the arrival of our ally Malpha, we are enough. The meeting can now begin."]
    ;
MERGE (e:Event {uuid: 'event-10-2'})
    ON CREATE SET
        e.title = 'Malpha Disagrees with Dalek Supreme',
        e.description = 'Malpha interrupts the Dalek Supreme, claiming that the meeting cannot begin due to a hostile presence being among them, creating a sense of tension.',
        e.sequence = 2,
        e.key_dialogue = ["MALPHA: No it can't.", "DALEK SUPREME: What is wrong?", "MALPHA: There is a hostile presence among us."]
    ;
MERGE (e:Event {uuid: 'event-10-3'})
    ON CREATE SET
        e.title = 'Malpha Warns of Hostile Presence',
        e.description = 'Malpha informs the gathering that he has been told of hostile influences from the solar system, raising alarms among the Daleks about potential threats.',
        e.sequence = 3,
        e.key_dialogue = ["MALPHA: On arrival here, I am told that there are hostile influences from the solar system among us."]
    ;
MERGE (e:Event {uuid: 'event-10-4'})
    ON CREATE SET
        e.title = 'Dalek Supreme Dismisses Concerns',
        e.description = 'The Dalek Supreme reassures the assembly that hostile beings from Earth were dealt with, stating that their spaceship has been destroyed.',
        e.sequence = 4,
        e.key_dialogue = ["DALEK SUPREME: Some beings have landed from the planet Earth, hostile beings from the centre of the solar system. But do not worry. Their spaceship has been destroyed."]
    ;
MERGE (e:Event {uuid: 'event-10-5'})
    ON CREATE SET
        e.title = 'Malpha Questions Dalek Supreme\'s Assurance',
        e.description = 'Malpha expresses his doubts regarding the Dalek Supreme\'s assurances about the hostile beings, demonstrating unease.',
        e.sequence = 5,
        e.key_dialogue = ["MALPHA: What about the beings?", "DALEK SUPREME: They cannot escape."]
    ;
MERGE (e:Event {uuid: 'event-10-6'})
    ON CREATE SET
        e.title = 'Dalek Supreme Confirms Fugitives Will Be Destroyed',
        e.description = 'The Dalek Supreme insists that the intruders cannot escape and that patrols are currently hunting for them to execute.',
        e.sequence = 6,
        e.key_dialogue = ["DALEK SUPREME: At this moment they are being hunted down. They will be destroyed. MALPHA: Are you sure?", "DALEK SUPREME: They cannot get away."]
    ;
MERGE (e:Event {uuid: 'event-10-7'})
    ON CREATE SET
        e.title = 'Malpha Raises Concern About Potential Communication',
        e.description = 'Malpha raises the possibility that the intruders may attempt to send a message through the universe, indicating a potential risk.',
        e.sequence = 7,
        e.key_dialogue = ["MALPHA: Suppose they send a message through this universe?"]
    ;
MERGE (e:Event {uuid: 'event-10-8'})
    ON CREATE SET
        e.title = 'Dalek Supreme Dismisses Communication Fears',
        e.description = 'The Dalek Supreme dismisses Malpha\'s concerns about the intruders sending a message, affirming that they will not have enough time.',
        e.sequence = 8,
        e.key_dialogue = ["DALEK SUPREME: They will not have time. If they do not die by our Varga plants, my patrols will kill them! They will be exterminated! Exterminated!"]
    ;
MERGE (s:Scene {uuid: 'scene-011'})
    ON CREATE SET
        s.title = 'Desperate Refuge',
        s.description = 'In the dense, humid jungle, Cory, a Space Security agent, moves swiftly, leading Lowery, his companion, through the thick vegetation. The sounds of the wildlife surround them, creating an atmosphere of tension and urgency as they frantically seek a safe place to hide from the looming threat in the environment, presumably the Daleks. Cory\'s mind races, trying to devise a plan for survival amidst the perilous surroundings.',
        s.scene_number = 11
    WITH s
    MATCH (l:Location {uuid: 'location-jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-11-1'})
    ON CREATE SET
        e.title = 'Marc Cory Leads Gordon Lowery Through the Jungle',
        e.description = 'Cory urgently guides Lowery through the dense jungle, seeking a safe refuge from the threats surrounding them. The atmosphere is tense as they navigate the perilous terrain.',
        e.sequence = 1,
        e.key_dialogue = ["This way."]
    ;
MERGE (s:Scene {uuid: 'scene-012'})
    ON CREATE SET
        s.title = 'Galactic Alliance Formed',
        s.description = 'The scene takes place in a conference room, where seven delegates from various alien species gather to ratify a treaty of alliance, facilitated by the Daleks. The atmosphere is charged with anticipation and ambition as each delegate signals their assent to the treaty, marking a pivotal moment in galactic politics. The Dalek Supreme oversees the proceedings, declaring that all powers are united under their control. Malpha, the designated speaker, enthusiastically hails the formation of this alliance, proclaiming it to be a historic moment, signalling the commencement of a vast campaign of conquest across the Solar System, with Earth identified as the first target for domination. The collective sentiment is one of triumph and determination, with the delegates envisioning their impending military might over Mars, Venus, Jupiter, and beyond.',
        s.scene_number = 12
    WITH s
    MATCH (l:Location {uuid: 'location-conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-12-1'})
    ON CREATE SET
        e.title = 'Delegates Signal Assent to the Treaty',
        e.description = 'The delegates in the conference room express their agreement to the treaty laid before them, indicating a united front among the seven great powers of the outer galaxies and the Daleks, who are now allied. The moment is acknowledged as historic, with Malpha highlighting this alliance as the greatest war force ever assembled, assuring conquest over various celestial bodies, concluding with the declaration that the first target will be Earth.',
        e.sequence = 1,
        e.key_dialogue = ["Agreed.", "All are agreed. It is done. The seven great powers of the outer galaxies are one.", "This is indeed an historic moment in the history of the universe.", "The seven of us represent the greatest war force ever assembled. Conquest is assured!", "They will all fall before our might. But the first of them will be Earth!"]
    ;
MERGE (s:Scene {uuid: 'scene-013'})
    ON CREATE SET
        s.title = 'Descent into Despair',
        s.description = 'The scene unfolds in the dense jungle of Kembel, where Lowery, stricken by the deadly poison of the Varga, struggles with pain and horror as he realizes that his hand is covered with its white spines. Cory arrives, urgency in his voice as he reveals that a Dalek city lies ahead and they need to act quickly. A grim realization hits Cory as he understands the truth about the Varga infecting Lowery, who, in his madness, chants the word \'Kill\' before turning his weapon on himself. Cory records a desperate warning about the impending invasion and destruction of their galaxy by the Daleks, just as the Daleks close in on him, marking a moment of tension as he struggles to send the message. Unfortunately, he is ultimately intercepted, leading to his death as the Daleks continue their plans for conquest, unaware of the warning left behind.',
        s.scene_number = 13
    WITH s
    MATCH (l:Location {uuid: 'location-kembel_jungle'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-13-1'})
    ON CREATE SET
        e.title = 'Lowery Discovers His Transformation',
        e.description = 'Gordon Lowery, in great pain from the Varga poison, discovers that his hand and forearm are covered with white spines of the Varga. He hastily covers his arm when he hears Marc Cory returning.',
        e.sequence = 1,
        e.key_dialogue = ["Kill.", "What?", "The Varga!"]
    ;
MERGE (e:Event {uuid: 'event-13-2'})
    ON CREATE SET
        e.title = 'Cory Reports the Dalek Invasion',
        e.description = 'Marc Cory insists on the urgency of getting the capsule off, revealing that he overheard an announcement indicating their galaxy is to be invaded and destroyed.',
        e.sequence = 2,
        e.key_dialogue = ["We've got to get this capsule off, and fast. There's a city down there, A Dalek city.", "What did you hear?", "Our whole galaxy is to be invaded and destroyed."]
    ;
MERGE (e:Event {uuid: 'event-13-3'})
    ON CREATE SET
        e.title = 'Lowery Succumbs to Varga Poison',
        e.description = 'Under the influence of the Varga transformation, Gordon Lowery\'s mind begins to degrade, leading him to lethally turn his gun on Cory. Cory reacts quicker, shooting Lowery dead.',
        e.sequence = 3,
        e.key_dialogue = ["Kill. Kill.", "That's right. I'll soon, soon I shall be one of them. Kill. Kill."]
    ;
MERGE (e:Event {uuid: 'event-13-4'})
    ON CREATE SET
        e.title = 'Cory Records His Warning',
        e.description = 'After killing Lowery, Cory desperately begins recording a message on the rescue beacon, warning Earth about the impending Dalek invasion and the need for immediate defense mechanisms.',
        e.sequence = 4,
        e.key_dialogue = ["Marc Cory, Special Security Service, reporting from the planet Kembel. The Daleks are planning the complete destruction of our galaxy.", "If our galaxy is to be saved, whoever receives this message must relay this information to Earth immediately."]
    ;
MERGE (e:Event {uuid: 'event-13-5'})
    ON CREATE SET
        e.title = 'Daleks Close In',
        e.description = 'As Cory continues his recording, Daleks approach him, having detected his presence. Eventually, they fire upon him, ensuring he cannot complete his mission.',
        e.sequence = 5,
        e.key_dialogue = ["Fire. He is dead.", "Our plans for the galactic conquest are safe. Whatever information he discovered has died with him."]
    ;
MERGE (s:Scene {uuid: 'scene-014'})
    ON CREATE SET
        s.title = 'Pledge of Allegiance to the Dalek Cause',
        s.description = 'In a dimly lit conference room, the air is thick with tension and anticipation. Malpha stands at the center of a semicircular table, addressing the various representatives from different galaxies. His voice resonates with fervor as he declares their unified pledge to the Dalek cause, proclaiming the intent to annihilate entire galaxies and conquer Earth first. The assembled allies fervently join in, chanting \'Victory!\' as they echo Malpha\'s enthusiasm, their faces alight with a mix of grim determination and blind ambition.',
        s.scene_number = 14
    WITH s
    MATCH (l:Location {uuid: 'location-conference_room'})
    MERGE (s)-[:LOCATED_IN]->(l);
MERGE (e:Event {uuid: 'event-14-1'})
    ON CREATE SET
        e.title = 'Malpa Declares Allegiance to the Dalek Cause',
        e.description = 'Malpa stands at the conference table, proclaiming the readiness of the gathered representatives to pledge allegiance to the Dalek cause. He outlines their intention to conquer and destroy, specifically mentioning that Earth will be their first target. The other delegates join in a chorus of \'Victory!\', collectively expressing their commitment to the Daleks.',
        e.sequence = 1,
        e.key_dialogue = ["Now all is ready. We at this table pledge our allegiance to the Dalek cause. Our armies will reduce the galaxies to ashes. Their people to dust. And Earth we will conquer first. Victory! Victory!", "Victory! Victory! Victory!"]
    ;
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-sss'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-mavic_chen'}),
          (o:Organization {uuid: 'org-sss'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object-gun'}),
          (a:Agent {uuid: 'agent-jeff_garvey'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-ray_gun'}),
          (a:Agent {uuid: 'agent-marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-varga_thorn'}),
          (a:Agent {uuid: 'agent-gordon_lowery'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-id_card'}),
          (a:Agent {uuid: 'agent-marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-dalek_supreme'}),
          (a:Agent {uuid: 'agent-malpha'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-dalek_patrol'}),
          (a:Agent {uuid: 'agent-malpha'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-rescue_beacon'}),
          (a:Agent {uuid: 'agent-gordon_lowery'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-outer_galaxy_ship'}),
          (a:Agent {uuid: 'agent-gordon_lowery'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-tarnnium_core'}),
          (a:Agent {uuid: 'agent-marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-great_alliance'}),
          (a:Agent {uuid: 'agent-malpha'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object-capsule'}),
          (a:Agent {uuid: 'agent-marc_cory'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (o:Organization {uuid: 'org-space_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-jeff_garvey'}),
          (o:Organization {uuid: 'org-space_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-space_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (o:Organization {uuid: 'org-space_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-mavic_chen'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (o:Organization {uuid: 'org-daleks'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (o:Organization {uuid: 'org-seven_systems'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-mavic_chen'}),
          (o:Organization {uuid: 'org-special_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-special_security_service'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (o:Organization {uuid: 'org-outer_galaxies'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (o:Organization {uuid: 'org-dalek_alliance'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-dalek_alliance'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-bors'}),
          (o:Organization {uuid: 'org-criminal_underworld'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-garge'}),
          (o:Organization {uuid: 'org-criminal_underworld'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-mavic_chen'}),
          (o:Organization {uuid: 'org-sss'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (o:Organization {uuid: 'org-sss'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (o:Organization {uuid: 'org-sss'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (o:Organization {uuid: 'org-alliance_of_outer_galaxies'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gun-event-1-1'})
    ON CREATE SET
        oi.description = 'Garvey pulls the gun from his belt as he recalls his mission to kill, which signifies his intent and sets the stage for his dangerous actions in the jungle.',
        oi.status_before = 'The gun is holstered and inactive; unused by Garvey.',
        oi.status_after = 'The gun is drawn, signifying readiness for use as Garvey expresses his mission to kill.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gun'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gun-event-1-1'})
    ON CREATE SET
        oi.description = 'Garvey pulls the gun from his belt as he recalls his mission to kill, which signifies his intent and sets the stage for his dangerous actions in the jungle.',
        oi.status_before = 'The gun is holstered and inactive; unused by Garvey.',
        oi.status_after = 'The gun is drawn, signifying readiness for use as Garvey expresses his mission to kill.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gun'})
    MATCH (e:Event {uuid: 'event-1-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-1-1'})
    ON CREATE SET
        ap.current_status = 'Wakes up confused and in pain, eventually getting to his feet and pulling out a gun.',
        ap.emotional_state = 'Initially confused and in agony, but calms down and smiles as he remembers his mission.',
        ap.emotional_tags = ["Initially confused", "in agony, but calms down", "smiles as he remembers his mission."],
        ap.active_plans = ["To kill as part of his mission."],
        ap.beliefs = ["He must kill as part of his mission."],
        ap.goals = ["To successfully carry out his mission by killing."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ray_gun-event-2-2'})
    ON CREATE SET
        oi.description = 'Marc Cory uses the ray gun to shoot Jeff Garvey, preventing Garvey from killing him and Gordon Lowery.',
        oi.status_before = 'The ray gun is holstered on Cory\'s belt, ready for use.',
        oi.status_after = 'The ray gun is still in Cory\'s possession, but it has been discharged.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ray_gun'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-2-2'})
    ON CREATE SET
        oi.description = 'Cory discovers a Varga thorn embedded in Garvey\'s neck, indicating his prolonged exposure to Varga venom.',
        oi.status_before = 'The Varga thorn is embedded in Garvey\'s flesh, a direct consequence of Varga venom.',
        oi.status_after = 'Cory removes the thorn from Garvey\'s body, which may have implications for his condition.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ray_gun-event-2-3'})
    ON CREATE SET
        oi.description = 'The ray gun belongs to Cory, who hastily enters the rocket ship with Lowery after shooting Garvey.',
        oi.status_before = 'The ray gun is holstered and has just been discharged.',
        oi.status_after = 'The ray gun is secured in Cory\'s possession as they enter the rocket ship.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ray_gun'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ray_gun-event-2-2'})
    ON CREATE SET
        oi.description = 'Marc Cory uses the ray gun to shoot Jeff Garvey, preventing Garvey from killing him and Gordon Lowery.',
        oi.status_before = 'The ray gun is holstered on Cory\'s belt, ready for use.',
        oi.status_after = 'The ray gun is still in Cory\'s possession, but it has been discharged.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ray_gun'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-2-2'})
    ON CREATE SET
        oi.description = 'Cory discovers a Varga thorn embedded in Garvey\'s neck, indicating his prolonged exposure to Varga venom.',
        oi.status_before = 'The Varga thorn is embedded in Garvey\'s flesh, a direct consequence of Varga venom.',
        oi.status_after = 'Cory removes the thorn from Garvey\'s body, which may have implications for his condition.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-2-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-ray_gun-event-2-3'})
    ON CREATE SET
        oi.description = 'The ray gun belongs to Cory, who hastily enters the rocket ship with Lowery after shooting Garvey.',
        oi.status_before = 'The ray gun is holstered and has just been discharged.',
        oi.status_after = 'The ray gun is secured in Cory\'s possession as they enter the rocket ship.'
    WITH oi
    MATCH (o:Object {uuid: 'object-ray_gun'})
    MATCH (e:Event {uuid: 'event-2-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Attempting to repair the rocket ship while facing frustrations.',
        ap.emotional_state = 'Frustrated but determined.',
        ap.emotional_tags = ["Frustrated but determined."],
        ap.active_plans = ["Continue working on the rocket ship despite distractions."],
        ap.beliefs = ["Repairing the ship is essential for survival.", "Distractions are annoying and hinder progress."],
        ap.goals = ["Get the rocket ship operational.", "Reach the rendezvous with the freighter."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-1'})
    ON CREATE SET
        ap.current_status = 'Working on repairing the rocket ship and feeling the pressure to succeed.',
        ap.emotional_state = 'Frustrated and anxious.',
        ap.emotional_tags = ["Frustrated", "anxious."],
        ap.active_plans = ["Focus on repairs despite concerns about the environment."],
        ap.beliefs = ["The ship needs to be fixed to escape the planet.", "Time is running out to make the rendezvous."],
        ap.goals = ["Repair the rocket ship.", "Conserve time before the freighter picks them up."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Hidden and preparing to attack Cory and Lowery as he succumbs to the Varga influence.',
        ap.emotional_state = 'Consumed by a killing instinct.',
        ap.emotional_tags = ["Consumed by a killing instinct."],
        ap.active_plans = ["Kill Cory and Lowery before they are fully aware of his presence."],
        ap.beliefs = ["The urge to kill drives him.", "He feels he must eliminate the threat they pose."],
        ap.goals = ["Fulfill the Varga instinct to kill.", "Ensure his own survival by eliminating threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Has just shot Garvey and is checking to see if he\'s alive.',
        ap.emotional_state = 'Disturbed and regretful about killing Garvey.',
        ap.emotional_tags = ["Disturbed", "regretful about killing Garvey."],
        ap.active_plans = ["Assess Garvey's condition after the attack."],
        ap.beliefs = ["Killing Garvey was necessary for his own survival.", "There are consequences to violence that weigh heavily."],
        ap.goals = ["Survive the encounter.", "Protect Lowery and themselves."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-2'})
    ON CREATE SET
        ap.current_status = 'Mourning Garvey\'s apparent death and feeling anger towards Cory.',
        ap.emotional_state = 'Angry and mournful.',
        ap.emotional_tags = ["Angry", "mournful."],
        ap.active_plans = ["Confront Cory for shooting Garvey."],
        ap.beliefs = ["Cory's actions are unjustifiable.", "They must deal with the situation resulting from the Varga influence."],
        ap.goals = ["Get justice for Garvey.", "Ensure the survival of himself and Cory."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-id_card-event-3-1'})
    ON CREATE SET
        oi.description = 'Cory hands Lowery his ID card from the Space Security Service, asserting his authority over him.',
        oi.status_before = 'The ID card is in Cory\'s possession.',
        oi.status_after = 'The ID card is with Lowery, establishing Cory\'s identity and authority.'
    WITH oi
    MATCH (o:Object {uuid: 'object-id_card'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-3-7'})
    ON CREATE SET
        oi.description = 'Cory explains the nature of the Varga thorn, detailing its poisonous effects and connection to the Daleks.',
        oi.status_before = 'The thorn is undiscussed; its relevance unknown to Lowery.',
        oi.status_after = 'The thorn is identified as crucial to understanding the Daleks\' threat, heightening tension in the narrative.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-3-7'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-id_card-event-3-1'})
    ON CREATE SET
        oi.description = 'Cory hands Lowery his ID card from the Space Security Service, asserting his authority over him.',
        oi.status_before = 'The ID card is in Cory\'s possession.',
        oi.status_after = 'The ID card is with Lowery, establishing Cory\'s identity and authority.'
    WITH oi
    MATCH (o:Object {uuid: 'object-id_card'})
    MATCH (e:Event {uuid: 'event-3-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-3-7'})
    ON CREATE SET
        oi.description = 'Cory explains the nature of the Varga thorn, detailing its poisonous effects and connection to the Daleks.',
        oi.status_before = 'The thorn is undiscussed; its relevance unknown to Lowery.',
        oi.status_after = 'The thorn is identified as crucial to understanding the Daleks\' threat, heightening tension in the narrative.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-3-7'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Explaining his identity and intentions to Lowery.',
        ap.emotional_state = 'Determined and authoritative.',
        ap.emotional_tags = ["Determined", "authoritative."],
        ap.active_plans = ["To affirm his authority by presenting his ID.", "To recruit Lowery's assistance."],
        ap.beliefs = ["He believes in the importance of revealing the truth about the situation.", "He believes that Lowery needs to accept his role in the crisis."],
        ap.goals = ["To gain Lowery's trust and cooperation.", "To secure help in dealing with the Daleks."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-1'})
    ON CREATE SET
        ap.current_status = 'Confronting Cory about Garvey\'s death.',
        ap.emotional_state = 'Angry and suspicious.',
        ap.emotional_tags = ["Angry", "suspicious."],
        ap.active_plans = ["To demand an explanation for Garvey's death."],
        ap.beliefs = ["He believes Cory is responsible for Garvey's death.", "He holds a strong allegiance to Garvey and their past partnership."],
        ap.goals = ["To understand the events leading to Garvey's death.", "To determine if Cory can be trusted."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-2'})
    ON CREATE SET
        ap.current_status = 'Informing Lowery about the Dalek threat.',
        ap.emotional_state = 'Urgent and informative.',
        ap.emotional_tags = ["Urgent", "informative."],
        ap.active_plans = ["To clarify the severity of the Dalek situation.", "To explain the Daleks' history and their current activities."],
        ap.beliefs = ["He believes that the Dalek threat is real.", "He holds a sense of urgency about the need for warning others."],
        ap.goals = ["To educate Lowery on the Daleks.", "To motivate action against the Dalek threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-3-3'})
    ON CREATE SET
        ap.current_status = 'Transforming into a Varga plant.',
        ap.emotional_state = 'Unconscious to the transformation process.',
        ap.emotional_tags = ["Unconscious to the transformation process."],
        ap.active_plans = [],
        ap.beliefs = [],
        ap.goals = []
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-4'})
    ON CREATE SET
        ap.current_status = 'Attempting to contact Freighter XM2 for help.',
        ap.emotional_state = 'Frustrated.',
        ap.emotional_tags = ["Frustrated."],
        ap.active_plans = ["To establish communication with Freighter XM2.", "To seek assistance for rescue."],
        ap.beliefs = ["He believes the communication equipment should work.", "He holds a desperate hope for rescue."],
        ap.goals = ["To regain contact with the outside universe.", "To secure rescue for him and his companions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-5'})
    ON CREATE SET
        ap.current_status = 'Questioning Cory about the situation.',
        ap.emotional_state = 'Skeptical.',
        ap.emotional_tags = ["Skeptical."],
        ap.active_plans = ["To ensure that the equipment is functioning correctly.", "To validate Cory's claims."],
        ap.beliefs = ["He believes that the ship might be damaged.", "He holds a lingering skepticism about Cory's authority."],
        ap.goals = ["To confirm the viability of their escape plan.", "To ascertain the truth about the Dalek threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-6'})
    ON CREATE SET
        ap.current_status = 'Reassuring Lowery about contacting help.',
        ap.emotional_state = 'Determined.',
        ap.emotional_tags = ["Determined."],
        ap.active_plans = ["To continue attempts to contact Freighter XM2.", "To encourage persistence despite Lowery's concerns."],
        ap.beliefs = ["He believes the equipment is still operable.", "He feels a responsibility to save Garvey and himself."],
        ap.goals = ["To retrieve assistance to escape their situation.", "To resolve the situation before it escalates."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-7'})
    ON CREATE SET
        ap.current_status = 'Providing information on Varga plants to Lowery.',
        ap.emotional_state = 'Knowledgeable and insightful.',
        ap.emotional_tags = ["Knowledgeable", "insightful."],
        ap.active_plans = ["To educate Lowery on the dangers of Varga plants.", "To express the urgency of understanding the current situation."],
        ap.beliefs = ["He believes in the significance of knowledge about the Varga plants.", "He holds that understanding their nature is crucial for survival."],
        ap.goals = ["To inform Lowery of the risks they face from the Varga plants.", "To prepare Lowery for the dangers they may encounter."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-4-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme enters the control room and commands the assembled Daleks to provide their reports on the latest developments concerning the arrival of emissaries and the status of an alien spacecraft. Its command establishes its authority within the Dalek hierarchy.',
        oi.status_before = 'The Dalek Supreme is poised to receive updates, displaying a jet-black casing that sets it apart from the other Daleks.',
        oi.status_after = 'The Dalek Supreme has received the necessary reports and has confirmed the need for the destruction of the spaceship and its occupants, affirming its role as a decisive authority.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-4-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol is mentioned in the context of locating the alien spacecraft. The patrol is tasked with reaching the ship shortly, which indicates their readiness to engage in an assault.',
        oi.status_before = 'The Dalek patrol is in a state of alertness, ready to respond to the Supreme\'s commands regarding security and the situation at hand.',
        oi.status_after = 'The Dalek patrol is mobilized and prepared to execute the order to destroy the alien spacecraft and its occupants.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-4-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme enters the control room and commands the assembled Daleks to provide their reports on the latest developments concerning the arrival of emissaries and the status of an alien spacecraft. Its command establishes its authority within the Dalek hierarchy.',
        oi.status_before = 'The Dalek Supreme is poised to receive updates, displaying a jet-black casing that sets it apart from the other Daleks.',
        oi.status_after = 'The Dalek Supreme has received the necessary reports and has confirmed the need for the destruction of the spaceship and its occupants, affirming its role as a decisive authority.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-4-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol is mentioned in the context of locating the alien spacecraft. The patrol is tasked with reaching the ship shortly, which indicates their readiness to engage in an assault.',
        oi.status_before = 'The Dalek patrol is in a state of alertness, ready to respond to the Supreme\'s commands regarding security and the situation at hand.',
        oi.status_after = 'The Dalek patrol is mobilized and prepared to execute the order to destroy the alien spacecraft and its occupants.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-4-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Not present, but inferred as the scene revolves around the Dalek Supreme\'s operations regarding the Daleks\' plan, which Cory is aware of.',
        ap.emotional_state = 'Tense and concerned about the imminent threats posed by the Daleks.',
        ap.emotional_tags = ["Tense", "concerned about the imminent threats posed by the Daleks."],
        ap.active_plans = ["Gather intelligence on the Dalek's plans.", "Prevent the Dalek invasion."],
        ap.beliefs = ["The Daleks are a significant threat that must be stopped.", "Allies must work together to combat the Daleks."],
        ap.goals = ["To uncover the Daleks' strategies and plans.", "To mobilize a response against the Dalek forces."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-sara_kingdom-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Not present, but engaged in efforts against the Dalek threat.',
        ap.emotional_state = 'Determined to combat the Dalek forces despite the risks involved.',
        ap.emotional_tags = ["Determined to combat the Dalek forces despite the risks involved."],
        ap.active_plans = ["Work with allies to gather a response against the Daleks.", "Protect valuable assets and personnel."],
        ap.beliefs = ["The Daleks must be stopped at all costs.", "Sacrifice may be necessary to achieve victory."],
        ap.goals = ["To thwart the Dalek invasion plans.", "To ensure the safety of humanity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Present and participating in the conference among the Daleks.',
        ap.emotional_state = 'Nervous and expectant for the developments regarding the invasion.',
        ap.emotional_tags = ["Nervous", "expectant for the developments regarding the invasion."],
        ap.active_plans = ["Engage in discussions about the Dalek conquest plans."],
        ap.beliefs = ["Collaboration with the Daleks is essential for survival.", "The Daleks will bring power and opportunity."],
        ap.goals = ["Secure a position of influence within the Dalek plan.", "Ensure his species benefits from the Dalek alliance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-4-1'})
    ON CREATE SET
        ap.current_status = 'Not present, but aligned with Marc Cory\'s goals against the Daleks.',
        ap.emotional_state = 'Cautious and on alert regarding Dalek movements.',
        ap.emotional_tags = ["Cautious", "on alert regarding Dalek movements."],
        ap.active_plans = ["Support Marc Cory's mission to counter Dalek activities."],
        ap.beliefs = ["The Daleks pose a serious threat to space travelers.", "Teamwork is essential for survival against the Dalek forces."],
        ap.goals = ["Aid in gathering intelligence on Dalek operations.", "Survive the imminent Dalek threat."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-5-2'})
    ON CREATE SET
        oi.description = 'The rescue beacon is being prepared by Lowery as he attaches the recording mechanism for the emergency message, with Cory urging him to finish quickly.',
        oi.status_before = 'The rescue beacon is not yet fully assembled, with separate components laid out and being worked on.',
        oi.status_after = 'The rescue beacon is in the process of being completed, with the recording mechanism attached, preparing for the launch.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-5-1'})
    ON CREATE SET
        oi.description = 'Cory warns Lowery about the approaching Vargas, explaining that they pose a threat and are used as protection by the Daleks. The warning emphasizes the presence of the Varga plants in the area.',
        oi.status_before = 'No specific status; the Varga plants are implied to be present and known to Cory.',
        oi.status_after = 'The Varga plants are acknowledged threats, and the knowledge of their slow movement is shared, contributing to the tension of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-5-2'})
    ON CREATE SET
        oi.description = 'The rescue beacon is being prepared by Lowery as he attaches the recording mechanism for the emergency message, with Cory urging him to finish quickly.',
        oi.status_before = 'The rescue beacon is not yet fully assembled, with separate components laid out and being worked on.',
        oi.status_after = 'The rescue beacon is in the process of being completed, with the recording mechanism attached, preparing for the launch.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-5-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-5-1'})
    ON CREATE SET
        oi.description = 'Cory warns Lowery about the approaching Vargas, explaining that they pose a threat and are used as protection by the Daleks. The warning emphasizes the presence of the Varga plants in the area.',
        oi.status_before = 'No specific status; the Varga plants are implied to be present and known to Cory.',
        oi.status_after = 'The Varga plants are acknowledged threats, and the knowledge of their slow movement is shared, contributing to the tension of the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-5-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Warning Lowery about the approaching Vargas.',
        ap.emotional_state = 'Concerned and urgent.',
        ap.emotional_tags = ["Concerned", "urgent."],
        ap.active_plans = ["Alert Lowery to the danger of Vargas.", "Ensure they prepare quickly to avoid Daleks."],
        ap.beliefs = ["Vargas pose a serious threat to their safety.", "Daleks are aware of their presence and will come for them soon."],
        ap.goals = ["Escape from danger.", "Prepare the rescue beacon."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-1'})
    ON CREATE SET
        ap.current_status = 'Preparing the rescue beacon.',
        ap.emotional_state = 'Focused but somewhat skeptical.',
        ap.emotional_tags = ["Focused but somewhat skeptical."],
        ap.active_plans = ["Complete work on the rescue beacon.", "Respond to Cory's warnings."],
        ap.beliefs = ["Cory might be overreacting about the presence of the Daleks.", "The Varga plants might not be an immediate threat."],
        ap.goals = ["Finish the rescue beacon.", "Get out of the current predicament."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Urging Lowery to finish the rescue beacon quickly.',
        ap.emotional_state = 'Impatient and anxious.',
        ap.emotional_tags = ["Impatient", "anxious."],
        ap.active_plans = ["Encourage Lowery to expedite the work.", "Prepare for potential Dalek danger."],
        ap.beliefs = ["Time is of the essence.", "The Daleks must be aware of their location and may attack."],
        ap.goals = ["Have the rescue beacon ready for use.", "Avoid Dalek capture."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-2'})
    ON CREATE SET
        ap.current_status = 'Busy attaching the recording mechanism for the rescue beacon.',
        ap.emotional_state = 'Determined but slightly stressed.',
        ap.emotional_tags = ["Determined but slightly stressed."],
        ap.active_plans = ["Complete the attachment of the recording mechanism.", "Keep working despite Cory's urgings."],
        ap.beliefs = ["He is capable of fixing the beacon.", "They might still have time before the Daleks arrive."],
        ap.goals = ["Ensure the rescue beacon works effectively.", "Get out of danger as soon as possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Expressing concern about the approaching Daleks.',
        ap.emotional_state = 'Urgent and worried.',
        ap.emotional_tags = ["Urgent", "worried."],
        ap.active_plans = ["Warn Lowery about the Dalek threat.", "Encourage faster work on the rescue beacon."],
        ap.beliefs = ["Daleks are dangerous and close.", "They must be vigilant and prepared."],
        ap.goals = ["Alert others about the urgency.", "Finish preparations quickly."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-3'})
    ON CREATE SET
        ap.current_status = 'Doubting Cory\'s sense of urgency about the Daleks.',
        ap.emotional_state = 'Skeptical and calm.',
        ap.emotional_tags = ["Skeptical", "calm."],
        ap.active_plans = ["Continues working on the beacon while addressing Cory's concerns."],
        ap.beliefs = ["Cory may be jumping to conclusions about the Daleks' presence.", "They should focus on their immediate task first."],
        ap.goals = ["Complete the beacon as planned.", "Stay focused amidst Cory's warnings."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-6-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol reviews the readings received from their sensors, indicating the presence of an unidentified alien spacecraft and decides to close in on it from two directions.',
        oi.status_before = 'The Dalek patrol is on standby, receiving data from their sensors.',
        oi.status_after = 'The Dalek patrol is actively fanning off in two groups to approach the alien spacecraft.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-6-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-6-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol reviews the readings received from their sensors, indicating the presence of an unidentified alien spacecraft and decides to close in on it from two directions.',
        oi.status_before = 'The Dalek patrol is on standby, receiving data from their sensors.',
        oi.status_after = 'The Dalek patrol is actively fanning off in two groups to approach the alien spacecraft.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-6-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-7-1'})
    ON CREATE SET
        oi.description = 'The rescue beacon is mentioned as a device that Lowery is preparing to launch in order to send an SOS message into orbit, serving as their main hope for calling for help against the approaching Vargas.',
        oi.status_before = 'The rescue beacon exists in a functional state, ready for preparation and use.',
        oi.status_after = 'The status of the rescue beacon remains the same; however, it has not been activated yet, as Cory and Lowery are more preoccupied with the Vargas threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-7-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-7-2'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship is described as passing overhead, startling Cory and Lowery, sparking their concern about the implications related to the approaching danger from the Daleks who may be involved.',
        oi.status_before = 'The outer galaxy ship is in flight above Kembel, undetected by Cory and Lowery until it comes within their sight.',
        oi.status_after = 'The ship continues its journey, disappearing from view while hinting at greater dangers connected to the Daleks\' activities.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-7-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-7-1'})
    ON CREATE SET
        oi.description = 'The rescue beacon is mentioned as a device that Lowery is preparing to launch in order to send an SOS message into orbit, serving as their main hope for calling for help against the approaching Vargas.',
        oi.status_before = 'The rescue beacon exists in a functional state, ready for preparation and use.',
        oi.status_after = 'The status of the rescue beacon remains the same; however, it has not been activated yet, as Cory and Lowery are more preoccupied with the Vargas threat.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-7-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-7-2'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship is described as passing overhead, startling Cory and Lowery, sparking their concern about the implications related to the approaching danger from the Daleks who may be involved.',
        oi.status_before = 'The outer galaxy ship is in flight above Kembel, undetected by Cory and Lowery until it comes within their sight.',
        oi.status_after = 'The ship continues its journey, disappearing from view while hinting at greater dangers connected to the Daleks\' activities.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-7-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-1'})
    ON CREATE SET
        ap.current_status = 'Advising Lowery to abandon the fight against the Vargas and focus on the beacon.',
        ap.emotional_state = 'Concerned and pragmatic.',
        ap.emotional_tags = ["Concerned", "pragmatic."],
        ap.active_plans = ["Ensure Lowery operates the beacon", "Survive until help arrives"],
        ap.beliefs = ["Fighting the Vargas is futile", "Help will arrive if the SOS is sent"],
        ap.goals = ["Send a distress signal", "Stay alive until rescue"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-1'})
    ON CREATE SET
        ap.current_status = 'Preparing the rocket launcher to send an SOS message into orbit.',
        ap.emotional_state = 'Determined and slightly anxious.',
        ap.emotional_tags = ["Determined", "slightly anxious."],
        ap.active_plans = ["Fix the Vargas threat", "Prepare and launch the SOS"],
        ap.beliefs = ["The beacon is standard equipment and will work", "The Vargas need to be dealt with"],
        ap.goals = ["Send a successful distress signal", "Eliminate the immediate threat from the Vargas"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-2'})
    ON CREATE SET
        ap.current_status = 'Reacting to the appearance of a huge craft overhead.',
        ap.emotional_state = 'Startled and concerned about the implications.',
        ap.emotional_tags = ["Startled", "concerned about the implications."],
        ap.active_plans = ["Investigate the type and purpose of the craft"],
        ap.beliefs = ["The craft may relate to the Daleks' involvement", "Their situation could worsen with this new development"],
        ap.goals = ["Understand the implications of the craft's appearance", "Prepare for potential dangers ahead"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-2'})
    ON CREATE SET
        ap.current_status = 'Reacting alongside Cory to the huge craft in the sky.',
        ap.emotional_state = 'Amazed and apprehensive.',
        ap.emotional_tags = ["Amazed", "apprehensive."],
        ap.active_plans = ["Coordinate with Cory to assess the situation"],
        ap.beliefs = ["This large craft suggests something significant is happening", "The Daleks are a potential threat to their safety"],
        ap.goals = ["Determine the intent of the huge craft", "Survive and find a way to escape if necessary"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-8-1'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship arrived at the planet Gearon, prompting the Dalek patrol to observe and take note of its significance as the start of the Great Alliance. The Daleks recognize its arrival as an integral part of their larger plan.',
        oi.status_before = 'The outer galaxy ship was en route to Gearon, preparing to arrive at the planet.',
        oi.status_after = 'The outer galaxy ship is present in the vicinity of the Dalek patrol, now marked as a target for the Daleks\' advance.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-8-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-8-1'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship arrived at the planet Gearon, prompting the Dalek patrol to observe and take note of its significance as the start of the Great Alliance. The Daleks recognize its arrival as an integral part of their larger plan.',
        oi.status_before = 'The outer galaxy ship was en route to Gearon, preparing to arrive at the planet.',
        oi.status_after = 'The outer galaxy ship is present in the vicinity of the Dalek patrol, now marked as a target for the Daleks\' advance.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-8-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-9-1'})
    ON CREATE SET
        oi.description = 'The rescue beacon, a distress signal device, is discussed by Cory and Lowery as they plan to use it but ultimately decide to carry it with them instead of launching it immediately.',
        oi.status_before = 'It is fully assembled and ready for use.',
        oi.status_after = 'It is still with Cory and Lowery, not yet deployed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-9-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-9-2'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship is destroyed by the Daleks upon their arrival, as they order its annihilation to eliminate any evidence of the crew\'s presence.',
        oi.status_before = 'The ship was operational and being used for travel.',
        oi.status_after = 'The ship is obliterated and reduced to debris.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-9-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-9-3'})
    ON CREATE SET
        oi.description = 'Lowery discovers a Varga thorn embedded in his hand as he panics after the ship\'s destruction, attempts to extract it, and sucks at the wound to recover from the poison.',
        oi.status_before = 'The thorn is planted in Lowery\'s hand, causing him pain.',
        oi.status_after = 'The thorn is removed and thrown aside, leaving Lowery with a bleeding wound.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-9-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-9-1'})
    ON CREATE SET
        oi.description = 'The rescue beacon, a distress signal device, is discussed by Cory and Lowery as they plan to use it but ultimately decide to carry it with them instead of launching it immediately.',
        oi.status_before = 'It is fully assembled and ready for use.',
        oi.status_after = 'It is still with Cory and Lowery, not yet deployed.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-9-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-outer_galaxy_ship-event-9-2'})
    ON CREATE SET
        oi.description = 'The outer galaxy ship is destroyed by the Daleks upon their arrival, as they order its annihilation to eliminate any evidence of the crew\'s presence.',
        oi.status_before = 'The ship was operational and being used for travel.',
        oi.status_after = 'The ship is obliterated and reduced to debris.'
    WITH oi
    MATCH (o:Object {uuid: 'object-outer_galaxy_ship'})
    MATCH (e:Event {uuid: 'event-9-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-9-3'})
    ON CREATE SET
        oi.description = 'Lowery discovers a Varga thorn embedded in his hand as he panics after the ship\'s destruction, attempts to extract it, and sucks at the wound to recover from the poison.',
        oi.status_before = 'The thorn is planted in Lowery\'s hand, causing him pain.',
        oi.status_after = 'The thorn is removed and thrown aside, leaving Lowery with a bleeding wound.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-9-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-1'})
    ON CREATE SET
        ap.current_status = 'Cory is alert and cautious, urging Lowery to be quiet and pay attention to movements nearby.',
        ap.emotional_state = 'nervous and focused',
        ap.emotional_tags = ["nervous", "focused"],
        ap.active_plans = ["escape from potential danger", "launch distress signal later"],
        ap.beliefs = ["trusts his instincts about danger", "believes in survival tactics"],
        ap.goals = ["get away safely", "warn others about the Daleks"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-1'})
    ON CREATE SET
        ap.current_status = 'Lowery is engaged in discussion with Cory and is concerned about the distress signal.',
        ap.emotional_state = 'anxious and impatient',
        ap.emotional_tags = ["anxious", "impatient"],
        ap.active_plans = ["launch distress signal", "escape quickly"],
        ap.beliefs = ["believes in the urgency of sending a signal"],
        ap.goals = ["ensure the distress signal gets sent", "survive the encounter with Daleks"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-2'})
    ON CREATE SET
        ap.current_status = 'Cory is trying to help Lowery escape and is alarmed by the Daleks\' arrival.',
        ap.emotional_state = 'tense and desperate',
        ap.emotional_tags = ["tense", "desperate"],
        ap.active_plans = ["get down and hide", "try to escape the Daleks"],
        ap.beliefs = ["believes that stealth is necessary to avoid detection"],
        ap.goals = ["survive the encounter with the Daleks", "warn others about the impending Dalek threat"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-2'})
    ON CREATE SET
        ap.current_status = 'Lowery is terrified as he watches the Daleks destroy his ship.',
        ap.emotional_state = 'horrified and panicked',
        ap.emotional_tags = ["horrified", "panicked"],
        ap.active_plans = ["watch for a chance to escape"],
        ap.beliefs = ["believes that the Daleks are a major threat"],
        ap.goals = ["ensure his own survival", "get away from Kembel safely"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-3'})
    ON CREATE SET
        ap.current_status = 'Lowery is in panic after his ship is destroyed and injures himself on a Varga thorn.',
        ap.emotional_state = 'frantic and scared',
        ap.emotional_tags = ["frantic", "scared"],
        ap.active_plans = ["attempt to heal himself", "continue to escape with Cory"],
        ap.beliefs = ["believes that surviving the injury is crucial"],
        ap.goals = ["recover from the poison", "stay alive and escape"]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-3'})
    ON CREATE SET
        ap.current_status = 'Cory is urging Lowery to keep moving despite the danger.',
        ap.emotional_state = 'urgent and determined',
        ap.emotional_tags = ["urgent", "determined"],
        ap.active_plans = ["get away from the site quickly"],
        ap.beliefs = ["believes they must keep moving to avoid being caught"],
        ap.goals = ["ensure both he and Lowery escape Kembel safely", "warn others about the Dalek threat"]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme declares the commencement of the meeting with the arrival of representative Malpha, establishing its authority over the proceedings.',
        oi.status_before = 'Inactive, awaiting the beginning of the meeting.',
        oi.status_after = 'Active, leading the proceedings of the meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-4'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme reassures the assembly that hostile beings from Earth have been dealt with, stating that their spaceship has been destroyed.',
        oi.status_before = 'Active, participating in the meeting.',
        oi.status_after = 'Continuing to assert control over the meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-6'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme emphasizes the ongoing hunt for the intruders, indicating that they will be exterminated to ensure the security of the Daleks\' plans.',
        oi.status_before = 'Established index of power and control, validating its commands.',
        oi.status_after = 'Still in command, reinforcing the Daleks\' resolve to eliminate threats.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-10-8'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme declares that if the intruders do not die by the Varga plants (which are implied to be deadly), the patrols will exterminate them.',
        oi.status_before = 'Implied presence in the environment as a lethal element.',
        oi.status_after = 'Still in the environment, posing a potential danger to the intruders.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-10-8'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme declares the commencement of the meeting with the arrival of representative Malpha, establishing its authority over the proceedings.',
        oi.status_before = 'Inactive, awaiting the beginning of the meeting.',
        oi.status_after = 'Active, leading the proceedings of the meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-4'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme reassures the assembly that hostile beings from Earth have been dealt with, stating that their spaceship has been destroyed.',
        oi.status_before = 'Active, participating in the meeting.',
        oi.status_after = 'Continuing to assert control over the meeting.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-10-6'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme emphasizes the ongoing hunt for the intruders, indicating that they will be exterminated to ensure the security of the Daleks\' plans.',
        oi.status_before = 'Established index of power and control, validating its commands.',
        oi.status_after = 'Still in command, reinforcing the Daleks\' resolve to eliminate threats.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-10-6'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-10-8'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme declares that if the intruders do not die by the Varga plants (which are implied to be deadly), the patrols will exterminate them.',
        oi.status_before = 'Implied presence in the environment as a lethal element.',
        oi.status_after = 'Still in the environment, posing a potential danger to the intruders.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-10-8'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-1'})
    ON CREATE SET
        ap.current_status = 'Arrives at the conference room and takes his seat.',
        ap.emotional_state = 'Eager but anxious as he senses the presence of a threat.',
        ap.emotional_tags = ["Eager but anxious as he senses the presence of a threat."],
        ap.active_plans = ["Alert others about the hostile presence."],
        ap.beliefs = ["Vigilance is necessary to ensure safety."],
        ap.goals = ["To make the assembly aware of potential dangers from the Solar System."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-2'})
    ON CREATE SET
        ap.current_status = 'Interrupts the Dalek Supreme to express his concerns.',
        ap.emotional_state = 'Urgent and concerned, showing leadership.',
        ap.emotional_tags = ["Urgent", "concerned, showing leadership."],
        ap.active_plans = ["Warn the assembly about the hostile influences."],
        ap.beliefs = ["The safety of the Dalek alliance is vital."],
        ap.goals = ["To ensure that appropriate measures are taken in response to the perceived threat."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-3'})
    ON CREATE SET
        ap.current_status = 'Informs the assembly about the hostile influence.',
        ap.emotional_state = 'Fearful yet assertive, trying to take charge.',
        ap.emotional_tags = ["Fearful yet assertive, trying to take charge."],
        ap.active_plans = ["Rally support against the potential threat."],
        ap.beliefs = ["Proactive measures must be taken to address danger."],
        ap.goals = ["To persuade the assembly to investigate the hostile presence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-5'})
    ON CREATE SET
        ap.current_status = 'Raises concerns about the Dalek Supreme\'s reassurances.',
        ap.emotional_state = 'Doubtful and uneasy.',
        ap.emotional_tags = ["Doubtful", "uneasy."],
        ap.active_plans = ["Press for more information regarding the situation."],
        ap.beliefs = ["The Daleks may underestimate the threat posed by intruders."],
        ap.goals = ["To ensure that the assembly does not become complacent."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-6'})
    ON CREATE SET
        ap.current_status = 'Questions the Dalek Supreme on its assertions regarding the intruders.',
        ap.emotional_state = 'Wary and suspicious.',
        ap.emotional_tags = ["Wary", "suspicious."],
        ap.active_plans = ["Pursue clarification of the Dalek's confidence level."],
        ap.beliefs = ["Distrust of the Dalek's simple assurances."],
        ap.goals = ["To seek confirmation about the status of the intruders."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-10-7'})
    ON CREATE SET
        ap.current_status = 'Raises the possibility of the intruders communicating with others.',
        ap.emotional_state = 'Concerned, showcasing foresight.',
        ap.emotional_tags = ["Concerned, showcasing foresight."],
        ap.active_plans = ["Warn the assembly about potential communications the intruders might attempt."],
        ap.beliefs = ["Vigilance against all potential avenues of escape for the intruders."],
        ap.goals = ["To alert the assembly to the risks of external communication by the intruders."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-11-1'})
    ON CREATE SET
        ap.current_status = 'Leading Gordon Lowery through the jungle.',
        ap.emotional_state = 'Anxious and determined.',
        ap.emotional_tags = ["Anxious", "determined."],
        ap.active_plans = ["Find a safe refuge from the surrounding threats."],
        ap.beliefs = ["Trusting his instincts to navigate the jungle safely.", "Belief in his ability to protect Lowery."],
        ap.goals = ["Ensure both their survival.", "Lead Lowery out of danger."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-11-1'})
    ON CREATE SET
        ap.current_status = 'Following Cory through the jungle.',
        ap.emotional_state = 'Fearful yet trusting.',
        ap.emotional_tags = ["Fearful yet trusting."],
        ap.active_plans = ["Stay close to Cory and follow his lead."],
        ap.beliefs = ["Belief in Cory's knowledge of the jungle.", "Hope that they will find safety soon."],
        ap.goals = ["Survive the threats in the jungle.", "Trust Cory's guidance to find refuge."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-great_alliance-event-12-1'})
    ON CREATE SET
        oi.description = 'The object, representing the treaty or agreement between the seven great powers of the outer galaxies and the Daleks, is at the center of the scene as the delegates signal their assent to it. This assent marks a historic moment for the newly formed alliance aimed at galactic conquest, particularly targeting Earth.',
        oi.status_before = 'The great alliance is in draft form and awaits approval from the delegates present in the conference room.',
        oi.status_after = 'The great alliance is officially ratified as the delegates agree to the treaty, symbolizing unity among diverse powers and the Daleks, thus solidifying its existence and validity.'
    WITH oi
    MATCH (o:Object {uuid: 'object-great_alliance'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-12-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme supervises the proceedings and confirms the agreement of the delegates, asserting that all parties involved are now united in their quest for galactic domination, emphasizing the Daleks\' role in the alliance.',
        oi.status_before = 'The Dalek Supreme is in an assertive and commanding position, awaiting the delegates’ agreement to the treaty.',
        oi.status_after = 'The Dalek Supreme retains its authoritative presence, having successfully facilitated the ratification of the alliance and reaffirming the Daleks\' commitment to conquer Earth as the first target.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-12-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol serves as a protective force and an enforcement unit for the agenda of the newly created alliance, emphasizing their readiness to act against any opposition, particularly concerning their upcoming invasion of Earth.',
        oi.status_before = 'The Dalek patrol is prepared and poised for action, maintaining security while waiting for the treaty\'s validation.',
        oi.status_after = 'The Dalek patrol stands ready and mobilized for the imminent campaign against Earth as the alliance solidifies its commitment to conquest.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tarnnium_core-event-12-1'})
    ON CREATE SET
        oi.description = 'Though not explicitly mentioned in the dialogue, the Taranium core is implicitly central to the Daleks\' plans for creating the Time Destructor, which is crucial for their strategy in the galactic conquest.',
        oi.status_before = 'The Taranium core is in a state of anticipation, being a key component yet to be activated for the Time Destructor.',
        oi.status_after = 'The Taranium core has been established as a vital resource for the Daleks\' ongoing plans, and its importance will grow as their conquest of Earth unfolds.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tarnnium_core'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-great_alliance-event-12-1'})
    ON CREATE SET
        oi.description = 'The object, representing the treaty or agreement between the seven great powers of the outer galaxies and the Daleks, is at the center of the scene as the delegates signal their assent to it. This assent marks a historic moment for the newly formed alliance aimed at galactic conquest, particularly targeting Earth.',
        oi.status_before = 'The great alliance is in draft form and awaits approval from the delegates present in the conference room.',
        oi.status_after = 'The great alliance is officially ratified as the delegates agree to the treaty, symbolizing unity among diverse powers and the Daleks, thus solidifying its existence and validity.'
    WITH oi
    MATCH (o:Object {uuid: 'object-great_alliance'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_supreme-event-12-1'})
    ON CREATE SET
        oi.description = 'The Dalek Supreme supervises the proceedings and confirms the agreement of the delegates, asserting that all parties involved are now united in their quest for galactic domination, emphasizing the Daleks\' role in the alliance.',
        oi.status_before = 'The Dalek Supreme is in an assertive and commanding position, awaiting the delegates’ agreement to the treaty.',
        oi.status_after = 'The Dalek Supreme retains its authoritative presence, having successfully facilitated the ratification of the alliance and reaffirming the Daleks\' commitment to conquer Earth as the first target.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_supreme'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-12-1'})
    ON CREATE SET
        oi.description = 'The Dalek patrol serves as a protective force and an enforcement unit for the agenda of the newly created alliance, emphasizing their readiness to act against any opposition, particularly concerning their upcoming invasion of Earth.',
        oi.status_before = 'The Dalek patrol is prepared and poised for action, maintaining security while waiting for the treaty\'s validation.',
        oi.status_after = 'The Dalek patrol stands ready and mobilized for the imminent campaign against Earth as the alliance solidifies its commitment to conquest.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-tarnnium_core-event-12-1'})
    ON CREATE SET
        oi.description = 'Though not explicitly mentioned in the dialogue, the Taranium core is implicitly central to the Daleks\' plans for creating the Time Destructor, which is crucial for their strategy in the galactic conquest.',
        oi.status_before = 'The Taranium core is in a state of anticipation, being a key component yet to be activated for the Time Destructor.',
        oi.status_after = 'The Taranium core has been established as a vital resource for the Daleks\' ongoing plans, and its importance will grow as their conquest of Earth unfolds.'
    WITH oi
    MATCH (o:Object {uuid: 'object-tarnnium_core'})
    MATCH (e:Event {uuid: 'event-12-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-12-1'})
    ON CREATE SET
        ap.current_status = 'Speaker at the conference, expressing agreement to the treaty.',
        ap.emotional_state = 'Proud and triumphant, feeling significant about the alliance.',
        ap.emotional_tags = ["Proud", "triumphant, feeling significant about the alliance."],
        ap.active_plans = ["To solidify the alliance among the great powers.", "To lead discussions and agreement towards the conquest of celestial bodies."],
        ap.beliefs = ["The alliance represents the greatest war force ever assembled.", "Conquest assures the domination of planets."],
        ap.goals = ["To confirm the treaty and its terms among the delegates.", "To position the allied forces for an immediate attack on Earth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-mavic_chen-event-12-1'})
    ON CREATE SET
        ap.current_status = 'Participating delegate, seeking to influence the treaty process in favor of his own agenda.',
        ap.emotional_state = 'Calculating and smug, feeling confident about his power.',
        ap.emotional_tags = ["Calculating", "smug, feeling confident about his power."],
        ap.active_plans = ["To ensure that Earth becomes the first target in the conquest.", "To use the treaty to strengthen his own influence."],
        ap.beliefs = ["The other delegates should recognize his authority as the Guardian of the Solar System.", "The alliance with the Daleks will provide immediate benefits for himself."],
        ap.goals = ["To position himself as a central figure in the alliance.", "To facilitate the invasion plans against Earth."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-13-1'})
    ON CREATE SET
        oi.description = 'Gordon Lowery discovers the Varga thorn growing from his hand and forearm, indicating that he is succumbing to the Varga transformation.',
        oi.status_before = 'Varga thorn was unknown to Lowery, who was in great pain and trying to suck the poison from his palm.',
        oi.status_after = 'The Varga thorn becomes visible on Lowery\'s arm, revealing his transformation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-13-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-13-2'})
    ON CREATE SET
        oi.description = 'Marc Cory insists on the urgency of launching the rescue beacon to warn Earth about the impending Dalek invasion.',
        oi.status_before = 'The rescue beacon is activated and ready for transmission.',
        oi.status_after = 'The rescue beacon is in use to send a warning message about the Dalek invasion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-13-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gun-event-13-3'})
    ON CREATE SET
        oi.description = 'Gordon Lowery draws his gun as his mind succumbs to the Varga poison, intending to kill Marc Cory.',
        oi.status_before = 'The gun was ready for use but not yet drawn.',
        oi.status_after = 'The gun is fired by Marc Cory to prevent Lowery from killing him, leading to Lowery\'s death.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gun'})
    MATCH (e:Event {uuid: 'event-13-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-13-4'})
    ON CREATE SET
        oi.description = 'After killing Lowery, Marc Cory uses the rescue beacon to record a warning message about the Dalek invasion.',
        oi.status_before = 'The rescue beacon is primed and waiting for a message.',
        oi.status_after = 'The rescue beacon contains a recorded warning message intended for Earth.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-13-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-13-5'})
    ON CREATE SET
        oi.description = 'Daleks approach Marc Cory as he records his warning, eventually firing upon him before he can complete his message.',
        oi.status_before = 'The Dalek patrol is on mission to locate and kill Cory.',
        oi.status_after = 'The Daleks successfully fire at Cory, killing him and ensuring he cannot complete his mission.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-13-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-varga_thorn-event-13-1'})
    ON CREATE SET
        oi.description = 'Gordon Lowery discovers the Varga thorn growing from his hand and forearm, indicating that he is succumbing to the Varga transformation.',
        oi.status_before = 'Varga thorn was unknown to Lowery, who was in great pain and trying to suck the poison from his palm.',
        oi.status_after = 'The Varga thorn becomes visible on Lowery\'s arm, revealing his transformation.'
    WITH oi
    MATCH (o:Object {uuid: 'object-varga_thorn'})
    MATCH (e:Event {uuid: 'event-13-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-13-2'})
    ON CREATE SET
        oi.description = 'Marc Cory insists on the urgency of launching the rescue beacon to warn Earth about the impending Dalek invasion.',
        oi.status_before = 'The rescue beacon is activated and ready for transmission.',
        oi.status_after = 'The rescue beacon is in use to send a warning message about the Dalek invasion.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-13-2'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-gun-event-13-3'})
    ON CREATE SET
        oi.description = 'Gordon Lowery draws his gun as his mind succumbs to the Varga poison, intending to kill Marc Cory.',
        oi.status_before = 'The gun was ready for use but not yet drawn.',
        oi.status_after = 'The gun is fired by Marc Cory to prevent Lowery from killing him, leading to Lowery\'s death.'
    WITH oi
    MATCH (o:Object {uuid: 'object-gun'})
    MATCH (e:Event {uuid: 'event-13-3'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-rescue_beacon-event-13-4'})
    ON CREATE SET
        oi.description = 'After killing Lowery, Marc Cory uses the rescue beacon to record a warning message about the Dalek invasion.',
        oi.status_before = 'The rescue beacon is primed and waiting for a message.',
        oi.status_after = 'The rescue beacon contains a recorded warning message intended for Earth.'
    WITH oi
    MATCH (o:Object {uuid: 'object-rescue_beacon'})
    MATCH (e:Event {uuid: 'event-13-4'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-dalek_patrol-event-13-5'})
    ON CREATE SET
        oi.description = 'Daleks approach Marc Cory as he records his warning, eventually firing upon him before he can complete his message.',
        oi.status_before = 'The Dalek patrol is on mission to locate and kill Cory.',
        oi.status_after = 'The Daleks successfully fire at Cory, killing him and ensuring he cannot complete his mission.'
    WITH oi
    MATCH (o:Object {uuid: 'object-dalek_patrol'})
    MATCH (e:Event {uuid: 'event-13-5'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-1'})
    ON CREATE SET
        ap.current_status = 'In great pain from the Varga poison, discovers his transformation.',
        ap.emotional_state = 'Horrified and desperate.',
        ap.emotional_tags = ["Horrified", "desperate."],
        ap.active_plans = ["Cover his arm to hide the evidence of transformation."],
        ap.beliefs = ["The Varga poison is fatal.", "He is losing his humanity."],
        ap.goals = ["To hide his transformation.", "To survive the poison."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-1'})
    ON CREATE SET
        ap.current_status = 'Returns to Lowery, emphasizing the urgency of their situation.',
        ap.emotional_state = 'Urgent and focused.',
        ap.emotional_tags = ["Urgent", "focused."],
        ap.active_plans = ["Get the capsule off quickly."],
        ap.beliefs = ["A Dalek invasion is imminent.", "He must act swiftly to warn Earth."],
        ap.goals = ["To complete the message and escape Kembel."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-2'})
    ON CREATE SET
        ap.current_status = 'Asks Cory what he overheard about the Dalek invasion.',
        ap.emotional_state = 'Concerned and anxious.',
        ap.emotional_tags = ["Concerned", "anxious."],
        ap.active_plans = ["Gather crucial information regarding the situation."],
        ap.beliefs = ["The information Cory has is critical."],
        ap.goals = ["To understand the magnitude of the danger."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-2'})
    ON CREATE SET
        ap.current_status = 'Insists on the urgency of getting the capsule off.',
        ap.emotional_state = 'Determined and urgent.',
        ap.emotional_tags = ["Determined", "urgent."],
        ap.active_plans = ["Communicate the need to escape."],
        ap.beliefs = ["Time is running out for Earth."],
        ap.goals = ["To ensure his warning reaches Earth."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-3'})
    ON CREATE SET
        ap.current_status = 'Succumbs to the Varga transformation.',
        ap.emotional_state = 'Desperation and madness.',
        ap.emotional_tags = ["Desperation", "madness."],
        ap.active_plans = ["To cope with the transformation into a Varga."],
        ap.beliefs = ["He is becoming one with the Varga."],
        ap.goals = ["To take control of his actions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-3'})
    ON CREATE SET
        ap.current_status = 'Kills Lowery to protect himself.',
        ap.emotional_state = 'Regret mixed with survival instinct.',
        ap.emotional_tags = ["Regret mixed with survival instinct."],
        ap.active_plans = ["Desperately try to warn Earth."],
        ap.beliefs = ["Survival above all else."],
        ap.goals = ["To ensure the message is recorded."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-4'})
    ON CREATE SET
        ap.current_status = 'Records a warning on the rescue beacon.',
        ap.emotional_state = 'Desperate and urgent.',
        ap.emotional_tags = ["Desperate", "urgent."],
        ap.active_plans = ["Get the warning message sent before it's too late."],
        ap.beliefs = ["He must inform Earth about the Dalek invasion."],
        ap.goals = ["To warn Earth and prepare defenses."]
    ;
MERGE (ap:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-5'})
    ON CREATE SET
        ap.current_status = 'Continuing the recording as Daleks approach.',
        ap.emotional_state = 'Nervous but resolute.',
        ap.emotional_tags = ["Nervous but resolute."],
        ap.active_plans = ["Finish recording the warning."],
        ap.beliefs = ["His message is vital for Earth."],
        ap.goals = ["To ensure the message is delivered."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-great_alliance-event-14-1'})
    ON CREATE SET
        oi.description = 'The Great Alliance is the central theme of Malpa\'s declaration. It symbolizes the united front of various representatives pledging their allegiance to the Dalek cause, committing their armies to the conquest and destruction of galaxies, with Earth as the first target.',
        oi.status_before = 'The Great Alliance exists as an abstract concept, representing the gathered delegates\' intent to unite against common foes, notably the inhabitants of Earth.',
        oi.status_after = 'The Great Alliance solidifies as a tangible commitment among the gathered delegates, creating a binding agreement that enhances their resolve to partake in the Dalek cause.'
    WITH oi
    MATCH (o:Object {uuid: 'object-great_alliance'})
    MATCH (e:Event {uuid: 'event-14-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'involvement-object-great_alliance-event-14-1'})
    ON CREATE SET
        oi.description = 'The Great Alliance is the central theme of Malpa\'s declaration. It symbolizes the united front of various representatives pledging their allegiance to the Dalek cause, committing their armies to the conquest and destruction of galaxies, with Earth as the first target.',
        oi.status_before = 'The Great Alliance exists as an abstract concept, representing the gathered delegates\' intent to unite against common foes, notably the inhabitants of Earth.',
        oi.status_after = 'The Great Alliance solidifies as a tangible commitment among the gathered delegates, creating a binding agreement that enhances their resolve to partake in the Dalek cause.'
    WITH oi
    MATCH (o:Object {uuid: 'object-great_alliance'})
    MATCH (e:Event {uuid: 'event-14-1'})
    MERGE (o)-[:HAS_INVOLVEMENT]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'participation-agent-malpha-event-14-1'})
    ON CREATE SET
        ap.current_status = 'Standing at the conference table, declaring allegiance to the Dalek cause.',
        ap.emotional_state = 'Triumphant and zealous.',
        ap.emotional_tags = ["Triumphant", "zealous."],
        ap.active_plans = ["Pledge allegiance to the Dalek cause", "Prepare for the conquest of Earth"],
        ap.beliefs = ["The Daleks represent power and supremacy", "Conquest is the path to glory and recognition"],
        ap.goals = ["Achieve victory over Earth and its people", "Strengthen the position of their alliance with the Daleks"]
    ;
MATCH (a:Scene {uuid: 'scene-001'}),
          (b:Location {uuid: 'location-kembel_jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Event {uuid: 'event-1-1'}),
          (b:Scene {uuid: 'scene-001'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-jeff_garvey'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-1-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-1-1'}),
          (b:Event {uuid: 'event-1-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-002'}),
          (b:Location {uuid: 'location-kembel_jungle'})

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
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-1'}),
          (b:Event {uuid: 'event-2-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeff_garvey'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-2-2'}),
          (b:Event {uuid: 'event-2-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Location {uuid: 'location-damaged_space_ship'})

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
MATCH (a:Event {uuid: 'event-3-6'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-5'}),
          (b:Event {uuid: 'event-3-6'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-3-7'}),
          (b:Scene {uuid: 'scene-003'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-3-6'}),
          (b:Event {uuid: 'event-3-7'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-1'}),
          (b:Event {uuid: 'event-3-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-2'}),
          (b:Event {uuid: 'event-3-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-jeff_garvey'}),
          (b:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-3-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-jeff_garvey-event-3-3'}),
          (b:Event {uuid: 'event-3-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-4'}),
          (b:Event {uuid: 'event-3-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-3-5'}),
          (b:Event {uuid: 'event-3-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-6'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-6'}),
          (b:Event {uuid: 'event-3-6'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-7'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-3-7'}),
          (b:Event {uuid: 'event-3-7'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-004'}),
          (b:Location {uuid: 'location-dalek_control_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-003'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-4-1'}),
          (b:Scene {uuid: 'scene-004'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-sara_kingdom'}),
          (b:AgentParticipation {uuid: 'participation-agent-sara_kingdom-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-sara_kingdom-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-4-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-4-1'}),
          (b:Event {uuid: 'event-4-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Location {uuid: 'location-rocket_ship'})

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
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-1'}),
          (b:Event {uuid: 'event-5-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-2'}),
          (b:Event {uuid: 'event-5-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-5-3'}),
          (b:Event {uuid: 'event-5-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-006'}),
          (b:Location {uuid: 'location-jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-005'}),
          (b:Scene {uuid: 'scene-006'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-6-1'}),
          (b:Scene {uuid: 'scene-006'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Scene {uuid: 'scene-007'}),
          (b:Location {uuid: 'location-rocket_ship'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-006'}),
          (b:Scene {uuid: 'scene-007'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-7-1'}),
          (b:Scene {uuid: 'scene-007'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-7-2'}),
          (b:Scene {uuid: 'scene-007'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-7-1'}),
          (b:Event {uuid: 'event-7-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-1'}),
          (b:Event {uuid: 'event-7-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-1'}),
          (b:Event {uuid: 'event-7-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-7-2'}),
          (b:Event {uuid: 'event-7-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-7-2'}),
          (b:Event {uuid: 'event-7-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-008'}),
          (b:Location {uuid: 'location-jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-007'}),
          (b:Scene {uuid: 'scene-008'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-8-1'}),
          (b:Scene {uuid: 'scene-008'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Scene {uuid: 'scene-009'}),
          (b:Location {uuid: 'location-mira-jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-008'}),
          (b:Scene {uuid: 'scene-009'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-9-1'}),
          (b:Scene {uuid: 'scene-009'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-9-2'}),
          (b:Scene {uuid: 'scene-009'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-9-1'}),
          (b:Event {uuid: 'event-9-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-9-3'}),
          (b:Scene {uuid: 'scene-009'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-9-2'}),
          (b:Event {uuid: 'event-9-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-1'}),
          (b:Event {uuid: 'event-9-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-1'}),
          (b:Event {uuid: 'event-9-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-2'}),
          (b:Event {uuid: 'event-9-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-2'}),
          (b:Event {uuid: 'event-9-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-9-3'}),
          (b:Event {uuid: 'event-9-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-9-3'}),
          (b:Event {uuid: 'event-9-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-010'}),
          (b:Location {uuid: 'location-conference_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-009'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-10-1'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-2'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-1'}),
          (b:Event {uuid: 'event-10-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-3'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-2'}),
          (b:Event {uuid: 'event-10-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-4'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-3'}),
          (b:Event {uuid: 'event-10-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-5'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-4'}),
          (b:Event {uuid: 'event-10-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-6'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-5'}),
          (b:Event {uuid: 'event-10-6'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-7'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-6'}),
          (b:Event {uuid: 'event-10-7'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-10-8'}),
          (b:Scene {uuid: 'scene-010'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-10-7'}),
          (b:Event {uuid: 'event-10-8'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-1'}),
          (b:Event {uuid: 'event-10-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-2'}),
          (b:Event {uuid: 'event-10-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-3'}),
          (b:Event {uuid: 'event-10-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-5'}),
          (b:Event {uuid: 'event-10-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-6'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-6'}),
          (b:Event {uuid: 'event-10-6'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-10-7'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-10-7'}),
          (b:Event {uuid: 'event-10-7'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-011'}),
          (b:Location {uuid: 'location-jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-010'}),
          (b:Scene {uuid: 'scene-011'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-11-1'}),
          (b:Scene {uuid: 'scene-011'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-11-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-11-1'}),
          (b:Event {uuid: 'event-11-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-11-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-11-1'}),
          (b:Event {uuid: 'event-11-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-012'}),
          (b:Location {uuid: 'location-conference_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-011'}),
          (b:Scene {uuid: 'scene-012'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-12-1'}),
          (b:Scene {uuid: 'scene-012'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-12-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-12-1'}),
          (b:Event {uuid: 'event-12-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-mavic_chen'}),
          (b:AgentParticipation {uuid: 'participation-agent-mavic_chen-event-12-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-mavic_chen-event-12-1'}),
          (b:Event {uuid: 'event-12-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-013'}),
          (b:Location {uuid: 'location-kembel_jungle'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-012'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-13-1'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-13-2'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-13-1'}),
          (b:Event {uuid: 'event-13-2'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-13-3'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-13-2'}),
          (b:Event {uuid: 'event-13-3'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-13-4'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-13-3'}),
          (b:Event {uuid: 'event-13-4'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event-13-5'}),
          (b:Scene {uuid: 'scene-013'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event-13-4'}),
          (b:Event {uuid: 'event-13-5'})

    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-1'}),
          (b:Event {uuid: 'event-13-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-1'}),
          (b:Event {uuid: 'event-13-1'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-2'}),
          (b:Event {uuid: 'event-13-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-2'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-2'}),
          (b:Event {uuid: 'event-13-2'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-gordon_lowery'}),
          (b:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-gordon_lowery-event-13-3'}),
          (b:Event {uuid: 'event-13-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-3'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-3'}),
          (b:Event {uuid: 'event-13-3'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-4'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-4'}),
          (b:Event {uuid: 'event-13-4'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent-marc_cory'}),
          (b:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-5'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-marc_cory-event-13-5'}),
          (b:Event {uuid: 'event-13-5'})

    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Scene {uuid: 'scene-014'}),
          (b:Location {uuid: 'location-conference_room'})

    MERGE (a)-[:LOCATED_IN]->(b);
MATCH (a:Scene {uuid: 'scene-013'}),
          (b:Scene {uuid: 'scene-014'})

    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event-14-1'}),
          (b:Scene {uuid: 'scene-014'})

    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent-malpha'}),
          (b:AgentParticipation {uuid: 'participation-agent-malpha-event-14-1'})

    MERGE (a)-[:HAS_PARTICIPATION]->(b);
MATCH (a:AgentParticipation {uuid: 'participation-agent-malpha-event-14-1'}),
          (b:Event {uuid: 'event-14-1'})

    MERGE (a)-[:IN_EVENT]->(b);
