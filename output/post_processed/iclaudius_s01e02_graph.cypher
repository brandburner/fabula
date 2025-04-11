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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e02_graph.json',
        creation_timestamp: '2025-04-11T16:16:14.177163',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_drusus'})
    ON CREATE SET
        a.name = 'Drusus Nero',
        a.title = 'None',
        a.description = 'Even in his dying moments, Drusus Nero remains a figure of concern for his family and the fate of Rome. Ravaged by gangrene, his weak whispered words reveal lingering anxieties about the dangerous political machinations of the imperial family, including intercepted letters and fears over Livia\'s ruthless influence. His prophetic utterances—mentioning \'Rome\'s severe mother\' and a \'cruel stepmother\' for his sons—underscore his tragic premonitions and the grim path of the dynasty.',
        a.traits = ["dying", "fearsome", "suspicious", "prophetic"],
        a.sphere_of_influence = 'military_command'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius',
        a.title = 'Imperial Heir',
        a.description = 'A warrior scarred by battle and burdened by duty, Tiberius is Rome\'s reluctant heir. Forged in war yet trapped by imperial expectations and a loveless political marriage, he wrestles with familial obligation behind a stoic façade, steeped in bitterness and melancholy.',
        a.traits = ["Warrior", "Stoic", "Bitter", "Melancholic"],
        a.sphere_of_influence = 'Military and Political Strategy'
    ;
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'Caesar',
        a.description = 'Claudius is an elderly man in his sixties, physically frail yet possessing a sharp, astute mind. Deeply suspicious and paranoid about plots involving his wife and her son, he channelizes his anxieties into writing a detailed history of his family, blending dry wit with insightful observations despite his stutter.',
        a.traits = ["paranoid", "intellectual", "frail", "historian", "suspicious", "sharp-minded"],
        a.sphere_of_influence = 'History, Imperial Family Intrigue'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'Empress of Rome',
        a.description = 'Livia Drusilla, known as the Empress of shadows, manipulates the intrigues of the imperial court with chilling efficiency. Concealing a heart hardened by ambition, she skillfully maneuvers events to secure her son\'s reign, using her charm as a mask for her ruthless, calculating intellect.',
        a.traits = ["Manipulative", "Cunning", "Ambitious", "Charming"],
        a.sphere_of_influence = 'Political Intrigue'
    ;
MERGE (a:Agent {uuid: 'agent_julia'})
    ON CREATE SET
        a.name = 'Julia',
        a.title = 'Daughter of Emperor Augustus',
        a.description = 'Julia, daughter of Emperor Augustus and wife of Tiberius, is a spirited woman with sharp intellect. Trapped in a loveless political marriage and stifled by rigid imperial life, she expresses her discontent with biting wit while harboring a deep yearning for genuine affection and autonomy.',
        a.traits = ["Spiritful", "Witty", "Yearning for love", "Politically aware"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia',
        a.title = 'None',
        a.description = 'Antonia is a figure of quiet strength and maternal compassion amid the turbulent Roman court. Known for her wisdom and intuitive nature, she stands by her dying husband Drusus, fulfilling his final wishes with deep devotion even as grief overwhelms her.',
        a.traits = ["Compassionate", "Wise", "Intuitive", "Strong"],
        a.sphere_of_influence = 'Maternal Guidance'
    ;
MERGE (a:Agent {uuid: 'agent_slave_1'})
    ON CREATE SET
        a.name = 'Slave 1',
        a.title = 'None',
        a.description = 'A servant attending to Julia and Antonia in the Roman bathhouse, this slave epitomizes the subservient role within Roman society. Tasked with personal care, the individual is portrayed as attentive yet timid, reflecting the dehumanizing aspects of slavery as they are quickly dismissed to allow private conversation.',
        a.traits = ["Subservient", "Attentive", "Timid", "Daydreaming", "Service-oriented"],
        a.sphere_of_influence = 'Domestic Service'
    ;
MERGE (a:Agent {uuid: 'agent_vipsania'})
    ON CREATE SET
        a.name = 'Vipsania Agrippina',
        a.title = 'None',
        a.description = 'Vipsania Agrippina is the ghost of Tiberius’s past—a woman whose quiet strength and enduring sadness highlight the personal sacrifices demanded by Roman ambition. Marked by sadness yet dignified, she embodies resolute pragmatism and kindness, serving as a poignant reminder of lost love and the life that might have been.',
        a.traits = ["Strong", "Resolute", "Sad", "Pragmatic", "Wary", "Kind"],
        a.sphere_of_influence = 'Personal Relationships, Social Navigation'
    ;
MERGE (a:Agent {uuid: 'agent_augustus'})
    ON CREATE SET
        a.name = 'Augustus Caesar',
        a.title = 'Emperor of Rome',
        a.description = 'Augustus Caesar, the aging lion of Rome, is a master strategist burdened by the weight of empire. His calculated demeanor conceals deep emotional scars and the challenges of succession, as he struggles to maintain control over an empire rife with ambition and betrayal.',
        a.traits = ["Strategic", "Weary", "Authoritative", "Determined"],
        a.sphere_of_influence = 'Political Governance'
    ;
MERGE (a:Agent {uuid: 'agent_gaius'})
    ON CREATE SET
        a.name = 'Gaius Caesar',
        a.title = 'Grandson of Augustus',
        a.description = 'Gaius Caesar, one of Julia’s young sons and Augustus\'s grandson, is depicted as competitive and strategic despite his youth. Engaged in a board game that simulates military maneuvers, he eagerly absorbs lessons in strategy, signaling his potential future role in political or military leadership.',
        a.traits = ["Eager", "Strategic", "Impressionable", "Playful"],
        a.sphere_of_influence = 'Future Political Leadership'
    ;
MERGE (a:Agent {uuid: 'agent_lucius'})
    ON CREATE SET
        a.name = 'Lucius Caesar',
        a.title = 'Grandson of Augustus',
        a.description = 'Lucius Caesar, the younger son of Julia and another grandson of Augustus, is characterized by his enthusiasm and impulsiveness. While not as strategically minded as his brother Gaius, his exuberance and eagerness to please highlight a tender, youthful approach to the responsibilities being groomed within the imperial family.',
        a.traits = ["Enthusiastic", "Impulsive", "Eager to please", "Playful"],
        a.sphere_of_influence = 'Future Political Leadership'
    ;
MERGE (a:Agent {uuid: 'agent_slave_2'})
    ON CREATE SET
        a.name = 'Slave 2',
        a.title = 'None',
        a.description = 'A nameless slave in Augustus\'s Palace who acts as a messenger, interrupting a game to announce Drusus\'s impending departure. Portrayed as subservient and efficient, this individual swiftly delivers messages as a reflection of the strict social hierarchy awaiting the imperial family.',
        a.traits = ["Subservient", "Efficient", "Brief", "Respectful"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_senator'})
    ON CREATE SET
        a.name = 'Senator',
        a.title = 'Roman Senator',
        a.description = 'A Roman Senator deeply embedded in the intricate political landscape of the Senate. Cautious and observant, he navigates tense interactions, particularly with Livia, and reflects the delicate balance of power, especially in light of Augustus\'s policies regarding deification.',
        a.traits = ["Cautious", "Political", "Observant", "Diplomatic"],
        a.sphere_of_influence = 'Senatorial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_rufus'})
    ON CREATE SET
        a.name = 'Rufus',
        a.title = 'Centurion',
        a.description = 'Rufus is a stern, pragmatic centurion stationed on the Rhine frontier. Tasked with delivering grim news regarding Drusus’s deteriorating condition and handling military protocols with detached efficiency, he embodies the harsh discipline and practicality of Roman military life.',
        a.traits = ["duty-bound", "pragmatic", "stern", "efficient"],
        a.sphere_of_influence = 'military_command'
    ;
MERGE (a:Agent {uuid: 'agent_guardsman_1'})
    ON CREATE SET
        a.name = 'Guardsman 1',
        a.title = 'None',
        a.description = 'Guardsman 1 is a Roman soldier stationed at the Rhine frontier military encampment. Under the command of Centurion Rufus, he assists in the care of the injured Drusus, embodying obedience and attentiveness while carefully following orders.',
        a.traits = ["Obedient", "Subservient", "Questioning", "Attentive", "Careful"],
        a.sphere_of_influence = 'Military Guard Duty'
    ;
MERGE (a:Agent {uuid: 'agent_guardsman_2'})
    ON CREATE SET
        a.name = 'Guardsman 2',
        a.title = 'None',
        a.description = 'Guardsman 2 is another Roman soldier at the Rhine frontier, serving alongside Guardsman 1 under Centurion Rufus’s command. Known for his careful and disciplined manner, he performs his duties with obedience while remaining apprehensive of harsh military reprimands.',
        a.traits = ["Obedient", "Subservient", "Careful", "Apprehensive", "Disciplined"],
        a.sphere_of_influence = 'Military Guard Duty'
    ;
MERGE (a:Agent {uuid: 'agent_musa'})
    ON CREATE SET
        a.name = 'Musa',
        a.title = 'Physician',
        a.description = 'Musa, Livia\'s personal physician, arrives at the military encampment shrouded in suspicion. His explanation of Drusus’s condition is evasive and rehearsed, and his presence is met with violent dismissal by Tiberius, marking him as untrustworthy and possibly involved in Livia\'s machinations.',
        a.traits = ["evasive", "suspicious", "insincere", "untrustworthy"],
        a.sphere_of_influence = 'medicine'
    ;
MERGE (a:Agent {uuid: 'agent_servant_14'})
    ON CREATE SET
        a.name = 'Servant',
        a.title = 'None',
        a.description = 'A middle-aged imperial servant attending to Claudius in his private dining room. Obsequious and polite, he is knowledgeable about food and wine yet subtly dismissive of Claudius\'s paranoid fears, suggesting long service and an ingrained familiarity with the eccentricities of the imperial household.',
        a.traits = ["obsequious", "knowledgeable_about_food_and_wine", "skeptical", "cautious", "routine-oriented"],
        a.sphere_of_influence = 'Domestic Service'
    ;
MERGE (o:Object {uuid: 'object_exercise_ball'})
    ON CREATE SET
        o.name = 'Exercise Ball',
        o.description = 'A cloth-covered ball used during the exercise session between Drusus and Tiberius, symbolizing the physical competition and familial rivalry between the brothers. It functions as a key prop in their playful banter, representing both levity and tension in their relationship.',
        o.purpose = 'To facilitate physical exercise and promote competition between the brothers.',
        o.significance = 'Serves as a vehicle for the brothers\' interaction, highlighting themes of rivalry, familial bonds, and their contrasting lifestyles.'
    ;
MERGE (o:Object {uuid: 'object_board_game'})
    ON CREATE SET
        o.name = 'Board Game',
        o.description = 'A board game depicting a map of territories, likely representing the Roman Empire and surrounding lands. It includes pieces described as \'legions\' and involves strategic actions like controlling ports and corn supplies. The game is used as both entertainment and an instructive tool by Augustus to teach his grandsons about strategy and governance.',
        o.purpose = 'To teach strategy and governance to Augustus\'s grandsons.',
        o.significance = 'Represents the complexities of empire building and the responsibilities of governance.'
    ;
MERGE (o:Object {uuid: 'object_dice'})
    ON CREATE SET
        o.name = 'Dice',
        o.description = 'A pair of dice used in the board game played by Augustus and his grandsons. They are noted for rolling \'sixes\' repeatedly, adding a crucial element of chance to the game, and symbolizing the unpredictable nature of events.',
        o.purpose = 'To facilitate gameplay and introduce randomness into the board game.',
        o.significance = 'Symbolizes chance and the unpredictable nature of events within strategic planning and empire building.'
    ;
MERGE (o:Object {uuid: 'object_legions_game_pieces'})
    ON CREATE SET
        o.name = 'Legions (Game Pieces)',
        o.description = 'Small game pieces representing Roman legions used in the board game to control territories. They are a miniature representation of the vast military apparatus of Rome and are moved according to gameplay mechanics like dice rolls.',
        o.purpose = 'To represent military forces in the board game.',
        o.significance = 'Embodies the military power and strategic aspects of Roman governance, symbolizing the operational force behind empire expansion.'
    ;
MERGE (o:Object {uuid: 'object_makeshift_bed'})
    ON CREATE SET
        o.name = 'Makeshift Bed',
        o.description = 'A rudimentary bed within a military encampment, assembled quickly from basic materials such as rough-hewn wood combined with blankets or animal hides. It is used to provide essential rest for the injured Drusus.',
        o.purpose = 'To provide a resting place for the injured Drusus.',
        o.significance = 'Highlights the harsh and makeshift conditions of the military encampment and underscores Drusus\'s vulnerability.'
    ;
MERGE (o:Object {uuid: 'object_water_basin'})
    ON CREATE SET
        o.name = 'Water Basin',
        o.description = 'A simple basin, possibly made from metal or earthenware, used to hold water for hygiene and wound care at a military camp.',
        o.purpose = 'To clean Drusus\'s wound.',
        o.significance = 'Represents the basic medical care available at the encampment and the practical response to injury under limited resources.'
    ;
MERGE (o:Object {uuid: 'object_letter_from_caesar'})
    ON CREATE SET
        o.name = 'Letter from Caesar',
        o.description = 'A sealed letter from Emperor Augustus Caesar, delivered by Musa to Drusus at the Rhine frontier. Although its contents remain unknown, it signifies important imperial communication reaching the frontlines.',
        o.purpose = 'To convey a message from Caesar to Drusus.',
        o.significance = 'Represents imperial authority and communication, potentially serving as a catalyst for subsequent events in the narrative.'
    ;
MERGE (o:Object {uuid: 'object_candlelight'})
    ON CREATE SET
        o.name = 'Candlelight',
        o.description = 'Refers to the primary light source in the private dining room, characterized by its flickering, dim illumination which creates an intimate and secretive atmosphere.',
        o.purpose = 'Illumination and setting an atmospheric mood.',
        o.significance = 'Enhances the mood, reflects a sense of intimacy, secrecy, and unease, and mirrors Claudius\'s state of mind.'
    ;
MERGE (o:Object {uuid: 'object_food_in_dishes'})
    ON CREATE SET
        o.name = 'Food in Dishes',
        o.description = 'A collection of various dishes laid out on Claudius\'s dining table for his meal. The food includes specific details such as the presence of garlic, and becomes a focal point of paranoia regarding potential poisoning.',
        o.purpose = 'Nourishment and as a potential vehicle for poison.',
        o.significance = 'Central to Claudius\'s fears of being poisoned and integral to the ritual of food tasting by the servant.'
    ;
MERGE (o:Object {uuid: 'object_wine_in_goblet'})
    ON CREATE SET
        o.name = 'Wine in Goblet',
        o.description = 'Roman wine, characterized by its northern origin, about 5 years old and noted for having less sugar due to a bad summer, poured into Claudius\'s goblet and subsequently tasted by the servant.',
        o.purpose = 'To serve as a drink and a potential vehicle for poison.',
        o.significance = 'Reinforces the general theme of paranoia regarding poisoning and reflects aspects of Roman domestic culture regarding wine.'
    ;
MERGE (o:Object {uuid: 'object_history_of_family_scroll'})
    ON CREATE SET
        o.name = 'History of Family',
        o.description = 'A written history of Claudius\'s own family, likely in scroll form, which he is currently composing. The work is indicative of his preoccupation with his familial past and the impact of events such as his father\'s death.',
        o.purpose = 'Historical writing and a personal project.',
        o.significance = 'Reveals Claudius\'s focus on family history and his introspective nature, contrasting with the political and military themes elsewhere.'
    ;
MERGE (o:Object {uuid: 'object_history_of_etruscans_book'})
    ON CREATE SET
        o.name = 'History of the Etruscans',
        o.description = 'A historically written work, either in book or scroll form, detailing the history of the Etruscans. It is noted by a servant who borrowed it from the library, and is recognized for its well-crafted narrative despite its challenging nature.',
        o.purpose = 'Historical writing as a previous work by Claudius.',
        o.significance = 'Establishes Claudius as a historian and intellectual, contrasting with his ongoing work on family history.'
    ;
MERGE (o:Object {uuid: 'object_garlic'})
    ON CREATE SET
        o.name = 'Garlic',
        o.description = 'A common food ingredient mentioned as a component in the dishes. Its presence is noted during the discussion about the food, with the servant remarking on its taste.',
        o.purpose = 'Food ingredient, contributing to the flavor of the meal.',
        o.significance = 'Serves as a minor yet memorable detail in the dialogue about food and taste, reinforcing the everyday aspects of Roman cuisine.'
    ;
MERGE (o:Object {uuid: 'object_morsel_of_food'})
    ON CREATE SET
        o.name = 'Morsel of Food',
        o.description = 'A small piece of food sampled by the servant from one of the dishes. It is used as part of the food tasting ritual aimed at ensuring the food is safe from poison.',
        o.purpose = 'To act as a food sample for tasting.',
        o.significance = 'Highlights the ritual of food tasting and underscores the pervasive paranoia regarding poisoning.'
    ;
MERGE (l:Location {uuid: 'location_claudian_villa_courtyard'})
    ON CREATE SET
        l.name = 'Claudian Villa - Courtyard',
        l.description = 'The courtyard of the Claudian Villa is a sunlit expanse, surrounded by statues of Roman heroes. The sunlight filters through, illuminating robust figures engaged in spirited exercise, emblematic of both rivalry and familial camaraderie amid imperial grandeur.',
        l.type = 'Courtyard'
    ;
MERGE (l:Location {uuid: 'location_roman_bathhouse_spa'})
    ON CREATE SET
        l.name = 'Roman Bathhouse/Spa',
        l.description = 'An opulent Roman bathhouse filled with steam that creates a hazy and sensual atmosphere. Furnished with marble benches and attended by slaves offering personal care, the space is imbued with the rich scents of perfumes and the murmur of private conversations, reflecting both luxury and clandestine exchanges.',
        l.type = 'Bathhouse'
    ;
MERGE (l:Location {uuid: 'location_augustus_palace_lavishly_decorated_room'})
    ON CREATE SET
        l.name = 'Augustus\'s Palace - Lavishly Decorated Room',
        l.description = 'A lavishly decorated room within Augustus\'s Palace that exudes subtle imperial power. Rich fabrics, ornate furnishings, and sunlight filtering through large windows illuminate a board game scene charged with serious political undertones, blending leisure with the implications of Roman governance.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_vipsanias_house'})
    ON CREATE SET
        l.name = 'Vipsania\'s House',
        l.description = 'A dimly lit, modest Roman dwelling suggesting quiet intimacy under constrained circumstances. The shuttered window reinforces privacy and concealment, highlighting the clandestine nature of Tiberius\'s visit and contrasting sharply with the opulence of the imperial court.',
        l.type = 'Dwelling'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    ON CREATE SET
        l.name = 'Imperial Palace - Reception Hall',
        l.description = 'A grand reception hall within the Imperial Palace featuring gleaming marble floors and high windows. Statues of stern-faced Roman figures add a weighty historic presence, creating an atmosphere that is both formal and tense, perfect for political maneuvering.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_hallway'})
    ON CREATE SET
        l.name = 'Imperial Palace Hallway',
        l.description = 'A long, imposing corridor within the Imperial Palace designed to impress with its scale and grandeur. With high ceilings, polished marble floors, and adornments portraying Roman triumphs, the hallway resonates with echoes of power plays and dramatic familial confrontations.',
        l.type = 'Hallway'
    ;
MERGE (l:Location {uuid: 'location_military_encampment'})
    ON CREATE SET
        l.name = 'Military Encampment',
        l.description = 'A sprawling military encampment across the rugged Rhine frontier, characterized by tents, makeshift fortifications, and the grim realities of war. Harsh odors, flickering campfires, and a sense of impending loss pervade the scene, capturing the brutality of battle.',
        l.type = 'Encampment'
    ;
MERGE (l:Location {uuid: 'location_room_in_military_encampment'})
    ON CREATE SET
        l.name = 'Room in Military Encampment',
        l.description = 'A hastily prepared room within the military encampment designated for a newly arrived physician from Rome. Basic and functional, the room offers minimal comfort and privacy, standing in stark contrast to the luxury expected by the physician.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_claudius_study'})
    ON CREATE SET
        l.name = 'Claudius\'s Study',
        l.description = 'A private, intimate study filled with scrolls and texts that reflect the legacy and unresolved conflicts of the Claudian lineage. Light filtering through a window casts a somber mood over the sanctuary where personal grief and historical burdens coexist.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_claudius_private_dining_room'})
    ON CREATE SET
        l.name = 'Private Dining Room',
        l.description = 'A cramped and cluttered dining room illuminated by candlelight, creating an atmosphere of intimacy tinged with paranoia. Modestly furnished with a table laden with food, the room serves as a private space for quiet contemplation and reflects Claudius\'s isolation.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_palace_garden'})
    ON CREATE SET
        l.name = 'Palace Garden',
        l.description = 'A manicured garden within the palace that is both serene and haunting. Under the moonlight, night-blooming jasmine scents mingle with long shadows, setting a tranquil backdrop that contrasts with the internal turmoil of its visitors.',
        l.type = 'Garden'
    ;
MERGE (l:Location {uuid: 'location_palace_corridor'})
    ON CREATE SET
        l.name = 'Palace Corridor',
        l.description = 'A dimly lit corridor within the Imperial Palace at night, characterized by deep shadows and an atmosphere of secrecy. Serving as a passageway for private confrontations, it echoes the hidden agendas and unspoken resentments within the imperial family.',
        l.type = 'Hallway'
    ;
MERGE (l:Location {uuid: 'location_julias_chambers'})
    ON CREATE SET
        l.name = 'Julia\'s Chambers',
        l.description = 'A lavish yet stifling room in Augustus\'s palace, adorned with rich fabrics and elaborate decor. Julia\'s Chambers reflect both opulence and confinement, serving as a battleground for emotions where love, betrayal, and ambition intertwine.',
        l.type = 'Chamber'
    ;
MERGE (o:Organization {uuid: 'org_roman_legion'})
    ON CREATE SET
        o.name = 'Roman Legion',
        o.description = 'The Roman Legion is the backbone of military might, comprising professional soldiers trained for combat and tasked with expanding and protecting the Roman Empire. The Legion emphasizes discipline, loyalty, and martial prowess, preparing its members for the harsh realities of war. In the scene, the legion is depicted by soldiers and a Centurion at the Rhine frontier encampment, underscoring its role in maintaining Roman territory.',
        o.sphere_of_influence = 'military'
    ;
MERGE (o:Organization {uuid: 'org_imperial_family'})
    ON CREATE SET
        o.name = 'Imperial Family',
        o.description = 'The Imperial Family of Rome represents the ruling dynasty, steeped in history and political intrigue. Comprising the Emperor, his heirs, and extended relatives, this organization is deeply engaged in power struggles and ambitions, navigating the treacherous realm of Roman politics.',
        o.sphere_of_influence = 'Political Authority and Governance'
    ;
MERGE (ep:Episode {uuid: 'episode_family_affairs'})
    ON CREATE SET
        ep.title = 'Family Affairs',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Brothers\' Tussle in the Sun',
        s.description = 'Bathed in the bright Mediterranean sun, the courtyard of the Claudian Villa becomes an arena for brotherly rivalry. Marble statues of stoic Roman heroes stand as silent witnesses to the physical exertion of Drusus and Tiberius, their forms casting long shadows across the paved stones. The air is filled with the sounds of exertion and playful taunts as they grapple and spar. Despite the lighthearted banter, an undercurrent of tension runs between them, hinting at deeper resentments and diverging paths. Tiberius, softened by courtly life, reveals a yearning for his past military glories, contrasting sharply with Drusus\'s active military life and robust physicality. This scene serves to establish the complex dynamic between the brothers – affection tinged with rivalry, and a shared history overshadowed by their differing present circumstances and the weight of imperial expectations. The courtyard, typically a place of serene domesticity, transforms into a space where masculine pride and unspoken anxieties are brought to the surface under the relentless gaze of the Roman sun.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudian_villa_courtyard'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Brothers Spar in the Courtyard',
        e.description = 'Drusus and Tiberius engage in a physical exercise session that quickly escalates into a wrestling match. Drusus, clearly in better physical condition, dominates Tiberius, playfully mocking his brother\'s softness and suggesting he\'s unfit for military life. This physical interaction underscores the contrast between the brothers: Drusus, the active soldier, and Tiberius, the courtier, while also revealing a familiar sibling dynamic of playful aggression and competition.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["DRUSUS: You're getting soft. You wouldn't last a five-hour march if you were in the army now. Now, throw it! Oh, come on! Throw it! Antonia throws harder than that.", "TIBERIUS: Shut up! Throw the ball.", "DRUSUS: Of course, if you lost some of that stomach of yours...", "TIBERIUS: Now we'll see who's hard.", "DRUSUS: HaHaHa... Death or surrender?", "TIBERIUS: Oh, get off.", "DRUSUS: Ha! I never thought I'd see my brother in such a pitiful condition."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Military Nostalgia and Marital Complaint',
        e.description = 'Continuing their banter after wrestling, Drusus\'s teasing prompts Tiberius to express a deep longing for his past life in the army. He reminisces about the hardships and camaraderie of military campaigns, contrasting it with his current, less fulfilling duties in Rome. His tone shifts from playful to melancholic as he reveals his frustration with being confined to civilian tasks by Augustus and his unhappiness with his forced marriage to Julia, painting a picture of a man trapped and yearning for a different life.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: You spend ten years in Rome and see how you feel.", "DRUSUS: Hey... What's this, huh? Sulks?", "TIBERIUS: You're lucky. You're going back to the army tomorrow. That's the only decent life for a Roman. Marching, fighting, building forts. Those were the best years of my life.", "DRUSUS: You made the army's life bloody hell.", "TIBERIUS: Oh, I marched them hard and I drilled them hard, but I was fair. I'll bet they say I was fair.", "DRUSUS: Do you know what they really say about you?", "TIBERIUS: What?", "DRUSUS: They say that your drills were bloodless battles... and your battles were bloody drills.", "TIBERIUS: Is that what they say? Really?", "DRUSUS: Yes.", "TIBERIUS: HaHa. You know, Drusus, that army I took across the Alps, they were men. You never had men like that.", "DRUSUS: Hey, we've won some victories ourselves, you know, you didn't win them all.", "TIBERIUS: I know, I know. But those two legions...", "DRUSUS: The twelfth and the sixteenth, I know.", "TIBERIUS: You'll never see their like again. Nothing bothered them - the heat, the cold... the marching. Ah, I cursed them and I flogged them, but I cursed and flogged their officers too. And if there weren't any tents for the men, I slept out in the open with them.", "DRUSUS: Well, you'll have to take the field again.", "TIBERIUS: He won't let me.", "DRUSUS: Who, Augustus?", "TIBERIUS: He keeps me here as his work donkey. Says he can't spare me. I'm his chief errand boy. I spend my time investigating the level of unemployment... Or reorganizing the city fire brigade. Added to that, there's that bitch Julia they made me marry."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Beneath the Surface: Bathhouse Revelations',
        s.description = 'In the opulent Roman bathhouse, steam envelops the marble benches where ANTONIA and JULIA recline, attended by slaves. The air is thick with the scents of perfume and the murmurs of gossip. Julia, grappling with the coldness of her husband Tiberius, voices her frustration to Antonia, who provides insights into Tiberius\'s character shaped by Drusus\'s childhood memories. As the conversation unfolds, Julia\'s sharp wit and frustrations emerge, revealing her feelings about her loveless marriage, Tiberius\'s past with Vipsania, and the manipulations of Livia. The intimate setting amplifies their camaraderie and the undercurrents of political intrigue woven into their lives. Through playful banter, they illuminate Julia\'s plight and the suffocating expectations of imperial duty, while hinting at darker suspicions regarding Livia\'s influence. The scene encapsulates the tension between personal and political lives, underscoring the complexities of love, ambition, and betrayal that define Roman society.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_bathhouse_spa'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Julia\'s Frustration with Tiberius',
        e.description = 'Julia expresses her frustration about Tiberius\'s inability to connect with her emotionally. She laments that he sometimes doesn\'t speak to her for days, revealing the rift in their marriage. Antonia reflects on Drusus\'s memories of Tiberius, providing context about his brooding nature as a child, and how Drusus could make him laugh, hinting at Tiberius\'s complex character.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Oh, he's just impossible. You know, he sometimes he doesn't speak to me for days.", "Well, he was always very broody, according to Drusus, even as a child."]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Antonia\'s Observations on Tiberius',
        e.description = 'Antonia shares her thoughts on Tiberius\'s relationship with Vipsania, revealing the core issue of his reluctance to divorce her. Julia mocks Vipsania\'s appearance, reflecting her own insecurities and resentment toward her husband. Antonia and Julia\'s banter underscores the tension in Julia\'s heart and hints at the underlying rivalry between Tiberius\'s past and present relationships.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Well, he was always very broody, according to Drusus, even as a child.", "I hope she has better luck than me."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Julia\'s Cynicism About Tiberius\'s Marriage',
        e.description = 'Julia continues to express her disdain for Tiberius\'s past marriage to Vipsania, questioning what he sees in her. Their conversation reveals Julia\'s insecurities as she contrasts her marriage against her memory of Tiberius\'s former love, highlighting the emotional distance that plagues her current life. This moment serves to deepen the audience\'s understanding of Julia\'s struggles within the dynastic game of Roman politics.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["That wispy stalk of a thing? I don't know what he saw in her. There's nothing of her.", "Well, I must say that I could never see the attraction and after ten years of marriage, I'd have thought he'd be quite glad to see the back of her."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Julia\'s Dark Suspicions',
        e.description = 'As Antonia expresses disbelief at Julia’s harsh remarks, Julia hints at her darker suspicions about Livia\'s involvement in her past tragedies, particularly the death of Marcellus. The conversation shifts from playful banter to a serious tone, revealing how deeply entrenched Livia\'s ambitions are in personal pain, suggesting a chilling connection between familial relationships and political machinations.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["To tell you the truth, it's often crossed my mind that Livia might have had a hand in that.", "Ah, Antonia, you're so innocent!"]
    ;
MERGE (e:Event {uuid: 'event_2_5'})
    ON CREATE SET
        e.title = 'Julia\'s Role Reversal with Antonia',
        e.description = 'Julia playfully contrasts her relationship with Antonia’s husband, Drusus, flipping the tone of the conversation back to a light note. This interaction emphasizes Julia\'s complex relationships, her longing for deeper connections, and the nature of her friendships within the oppressive atmosphere of Roman expectations. It also serves as a moment of levity before the heavier themes of manipulation and betrayal reassert themselves.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["He's very attractive, your husband... Why is it that when I come in here with you, I always cover myself up?", "Well, you should. I don't approve of all this nakedness."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'Brotherly Confessions in the Steam',
        s.description = 'Within the opulent yet intimate setting of a Roman bathhouse, thick with fragrant steam and the gentle sounds of trickling water, Tiberius, weary and burdened by the weight of imperial expectation, is being attended to by his brother, Drusus. The scene unfolds amidst marble benches and soft lamplight, creating a hushed, almost confessional atmosphere. The air is heavy with unspoken anxieties as the brothers engage in a candid exchange, their words echoing in the humid air, revealing the deep chasm of darkness within Tiberius\'s soul. Drusus, ever the grounded and affectionate brother, attempts to lighten Tiberius\'s gloom, yet beneath their brotherly banter lies a palpable sense of foreboding and the heavy weight of their family\'s intertwined destinies. This intimate moment in the bathhouse serves as a stark contrast to the political machinations outside, underscoring the personal cost of power and the fragile bonds of family within the treacherous imperial court. The scene is imbued with a melancholic undercurrent, foreshadowing the impending tragedies and the vulnerability of even the strongest bonds amidst the ruthless game of Roman succession.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_bathhouse_spa'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Brotherly Scrubbing and Weary Words',
        e.description = 'In the steam-filled bathhouse, Drusus vigorously scrubs Tiberius\'s back, initiating a casual yet weighty conversation. Tiberius, already steeped in gloom, winces at the intensity of the scrubbing, his weariness extending beyond the physical. He deflects Drusus\'s good-natured teasing about his gloom, hinting at a deeper malaise that physical cleansing cannot reach. The exchange establishes the brothers\' contrasting personalities: Drusus, practical and grounded, and Tiberius, introspective and burdened. Their dialogue, laced with familial affection and subtle tension, sets the stage for the more profound confessions to come.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["TIBERIUS: Not so hard.", "DRUSUS: The dirt's ingrained in the skin.", "TIBERIUS: It goes deeper than that.", "DRUSUS: Woh, your gloom is magnificent.", "TIBERIUS: Not so hard all the same or I'll get my men to do it. I can't think why you won't let them do it anyway.", "DRUSUS: A man should keep himself clean, not have slaves do it."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Confession of Self-Loathing and Inner Darkness',
        e.description = 'Tiberius abruptly shifts the tone, confessing a profound self-loathing and a pervasive inner darkness that sets him apart from others, even Drusus. He reveals the depth of his despair, hinting at suicidal thoughts and a deep-seated negativity that consumes him. Drusus, initially dismissive, recognizes the genuine pain in Tiberius\'s words and attempts to counter his brother\'s bleak outlook with lightheartedness, but Tiberius insists on the unique nature of his inner torment. This moment lays bare Tiberius\'s psychological burden and his sense of isolation, highlighting the stark contrast between his outward stoicism and inner turmoil.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: I've tried it. It's better to have a slave scrape your back... You know, I shall miss you. You don't have any dark thoughts.", "DRUSUS: Oh, nonsense. We all have them.", "TIBERIUS: Not like me. Not like me.", "DRUSUS: Oh come on, you're no worse than the rest of us.", "TIBERIUS: I'll tell you something, Drusus. Sometimes I so hate myself, I can't bear the thought of me anymore. You don't know anything about darkness, do you? Inside darkness. Blackness.", "DRUSUS: Ah, stop bragging! I could match you black for black.", "TIBERIUS: Not you. Not you."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'The Claudian Tree and a Venomous Mother',
        e.description = 'Tiberius uses the metaphor of the Claudian family tree bearing sweet and sour apples to distinguish himself and Drusus, casting himself in the \'sour\' role and Drusus as \'sweet\'. He then darkly jokes about their mother Livia, comparing her to a deadly snake, a comment that Drusus initially dismisses but then recognizes the underlying sinister implication. This exchange hints at the brothers\' awareness of their family\'s complex and potentially dangerous dynamics, particularly regarding their mother\'s nature, foreshadowing Livia\'s manipulative and ruthless actions.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: They say the tree of the Claudians produces two kinds of apples - the sweet and the sour. That was never more true than you and me.", "DRUSUS: And what of our mother, which is she?", "TIBERIUS: Livia?", "DRUSUS: Mmm.", "TIBERIUS: They say a snake bit her once and died.", "DRUSUS: Hey. Hey, that's no longer funny."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Remembering Lost Loves: Father and Vipsania',
        e.description = 'Tiberius reveals he has deeply cared for only three people: their father and Vipsania, his former wife. He speaks of their father with reverence, acknowledging his nobility. He then transitions to Vipsania, expressing regret over their divorce, a decision forced upon him by Livia, Julia, and Augustus. Drusus acknowledges Tiberius\'s happiness with Vipsania and subtly questions why Tiberius didn\'t resist the political pressure to divorce her. This moment underscores the emotional sacrifices Tiberius has made for political expediency and highlights the enduring pain of losing Vipsania.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["TIBERIUS: I've only cared for three people in my life. One was our father.", "DRUSUS: Yes, he was the noblest of us all.", "TIBERIUS: Yes. The other was Vipsania.", "DRUSUS: I was sorry about that. Why? Why did you divorce her?", "TIBERIUS: Livia insisted on it. Julia wanted it. Augustus insisted on it.", "DRUSUS: Yes, all the same, you were so happy, you might have refused."]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'Doubts About the Monarchy and Personal Sacrifice',
        e.description = 'Tiberius questions the longevity of the monarchy after Augustus, expressing a sense of futility about his own political actions. Drusus, in contrast, optimistically predicts the return of the Republic, offering a different perspective on Rome\'s future. Tiberius then laments his ambition, driven by his mother, and his forced separation from Vipsania, revealing the deep regret and sense of being manipulated that plagues him. This event emphasizes Tiberius\'s lack of personal agency and his growing disillusionment with the path he\'s been forced to take, highlighting the tragic consequences of his mother\'s ambition on his personal life.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["TIBERIUS: Do you think the monarchy will survive Augustus?", "DRUSUS: No, I don't. Rome will be a Republic again, I promise you that.", "TIBERIUS: Then perhaps I did it all for nothing.", "DRUSUS: Is that why you did it? Is that really? But there are Julia's sons that come before you. My poor brother. So ambitious.", "TIBERIUS: Our mother makes me so. Oh god, I miss her so. Vipsania. What did they make me do?"]
    ;
MERGE (e:Event {uuid: 'event_3_6'})
    ON CREATE SET
        e.title = 'Brotherly Comfort and the Inevitability of Fate',
        e.description = 'Drusus offers simple brotherly comfort, stating that what\'s done is done and urging Tiberius to forget Vipsania. Tiberius echoes this sentiment, accepting the finality of his loss. He then reveals that Drusus is the third person he cares for, expressing deep affection and concern for his brother\'s well-being. He suggests they should have each other\'s natures, wishing to protect Drusus, as the elder brother should. This tender exchange highlights the strong bond between the brothers and Tiberius\'s protective feelings for Drusus, creating a poignant contrast with the looming danger and foreshadowing the tragedy to come.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["DRUSUS: Oh, Tiberius... What's done is done.", "TIBERIUS: Yes. Yes, it's done. I must forget her.", "DRUSUS: Yea.", "TIBERIUS: Vipsania was the second, and she's gone. You're the third.", "DRUSUS: Well, you know I feel the same way.", "TIBERIUS: You know, you should have my nature and I yours.", "DRUSUS: Why?", "TIBERIUS: I'm the elder, I'm supposed to protect you."]
    ;
MERGE (e:Event {uuid: 'event_3_7'})
    ON CREATE SET
        e.title = 'Foreshadowing Danger and a Lifeline to Light',
        e.description = 'Drusus reassures Tiberius that they will protect each other, though he is unaware of the true dangers surrounding them. Tiberius, however, hints at unseen threats that Drusus is oblivious to. He expresses his fear for Drusus\'s safety, acknowledging the dangers of battle and sickness, and poignantly calls Drusus his \'lifeline into the light\'. Drusus counters with a reminder of life\'s unpredictability and the inevitability of death for everyone. This final exchange is heavy with foreshadowing, emphasizing Tiberius\'s premonition of danger for Drusus and the vital role Drusus plays in Tiberius\'s life as a source of hope amidst his darkness. It ends on a somber note, highlighting the fragility of life and the impending tragedy.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["DRUSUS: Well, we'll protect each other. I don't know what from?", "TIBERIUS: There are many things you don't know. If anything should happen to you...", "DRUSUS: Ahh, what could happen to me, hmmm?", "TIBERIUS: Well, you could be killed in battle. Or you could fall sick and die.", "DRUSUS: And you could cut your throat shaving or choke on a plum stone... Tiberius, none of us is guaranteed a time.", "TIBERIUS: No... You're my lifeline into the light."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'A Game of Duty and Destiny',
        s.description = 'In a lavishly decorated room within Augustus\'s palace, the atmosphere is strangely light amid the weight of imperial expectations. Sunlight filters through ornate windows, casting playful patterns on the polished marble floor. Augustus, the aging emperor, engages in an animated board game with his grandsons, Gaius and Lucius, their laughter echoing in stark contrast to the political machinations lurking outside the palace walls. As Gaius and Lucius strategize over legions and territories, the innocence of their game highlights the relentless pressures of duty and governance looming over them. The scene takes a somber turn with the arrival of a slave bearing news of Drusus\'s impending departure, a reminder that duty must always come before pleasure, even in moments of familial joy. Augustus\'s words, firm yet nurturing, emphasize the necessity of fulfilling obligations, underscoring the tension between personal desires and the rigid demands of power. This juxtaposition encapsulates the heart of the Roman experience, where games are played in the shadows of ambition and duty, foreshadowing the inevitable sacrifices each character must face.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_lavishly_decorated_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'A Game of Strategy',
        e.description = 'Augustus plays a board game with his grandsons, Gaius and Lucius, showcasing both their youthful enthusiasm and his strategic wisdom. Gaius makes a bold move to stop the corn supply, impressing Augustus with his understanding of the game\'s stakes. The playful banter among them reflects a familial bond, yet it masks the ominous duties that lie ahead. The game becomes a metaphor for the larger political games played in the empire, illustrating the need for prudence and caution in leadership.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Gaius: Six again.", "Augustus: Ahhh.", "Gaius: I'll put two legions in the port and stop the corn supply."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Duty Calls',
        e.description = 'The moment is shattered as a slave enters to announce Drusus’s request to leave. Augustus, torn between the joy of the game and the call of duty, quickly prioritizes the latter. His firm yet gentle reminder to his grandsons that duty comes before pleasure contrasts the lighthearted atmosphere of their game with the harsh realities of imperial responsibilities. This transition underscores the burden of leadership and the sacrifices inherent in maintaining power, a theme that resonates deeply within the context of Roman life.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Slave: Caesar, your stepson, the noble Drusus Nero begs to take his leave of you.", "Augustus: Now, come and say goodbye to the man who commands all our armies in Germany."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Imperial Crossroads: Duty and Doubt in Augustus\'s Study',
        s.description = 'Bathed in the soft daylight filtering through the palace windows, Augustus\'s study is a space that breathes Roman authority.  Antique artifacts and symbols of empire adorn the room, a testament to Augustus\'s long reign, while beyond the windows, the meticulously ordered palace gardens offer a glimpse of serene power.  However, the atmosphere within is far from tranquil.  A palpable tension hangs in the air as Augustus concludes a weighty conversation with Drusus, his trusted military son. The presence of young Gaius and Lucius, playing at empire with scattered game pieces, underscores the theme of succession and the future of Rome that permeates the scene. The mood shifts from formal political discussion to a more intimate, almost melancholic reflection as Augustus grapples with the burdens of leadership, the complexities of family, and the looming question of his legacy.  The scene carries a significant narrative weight, revealing the subtle power dynamics within the imperial family, foreshadowing future conflicts, and highlighting the personal sacrifices inherent in wielding immense power.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_lavishly_decorated_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Farewell and Boyish Ambition',
        e.description = 'Augustus concludes a formal discussion with Drusus, acknowledging his son\'s imminent departure to the Rhine frontier.  The Emperor\'s tone is tinged with a weary understanding of military duty.  Young princes Gaius and Lucius approach to bid farewell, their innocent curiosity and strategic questions about invading Britain revealing their nascent ambition and absorption in the games of power, mirroring the adult world around them.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: So, you're leaving us.", "DRUSUS: Yes, Caesar.", "LUCIUS: How many legions would you need to invade Britain?", "DRUSUS: Ah. Hmmm. Four. Yes, and a great deal of auxiliary cavalry as well.", "GAIUS: I'll do it one day."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Fatherly Advice and a Walk in the Garden',
        e.description = 'Augustus dismisses the princes, hinting at their future roles and expressing a need for them in the empire\'s long game. He then invites Drusus for a walk in the palace garden, signaling a shift towards a more private and reflective conversation, moving away from the formal setting of the study and towards a more intimate space for father and son.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: Now say goodbye and wait for me upstairs. ", "AUGUSTUS: Come and... Come and walk with me in the garden then."]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Concern for Antonia and Dynastic Duty',
        e.description = 'Augustus inquires about Antonia\'s wellbeing during her travels, revealing his awareness of her pregnancy and a subtle concern for her condition. He then segues into a broader reflection on the necessity of noble families producing more children, underscoring the dynastic pressures and expectations placed upon the Roman elite, framing procreation as a duty to the state.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: Is ANTONIA travelling with you?", "DRUSUS: Yes.", "AUGUSTUS: Will that be alright, I mean in her condition?", "AUGUSTUS: I didn't realize she was expecting again. JULIA told me. It's a bit close to the others.", "AUGUSTUS: Anyway, we need more children, especially among the nobility. People aren't getting married earlier. Yes, I must do something about that..."]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Livia\'s Shadow and Imperial Burden',
        e.description = 'Augustus shifts the conversation to Livia, inquiring if Drusus has said goodbye to his mother. He praises Livia\'s tireless work and indispensable support, confessing his own weariness and dependence on her. This highlights Livia\'s significant role in Augustus\'s reign and hints at the immense pressure of imperial rule, subtly foreshadowing the power she wields.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Have you... Have you said goodbye to LIVIA?", "DRUSUS: Well, she knows that I'm here. She's with the Parthian ambassador.", "AUGUSTUS: Oh, yes, yes. She works so hard for me. Your mother is a very fine woman. I'd have given up long ago if it weren't for her.", "DRUSUS: It is an immense burden to place on the shoulders of just one man."]
    ;
MERGE (e:Event {uuid: 'event_5_5'})
    ON CREATE SET
        e.title = 'Longing for Simplicity and Antony\'s Folly',
        e.description = 'Augustus expresses a wistful desire for a simpler, private life, momentarily revealing the personal cost of his imperial power. He then transitions to a critical reflection on Mark Antony\'s failures, blaming him for the current state of the empire and lamenting Antony\'s poor choices, revealing Augustus\'s lingering rivalry and justification for his own ascent to power.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS: Oh, I sometimes have a longing, you know, to be just a private citizen again.", "AUGUSTUS: And I blame him, you know. I mean, what a fool that man was. The whole of the Eastern empire was his. If he'd been a proper husband to my sister, things would've been very different."]
    ;
MERGE (e:Event {uuid: 'event_5_6'})
    ON CREATE SET
        e.title = 'Whispers of Republic and a Father\'s Shadow',
        e.description = 'Drusus subtly probes Augustus about the possibility of relinquishing power, revealing his republican leanings and questioning the emperor\'s autocratic rule. Augustus sharply rebuffs this suggestion, comparing Drusus to his republican father (Drusus the Elder) and acknowledging their past political differences.  Despite the tension, Augustus immediately softens, praising Drusus the Elder and hinting at past regrets, creating a complex emotional undercurrent in their exchange.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["DRUSUS: Is it too late?", "AUGUSTUS: Is it too late to lay down the burdens of office?", "DRUSUS: Yes.", "AUGUSTUS: And let the Senate rule?", "AUGUSTUS: You're just like your father. Always wanting the Republic. He was my enemy too at one time.", "DRUSUS: I'll never be that.", "AUGUSTUS: No, no. I didn't mean that. Be like him. You couldn't do better. I did him wrong once, you know. Oh yes, yes, yes. I took your mother from him. And that has weighed with me over the years..."]
    ;
MERGE (e:Event {uuid: 'event_5_7'})
    ON CREATE SET
        e.title = 'Familial Facade and Tiberius the Enigma',
        e.description = 'Augustus shifts to emphasize familial unity and shared purpose, reinforcing the image of a cohesive imperial family. He then turns to the topic of Tiberius, expressing his bafflement and frustration with his stepson\'s enigmatic nature and quiet observation. Augustus\'s description of Tiberius as a \'large dog\' reveals his uneasy relationship and lack of understanding, even while acknowledging Tiberius\'s crucial role.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["AUGUSTUS: Still... We're a family and we all work together for the greater good of Rome.", "AUGUSTUS: TIBERIUS... Oh, he's a puzzle to me, like the Sphinx. He's like having a large dog lying about the house all day, watching everything and saying nothing."]
    ;
MERGE (e:Event {uuid: 'event_5_8'})
    ON CREATE SET
        e.title = 'Tiberius\'s Desire for Escape and Unwilling Duty',
        e.description = 'Drusus reveals Tiberius\'s desire to leave Rome, confirming Augustus\'s awareness of Tiberius\'s discontent. Augustus acknowledges Tiberius\'s wish for isolation and a simple life, yet firmly states his need for Tiberius to remain in Rome, emphasizing Tiberius\'s unwilling but essential role in maintaining imperial stability until the young princes mature, highlighting the theme of unwilling duty and trapped ambition.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["DRUSUS: He wants to leave Rome.", "AUGUSTUS: Yes, I know, I know. He never stops telling me. But I need him here and that's a fact. I mean, what would I do without him until the boys grow up.", "DRUSUS: Yes, still an unwilling horse...", "AUGUSTUS: Yes, yes... Is more trouble than walking on foot. But we're not horses. We can't all do what we want. And frankly what does he want? He wants to sit on a rock all day, Rhodes, or Capri, and throw stones at the sea. Why, I don't know. No, no, no, no. We can't have it..."]
    ;
MERGE (e:Event {uuid: 'event_5_9'})
    ON CREATE SET
        e.title = 'Livia\'s Entrance: Resumption of Imperial Affairs',
        e.description = 'Livia enters the study, her presence immediately commanding and shifting the atmosphere. The intimate conversation between father and son is abruptly interrupted as Livia\'s arrival signals a return to the pressing matters of state and imperial governance, marking a change in tone and focus.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["AUGUSTUS: Ah, here's your mother.", "LIVIA: So, you're off again."]
    ;
MERGE (e:Event {uuid: 'event_5_10'})
    ON CREATE SET
        e.title = 'German Dispatches and Military Duty',
        e.description = 'Livia immediately steers the conversation back to military matters, questioning Drusus about dispatches from Germany and the Cherusci tribe, emphasizing the constant threats to Roman borders and Drusus\'s military responsibilities. Drusus\'s confident reply reveals his soldierly pride and readiness for action.',
        e.sequence_within_scene = 10,
        e.key_dialogue = ["LIVIA: You read the dispatches that came from Germany yesterday? The Cherusci are giving trouble again.", "DRUSUS: Well, I'll give them trouble enough, don't worry."]
    ;
MERGE (e:Event {uuid: 'event_5_11'})
    ON CREATE SET
        e.title = 'Debate on Parthian Divinity and Roman Values',
        e.description = 'Livia reveals the Parthian ambassador\'s request to dedicate a temple to Augustus as a god, initiating a debate about Roman values and the dangers of emperor worship. Augustus firmly rejects the idea, citing traditional Roman religious sensibilities. Drusus supports Augustus\'s stance, questioning the shift towards divine monarchy, revealing a contrast between Livia\'s pragmatic political maneuvering and the men\'s more traditional Roman outlook.',
        e.sequence_within_scene = 11,
        e.key_dialogue = ["LIVIA: They want a Roman god to worship. They want to dedicate the temple to you.", "AUGUSTUS: No, no, no. I won't have it. I've said so before.", "DRUSUS: We've abolished kings in Rome, mother. Would you now give us living gods?", "LIVIA: They won't be in Rome, Drusus. They'll be in Syria. What harm is there in a temple built in your name with primitive people may come and place a few offerings.", "AUGUSTUS: No, no, no. It makes me uneasily. I feel in my heart it's, it's not right. I mean, we may offend those gods that already look after us and oversee our destiny."]
    ;
MERGE (e:Event {uuid: 'event_5_12'})
    ON CREATE SET
        e.title = 'Augustus\'s Firm Refusal and Parting Blessing',
        e.description = 'Augustus reiterates his firm refusal of divine worship, demonstrating his adherence to traditional Roman values and his reluctance towards deification. He then dismisses the matter and offers a paternal blessing to Drusus before his departure, shifting back to a more familial tone as he prepares to rejoin the princes.',
        e.sequence_within_scene = 12,
        e.key_dialogue = ["AUGUSTUS: No! You must tell them no...", "AUGUSTUS: gods go with you..."]
    ;
MERGE (e:Event {uuid: 'event_5_13'})
    ON CREATE SET
        e.title = 'Livia\'s Private Warning: Ambition Unveiled',
        e.description = 'Once Augustus departs, Livia turns to Drusus with a sharp warning, urging him not to encourage Augustus to relinquish power. This reveals Livia\'s core ambition and her determination to maintain the imperial structure, exposing the underlying power dynamics and her controlling nature, contrasting with the more idealistic views of both Augustus and Drusus.',
        e.sequence_within_scene = 13,
        e.key_dialogue = ["LIVIA: Leave him alone. Don't encourage him to step down from office."]
    ;
MERGE (e:Event {uuid: 'event_5_14'})
    ON CREATE SET
        e.title = 'Drusus\'s Parting Words and Republican Idealism',
        e.description = 'Drusus responds to Livia\'s warning by gently pushing back against the idea of hereditary monarchy and hinting at the potential for corruption. He then bids farewell with a poignant and slightly melancholic statement about maternal love, revealing his awareness of a potential emotional distance from his mother and underscoring the ideological divide between them before his departure.',
        e.sequence_within_scene = 14,
        e.key_dialogue = ["DRUSUS: Now, Mother, do you really want us to drift into an hereditary monarchy, become sinks of corruption like Eastern potentates.", "LIVIA: Rome will never be a Republic again.", "DRUSUS: Well, we needn't quarrel about it. Come let me kiss you and say goodbye... You know, you mustn't mind if you dislike me. A mother can't love all her children."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Desperate Plea',
        s.description = 'In the dimly lit space of Vipsania\'s modest Roman dwelling, the air is thick with tension. The muted light filters through the shuttered window, casting elongated shadows that dance across the room. Vipsania stands near the window, embodying quiet strength but also fear, as Tiberius, filled with despair, implores her not to distance herself. Their dialogue is fraught with emotional turmoil, revealing the depths of their lost love and the harsh realities of their circumstances. Tiberius’s pleas echo with desperation as he grapples with his heartbreak and the weight of his political obligations. Vipsania, torn between her own desires and the dangers presented by Tiberius\'s pursuit, urges him to leave, emphasizing the peril of continuing their secret meetings. The scene encapsulates the collision of personal longing against the rigid backdrop of Roman law and duty, highlighting the tragic inevitability of their separation and the bitter sacrifice demanded by ambition. This moment serves as a poignant exploration of love, loss, and the emotional scars left by power.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_vipsanias_house'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Tiberius\'s Desperate Plea',
        e.description = 'Tiberius, filled with desperation, confronts Vipsania in her home, pleading for her not to send him away. Vipsania, fearful for her safety and aware of the dangers of their clandestine meetings, urges him to leave, concerned about the repercussions of being discovered. Their dialogue reveals deep emotional scars as Tiberius expresses his anguish over her impending remarriage, highlighting the conflict between his love for her and his obligations. Vipsania\'s insistence on maintaining distance illustrates the heavy burden of political expediency and personal sacrifice that weighs on both of them.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You shouldn't have come here. It's wrong. It's wrong.", "Don't send me away. Please, Vipsania.", "Is it true? Getting married again?", "Don't get married again. I beg you. I couldn't bear it."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'The Heart of the Conflict',
        e.description = 'As their argument intensifies, Vipsania reveals her decision to remarry, forcing Tiberius to confront the reality of his past actions. The exchange becomes increasingly emotional, with Tiberius expressing a desire for a life together, while Vipsania counters with the necessity of her choices. They grapple with feelings of love, regret, and the harsh truths dictated by their obligations. Tiberius\'s outburst about their love and Vipsania\'s firm stance emphasize the tragic nature of their situation—caught in the ruthless machinery of Roman politics, each is forced to sacrifice their happiness for the sake of duty.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I won't have it! I won't have it! I'll kill you! You're mine! You're my wife!", "I am not your wife. You divorced me!", "It's done now. There's no going back.", "Let's die together. Let's kill ourselves."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'The Final Realization',
        e.description = 'In a moment of shared vulnerability, Tiberius and Vipsania confront their despair and the futility of their situation. Tiberius\'s desperate wish to die together starkly contrasts with Vipsania\'s resigned acceptance of their fate, as she tries to comfort him. Their dialogue shifts from anger to sorrow, revealing their deep emotional connection despite the walls built by politics and obligation. Vipsania reassures Tiberius that they will both survive, even as he expresses fear about becoming something unrecognizable without her love. This poignant exchange encapsulates the theme of lost love amid the brutal realities of their lives.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["You'll come through it and so will I.", "But how will I come through it, Vipsania? I'm afraid of what I'll become without you."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Deification Strategy',
        s.description = 'The Imperial Palace Reception Hall, though grand with its marble floors and imposing statues of Roman figures, feels hushed and subdued, lit by a filtered daylight that mutes the usual splendor.  The air is thick with unspoken political maneuvering. Livia, an embodiment of regal composure, engages a Senator in a seemingly private discussion, her voice low but sharp, each word carefully chosen for maximum impact. Augustus, the Emperor himself, paces nearby, his agitation a subtle undercurrent in the formal setting. The scene is charged with political tension as Livia reveals her calculated plan to sway the Senate toward Augustus\'s deification, subtly undermining his public stance of modesty. This scene underscores Livia\'s formidable political acumen and her willingness to manipulate even the Emperor\'s image to solidify their dynasty\'s power, revealing the thematic undercurrents of ambition and the subtle but constant power struggles within the imperial court.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Subtle Power Play Over Deification',
        e.description = 'Livia initiates a conversation with a Senator, ostensibly about a past deputation from Palmyra regarding Augustus\'s deification. She subtly probes the Senator\'s understanding of Augustus\'s public reluctance towards being deified, while hinting at her own differing perspective. This establishes Livia\'s intent to manipulate the situation for political advantage, even if it means circumventing Augustus\'s stated wishes.  The hushed tones and formal setting amplify the undercurrent of political intrigue.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: We had a deputation here, six months ago from Palmyra.", "SENATOR: And Augustus refused, I remember.", "LIVIA: Hmmm. The thought of deification makes him uneasy.", "SENATOR: It might make us all uneasy.", "LIVIA: We're not all worthy of it.", "SENATOR: No, no, of course. But his mind is made up?", "LIVIA: Yes. But so is mine."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Livia Dictates Political Strategy',
        e.description = 'Livia pivots from discussing Augustus\'s supposed modesty to explicitly outlining her strategy for his deification.  She reveals her intention to use the Senate to achieve her political goals, manipulating their perception of \'political usefulness\' to override Augustus\'s personal reservations. Livia then firmly instructs the Senator on the \'line to take\', showcasing her commanding control and manipulative nature. Augustus\'s pacing in the background subtly underscores his awareness and perhaps tacit approval of Livia\'s machinations, suggesting a calculated collaboration in their public and private personas.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: I cannot allow his natural modesty to interfere with his political judgment. I know that if the Senate were convinced that his deification were politically useful, he would not be displeased. But he, himself will exert no pressure and, of course, he would not be present at any of the debates.", "SENATOR: Of course... They'll be some opposition in the Senate. But, uh, I'll take the line...", "LIVIA: I'll tell you what line to take."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Confrontation in the Hallway',
        s.description = 'The scene unfolds in the Imperial Palace Hallway, a lavish corridor adorned with tapestries depicting the great victories of Rome. The air is thick with tension as AUGUSTUS storms down the hallway, his imperial robes trailing behind him like a storm cloud. The sunlight filtering through the high windows emphasizes the grandeur of the palace but does little to lighten the oppressive atmosphere of conflict. TIBERIUS follows closely, his demeanor sullen, embodying the weight of familial duty and personal anguish. AUGUSTUS\'s voice rings out – a mix of anger and desperation as he chastises TIBERIUS for being seen with JULIA, his daughter. The emotional stakes are high; both men are caught in a web of familial obligation, ambition, and the societal expectations of imperial duty. This confrontation serves as a pivotal moment, revealing the tensions within the imperial family and the consequences of personal desires clashing with public roles. Themes of respect, duty, and the burdens of ambition are laid bare in this heated exchange.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_hallway'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Augustus Confronts Tiberius',
        e.description = 'AUGUSTUS storms down the hallway, filled with righteous indignation about TIBERIUS\'s inappropriate behavior. He expresses his anger that TIBERIUS was seen entering and exiting the home of JULIA, his daughter, and demands that he treat her with respect. TIBERIUS attempts to defend himself, claiming he went to congratulate her on her upcoming marriage. However, AUGUSTUS dismisses this explanation, insisting that he will not tolerate a mockery of the marriage and that TIBERIUS must accept the role he has been given.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You were seen! And in broad daylight! You were seen going in and you were seen coming out! I won't have it! And this is not the first time!", "I went to congratulate her on her upcoming marriage.", "Don't congratulate her! Leave her be!", "You'll treat my daughter with respect. Respect, do you hear me!"]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Imperial Fury and Treasonous Dispatch',
        s.description = 'The opulent reception hall of the Imperial Palace becomes a stage for explosive familial discord. Augustus, his face flushed with imperial outrage, confronts Tiberius about his clandestine meetings with Vipsania, accusing him of making a mockery of the family. Livia enters, observing the scene with cool calculation, and skillfully manipulates Augustus\'s anger, subtly steering the conversation. The emotional atmosphere is thick with tension, oscillating between Augustus\'s booming fury, Tiberius\'s sullen resentment, and Livia\'s icy control. The arrival of a messenger bearing a dispatch from Drusus in Germania shifts the scene\'s narrative significance, transforming a domestic squabble into a moment of political intrigue and veiled threat as Livia seizes upon the letter to further her machinations, revealing a treasonous message and setting a dangerous new course for the family\'s fate.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Augustus\'s Public Accusation',
        e.description = 'Augustus, in a fit of imperial pique, publicly rebukes Tiberius for consorting with his former wife, Vipsania. He accuses Tiberius of disrespecting the family and threatens swift retribution, invoking the example of Mark Antony to underscore his absolute authority. Augustus\'s outburst reveals his insecurity and need for control, highlighting the fragility of the carefully constructed imperial image. Tiberius stands silently, absorbing the emperor\'s wrath, his resentment simmering beneath the surface.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: He's been seeing his former wife, if you please, and it's not the first time!", "AUGUSTUS: You'll not make a laughingstock of my family or, as quick as boiled asparagus, I'll have you out. Out! ... You listen to me. Mark Antony was twice the man you are. And when he spat on my sister, he learned a lesson that he didn't live long enough to profit from."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Livia\'s Calculated Intervention',
        e.description = 'Livia enters the reception hall, drawn by the raised voices, and immediately steps into the fray, feigning a calming presence. She subtly undermines Augustus\'s outburst by suggesting he exaggerates and downplaying the significance of Tiberius\'s actions. Livia\'s intervention is not one of peacemaking but strategic manipulation. She skillfully deflects Augustus\'s anger and begins to take control of the narrative, using her sharp wit and intimate knowledge of Augustus\'s insecurities to her advantage, subtly shifting the power dynamic of the scene.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: My dear, I think you exaggerate.", "AUGUSTUS: I exaggerate nothing!"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Tiberius\'s Plea for Release and Livia\'s Control',
        e.description = 'Tiberius, cornered and resentful, expresses his desire to leave Rome, hoping to escape the suffocating pressure of his marriage and courtly life. However, Livia swiftly dismisses his plea, asserting her control over him and the situation. She expertly manipulates Augustus by drawing parallels to his own past indiscretions, effectively diffusing his anger and turning his focus from moral outrage to pragmatic familial duty. Livia\'s calculated words showcase her mastery of manipulation and her unwavering grip on both her son and her husband.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: Well, let me go away. Let me leave Rome.", "LIVIA: He doesn't mean it. He doesn't want to go.", "LIVIA: It's not unnatural for a man to see his former wife now and then. They may have things to discuss. After all, I saw his father several times after you and I were married.", "LIVIA: Oh, not so very different. And you, if I recall, saw Julia's mother from time to time."]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Augustus\'s Pragmatic Compromise',
        e.description = 'Augustus, swayed by Livia\'s skillful deflection and his own desire to avoid familial discord, concedes ground. He acknowledges the incompatibility between Tiberius and Julia but insists on maintaining appearances for the sake of the empire. He then shockingly proposes a hypocritical compromise: he will turn a blind eye to minor infidelities, but strictly forbids any contact with Vipsania. This reveals Augustus\'s pragmatic, albeit morally compromised, approach to power and family, prioritizing stability and image over genuine affection or ethical consistency.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Alright, I was hasty. But you understand, I felt I had cause... Tiberius, listen. I'm not blind. I know that you and Julia aren't the most perfectly matched couple in the world. But what can you do? These things happen!", "AUGUSTUS: Now, Tiberius. You play fair with me, eh? Don't sulk! And if it's a matter of a little thing on the side, here and there - now, I'm not encouraging, mind - who's to know? ... Yes, well we can wink at it between men. But Vipsania, I don't like it. Do you understand? It's not allowed."]
    ;
MERGE (e:Event {uuid: 'event_9_5'})
    ON CREATE SET
        e.title = 'Arrival of Drusus\'s Treasonous Dispatch',
        e.description = 'A slave announces the arrival of an imperial messenger, interrupting the strained familial reconciliation. A courier enters, bearing a sealed scroll – a dispatch from Drusus in Germania addressed to Tiberius. This arrival injects a sudden shift in tone, moving from domestic drama to political intrigue, raising the stakes and introducing a potentially dangerous new element into the scene. The focus immediately shifts to the contents of the letter and its possible implications.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS: Ahhh, if there's one thing that I hate, it's a family row. I mean, what does it cost to be kind to one another? To be sympathetic and understanding?", "SLAVE: An imperial messenger has arrived from Germany, Caesar.", "COURIER: A dispatch from Drusus Nero for his noble brother."]
    ;
MERGE (e:Event {uuid: 'event_9_6'})
    ON CREATE SET
        e.title = 'Tiberius\'s Hesitation and Livia\'s Seizure of Power',
        e.description = 'Tiberius begins to read Drusus\'s letter aloud, initially downplaying its significance and feigning difficulty with the handwriting. He attempts to shield Augustus from the letter\'s true contents, sensing its potentially damaging nature. However, Livia, ever vigilant and opportunistic, quickly snatches the scroll from Tiberius, seizing control of the information and the unfolding situation. Her action underscores her ruthless ambition and her willingness to manipulate any situation to her advantage.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["TIBERIUS: \"My dear Tiberius. A period of enforced rest due to a slight head wound has given me much time to ponder and reflect on the state of our beloved Rome.\"", "TIBERIUS: Uh, honestly sir, it's not worth reading. I think my brother was perhaps not himself when he wrote it.", "LIVIA snatches the scroll from Tiberius's hands and reads aloud, her voice dripping with venom."]
    ;
MERGE (e:Event {uuid: 'event_9_7'})
    ON CREATE SET
        e.title = 'Livia Exposes Drusus\'s Treason and Seeds Doubt',
        e.description = 'Livia reads aloud the most inflammatory excerpt from Drusus\'s letter, revealing his treasonous sentiments questioning Augustus\'s continued rule and implicating Livia herself as an obstacle to his retirement. Her voice drips with venom as she exposes Drusus\'s words, twisting them to portray him as a dangerous threat. While Augustus initially attempts to dismiss the letter as the ramblings of a wounded man, Livia\'s calculated reading plants seeds of doubt and suspicion in his mind, setting the stage for her subsequent manipulations and Drusus\'s downfall.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["LIVIA: \"...the corruption and petty place seeking that I found in Rome, that I have come to the conclusion that it is the inevitable consequence of the continued exercise of supreme power by Augustus. Could we not persuade him, even compel him, to retire? I firmly believe he is ready to do this but for the stubbornness of our mother, Livia, who derives such satisfaction from the exercise of supreme power through him...\"... There's more. Do you want to read it? The letter's clearly treasonable.", "AUGUSTUS: No, no, no, no. No, he feels strongly about it. I understand. He's wrong. But I understand... Then again, perhaps he's right? Perhaps I should retire?"]
    ;
MERGE (e:Event {uuid: 'event_9_8'})
    ON CREATE SET
        e.title = 'Livia Orchestrates Drusus\'s Demise Under Guise of Concern',
        e.description = 'Livia, seizing the opportunity presented by Drusus\'s letter, smoothly pivots from outrage to feigned concern. She suggests recalling Drusus under the guise of providing him rest and medical attention, subtly steering Augustus towards her desired course of action. When Augustus agrees to bring Drusus back, Livia swiftly proposes sending her own physician, Musa, to attend to him, masking her deadly intention under the guise of superior medical care. This final act seals Drusus\'s fate, revealing Livia\'s chilling ruthlessness and masterful manipulation as she orchestrates his demise with calculated precision.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["LIVIA: Well, will you allow him to insult me in this fashion?", "AUGUSTUS: He's your son, not mine.", "AUGUSTUS: Yes... Yes... That's it... He's a little bit deranged. Those German forests, they can affect a man... I'll call him back for a rest... It would be good to see him again.", "LIVIA: Yes, I think you're right. We should have him back. And I'll send a doctor with a letter.", "LIVIA: Ha, army doctors, what do they know? No, no, no, I'll send my own. He'll know how to take care of him."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'The Weight of Injury',
        s.description = 'Set against the rugged backdrop of the Rhine frontier, the military encampment is a chaotic scene filled with makeshift tents strewn across rocky ground. The air is thick with tension and the palpable anxiety of soldiers who navigate the harsh realities of war. RUFUS, a stern centurion, commands authority as he barks orders, his voice cutting through the din of the encampment. DRUSUS, gravely injured, lies on a makeshift bed, the pain etched across his face. An urgent atmosphere pervades as RUFUS\'s commands blend with the sounds of hurried movement, the shuffling of guardsmen, and the distant cries of men in distress. ANTONIA rushes in, her expression a mix of concern and fear, deepening the emotional stakes of the scene. This moment underscores the harsh realities of military life and the personal toll of injury amidst the backdrop of imperial duty, highlighting the fragility of the heroic image often associated with Roman soldiers. It serves as a poignant reminder of the human cost of ambition and the urgency of care in a world steeped in violence.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_military_encampment'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Rufus Commands Order Amidst Chaos',
        e.description = 'RUFUS, the centurion, takes charge of the chaotic situation as he barks orders to the guardsmen, emphasizing the urgency of fetching the doctor. His authority commands immediate action, showcasing the hierarchical structure of military life. The guardsmen respond to his orders, reflecting the discipline instilled within the Roman legions. This event highlights the stark realities of war and the pressure on leaders to maintain order during crises, painting RUFUS as a figure of strength amidst vulnerability.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Easy... That's right... Fetch the doctor.", "Which one?", "Which one. Ours, of course. And tell him to hurry. Lift him onto the bed and be careful. Or by all the gods, I'll make eunuchs of you."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Drusus Reveals His Injury',
        e.description = 'As RUFUS tends to DRUSUS, the injured soldier shares the grim details of his accident, recounting how his horse fell and crushed his leg against a jagged rock. The vivid description of his injury adds gravity to the scene, illustrating the harsh realities faced by soldiers on the front lines. DRUSUS\'s resilience shines through his pain as he tries to maintain a sense of humor about the situation, revealing a deeper emotional struggle as he confronts his predicament.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Feels terrible.", "My horse fell on me. I couldn't get out. It crushed my leg against a jagged rock and then tore it to shreds trying to get to its feet."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'The Arrival of the Doctor',
        e.description = 'RUFUS reveals that Livia\'s personal physician has arrived from Rome, a detail that raises DRUSUS\'s suspicions. The introduction of the personal physician adds a layer of complexity to the situation, hinting at the intertwining of family loyalty and political maneuvering. DRUSUS\'s sarcastic remark about his mother’s \'kindness\' underscores the tension within the family and the potential ulterior motives hidden behind the guise of care. This moment foreshadows the impending complications that will arise from having a physician affiliated with Livia.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["One arrived from Rome today. He's your mother's personal physician.", "Well, that was kind of her. Why, he'll have more to look than just a head wound, won't he?"]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'Antonia\'s Arrival and Concern',
        e.description = 'ANTONIA rushes in, visibly distraught, heightening the emotional stakes of the scene. Her immediate concern for DRUSUS emphasizes the familial bonds at play amidst the chaos of the encampment. This moment reflects the personal cost of war not just on soldiers but on their families as well. DRUSUS tries to reassure ANTONIA, attempting to maintain a brave front despite his injury, revealing the complexities of vulnerability and strength in a time of crisis.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Rufus, what happened?", "Dru... I'm alright. I've been invited politely back to Rome."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'News of Drusus and Calculated Dismissal',
        s.description = 'Within the opulent, yet stifling, confines of Augustus\'s palace, a tense discussion unfolds concerning Drusus\'s grave injury. Augustus, pacing with performative concern, questions the circumstances of what he deems a \'simple fall,\' his anxiety tinged with disbelief rather than genuine worry. Livia, ever the pragmatist, observes with chilling coolness, swiftly dismissing the accident as a convenient excuse for Drusus to remain distant, subtly insinuating a darker political motive rooted in his command of the western armies. Tiberius, visibly stricken, stands resolute amidst their machinations, his loyalty to his brother overriding the courtly intrigue. He declares his immediate departure for the Rhine frontier, a desperate act of familial devotion in the face of calculated indifference. Augustus, after a token display of paternal concern, abruptly grants his leave, his blessings feeling hollow and perfunctory. With Tiberius gone, Augustus\'s fragile facade of concern crumbles, revealing a deep-seated vanity as he immediately pivots to discussing his own deification in Palmyra, his cynical musings underscoring his self-absorption and emotional detachment from the unfolding family tragedy.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_palace_lavishly_decorated_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Augustus Questions Drusus\'s Accident',
        e.description = 'Augustus expresses his disbelief at the severity of Drusus\'s accident, finding it improbable that a fall could lead to such dire consequences. He paces with agitation, questioning the nature of the event while Livia watches him with a detached air, and Tiberius listens silently, absorbing the unfolding news.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: I don't understand. A simple fall. How could it happen?", "TIBERIUS: They can be bad sometimes.", "AUGUSTUS: To bring himself close to death's door?"]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Livia Dismisses Drusus and Hints at Treachery',
        e.description = 'Livia coldly dismisses the severity of Drusus\'s injury, suggesting it is a fabricated excuse to avoid returning to Rome. She insinuates that Drusus might be leveraging his military power for political advantage, revealing her deep-seated suspicion and manipulative nature, and subtly poisoning the atmosphere with accusations of disloyalty.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Well, it's a good excuse for not coming home.", "TIBERIUS: Why do you say that?", "LIVIA: Because I've heard such reasons before. Don't raise your voice to me!", "TIBERIUS: What reason could he have?", "LIVIA: Who knows? We know he has the whole of the western armies at his back. Perhaps he'll come when it suits him?"]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Tiberius Declares His Journey to Drusus',
        e.description = 'Ignoring Livia\'s manipulative insinuations and Augustus\'s pragmatic objections about distance and the potential futility of travel, Tiberius firmly declares his resolve to go to his brother\'s side. His insistence underscores his deep familial loyalty and his emotional distress, standing in stark contrast to the cold political calculations of his mother.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: I must go to my brother.", "AUGUSTUS: He's 500 miles away. If it's as serious as the letter says, he could be dead even now.", "TIBERIUS: All the same, I must go to him."]
    ;
MERGE (e:Event {uuid: 'event_11_4'})
    ON CREATE SET
        e.title = 'Augustus Grants Leave with Hollow Blessings',
        e.description = 'Augustus, after initially voicing practical concerns, abruptly and somewhat dismissively grants Tiberius permission to depart. He offers perfunctory blessings and instructs Tiberius to convey their \'love,\' the sentiment feeling shallow and insincere, highlighting his emotional detachment and eagerness to conclude the uncomfortable subject.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: I'll make a sacrifice and offer prayers... Perhaps he won't be taken from us. Take him our love... Well, go, go, go, go quickly!"]
    ;
MERGE (e:Event {uuid: 'event_11_5'})
    ON CREATE SET
        e.title = 'Augustus Seeks Divine Validation in Palmyra',
        e.description = 'Immediately after Tiberius\'s hasty exit, Augustus abruptly shifts the focus to himself, announcing the Senate\'s decision to deify him in Palmyra. He then reveals a cynical and insecure perspective on this honor, questioning the practical efficacy of his supposed divinity, betraying a deep-seated vanity and a preoccupation with his own legacy even amidst the looming family tragedy.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["AUGUSTUS: The Senate today have voted to make me a god in Palmyra. They'll put a little statute to me in the temple. And people will bring offerings to me, asking me to bring rain or cure their father's gout... Tell me Livia, if I'm a god, even in Palmyra, how do I cure gout?"]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Descent into Darkness',
        s.description = 'In the harsh light of day, the military encampment reveals the stark reality of Roman warfare, with soldiers moving about in a frantic yet disciplined manner. The air is thick with tension and the scent of sweat, mingling with the distant sounds of a battlefield looming nearby. Antonia kneels beside Drusus, her love evident in her concerned gaze, pleading with him for clarity. The emotional atmosphere is charged with despair as the reality of Drusus’s condition becomes increasingly dire. As Rufus enters, the gravity of the situation deepens, exposing the fragility of life in the face of imperial duty. Tiberius’s arrival heightens the tension, revealing the familial bonds that are both a source of strength and vulnerability. The scene captures the tragic intersection of love, loss, and ambition, encapsulating the overarching theme of sacrifice amidst the brutal realities of Roman power. In this moment, the encroaching shadows of death and betrayal loom large as Drusus’s whispers of foreboding resonate through the air.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_military_encampment'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Antonia\'s Plea',
        e.description = 'Antonia kneels beside her ailing husband Drusus, her voice trembling with concern as she asks him what he desires. Drusus whispers for her to fetch their children, revealing his desire for family amidst his suffering. Antonia responds affirmatively, expressing her willingness to comply. This moment highlights their deep emotional connection and the bond of love that persists even in the face of impending loss.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["What is it, my love? What do you want?", "Fetch the children."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Rufus Enters',
        e.description = 'Rufus enters the scene, bringing a sense of urgency as he exchanges brief words with Antonia. She informs him of Drusus\'s wish to see the children. The unsettling atmosphere thickens as Tiberius arrives, prompting Rufus to inform him about Drusus\'s critical condition. This exchange serves to heighten the tension, as the gravity of Drusus\'s illness becomes more apparent to all present.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["He wants me to fetch the children.", "Is he?"]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Diagnosis Revealed',
        e.description = 'Tiberius inquires about Drusus\'s condition, and Rufus grimly reveals the diagnosis of gangrene, which has spread uncontrollably. This moment signifies the loss of hope as it becomes clear that the situation is dire. The arrival of Musa, Livia\'s physician, adds another layer of tension, as Tiberius confronts him about the severity of Drusus\'s condition, leading to a confrontation filled with accusations and fear.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Gangrene. It crept slowly up through him and nothing seemed to stop it.", "Get out!"]
    ;
MERGE (e:Event {uuid: 'event_12_4'})
    ON CREATE SET
        e.title = 'Confrontation and Realization',
        e.description = 'A heated exchange occurs as Tiberius throws Musa out in anger, demanding Drusus\'s attention. As he calls for his brother, Drusus\'s weakening voice emerges with haunting words about their family, which deepens the tragedy. Drusus expresses his belief that Rome is ruled by a severe mother and a cruel stepmother, which underscores the themes of familial abuse and betrayal. This poignant moment encapsulates the emotional and political turmoil surrounding their family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Drusus! Drusus, look at me! Drusus, it's I, Tiberius.", "Rome has a severe mother. And Gauis and Lucius a cruel stepmother."]
    ;
MERGE (e:Event {uuid: 'event_12_5'})
    ON CREATE SET
        e.title = 'The Arrival of Claudius',
        e.description = 'Antonia returns with baby Claudius in her arms, a symbol of innocence amidst the chaos and despair surrounding them. Her heartbreak is palpable as she realizes that Drusus did not wait for their child to arrive. In this moment, the juxtaposition of life and death is stark, amplifying the emotional weight of the scene as familial bonds are tested in their direst hour.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Look, I brought you little Claudius... And you didn't wait."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Whispers of Blunder',
        s.description = 'Claudius is alone in his private study, a space overflowing with scrolls and half-finished thoughts, bathed in the soft light of day filtering through a window. The air is still, heavy with the silence of contemplation, yet charged with an undercurrent of unease. Bookshelves line the walls, their contents hinting at a restless intellect seeking answers in history and philosophy.  Dust motes dance in the sunbeams, illuminating the solitary figure of Claudius as he paces slowly, his brow furrowed in thought. The mood is somber, reflective, tinged with a growing suspicion. This scene serves to highlight Claudius\'s sharp mind and independent thinking, establishing him as an observer who sees beyond the official narratives. It subtly introduces the theme of truth versus deception, planting seeds of doubt about the accepted explanation of Drusus\'s death and foreshadowing Claudius\'s future role as a seeker of truth in a court of lies.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'A Solitary Accusation',
        e.description = 'Within the confines of his study, Claudius, consumed by his thoughts, vocalizes his burgeoning suspicions regarding Drusus\'s demise. He dismisses the notion of a mere accident, asserting with conviction that Drusus\'s death was not only unnatural but the result of incompetence or deliberate foul play. His pronouncement, though uttered in solitude, carries the weight of dawning realization, marking a pivotal moment where quiet contemplation transforms into firm accusation. This event reveals Claudius\'s keen intellect and growing distrust of the official accounts surrounding his father\'s death, setting him apart as someone who sees beyond the surface narratives and hints at his future role as an insightful observer of the unfolding tragedies.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: He shouldn't have died, and that's a fact. Somebody blundered, and that's a fact."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'Whispers of Betrayal',
        s.description = 'The dim light of candlelight flickers across the cramped and cluttered private dining room, casting dancing shadows on the walls. OLD CLAUDIUS, frail yet sharp-minded, sits alone at a modest table laden with food, every dish reflecting a sense of excess that contrasts with his current state of despair. A SERVANT hovers nearby, his demeanor obsequious, keen to please. As Claudius reflects on the recent tragedy of his father\'s death, he expresses his growing paranoia, convinced that those closest to him conspire against him. The air is thick with tension as he accuses the Servant of complicity in a plot against his life, revealing deep-seated fears that haunt him. The conversation dances between mundane details of the meal and the weighty matters of life, death, and betrayal, highlighting the isolation Claudius feels within his gilded cage. This small, intimate setting serves as a microcosm of the larger political treachery at play within the empire, encapsulating the heavy burden of familial legacy and the shadows of distrust that loom over Claudius\'s existence.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_private_dining_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Claudius Voices His Grief',
        e.description = 'Claudius, consumed by grief and paranoia, states that the death of his father was a preventable tragedy, attributing it to blunders and negligence. His words reflect not only his sorrow but also a burgeoning distrust of those around him, hinting at deeper suspicions regarding his safety.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["He shouldn't have died, and that's a fact. Somebody blundered, and that's a fact.", "A tragedy for us all. Yes, and for Rome."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Servant\'s Attempt at Normalcy',
        e.description = 'The Servant arrives to announce that the meal is ready, trying to maintain a semblance of normalcy amidst Claudius\'s turmoil. As he tastes food and wine, he engages in trivial conversation, attempting to lighten the mood, but Claudius\'s sharp tongue and growing paranoia disrupt the attempt at ease.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Your meal is ready, Caesar.", "The garlic's a little overdone for my taste.", "Oh, stop showing off."]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Claudius Accuses the Servant',
        e.description = 'In a moment of vulnerability and paranoia, Claudius confronts the Servant, accusing him and his wife of conspiring to poison him. This accusation reveals Claudius\'s deep-seated fears of betrayal, showcasing the psychological strain he faces in his isolated existence. His paranoia transforms a routine meal into a tense confrontation.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Oh, don't butter me up. You know very well who would want to poison me. My wife, that's who.", "Ah, the fact is when you know that someone's trying to poison you, nothing tastes right."]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Reflection on Grief',
        e.description = 'As the Servant exits, Claudius reflects on the death of his father, Drusus, voicing the profound impact it has had on him and Rome. His voiceover adds weight to the scene, emphasizing the larger implications of personal loss intertwined with political legacies, hinting at the sorrow that reverberates through his family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["A tragedy that one should lose one's father so young.", "And especially for my uncle. He was never the same again."]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'A Year\'s Grief in the Garden',
        s.description = 'Under the cloak of night in the palace garden, Emperor Augustus, weary with age and empire, seeks solace in a gentle stroll, supported by his ever-present wife, Livia. The air is heavy with the perfume of night-blooming jasmine, a stark contrast to the somber mood as Augustus reflects on the loss of Drusus, a year past. Young Lucius and Gaius dutifully follow, their eagerness to please highlighting the dynastic pressures at play. Livia, ever pragmatic, steers Augustus away from dwelling on grief, emphasizing Roman stoicism and the need to move forward. As musicians begin to play, Antonia emerges from the palace corridor, her quiet words to Livia underscoring the enduring weight of sorrow that Livia attempts to dismiss. The scene, bathed in the soft light of stars and scented air, reveals the differing ways the imperial family grapples with loss and duty amidst the grandeur of Rome.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_garden'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Emperor\'s Weary Reflection',
        e.description = 'Augustus, leaning on Livia for support, expresses his exhaustion as night falls in the palace garden. He acknowledges the late hour and suggests it\'s time for rest, mentioning Julia and Antonia\'s weariness from the evening\'s events. His thoughts drift to the late Drusus, revealing that even a year later, the loss weighs heavily on him and on Rome.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: Well... Sons of Agrippa, the daylight's fled and stars are out. It's time for decent people to lock their doors and go to sleep.", "AUGUSTUS: Ah, Lucius and Gauis... Poor Julia, she can't take the wine as she used to. And even dear Antonia nods a little.", "AUGUSTUS: Ah, poor Drusus. Yes, yes, yes, I ... I was thinking of him tonight too. Rome cannot afford such a loss."]
    ;
MERGE (e:Event {uuid: 'event_15_2'})
    ON CREATE SET
        e.title = 'Livia\'s Pragmatic Dismissal of Grief',
        e.description = 'Livia, with characteristic Roman stoicism, gently but firmly rebukes Augustus\'s dwelling on Drusus\'s death. She asserts that a year is sufficient time for mourning and that excessive grief is not the Roman way. She redirects his attention to Lucius and Gaius, expressing hope that they will embody the virtues of Drusus, subtly steering the conversation towards the future and away from past sorrow.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: You mustn't dwell on it. A year has gone by and that's quite long enough for grief. Amore is not the Roman way, you know..."]
    ;
MERGE (e:Event {uuid: 'event_15_3'})
    ON CREATE SET
        e.title = 'Musical Escort and Royal Exit',
        e.description = 'To conclude the evening and perhaps to distract from the somber mood, Augustus calls for musicians to play them to sleep. He then exits the garden, leaving Livia and the young princes behind, seeking the solace of music and rest within the palace walls.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: Musicians, play us out. Let us have music that takes us to our sleep."]
    ;
MERGE (e:Event {uuid: 'event_15_4'})
    ON CREATE SET
        e.title = 'Antonia\'s Quiet Rebuke of Livia\'s Stoicism',
        e.description = 'Antonia appears in the palace corridor and addresses Livia, her quiet voice filled with a deep, lingering sorrow. She subtly challenges Livia\'s assertion that a year is enough to overcome grief, her poignant question, \"Is that all it is? One little year...\" revealing the enduring pain of Drusus\'s loss, especially for those who truly loved him. With a simple \"Goodnight, lady,\" she exits, leaving Livia to contemplate the differing depths of grief within the family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["ANTONIA: A year. Is that all it is? One little year... Goodnight, lady."]
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'Confrontation in the Shadows',
        s.description = 'The scene unfolds in the dimly lit corridor of the palace, a space that epitomizes the tension and intrigue of imperial life. Tiberius stands in the shadows, embodying the weight of his inner turmoil and resentment towards his mother, Livia. The night is thick with the echoes of distant revelry, creating a stark contrast to the strained conversation unfolding in the corridor. Livia, partially obscured by the colonnade, commands the scene with her imposing presence, her words dripping with the coldness of maternal control. The tension between mother and son is palpable, as Tiberius’s bitterness spills forth—his discontent directed at Livia\'s ambition and the loss of his brother, Drusus. Amidst this emotional confrontation, the atmosphere is charged with the unspoken bonds of familial loyalty and betrayal, underscoring the larger themes of ambition and sacrifice that permeate their lives. The night air feels heavy, laden with the consequences of their decisions, as Livia\'s chilling ultimatum hangs in the air, solidifying her iron grip on Tiberius\'s fate.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Tiberius\'s Resentment Surfaces',
        e.description = 'Tiberius stands alone in the shadows of the palace corridor, reflecting on his strained relationship with Livia and the loss of his brother, Drusus. His brooding demeanor echoes his internal struggle, as he expresses a desire to escape Rome and the suffocating expectations of his mother. This moment reveals Tiberius\'s vulnerability and bitterness, setting the tone for the confrontation to come.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Pretty sight, isn't she? I must get away from her. I must leave Rome."]
    ;
MERGE (e:Event {uuid: 'event_16_2'})
    ON CREATE SET
        e.title = 'Livia\'s Ultimatum',
        e.description = 'Livia, from her position in the garden, asserts her control over Tiberius, insisting that he must have patience and remain in Rome. Her chilling command reflects her unyielding ambition and maternal manipulation, highlighting the stark contrast between her cold resolve and Tiberius\'s emotional turmoil. This exchange intensifies the existing conflict between them.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["You'll stay. You'll have patience, as I have."]
    ;
MERGE (e:Event {uuid: 'event_16_3'})
    ON CREATE SET
        e.title = 'A Bitter Truth Revealed',
        e.description = 'Tiberius confronts Livia directly, accusing her of losing her grip on power and expressing his disdain for the chaos her ambition has wrought. His words cut deep, revealing the fractures in their relationship and the painful truth of their family\'s dynamics. The emotional weight of this revelation underscores Tiberius\'s struggle and sets the stage for Livia\'s reaction.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Where has your patience got you? You've lost him, mother. You've lost him to those two boys."]
    ;
MERGE (e:Event {uuid: 'event_16_4'})
    ON CREATE SET
        e.title = 'Livia’s Final Threat',
        e.description = 'In a decisive moment, Livia declares that if Tiberius chooses to leave Rome, she will sever their ties permanently without any remorse. This statement encapsulates her ruthless ambition and the lengths she will go to maintain control over her son and the empire. Livia\'s chilling exit reinforces the emotional distance between them, leaving Tiberius alone in the corridor, consumed by his thoughts amidst the distant sounds of revelry.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["If you leave Rome, I'll wash my hands of you, once and for all. And shed not a single tear."]
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'Marital Discord in the Imperial Chambers',
        s.description = 'Night descends upon Julia\'s opulent chambers, yet the atmosphere is far from serene. Julia, Augustus\'s daughter, reclines drunkenly on a couch, her words slurred as Tiberius enters. She makes a crude and unwelcome advance, her drunken state fueling her brazenness and contempt for her husband. Tiberius, already strained and disgusted, is pushed to his breaking point by Julia\'s venomous insults about his masculinity and past relationship. His control snaps, and he retaliates with a violent slap that echoes through the palace. Augustus and Livia, alerted by the commotion, burst into the room, witnessing the raw aftermath of the domestic conflict. Augustus, enraged by the public spectacle and more concerned with maintaining appearances than addressing the root of their misery, vehemently forbids divorce, placing the blame squarely on Julia. Livia, ever watchful, seizes the opportunity to subtly steer Augustus\'s thoughts towards her grandsons, positioning them as the dynasty\'s hope amidst the familial chaos. Despite the raw emotions and visible dysfunction, Augustus, grasping for an illusion of control, attempts to force a picture of familial unity, blind to the deep fissures within.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_julias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Julia\'s Drunken Advance',
        e.description = 'Julia, inebriated and sprawled on a couch, awakens as Tiberius enters her chambers. In a haze of alcohol and resentment, she crudely invites him to sleep with her, her words laced with sarcasm and sexual provocation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["JULIA: Have they all gone? Ummm, Tiberius, I was having such a beautiful dream. Tiberius... sleep with me tonight. I'll be sure to... Tonight... Don't be. Just tonight."]
    ;
MERGE (e:Event {uuid: 'event_17_2'})
    ON CREATE SET
        e.title = 'Tiberius Slaps Julia',
        e.description = 'Julia\'s provocative invitation quickly turns to personal attacks. She insults Tiberius\'s physique and cruelly compares a male prostitute to his deceased ex-wife, Vipsania. Enraged and humiliated, Tiberius loses control and slaps Julia violently across the face.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["JULIA: Fat! Fat! If I'm fat, I'm fat where a woman should be fat, not skinny like a boy. Go to bed my dear and I'll send you one up. He's very pretty, I promise you. I've had him myself. HaHa... He reminds me of your ex-wife. Not a hair on his body and he's even skinnier behind.", "TIBERIUS: Let me go, you fat drunken cow!"]
    ;
MERGE (e:Event {uuid: 'event_17_3'})
    ON CREATE SET
        e.title = 'Augustus Enters, Forbids Divorce',
        e.description = 'The resounding slap brings Augustus storming into Julia\'s chambers, closely followed by Livia. Witnessing Julia\'s distress and Tiberius\'s aggression, Augustus\'s immediate concern is not for Julia\'s well-being but for the stability of the marriage and the appearance of order. He explodes with anger, vehemently denying any possibility of divorce and shifting blame onto both Julia and Tiberius.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: There'll be no divorce! None! I don't care what he is. You married him and that's the end of it.", "AUGUSTUS: Look what he did. Look what your son did to my daughter. Now what kind of man is that, tell me? I've never liked him, never. He's your son Livia, but I have to tell you that I've never liked him.", "JULIA: I want a divorce!", "AUGUSTUS: No divorce! You've been married three times already, how many more marriages do you want?", "JULIA: That's not my fault, I was widowed twice!", "AUGUSTUS: Well, how a woman can get herself widowed twice is beyond me.", "JULIA: That's not fair!", "AUGUSTUS: Well, it shows damn poor judgment, that's all I can say.", "JULIA: I never asked to be married to Agrippa.", "AUGUSTUS: You asked to be married to this one and married you'll stay! As for that husband of yours, he can clear out of Rome, I'm finished with him! Tell him to pack his bags and go! I don't even want to see him. I never want his name mentioned in this house again, ever!", "JULIA: Well, how am I supposed to live, neither married nor divorced!", "AUGUSTUS: You'll live as befits a Roman matron, that's how you'll live. And heaven help you if you don't!"]
    ;
MERGE (e:Event {uuid: 'event_17_4'})
    ON CREATE SET
        e.title = 'Julia Exits, Augustus\'s Frustration',
        e.description = 'Overwhelmed and unheard, Julia exits the chambers in tears. Augustus, left with Livia, expresses his profound frustration and despair at his inability to control his own family, contrasting it with his command over the vast empire. He then shifts his focus to Agrippa\'s sons, Livia\'s grandsons, seeing them as his only hope for the future.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Ohhh! Oh, I don't know. Oh. Why can't they get on? I mean, what do they want from life? I'm supposed to rule an empire, I can't even rule my own family. Well, thank god for these boys, that's all I can say. Well, you'll help me, won't you? I mean, what would we do without these boys Livia, without Agrippa's sons? They're our one hope."]
    ;
MERGE (e:Event {uuid: 'event_17_5'})
    ON CREATE SET
        e.title = 'Livia\'s Manipulation and Forced Family Image',
        e.description = 'Livia, with calculated subtlety, agrees with Augustus\'s assessment of her grandsons, emphasizing their promise while also hinting at their youth and the long road ahead, subtly reminding Augustus of his mortality and the need for her continued influence. Augustus, momentarily reassured and desperately wanting to project an image of familial harmony, forces a smile and declares the scene a representation of the \'true spirit of the Roman family,\' even as the preceding conflict starkly contradicts this forced optimism. A flicker of unease crosses his face as he looks at Livia, sensing the undercurrent of her ambition, before he forces a smile and the scene fades to black.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: Oh, they're promising alright. Aren't you, my little beauties? Very promising. Still, you've a long way to go, haven't you? A long, long way. We must take good care of them Augustus. And we shall, I promise you. The very best of care.", "AUGUSTUS: Ah, that's how it should be. Stay like that a moment. What a picture you make. It expresses the true spirit of the Roman family."]
    ;
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gaius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guardsman_1'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guardsman_2'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_board_game'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dice'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_legions_game_pieces'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_makeshift_bed'}),
          (a:Agent {uuid: 'org_roman_legion'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_water_basin'}),
          (a:Agent {uuid: 'org_roman_legion'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_letter_from_caesar'}),
          (a:Agent {uuid: 'agent_augustus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_history_of_family_scroll'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_history_of_etruscans_book'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guardsman_1'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guardsman_2'}),
          (o:Organization {uuid: 'org_roman_legion'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gaius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_exercise_ball_event_1_1'})
    ON CREATE SET
        oi.description = 'The exercise ball is utilized by Drusus and Tiberius as a central prop during their courtyard exercise. It is thrown between the brothers, initiating their physical interaction and serving as a catalyst for their playful yet competitive exchange. The act of throwing and catching the ball precedes and transitions into their wrestling match, highlighting the ball\'s role in escalating the scene from simple exercise to physical sparring and brotherly competition. It functions as a tool to instigate and underscore the contrast in their physical states and personalities, setting the stage for their dialogue and revealing their dynamic.',
        oi.status_before = 'The exercise ball is ready for use in the Claudian Villa courtyard, likely stored nearby and in good condition for physical activity. Its specific location prior to the scene is not detailed, but it is readily available for Drusus and Tiberius\'s exercise.',
        oi.status_after = 'The exercise ball remains in the Claudian Villa courtyard after Drusus and Tiberius conclude their physical sparring. Its condition and location are likely unchanged; it is still available for future use. The ball\'s narrative function is primarily realized within the event itself, and its status remains consistent before and after the brothers\' exercise session.'
    WITH oi
    MATCH (o:Object {uuid: 'object_exercise_ball'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Drusus is physically dominating the courtyard exercise, robustly throwing the exercise ball and engaging in a wrestling match with Tiberius. He moves with the assuredness of a seasoned soldier, easily gaining the upper hand in their physical contest and maintaining a strong, upright posture throughout the scene, demonstrating his superior fitness compared to his brother.',
        ap.emotional_state = 'Drusus is in a lighthearted and playful mood, evident in his teasing banter with Tiberius about his physical condition and courtly softness. Beneath the surface of brotherly jesting, there\'s a hint of genuine concern for Tiberius\'s well-being and a subtle encouragement for him to reclaim his former martial vigor. He displays confidence and amusement, enjoying the physical sparring and the opportunity to engage with his brother in a familiar, competitive way.',
        ap.emotional_tags = ["drusus is in a lighthearted", "playful mood, evident in his teasing banter with tiberius about his physical condition", "courtly softness. beneath the surface of brotherly jesting, there's a hint of genuine concern for tiberius's well-being", "a subtle encouragement for him to reclaim his former martial vigor. he displays confidence", "amusement, enjoying the physical sparring", "the opportunity to engage with his brother in a familiar, competitive way.", "drusus is in a lighthearted and playful mood", "evident in his teasing banter with tiberius about his physical condition and courtly softness. beneath the surface of brotherly jesting", "there's a hint of genuine concern for tiberius's well-being and a subtle encouragement for him to reclaim his former martial vigor. he displays confidence and amusement", "enjoying the physical sparring and the opportunity to engage with his brother in a familiar", "competitive way."],
        ap.active_plans = ["To engage in a rigorous physical workout with Tiberius in the courtyard.", "To playfully tease and motivate Tiberius to improve his physical fitness and shed his 'courtly softness'.", "To reaffirm their brotherly bond through physical competition and lighthearted banter, maintaining a familiar dynamic despite their different life paths."],
        ap.beliefs = ["Physical prowess and military discipline are essential virtues for a Roman man.", "Brotherly competition and teasing are acceptable and even beneficial ways to strengthen their relationship.", "A life of military service is inherently more honorable and fulfilling than a life confined to the Roman court."],
        ap.goals = ["Short-term: To enjoy a spirited physical exercise session with Tiberius and win their wrestling match.", "Medium-term: To inspire Tiberius to reconsider his sedentary court life and perhaps return to a more active, military-oriented role.", "Ultimate: To maintain a close and supportive relationship with Tiberius, despite their differing paths, and see him find fulfillment and purpose."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius participates in the courtyard exercise with Drusus, though with less enthusiasm and physical prowess. He is shown struggling during their wrestling match, quickly overpowered by Drusus and ending up on the ground. While engaging physically, his posture is less assured, reflecting his discomfort with the physical exertion and his current state of being.',
        ap.emotional_state = 'Tiberius is initially defensive and irritable in response to Drusus\'s teasing about his physical condition, revealing a sensitivity to his perceived decline in fitness and status. Beneath this defensiveness, there is a deep current of melancholy and longing for his past life as a soldier, contrasted sharply with his present, dissatisfying role in the Roman court. He expresses bitterness about his marriage to Julia and resentment towards his current duties, showcasing a profound unhappiness masked by sarcasm and forced participation.',
        ap.emotional_tags = ["tiberius is initially defensive", "irritable in response to drusus's teasing about his physical condition, revealing a sensitivity to his perceived decline in fitness", "status. beneath this defensiveness, there is a deep current of melancholy", "longing for his past life as a soldier, contrasted sharply with his present, dissatisfying role in the roman court. he expresses bitterness about his marriage to julia", "resentment towards his current duties, showcasing a profound unhappiness masked by sarcasm", "forced participation.", "tiberius is initially defensive and irritable in response to drusus's teasing about his physical condition", "revealing a sensitivity to his perceived decline in fitness and status. beneath this defensiveness", "there is a deep current of melancholy and longing for his past life as a soldier", "contrasted sharply with his present", "dissatisfying role in the roman court. he expresses bitterness about his marriage to julia and resentment towards his current duties", "showcasing a profound unhappiness masked by sarcasm and forced participation."],
        ap.active_plans = ["To reluctantly participate in the physical exercise initiated by Drusus, despite his lack of enthusiasm.", "To deflect Drusus's playful mockery with sarcasm and cynical remarks about court life and his personal burdens.", "To express his deep dissatisfaction with his current life in Rome and voice his yearning for his past military identity and purpose."],
        ap.beliefs = ["His past military service was the most meaningful and fulfilling period of his life, offering genuine purpose and camaraderie.", "His current duties in Rome are trivial, emasculating, and beneath his capabilities as a seasoned military commander.", "His forced marriage to Julia is a source of constant misery and represents the political manipulation that defines his life."],
        ap.goals = ["Short-term: To endure the physical exercise session with Drusus and avoid further humiliation in their physical contest.", "Medium-term: To somehow escape his current, unwanted role in Roman court life and potentially return to a position of military command, regaining a sense of purpose.", "Ultimate: To find genuine fulfillment and escape the perceived prison of his imperial duties, likely by returning to a life of military action and leadership, and to alleviate his deep unhappiness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Drusus stands robustly in the sunlit courtyard, his body language exuding confidence as he engages in wrestling with Tiberius. He moves with playful aggression, urging his brother to be more assertive as they grapple, his laughter echoing against the statues of Roman heroes. His posture is relaxed yet competitive, reflecting his military training and camaraderie.',
        ap.emotional_state = 'Drusus displays surface-level joviality and teasing confidence, enjoying the physical exertion and banter with Tiberius. However, beneath this playful exterior, he harbors a sense of concern for his brother\'s well-being and the burdens he carries. There\'s an unspoken awareness of Tiberius’s dissatisfaction with their current lives, casting a shadow over their spirited exchange.',
        ap.emotional_tags = ["drusus displays surface-level joviality", "teasing confidence, enjoying the physical exertion", "banter with tiberius. however, beneath this playful exterior, he harbors a sense of concern for his brother's well-being", "the burdens he carries. there's an unspoken awareness of tiberius\u2019s dissatisfaction with their current lives, casting a shadow over their spirited exchange.", "drusus displays surface-level joviality and teasing confidence", "enjoying the physical exertion and banter with tiberius. however", "beneath this playful exterior", "he harbors a sense of concern for his brother's well-being and the burdens he carries. there's an unspoken awareness of tiberius\u2019s dissatisfaction with their current lives", "casting a shadow over their spirited exchange."],
        ap.active_plans = ["Encourage Tiberius to engage more physically and shed his courtly concerns.", "Remind Tiberius of the glory and camaraderie of military life to alleviate his melancholy.", "Maintain a light-hearted atmosphere to counter any underlying tensions between them."],
        ap.beliefs = ["Physical strength and competition are ways to bond as brothers.", "The military lifestyle is the epitome of Roman virtue, and Tiberius should embrace it.", "Loyalty and loyalty to family are paramount, even in jest."],
        ap.goals = ["Short-term: To energize Tiberius through playful competition and physical exertion.", "Medium-term: To rekindle Tiberius's passion for military life instead of courtly duties.", "Ultimate: To strengthen their brotherly bond against external pressures from their family's ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands in the sunny courtyard, engaged in spirited wrestling with Drusus, his movements juxtaposed with a sense of restrained frustration. Though he exerts himself physically, there is a tension in his posture that reveals the weight of his obligations. As the session progresses, he oscillates between playful banter and moments of melancholic reflection regarding his past.',
        ap.emotional_state = 'Tiberius oscillates between playful competitiveness and simmering resentment. Outwardly, he attempts to keep the mood light, but beneath the surface, he is burdened by feelings of entrapment, longing for the freedom and excitement of his military past. His frustrations about court life and his marital situation with Julia loom large, creating a palpable tension between his words and his true feelings.',
        ap.emotional_tags = ["tiberius oscillates between playful competitiveness", "simmering resentment. outwardly, he attempts to keep the mood light, but beneath the surface, he is burdened by feelings of entrapment, longing for the freedom", "excitement of his military past. his frustrations about court life", "his marital situation with julia loom large, creating a palpable tension between his words", "his true feelings.", "tiberius oscillates between playful competitiveness and simmering resentment. outwardly", "he attempts to keep the mood light", "but beneath the surface", "he is burdened by feelings of entrapment", "longing for the freedom and excitement of his military past. his frustrations about court life and his marital situation with julia loom large", "creating a palpable tension between his words and his true feelings.", "tiberius oscillates between playful competitiveness and simmering resentment. outwardly, he attempts to keep the mood light,", "beneath the surface, he is burdened by feelings of entrapment, longing for the freedom and excitement of his military past. his frustrations about court life and his marital situation with julia loom large, creating a palpable tension between his words and his true feelings."],
        ap.active_plans = ["Participate in the wrestling match to maintain brotherly camaraderie.", "Express his frustrations regarding his current duties and marital situation indirectly through the conversation.", "Recollect fond memories of military life to connect with Drusus and momentarily escape his reality."],
        ap.beliefs = ["Military life represents true freedom and fulfillment compared to his current existence.", "His role as a soldier was defined by honor, camaraderie, and respect, which he deeply misses.", "Family ties, although strained, are important and should be nurtured despite his dissatisfaction."],
        ap.goals = ["Short-term: To engage in physical activity to momentarily escape the confines of court life.", "Medium-term: To articulate his frustrations with the hope of finding understanding and support from Drusus.", "Ultimate: To reclaim a sense of agency and purpose outside of his imposed responsibilities within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Julia reclines languidly on a marble bench in the opulent bathhouse, her foot being attended to by a slave who massages her toe. She is engaged in an intimate conversation with Antonia, her posture relaxed yet conveying a simmering tension beneath the surface as she vents her marital frustrations.',
        ap.emotional_state = 'Julia is a whirlwind of exasperation and bitter humor. Outwardly, she adopts a sarcastic and dismissive tone when speaking about Tiberius, making light of his coldness with cutting remarks and exaggerated anecdotes about Vipsania\'s thinness. Beneath this sharp facade, however, lies a deep well of hurt and disillusionment. She is genuinely wounded by Tiberius\'s emotional unavailability and yearns for the affection she feels denied.',
        ap.emotional_tags = ["julia is a whirlwind of exasperation", "bitter humor. outwardly, she adopts a sarcastic", "dismissive tone when speaking about tiberius, making light of his coldness with cutting remarks", "exaggerated anecdotes about vipsania's thinness. beneath this sharp facade, however, lies a deep well of hurt", "disillusionment. she is genuinely wounded by tiberius's emotional unavailability", "yearns for the affection she feels denied.", "julia is a whirlwind of exasperation and bitter humor. outwardly", "she adopts a sarcastic and dismissive tone when speaking about tiberius", "making light of his coldness with cutting remarks and exaggerated anecdotes about vipsania's thinness. beneath this sharp facade", "however", "lies a deep well of hurt and disillusionment. she is genuinely wounded by tiberius's emotional unavailability and yearns for the affection she feels denied."],
        ap.active_plans = ["Express her profound unhappiness and frustration with her marriage to Tiberius to a sympathetic ear.", "Seek validation and understanding from Antonia regarding the intolerable coldness and distance in her relationship with Tiberius.", "Explore the potential machinations of Livia in her life, hinting at a long-held suspicion about Livia's manipulative nature and past actions."],
        ap.beliefs = ["Tiberius is fundamentally incapable of emotional warmth or genuine connection, describing him as colder than snow.", "Her marriage to Tiberius is a loveless political arrangement orchestrated by Livia, not born out of any affection or desire on Tiberius's part.", "Livia is a manipulative and potentially dangerous force in her life and the imperial family, capable of orchestrating events to achieve her own ends."],
        ap.goals = ["Short-term: To find emotional release and catharsis by vocalizing her grievances about Tiberius and her marriage.", "Medium-term: To foster a sense of solidarity and understanding with Antonia, strengthening their bond through shared confidences.", "Ultimate: To perhaps find a path towards emotional fulfillment and happiness, even if it means acknowledging the irreparable damage in her marriage and seeking solace elsewhere."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Antonia is positioned beside Julia in the steam-filled bathhouse, reclining calmly on a marble bench. She listens attentively to Julia\'s outpouring, her posture composed and empathetic, offering a quiet and receptive presence amidst Julia\'s passionate complaints.',
        ap.emotional_state = 'Antonia embodies quiet empathy and thoughtful consideration. She listens with patience and understanding to Julia’s passionate outburst, her surface emotions reflecting a gentle concern for Julia\'s distress. Internally, she is processing Julia\'s revelations with a keen and discerning mind, likely reflecting on her own observations of Tiberius and the dynamics within the imperial family. There\'s a subtle undercurrent of sadness, perhaps recognizing the tragic nature of Julia\'s situation and the pervasive unhappiness within the dynasty.',
        ap.emotional_tags = ["antonia embodies quiet empathy", "thoughtful consideration. she listens with patience", "understanding to julia\u2019s passionate outburst, her surface emotions reflecting a gentle concern for julia's distress. internally, she is processing julia's revelations with a keen", "discerning mind, likely reflecting on her own observations of tiberius", "the dynamics within the imperial family. there's a subtle undercurrent of sadness, perhaps recognizing the tragic nature of julia's situation", "the pervasive unhappiness within the dynasty.", "antonia embodies quiet empathy and thoughtful consideration. she listens with patience and understanding to julia\u2019s passionate outburst", "her surface emotions reflecting a gentle concern for julia's distress. internally", "she is processing julia's revelations with a keen and discerning mind", "likely reflecting on her own observations of tiberius and the dynamics within the imperial family. there's a subtle undercurrent of sadness", "perhaps recognizing the tragic nature of julia's situation and the pervasive unhappiness within the dynasty."],
        ap.active_plans = ["Offer a safe and non-judgmental space for Julia to express her deepest marital frustrations.", "Provide a balanced perspective by referencing Drusus's memories of Tiberius, attempting to offer a more nuanced understanding of Tiberius's character.", "Maintain a supportive and comforting presence for Julia, acting as a confidante and trusted friend in the midst of familial tensions."],
        ap.beliefs = ["Tiberius's emotional distance is likely rooted in his past experiences, particularly his forced divorce from Vipsania, which has profoundly shaped his personality.", "Augustus bears some responsibility for Julia's unhappiness by prioritizing political expediency over personal compatibility in arranging her marriage.", "Livia is a powerful and influential figure within the imperial family, capable of shaping events and manipulating relationships to achieve her ambitions."],
        ap.goals = ["Short-term: To provide emotional support and comfort to Julia, alleviating some of her immediate distress through empathetic listening.", "Medium-term: To gain a deeper understanding of the complexities of Julia's marital unhappiness and the underlying tensions within the imperial family.", "Ultimate: To strengthen her bond with Julia through trust and shared confidences, fostering a supportive relationship amidst the treacherous currents of Roman court life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Drusus is not physically present in the scene, existing solely as a memory invoked by Antonia. His past self is referenced in conversation, his brotherly relationship with Tiberius serving as a point of comparison to highlight Tiberius\'s current emotional state.',
        ap.emotional_state = 'Though not present, the mention of Drusus evokes a sense of warmth and nostalgia. Antonia recalls Drusus\'s positive memories of Tiberius as a child, suggesting a time when Tiberius was more open and capable of joy. This recollection creates a poignant contrast with Julia\'s description of Tiberius\'s current coldness, implying a sense of loss and perhaps sadness at the change in Tiberius.',
        ap.emotional_tags = ["though not present, the mention of drusus evokes a sense of warmth", "nostalgia. antonia recalls drusus's positive memories of tiberius as a child, suggesting a time when tiberius was more open", "capable of joy. this recollection creates a poignant contrast with julia's description of tiberius's current coldness, implying a sense of loss", "perhaps sadness at the change in tiberius.", "though not present", "the mention of drusus evokes a sense of warmth and nostalgia. antonia recalls drusus's positive memories of tiberius as a child", "suggesting a time when tiberius was more open and capable of joy. this recollection creates a poignant contrast with julia's description of tiberius's current coldness", "implying a sense of loss and perhaps sadness at the change in tiberius."],
        ap.active_plans = ["No active plans in the present event. His past actions and personality, as remembered by Antonia, serve to offer context and a contrasting perspective on Tiberius's character.", "In the past, Drusus's plan, as suggested by Antonia's words, was to maintain a close and brotherly relationship with Tiberius, characterized by laughter and camaraderie.", "His past actions and personality indirectly serve Antonia's plan to offer Julia a more nuanced understanding of Tiberius by recalling a time when he was different."],
        ap.beliefs = ["Past belief: Drusus believed that despite Tiberius's brooding nature, he was fundamentally capable of warmth and laughter, a belief formed through their brotherly bond.", "Past belief: Drusus likely believed in the importance of familial bonds and brotherly affection, based on Antonia's recollection of their shared memories.", "Implied belief through Antonia's recollection:  That Tiberius's current coldness is perhaps a learned or developed trait, not an inherent characteristic, contrasting with the Tiberius Drusus knew."],
        ap.goals = ["Short-term: No short-term goals in the present event. His memory serves to influence the current conversation.", "Medium-term: Past goal: To maintain a strong and positive brotherly relationship with Tiberius, marked by understanding and shared moments of joy.", "Ultimate: Past goal: To foster a supportive and enduring familial bond with Tiberius, contributing to the stability and strength of their family unit (though this is implied, not explicitly stated)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Julia reclines on a marble bench, her beauty accentuated by the opulence of the bathhouse. She gestures animatedly, her sharp wit sharp as ever, as she discusses Tiberius\'s shortcomings and engages in playful banter with Antonia. Her posture is relaxed yet tinged with underlying tension as she navigates her dissatisfaction.',
        ap.emotional_state = 'On the surface, Julia\'s tone is humorous and mocking, revealing her frustration with Tiberius. Beneath this playful exterior, she harbors deep-seated insecurities about her marriage and resentment towards Vipsania. Her emotional contradictions surface as she attempts to mask vulnerability with sarcasm.',
        ap.emotional_tags = ["on the surface, julia's tone is humorous", "mocking, revealing her frustration with tiberius. beneath this playful exterior, she harbors deep-seated insecurities about her marriage", "resentment towards vipsania. her emotional contradictions surface as she attempts to mask vulnerability with sarcasm.", "on the surface", "julia's tone is humorous and mocking", "revealing her frustration with tiberius. beneath this playful exterior", "she harbors deep-seated insecurities about her marriage and resentment towards vipsania. her emotional contradictions surface as she attempts to mask vulnerability with sarcasm."],
        ap.active_plans = ["Express her frustrations about Tiberius to Antonia.", "Subtly criticize Vipsania to assert her own worth and validate her feelings of inadequacy.", "Seek emotional support from Antonia while navigating her complex feelings about her marriage."],
        ap.beliefs = ["Marriage should be based on affection, not political convenience.", "She deserves a partner who values her and her children.", "Livia's manipulations are detrimental to her happiness and familial bonds."],
        ap.goals = ["Short-term: Seek empathy and validation from Antonia regarding her frustrations with Tiberius.", "Medium-term: Find a way to navigate her marriage and assert her independence.", "Ultimate: Achieve genuine affection and autonomy within her life, free from the constraints of political obligation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Antonia sits poised beside Julia, her demeanor calm and attentive. She listens intently, occasionally interjecting with thoughtful commentary. As a support system for Julia, she exhibits a gentle strength, her posture conveying both openness and concern as she navigates the conversation\'s shifting emotional landscape.',
        ap.emotional_state = 'Antonia presents a composed exterior, grounded in understanding and empathy. However, she internalizes the tension surrounding Julia’s discontent and the implications of Tiberius\'s behavior. Her concern for her cousin is matched by a frustration over the political machinations threatening her family.',
        ap.emotional_tags = ["antonia presents a composed exterior, grounded in understanding", "empathy. however, she internalizes the tension surrounding julia\u2019s discontent", "the implications of tiberius's behavior. her concern for her cousin is matched by a frustration over the political machinations threatening her family.", "antonia presents a composed exterior", "grounded in understanding and empathy. however", "she internalizes the tension surrounding julia\u2019s discontent and the implications of tiberius's behavior. her concern for her cousin is matched by a frustration over the political machinations threatening her family."],
        ap.active_plans = ["Offer support and friendship to Julia as she expresses her concerns.", "Provide insight into Tiberius's character based on her observations and experiences.", "Encourage Julia to reflect on her feelings without judgment, fostering an open dialogue about their predicaments."],
        ap.beliefs = ["Loyalty and familial support are paramount in navigating the treachery of court life.", "Tiberius\u2019s coldness is a result of external pressures rather than personal failings.", "Women in the imperial family deserve understanding and compassion amidst their struggles."],
        ap.goals = ["Short-term: Help Julia articulate her frustrations and feel validated.", "Medium-term: Strengthen her bond with Julia by providing emotional support.", "Ultimate: Foster a sense of unity among the women in the family against the backdrop of imperial pressures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Though not physically present in the bathhouse, Drusus’s influence looms large over the conversation. Julia references his past relationship with Tiberius as a point of comparison, indicating his presence in the dialogue and the dynamics at play within the family.',
        ap.emotional_state = 'Drusus’s emotional state is conveyed through Julia’s reflections, suggesting a tone of nostalgia and fondness. His perceived ability to lighten Tiberius’s mood serves as a contrast to Tiberius\'s current demeanor, highlighting the tension and loss felt in the family dynamics since Drusus\'s decline.',
        ap.emotional_tags = ["drusus\u2019s emotional state is conveyed through julia\u2019s reflections, suggesting a tone of nostalgia", "fondness. his perceived ability to lighten tiberius\u2019s mood serves as a contrast to tiberius's current demeanor, highlighting the tension", "loss felt in the family dynamics since drusus's decline.", "drusus\u2019s emotional state is conveyed through julia\u2019s reflections", "suggesting a tone of nostalgia and fondness. his perceived ability to lighten tiberius\u2019s mood serves as a contrast to tiberius's current demeanor", "highlighting the tension and loss felt in the family dynamics since drusus's decline."],
        ap.active_plans = ["Be remembered fondly as a source of joy and laughter in Tiberius's life.", "Serve as a benchmark for familial relationships, particularly in relation to Tiberius\u2019s behavior.", "Influence Julia's perspective on Tiberius by being a topic of discussion."],
        ap.beliefs = ["Siblings should share a bond of camaraderie and support despite political strife.", "Joy and laughter are crucial elements in maintaining family unity.", "The weight of duty impacts their relationships, obscuring the genuine connections they once shared."],
        ap.goals = ["Short-term: Remain a positive memory in the minds of his loved ones amid current tensions.", "Medium-term: Encourage stronger familial bonds based on shared experiences and memories.", "Ultimate: Ensure that his legacy includes the values of loyalty and family despite the growing complexities of their dynastic struggles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Julia reclines languidly on a marble bench in the steamy bathhouse, one foot extended as a slave attends to her toes. She gestures dismissively with a hand adorned with rings, her posture conveying a practiced nonchalance even as her sharp words reveal simmering discontent. She engages Antonia in a seemingly casual conversation, her body language suggesting a performance of ease while her words drip with cynicism.',
        ap.emotional_state = 'Beneath a veneer of witty disdain, Julia simmers with deep-seated insecurity and bitterness. Outwardly, she mocks Tiberius\'s past affection for Vipsania with cutting remarks and exaggerated comparisons. However, her repeated returns to the subject and the intensity of her sarcasm betray a profound jealousy and hurt. She is masking her pain with bravado, yet her need to belittle Vipsania reveals her own vulnerability and the emotional void in her marriage. There is a clear tension between her public persona of a confident imperial daughter and her private anguish.',
        ap.emotional_tags = ["beneath a veneer of witty disdain, julia simmers with deep-seated insecurity", "bitterness. outwardly, she mocks tiberius's past affection for vipsania with cutting remarks", "exaggerated comparisons. however, her repeated returns to the subject", "the intensity of her sarcasm betray a profound jealousy", "hurt. she is masking her pain with bravado, yet her need to belittle vipsania reveals her own vulnerability", "the emotional void in her marriage. there is a clear tension between her public persona of a confident imperial daughter", "her private anguish.", "beneath a veneer of witty disdain", "julia simmers with deep-seated insecurity and bitterness. outwardly", "she mocks tiberius's past affection for vipsania with cutting remarks and exaggerated comparisons. however", "her repeated returns to the subject and the intensity of her sarcasm betray a profound jealousy and hurt. she is masking her pain with bravado", "yet her need to belittle vipsania reveals her own vulnerability and the emotional void in her marriage. there is a clear tension between her public persona of a confident imperial daughter and her private anguish."],
        ap.active_plans = ["To express her deep-seated resentment and jealousy regarding Tiberius's previous relationship with Vipsania.", "To seek validation from Antonia by emphasizing Vipsania's perceived insignificance and her own supposed desirability.", "To subtly gauge Antonia's reaction to her marital complaints, seeking confirmation of her own unhappiness and justification for her feelings."],
        ap.beliefs = ["Her political marriage to Tiberius has robbed her of genuine love and emotional fulfillment.", "Tiberius's past affection for Vipsania is an incomprehensible and insulting affront to her own self-worth.", "She deserves a passionate and attentive husband, and her current loveless situation is a direct result of Livia's manipulative schemes and her father's political pragmatism."],
        ap.goals = ["Short-term: To alleviate her immediate frustration and bitterness by vocalizing her grievances to a sympathetic ear.", "Medium-term: To understand the nature of Tiberius's past love for Vipsania, perhaps in a misguided attempt to compete with a ghost and reclaim his affection.", "Ultimate: To escape the emotional aridity of her marriage and find genuine love and happiness, even if it means defying societal expectations or seeking solace outside of her current union."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Antonia reclines gracefully beside Julia in the opulent bathhouse, her posture composed and attentive. She listens intently as Julia vents her frustrations, offering soft murmurs of acknowledgement and occasional gentle probes to encourage Julia to elaborate. Her physical presence is relaxed, mirroring the spa setting, yet her focused gaze and subtle shifts in posture indicate a deep engagement with Julia\'s emotional state. She is a picture of calm empathy amidst Julia\'s storm of discontent.',
        ap.emotional_state = 'Antonia projects an aura of serene composure, her outward demeanor one of patient listening and quiet sympathy. Internally, she is deeply concerned for Julia\'s well-being and recognizes the genuine pain beneath Julia\'s sharp cynicism.  While she offers a comforting presence, there\'s a subtle undercurrent of sadness, perhaps born from her own understanding of the constraints placed upon women in their society and the limited options available to Julia within the imperial family.  She balances genuine empathy with a measured reserve, aware of the delicate and potentially treacherous nature of courtly confidences.',
        ap.emotional_tags = ["antonia projects an aura of serene composure, her outward demeanor one of patient listening", "quiet sympathy. internally, she is deeply concerned for julia's well-being", "recognizes the genuine pain beneath julia's sharp cynicism.  while she offers a comforting presence, there's a subtle undercurrent of sadness, perhaps born from her own understanding of the constraints placed upon women in their society", "the limited options available to julia within the imperial family.  she balances genuine empathy with a measured reserve, aware of the delicate", "potentially treacherous nature of courtly confidences.", "antonia projects an aura of serene composure", "her outward demeanor one of patient listening and quiet sympathy. internally", "she is deeply concerned for julia's well-being and recognizes the genuine pain beneath julia's sharp cynicism.  while she offers a comforting presence", "there's a subtle undercurrent of sadness", "perhaps born from her own understanding of the constraints placed upon women in their society and the limited options available to julia within the imperial family.  she balances genuine empathy with a measured reserve", "aware of the delicate and potentially treacherous nature of courtly confidences."],
        ap.active_plans = ["To provide a safe and supportive space for Julia to express her pent-up emotions and marital frustrations.", "To offer empathetic listening and validate Julia's feelings of unhappiness and isolation within her marriage.", "To maintain a sense of decorum and avoid becoming entangled in courtly gossip or political intrigue while still offering genuine friendship and support to Julia."],
        ap.beliefs = ["Julia is genuinely suffering in her loveless marriage and deserves compassion and understanding.", "Political marriages within their family are often detrimental to personal happiness and emotional well-being.", "Friendship and familial support are crucial for navigating the complexities and pressures of imperial life, and she has a duty to support Julia as her cousin."],
        ap.goals = ["Short-term: To offer immediate emotional comfort and a sense of being heard to Julia in her moment of distress.", "Medium-term: To strengthen her bond of friendship and trust with Julia by being a reliable confidante and source of support.", "Ultimate: To foster a sense of familial solidarity and compassion within the imperial family, even amidst the prevailing atmosphere of ambition and political maneuvering, and to help Julia find some measure of peace or resolution in her difficult situation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Julia reclines on a marble bench in the opulent bathhouse, her beauty accentuated by the steam that envelops the room. She gestures animatedly, her foot being attended to by a slave, as she shares her frustrations about Tiberius with Antonia, her voice laced with sarcasm and bitterness.',
        ap.emotional_state = 'Julia oscillates between playful banter and deep-seated frustration. While she maintains a sharp wit, a current of despair runs beneath her words, revealing her feelings of betrayal and isolation in her marital relationship with Tiberius. Her anger and sarcasm mask a deeper longing for affection and connection.',
        ap.emotional_tags = ["julia oscillates between playful banter", "deep-seated frustration. while she maintains a sharp wit, a current of despair runs beneath her words, revealing her feelings of betrayal", "isolation in her marital relationship with tiberius. her anger", "sarcasm mask a deeper longing for affection", "connection.", "julia oscillates between playful banter and deep-seated frustration. while she maintains a sharp wit", "a current of despair runs beneath her words", "revealing her feelings of betrayal and isolation in her marital relationship with tiberius. her anger and sarcasm mask a deeper longing for affection and connection."],
        ap.active_plans = ["To express her grievances about Tiberius and highlight the emotional distance in their relationship.", "To draw Antonia into a shared understanding of their mutual struggles, creating a bond through their shared discontent.", "To subtly hint at her suspicions regarding Livia's involvement in past tragedies, seeking validation for her dark thoughts."],
        ap.beliefs = ["She believes that familial relationships are entangled with political machinations, thinking Livia's ambitions come at a personal cost.", "Julia holds the conviction that personal suffering should not be ignored, and that the truth about Livia's influence must be acknowledged.", "She thinks women in her position must navigate a treacherous landscape of ambition and betrayal, often at the cost of their happiness."],
        ap.goals = ["Short-term: To vent her frustrations about Tiberius and seek empathy from Antonia.", "Medium-term: To uncover the truth about Livia's possible involvement in her past tragedies.", "Ultimate: To reclaim agency in her life amidst the suffocating expectations of her marriage and family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Antonia sits beside Julia, her demeanor calm and composed, as she listens intently to Julia\'s words. She occasionally interjects with thoughtful comments, demonstrating her understanding and concern for Julia\'s feelings, while also maintaining a level of caution regarding the sensitive topics discussed.',
        ap.emotional_state = 'Antonia embodies a protective emotional stance, feeling a mixture of empathy for Julia\'s plight and disbelief at her harsh comments. There’s a tension between her desire to support Julia and her concern over the implications of the darker suspicions Julia hints at regarding Livia.',
        ap.emotional_tags = ["antonia embodies a protective emotional stance, feeling a mixture of empathy for julia's plight", "disbelief at her harsh comments. there\u2019s a tension between her desire to support julia", "her concern over the implications of the darker suspicions julia hints at regarding livia.", "antonia embodies a protective emotional stance", "feeling a mixture of empathy for julia's plight and disbelief at her harsh comments. there\u2019s a tension between her desire to support julia and her concern over the implications of the darker suspicions julia hints at regarding livia."],
        ap.active_plans = ["To listen actively to Julia's grievances while providing a calming presence.", "To gently challenge Julia's harsher remarks about Tiberius and assess the validity of her darker suspicions.", "To maintain her role as a confidante while navigating the emotional landscape created by Julia's comments."],
        ap.beliefs = ["Antonia believes in the complexity of familial relationships and the interplay between personal feelings and political power.", "She holds that loyalty to family must be balanced with the need for truth and justice.", "Antonia thinks that while ambition can be destructive, understanding and compassion can foster deeper connections."],
        ap.goals = ["Short-term: To support Julia emotionally through her frustrations and offer her perspective on Tiberius.", "Medium-term: To encourage Julia to reconsider her harsher judgments and focus on the broader implications of their situation.", "Ultimate: To strengthen the bond of friendship between herself and Julia, navigating through their shared experiences in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Livia is not present in the scene but is discussed as a looming figure of influence and suspicion, her actions and ambitions casting a shadow over Julia and Antonia\'s conversation. The mere mention of her name elicits responses filled with tension and unease.',
        ap.emotional_state = 'Although physically absent, Livia\'s influence is palpable. Julia\'s harsh remarks and dark suspicions about Livia\'s involvement in past tragedies reveal a complex emotional landscape where fear and resentment towards Livia\'s ambitions simmer beneath the surface.',
        ap.emotional_tags = ["although physically absent, livia's influence is palpable. julia's harsh remarks", "dark suspicions about livia's involvement in past tragedies reveal a complex emotional landscape where fear", "resentment towards livia's ambitions simmer beneath the surface.", "although physically absent", "livia's influence is palpable. julia's harsh remarks and dark suspicions about livia's involvement in past tragedies reveal a complex emotional landscape where fear and resentment towards livia's ambitions simmer beneath the surface."],
        ap.active_plans = ["To manipulate familial relationships for the furtherance of her ambitions, as implied by the conversations of Julia and Antonia.", "To maintain a fa\u00e7ade of maternal concern while orchestrating events to secure her son Tiberius's position.", "To instill fear and uncertainty in the hearts of those around her, ensuring that her power remains unchallenged."],
        ap.beliefs = ["Livia believes that the ends always justify the means when it comes to securing power for her family.", "She holds that emotion is a vulnerability to be exploited in others, using it to her advantage.", "Livia is convinced that legacy and control over the empire are paramount, even at the cost of personal relationships."],
        ap.goals = ["Short-term: To reinforce her control over the imperial family and influence decisions that benefit Tiberius.", "Medium-term: To eliminate any threats to her ambitions, including any suspicion that may arise from Julia's comments.", "Ultimate: To ensure the continuity and stability of her family's reign over Rome, regardless of the personal cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Julia is reclining on a marble bench in the Roman bathhouse, attended by a slave massaging her toe, deeply engaged in a candid conversation with Antonia. She initially complains about Tiberius\'s coldness and neglect but then pivots to a lighter, almost flirtatious tone when discussing Antonia\'s husband, Drusus, her body language relaxed yet expressive as she gestures playfully.',
        ap.emotional_state = 'Julia oscillates between genuine frustration and playful deflection. Outwardly, she is witty and sharp-tongued, making light of her marital woes with humor and sarcasm. However, beneath the surface, there\'s a palpable undercurrent of unhappiness and a yearning for connection. Her shift to a lighter tone about Drusus hints at a desire for warmth and affection, contrasting sharply with the coldness she experiences with Tiberius, revealing a complex emotional landscape.',
        ap.emotional_tags = ["julia oscillates between genuine frustration", "playful deflection. outwardly, she is witty", "sharp-tongued, making light of her marital woes with humor", "sarcasm. however, beneath the surface, there's a palpable undercurrent of unhappiness", "a yearning for connection. her shift to a lighter tone about drusus hints at a desire for warmth", "affection, contrasting sharply with the coldness she experiences with tiberius, revealing a complex emotional landscape.", "julia oscillates between genuine frustration and playful deflection. outwardly", "she is witty and sharp-tongued", "making light of her marital woes with humor and sarcasm. however", "beneath the surface", "there's a palpable undercurrent of unhappiness and a yearning for connection. her shift to a lighter tone about drusus hints at a desire for warmth and affection", "contrasting sharply with the coldness she experiences with tiberius", "revealing a complex emotional landscape."],
        ap.active_plans = ["To express her deep dissatisfaction with her marriage to Tiberius, seeking validation from Antonia.", "To playfully flirt and tease Antonia about Drusus, injecting levity into the conversation and possibly testing boundaries.", "To subtly compare Drusus favorably to Tiberius, highlighting what she perceives as lacking in her own marriage."],
        ap.beliefs = ["She believes Tiberius is inherently cold and emotionally distant, incapable of genuine affection towards her.", "She believes her marriage to Tiberius was orchestrated by Livia for political gain, devoid of any personal consideration for her happiness.", "She believes she was foolish to have ever been attracted to Tiberius, now seeing him as completely undesirable."],
        ap.goals = ["Short-term: To enjoy a moment of relaxation and social connection in the bathhouse with Antonia.", "Medium-term: To find emotional release and understanding by confiding in Antonia about her marital unhappiness.", "Ultimate: To find genuine emotional warmth and connection in her life, even if it is not within her marriage, and to assert some form of personal agency within her constrained imperial existence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Antonia is positioned beside Julia in the steamy Roman bathhouse, attentively listening and responding to Julia’s dramatic pronouncements about Tiberius and her marriage. She maintains a composed and empathetic posture, offering gentle interjections and thoughtful responses as Julia shifts from complaint to playful teasing, her presence a calming counterpoint to Julia’s vivacity.',
        ap.emotional_state = 'Antonia exhibits a calm and supportive demeanor, acting as a confidante and sounding board for Julia. She is clearly empathetic to Julia\'s marital distress, offering understanding and gentle humor in response to Julia\'s dramatic statements.  Internally, she likely feels sympathy for Julia\'s predicament and perhaps a degree of amusement at Julia’s theatricality, maintaining a steady emotional equilibrium throughout their intimate conversation.',
        ap.emotional_tags = ["antonia exhibits a calm", "supportive demeanor, acting as a confidante", "sounding board for julia. she is clearly empathetic to julia's marital distress, offering understanding", "gentle humor in response to julia's dramatic statements.  internally, she likely feels sympathy for julia's predicament", "perhaps a degree of amusement at julia\u2019s theatricality, maintaining a steady emotional equilibrium throughout their intimate conversation.", "antonia exhibits a calm and supportive demeanor", "acting as a confidante and sounding board for julia. she is clearly empathetic to julia's marital distress", "offering understanding and gentle humor in response to julia's dramatic statements.  internally", "she likely feels sympathy for julia's predicament and perhaps a degree of amusement at julia\u2019s theatricality", "maintaining a steady emotional equilibrium throughout their intimate conversation."],
        ap.active_plans = ["To provide a safe and supportive space for Julia to vent her frustrations and feelings about Tiberius and her marriage.", "To offer gentle, empathetic responses to Julia's complaints, validating her feelings without necessarily agreeing with every dramatic statement.", "To maintain a light and friendly atmosphere, subtly guiding the conversation away from overly negative emotions and towards a more balanced perspective."],
        ap.beliefs = ["She believes Tiberius is naturally melancholic and reserved, as indicated by Drusus's past observations.", "She believes Augustus was misguided in forcing the marriage between Julia and Tiberius, recognizing its inherent incompatibility.", "She believes Julia is genuinely unhappy in her marriage and deserves empathy and support from her."],
        ap.goals = ["Short-term: To enjoy a relaxing and intimate social time with Julia in the bathhouse.", "Medium-term: To strengthen her bond with Julia by offering friendship and emotional support during a difficult time.", "Ultimate: To be a reliable and supportive friend to Julia amidst the complexities of their familial and imperial lives, offering a haven of understanding and genuine connection within the treacherous court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Drusus is not physically present but exists as a topic of conversation between Julia and Antonia. Antonia invokes his memory, recalling his understanding of Tiberius\'s personality, and Julia playfully uses his name in a flirtatious manner, suggesting a comfortable familiarity and affection, even in his absence.',
        ap.emotional_state = 'Though absent, Drusus is evoked with warmth and fondness. Antonia remembers him with affection, recalling his insights into Tiberius’s character and highlighting his positive influence. Julia\'s playful remarks about Drusus indicate a lighthearted and perhaps slightly flirtatious relationship, suggesting Drusus was perceived as affable and attractive, a stark contrast to the negativity surrounding Tiberius in this scene.',
        ap.emotional_tags = ["though absent, drusus is evoked with warmth", "fondness. antonia remembers him with affection, recalling his insights into tiberius\u2019s character", "highlighting his positive influence. julia's playful remarks about drusus indicate a lighthearted", "perhaps slightly flirtatious relationship, suggesting drusus was perceived as affable", "attractive, a stark contrast to the negativity surrounding tiberius in this scene.", "though absent", "drusus is evoked with warmth and fondness. antonia remembers him with affection", "recalling his insights into tiberius\u2019s character and highlighting his positive influence. julia's playful remarks about drusus indicate a lighthearted and perhaps slightly flirtatious relationship", "suggesting drusus was perceived as affable and attractive", "a stark contrast to the negativity surrounding tiberius in this scene."],
        ap.active_plans = ["Drusus is not actively planning anything in this scene, as he is not present. His 'plan' is to exist in the fond memories of Antonia and as a point of playful comparison and contrast by Julia.", "Through Antonia's recollections, Drusus indirectly 'plans' to offer a more nuanced perspective on Tiberius's character, contrasting with Julia's purely negative portrayal.", "Through Julia\u2019s playful comments, Drusus indirectly 'plans' to inject levity and a hint of romantic possibility into the conversation, even though it is purely hypothetical and for comedic effect."],
        ap.beliefs = ["Based on Antonia's words, Drusus believed Tiberius, despite his brooding nature, possessed a capacity for laughter and joy, suggesting a brotherly understanding and acceptance.", "Implicitly, through Julia's playful comment, there's a suggestion that Drusus was seen as a more desirable or attractive figure compared to Tiberius, embodying warmth and approachability.", "Through his absence and the positive recollections, Drusus's legacy implicitly reinforces the contrast between his perceived positive traits and Tiberius's coldness, further highlighting Julia's marital dissatisfaction."],
        ap.goals = ["Short-term: Drusus's short-term 'goal' in this scene is to be remembered fondly and positively by Antonia and Julia, even in his physical absence.", "Medium-term: Through Antonia\u2019s recollection, Drusus indirectly contributes to a more balanced understanding of Tiberius's character, adding depth beyond Julia's complaints.", "Ultimate: Drusus's ultimate 'goal' in this scene is to inadvertently serve as a positive benchmark against which Tiberius is unfavorably compared, highlighting the emotional deficiencies in Julia's marriage and reinforcing the scene's themes of marital discord and longing for connection."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands in the steam-filled bathhouse, his frame weary and burdened, as Drusus scrubs his back with vigorous strokes. He winces slightly at the pressure, revealing the weight of his weariness that transcends the physical act of cleansing.',
        ap.emotional_state = 'Tiberius outwardly expresses fatigue through his tone and posture, but beneath this surface, a profound despair and self-loathing bubble, hinting at an internal struggle with identity and familial expectations. He feels isolated in his darkness, believing no one can truly understand the depths of his burden.',
        ap.emotional_tags = ["tiberius outwardly expresses fatigue through his tone", "posture, but beneath this surface, a profound despair", "self-loathing bubble, hinting at an internal struggle with identity", "familial expectations. he feels isolated in his darkness, believing no one can truly understand the depths of his burden.", "tiberius outwardly expresses fatigue through his tone and posture", "but beneath this surface", "a profound despair and self-loathing bubble", "hinting at an internal struggle with identity and familial expectations. he feels isolated in his darkness", "believing no one can truly understand the depths of his burden.", "tiberius outwardly expresses fatigue through his tone and posture,", "beneath this surface, a profound despair and self-loathing bubble, hinting at an internal struggle with identity and familial expectations. he feels isolated in his darkness, believing no one can truly understand the depths of his burden."],
        ap.active_plans = ["To deflect Drusus's teasing about his gloom, masking his deeper emotional struggles.", "To maintain a semblance of normalcy and brotherly connection through their conversation.", "To express vulnerability and seek solace through familial bonds amidst his overwhelming despair."],
        ap.beliefs = ["He believes that his burdens are uniquely heavy, thus isolating himself emotionally from others.", "He holds a conviction that familial loyalty is paramount, even in the face of personal anguish.", "He believes he must carry the weight of his family's expectations and the legacy of his lineage."],
        ap.goals = ["Short-term: To engage in a brotherly exchange that provides temporary relief from his burdens.", "Medium-term: To find a way to articulate his struggles and seek understanding from Drusus.", "Ultimate: To reconcile his identity as a warrior with the expectations of being a ruler and fulfill his family's legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Drusus, positioned behind Tiberius, scrubs his brother\'s back with a determined vigor, embodying a grounded practicality. He engages Tiberius in light banter, teasing him about his gloom while maintaining a supportive demeanor.',
        ap.emotional_state = 'Outwardly, Drusus expresses a good-natured and practical attitude, using humor to diffuse the heaviness of their conversation. Internally, he harbors concern for Tiberius\'s well-being, feeling a heavy responsibility for his brother\'s emotional state, recognizing the darkness that weighs on him.',
        ap.emotional_tags = ["outwardly, drusus expresses a good-natured", "practical attitude, using humor to diffuse the heaviness of their conversation. internally, he harbors concern for tiberius's well-being, feeling a heavy responsibility for his brother's emotional state, recognizing the darkness that weighs on him.", "outwardly", "drusus expresses a good-natured and practical attitude", "using humor to diffuse the heaviness of their conversation. internally", "he harbors concern for tiberius's well-being", "feeling a heavy responsibility for his brother's emotional state", "recognizing the darkness that weighs on him."],
        ap.active_plans = ["To provide physical care to Tiberius, reinforcing their brotherly bond and care.", "To lighten the mood with humor, attempting to alleviate Tiberius's gloom.", "To foster an open dialogue, encouraging Tiberius to share his burdens without judgment."],
        ap.beliefs = ["He believes in the importance of maintaining cleanliness and self-care as a reflection of dignity.", "He holds that familial bonds should offer support and understanding, especially in times of distress.", "He believes that addressing emotional struggles through dialogue is crucial to maintaining familial harmony."],
        ap.goals = ["Short-term: To scrub Tiberius's back effectively while engaging him in conversation.", "Medium-term: To cultivate a deeper understanding of Tiberius's emotional struggles and offer him support.", "Ultimate: To ensure the safety and well-being of his brother in the face of political and emotional turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius is positioned in the Roman bathhouse, being physically scrubbed by his brother Drusus. He is initially passive and weary, reclining and allowing Drusus to attend to him.  He directs Drusus to be gentler, showing a physical sensitivity and a desire for comfort even in this mundane act. His posture suggests a man burdened and resigned, seeking a moment of physical if not emotional ease.',
        ap.emotional_state = 'Beneath a veneer of world-weariness, Tiberius is grappling with profound self-loathing and a deep-seated despair. Outwardly, he expresses a bleak negativity and hints at suicidal ideation, his tone shifting abruptly to reveal his inner torment.  Internally, he feels isolated in his darkness, believing it to be unique and insurmountable, contrasting sharply with Drusus\'s perceived lightness. There\'s a palpable tension between his stoic public persona and the raw vulnerability he exposes in this intimate moment with his brother, hinting at a desperate need for connection despite his conviction of being irredeemable.',
        ap.emotional_tags = ["beneath a veneer of world-weariness, tiberius is grappling with profound self-loathing", "a deep-seated despair. outwardly, he expresses a bleak negativity", "hints at suicidal ideation, his tone shifting abruptly to reveal his inner torment.  internally, he feels isolated in his darkness, believing it to be unique", "insurmountable, contrasting sharply with drusus's perceived lightness. there's a palpable tension between his stoic public persona", "the raw vulnerability he exposes in this intimate moment with his brother, hinting at a desperate need for connection despite his conviction of being irredeemable.", "beneath a veneer of world-weariness", "tiberius is grappling with profound self-loathing and a deep-seated despair. outwardly", "he expresses a bleak negativity and hints at suicidal ideation", "his tone shifting abruptly to reveal his inner torment.  internally", "he feels isolated in his darkness", "believing it to be unique and insurmountable", "contrasting sharply with drusus's perceived lightness. there's a palpable tension between his stoic public persona and the raw vulnerability he exposes in this intimate moment with his brother", "hinting at a desperate need for connection despite his conviction of being irredeemable."],
        ap.active_plans = ["To articulate the overwhelming nature of his self-hatred to Drusus.", "To seek some form of understanding or acknowledgment of his inner darkness from his brother.", "To explore the reasons for his despair and the perceived futility of his life within the context of his forced political role."],
        ap.beliefs = ["He is inherently flawed and deeply unlikeable, deserving of self-hatred.", "His inner darkness is unique and sets him apart from others, especially his brother Drusus.", "His life and actions, particularly his political maneuvering, may be ultimately meaningless and without personal fulfillment."],
        ap.goals = ["Short-term: To unburden himself emotionally by confessing his darkest feelings to Drusus in this moment of vulnerability.", "Medium-term: To find some form of solace or understanding, however fleeting, from his brother's empathy.", "Ultimate: To confront and potentially alleviate his deep-seated self-loathing, though he currently seems pessimistic about achieving this."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Drusus is actively and physically engaged in scrubbing Tiberius in the bathhouse. He is positioned as the more active and physically dominant brother in this intimate setting. Initially, he is jovial and brotherly, focused on the practical task at hand and teasing Tiberius good-naturedly about his gloom. He maintains a lighthearted physical presence, grounded in the familiar comfort of brotherly interaction.',
        ap.emotional_state = 'Drusus displays a generally cheerful and supportive surface emotion, initially dismissing Tiberius\'s gloom with humor and brotherly teasing. He attempts to lighten the mood and normalize Tiberius\'s feelings, suggesting a desire to comfort and reassure his brother.  Internally, while he likely cares for Tiberius and wants to alleviate his suffering, he appears to lack a deep understanding of the profound darkness Tiberius describes. There\'s a subtle naivety in his responses, suggesting he cannot fully grasp the depth of Tiberius\'s despair, even as he tries to offer brotherly support and affection.',
        ap.emotional_tags = ["drusus displays a generally cheerful", "supportive surface emotion, initially dismissing tiberius's gloom with humor", "brotherly teasing. he attempts to lighten the mood", "normalize tiberius's feelings, suggesting a desire to comfort", "reassure his brother.  internally, while he likely cares for tiberius", "wants to alleviate his suffering, he appears to lack a deep understanding of the profound darkness tiberius describes. there's a subtle naivety in his responses, suggesting he cannot fully grasp the depth of tiberius's despair, even as he tries to offer brotherly support", "affection.", "drusus displays a generally cheerful and supportive surface emotion", "initially dismissing tiberius's gloom with humor and brotherly teasing. he attempts to lighten the mood and normalize tiberius's feelings", "suggesting a desire to comfort and reassure his brother.  internally", "while he likely cares for tiberius and wants to alleviate his suffering", "he appears to lack a deep understanding of the profound darkness tiberius describes. there's a subtle naivety in his responses", "suggesting he cannot fully grasp the depth of tiberius's despair", "even as he tries to offer brotherly support and affection.", "drusus displays a generally cheerful and supportive surface emotion, initially dismissing tiberius's gloom with humor and brotherly teasing. he attempts to lighten the mood and normalize tiberius's feelings, suggesting a desire to comfort and reassure his brother.  internally,", "he likely cares for tiberius and wants to alleviate his suffering, he appears to lack a deep understanding of the profound darkness tiberius describes. there's a subtle naivety in his responses, suggesting he cannot fully grasp the depth of tiberius's despair, even as he tries to offer brotherly support and affection."],
        ap.active_plans = ["To lighten Tiberius's somber mood through humor and brotherly banter.", "To reassure Tiberius that his feelings are not unique or overly serious ('Oh nonsense. We all have them').", "To maintain a positive and supportive brotherly dynamic, deflecting the heavier implications of Tiberius's confession with levity."],
        ap.beliefs = ["Dark thoughts are a normal part of human experience and not necessarily indicative of deep-seated issues.", "Tiberius is likely exaggerating the extent of his darkness or engaging in self-pity ('Ah, stop bragging!').", "Brotherly affection and lightheartedness are effective ways to address and alleviate negative emotions."],
        ap.goals = ["Short-term: To cheer Tiberius up and dispel his current gloomy mood in the bathhouse.", "Medium-term: To reinforce their brotherly bond and maintain a positive relationship, offering support in his own way.", "Ultimate: To protect and care for Tiberius as a brother, though his approach is rooted in downplaying rather than deeply addressing Tiberius's stated suffering."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius, physically weary and emotionally burdened, reclines in the steamy bathhouse. He flinches slightly as Drusus scrubs his back, indicating a need for gentleness. His posture is tense, reflecting the weight of his thoughts, while he engages in playful banter tinged with melancholy.',
        ap.emotional_state = 'Outwardly, Tiberius conceals his deep self-loathing behind sarcasm and humor, yet beneath the surface lies a torrent of despair and bitterness. He feels alienated and grapples with his identity within the family dynamic, particularly in relation to his mother’s influence. His words reveal an internal struggle with feelings of inadequacy and darkness.',
        ap.emotional_tags = ["outwardly, tiberius conceals his deep self-loathing behind sarcasm", "humor, yet beneath the surface lies a torrent of despair", "bitterness. he feels alienated", "grapples with his identity within the family dynamic, particularly in relation to his mother\u2019s influence. his words reveal an internal struggle with feelings of inadequacy", "darkness.", "outwardly", "tiberius conceals his deep self-loathing behind sarcasm and humor", "yet beneath the surface lies a torrent of despair and bitterness. he feels alienated and grapples with his identity within the family dynamic", "particularly in relation to his mother\u2019s influence. his words reveal an internal struggle with feelings of inadequacy and darkness."],
        ap.active_plans = ["To maintain a facade of camaraderie with Drusus while voicing his inner turmoil.", "To subtly express his disdain for the familial expectations pressing upon him.", "To seek solace in shared humor with Drusus, masking his deeper fears and sorrows."],
        ap.beliefs = ["The Claudian family is inherently divided, producing both strength and weakness.", "Familial loyalty is a complex web fraught with betrayal.", "Personal desire is often sacrificed at the altar of duty and expectation."],
        ap.goals = ["Short-term: To share a moment of levity with Drusus amidst their shared burdens.", "Medium-term: To come to terms with his feelings of loss regarding Vipsania and the expectations he faces.", "Ultimate: To navigate the complexities of his role in the imperial family while preserving his dignity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Drusus, scrubbing Tiberius\'s back, maintains a lighthearted demeanor, despite the heavy steam surrounding them. He stands in a position of care, using physical contact to convey brotherly support, engaging in banter to lighten the mood while also addressing serious undertones.',
        ap.emotional_state = 'Drusus presents a facade of carefree humor, but internally he harbors concerns about Tiberius\'s darker thoughts and feelings. He feels a sense of responsibility for his brother\'s wellbeing and seeks to provide comfort and distraction. Beneath his joking exterior, he senses the weight of familial expectations and the undercurrents of tension.',
        ap.emotional_tags = ["drusus presents a facade of carefree humor, but internally he harbors concerns about tiberius's darker thoughts", "feelings. he feels a sense of responsibility for his brother's wellbeing", "seeks to provide comfort", "distraction. beneath his joking exterior, he senses the weight of familial expectations", "the undercurrents of tension.", "drusus presents a facade of carefree humor", "but internally he harbors concerns about tiberius's darker thoughts and feelings. he feels a sense of responsibility for his brother's wellbeing and seeks to provide comfort and distraction. beneath his joking exterior", "he senses the weight of familial expectations and the undercurrents of tension.", "drusus presents a facade of carefree humor,", "internally he harbors concerns about tiberius's darker thoughts and feelings. he feels a sense of responsibility for his brother's wellbeing and seeks to provide comfort and distraction. beneath his joking exterior, he senses the weight of familial expectations and the undercurrents of tension."],
        ap.active_plans = ["To encourage Tiberius to lighten up and share the burdens of their family dynamics.", "To reassure Tiberius of their bond and the importance of brotherhood.", "To subtly critique the pressures of their mother Livia's influence, using humor to navigate the tension."],
        ap.beliefs = ["Family bonds should provide support and protection amidst the chaos of their lives.", "Humor can bridge the gap between heavy truths and light-heartedness.", "Suffering and darkness are universal experiences, shared among brothers."],
        ap.goals = ["Short-term: To connect with Tiberius through humor and physical support.", "Medium-term: To help Tiberius confront his feelings about their family\u2019s dark history.", "Ultimate: To preserve their brotherly relationship despite the looming threats of their family's politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius is in the Roman bathhouse, being physically scrubbed clean by his brother, Drusus. He is positioned to be vulnerable and cared for, yet his body language and weary tone suggest a deep emotional burden that physical cleansing cannot reach. He is engaging in intimate conversation with Drusus, revealing a rare glimpse into his inner turmoil.',
        ap.emotional_state = 'Tiberius is profoundly melancholic and self-loathing. Outwardly, he expresses despair and bitterness, confessing his deep-seated hatred for himself and his overwhelming darkness. Beneath this surface, he is grappling with intense grief and regret over the loss of Vipsania and the perceived futility of his sacrifices. There is a palpable tension between his stoic public persona and the raw vulnerability he displays to Drusus, hinting at a deep internal conflict and a desperate need for connection and understanding.',
        ap.emotional_tags = ["tiberius is profoundly melancholic", "self-loathing. outwardly, he expresses despair", "bitterness, confessing his deep-seated hatred for himself", "his overwhelming darkness. beneath this surface, he is grappling with intense grief", "regret over the loss of vipsania", "the perceived futility of his sacrifices. there is a palpable tension between his stoic public persona", "the raw vulnerability he displays to drusus, hinting at a deep internal conflict", "a desperate need for connection", "understanding.", "tiberius is profoundly melancholic and self-loathing. outwardly", "he expresses despair and bitterness", "confessing his deep-seated hatred for himself and his overwhelming darkness. beneath this surface", "he is grappling with intense grief and regret over the loss of vipsania and the perceived futility of his sacrifices. there is a palpable tension between his stoic public persona and the raw vulnerability he displays to drusus", "hinting at a deep internal conflict and a desperate need for connection and understanding."],
        ap.active_plans = ["To unburden his soul by confiding in Drusus about his darkest feelings and regrets.", "To seek validation and understanding from Drusus regarding his inner turmoil and self-hatred.", "To express his deep sorrow and lament the loss of Vipsania, emphasizing the personal cost of his political life."],
        ap.beliefs = ["He believes he is inherently flawed and plagued by a unique inner darkness that separates him from others, especially Drusus.", "He believes his divorce from Vipsania was a tragic and unjust sacrifice imposed upon him by external forces, denying him true happiness.", "He believes the Roman monarchy's future is uncertain after Augustus, questioning the purpose and value of his own politically motivated actions."],
        ap.goals = ["short_term\": \"To find temporary solace and emotional release by sharing his burdens with his brother.", "medium_term\": \"To process his grief and find a way to cope with the ongoing pain of losing Vipsania and living a life dictated by political duty.", "ultimate\": \"To discover some semblance of meaning or purpose in his existence despite his self-despair and the oppressive constraints of his predetermined imperial destiny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Drusus is actively scrubbing Tiberius in the bathhouse, physically close and engaged in a brotherly act of service. He is positioned as the caregiver in this moment, his actions gentle yet thorough. He maintains eye contact and responds directly to Tiberius\'s emotional outpouring, attempting to lighten the mood with humor and brotherly reassurance.',
        ap.emotional_state = 'Drusus presents an outwardly cheerful and supportive demeanor, attempting to counter Tiberius\'s gloom with levity and brotherly affection. He is empathetic to Tiberius\'s sadness but strives to minimize its severity, perhaps sensing the vulnerability of the moment and seeking to protect his brother from spiraling further into despair. Internally, he may be genuinely concerned about Tiberius\'s deep unhappiness, yet chooses to address it with optimism and reassurance, possibly reflecting his own more robust and less introspective nature. There is an unspoken tension between his desire to comfort Tiberius and his potential inability to fully grasp the depth of his brother\'s darkness.',
        ap.emotional_tags = ["drusus presents an outwardly cheerful", "supportive demeanor, attempting to counter tiberius's gloom with levity", "brotherly affection. he is empathetic to tiberius's sadness but strives to minimize its severity, perhaps sensing the vulnerability of the moment", "seeking to protect his brother from spiraling further into despair. internally, he may be genuinely concerned about tiberius's deep unhappiness, yet chooses to address it with optimism", "reassurance, possibly reflecting his own more robust", "less introspective nature. there is an unspoken tension between his desire to comfort tiberius", "his potential inability to fully grasp the depth of his brother's darkness.", "drusus presents an outwardly cheerful and supportive demeanor", "attempting to counter tiberius's gloom with levity and brotherly affection. he is empathetic to tiberius's sadness but strives to minimize its severity", "perhaps sensing the vulnerability of the moment and seeking to protect his brother from spiraling further into despair. internally", "he may be genuinely concerned about tiberius's deep unhappiness", "yet chooses to address it with optimism and reassurance", "possibly reflecting his own more robust and less introspective nature. there is an unspoken tension between his desire to comfort tiberius and his potential inability to fully grasp the depth of his brother's darkness.", "drusus presents an outwardly cheerful and supportive demeanor, attempting to counter tiberius's gloom with levity and brotherly affection. he is empathetic to tiberius's sadness", "strives to minimize its severity, perhaps sensing the vulnerability of the moment and seeking to protect his brother from spiraling further into despair. internally, he may be genuinely concerned about tiberius's deep unhappiness, yet chooses to address it with optimism and reassurance, possibly reflecting his own more robust and less introspective nature. there is an unspoken tension between his desire to comfort tiberius and his potential inability to fully grasp the depth of his brother's darkness."],
        ap.active_plans = ["To uplift Tiberius's spirits and divert his attention from his negative thoughts through lighthearted banter and physical care.", "To offer unwavering brotherly comfort and support, assuring Tiberius that he is not alone in his struggles and feelings.", "To maintain a positive and relaxed atmosphere during their time together, creating a space of brotherly connection and temporary escape from heavier realities."],
        ap.beliefs = ["He believes that everyone experiences dark thoughts and that Tiberius's are not exceptionally unique or insurmountable.", "He believes in the strength of familial bonds and the importance of mutual support between brothers.", "He believes in facing life's challenges with resilience and a degree of lightheartedness, rather than succumbing to despair."],
        ap.goals = ["short_term\": \"To immediately alleviate Tiberius's sadness and create a more positive emotional state for his brother in the present moment.", "medium_term\": \"To strengthen their brotherly bond by offering consistent emotional support and serving as a reliable source of comfort for Tiberius.", "ultimate\": \"To be a consistent source of light and positivity in Tiberius's life, helping him navigate his darker tendencies and maintain a sense of hope and connection."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits in the humid warmth of the bathhouse, his weary body being scrubbed by his brother Drusus. He appears physically worn, his posture slumped, reflecting the burden of his thoughts and responsibilities. His gestures are minimal but tinged with frustration, as he tries to lighten the oppressive atmosphere with humor while simultaneously expressing discomfort with the scrubbing.',
        ap.emotional_state = 'Tiberius conveys a facade of humor, attempting to mask his deep inner turmoil and self-loathing. While he engages in banter with Drusus, beneath the surface lies a profound despair and feelings of manipulation. His reference to darkness indicates a heavy emotional burden, highlighting his struggle with identity and purpose amidst the expectations thrust upon him.',
        ap.emotional_tags = ["tiberius conveys a facade of humor, attempting to mask his deep inner turmoil", "self-loathing. while he engages in banter with drusus, beneath the surface lies a profound despair", "feelings of manipulation. his reference to darkness indicates a heavy emotional burden, highlighting his struggle with identity", "purpose amidst the expectations thrust upon him.", "tiberius conveys a facade of humor", "attempting to mask his deep inner turmoil and self-loathing. while he engages in banter with drusus", "beneath the surface lies a profound despair and feelings of manipulation. his reference to darkness indicates a heavy emotional burden", "highlighting his struggle with identity and purpose amidst the expectations thrust upon him."],
        ap.active_plans = ["To engage in light-hearted conversation to alleviate the tension and gloom surrounding him.", "To express his feelings of regret and disillusionment regarding his life choices and the monarchy.", "To seek reassurance from Drusus about their bond and the future amidst his fears about the monarchy's endurance."],
        ap.beliefs = ["He believes that personal sacrifices in the name of ambition are ultimately futile.", "He holds a conviction that familial loyalty is overshadowed by the ambitions of others, particularly Livia.", "He feels a sense of inevitability regarding his role in the monarchy and the tragic consequences of his mother's ambition."],
        ap.goals = ["Short-term: To maintain a connection with Drusus as a source of support amidst his struggles.", "Medium-term: To navigate his turbulent emotions regarding his past and the monarchy's future.", "Ultimate: To escape the suffocating expectations of his role and find personal peace, possibly through reconciliation with his past love, Vipsania."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Drusus stands in the humid bathhouse, diligently scrubbing Tiberius\'s back, taking on the role of both caretaker and confidant. His posture is relaxed yet attentive, embodying a sense of brotherly devotion. He engages in playful banter, employing gestures that highlight his efforts to lighten the mood while addressing deeper issues.',
        ap.emotional_state = 'Drusus displays a blend of concern and optimism. Outwardly, he maintains a lighthearted demeanor, teasing Tiberius and attempting to alleviate his brother\'s gloom. Internally, however, he grapples with the heavy implications of Tiberius\'s words, sensing the depth of Tiberius\'s despair, which contrasts sharply with his more optimistic outlook for the future of Rome.',
        ap.emotional_tags = ["drusus displays a blend of concern", "optimism. outwardly, he maintains a lighthearted demeanor, teasing tiberius", "attempting to alleviate his brother's gloom. internally, however, he grapples with the heavy implications of tiberius's words, sensing the depth of tiberius's despair, which contrasts sharply with his more optimistic outlook for the future of rome.", "drusus displays a blend of concern and optimism. outwardly", "he maintains a lighthearted demeanor", "teasing tiberius and attempting to alleviate his brother's gloom. internally", "however", "he grapples with the heavy implications of tiberius's words", "sensing the depth of tiberius's despair", "which contrasts sharply with his more optimistic outlook for the future of rome."],
        ap.active_plans = ["To offer support and comfort to Tiberius by engaging in light-hearted conversation.", "To challenge Tiberius's bleak perspective on their situation and the monarchy, promoting a more hopeful view.", "To reinforce their brotherly bond, emphasizing mutual protection and support in the face of their family\u2019s difficulties."],
        ap.beliefs = ["He believes that hope and resilience can prevail over the darkness that surrounds them.", "He is convinced that the monarchy's future is not guaranteed and is optimistic about the return of the Republic.", "He holds a conviction that personal bonds, particularly familial ties, are essential for navigating the treachery of their circumstances."],
        ap.goals = ["Short-term: To lighten Tiberius's mood and remind him of their brotherly bond.", "Medium-term: To instill a sense of hope about the future of Rome and their roles within it.", "Ultimate: To safeguard his brother and family against the machinations of their mother and others in power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits immersed in the steam of the Roman bathhouse, his body being scrubbed by his brother Drusus. He is physically present but appears weary and withdrawn, his posture suggesting a man burdened by unseen weights. He speaks slowly, his words laced with melancholy, as he engages in a somber conversation with Drusus, revealing the heavy thoughts that occupy his mind.',
        ap.emotional_state = 'Beneath a veneer of weary resignation, Tiberius is wrestling with profound self-loathing and despair. Outwardly, he expresses gloom and a sense of being burdened, but internally, he is consumed by a deep-seated hatred for himself and the choices he has been forced to make. He is mourning the irretrievable loss of Vipsania, a wound that festers beneath his stoic exterior, and questions the very purpose of his existence, revealing a man teetering on the edge of an emotional abyss.',
        ap.emotional_tags = ["beneath a veneer of weary resignation, tiberius is wrestling with profound self-loathing", "despair. outwardly, he expresses gloom", "a sense of being burdened, but internally, he is consumed by a deep-seated hatred for himself", "the choices he has been forced to make. he is mourning the irretrievable loss of vipsania, a wound that festers beneath his stoic exterior,", "questions the very purpose of his existence, revealing a man teetering on the edge of an emotional abyss.", "beneath a veneer of weary resignation", "tiberius is wrestling with profound self-loathing and despair. outwardly", "he expresses gloom and a sense of being burdened", "but internally", "he is consumed by a deep-seated hatred for himself and the choices he has been forced to make. he is mourning the irretrievable loss of vipsania", "a wound that festers beneath his stoic exterior", "and questions the very purpose of his existence", "revealing a man teetering on the edge of an emotional abyss.", "beneath a veneer of weary resignation, tiberius is wrestling with profound self-loathing and despair. outwardly, he expresses gloom and a sense of being burdened,", "internally, he is consumed by a deep-seated hatred for himself and the choices he has been forced to make. he is mourning the irretrievable loss of vipsania, a wound that festers beneath his stoic exterior, and questions the very purpose of his existence, revealing a man teetering on the edge of an emotional abyss."],
        ap.active_plans = ["To seek solace and understanding from Drusus, hoping to find a moment of connection in his despair.", "To articulate the depth of his self-hatred and inner darkness to someone he trusts, seeking some form of catharsis or validation.", "To grapple with the finality of his separation from Vipsania, attempting to accept this irreversible loss and move forward, however bleak the future may seem."],
        ap.beliefs = ["He believes he is inherently flawed and consumed by darkness, unlike his seemingly lighter and more virtuous brother, Drusus.", "He believes his life's actions, particularly his political maneuvering, might be ultimately futile if the monarchy crumbles after Augustus's death.", "He believes he was manipulated and coerced by Livia, Julia, and Augustus into making decisions that have caused him immense personal pain and regret, particularly regarding Vipsania."],
        ap.goals = ["Short-term Goal: To find a fleeting moment of comfort and understanding from Drusus, seeking temporary respite from his overwhelming despair in the bathhouse's steamy embrace.", "Medium-term Goal: To attempt to bury the memory of Vipsania and the agonizing pain of their separation, striving to accept the irreversible nature of his loss, though knowing it is a near-impossible task.", "Ultimate Goal: To discern some meaning or purpose in his life and imperial duty amidst the pervasive darkness and political uncertainty, seeking a reason to endure beyond his personal anguish."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Drusus is actively scrubbing Tiberius in the bathhouse, his hands moving with brotherly familiarity. He stands close to Tiberius, engaging him in conversation while performing the physical act of bathing him. His posture is relaxed yet attentive, his actions demonstrating a practical, down-to-earth approach to their interaction. He is present, both physically and emotionally, offering a tangible form of brotherly care.',
        ap.emotional_state = 'Drusus presents a facade of lightheartedness and brotherly concern, attempting to comfort Tiberius and dismiss his despair as exaggerated gloom. Outwardly, he is jovial and reassuring, using humor to deflect Tiberius\'s darker pronouncements. Internally, while he likely feels some empathy for Tiberius\'s sadness, he struggles to fully grasp the depth of his brother\'s torment, perhaps viewing it as self-indulgent or overly dramatic. He believes in a more straightforward, less introspective approach to life, contrasting sharply with Tiberius\'s brooding nature.',
        ap.emotional_tags = ["drusus presents a facade of lightheartedness", "brotherly concern, attempting to comfort tiberius", "dismiss his despair as exaggerated gloom. outwardly, he is jovial", "reassuring, using humor to deflect tiberius's darker pronouncements. internally, while he likely feels some empathy for tiberius's sadness, he struggles to fully grasp the depth of his brother's torment, perhaps viewing it as self-indulgent or overly dramatic. he believes in a more straightforward, less introspective approach to life, contrasting sharply with tiberius's brooding nature.", "drusus presents a facade of lightheartedness and brotherly concern", "attempting to comfort tiberius and dismiss his despair as exaggerated gloom. outwardly", "he is jovial and reassuring", "using humor to deflect tiberius's darker pronouncements. internally", "while he likely feels some empathy for tiberius's sadness", "he struggles to fully grasp the depth of his brother's torment", "perhaps viewing it as self-indulgent or overly dramatic. he believes in a more straightforward", "less introspective approach to life", "contrasting sharply with tiberius's brooding nature.", "drusus presents a facade of lightheartedness and brotherly concern, attempting to comfort tiberius and dismiss his despair as exaggerated gloom. outwardly, he is jovial and reassuring, using humor to deflect tiberius's darker pronouncements. internally,", "he likely feels some empathy for tiberius's sadness, he struggles to fully grasp the depth of his brother's torment, perhaps viewing it as self-indulgent or overly dramatic. he believes in a more straightforward, less introspective approach to life, contrasting sharply with tiberius's brooding nature."],
        ap.active_plans = ["To offer simple brotherly comfort and practical support to Tiberius, attempting to alleviate his somber mood through physical closeness and lighthearted banter.", "To reassure Tiberius that his dark thoughts are not unique or exceptionally severe, normalizing his feelings and encouraging him to not dwell on them.", "To maintain a positive and pragmatic atmosphere, steering the conversation away from Tiberius's self-pity and towards a more grounded and manageable perspective on their situation."],
        ap.beliefs = ["He believes that everyone experiences dark thoughts and that Tiberius is not exceptionally afflicted or unique in his melancholy, seeing it as a common human experience.", "He believes in the strength of brotherly bonds and the importance of mutual support and practical assistance in times of emotional distress, offering physical care as a form of comfort.", "He believes in a more stoic and forward-looking approach to life, advocating for acceptance of fate and focusing on action rather than dwelling on past regrets or future anxieties ('What's done is done')."],
        ap.goals = ["Short-term Goal: To uplift Tiberius's spirits in the immediate moment, using humor and brotherly affection to dispel his gloom and create a lighter atmosphere within the bathhouse.", "Medium-term Goal: To reinforce their fraternal bond by offering tangible support and reassurance, strengthening their relationship as a source of mutual comfort and stability.", "Ultimate Goal: To encourage Tiberius to adopt a more resilient and less self-absorbed outlook on life, hoping to guide him away from his despair and towards a more pragmatic and action-oriented existence, though perhaps not fully understanding the roots of Tiberius's profound melancholy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Tiberius, weary and burdened, reclines in the steam-filled bathhouse as Drusus scrubs him down. His body language is tense, with a heavy air of melancholy hanging around him. His posture is slumped, indicative of both physical fatigue and emotional exhaustion. He gestures with slight, resigned movements, hinting at his internal struggles and the weight of his burdens.',
        ap.emotional_state = 'Tiberius\'s surface emotions reflect deep-seated anguish and frustration. His tone is laced with bitterness and resignation as he shares his darker thoughts. Internally, he is grappling with profound self-loathing and fear for his brother\'s safety, underlying his words with a sense of ominous foreboding. His struggle with personal darkness contrasts with the seemingly light banter with Drusus, showcasing tension in their exchange.',
        ap.emotional_tags = ["tiberius's surface emotions reflect deep-seated anguish", "frustration. his tone is laced with bitterness", "resignation as he shares his darker thoughts. internally, he is grappling with profound self-loathing", "fear for his brother's safety, underlying his words with a sense of ominous foreboding. his struggle with personal darkness contrasts with the seemingly light banter with drusus, showcasing tension in their exchange.", "tiberius's surface emotions reflect deep-seated anguish and frustration. his tone is laced with bitterness and resignation as he shares his darker thoughts. internally", "he is grappling with profound self-loathing and fear for his brother's safety", "underlying his words with a sense of ominous foreboding. his struggle with personal darkness contrasts with the seemingly light banter with drusus", "showcasing tension in their exchange."],
        ap.active_plans = ["To communicate his feelings of despair and darkness to Drusus, hoping to share his inner turmoil.", "To express his concerns for Drusus's safety amidst the looming threats he perceives.", "To bond with Drusus, seeking solace in their brotherly connection as a source of light in his troubled existence."],
        ap.beliefs = ["Tiberius believes that genuine emotions should be shared amongst brothers, even if they are dark.", "He holds a conviction that familial bonds can provide strength in times of turmoil.", "He feels the weight of duty and the expectations placed upon him as the heir of Rome, causing him to question his own worth."],
        ap.goals = ["Short-term: To lighten the mood by engaging Drusus in playful banter.", "Medium-term: To navigate his feelings of grief over Vipsania's loss and the weight of duty.", "Ultimate: To find a way to protect Drusus from the dangers he foresees, while grappling with his sense of impending doom."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Drusus is actively scrubbing Tiberius\'s back, his movements firm yet careful, indicative of his role as a supportive brother. He maintains a light-hearted demeanor, attempting to ease Tiberius\'s burdens with humor. His posture is relaxed, suggesting confidence and a desire to reassure his brother amidst the weight of their shared reality.',
        ap.emotional_state = 'Drusus exudes a surface-level confidence, countering Tiberius\'s gloom with humor and banter. He conceals his own darker thoughts beneath a light-hearted facade, suggesting an internal struggle with familial expectations and the brewing tensions surrounding them. Despite the levity, there is an undercurrent of concern for Tiberius, revealing his awareness of the shadows creeping into their lives.',
        ap.emotional_tags = ["drusus exudes a surface-level confidence, countering tiberius's gloom with humor", "banter. he conceals his own darker thoughts beneath a light-hearted facade, suggesting an internal struggle with familial expectations", "the brewing tensions surrounding them. despite the levity, there is an undercurrent of concern for tiberius, revealing his awareness of the shadows creeping into their lives.", "drusus exudes a surface-level confidence", "countering tiberius's gloom with humor and banter. he conceals his own darker thoughts beneath a light-hearted facade", "suggesting an internal struggle with familial expectations and the brewing tensions surrounding them. despite the levity", "there is an undercurrent of concern for tiberius", "revealing his awareness of the shadows creeping into their lives."],
        ap.active_plans = ["To provide comfort and camaraderie to Tiberius through light-hearted banter.", "To reassure Tiberius of their mutual support despite the heavy burdens they bear.", "To deflect the conversation away from deeper issues, aiming to uplift their spirits."],
        ap.beliefs = ["Drusus believes that maintaining personal hygiene is important and that a brother should care for his sibling.", "He is convinced that humor can alleviate the weight of despair and strengthen familial bonds.", "He holds an optimistic view of the future, believing Rome will eventually revert to a Republic, allowing for a new beginning."],
        ap.goals = ["Short-term: To engage Tiberius in light-hearted conversation to distract him from his darker thoughts.", "Medium-term: To reinforce their bond as brothers and the mutual support they provide each other.", "Ultimate: To navigate the dangerous political landscape by staying close to Tiberius and ensuring each other's safety."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_board_game_event_4_1'})
    ON CREATE SET
        oi.description = 'The board game serves as the central prop and narrative device of the scene. Augustus uses it as a tool to playfully educate Gaius and Lucius in strategy and territorial control, mirroring the real-world challenges of governing the Roman Empire. The game’s mechanics, involving legions, ports, and corn supply, directly reflect the strategic considerations of Roman imperial administration, transforming leisure into a subtle lesson in leadership.',
        oi.status_before = 'The board game is set up and in play, with pieces positioned to reflect an ongoing game between Augustus and his grandsons. It is active and central to their interaction.',
        oi.status_after = 'The board game is left mid-play as Augustus and his grandsons are called away for duty. The game pieces remain in their positions, paused and unfinished, symbolizing the interruption of leisure by imperial responsibilities and the ongoing, unresolved nature of strategic challenges.'
    WITH oi
    MATCH (o:Object {uuid: 'object_board_game'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_4_1'})
    ON CREATE SET
        oi.description = 'The dice are actively used by Lucius to determine his moves in the board game. Their repeated rolling of \'sixes\' is remarked upon by Augustus, highlighting the element of chance and unpredictability in both the game and life, even within strategic planning. The dice rolls drive the gameplay and inject an element of playful randomness into the otherwise strategic interaction.',
        oi.status_before = 'The dice are present as a necessary component of the board game, ready to be rolled to dictate gameplay.',
        oi.status_after = 'The dice rest on the game board, having just been rolled by Lucius and noted for their lucky \'sixes\'. They are paused in their function, along with the rest of the game, as the scene shifts to duty.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_legions_game_pieces_event_4_1'})
    ON CREATE SET
        oi.description = 'The legion game pieces represent Roman military forces within the context of the board game. Gaius discusses strategically placing legions in the port, and Lucius mentions the number of legions he has remaining, illustrating their understanding of these pieces as representing military strength and strategic assets. The legions are moved across the board to simulate territorial control and military deployment.',
        oi.status_before = 'The legion game pieces are positioned on the board, representing the current state of play and the distribution of military control within the game.',
        oi.status_after = 'The legion game pieces remain positioned on the board, paused in their strategic deployment as the game is interrupted. Their positions symbolize the unfinished strategic scenario and the temporary halt in playful military maneuvering.'
    WITH oi
    MATCH (o:Object {uuid: 'object_legions_game_pieces'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the board game, fully engaged with his grandsons, Gaius and Lucius. He leans forward, gesturing at the game board as he explains strategic choices and consequences to the boys, guiding their gameplay with a blend of amusement and paternal authority. He is interrupted by a slave and rises to attend to his imperial duty, inviting the boys to join him.',
        ap.emotional_state = 'Augustus projects an air of playful engagement and grandfatherly warmth as he interacts with Gaius and Lucius. Beneath this surface, a subtle layer of didactic purpose is evident; he\'s not just playing, but teaching. There\'s a hint of weariness in his tone when duty calls, a resignation to the endless demands of his position, yet he remains composed and authoritative.',
        ap.emotional_tags = ["augustus projects an air of playful engagement", "grandfatherly warmth as he interacts with gaius", "lucius. beneath this surface, a subtle layer of didactic purpose is evident; he's not just playing, but teaching. there's a hint of weariness in his tone when duty calls, a resignation to the endless demands of his position, yet he remains composed", "authoritative.", "augustus projects an air of playful engagement and grandfatherly warmth as he interacts with gaius and lucius. beneath this surface", "a subtle layer of didactic purpose is evident; he's not just playing", "but teaching. there's a hint of weariness in his tone when duty calls", "a resignation to the endless demands of his position", "yet he remains composed and authoritative.", "augustus projects an air of playful engagement and grandfatherly warmth as he interacts with gaius and lucius. beneath this surface, a subtle layer of didactic purpose is evident", "he's not just playing, but teaching. there's a hint of weariness in his tone when duty calls, a resignation to the endless demands of his position, yet he remains composed and authoritative.", "augustus projects an air of playful engagement and grandfatherly warmth as he interacts with gaius and lucius. beneath this surface, a subtle layer of didactic purpose is evident; he's not just playing,", "teaching. there's a hint of weariness in his tone when duty calls, a resignation to the endless demands of his position, yet he remains composed and authoritative."],
        ap.active_plans = ["To instruct his grandsons in the art of strategy and governance through the board game.", "To enjoy a fleeting moment of familial interaction amidst the pressures of imperial rule.", "To subtly instill in his grandsons the Roman value of duty above personal pleasure, preparing them for future responsibilities."],
        ap.beliefs = ["Strategic thinking is crucial for effective leadership and maintaining Roman power.", "Duty to Rome and the imperial lineage must always take precedence over personal desires.", "Early education in strategy and duty is vital for shaping future Roman leaders."],
        ap.goals = ["Short-term: To complete the current game turn and transition smoothly to imperial duties.", "Medium-term: To impart essential strategic and leadership lessons to Gaius and Lucius.", "Ultimate: To ensure the continuity and strength of the Roman Empire through his grandsons' preparedness for leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Gaius is intently focused on the board game, his brow furrowed in concentration as he considers his next move. He sits upright, pointing at the board and articulating his strategic decisions with youthful confidence, demonstrating a clear grasp of the game\'s mechanics and a competitive spirit. He eagerly awaits Augustus\'s reaction to his strategic choices.',
        ap.emotional_state = 'Gaius is animated and enthusiastic, displaying a keen interest in the game and a desire to impress his grandfather. He exudes youthful confidence in his strategic thinking, clearly enjoying the challenge and the attention from Augustus. There\'s a palpable eagerness to prove his strategic acumen and gain approval.',
        ap.emotional_tags = ["gaius is animated", "enthusiastic, displaying a keen interest in the game", "a desire to impress his grandfather. he exudes youthful confidence in his strategic thinking, clearly enjoying the challenge", "the attention from augustus. there's a palpable eagerness to prove his strategic acumen", "gain approval.", "gaius is animated and enthusiastic", "displaying a keen interest in the game and a desire to impress his grandfather. he exudes youthful confidence in his strategic thinking", "clearly enjoying the challenge and the attention from augustus. there's a palpable eagerness to prove his strategic acumen and gain approval."],
        ap.active_plans = ["To win the board game by strategically outmaneuvering his grandfather and brother.", "To demonstrate his understanding of strategy and impress Augustus with his tactical thinking.", "To learn and internalize the lessons Augustus is implicitly teaching through the game."],
        ap.beliefs = ["Strategic prowess is a sign of intelligence and strength, worthy of admiration.", "Winning is a desirable outcome, reflecting competence and skill.", "Augustus's approval and recognition are important and should be sought after."],
        ap.goals = ["Short-term: To execute his current strategic plan successfully within the game and gain an advantage.", "Medium-term: To develop and refine his strategic thinking abilities through gameplay and Augustus's guidance.", "Ultimate: To become a capable and respected leader, embodying the strategic virtues valued by Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Lucius sits at the game, excitedly throwing the dice and eagerly moving his pieces across the board. He is less focused on complex strategy than Gaius, more on the immediate gratification of dice rolls and claiming territories. He expresses disappointment when the game is interrupted, wanting to continue playing.',
        ap.emotional_state = 'Lucius is cheerful and exuberant, reveling in the playful atmosphere of the game and the attention from Augustus. He displays a childlike enthusiasm for the dice rolls and the immediate rewards of the game, less concerned with long-term strategy.  He is momentarily deflated by the interruption, showing a desire for continued play.',
        ap.emotional_tags = ["lucius is cheerful", "exuberant, reveling in the playful atmosphere of the game", "the attention from augustus. he displays a childlike enthusiasm for the dice rolls", "the immediate rewards of the game, less concerned with long-term strategy.  he is momentarily deflated by the interruption, showing a desire for continued play.", "lucius is cheerful and exuberant", "reveling in the playful atmosphere of the game and the attention from augustus. he displays a childlike enthusiasm for the dice rolls and the immediate rewards of the game", "less concerned with long-term strategy.  he is momentarily deflated by the interruption", "showing a desire for continued play."],
        ap.active_plans = ["To roll high numbers on the dice to advance his game pieces.", "To acquire territories on the game board and expand his game empire.", "To enjoy the playful interaction with Augustus and the lighthearted competition with Gaius."],
        ap.beliefs = ["Luck and chance (represented by dice rolls) play a significant role in determining outcomes.", "Games are meant to be enjoyable and entertaining.", "Spending time with Augustus is a pleasant and valued experience."],
        ap.goals = ["Short-term: To continue rolling the dice and enjoying the immediate fun of the game.", "Medium-term: To learn the basic rules of the game and participate actively in the playful competition.", "Ultimate: To have a happy and carefree childhood, enjoying the privileges and attention afforded to him within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at a lavishly decorated table, absorbed in a board game with his grandsons, Gaius and Lucius. He gestures animatedly, pointing out potential moves, embodying a grandfather’s joy while maintaining a commanding presence. The game pieces representing legions are strategically arranged, reflecting his dual role as both a playful elder and a calculating leader.',
        ap.emotional_state = 'Augustus displays a blend of warmth and authority; he is engaged and playful with his grandsons yet feels a palpable tension as he balances the joy of the game with the looming responsibilities of leadership. Underneath the surface playfulness lies a weight of duty that he must soon confront, creating a complex emotional landscape.',
        ap.emotional_tags = ["augustus displays a blend of warmth", "authority; he is engaged", "playful with his grandsons yet feels a palpable tension as he balances the joy of the game with the looming responsibilities of leadership. underneath the surface playfulness lies a weight of duty that he must soon confront, creating a complex emotional landscape.", "augustus displays a blend of warmth and authority; he is engaged and playful with his grandsons yet feels a palpable tension as he balances the joy of the game with the looming responsibilities of leadership. underneath the surface playfulness lies a weight of duty that he must soon confront", "creating a complex emotional landscape.", "augustus displays a blend of warmth and authority", "he is engaged and playful with his grandsons yet feels a palpable tension as he balances the joy of the game with the looming responsibilities of leadership. underneath the surface playfulness lies a weight of duty that he must soon confront, creating a complex emotional landscape."],
        ap.active_plans = ["Engage Gaius and Lucius in a playful yet educational manner, using the board game to teach them about strategy and governance.", "Make a quick decision to leave the game and attend to the pressing matter of family duty as Drusus requests to take his leave.", "Instill a sense of duty and responsibility in his grandsons, reminding them that obligations come before leisure."],
        ap.beliefs = ["The importance of duty over pleasure, emphasizing the weight of leadership.", "The need to prepare the next generation for the realities of power and responsibility.", "That family ties must be prioritized, even amidst the pleasure of games."],
        ap.goals = ["Short-term: Maintain an engaging atmosphere during the game with his grandsons.", "Medium-term: Reinforce the values of duty and responsibility in his family.", "Ultimate: Ensure the stability of the empire and the preparedness of the next generation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Drusus is not physically present in the room, but his presence looms large as Augustus prepares to leave the game to attend to him. His request indicates his importance and the weight of his position as a military leader, even as he grapples with the consequences of his impending leave.',
        ap.emotional_state = 'Although absent, Drusus\'s emotional state is one of underlying tension and urgency. His request to leave suggests a sense of duty mixed with the burdens of impending responsibilities, hinting at deeper anxieties regarding his role in the military and his standing within the family structure, especially under Livia’s watchful eye.',
        ap.emotional_tags = ["although absent, drusus's emotional state is one of underlying tension", "urgency. his request to leave suggests a sense of duty mixed with the burdens of impending responsibilities, hinting at deeper anxieties regarding his role in the military", "his standing within the family structure, especially under livia\u2019s watchful eye.", "although absent", "drusus's emotional state is one of underlying tension and urgency. his request to leave suggests a sense of duty mixed with the burdens of impending responsibilities", "hinting at deeper anxieties regarding his role in the military and his standing within the family structure", "especially under livia\u2019s watchful eye."],
        ap.active_plans = ["Seek audience with Augustus to discuss urgent matters regarding military operations.", "Address concerns regarding family dynamics and the political machinations at play.", "Prepare himself mentally for the challenges that lie ahead in Germany."],
        ap.beliefs = ["The importance of military duty and the burden it carries.", "A sense of loyalty to both family and the Roman Empire, which shapes his decision-making.", "The belief that his role as a leader requires sacrifice, even at the cost of personal desires."],
        ap.goals = ["Short-term: Communicate the urgency of his military position to Augustus.", "Medium-term: Ensure the smooth operation of Roman forces in Germania.", "Ultimate: Protect the stability and honor of the imperial family amidst political intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_slave_2_event_4_2'})
    ON CREATE SET
        ap.current_status = 'The slave enters the lavishly decorated room, interrupting the game with a respectful demeanor, announcing Drusus’s request to leave. His role is crucial as he serves as the conduit between the imperial family and the outside responsibilities that await them.',
        ap.emotional_state = 'The slave appears subservient, yet focused, fulfilling his role efficiently despite the potentially tense atmosphere. His actions reflect the rigid social hierarchy of Rome, where he must carry out commands without expressing personal emotions or opinions, embodying the complexities of servitude within the imperial court.',
        ap.emotional_tags = ["the slave appears subservient", "yet focused", "fulfilling his role efficiently despite the potentially tense atmosphere. his actions reflect the rigid social hierarchy of rome", "where he must carry out commands without expressing personal emotions or opinions", "embodying the complexities of servitude within the imperial court."],
        ap.active_plans = ["Deliver the message regarding Drusus's request with the utmost respect and efficiency.", "Navigate the strict social norms of the palace while ensuring he does not overstep his bounds.", "Remain attentive to Augustus's responses, ready to carry out further instructions as needed."],
        ap.beliefs = ["The necessity of unwavering loyalty and obedience to the imperial family.", "The understanding that his position is one of servitude, with limited agency in the court's dynamics.", "An awareness of the importance of effective communication within the hierarchical structure of Roman society."],
        ap.goals = ["Short-term: Successfully deliver the message to Augustus without disrupting the game further.", "Medium-term: Maintain the smooth functioning of palace operations through diligent service.", "Ultimate: Ensure his own safety and well-being within the perilous environment of Roman power dynamics."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_legions_game_pieces_event_5_1'})
    ON CREATE SET
        oi.description = 'The legion game pieces are integral to the scene, scattered across the game table and actively manipulated by Augustus and his grandsons during their strategy game. They serve as tangible representations of Roman military power, symbolizing the legions Drusus commands and the forces Gaius and Lucius will potentially lead in the future. The pieces facilitate a practical, hands-on lesson in military strategy, prompting questions and discussions about troop deployment and territorial control, directly influencing the dialogue and action within the scene.',
        oi.status_before = 'Scattered across the game table in Augustus\'s study, actively in use as part of the \'Empire\' board game, representing deployed Roman legions and territorial control within the game.',
        oi.status_after = 'Remaining scattered on the game table, undisturbed as Augustus instructs Gaius and Lucius not to move them in his absence, their position frozen, symbolizing the paused game and the ongoing strategic lessons imparted within the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_legions_game_pieces'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_board_game_event_5_1'})
    ON CREATE SET
        oi.description = 'The board game is central to the scene\'s setting and narrative function, providing the context for Augustus\'s interaction with his grandsons and Drusus. It serves as a pedagogical tool, allowing Augustus to instruct Gaius and Lucius in strategy and imperial governance through playful simulation. The game board, depicting territories like Egypt and Syria, frames the conversation around real-world strategic concerns, prompting the princes\' questions about military campaigns and Roman expansion, thus directly influencing the dialogue and thematic focus of the scene.',
        oi.status_before = 'Set up on a table in Augustus\'s study, partially played, with game pieces (legions) positioned across its map, indicating an ongoing session of \'Empire\' between Augustus and his grandsons.',
        oi.status_after = 'Remaining set up and undisturbed on the table in Augustus\'s study, its state unchanged physically, but its narrative significance heightened as a symbol of imperial education and the ongoing game of power within the Julio-Claudian dynasty, paused but ready to resume.'
    WITH oi
    MATCH (o:Object {uuid: 'object_board_game'})
    MATCH (e:Event {uuid: 'event_5_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Augustus, Emperor of Rome, is seated in his richly adorned study, having just concluded a strategic game of \'Empire\' with his grandsons. He transitions from a formal discussion with Drusus to a more personal farewell, inviting him for a walk in the palace garden. He dismisses Gaius and Lucius, signaling a shift from grandfatherly instruction to imperial duty.',
        ap.emotional_state = 'Augustus projects an air of weary authority, tinged with paternal fondness for his grandsons and a respectful, if slightly detached, affection for Drusus. Beneath the surface, there\'s a palpable sense of the burden of empire, a longing for simpler times, and a deep-seated anxiety about succession. He masks his vulnerabilities with imperial stoicism and calculated pronouncements, revealing a complex emotional landscape of weariness, responsibility, and hidden anxieties.',
        ap.emotional_tags = ["augustus projects an air of weary authority, tinged with paternal fondness for his grandsons", "a respectful, if slightly detached, affection for drusus. beneath the surface, there's a palpable sense of the burden of empire, a longing for simpler times,", "a deep-seated anxiety about succession. he masks his vulnerabilities with imperial stoicism", "calculated pronouncements, revealing a complex emotional landscape of weariness, responsibility,", "hidden anxieties.", "augustus projects an air of weary authority", "tinged with paternal fondness for his grandsons and a respectful", "if slightly detached", "affection for drusus. beneath the surface", "there's a palpable sense of the burden of empire", "a longing for simpler times", "and a deep-seated anxiety about succession. he masks his vulnerabilities with imperial stoicism and calculated pronouncements", "revealing a complex emotional landscape of weariness", "responsibility", "and hidden anxieties."],
        ap.active_plans = ["To gracefully conclude his interaction with Drusus and bid him farewell before his departure to the Rhine frontier.", "To subtly probe Drusus's political views and loyalty through their conversation in the garden.", "To continue shaping Gaius and Lucius into future leaders through strategic games and exposure to imperial matters."],
        ap.beliefs = ["The Roman Empire is too vast and complex for republican governance.", "Hereditary succession, despite its flaws, is the most pragmatic path for Rome's future.", "Family unity and loyalty are essential, yet often strained by the demands of power."],
        ap.goals = ["goals\": [\n          \"**(Short-term):** To ensure Drusus departs with a clear understanding of his duties and Augustus's expectations.", "**(Medium-term):** To secure a stable and peaceful succession, whether through Tiberius or his grandsons.", "**(Ultimate):** To maintain the Pax Romana and solidify the Julio-Claudian dynasty's hold on power for generations to come."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Young Gaius stands attentively beside his brother Lucius in Augustus\'s study, observing the interaction between the Emperor and Drusus. He is engaged with the strategy game pieces and eagerly poses a strategic question to Drusus about invading Britain, demonstrating his burgeoning interest in military matters and imperial expansion. He positions himself as a sharp, observant prince, absorbing the lessons of power.',
        ap.emotional_state = 'Gaius exudes youthful ambition and a competitive spirit, eager to impress Augustus and Drusus with his strategic acumen. He is confident and assertive, declaring his future intention to invade Britain and displaying familiarity with Julius Caesar\'s military commentaries. Beneath his youthful enthusiasm, a nascent seriousness and awareness of his imperial destiny are evident, revealing a mind keen to learn and assert itself in the games of power.',
        ap.emotional_tags = ["gaius exudes youthful ambition", "a competitive spirit, eager to impress augustus", "drusus with his strategic acumen. he is confident", "assertive, declaring his future intention to invade britain", "displaying familiarity with julius caesar's military commentaries. beneath his youthful enthusiasm, a nascent seriousness", "awareness of his imperial destiny are evident, revealing a mind keen to learn", "assert itself in the games of power.", "gaius exudes youthful ambition and a competitive spirit", "eager to impress augustus and drusus with his strategic acumen. he is confident and assertive", "declaring his future intention to invade britain and displaying familiarity with julius caesar's military commentaries. beneath his youthful enthusiasm", "a nascent seriousness and awareness of his imperial destiny are evident", "revealing a mind keen to learn and assert itself in the games of power."],
        ap.active_plans = ["To glean as much strategic knowledge as possible from Drusus's military expertise and experience.", "To demonstrate his strategic thinking and military aptitude to Augustus and Drusus, seeking their approval and recognition.", "To bid a respectful farewell to Drusus, adhering to the expected protocols of imperial interactions."],
        ap.beliefs = ["Military conquest and expansion are vital for Roman glory and power.", "Strategic thinking and military command are essential skills for a Roman leader and future emperor.", "He is destined for a significant and powerful role in shaping Rome's future."],
        ap.goals = ["**(Short-term):** To ask insightful questions and display strategic understanding during Drusus's visit, gaining valuable knowledge.", "**(Medium-term):** To develop into a skilled military commander and strategist, prepared to lead Roman legions.", "**(Ultimate):** To achieve military glory and political power, surpassing even Augustus's achievements and solidifying his place in Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Lucius stands beside Gaius in Augustus\'s study, observing the Emperor and Drusus, and engaging with the strategy game. He asks Drusus about the legions needed for a British invasion, displaying a youthful curiosity about military matters, though his reasoning is less refined than Gaius\'s. He is positioned as the younger, more enthusiastic prince, eager to participate and learn.',
        ap.emotional_state = 'Lucius radiates youthful enthusiasm and a desire to please. He is curious and actively participates by asking questions, though his strategic thinking is less developed than Gaius\'s, evidenced by his simplistic rationale for invading Britain. He is eager to engage with the adults and demonstrates a willingness to learn, portraying a youthful eagerness and a less overtly competitive nature compared to his brother.',
        ap.emotional_tags = ["lucius radiates youthful enthusiasm", "a desire to please. he is curious", "actively participates by asking questions, though his strategic thinking is less developed than gaius's, evidenced by his simplistic rationale for invading britain. he is eager to engage with the adults", "demonstrates a willingness to learn, portraying a youthful eagerness", "a less overtly competitive nature compared to his brother.", "lucius radiates youthful enthusiasm and a desire to please. he is curious and actively participates by asking questions", "though his strategic thinking is less developed than gaius's", "evidenced by his simplistic rationale for invading britain. he is eager to engage with the adults and demonstrates a willingness to learn", "portraying a youthful eagerness and a less overtly competitive nature compared to his brother."],
        ap.active_plans = ["To participate actively in the conversation and demonstrate his interest in military strategy to Drusus and Augustus.", "To showcase his knowledge and eagerness to learn, seeking approval from the elder figures.", "To bid farewell to Drusus respectfully, following the instructions and example set by Augustus and Gaius."],
        ap.beliefs = ["Military strength is a key component of Roman power and prestige.", "Learning from experienced figures like Drusus is important for his development as a prince.", "Obedience and respect towards Augustus and elder family members are expected and valued."],
        ap.goals = ["**(Short-term):** To engage in the conversation and demonstrate his interest during Drusus's visit, showing his participation.", "**(Medium-term):** To develop his understanding of strategy and military affairs under Augustus's guidance and tutelage.", "**(Ultimate):** To serve Rome loyally and fulfill his expected role within the imperial family, contributing to the dynasty's strength and stability, perhaps in a supporting role to Gaius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his richly appointed study, surrounded by Roman artifacts, overseeing a farewell to Drusus with a fatherly demeanor. He shares laughter and light banter, showing a strategic warmth that hints at his paternal pride while guiding the future of Rome.',
        ap.emotional_state = 'Augustus displays a surface of calm authority interlaced with nostalgia. His chuckles mask an underlying anxiety about succession and political stability, reflecting a longing for simpler times amidst the complexities of rule. He is torn between paternal affection and the burden of his responsibilities.',
        ap.emotional_tags = ["augustus displays a surface of calm authority interlaced with nostalgia. his chuckles mask an underlying anxiety about succession", "political stability, reflecting a longing for simpler times amidst the complexities of rule. he is torn between paternal affection", "the burden of his responsibilities.", "augustus displays a surface of calm authority interlaced with nostalgia. his chuckles mask an underlying anxiety about succession and political stability", "reflecting a longing for simpler times amidst the complexities of rule. he is torn between paternal affection and the burden of his responsibilities."],
        ap.active_plans = ["To solidify Drusus\u2019s loyalty and support as he departs for military duties.", "To promote Gaius and Lucius\u2019s understanding of governance through familial interactions and games.", "To navigate the delicate balance of power within the family while ensuring the empire\u2019s needs are met."],
        ap.beliefs = ["The importance of family loyalty and unity in maintaining a strong empire.", "That the burdens of leadership are essential for the greater good of Rome.", "That the youth must learn strategy and governance to prepare for their future roles."],
        ap.goals = ["Short-term: To ensure Drusus leaves with a sense of familial connection and purpose.", "Medium-term: To guide Gaius and Lucius in their understanding of imperial responsibilities.", "Ultimate: To secure a stable succession for Rome amidst the political machinations of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Drusus stands tall, exuding the confidence of a seasoned soldier ready for duty. He engages in light banter with Augustus while preparing to depart, showcasing a mixture of loyalty and eagerness for the challenges ahead.',
        ap.emotional_state = 'Drusus exhibits a surface-level bravado, masking deeper anxieties about the looming responsibilities and dangers of war. His humor belies an internal struggle with the weight of familial expectations and the volatile nature of Roman politics.',
        ap.emotional_tags = ["drusus exhibits a surface-level bravado, masking deeper anxieties about the looming responsibilities", "dangers of war. his humor belies an internal struggle with the weight of familial expectations", "the volatile nature of roman politics.", "drusus exhibits a surface-level bravado", "masking deeper anxieties about the looming responsibilities and dangers of war. his humor belies an internal struggle with the weight of familial expectations and the volatile nature of roman politics."],
        ap.active_plans = ["To reassure Augustus of his readiness and loyalty as he embarks on his mission.", "To gather insights from his father about governance and the political landscape of Rome.", "To maintain strong familial ties and ensure the safety of those he leaves behind."],
        ap.beliefs = ["The necessity of military strength for the survival of Rome and his family's legacy.", "That loyalty to family and duty are paramount, even in the face of personal sacrifice.", "That the wisdom of past leaders, such as Julius, should guide future military actions."],
        ap.goals = ["Short-term: To leave a lasting impression on Augustus and the boys as he departs for duty.", "Medium-term: To prove his worthiness and capability as a military leader.", "Ultimate: To ensure the stability of Rome and the safety of his family and the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Augustus, Emperor of Rome, walks with Drusus in the palace garden, having just concluded a strategy game with his grandsons. He shifts the conversation from military matters to familial ones, inquiring about Antonia\'s condition and her upcoming journey. He is physically present, directing the flow of conversation and subtly steering it towards his concerns about dynastic succession.',
        ap.emotional_state = 'Beneath his composed and paternal exterior, Augustus carries a deep-seated anxiety about the future of his dynasty. He expresses a genuine, albeit somewhat detached, concern for Antonia\'s wellbeing during her pregnancy, but this is quickly overshadowed by his broader, more politically driven concern about the need for heirs. His tone is authoritative yet tinged with weariness, revealing the burdens of leadership and the constant pressure to ensure stability through lineage. He is pragmatic, viewing even familial matters through the lens of imperial necessity.',
        ap.emotional_tags = ["beneath his composed", "paternal exterior, augustus carries a deep-seated anxiety about the future of his dynasty. he expresses a genuine, albeit somewhat detached, concern for antonia's wellbeing during her pregnancy, but this is quickly overshadowed by his broader, more politically driven concern about the need for heirs. his tone is authoritative yet tinged with weariness, revealing the burdens of leadership", "the constant pressure to ensure stability through lineage. he is pragmatic, viewing even familial matters through the lens of imperial necessity.", "beneath his composed and paternal exterior", "augustus carries a deep-seated anxiety about the future of his dynasty. he expresses a genuine", "albeit somewhat detached", "concern for antonia's wellbeing during her pregnancy", "but this is quickly overshadowed by his broader", "more politically driven concern about the need for heirs. his tone is authoritative yet tinged with weariness", "revealing the burdens of leadership and the constant pressure to ensure stability through lineage. he is pragmatic", "viewing even familial matters through the lens of imperial necessity.", "beneath his composed and paternal exterior, augustus carries a deep-seated anxiety about the future of his dynasty. he expresses a genuine, albeit somewhat detached, concern for antonia's wellbeing during her pregnancy,", "this is quickly overshadowed by his broader, more politically driven concern about the need for heirs. his tone is authoritative yet tinged with weariness, revealing the burdens of leadership and the constant pressure to ensure stability through lineage. he is pragmatic, viewing even familial matters through the lens of imperial necessity."],
        ap.active_plans = ["To express concern for Antonia's health as a show of familial duty.", "To subtly remind Drusus of the importance of procreation for the nobility and the empire.", "To reinforce the idea that family matters are intertwined with the stability and future of Rome."],
        ap.beliefs = ["The stability of Rome depends on a strong and numerous noble class.", "Procreation is a duty, especially for the nobility, to ensure the continuation of Roman greatness.", "The Emperor has a paternalistic role in guiding and even directing familial matters for the greater good of Rome."],
        ap.goals = ["{short_term: To ensure Antonia's safe travel and delivery., medium_term: To encourage noble families to have more children and secure the next generation of Roman leaders., ultimate: To solidify the Julio-Claudian dynasty's future and ensure the long-term stability and prosperity of Rome.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Drusus walks alongside Augustus in the palace garden, listening attentively to the Emperor\'s inquiries about Antonia. He responds to Augustus\'s questions about his wife\'s condition with a simple affirmation, indicating her wellbeing for the journey. He is physically present, engaged in a conversation initiated by Augustus, and reacting to the Emperor\'s concerns and pronouncements regarding family and duty. His posture is likely respectful, acknowledging Augustus\'s imperial status.',
        ap.emotional_state = 'Drusus displays a stoic and dutiful demeanor, characteristic of a Roman soldier and nobleman. While he acknowledges Antonia\'s pregnancy, his emotional response appears measured and understated, perhaps reflecting Roman reserve or a focus on practicalities over overt sentimentality.  He is likely aware of the dynastic implications of Antonia\'s pregnancy but does not outwardly express the same level of political calculation as Augustus. There might be a hint of personal affection for Antonia, but it is carefully contained within the bounds of Roman masculine decorum and duty to the Emperor.',
        ap.emotional_tags = ["drusus displays a stoic", "dutiful demeanor, characteristic of a roman soldier", "nobleman. while he acknowledges antonia's pregnancy, his emotional response appears measured", "understated, perhaps reflecting roman reserve or a focus on practicalities over overt sentimentality.  he is likely aware of the dynastic implications of antonia's pregnancy but does not outwardly express the same level of political calculation as augustus. there might be a hint of personal affection for antonia, but it is carefully contained within the bounds of roman masculine decorum", "duty to the emperor.", "drusus displays a stoic and dutiful demeanor", "characteristic of a roman soldier and nobleman. while he acknowledges antonia's pregnancy", "his emotional response appears measured and understated", "perhaps reflecting roman reserve or a focus on practicalities over overt sentimentality.  he is likely aware of the dynastic implications of antonia's pregnancy but does not outwardly express the same level of political calculation as augustus. there might be a hint of personal affection for antonia", "but it is carefully contained within the bounds of roman masculine decorum and duty to the emperor.", "drusus displays a stoic and dutiful demeanor, characteristic of a roman soldier and nobleman. while he acknowledges antonia's pregnancy, his emotional response appears measured and understated, perhaps reflecting roman reserve or a focus on practicalities over overt sentimentality.  he is likely aware of the dynastic implications of antonia's pregnancy", "does not outwardly express the same level of political calculation as augustus. there might be a hint of personal affection for antonia,", "it is carefully contained within the bounds of roman masculine decorum and duty to the emperor."],
        ap.active_plans = ["To reassure Augustus about Antonia's fitness to travel and her pregnancy.", "To acknowledge and respect Augustus's views on dynastic duty and the importance of noble families.", "To maintain a respectful and dutiful posture in conversation with the Emperor, especially as he prepares to depart for military service."],
        ap.beliefs = ["Familial duty is important, but military service to Rome is his primary obligation.", "Procreation is a natural part of life, but perhaps less of a state concern than Augustus emphasizes.", "Respect for the Emperor's authority and familial hierarchy is essential for maintaining Roman order."],
        ap.goals = ["{short_term: To provide Augustus with the information he seeks about Antonia and her condition., medium_term: To ensure Antonia's comfort and safety during their travels to the Rhine frontier., ultimate: To fulfill his military duty to Rome and uphold his familial responsibilities while navigating the complexities of imperial expectations.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS stands in his richly appointed study, surrounded by Roman artifacts that reflect his imperial power. He converses with DRUSUS, openly expressing his appreciation for Livia\'s contributions to the empire while revealing his weariness and dependence on her strength. His body language is relaxed yet burdened, hinting at the immense pressures of leadership.',
        ap.emotional_state = 'AUGUSTUS displays a mix of nostalgia and fatigue. His laughter is tinged with a sense of longing for simpler times, yet he carries the weight of guilt for his reliance on Livia. Internally, he grapples with the fear of succession and the fragility of his legacy, feeling both grateful for Livia\'s support and anxious about the future.',
        ap.emotional_tags = ["augustus displays a mix of nostalgia", "fatigue. his laughter is tinged with a sense of longing for simpler times, yet he carries the weight of guilt for his reliance on livia. internally, he grapples with the fear of succession", "the fragility of his legacy, feeling both grateful for livia's support", "anxious about the future.", "augustus displays a mix of nostalgia and fatigue. his laughter is tinged with a sense of longing for simpler times", "yet he carries the weight of guilt for his reliance on livia. internally", "he grapples with the fear of succession and the fragility of his legacy", "feeling both grateful for livia's support and anxious about the future."],
        ap.active_plans = ["To fortify his position by acknowledging Livia's contributions, thereby reinforcing her influence in the empire.", "To maintain a fa\u00e7ade of strength while subtly sharing his vulnerabilities with Drusus and the younger generation.", "To ensure the continuation of his lineage and the stability of Rome by emphasizing the importance of family ties and cooperation."],
        ap.beliefs = ["The belief that strong leadership is essential for the stability of Rome, and that he must navigate familial relationships to maintain power.", "A conviction that Livia is indispensable to the success of his reign, despite recognizing the pressures it places on her.", "A fear that any sign of weakness may destabilize his authority and lead to chaos within the empire."],
        ap.goals = ["Short-term: To successfully send Drusus off to battle with a sense of familial unity and support.", "Medium-term: To solidify Livia's role within the imperial structure, ensuring her influence is acknowledged and respected.", "Ultimate: To secure a lasting legacy for his family and the empire, avoiding the pitfalls of a fractured succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_4'})
    ON CREATE SET
        ap.current_status = 'DRUSUS stands in the study, poised yet respectful, engaging with AUGUSTUS while preparing for his departure. His demeanor reflects the confidence of a military leader, yet there’s a hint of concern as he discusses Rome’s future and his own family dynamics. He interacts with the younger boys, GAIUS and LUCIUS, showcasing his role as a mentor.',
        ap.emotional_state = 'DRUSUS expresses a blend of pride and duty, though beneath his confident exterior lies a flicker of anxiety about the burdens of leadership and the expectations placed upon him. He feels a deep loyalty to his family and a sense of protectiveness over them, especially regarding their future in the imperial structure.',
        ap.emotional_tags = ["drusus expresses a blend of pride", "duty, though beneath his confident exterior lies a flicker of anxiety about the burdens of leadership", "the expectations placed upon him. he feels a deep loyalty to his family", "a sense of protectiveness over them, especially regarding their future in the imperial structure.", "drusus expresses a blend of pride and duty", "though beneath his confident exterior lies a flicker of anxiety about the burdens of leadership and the expectations placed upon him. he feels a deep loyalty to his family and a sense of protectiveness over them", "especially regarding their future in the imperial structure."],
        ap.active_plans = ["To reassure AUGUSTUS of his readiness to lead while also expressing his desire to support the family.", "To foster a sense of continuity and strength within the Roman legions as he prepares for battle.", "To maintain familial bonds with GAIUS and LUCIUS, imparting wisdom and encouraging their interest in military strategy."],
        ap.beliefs = ["A belief in the importance of duty and honor as a soldier, feeling that his military service is for the greater good of Rome.", "The conviction that maintaining family unity is crucial to Rome's stability, especially with increasing pressures from rivals and internal strife.", "An awareness that the burdens of leadership can be both a source of strength and a significant weight to carry."],
        ap.goals = ["Short-term: To depart for battle with Augustus\u2019s blessing and ensure the boys feel supported in their ambitions.", "Medium-term: To uphold the honor of his family while navigating the treacherous political landscape of Rome.", "Ultimate: To secure a stable future for his family and the empire, preventing the rise of tyranny and preserving the Republic's ideals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Augustus walks with Drusus in the palace garden, his pace slow and contemplative as he reminisces about his past and the weight of his imperial responsibilities. He gestures occasionally, his tone shifting between wistful reflection and sharp pronouncements, embodying the weariness of a long-reigning emperor facing the twilight of his years.',
        ap.emotional_state = 'A melancholic weariness permeates Augustus\'s demeanor as he contemplates his reign and the simpler life he feels he has missed. Beneath the surface of imperial authority, a longing for personal freedom and a hint of regret flicker. He expresses a critical view of Mark Antony, tinged with a lingering rivalry even in Antony\'s absence, suggesting a need to justify his own choices and path to power. There\'s a subtle undercurrent of self-pity as he touches upon past personal sacrifices.',
        ap.emotional_tags = ["a melancholic weariness permeates augustus's demeanor as he contemplates his reign", "the simpler life he feels he has missed. beneath the surface of imperial authority, a longing for personal freedom", "a hint of regret flicker. he expresses a critical view of mark antony, tinged with a lingering rivalry even in antony's absence, suggesting a need to justify his own choices", "path to power. there's a subtle undercurrent of self-pity as he touches upon past personal sacrifices.", "a melancholic weariness permeates augustus's demeanor as he contemplates his reign and the simpler life he feels he has missed. beneath the surface of imperial authority", "a longing for personal freedom and a hint of regret flicker. he expresses a critical view of mark antony", "tinged with a lingering rivalry even in antony's absence", "suggesting a need to justify his own choices and path to power. there's a subtle undercurrent of self-pity as he touches upon past personal sacrifices."],
        ap.active_plans = ["To engage in a personal, reflective conversation with Drusus before his departure to gauge his loyalty and understanding of imperial rule.", "To subtly assert his authority and justify his life choices by contrasting himself with Mark Antony's perceived failures.", "To subtly explore Drusus's political leanings regarding the future of Rome and the nature of its governance."],
        ap.beliefs = ["The burden of ruling Rome is an isolating and immense weight that demands constant personal sacrifice.", "Mark Antony's failures were significant and detrimental to Rome, validating Augustus's own rise to power and contrasting his leadership.", "Maintaining power and order, even through autocratic means, is ultimately necessary for the stability and greatness of Rome."],
        ap.goals = ["**Short-term**: To have a meaningful and perhaps final personal exchange with Drusus before he leaves for the Rhine.", "**Medium-term**: To ensure the continued stability of the Roman Empire and secure a smooth succession, despite his weariness and expressed longing for a simpler life.", "**Ultimate**: To be remembered as the wise and necessary ruler who brought peace and prosperity to Rome, in stark contrast to the perceived failures of figures like Mark Antony."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Drusus walks respectfully alongside Augustus in the palace garden, listening attentively to the Emperor\'s reflections. He maintains a posture of dutiful attention, his responses measured and thoughtful, yet he engages in a frank exchange, especially when questioning the nature of imperial power and hinting at republican ideals.',
        ap.emotional_state = 'Drusus is respectful and dutiful in his interaction with Augustus, showing deference to the Emperor\'s age and position. However, beneath his outward compliance, there\'s a subtle current of idealism and perhaps concern for the future of Rome. He expresses a preference for republican values and questions the concentration of power, revealing an internal conflict between his loyalty and his personal convictions about governance. He maintains a calm and considered demeanor, carefully choosing his words.',
        ap.emotional_tags = ["drusus is respectful", "dutiful in his interaction with augustus, showing deference to the emperor's age", "position. however, beneath his outward compliance, there's a subtle current of idealism", "perhaps concern for the future of rome. he expresses a preference for republican values", "questions the concentration of power, revealing an internal conflict between his loyalty", "his personal convictions about governance. he maintains a calm", "considered demeanor, carefully choosing his words.", "drusus is respectful and dutiful in his interaction with augustus", "showing deference to the emperor's age and position. however", "beneath his outward compliance", "there's a subtle current of idealism and perhaps concern for the future of rome. he expresses a preference for republican values and questions the concentration of power", "revealing an internal conflict between his loyalty and his personal convictions about governance. he maintains a calm and considered demeanor", "carefully choosing his words."],
        ap.active_plans = ["To respectfully bid farewell to Augustus and express gratitude for the Emperor's guidance and conversation before departing for his military command.", "To subtly introduce his republican-leaning perspective into the conversation, testing the waters with Augustus regarding alternative forms of governance.", "To maintain a balance of respect and honest expression, ensuring he conveys his thoughts without appearing disloyal or challenging Augustus's authority directly."],
        ap.beliefs = ["The concentration of power in one man, even a benevolent one like Augustus, carries inherent risks and potential for corruption.", "The Roman Republic, despite its flaws, embodied certain virtues of shared governance and civic responsibility that are valuable.", "Personal honor and duty to Rome are paramount, even if they sometimes conflict with the demands of imperial ambition."],
        ap.goals = ["**Short-term**: To depart from Rome on good terms with Augustus, ensuring continued imperial favor and support for his command in Germany.", "**Medium-term**: To serve Rome honorably and effectively in his military role, upholding Roman values and expanding or defending its territories.", "**Ultimate**: To contribute to a more stable and virtuous Rome, possibly with a subtle hope for a future that incorporates more republican ideals, even if it's not immediately attainable."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_6'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS stands in his richly appointed study, filled with Roman artifacts, and speaks with a commanding yet reflective demeanor. He navigates the conversation with DRUSUS, expressing both a paternal warmth and the heavy burden of leadership. As he speaks, his gestures are measured, reflecting his high status and deep contemplation.',
        ap.emotional_state = 'AUGUSTUS exhibits a complex emotional state, oscillating between nostalgia and the weight of responsibility. His surface demeanor is light-hearted as he shares a chuckle with DRUSUS, yet beneath lies a profound anxiety about the future of Rome and the legacy he will leave behind. His memories of the past reveal a deep-seated regret and yearning for a simpler time.',
        ap.emotional_tags = ["augustus exhibits a complex emotional state, oscillating between nostalgia", "the weight of responsibility. his surface demeanor is light-hearted as he shares a chuckle with drusus, yet beneath lies a profound anxiety about the future of rome", "the legacy he will leave behind. his memories of the past reveal a deep-seated regret", "yearning for a simpler time.", "augustus exhibits a complex emotional state", "oscillating between nostalgia and the weight of responsibility. his surface demeanor is light-hearted as he shares a chuckle with drusus", "yet beneath lies a profound anxiety about the future of rome and the legacy he will leave behind. his memories of the past reveal a deep-seated regret and yearning for a simpler time."],
        ap.active_plans = ["To impart wisdom to Drusus regarding the military and strategic governance of the empire.", "To maintain the stability of his rule by reinforcing the importance of authority and legacy.", "To subtly dissuade Drusus from republican ideals and emphasize the necessity of autocratic rule."],
        ap.beliefs = ["The belief that a strong, centralized leadership is critical to maintaining the stability of Rome.", "The conviction that personal sacrifice is necessary for the greater good of the empire.", "The understanding that every action taken must consider the historical implications for both family and state."],
        ap.goals = ["Short-term: To ensure Drusus's loyalty and commitment to the imperial family before his departure.", "Medium-term: To solidify his legacy and the authority of the emperor in the eyes of his family and the Senate.", "Ultimate: To maintain the unity of the Roman Empire and prevent a return to the chaos of a republic."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_6'})
    ON CREATE SET
        ap.current_status = 'DRUSUS stands firm, embodying the strength of a military figure even as he engages with AUGUSTUS. His posture is upright, authoritative yet respectful, indicating his readiness to fulfill his duties. He responds to questions with thoughtful deliberation, comfortably fitting into the dialogue about military strategy and the empire\'s future.',
        ap.emotional_state = 'DRUSUS displays a mix of determination and underlying frustration at the constraints of imperial rule. Although he speaks with respect towards AUGUSTUS, there is an unmistakable tension as he probes the emperor about relinquishing power, revealing his republican leanings. His internal conflict emerges as a desire for a more democratic governance clashes with his familial loyalty.',
        ap.emotional_tags = ["drusus displays a mix of determination", "underlying frustration at the constraints of imperial rule. although he speaks with respect towards augustus, there is an unmistakable tension as he probes the emperor about relinquishing power, revealing his republican leanings. his internal conflict emerges as a desire for a more democratic governance clashes with his familial loyalty.", "drusus displays a mix of determination and underlying frustration at the constraints of imperial rule. although he speaks with respect towards augustus", "there is an unmistakable tension as he probes the emperor about relinquishing power", "revealing his republican leanings. his internal conflict emerges as a desire for a more democratic governance clashes with his familial loyalty."],
        ap.active_plans = ["To voice his concerns about the autocratic nature of Augustus's rule and advocate for a return to republican principles.", "To reinforce his commitment to the military, showcasing his readiness to lead and protect Rome.", "To maintain familial bonds while subtly challenging the current political structure."],
        ap.beliefs = ["The belief that the ideals of the Republic should be revived for the good of Rome.", "The conviction that power should not rest solely in the hands of one individual but be shared among the Senate.", "The understanding that a strong military presence is essential for the protection of Rome and its ideals."],
        ap.goals = ["Short-term: To have an open dialogue with Augustus about the future of governance in Rome.", "Medium-term: To gain support from fellow senators and military leaders for his vision of a republican revival.", "Ultimate: To reshape the political landscape of Rome, steering it away from autocracy towards a more democratic governance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_7'})
    ON CREATE SET
        ap.current_status = 'Augustus, Emperor of Rome, stands in his richly adorned study, having just concluded a playful strategy game with his grandsons, Gaius and Lucius. He transitions seamlessly from grandfatherly amusement to imperial gravitas as he engages in a private walk in the palace garden with Drusus, his posture still commanding despite his aging frame, his movements measured and deliberate.',
        ap.emotional_state = 'Beneath a veneer of avuncular warmth and imperial confidence, Augustus harbors a complex mix of weariness and anxiety. He expresses a nostalgic longing for simpler times, hinting at the immense burden of his office and the weight of responsibility for the empire\'s stability. There\'s a subtle defensiveness when discussing his past decisions, particularly regarding Livia and Antony, revealing a lingering need for validation. His bafflement and unease regarding Tiberius are palpable, yet he acknowledges his stepson\'s crucial role, betraying a deep-seated uncertainty about the future succession.',
        ap.emotional_tags = ["beneath a veneer of avuncular warmth", "imperial confidence, augustus harbors a complex mix of weariness", "anxiety. he expresses a nostalgic longing for simpler times, hinting at the immense burden of his office", "the weight of responsibility for the empire's stability. there's a subtle defensiveness when discussing his past decisions, particularly regarding livia", "antony, revealing a lingering need for validation. his bafflement", "unease regarding tiberius are palpable, yet he acknowledges his stepson's crucial role, betraying a deep-seated uncertainty about the future succession.", "beneath a veneer of avuncular warmth and imperial confidence", "augustus harbors a complex mix of weariness and anxiety. he expresses a nostalgic longing for simpler times", "hinting at the immense burden of his office and the weight of responsibility for the empire's stability. there's a subtle defensiveness when discussing his past decisions", "particularly regarding livia and antony", "revealing a lingering need for validation. his bafflement and unease regarding tiberius are palpable", "yet he acknowledges his stepson's crucial role", "betraying a deep-seated uncertainty about the future succession."],
        ap.active_plans = ["Project an image of familial unity and imperial strength to Drusus before his departure, reinforcing the narrative of a cohesive dynasty.", "Assess Drusus's political leanings, particularly his views on the Republic versus the Empire, gauging his loyalty and potential future alignment.", "Reaffirm his own decisions and the legitimacy of the imperial system, subtly justifying his long reign and consolidating his legacy in the face of unspoken doubts."],
        ap.beliefs = ["The stability of Rome hinges on a strong, centralized imperial authority, rendering the Republic obsolete.", "Maintaining the illusion of familial unity is paramount for projecting strength and preventing internal dissent within the dynasty.", "His own reign, despite its burdens and compromises, has been essential for Rome's prosperity and peace (Pax Romana)."],
        ap.goals = ["goals\": [\n          \"Short-term: Ensure a positive and reassuring farewell to Drusus, solidifying their familial bond and projecting an image of imperial control.", "Medium-term: Secure a stable succession and the continuation of the Julio-Claudian dynasty, despite his anxieties about Tiberius's enigmatic nature.", "Ultimate: Cement his legacy as the architect of Pax Romana and the enduring founder of the Roman Empire, ensuring its long-term stability and prosperity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_8'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his richly appointed study, engaging Drusus in a conversation about his impending departure. He portrays a mix of paternal fondness and political pragmatism, his posture relaxed yet authoritative, gesturing casually as he reflects on his own youthful ambitions. His eyes reveal a hint of nostalgia as he discusses the game with his grandsons, while his presence commands respect in the room.',
        ap.emotional_state = 'Outwardly, Augustus maintains a composed demeanor, tinged with warmth as he interacts with Drusus and the boys. However, beneath this facade, a deep sense of burden and longing simmers, rooted in his awareness of the political instability and his own unresolved past. He grapples with the weight of duty and the fear of losing control over his legacy.',
        ap.emotional_tags = ["outwardly, augustus maintains a composed demeanor, tinged with warmth as he interacts with drusus", "the boys. however, beneath this facade, a deep sense of burden", "longing simmers, rooted in his awareness of the political instability", "his own unresolved past. he grapples with the weight of duty", "the fear of losing control over his legacy.", "outwardly", "augustus maintains a composed demeanor", "tinged with warmth as he interacts with drusus and the boys. however", "beneath this facade", "a deep sense of burden and longing simmers", "rooted in his awareness of the political instability and his own unresolved past. he grapples with the weight of duty and the fear of losing control over his legacy."],
        ap.active_plans = ["To ensure Drusus's loyalty and readiness for military duties in Germany, reinforcing the importance of his role in maintaining imperial stability.", "To instill a sense of political strategy and governance in Gaius and Lucius, using their game as a teaching tool for future leadership.", "To navigate his complex relationship with Tiberius, balancing the need for his presence in Rome against Tiberius's expressed desire for escape."],
        ap.beliefs = ["The stability of the empire relies heavily on strong military leadership and the loyalty of his family.", "The importance of maintaining a fa\u00e7ade of control and order in the imperial family to prevent chaos.", "A deep-seated belief that the Republic's principles must be preserved, even if it conflicts with his role as emperor."],
        ap.goals = ["Short-term: To successfully send Drusus off with confidence and reassurance before he departs for military duty.", "Medium-term: To solidify the political future of Rome by ensuring the young princes are educated in governance and strategy.", "Ultimate: To maintain a legacy of peace and stability in the empire, safeguarding it against internal and external threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_8'})
    ON CREATE SET
        ap.current_status = 'Drusus stands before Augustus, a strong presence amidst the ornate surroundings. He speaks with conviction about his military duties, maintaining a respectful posture while expressing a candid view on his desire to leave Rome. His demeanor is a blend of loyalty and resolve, contrasting the lighter atmosphere of the room as he engages the younger boys in their game.',
        ap.emotional_state = 'Drusus exhibits a sense of duty mixed with a tinge of eagerness to escape the political intrigues of Rome. While he projects confidence, internally he grapples with the implications of leaving his family behind. There’s an underlying tension regarding the burdens he carries, especially in light of Livia\'s potential influence on family dynamics.',
        ap.emotional_tags = ["drusus exhibits a sense of duty mixed with a tinge of eagerness to escape the political intrigues of rome. while he projects confidence", "internally he grapples with the implications of leaving his family behind. there\u2019s an underlying tension regarding the burdens he carries", "especially in light of livia's potential influence on family dynamics."],
        ap.active_plans = ["To assert his readiness for military duty while reinforcing his loyalty to Augustus and the empire.", "To subtly advocate for Tiberius's desires during discussions, hinting at the need for change and understanding in their family dynamics.", "To ensure Antonia's well-being during their travels, demonstrating his role as both a soldier and a caring husband."],
        ap.beliefs = ["That his military service is not only a duty to Rome but a calling that aligns with his personal values.", "The necessity of strong leadership to maintain the empire's integrity, reflecting on familial roles and responsibilities.", "A conviction that the ideals of the Republic should be upheld, even as he navigates the complexities of his family's ambitions."],
        ap.goals = ["Short-term: To depart for Germany with clarity and purpose, ensuring Augustus's confidence in him.", "Medium-term: To engage in successful military campaigns, reinforcing his status as a beloved military leader.", "Ultimate: To foster a sense of unity within the family while striving for a balance between duty to Rome and personal commitments."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_9'})
    ON CREATE SET
        ap.current_status = 'Augustus is walking in the palace garden with Drusus, having just concluded a strategy game demonstration with his grandsons inside his study. He is engaged in a reflective, almost wistful conversation with Drusus about the burdens of leadership and the past. He turns as Livia enters, shifting his posture slightly to acknowledge her arrival and the change in atmosphere.',
        ap.emotional_state = 'Augustus is initially in a contemplative mood, expressing weariness and a longing for simpler times. He shows a degree of nostalgia and vulnerability, particularly when discussing his past with Drusus and the weight of his responsibilities. Upon Livia\'s arrival, he becomes more formal and deferential, yet relieved to shift the conversation back to the practical matters of state, subtly demonstrating his reliance on her.',
        ap.emotional_tags = ["augustus is initially in a contemplative mood, expressing weariness", "a longing for simpler times. he shows a degree of nostalgia", "vulnerability, particularly when discussing his past with drusus", "the weight of his responsibilities. upon livia's arrival, he becomes more formal", "deferential, yet relieved to shift the conversation back to the practical matters of state, subtly demonstrating his reliance on her.", "augustus is initially in a contemplative mood", "expressing weariness and a longing for simpler times. he shows a degree of nostalgia and vulnerability", "particularly when discussing his past with drusus and the weight of his responsibilities. upon livia's arrival", "he becomes more formal and deferential", "yet relieved to shift the conversation back to the practical matters of state", "subtly demonstrating his reliance on her."],
        ap.active_plans = ["To have a meaningful and possibly final personal conversation with Drusus before his departure to the Rhine frontier.", "To subtly assess Drusus's political leanings, particularly regarding the future of Roman governance and the concept of Republic versus monarchy.", "To transition from personal reflections back to the pressing concerns of imperial rule, utilizing Livia's arrival as a natural point of shift."],
        ap.beliefs = ["The weight of ruling Rome is an immense burden, isolating even the Emperor from genuine personal peace.", "Despite fleeting desires for a simpler life, stepping down from imperial duties and restoring the Republic is an impractical and undesirable option.", "Livia is an indispensable partner in managing the affairs of the empire, providing crucial support and counsel."],
        ap.goals = ["**Short-term**: To conclude his conversation with Drusus gracefully and with a sense of paternal guidance.", "**Medium-term**: To ensure the continued stability of the Roman Empire and manage the complexities of imperial succession.", "**Ultimate**: To secure his legacy as the architect of Pax Romana and ensure lasting peace and prosperity for Rome under his dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_9'})
    ON CREATE SET
        ap.current_status = 'Drusus is walking with Augustus in the palace garden, having just bid farewell to Gaius and Lucius in the study. He is engaged in a serious conversation with Augustus, broaching the topic of stepping down from office and hinting at republican ideals. He turns towards Livia as she enters, his posture becoming more formal and reserved, a noticeable shift from his more open demeanor with his father.',
        ap.emotional_state = 'Drusus is initially respectful and dutiful towards Augustus, yet also displays a subtle undercurrent of republican idealism and a genuine concern for the future direction of Rome. He is comfortable and relatively candid in his conversation with Augustus, but upon Livia\'s arrival, he becomes more guarded and polite, suggesting a potentially complex or strained dynamic with his mother. He carries a sense of impending departure and the weight of his military responsibilities.',
        ap.emotional_tags = ["drusus is initially respectful", "dutiful towards augustus, yet also displays a subtle undercurrent of republican idealism", "a genuine concern for the future direction of rome. he is comfortable", "relatively candid in his conversation with augustus, but upon livia's arrival, he becomes more guarded", "polite, suggesting a potentially complex or strained dynamic with his mother. he carries a sense of impending departure", "the weight of his military responsibilities.", "drusus is initially respectful and dutiful towards augustus", "yet also displays a subtle undercurrent of republican idealism and a genuine concern for the future direction of rome. he is comfortable and relatively candid in his conversation with augustus", "but upon livia's arrival", "he becomes more guarded and polite", "suggesting a potentially complex or strained dynamic with his mother. he carries a sense of impending departure and the weight of his military responsibilities.", "drusus is initially respectful and dutiful towards augustus, yet also displays a subtle undercurrent of republican idealism and a genuine concern for the future direction of rome. he is comfortable and relatively candid in his conversation with augustus,", "upon livia's arrival, he becomes more guarded and polite, suggesting a potentially complex or strained dynamic with his mother. he carries a sense of impending departure and the weight of his military responsibilities."],
        ap.active_plans = ["To respectfully engage with Augustus on matters of state and succession, subtly voicing his concerns about the drift towards monarchy.", "To bid a proper farewell to both Augustus and Livia before departing for his military command on the Rhine frontier.", "To maintain a respectful and dutiful facade while subtly asserting his own convictions regarding Roman governance and values."],
        ap.beliefs = ["The ideals of the Republic, though perhaps unattainable, represent a more virtuous and less corrupt form of Roman governance.", "Military service and adherence to Roman virtues are paramount for maintaining the strength and honor of Rome.", "Livia's ambition and influence, while powerful, might ultimately lead Rome down a dangerous path towards autocratic rule and Eastern-style corruption."],
        ap.goals = ["**Short-term**: To depart for the Rhine frontier and effectively execute his military duties, ensuring the security of the Roman borders.", "**Medium-term**: To serve Rome with honor and integrity, upholding the traditional values of Roman soldiery and civic duty.", "**Ultimate**: To contribute to a more virtuous and stable Rome, even if it means subtly challenging the current trajectory towards hereditary monarchy and unchecked imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_9'})
    ON CREATE SET
        ap.current_status = 'Livia enters Augustus\'s study, interrupting the conversation between Augustus and Drusus. She is composed and regal, her presence immediately commanding attention and shifting the atmosphere from personal reflection to imperial business. She is returning from diplomatic engagements with the Parthian ambassador, signaling her active role in managing Rome\'s international relations.',
        ap.emotional_state = 'Livia is assertive and purposeful, immediately taking command of the situation upon entering. Her tone is business-like and focused, devoid of sentimentality, indicating a pragmatic and efficient approach to governance. While polite, her demeanor is firm, subtly directing the conversation back to the pressing matters of state and imperial policy. Beneath the surface composure, there is an implicit drive to maintain control and ensure the smooth functioning of the empire under her and Augustus\'s guidance.',
        ap.emotional_tags = ["livia is assertive", "purposeful, immediately taking command of the situation upon entering. her tone is business-like", "focused, devoid of sentimentality, indicating a pragmatic", "efficient approach to governance. while polite, her demeanor is firm, subtly directing the conversation back to the pressing matters of state", "imperial policy. beneath the surface composure, there is an implicit drive to maintain control", "ensure the smooth functioning of the empire under her", "augustus's guidance.", "livia is assertive and purposeful", "immediately taking command of the situation upon entering. her tone is business-like and focused", "devoid of sentimentality", "indicating a pragmatic and efficient approach to governance. while polite", "her demeanor is firm", "subtly directing the conversation back to the pressing matters of state and imperial policy. beneath the surface composure", "there is an implicit drive to maintain control and ensure the smooth functioning of the empire under her and augustus's guidance."],
        ap.active_plans = ["To interrupt the potentially unproductive personal conversation between Augustus and Drusus and redirect the focus back to the practicalities of imperial governance.", "To assert her influence in imperial affairs by immediately discussing pressing matters like dispatches from Germany and diplomatic requests from Parthia.", "To subtly remind both Augustus and Drusus of her indispensable role in managing the empire and her unwavering dedication to its stability and expansion."],
        ap.beliefs = ["Hereditary monarchy is the only viable and stable form of government for Rome, ensuring continuity and strength.", "Strong, centralized imperial power is essential for maintaining Pax Romana and expanding Rome's dominance.", "Augustus, while powerful, requires her constant guidance and pragmatic approach to effectively manage the vast and complex empire."],
        ap.goals = ["**Short-term**: To swiftly redirect the conversation towards matters of state and ensure Augustus remains focused on his imperial duties.", "**Medium-term**: To solidify Tiberius's position as the heir apparent and secure the long-term dominance of her family's dynasty over Rome.", "**Ultimate**: To ensure the continued expansion and prosperity of the Roman Empire under a strong, centralized imperial rule, guided by her influence and strategic vision."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_10'})
    ON CREATE SET
        ap.current_status = 'Drusus stands confidently before Augustus, maintaining an upright posture that reflects his military training. His tone is assertive as he responds to questions about his departure, displaying a readiness for action and a soldier\'s pride in his military duties. He engages with Augustus and the boys with a mix of warmth and professional detachment, navigating the complexities of familial bonds and expectations.',
        ap.emotional_state = 'Drusus exhibits a surface-level bravado, masking any underlying anxiety about the responsibilities of military command. While he outwardly embraces his duty and expresses confidence about dealing with the Cherusci, there is a hint of conflict in his demeanor—he grapples with the weight of familial expectations and the burdens of leadership, especially regarding Livia\'s expectations and Augustus\'s reliance on him.',
        ap.emotional_tags = ["drusus exhibits a surface-level bravado, masking any underlying anxiety about the responsibilities of military command. while he outwardly embraces his duty", "expresses confidence about dealing with the cherusci, there is a hint of conflict in his demeanor\u2014he grapples with the weight of familial expectations", "the burdens of leadership, especially regarding livia's expectations", "augustus's reliance on him.", "drusus exhibits a surface-level bravado", "masking any underlying anxiety about the responsibilities of military command. while he outwardly embraces his duty and expresses confidence about dealing with the cherusci", "there is a hint of conflict in his demeanor\u2014he grapples with the weight of familial expectations and the burdens of leadership", "especially regarding livia's expectations and augustus's reliance on him."],
        ap.active_plans = ["To prepare for and lead military campaigns in response to threats from the Cherusci tribe.", "To ensure the safety of Rome's borders and uphold his family's legacy in military affairs.", "To maintain a semblance of familial closeness and support, particularly regarding Augustus's younger grandsons."],
        ap.beliefs = ["The importance of military strength and decisive action to ensure the safety of the Roman Empire.", "A sense of duty and honor towards his family and the imperial lineage.", "The belief that Rome should not revert to a Republic, reflecting a commitment to the current imperial structure."],
        ap.goals = ["Short-term: To successfully execute his upcoming military campaign in Germania.", "Medium-term: To strengthen family ties and fulfill his role as a son while navigating the complex dynamics with Livia and Augustus.", "Ultimate: To secure a legacy of honor within the Roman military and uphold the family's standing in Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_10'})
    ON CREATE SET
        ap.current_status = 'Livia enters the study with an air of authority, her presence commanding immediate attention. She positions herself strategically to steer the conversation towards military matters, focusing on the threats posed by the Cherusci tribe. Her gestures are precise and purposeful, conveying both concern and a calculated intent to assert her influence over Drusus\'s decisions.',
        ap.emotional_state = 'Livia maintains a composed exterior, embodying the confidence of a seasoned manipulator of court dynamics. However, beneath the surface, there is an undercurrent of urgency and perhaps anxiety about maintaining control over military affairs and the family’s future. Her tone is firm but layered, suggesting a deep-seated concern for the empire\'s security and her son\'s role in it.',
        ap.emotional_tags = ["livia maintains a composed exterior, embodying the confidence of a seasoned manipulator of court dynamics. however, beneath the surface, there is an undercurrent of urgency", "perhaps anxiety about maintaining control over military affairs", "the family\u2019s future. her tone is firm but layered, suggesting a deep-seated concern for the empire's security", "her son's role in it.", "livia maintains a composed exterior", "embodying the confidence of a seasoned manipulator of court dynamics. however", "beneath the surface", "there is an undercurrent of urgency and perhaps anxiety about maintaining control over military affairs and the family\u2019s future. her tone is firm but layered", "suggesting a deep-seated concern for the empire's security and her son's role in it.", "livia maintains a composed exterior, embodying the confidence of a seasoned manipulator of court dynamics. however, beneath the surface, there is an undercurrent of urgency and perhaps anxiety about maintaining control over military affairs and the family\u2019s future. her tone is firm", "layered, suggesting a deep-seated concern for the empire's security and her son's role in it."],
        ap.active_plans = ["To reinforce Drusus's military responsibilities and ensure he understands the significance of the threats from Germany.", "To maintain her grip on the familial and political structure, ensuring that no one undermines her influence over military decisions.", "To subtly remind Augustus of the burdens of leadership while positioning herself as an indispensable ally."],
        ap.beliefs = ["The conviction that strong military leadership is essential to the stability of Rome and her family's power.", "The belief that she must control the dynamics of power within the family to secure Tiberius's place as the heir.", "A deep-seated view that Rome must never revert to republicanism, reinforcing her alignment with Augustus's vision."],
        ap.goals = ["Short-term: To ensure Drusus is prepared for his upcoming military role and understands the importance of the Cherusci threat.", "Medium-term: To solidify her influence over both Drusus and Augustus, positioning herself as the key advisor in military matters.", "Ultimate: To manipulate the political landscape to secure Tiberius's ascension and fortify the Julio-Claudian dynasty's power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_11'})
    ON CREATE SET
        ap.current_status = 'Augustus is walking with Drusus in the palace garden, having just dismissed his grandsons. He engages in a reflective conversation with Drusus, expressing his weariness with the burdens of rule and his consideration of traditional Roman values. He listens intently to Drusus\'s perspectives, pausing occasionally in thought as they stroll amidst the greenery.',
        ap.emotional_state = 'Augustus is contemplative and somewhat world-weary, revealing a deep fatigue with his imperial responsibilities. He expresses a genuine longing for a simpler life, hinting at an internal struggle with the weight of his office. While outwardly composed, there\'s an undercurrent of anxiety about the future of Rome and his legacy. He shows a flicker of guilt and regret when mentioning Drusus\'s deceased father and his past actions.',
        ap.emotional_tags = ["augustus is contemplative", "somewhat world-weary, revealing a deep fatigue with his imperial responsibilities. he expresses a genuine longing for a simpler life, hinting at an internal struggle with the weight of his office. while outwardly composed, there's an undercurrent of anxiety about the future of rome", "his legacy. he shows a flicker of guilt", "regret when mentioning drusus's deceased father", "his past actions.", "augustus is contemplative and somewhat world-weary", "revealing a deep fatigue with his imperial responsibilities. he expresses a genuine longing for a simpler life", "hinting at an internal struggle with the weight of his office. while outwardly composed", "there's an undercurrent of anxiety about the future of rome and his legacy. he shows a flicker of guilt and regret when mentioning drusus's deceased father and his past actions."],
        ap.active_plans = ["To gauge Drusus's understanding of the complexities of Roman governance and his loyalty to traditional values.", "To firmly reject the Parthian request for emperor worship, upholding Roman religious and political norms.", "To subtly assess Drusus's views on succession and the future of Roman leadership, without explicitly addressing it directly."],
        ap.beliefs = ["Emperor worship is fundamentally against Roman tradition and could offend the existing Roman gods.", "The immense burden of ruling Rome is exhausting and sometimes feels overwhelming.", "The ideals of the Roman Republic, though perhaps unattainable now, still hold a certain virtue and should inform Roman governance."],
        ap.goals = ["short-term\": \"To clearly communicate his rejection of the Parthian temple dedication to Livia and Drusus.", "medium-term\": \"To maintain the stability of the Roman Empire by adhering to established Roman values and traditions.", "ultimate\": \"To ensure his legacy as a wise and principled ruler who upheld Roman dignity and prevented the corruption of Roman ideals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_11'})
    ON CREATE SET
        ap.current_status = 'Drusus walks beside Augustus in the palace garden, listening attentively to the Emperor\'s reflections and responding with thoughtful consideration. He engages in a respectful yet firm debate with Augustus and Livia about Roman values and the implications of emperor worship. He stands tall and maintains eye contact, projecting an image of Roman stoicism and integrity as he prepares to depart for military duty.',
        ap.emotional_state = 'Drusus is serious and principled, displaying a deep concern for the integrity of Roman values and governance. While respectful of Augustus, he is also resolute in his own convictions, particularly regarding the dangers of hereditary monarchy and emperor worship. He subtly expresses disapproval of Livia\'s pragmatic approach, revealing an internal conflict between familial loyalty and his commitment to traditional Roman ideals.',
        ap.emotional_tags = ["drusus is serious", "principled, displaying a deep concern for the integrity of roman values", "governance. while respectful of augustus, he is also resolute in his own convictions, particularly regarding the dangers of hereditary monarchy", "emperor worship. he subtly expresses disapproval of livia's pragmatic approach, revealing an internal conflict between familial loyalty", "his commitment to traditional roman ideals.", "drusus is serious and principled", "displaying a deep concern for the integrity of roman values and governance. while respectful of augustus", "he is also resolute in his own convictions", "particularly regarding the dangers of hereditary monarchy and emperor worship. he subtly expresses disapproval of livia's pragmatic approach", "revealing an internal conflict between familial loyalty and his commitment to traditional roman ideals."],
        ap.active_plans = ["To express his concern to Augustus about the drift towards hereditary monarchy and the potential corruption of Roman governance.", "To support Augustus's rejection of emperor worship, reinforcing traditional Roman religious and political norms.", "To bid farewell to Augustus and Livia before departing for his military command on the Rhine frontier, ensuring his duty to Rome is fulfilled."],
        ap.beliefs = ["Rome should not emulate Eastern potentates and descend into hereditary monarchy and corruption.", "Traditional Roman values of republicanism and civic virtue are essential for Rome's long-term health.", "Emperor worship is a dangerous departure from Roman tradition and could undermine the foundations of Roman society."],
        ap.goals = ["short-term\": \"To clearly articulate his concerns about emperor worship and hereditary monarchy to both Augustus and Livia.", "medium-term\": \"To uphold traditional Roman values within his own actions and influence, resisting the trend towards autocratic rule.", "ultimate\": \"To contribute to a stable and virtuous future for Rome, preserving its core principles and preventing its descent into tyranny and decadence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_11'})
    ON CREATE SET
        ap.current_status = 'Livia enters the garden with a composed and commanding presence, interrupting Augustus and Drusus\'s conversation. She immediately addresses the Parthian ambassador\'s request, presenting a pragmatic political perspective. She engages in a subtle debate, attempting to persuade Augustus to see the political advantages of accepting the Parthian offer, maintaining a controlled and persuasive demeanor.',
        ap.emotional_state = 'Livia is outwardly calm, pragmatic, and politically astute. She prioritizes political expediency and maintaining Roman influence, even if it means deviating from traditional Roman values. Internally, she is focused on consolidating power and securing Rome\'s position on the world stage. She appears dismissive of what she may perceive as Augustus\'s and Drusus\'s overly traditional or idealistic views, prioritizing practical political gains.',
        ap.emotional_tags = ["livia is outwardly calm, pragmatic,", "politically astute. she prioritizes political expediency", "maintaining roman influence, even if it means deviating from traditional roman values. internally, she is focused on consolidating power", "securing rome's position on the world stage. she appears dismissive of what she may perceive as augustus's", "drusus's overly traditional or idealistic views, prioritizing practical political gains.", "livia is outwardly calm", "pragmatic", "and politically astute. she prioritizes political expediency and maintaining roman influence", "even if it means deviating from traditional roman values. internally", "she is focused on consolidating power and securing rome's position on the world stage. she appears dismissive of what she may perceive as augustus's and drusus's overly traditional or idealistic views", "prioritizing practical political gains."],
        ap.active_plans = ["To persuade Augustus to accept the Parthian offer of a temple dedication, emphasizing the political benefits and diplomatic advantages.", "To manage the Parthian diplomatic situation effectively, ensuring good relations and leveraging the situation to Rome's advantage.", "To subtly advance her agenda of consolidating imperial power and influence, even if it means pushing the boundaries of traditional Roman values."],
        ap.beliefs = ["Political pragmatism and the expansion of Roman influence are paramount for the empire's survival and prosperity.", "Traditional Roman values should be adaptable and secondary to the practical needs of maintaining and expanding Roman power.", "Emperor worship, particularly in distant territories, can be a useful tool for enhancing Roman prestige and control, without necessarily compromising Roman values within Rome itself."],
        ap.goals = ["short-term\": \"To convince Augustus to agree to the Parthian temple dedication for political gain.", "medium-term\": \"To strengthen Rome's political and diplomatic influence through strategic maneuvering and pragmatic decisions.", "ultimate\": \"To ensure a powerful and stable Roman Empire under her family's leadership, securing long-term dominance and influence, even if it requires adapting traditional Roman norms."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_12'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his richly appointed study, projecting an air of authority as he discusses military matters with Drusus. His posture is relaxed yet commanding, reflective of his dual role as both emperor and paternal figure. He prepares to dismiss the matter of divine worship with conviction, indicating his firm adherence to Roman values.',
        ap.emotional_state = 'Augustus exhibits a surface calmness, his demeanor warm yet tinged with the weight of his responsibilities. Internally, he wrestles with a mix of nostalgia for his earlier days as a soldier and a lingering sadness as he recognizes the burdens of leadership. His emotional conflict underscores a desire for familial connection amidst the strains of duty and tradition.',
        ap.emotional_tags = ["augustus exhibits a surface calmness, his demeanor warm yet tinged with the weight of his responsibilities. internally, he wrestles with a mix of nostalgia for his earlier days as a soldier", "a lingering sadness as he recognizes the burdens of leadership. his emotional conflict underscores a desire for familial connection amidst the strains of duty", "tradition.", "augustus exhibits a surface calmness", "his demeanor warm yet tinged with the weight of his responsibilities. internally", "he wrestles with a mix of nostalgia for his earlier days as a soldier and a lingering sadness as he recognizes the burdens of leadership. his emotional conflict underscores a desire for familial connection amidst the strains of duty and tradition."],
        ap.active_plans = ["To reinforce the importance of Roman traditions by rejecting the notion of divine worship.", "To maintain control over the succession and governance of Rome through his familial relations.", "To ensure the well-being of his family, particularly by nurturing the next generation in the ways of leadership."],
        ap.beliefs = ["The sanctity of traditional Roman values and the necessity of maintaining a Republic over an imperial deity.", "The importance of familial bonds in securing the future of Rome.", "That leadership requires personal sacrifice and the acceptance of burdens."],
        ap.goals = ["Short-term: To successfully bid farewell to Drusus while reinforcing family ties.", "Medium-term: To guide the next generation, particularly Gaius and Lucius, in the responsibilities of power.", "Ultimate: To ensure the stability and continuity of the empire through a well-prepared succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_12'})
    ON CREATE SET
        ap.current_status = 'Livia enters the study, her presence commanding and filled with purpose. She engages with Drusus about his upcoming departure, displaying a composed facade that masks her underlying ambitions. She shifts the conversation towards matters of state with a keen awareness of the implications of Drusus’s military duties.',
        ap.emotional_state = 'On the surface, Livia presents an air of maternal concern, yet internally, she harbors ambitions that drive her every interaction. Her sharp intellect and strategic mindset simmer beneath her calm exterior, revealing a woman fully aware of the political landscape she navigates. There is an unspoken tension between her maternal instincts and her ambition to secure her son\'s place.',
        ap.emotional_tags = ["on the surface, livia presents an air of maternal concern, yet internally, she harbors ambitions that drive her every interaction. her sharp intellect", "strategic mindset simmer beneath her calm exterior, revealing a woman fully aware of the political landscape she navigates. there is an unspoken tension between her maternal instincts", "her ambition to secure her son's place.", "on the surface", "livia presents an air of maternal concern", "yet internally", "she harbors ambitions that drive her every interaction. her sharp intellect and strategic mindset simmer beneath her calm exterior", "revealing a woman fully aware of the political landscape she navigates. there is an unspoken tension between her maternal instincts and her ambition to secure her son's place."],
        ap.active_plans = ["To subtly reinforce her influence over Drusus\u2019s military decisions.", "To manipulate the narrative surrounding her family\u2019s power dynamics, particularly concerning Tiberius.", "To maintain her position as a key advisor to Augustus while manipulating the perception of her family\u2019s unity."],
        ap.beliefs = ["The necessity of ruthless ambition in securing power for her lineage.", "That familial loyalty is a tool to be wielded for political gain.", "The belief that the ends justify the means in the pursuit of securing the throne for Tiberius."],
        ap.goals = ["Short-term: To ensure Drusus\u2019s loyalty and readiness as he departs for military duty.", "Medium-term: To consolidate power within the imperial family and maintain her influence over Augustus.", "Ultimate: To secure the throne for Tiberius through strategic manipulation of familial ties and political machinations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_13'})
    ON CREATE SET
        ap.current_status = 'Drusus, having just bid farewell to Augustus and his young grandsons, now finds himself directly addressed by Livia. He stands attentively in the opulent study, turning to face his mother as she delivers her pointed warning. He listens, his military posture suggesting respect, but his gaze reveals a thoughtful consideration of her words.',
        ap.emotional_state = 'Drusus is caught slightly off guard by Livia\'s sudden shift in demeanor from the earlier familial pleasantries to a starkly political warning. He displays outward composure, but internally he is likely experiencing a mix of surprise and perhaps a touch of defiance. He might feel a subtle challenge to his own expressed views about the burden of imperial rule, and a sense of needing to tread carefully in his response to his formidable mother.',
        ap.emotional_tags = ["drusus is caught slightly off guard by livia's sudden shift in demeanor from the earlier familial pleasantries to a starkly political warning. he displays outward composure, but internally he is likely experiencing a mix of surprise", "perhaps a touch of defiance. he might feel a subtle challenge to his own expressed views about the burden of imperial rule,", "a sense of needing to tread carefully in his response to his formidable mother.", "drusus is caught slightly off guard by livia's sudden shift in demeanor from the earlier familial pleasantries to a starkly political warning. he displays outward composure", "but internally he is likely experiencing a mix of surprise and perhaps a touch of defiance. he might feel a subtle challenge to his own expressed views about the burden of imperial rule", "and a sense of needing to tread carefully in his response to his formidable mother.", "drusus is caught slightly off guard by livia's sudden shift in demeanor from the earlier familial pleasantries to a starkly political warning. he displays outward composure,", "internally he is likely experiencing a mix of surprise and perhaps a touch of defiance. he might feel a subtle challenge to his own expressed views about the burden of imperial rule, and a sense of needing to tread carefully in his response to his formidable mother."],
        ap.active_plans = ["Listen carefully to Livia's admonition and understand the depth of her concern regarding Augustus's power.", "Subtly defend his earlier comment to Augustus about the burdens of office and the possibility of stepping down.", "Maintain a respectful tone while implicitly standing by his convictions about the nature of Roman governance, even if they diverge from Livia's unwavering imperialist stance."],
        ap.beliefs = ["He believes in the virtues of the Roman Republic, or at least in limiting the absolute power of a single ruler, as suggested by his father's leanings and his own comments.", "He believes in open and honest discourse, even within the family, about the best course for Rome, although he is learning the limits of such openness.", "He believes in filial duty and respect, but also in the importance of expressing his own informed opinions, even when they might contradict those of powerful family members."],
        ap.goals = ["Short-term: To understand the immediate implications of Livia's warning and respond appropriately in the moment.", "Medium-term: To navigate the complex family dynamics and maintain a functional relationship with Livia, despite their differing political views.", "Ultimate: To contribute to the stability and prosperity of Rome, even if his vision for achieving this differs from the autocratic path favored by Livia and the current imperial system."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_13'})
    ON CREATE SET
        ap.current_status = 'As soon as Augustus is out of earshot, Livia pivots her attention to Drusus, her demeanor sharpening instantly. She moves closer, her voice dropping to a more private, urgent tone, her eyes fixed intently on her son. Her posture is commanding, her presence filling the space, ensuring her warning lands with its full weight.',
        ap.emotional_state = 'Livia is operating from a place of steely resolve and ambition, thinly veiled beneath a facade of concern for Rome\'s stability. Outwardly, she projects an air of urgent matriarchal guidance, but internally she is driven by a fierce determination to maintain control and secure her family\'s grip on power. There\'s an undercurrent of anxiety that any suggestion of Augustus relinquishing power threatens her carefully laid plans, fueling her decisive and immediate intervention with Drusus.',
        ap.emotional_tags = ["livia is operating from a place of steely resolve", "ambition, thinly veiled beneath a facade of concern for rome's stability. outwardly, she projects an air of urgent matriarchal guidance, but internally she is driven by a fierce determination to maintain control", "secure her family's grip on power. there's an undercurrent of anxiety that any suggestion of augustus relinquishing power threatens her carefully laid plans, fueling her decisive", "immediate intervention with drusus.", "livia is operating from a place of steely resolve and ambition", "thinly veiled beneath a facade of concern for rome's stability. outwardly", "she projects an air of urgent matriarchal guidance", "but internally she is driven by a fierce determination to maintain control and secure her family's grip on power. there's an undercurrent of anxiety that any suggestion of augustus relinquishing power threatens her carefully laid plans", "fueling her decisive and immediate intervention with drusus.", "livia is operating from a place of steely resolve and ambition, thinly veiled beneath a facade of concern for rome's stability. outwardly, she projects an air of urgent matriarchal guidance,", "internally she is driven by a fierce determination to maintain control and secure her family's grip on power. there's an undercurrent of anxiety that any suggestion of augustus relinquishing power threatens her carefully laid plans, fueling her decisive and immediate intervention with drusus."],
        ap.active_plans = ["Immediately counteract any influence Drusus might have had in encouraging Augustus to consider stepping down from his imperial role.", "Clearly and forcefully assert the necessity of maintaining the current imperial structure to Drusus, framing it as essential for Rome's well-being.", "Reaffirm her own authority and political acumen within the family dynamic, subtly reminding Drusus of her dominant role in shaping the imperial agenda and family strategy."],
        ap.beliefs = ["She firmly believes that the imperial system is the only viable form of governance for Rome, essential to prevent chaos and maintain order.", "She believes that Augustus's continued rule is paramount for the stability of the empire and the furtherance of her dynastic ambitions.", "She believes that any questioning of imperial power, even by family members, is a dangerous threat that must be swiftly and decisively addressed to maintain control."],
        ap.goals = ["Short-term: To immediately shut down any notion Drusus might harbor about Augustus stepping down and ensure his alignment with her imperial vision.", "Medium-term: To reinforce the imperial structure and solidify her and her family's control over Rome's destiny, preventing any shift towards republican ideals.", "Ultimate: To secure the imperial succession for Tiberius and establish the Julio-Claudian dynasty as an enduring and unchallengeable power in Rome, ensuring her lasting legacy as the architect of this dynasty's strength."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_14'})
    ON CREATE SET
        ap.current_status = 'Drusus stands before Augustus, poised yet subtly defiant, as he prepares to depart for military duty. He maintains an upright posture, reflecting his military background, while his gaze flickers between Augustus and Livia, conveying both resolve and a hint of sadness. His words are imbued with a sense of duty, yet he challenges the notion of hereditary monarchy, signaling his ideological stance against the corruption he perceives.',
        ap.emotional_state = 'Drusus exhibits a calm exterior, though beneath the surface, there is an undercurrent of melancholy and concern for his family’s future. His defiance towards Livia hints at an emotional distance, revealing a subtle conflict between familial loyalty and his beliefs. He is torn between respect for his mother and his vision for the Republic, highlighting a broader internal struggle within him.',
        ap.emotional_tags = ["drusus exhibits a calm exterior, though beneath the surface, there is an undercurrent of melancholy", "concern for his family\u2019s future. his defiance towards livia hints at an emotional distance, revealing a subtle conflict between familial loyalty", "his beliefs. he is torn between respect for his mother", "his vision for the republic, highlighting a broader internal struggle within him.", "drusus exhibits a calm exterior", "though beneath the surface", "there is an undercurrent of melancholy and concern for his family\u2019s future. his defiance towards livia hints at an emotional distance", "revealing a subtle conflict between familial loyalty and his beliefs. he is torn between respect for his mother and his vision for the republic", "highlighting a broader internal struggle within him."],
        ap.active_plans = ["To affirm his commitment to military service while subtly challenging the idea of hereditary monarchy.", "To express his views on the dangers of corruption in leadership, advocating for a return to Republican ideals.", "To maintain familial bonds by bidding farewell, while also addressing the emotional complexities of his relationship with Livia."],
        ap.beliefs = ["A strong conviction in the principles of the Republic and the importance of avoiding hereditary rule.", "The belief that power should not corrupt familial relationships, advocating for a just and moral governance.", "A sense of duty to the Roman people and the military, prioritizing Rome\u2019s well-being over personal ambitions."],
        ap.goals = ["Short-term: To successfully communicate his feelings about the dangers of monarchy and corruption during his farewell.", "Medium-term: To ensure that his departure does not cause further rifts within his family and to leave a positive impression on the young boys.", "Ultimate: To influence future governance in Rome towards a more Republican model and to uphold the values instilled in him during his upbringing."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_14'})
    ON CREATE SET
        ap.current_status = 'Livia enters the study, her presence commanding attention as she immediately addresses Drusus with a tone that is both affectionate and authoritative. She stands tall, her posture radiating confidence and control, as she engages in a discussion about the implications of his military service and the political landscape. Her gestures are deliberate, emphasizing her points with a subtle yet manipulative intent.',
        ap.emotional_state = 'Livia exhibits a composed exterior, masking any underlying tension regarding Drusus\'s departure. Outwardly, she shows concern for her son’s safety and the implications of his military actions, but internally, she harbors ambitions that may conflict with his ideals. Her emotional state hints at a protective instinct over her political aspirations, revealing a complex relationship with her children.',
        ap.emotional_tags = ["livia exhibits a composed exterior, masking any underlying tension regarding drusus's departure. outwardly, she shows concern for her son\u2019s safety", "the implications of his military actions, but internally, she harbors ambitions that may conflict with his ideals. her emotional state hints at a protective instinct over her political aspirations, revealing a complex relationship with her children.", "livia exhibits a composed exterior", "masking any underlying tension regarding drusus's departure. outwardly", "she shows concern for her son\u2019s safety and the implications of his military actions", "but internally", "she harbors ambitions that may conflict with his ideals. her emotional state hints at a protective instinct over her political aspirations", "revealing a complex relationship with her children.", "livia exhibits a composed exterior, masking any underlying tension regarding drusus's departure. outwardly, she shows concern for her son\u2019s safety and the implications of his military actions,", "internally, she harbors ambitions that may conflict with his ideals. her emotional state hints at a protective instinct over her political aspirations, revealing a complex relationship with her children."],
        ap.active_plans = ["To reinforce her influence over Drusus's decisions and ensure he prioritizes familial loyalty over Republican ideals.", "To subtly manipulate the conversation towards the importance of strong leadership in the face of potential threats.", "To maintain her control and presence in the family dynamic, ensuring that her ambitions for succession are not undermined."],
        ap.beliefs = ["A conviction that the stability of Rome demands a strong, centralized authority, which may conflict with Drusus's Republican ideals.", "The belief in her role as a protector and guide for her family, particularly regarding the survival of her son Tiberius's path to power.", "A pragmatic view of power dynamics, believing that familial bonds can be leveraged for greater political gain."],
        ap.goals = ["Short-term: To reinforce her influence over Drusus as he prepares to leave, ensuring he aligns with her views on leadership.", "Medium-term: To maintain her grip on the family dynamics that could affect her plans for Tiberius\u2019s ascension.", "Ultimate: To secure a lasting legacy for her family and the Julio-Claudian dynasty, ensuring that ambition does not lead to disunity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands within Vipsania\'s modest dwelling, his posture reflecting a mix of desperation and pleading. He moves closer to her, attempting to breach the physical and emotional distance she maintains, his actions underscored by a fervent desire to dissuade her from remarrying and to reclaim their past intimacy.',
        ap.emotional_state = 'Tiberius is consumed by raw anguish and possessiveness, oscillating between desperate pleas and veiled threats. Outwardly, his tone is fraught with despair, his words laced with a possessive edge (\'You\'re mine!\'). Internally, he is battling a profound sense of loss, fear of the future without Vipsania, and a deep self-loathing for his past actions that led to their separation. His emotional state is a volatile mix of vulnerability and suppressed rage, fueled by the unbearable prospect of losing Vipsania permanently.',
        ap.emotional_tags = ["tiberius is consumed by raw anguish", "possessiveness, oscillating between desperate pleas", "veiled threats. outwardly, his tone is fraught with despair, his words laced with a possessive edge ('you're mine!'). internally, he is battling a profound sense of loss, fear of the future without vipsania,", "a deep self-loathing for his past actions that led to their separation. his emotional state is a volatile mix of vulnerability", "suppressed rage, fueled by the unbearable prospect of losing vipsania permanently.", "tiberius is consumed by raw anguish and possessiveness", "oscillating between desperate pleas and veiled threats. outwardly", "his tone is fraught with despair", "his words laced with a possessive edge ('you're mine!'). internally", "he is battling a profound sense of loss", "fear of the future without vipsania", "and a deep self-loathing for his past actions that led to their separation. his emotional state is a volatile mix of vulnerability and suppressed rage", "fueled by the unbearable prospect of losing vipsania permanently."],
        ap.active_plans = ["Plead with Vipsania to reconsider her decision to remarry, emphasizing his enduring love and desperation.", "Attempt to evoke Vipsania's past feelings for him, reminding her of their shared intimacy and connection.", "Express the depth of his despair and the catastrophic impact her remarriage will have on his emotional well-being, even hinting at self-destructive thoughts to emphasize his pain."],
        ap.beliefs = ["Vipsania is still fundamentally 'his' despite the divorce, clinging to the idea of their unbreakable bond.", "His love for Vipsania is exceptional and irreplaceable, believing no other relationship can offer him the same fulfillment.", "His future happiness and stability are inextricably linked to Vipsania's presence in his life, viewing her remarriage as a personal catastrophe."],
        ap.goals = ["{type: short-term, description: Prevent Vipsania from proceeding with her remarriage plans in the immediate future, hoping to buy time and influence her decision.}", "{type: medium-term, description: Re-establish a meaningful connection with Vipsania, even if it must remain clandestine, seeking solace and emotional refuge in her presence.}", "{type: ultimate, description: Escape the confines of his loveless political marriage to Julia and ultimately reunite with Vipsania, envisioning a future where they can be together without external constraints, though this goal is increasingly unrealistic.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Vipsania maintains a cautious stance near a shuttered window in her dimly lit house, her physical positioning suggesting a desire for distance and concealment. She gestures for Tiberius to leave, her movements restrained yet firm, emphasizing the danger of his presence and the need for him to depart immediately.',
        ap.emotional_state = 'Vipsania projects an outward composure and pragmatic resolve, yet beneath the surface, she is deeply conflicted and saddened. Her tone is firm as she urges Tiberius to leave, expressing concern for their safety, but moments of vulnerability betray her lingering affection (\'Oh, my baby, my baby\'). Internally, she grapples with the painful remnants of her love for Tiberius, the necessity of self-preservation in a politically treacherous environment, and the difficult choice to prioritize her future stability over her past desires. There\'s a poignant tension between her outward practicality and her suppressed sorrow.',
        ap.emotional_tags = ["vipsania projects an outward composure", "pragmatic resolve, yet beneath the surface, she is deeply conflicted", "saddened. her tone is firm as she urges tiberius to leave, expressing concern for their safety, but moments of vulnerability betray her lingering affection ('oh, my baby, my baby'). internally, she grapples with the painful remnants of her love for tiberius, the necessity of self-preservation in a politically treacherous environment,", "the difficult choice to prioritize her future stability over her past desires. there's a poignant tension between her outward practicality", "her suppressed sorrow.", "vipsania projects an outward composure and pragmatic resolve", "yet beneath the surface", "she is deeply conflicted and saddened. her tone is firm as she urges tiberius to leave", "expressing concern for their safety", "but moments of vulnerability betray her lingering affection ('oh", "my baby", "my baby'). internally", "she grapples with the painful remnants of her love for tiberius", "the necessity of self-preservation in a politically treacherous environment", "and the difficult choice to prioritize her future stability over her past desires. there's a poignant tension between her outward practicality and her suppressed sorrow.", "vipsania projects an outward composure and pragmatic resolve, yet beneath the surface, she is deeply conflicted and saddened. her tone is firm as she urges tiberius to leave, expressing concern for their safety,", "moments of vulnerability betray her lingering affection ('oh, my baby, my baby'). internally, she grapples with the painful remnants of her love for tiberius, the necessity of self-preservation in a politically treacherous environment, and the difficult choice to prioritize her future stability over her past desires. there's a poignant tension between her outward practicality and her suppressed sorrow."],
        ap.active_plans = ["Persistently urge Tiberius to leave her house, prioritizing her safety and avoiding potential repercussions from his clandestine visit.", "Reinforce the finality of their divorce and the impossibility of rekindling their relationship due to social and political realities.", "Justify her decision to remarry as a necessary measure to deter Tiberius's persistent pursuit and protect herself from the watchful eyes of Livia's spies, emphasizing the practical motivations behind her choice."],
        ap.beliefs = ["Her past relationship with Tiberius is irrevocably over, and attempting to revive it would be both futile and dangerous for both of them.", "Maintaining a strict distance from Tiberius is crucial for her personal safety and well-being, given the ever-present surveillance and political risks.", "Remarrying offers her a viable path to move forward and establish a secure, independent life, free from the complications and dangers associated with Tiberius."],
        ap.goals = ["{type: short-term, description: Ensure Tiberius departs from her house without delay and understands the immediate danger of his presence, securing her immediate safety.}", "{type: medium-term, description: Establish a new, stable life independent of Tiberius through her remarriage, seeking a sense of security and normalcy outside of their tumultuous past.}", "{type: ultimate, description: Achieve lasting peace and emotional security by definitively severing ties with Tiberius and building a future free from the shadows of their past relationship and the ever-present threat of imperial intrigue, prioritizing her long-term well-being and stability.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands near Vipsania, his posture tense, reflecting a mix of desperation and anger. He moves closer to her, pleading, his hands gesturing emphatically as he tries to convey his feelings. His voice cracks with emotion, revealing the weight of his turmoil.',
        ap.emotional_state = 'Tiberius is overwhelmed by despair and anger. Outwardly, he shows fervent passion as he pleads with Vipsania, yet internally, he grapples with feelings of betrayal and helplessness. His conflicting emotions intensify as he confronts the reality of his past actions and their consequences.',
        ap.emotional_tags = ["tiberius is overwhelmed by despair", "anger. outwardly, he shows fervent passion as he pleads with vipsania, yet internally, he grapples with feelings of betrayal", "helplessness. his conflicting emotions intensify as he confronts the reality of his past actions", "their consequences.", "tiberius is overwhelmed by despair and anger. outwardly", "he shows fervent passion as he pleads with vipsania", "yet internally", "he grapples with feelings of betrayal and helplessness. his conflicting emotions intensify as he confronts the reality of his past actions and their consequences."],
        ap.active_plans = ["To persuade Vipsania not to remarry and to rekindle their past relationship.", "To express his deep-seated love and desire for a life together despite the political circumstances.", "To confront the painful truths of his situation, challenging both Vipsania's choices and his mothers' influence."],
        ap.beliefs = ["True love transcends political obligations and should prevail.", "His past decisions were coerced and thus should be reconsidered.", "He believes that reconnecting with Vipsania can offer him salvation from his current despair."],
        ap.goals = ["Short-term: To have Vipsania acknowledge their love and persuade her not to marry again.", "Medium-term: To regain control over his own emotions and decisions in relation to Vipsania.", "Ultimate: To escape the suffocating expectations of his imperial role and live a life filled with genuine love."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Vipsania stands resolutely near the window, her back slightly turned to Tiberius, embodying a conflicted stance between affection and duty. She gestures emphatically as she tries to push him away, her voice rises in intensity, displaying her inner turmoil as she confronts Tiberius\'s pleas.',
        ap.emotional_state = 'Vipsania experiences a whirlpool of emotions—she feels sadness, anger, and a sense of obligation. Outwardly, she expresses strong resolve to distance herself, while internally, she struggles with the pain of their lost love and the necessity of her choices amidst the political landscape.',
        ap.emotional_tags = ["vipsania experiences a whirlpool of emotions\u2014she feels sadness, anger,", "a sense of obligation. outwardly, she expresses strong resolve to distance herself, while internally, she struggles with the pain of their lost love", "the necessity of her choices amidst the political landscape.", "vipsania experiences a whirlpool of emotions\u2014she feels sadness", "anger", "and a sense of obligation. outwardly", "she expresses strong resolve to distance herself", "while internally", "she struggles with the pain of their lost love and the necessity of her choices amidst the political landscape.", "vipsania experiences a whirlpool of emotions\u2014she feels sadness, anger, and a sense of obligation. outwardly, she expresses strong resolve to distance herself,", "internally, she struggles with the pain of their lost love and the necessity of her choices amidst the political landscape."],
        ap.active_plans = ["To maintain her decision to remarry to safeguard her future and minimize repercussions.", "To assert her independence from Tiberius while also acknowledging their shared past.", "To protect herself and her family from the potential dangers posed by Tiberius's continued pursuit."],
        ap.beliefs = ["Personal happiness must align with societal expectations, even if it means sacrificing love.", "Her choices are dictated by circumstances beyond her control, including Tiberius's actions.", "She believes that moving on is essential for her well-being and the stability of her life."],
        ap.goals = ["Short-term: To end the emotional turmoil by firmly establishing boundaries with Tiberius.", "Medium-term: To embrace a new life with her future husband while navigating the implications of her past.", "Ultimate: To find peace and happiness away from the shadow of Tiberius and the imperial family's influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands within Vipsania\'s modest dwelling, his presence filling the dimly lit space with a palpable tension. He is actively pleading with Vipsania, his posture leaning towards her, hands perhaps outstretched in supplication as he begs her not to send him away. His movements are urgent, desperate, as he attempts to close the emotional distance that has grown between them, demanding she open the shutters to see her clearly.',
        ap.emotional_state = 'Tiberius is consumed by despair and a volatile mix of possessiveness and grief. Outwardly, he expresses anger and a sense of entitlement, declaring \'I won\'t have it! I\'ll kill you! You\'re mine!\' However, beneath this aggressive facade lies a profound internal anguish. He is terrified of losing Vipsania permanently, revealing a deep-seated fear of becoming unrecognizable without her \'sweetness,\' indicating a fragile emotional state masked by outbursts of possessive rage.',
        ap.emotional_tags = ["tiberius is consumed by despair", "a volatile mix of possessiveness", "grief. outwardly, he expresses anger", "a sense of entitlement, declaring 'i won't have it! i'll kill you! you're mine!' however, beneath this aggressive facade lies a profound internal anguish. he is terrified of losing vipsania permanently, revealing a deep-seated fear of becoming unrecognizable without her 'sweetness,' indicating a fragile emotional state masked by outbursts of possessive rage.", "tiberius is consumed by despair and a volatile mix of possessiveness and grief. outwardly", "he expresses anger and a sense of entitlement", "declaring 'i won't have it! i'll kill you! you're mine!' however", "beneath this aggressive facade lies a profound internal anguish. he is terrified of losing vipsania permanently", "revealing a deep-seated fear of becoming unrecognizable without her 'sweetness", "' indicating a fragile emotional state masked by outbursts of possessive rage."],
        ap.active_plans = ["To persuade Vipsania to reconsider her decision to remarry, appealing to their past love and shared history.", "To convince Vipsania that their love is worth fighting for, despite the political and social obstacles.", "To express the overwhelming depth of his despair and fear of a future without her, hoping to evoke her sympathy and change her mind."],
        ap.beliefs = ["Vipsania rightfully belongs to him, despite their divorce, clinging to the idea that their bond transcends legal separations.", "His love for Vipsania is a fundamental part of his identity, and losing her will fundamentally alter him for the worse.", "Political and societal pressures are unjust and should not dictate the course of their personal lives and love."],
        ap.goals = ["{type: short-term, description: Prevent Vipsania from going through with her remarriage, halting the immediate threat of losing her to another man.}", "{type: medium-term, description: Re-establish a meaningful relationship with Vipsania, even if it must be clandestine, rekindling the intimacy and connection they once shared.}", "{type: ultimate, description: Escape the confines of his loveless political marriage and reunite with Vipsania permanently, envisioning a life where their love is not dictated by imperial demands, even contemplating a tragic escape in death.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Vipsania stands resolutely near a shuttered window, her body language suggesting a desire to remain closed off and protected from Tiberius\'s emotional onslaught. She maintains a defensive posture, repeatedly urging Tiberius to leave, emphasizing the danger and impropriety of his visit. Her gestures are likely restrained, focused on maintaining distance while delivering firm, albeit sorrowful, pronouncements about the reality of their situation.',
        ap.emotional_state = 'Vipsania presents a surface of resigned practicality and firmness, attempting to reason with Tiberius and highlighting the \'wrongness\' and \'danger\' of his presence. Internally, she is deeply conflicted and saddened. While she expresses empathy and lingering affection, even calling him \'my baby,\' she is resolute in her decision to move on.  There\'s a tension between her underlying love for Tiberius and her pragmatic acceptance of their impossible situation, driven by a desire for self-preservation and a weary understanding of the futility of their love in the face of Roman politics.',
        ap.emotional_tags = ["vipsania presents a surface of resigned practicality", "firmness, attempting to reason with tiberius", "highlighting the 'wrongness'", "'danger' of his presence. internally, she is deeply conflicted", "saddened. while she expresses empathy", "lingering affection, even calling him 'my baby,' she is resolute in her decision to move on.  there's a tension between her underlying love for tiberius", "her pragmatic acceptance of their impossible situation, driven by a desire for self-preservation", "a weary understanding of the futility of their love in the face of roman politics.", "vipsania presents a surface of resigned practicality and firmness", "attempting to reason with tiberius and highlighting the 'wrongness' and 'danger' of his presence. internally", "she is deeply conflicted and saddened. while she expresses empathy and lingering affection", "even calling him 'my baby", "' she is resolute in her decision to move on.  there's a tension between her underlying love for tiberius and her pragmatic acceptance of their impossible situation", "driven by a desire for self-preservation and a weary understanding of the futility of their love in the face of roman politics."],
        ap.active_plans = ["To firmly reject Tiberius's advances and reinforce the boundaries of their current relationship, emphasizing that they are no longer married and cannot be together.", "To persuade Tiberius to leave her house immediately, stressing the potential repercussions for both of them if he is discovered there.", "To communicate the reasons behind her decision to remarry, framing it as a necessary step to end Tiberius's pursuit and to create a semblance of normalcy in her life."],
        ap.beliefs = ["Her relationship with Tiberius is definitively over, and there is no possibility of reconciliation given the political realities and their divorce.", "Continuing to engage with Tiberius will only bring more danger and pain for both of them, attracting unwanted attention from Livia and the imperial court.", "She deserves to have a life beyond the shadow of her past with Tiberius, and remarriage offers a path towards stability and a cessation of his disruptive presence."],
        ap.goals = ["{type: short-term, description: End Tiberius's visit quickly and decisively, ensuring he understands that their meeting must be their last and that he must leave her alone.}", "{type: medium-term, description: Successfully remarry and establish a stable, independent life, free from the emotional turmoil and political complications associated with Tiberius.}", "{type: ultimate, description: Find a measure of peace and emotional security in her new life, accepting the loss of her love with Tiberius as a closed chapter and focusing on building a future for herself, even if it lacks the passionate intensity of her past.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised in the reception hall, her regal figure commanding attention amidst the marble grandeur. She leans slightly towards the Senator, lowering her voice conspiratorially, her sharp eyes glinting with calculated intent as she manipulates the conversation about Augustus\'s deification.',
        ap.emotional_state = 'Livia\'s surface demeanor is calm and composed, exuding an air of confidence as she engages the Senator. However, beneath this polished exterior lies a deep-seated ambition and a sense of urgency to assert her influence, revealing a cunning mind at work, unyielding in her determination to secure her political goals.',
        ap.emotional_tags = ["livia's surface demeanor is calm", "composed, exuding an air of confidence as she engages the senator. however, beneath this polished exterior lies a deep-seated ambition", "a sense of urgency to assert her influence, revealing a cunning mind at work, unyielding in her determination to secure her political goals.", "livia's surface demeanor is calm and composed", "exuding an air of confidence as she engages the senator. however", "beneath this polished exterior lies a deep-seated ambition and a sense of urgency to assert her influence", "revealing a cunning mind at work", "unyielding in her determination to secure her political goals."],
        ap.active_plans = ["To subtly persuade the Senator to advocate for Augustus's deification, despite his reluctance.", "To solidify her own position by showcasing her political acumen in navigating Senate dynamics.", "To manipulate the perception of Augustus's modesty for her own advantage, ensuring that her plans align with his public persona."],
        ap.beliefs = ["Deification of Augustus is a strategic move that could consolidate her family's power.", "Political expediency often outweighs personal feelings in the machinations of power.", "Her own influence should guide the Senate's decisions, even if it involves bending Augustus's wishes."],
        ap.goals = ["Short-term: Secure the Senator's support for her agenda regarding Augustus.", "Medium-term: Shift the Senate's perception to align with her vision of Augustus's deification.", "Ultimate: Elevate Tiberius's position and influence by manipulating the imperial narrative to her advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_1'})
    ON CREATE SET
        ap.current_status = 'The Senator stands slightly to the side, his posture attentive yet cautious, reflecting a blend of deference and wariness towards Livia\'s sharp intellect. He nods and murmurs in response, weighing every word exchanged with her, fully aware of the intricate game they are playing.',
        ap.emotional_state = 'On the surface, the Senator appears composed and diplomatic, though a flicker of unease lingers beneath his calm facade. He grapples with the implications of Livia\'s maneuverings, aware that any misstep could embroil him in the treacherous waters of imperial politics, revealing his internal conflict between loyalty and self-preservation.',
        ap.emotional_tags = ["on the surface, the senator appears composed", "diplomatic, though a flicker of unease lingers beneath his calm facade. he grapples with the implications of livia's maneuverings, aware that any misstep could embroil him in the treacherous waters of imperial politics, revealing his internal conflict between loyalty", "self-preservation.", "on the surface", "the senator appears composed and diplomatic", "though a flicker of unease lingers beneath his calm facade. he grapples with the implications of livia's maneuverings", "aware that any misstep could embroil him in the treacherous waters of imperial politics", "revealing his internal conflict between loyalty and self-preservation."],
        ap.active_plans = ["To listen carefully to Livia's suggestions and gauge her true intentions regarding Augustus's deification.", "To navigate the political landscape of the Senate without openly opposing Livia, preserving his position.", "To prepare for potential opposition in the Senate while aligning himself with Livia's objectives."],
        ap.beliefs = ["The Senate's role is to balance the ambitions of the imperial family with the will of the people.", "Livia's ambitions are formidable and should be approached with caution.", "Deification of Augustus could shift the balance of power but may also provoke dissent."],
        ap.goals = ["Short-term: Maintain a position of influence in the Senate by aligning with Livia's agenda.", "Medium-term: Ensure that any push for Augustus's deification is handled delicately to avoid backlash.", "Ultimate: Navigate the political landscape to secure his personal safety and standing within the ever-shifting dynamics of power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the reception hall, engaging a Senator in a private, hushed conversation. She is the picture of imperial regality, her posture erect and commanding, her gaze sharp and focused on the Senator.  She articulates her political strategy with precision, leaning in slightly to emphasize key points, her gestures controlled yet purposeful, ensuring her directives are clearly understood.',
        ap.emotional_state = 'Livia projects an aura of unwavering confidence and control. Her tone is measured and assured, betraying no hint of doubt or hesitation. Beneath this composed exterior, however, lies a core of ruthless determination. She is driven by her ambition for power and the unwavering conviction in her own political acumen. Any personal reservations Augustus might hold are inconsequential to her strategic vision; she is solely focused on manipulating the political landscape to her advantage.',
        ap.emotional_tags = ["livia projects an aura of unwavering confidence", "control. her tone is measured", "assured, betraying no hint of doubt or hesitation. beneath this composed exterior, however, lies a core of ruthless determination. she is driven by her ambition for power", "the unwavering conviction in her own political acumen. any personal reservations augustus might hold are inconsequential to her strategic vision; she is solely focused on manipulating the political landscape to her advantage.", "livia projects an aura of unwavering confidence and control. her tone is measured and assured", "betraying no hint of doubt or hesitation. beneath this composed exterior", "however", "lies a core of ruthless determination. she is driven by her ambition for power and the unwavering conviction in her own political acumen. any personal reservations augustus might hold are inconsequential to her strategic vision; she is solely focused on manipulating the political landscape to her advantage.", "livia projects an aura of unwavering confidence and control. her tone is measured and assured, betraying no hint of doubt or hesitation. beneath this composed exterior, however, lies a core of ruthless determination. she is driven by her ambition for power and the unwavering conviction in her own political acumen. any personal reservations augustus might hold are inconsequential to her strategic vision", "she is solely focused on manipulating the political landscape to her advantage."],
        ap.active_plans = ["Instruct the Senator on the specific 'line to take' in the Senate debates regarding Augustus's deification.", "Ensure the Senate perceives Augustus's deification as 'politically useful' to sway their decision.", "Override Augustus's personal modesty and reservations to achieve her political objectives for the dynasty."],
        ap.beliefs = ["Political expediency must always supersede personal sentiment, even that of the Emperor.", "Augustus's deification is a critical step to solidify imperial power and legacy.", "Her strategic guidance is essential to navigate the complexities of Roman politics and ensure favorable outcomes."],
        ap.goals = ["short-term\": \"Secure the Senator's immediate and unquestioning support for her deification strategy.", "medium-term\": \"Orchestrate a successful Senate debate and vote in favor of Augustus's deification.", "ultimate\": \"Consolidate her own influence and power within the empire by successfully maneuvering the Senate and achieving her political aims, thus reinforcing her position as a key strategist."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_2'})
    ON CREATE SET
        ap.current_status = 'The Senator is positioned in close proximity to Livia, engaged in an intense, whispered discussion within the formal reception hall. He listens intently, his body language suggesting attentiveness and deference to Livia\'s assertive presence. He interjects with cautious questions and remarks, seeking clarification and direction from the Empress, his posture slightly bowed, indicating respect for her imperial status.',
        ap.emotional_state = 'The Senator displays a mixture of caution and political calculation. Outwardly, he is respectful and compliant, carefully considering Livia\'s words. Internally, he is likely weighing the political implications of supporting Augustus\'s deification and assessing the potential risks and rewards. There\'s an undercurrent of unease, hinted at by his cautious questions, as he navigates the delicate power dynamics and seeks to understand Livia\'s precise expectations and the potential Senate reaction.',
        ap.emotional_tags = ["the senator displays a mixture of caution", "political calculation. outwardly, he is respectful", "compliant, carefully considering livia's words. internally, he is likely weighing the political implications of supporting augustus's deification", "assessing the potential risks", "rewards. there's an undercurrent of unease, hinted at by his cautious questions, as he navigates the delicate power dynamics", "seeks to understand livia's precise expectations", "the potential senate reaction.", "the senator displays a mixture of caution and political calculation. outwardly", "he is respectful and compliant", "carefully considering livia's words. internally", "he is likely weighing the political implications of supporting augustus's deification and assessing the potential risks and rewards. there's an undercurrent of unease", "hinted at by his cautious questions", "as he navigates the delicate power dynamics and seeks to understand livia's precise expectations and the potential senate reaction."],
        ap.active_plans = ["Carefully listen to and understand Livia's strategic directives regarding Augustus's deification.", "Assess the political climate within the Senate to gauge potential opposition and support for deification.", "Determine the most politically advantageous 'line to take' as instructed by Livia, balancing imperial favor with Senate dynamics."],
        ap.beliefs = ["Livia's influence and strategic insight are crucial in navigating imperial politics.", "Aligning with imperial will is often necessary for political survival and advancement.", "The Senate's perception of 'political usefulness' is a key factor in swaying their decisions on sensitive matters like deification."],
        ap.goals = ["short-term\": \"Comprehend and agree to Livia's specific instructions and the 'line to take' in the Senate.", "medium-term\": \"Effectively represent Livia's position within the Senate debates, navigating potential opposition and securing support for deification.", "ultimate\": \"Maintain or improve his political standing and influence within the Senate and the imperial court by demonstrating loyalty and effectiveness in executing Livia's political strategies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Augustus paces restlessly nearby as Livia engages the Senator. He remains physically present in the reception hall, though deliberately removed from the direct conversation, his movements agitated and unsettled. He observes the interaction from a distance, his pacing suggesting a simmering tension beneath his imperial composure. He is not directly participating in the strategic planning but his presence looms, a silent endorsement of Livia\'s actions.',
        ap.emotional_state = 'Augustus projects an air of regal authority, yet his pacing betrays an underlying agitation and internal conflict. Outwardly, he maintains the stoicism expected of the Emperor, allowing Livia to take the lead.  Internally, he wrestles with his \'natural modesty\' concerning deification, juxtaposed with the political pragmatism Livia champions.  His agitation hints at a deeper unease, perhaps a weariness with the constant political maneuvering or a silent acknowledgment of Livia\'s dominant role in shaping his legacy.',
        ap.emotional_tags = ["augustus projects an air of regal authority, yet his pacing betrays an underlying agitation", "internal conflict. outwardly, he maintains the stoicism expected of the emperor, allowing livia to take the lead.  internally, he wrestles with his 'natural modesty' concerning deification, juxtaposed with the political pragmatism livia champions.  his agitation hints at a deeper unease, perhaps a weariness with the constant political maneuvering or a silent acknowledgment of livia's dominant role in shaping his legacy.", "augustus projects an air of regal authority", "yet his pacing betrays an underlying agitation and internal conflict. outwardly", "he maintains the stoicism expected of the emperor", "allowing livia to take the lead.  internally", "he wrestles with his 'natural modesty' concerning deification", "juxtaposed with the political pragmatism livia champions.  his agitation hints at a deeper unease", "perhaps a weariness with the constant political maneuvering or a silent acknowledgment of livia's dominant role in shaping his legacy."],
        ap.active_plans = ["Observe Livia's strategic approach and her interaction with the Senator regarding deification.", "Maintain a public distance from the direct political machinations, allowing Livia to be the visible driver of the strategy.", "Silently assess the Senator's reaction and gauge the overall political temperature regarding deification without direct intervention."],
        ap.beliefs = ["Maintaining a public image of modesty and reluctance towards deification is politically prudent.", "Livia possesses the political acumen and ruthlessness necessary to navigate sensitive issues like deification.", "Tacit approval and strategic delegation are effective methods of wielding power while maintaining a detached imperial persona."],
        ap.goals = ["short-term\": \"Delegate the initial stages of the deification strategy to Livia, observing her progress and ensuring plausible deniability.", "medium-term\": \"Gauge public and Senate reaction to the deification proposal based on Livia's orchestrated efforts, preparing for potential responses.", "ultimate\": \"Secure his legacy and the stability of the empire through politically advantageous actions like deification, even if they conflict with his personal reservations, while maintaining an image of imperial dignity and detachment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'})
    ON CREATE SET
        ap.current_status = 'AUGUSTUS storms down the hallway, his presence commanding and filled with righteous indignation. He gestures emphatically, his face flushed with anger as he confronts TIBERIUS about his recent behavior. His movements are sharp and purposeful, each step echoing with authority.',
        ap.emotional_state = 'AUGUSTUS is brimming with rage, his tone sharp and accusatory as he confronts TIBERIUS. Underneath this fury lies a deeper worry about his family\'s reputation and the implications of TIBERIUS\'s actions. His frustration is compounded by the feeling of betrayal and urgency to maintain control over the situation.',
        ap.emotional_tags = ["augustus is brimming with rage, his tone sharp", "accusatory as he confronts tiberius. underneath this fury lies a deeper worry about his family's reputation", "the implications of tiberius's actions. his frustration is compounded by the feeling of betrayal", "urgency to maintain control over the situation.", "augustus is brimming with rage", "his tone sharp and accusatory as he confronts tiberius. underneath this fury lies a deeper worry about his family's reputation and the implications of tiberius's actions. his frustration is compounded by the feeling of betrayal and urgency to maintain control over the situation."],
        ap.active_plans = ["To reprimand TIBERIUS for his inappropriate actions and ensure he treats JULIA with the respect she deserves.", "To reinforce the importance of familial loyalty and duty in the face of personal desires.", "To protect the integrity of JULIA's upcoming marriage and prevent any mockery that could tarnish the family's reputation."],
        ap.beliefs = ["Family reputation is paramount and should be preserved at all costs.", "Obedience to familial roles is essential for maintaining order within the imperial family.", "Personal desires must be sacrificed for the greater good of the family and the empire."],
        ap.goals = ["Short-term: To successfully reprimand TIBERIUS and assert control over him.", "Medium-term: To ensure that JULIA's marriage proceeds without further complications from TIBERIUS's actions.", "Ultimate: To secure the stability of the imperial family and the continuity of his legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'TIBERIUS trails behind AUGUSTUS, looking sullen and defensive. He stands with his arms crossed and shoulders slightly hunched, his expression a mixture of irritation and resignation as he attempts to justify his actions amidst his father\'s tirade.',
        ap.emotional_state = 'TIBERIUS feels a tumult of emotions—resentment towards his father\'s authority, a flicker of guilt for his actions, and a yearning for autonomy. Outwardly, he maintains a stoic demeanor, but internally, he grapples with the oppressive weight of familial expectations and his own suppressed desires.',
        ap.emotional_tags = ["tiberius feels a tumult of emotions\u2014resentment towards his father's authority, a flicker of guilt for his actions,", "a yearning for autonomy. outwardly, he maintains a stoic demeanor, but internally, he grapples with the oppressive weight of familial expectations", "his own suppressed desires.", "tiberius feels a tumult of emotions\u2014resentment towards his father's authority", "a flicker of guilt for his actions", "and a yearning for autonomy. outwardly", "he maintains a stoic demeanor", "but internally", "he grapples with the oppressive weight of familial expectations and his own suppressed desires.", "tiberius feels a tumult of emotions\u2014resentment towards his father's authority, a flicker of guilt for his actions, and a yearning for autonomy. outwardly, he maintains a stoic demeanor,", "internally, he grapples with the oppressive weight of familial expectations and his own suppressed desires."],
        ap.active_plans = ["To defend his actions and clarify his intentions behind visiting JULIA.", "To express his frustration about being trapped in a loveless marriage while seeking solace in JULIA's friendship.", "To navigate his father's anger while attempting to maintain a semblance of control over his own life."],
        ap.beliefs = ["He deserves the freedom to form his own relationships outside of political obligations.", "His familial loyalty should be balanced with his personal happiness and desires.", "The political machinations of his parents are suffocating and unjust."],
        ap.goals = ["Short-term: To explain his visit and mitigate his father's anger.", "Medium-term: To seek a way to reconcile his personal feelings with familial duties.", "Ultimate: To break free from the constraints imposed by his marriage and his mother's ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Augustus storms into the Reception Hall, his voice booming as he confronts Tiberius directly. He paces with agitated energy, gesticulating wildly as he recounts the perceived transgression of Tiberius meeting with Vipsania. His physical presence dominates the space, emphasizing his imperial authority and paternal outrage as he rebukes his stepson.',
        ap.emotional_state = 'On the surface, Augustus is consumed by imperial fury, his tone laced with indignation and threat. Beneath this bluster, however, lies a deep insecurity and fear of losing control. He is agitated by the perceived disrespect to his family and his authority, revealing a fragile ego beneath the veneer of absolute power. There\'s an unspoken anxiety about his legacy and the stability of his dynasty, fueled by the fear of appearing weak or foolish.',
        ap.emotional_tags = ["on the surface, augustus is consumed by imperial fury, his tone laced with indignation", "threat. beneath this bluster, however, lies a deep insecurity", "fear of losing control. he is agitated by the perceived disrespect to his family", "his authority, revealing a fragile ego beneath the veneer of absolute power. there's an unspoken anxiety about his legacy", "the stability of his dynasty, fueled by the fear of appearing weak or foolish.", "on the surface", "augustus is consumed by imperial fury", "his tone laced with indignation and threat. beneath this bluster", "however", "lies a deep insecurity and fear of losing control. he is agitated by the perceived disrespect to his family and his authority", "revealing a fragile ego beneath the veneer of absolute power. there's an unspoken anxiety about his legacy and the stability of his dynasty", "fueled by the fear of appearing weak or foolish."],
        ap.active_plans = ["To publicly assert his dominance and remind Tiberius of his absolute authority.", "To reinforce the image of a unified and controlled imperial family, quashing any hint of scandal or dissent.", "To intimidate Tiberius and ensure he ceases contact with Vipsania, nipping any potential challenge to his will in the bud."],
        ap.beliefs = ["He believes in the absolute authority of the Emperor and the necessity of unquestioning obedience.", "He believes maintaining a strong public image of the imperial family is crucial for political stability and his own power.", "He believes any defiance or perceived disrespect, especially within his family, is a direct threat to his authority and must be swiftly and decisively crushed."],
        ap.goals = ["goals_short_term\": \"To immediately halt Tiberius's contact with Vipsania and publicly humiliate him to assert dominance.", "goals_medium_term\": \"To re-establish firm control over his family and prevent any future challenges to his authority, ensuring a smooth succession.", "goals_ultimate\": \"To secure his legacy as a strong and unchallenged ruler, guaranteeing the long-term stability of the Roman Empire under his dynasty, even through fear and intimidation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly in the Reception Hall, bearing the brunt of Augustus\'s furious tirade. He remains largely silent, his posture stiff and unyielding as he absorbs the emperor\'s accusations. His gaze is likely averted, avoiding direct confrontation, yet his body language subtly betrays a simmering resentment beneath a veneer of stoic compliance. He is trapped, physically and emotionally, in the face of Augustus\'s wrath.',
        ap.emotional_state = 'Outwardly, Tiberius projects a mask of stoic endurance, his features composed and seemingly impassive as he listens to Augustus\'s accusations. However, beneath this controlled facade, a cauldron of resentment and humiliation boils. He feels unjustly targeted and deeply misunderstood, his longing for Vipsania twisted into an act of rebellion. There\'s an unspoken despair at his loveless marriage to Julia and the suffocating constraints of his imperial duty, fueling a bitter resignation and a yearning for escape.',
        ap.emotional_tags = ["outwardly, tiberius projects a mask of stoic endurance, his features composed", "seemingly impassive as he listens to augustus's accusations. however, beneath this controlled facade, a cauldron of resentment", "humiliation boils. he feels unjustly targeted", "deeply misunderstood, his longing for vipsania twisted into an act of rebellion. there's an unspoken despair at his loveless marriage to julia", "the suffocating constraints of his imperial duty, fueling a bitter resignation", "a yearning for escape.", "outwardly", "tiberius projects a mask of stoic endurance", "his features composed and seemingly impassive as he listens to augustus's accusations. however", "beneath this controlled facade", "a cauldron of resentment and humiliation boils. he feels unjustly targeted and deeply misunderstood", "his longing for vipsania twisted into an act of rebellion. there's an unspoken despair at his loveless marriage to julia and the suffocating constraints of his imperial duty", "fueling a bitter resignation and a yearning for escape."],
        ap.active_plans = ["To passively endure Augustus's outburst, minimizing any direct verbal confrontation that might further escalate the emperor's anger.", "To subtly express his unhappiness and desire to leave Rome by suggesting his departure, testing Augustus's reaction and hinting at his own discontent.", "To maintain a semblance of self-control and dignity amidst the public rebuke, preserving a fragment of his pride in the face of imperial humiliation."],
        ap.beliefs = ["He believes his marriage to Julia is a political sham devoid of love and a source of profound personal misery.", "He believes Augustus's anger is unreasonable and stems from a need for control rather than genuine concern for family honor.", "He believes that leaving Rome is the only viable path to escape his suffocating circumstances and potentially find some measure of personal freedom and peace."],
        ap.goals = ["goals_short_term\": \"To survive Augustus's immediate anger and avoid any further immediate repercussions from the emperor's wrath.", "goals_medium_term\": \"To persuade Augustus to permit his departure from Rome, hoping to escape the suffocating pressures of courtly life and his unhappy marriage.", "goals_ultimate\": \"To find a life beyond the confines of his imperial duty and family expectations, even if it means relinquishing his claim to power, seeking a semblance of personal happiness and authentic existence, perhaps even with Vipsania if possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Livia enters the reception hall with an air of calm control, her posture straight and confident. She surveys the heated exchange between Augustus and Tiberius, her calculating gaze taking in every detail. As tensions escalate, she interjects smoothly, using her voice to deflect Augustus’s anger and subtly challenge his assertions about Tiberius\'s behavior. Her gestures are composed, reflecting a practiced ease in navigating the chaos, as she positions herself as the voice of reason amidst the discord.',
        ap.emotional_state = 'Livia maintains a facade of calmness, her voice steady and measured, though internally she relishes the chaos, manipulating the emotional landscape to her advantage. Her outward demeanor reflects confidence and poise, while internally, she experiences a thrill at the unfolding conflict, seeing it as an opportunity to reclaim control over the narrative and reinforce her influence. There is an underlying tension in her emotional state, driven by a fierce determination to protect her ambitions and the future of her son.',
        ap.emotional_tags = ["livia maintains a facade of calmness, her voice steady", "measured, though internally she relishes the chaos, manipulating the emotional landscape to her advantage. her outward demeanor reflects confidence", "poise, while internally, she experiences a thrill at the unfolding conflict, seeing it as an opportunity to reclaim control over the narrative", "reinforce her influence. there is an underlying tension in her emotional state, driven by a fierce determination to protect her ambitions", "the future of her son.", "livia maintains a facade of calmness", "her voice steady and measured", "though internally she relishes the chaos", "manipulating the emotional landscape to her advantage. her outward demeanor reflects confidence and poise", "while internally", "she experiences a thrill at the unfolding conflict", "seeing it as an opportunity to reclaim control over the narrative and reinforce her influence. there is an underlying tension in her emotional state", "driven by a fierce determination to protect her ambitions and the future of her son.", "livia maintains a facade of calmness, her voice steady and measured, though internally she relishes the chaos, manipulating the emotional landscape to her advantage. her outward demeanor reflects confidence and poise,", "internally, she experiences a thrill at the unfolding conflict, seeing it as an opportunity to reclaim control over the narrative and reinforce her influence. there is an underlying tension in her emotional state, driven by a fierce determination to protect her ambitions and the future of her son."],
        ap.active_plans = ["Subtly undermine Augustus's authority by framing his grievances as exaggerated and unfounded.", "Reinforce Tiberius's position by portraying him as a victim of circumstance rather than a reckless son.", "Seize the opportunity to redirect the conversation towards consolidating her influence over Augustus and Tiberius."],
        ap.beliefs = ["Family loyalty is paramount, but only as a means to secure power for her son.", "Conflict can be leveraged strategically to manipulate outcomes in her favor.", "The ends justify the means; any necessary deceit is acceptable in the pursuit of power."],
        ap.goals = ["Short-term: Calm the immediate conflict between Augustus and Tiberius to maintain stability in the family.", "Medium-term: Reinforce her authority over Tiberius and Augustus, ensuring her influence remains intact.", "Ultimate: Secure the throne for Tiberius, eliminating any threats to their family's supremacy in the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in the reception hall, visibly agitated and commanding attention with his raised voice. His posture reflects frustration, with tense shoulders and a furrowed brow as he confronts Tiberius. As Livia interjects, he shifts between annoyance and the desire to regain control of the narrative, attempting to exhibit authority while grappling with the emotional turbulence of the family conflict. His gestures are forceful, punctuating his words with the weight of an emperor\'s command.',
        ap.emotional_state = 'Augustus is embroiled in a mix of anger, frustration, and anxiety over his family\'s reputation. His surface emotions are raw and expressive, driven by the fear of being made a fool in front of the court. Beneath this, there is a simmering vulnerability, a deep-seated worry about losing control over both his family and the empire. His internal conflict between being a father and a ruler manifests in defensive postures and sharp retorts during the exchange.',
        ap.emotional_tags = ["augustus is embroiled in a mix of anger, frustration,", "anxiety over his family's reputation. his surface emotions are raw", "expressive, driven by the fear of being made a fool in front of the court. beneath this, there is a simmering vulnerability, a deep-seated worry about losing control over both his family", "the empire. his internal conflict between being a father", "a ruler manifests in defensive postures", "sharp retorts during the exchange.", "augustus is embroiled in a mix of anger", "frustration", "and anxiety over his family's reputation. his surface emotions are raw and expressive", "driven by the fear of being made a fool in front of the court. beneath this", "there is a simmering vulnerability", "a deep-seated worry about losing control over both his family and the empire. his internal conflict between being a father and a ruler manifests in defensive postures and sharp retorts during the exchange."],
        ap.active_plans = ["Reassert his authority over Tiberius and the family dynamics to restore order.", "Suppress any scandal linked to Tiberius's actions to protect the family\u2019s public image.", "Seek Livia's support in managing Tiberius, reinforcing the importance of family unity."],
        ap.beliefs = ["Family unity is essential to maintaining authority and stability within the empire.", "Personal grievances should be set aside for the greater good of the imperial family.", "Raising his voice and displaying authority is necessary to command respect and control the situation."],
        ap.goals = ["Short-term: Quell the immediate tensions between Tiberius and himself to restore familial harmony.", "Medium-term: Ensure Tiberius adheres to familial expectations and responsibilities to prevent further scandal.", "Ultimate: Maintain his legacy and the integrity of the Julio-Claudian dynasty amidst growing ambition and familial strife."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands stiffly, his body language radiating tension and frustration as he faces Augustus\'s accusatory tone. He shifts his weight from foot to foot, revealing his discomfort with the confrontation. His responses are clipped and defensive, lacking the confidence necessary to assert himself against his father\'s booming voice. He occasionally glances at Livia for support, indicating his reliance on her to navigate the familial chaos surrounding him.',
        ap.emotional_state = 'Tiberius is caught in a storm of anger and helplessness, feeling cornered by both Augustus\'s rage and the weight of familial expectations. Outwardly, he attempts to appear composed, but beneath the surface, there is a deep-seated resentment and a longing for autonomy. His emotions are in conflict, as he grapples with the suffocating pressures of duty versus his desire to escape the confines of his current life.',
        ap.emotional_tags = ["tiberius is caught in a storm of anger", "helplessness, feeling cornered by both augustus's rage", "the weight of familial expectations. outwardly, he attempts to appear composed, but beneath the surface, there is a deep-seated resentment", "a longing for autonomy. his emotions are in conflict, as he grapples with the suffocating pressures of duty versus his desire to escape the confines of his current life.", "tiberius is caught in a storm of anger and helplessness", "feeling cornered by both augustus's rage and the weight of familial expectations. outwardly", "he attempts to appear composed", "but beneath the surface", "there is a deep-seated resentment and a longing for autonomy. his emotions are in conflict", "as he grapples with the suffocating pressures of duty versus his desire to escape the confines of his current life.", "tiberius is caught in a storm of anger and helplessness, feeling cornered by both augustus's rage and the weight of familial expectations. outwardly, he attempts to appear composed,", "beneath the surface, there is a deep-seated resentment and a longing for autonomy. his emotions are in conflict, as he grapples with the suffocating pressures of duty versus his desire to escape the confines of his current life."],
        ap.active_plans = ["Attempt to assert his independence by expressing a desire to leave Rome.", "Seek understanding from Augustus regarding his dissatisfaction with Julia and his current situation.", "Look for support from Livia to mediate his father's wrath and reinforce his autonomy."],
        ap.beliefs = ["The burdens of duty weigh heavily, and personal freedom is essential to his well-being.", "His happiness is secondary to the family's political maneuvers and expectations.", "The relationships within the family are fraught with tension, complicating his desire for connection."],
        ap.goals = ["Short-term: Express his discontent to Augustus in hopes of finding some measure of freedom.", "Medium-term: Navigate familial relationships to secure support from Livia regarding his independence.", "Ultimate: Find a way to escape the confines of the imperial expectations and live a life true to himself."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Reception Hall with an air of composed curiosity, drawn by the escalating argument between Augustus and Tiberius. She positions herself as a calm observer, her gaze shifting between the two men as she assesses the situation, ready to intervene with calculated precision. She eventually takes the scroll and reads it aloud, weaponizing its contents.',
        ap.emotional_state = 'Livia projects an outward calm and measured demeanor, appearing almost detached as she witnesses the familial conflict. Beneath this serene facade, she is sharply calculating, her mind racing to assess the power dynamics and leverage the situation to her advantage.  She is likely experiencing a subtle satisfaction at controlling the narrative and manipulating both men, masking any potential annoyance at Drusus\'s letter with icy composure.',
        ap.emotional_tags = ["livia projects an outward calm", "measured demeanor, appearing almost detached as she witnesses the familial conflict. beneath this serene facade, she is sharply calculating, her mind racing to assess the power dynamics", "leverage the situation to her advantage.  she is likely experiencing a subtle satisfaction at controlling the narrative", "manipulating both men, masking any potential annoyance at drusus's letter with icy composure.", "livia projects an outward calm and measured demeanor", "appearing almost detached as she witnesses the familial conflict. beneath this serene facade", "she is sharply calculating", "her mind racing to assess the power dynamics and leverage the situation to her advantage.  she is likely experiencing a subtle satisfaction at controlling the narrative and manipulating both men", "masking any potential annoyance at drusus's letter with icy composure."],
        ap.active_plans = ["To de-escalate the immediate conflict between Augustus and Tiberius.", "To regain control of the conversation and steer it away from Tiberius's personal life and back to political matters.", "To use Drusus's letter as a tool to further her own agenda and solidify her influence over Augustus.", "To subtly undermine Drusus's position and isolate him from Augustus."],
        ap.beliefs = ["Maintaining absolute control over her family and their public image is essential for power.", "Emotional outbursts are weaknesses to be exploited, and calm manipulation is the most effective tool.", "Her son Tiberius's ascension to power is the ultimate goal, and any obstacle must be ruthlessly removed.", "She is the superior strategist and understands the nuances of power better than Augustus."],
        ap.goals = ["Short-term: To smooth over the family argument and regain a semblance of peace in the household.", "Medium-term: To solidify her control over Augustus's decisions and ensure Tiberius remains his favored successor.", "Ultimate: To secure the Julio-Claudian dynasty's long-term rule under her and Tiberius's direction, eliminating any potential threats to their power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Augustus is pacing and gesturing emphatically in the Reception Hall, his voice raised in anger as he confronts Tiberius. He dominates the physical space, asserting his patriarchal and imperial authority through forceful pronouncements and threats. He initially directs his fury at Tiberius, but then seeks validation and support from Livia, shifting his emotional stance as she interjects.',
        ap.emotional_state = 'Augustus is initially consumed by volcanic anger and wounded pride, feeling personally affronted by Tiberius\'s actions and fearing a public scandal. Beneath the surface rage, there\'s a current of insecurity and weariness, evident in his mention of past betrayals and his wavering judgment when Livia counters his arguments.  He is easily swayed by Livia\'s manipulation, suggesting a deep-seated reliance on her counsel even amidst his bluster.',
        ap.emotional_tags = ["augustus is initially consumed by volcanic anger", "wounded pride, feeling personally affronted by tiberius's actions", "fearing a public scandal. beneath the surface rage, there's a current of insecurity", "weariness, evident in his mention of past betrayals", "his wavering judgment when livia counters his arguments.  he is easily swayed by livia's manipulation, suggesting a deep-seated reliance on her counsel even amidst his bluster.", "augustus is initially consumed by volcanic anger and wounded pride", "feeling personally affronted by tiberius's actions and fearing a public scandal. beneath the surface rage", "there's a current of insecurity and weariness", "evident in his mention of past betrayals and his wavering judgment when livia counters his arguments.  he is easily swayed by livia's manipulation", "suggesting a deep-seated reliance on her counsel even amidst his bluster."],
        ap.active_plans = ["To assert his dominance and authority as the head of the family and the Emperor.", "To publicly reprimand Tiberius for his perceived transgression and enforce familial decorum.", "To resolve the immediate familial conflict and restore order to the household.", "To understand the contents of Drusus's dispatch and its potential implications for his rule."],
        ap.beliefs = ["Maintaining a strong and unified public image for his family is crucial for imperial stability.", "As the Emperor, he deserves unquestioning obedience and respect from his family.", "Discipline and order are essential for both familial and imperial governance.", "His legacy and the Pax Romana are paramount and must be protected at all costs."],
        ap.goals = ["Short-term: To regain control of the situation, end the argument, and ensure Tiberius's compliance.", "Medium-term: To reinforce family unity and loyalty, preventing any public scandal that could undermine his authority.", "Ultimate: To secure a peaceful and stable succession, preserving the Pax Romana and his legacy as a strong and respected ruler, despite the internal family turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly in the Reception Hall, bearing the brunt of Augustus\'s furious tirade. He adopts a defensive posture, attempting to deflect the Emperor\'s anger with terse replies and justifications. He physically receives the dispatch from Drusus and begins to read it, his demeanor shifting from resentful defiance to calculated evasion as the letter\'s contents become clear.',
        ap.emotional_state = 'Tiberius is deeply resentful and feels cornered by Augustus\'s accusations and the suffocating expectations of his family.  Outwardly, he expresses a mix of defiance and sullen resignation, suggesting a desire to escape his current predicament. Internally, he is likely wrestling with a profound sense of despair and a longing for personal freedom, feeling trapped in a life dictated by duty and political expediency. His initial resistance crumbles as he realizes the dangerous content of Drusus\'s letter, shifting to a more guarded and evasive emotional state.',
        ap.emotional_tags = ["tiberius is deeply resentful", "feels cornered by augustus's accusations", "the suffocating expectations of his family.  outwardly, he expresses a mix of defiance", "sullen resignation, suggesting a desire to escape his current predicament. internally, he is likely wrestling with a profound sense of despair", "a longing for personal freedom, feeling trapped in a life dictated by duty", "political expediency. his initial resistance crumbles as he realizes the dangerous content of drusus's letter, shifting to a more guarded", "evasive emotional state.", "tiberius is deeply resentful and feels cornered by augustus's accusations and the suffocating expectations of his family.  outwardly", "he expresses a mix of defiance and sullen resignation", "suggesting a desire to escape his current predicament. internally", "he is likely wrestling with a profound sense of despair and a longing for personal freedom", "feeling trapped in a life dictated by duty and political expediency. his initial resistance crumbles as he realizes the dangerous content of drusus's letter", "shifting to a more guarded and evasive emotional state."],
        ap.active_plans = ["To deflect Augustus's anger and minimize the perceived offense of his meeting with Vipsania.", "To express his deep unhappiness and resentment regarding his marriage to Julia and his life in Rome.", "To subtly plead for release from his duties and the suffocating constraints of courtly life.", "To conceal the true content of Drusus's letter and protect his brother from potential repercussions (initially)."],
        ap.beliefs = ["His marriage to Julia is a loveless and unbearable burden.", "Life in Rome is suffocating and devoid of personal fulfillment.", "He has little agency over his own destiny and is manipulated by his mother and Augustus.", "Some personal happiness, even in fleeting moments with Vipsania, is worth the risk."],
        ap.goals = ["Short-term: To survive Augustus's reprimand and potentially escape Rome's suffocating environment.", "Medium-term: To find some measure of personal freedom and escape the confines of his unhappy marriage and courtly duties, perhaps through military assignment.", "Ultimate: To achieve a life where he is not constantly controlled by his family's ambitions and expectations, seeking a sense of personal peace and purpose, even if it remains elusive."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Augustus stands at the center of the reception hall, his posture rigid and commanding. His voice rises in anger, punctuated by gestures that emphasize his frustration and authority. As the discussion escalates, he shifts from aggression to reluctant compromise, signaling his desire to maintain control while grappling with familial unrest.',
        ap.emotional_state = 'On the surface, Augustus is visibly agitated, his tone sharp and forceful as he confronts Tiberius about his actions. Beneath this, however, a deep sense of vulnerability emerges; he is acutely aware of the precariousness of his position and the familial ties that bind him, revealing a ruler caught between authority and emotional turmoil.',
        ap.emotional_tags = ["on the surface, augustus is visibly agitated, his tone sharp", "forceful as he confronts tiberius about his actions. beneath this, however, a deep sense of vulnerability emerges; he is acutely aware of the precariousness of his position", "the familial ties that bind him, revealing a ruler caught between authority", "emotional turmoil.", "on the surface", "augustus is visibly agitated", "his tone sharp and forceful as he confronts tiberius about his actions. beneath this", "however", "a deep sense of vulnerability emerges; he is acutely aware of the precariousness of his position and the familial ties that bind him", "revealing a ruler caught between authority and emotional turmoil.", "on the surface, augustus is visibly agitated, his tone sharp and forceful as he confronts tiberius about his actions. beneath this, however, a deep sense of vulnerability emerges", "he is acutely aware of the precariousness of his position and the familial ties that bind him, revealing a ruler caught between authority and emotional turmoil."],
        ap.active_plans = ["To assert his authority over Tiberius and Julia by enforcing compliance in their relationship.", "To maintain the image of familial unity despite underlying tensions.", "To navigate the treacherous waters of his family's emotions while avoiding direct conflict."],
        ap.beliefs = ["The stability of the empire hinges on the appearance of familial harmony.", "Minor transgressions should be overlooked for the greater good of the family and empire.", "Authority must be maintained even in the face of personal dissatisfaction."],
        ap.goals = ["Short-term: To quell the immediate conflict between Tiberius and Julia.", "Medium-term: To solidify his authority as the patriarch of the Julio-Claudian family.", "Ultimate: To ensure the continuity and stability of the empire beyond his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands somewhat hunched, embodying a blend of defiance and resignation. His gestures are restrained, reflecting his inner turmoil as he attempts to assert his perspective while also navigating the heavy expectations placed upon him. His tone shifts from frustration to pleading as he seeks understanding.',
        ap.emotional_state = 'Externally, Tiberius projects irritation and defiance, especially in response to Augustus\'s commands. Internally, he wrestles with feelings of inadequacy and entrapment, longing for freedom from the suffocating expectations of duty and the painful memories of his former love, Vipsania.',
        ap.emotional_tags = ["externally, tiberius projects irritation", "defiance, especially in response to augustus's commands. internally, he wrestles with feelings of inadequacy", "entrapment, longing for freedom from the suffocating expectations of duty", "the painful memories of his former love, vipsania.", "externally", "tiberius projects irritation and defiance", "especially in response to augustus's commands. internally", "he wrestles with feelings of inadequacy and entrapment", "longing for freedom from the suffocating expectations of duty and the painful memories of his former love", "vipsania."],
        ap.active_plans = ["To express his grievances about his marriage to Julia and seek understanding from Augustus.", "To assert his desire for autonomy, even if it means proposing to leave Rome.", "To mitigate the tension by complying with Augustus's demands while preserving a semblance of agency."],
        ap.beliefs = ["Personal happiness should not be sacrificed for political expediency.", "The bonds of family are fraught with obligation and conflict.", "True loyalty to oneself may require defiance against familial expectations."],
        ap.goals = ["Short-term: To communicate his discontent with his marriage to Augustus and seek respite.", "Medium-term: To gain some control over his own life and decisions, perhaps considering leaving Rome.", "Ultimate: To reclaim his independence and find fulfillment outside the confines of his role as heir."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Livia enters the hall with an air of calculated poise, her gaze sharp as she surveys the unfolding conflict. She positions herself strategically between Augustus and Tiberius, using her body language to influence the conversation subtly. Her gestures and tone are smooth, guiding the narrative to her advantage.',
        ap.emotional_state = 'Livia appears calm and unruffled, yet her demeanor conceals a deeper calculation. Beneath her composed exterior, she experiences a surge of satisfaction as she deftly manipulates the conversation, ensuring that Augustus remains focused on preserving the status quo while she furthers her own ambitions.',
        ap.emotional_tags = ["livia appears calm", "unruffled, yet her demeanor conceals a deeper calculation. beneath her composed exterior, she experiences a surge of satisfaction as she deftly manipulates the conversation, ensuring that augustus remains focused on preserving the status quo while she furthers her own ambitions.", "livia appears calm and unruffled", "yet her demeanor conceals a deeper calculation. beneath her composed exterior", "she experiences a surge of satisfaction as she deftly manipulates the conversation", "ensuring that augustus remains focused on preserving the status quo while she furthers her own ambitions.", "livia appears calm and unruffled, yet her demeanor conceals a deeper calculation. beneath her composed exterior, she experiences a surge of satisfaction as she deftly manipulates the conversation, ensuring that augustus remains focused on preserving the status quo", "she furthers her own ambitions."],
        ap.active_plans = ["To mediate the conflict between Augustus and Tiberius while subtly reinforcing her own influence.", "To redirect Augustus's anger away from Tiberius and towards a compromise that serves her interests.", "To maintain control over her family's narrative and ensure her son's position remains secure."],
        ap.beliefs = ["The preservation of the family and her son's power is paramount, even at the cost of honesty.", "Manipulation is a necessary tool in the pursuit of power and familial stability.", "Maintaining appearances is critical in a world rife with ambition and betrayal."],
        ap.goals = ["Short-term: To defuse the immediate conflict and prevent Tiberius from facing consequences.", "Medium-term: To solidify her influence in the imperial family through deft manipulation.", "Ultimate: To ensure Tiberius's ascension to the throne while reinforcing her own power behind the scenes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Augustus, initially in a state of agitated dominance, paces in the Reception Hall, his voice booming as he berates Tiberius for his indiscretion with Vipsania. He gesticulates wildly, emphasizing his points about family honor and imperial authority. When the messenger arrives, his focus abruptly shifts; he becomes seated and attentive, eager to receive news, though quickly becomes passive, relying on Livia to interpret the unfolding situation.',
        ap.emotional_state = 'Augustus begins in a state of volcanic fury, fueled by a sense of betrayed authority and familial embarrassment. He is outwardly loud and assertive, yet beneath this bluster lies a deep insecurity about his control and legacy. As the scene progresses, his anger gives way to weariness and a wavering uncertainty. He appears increasingly reliant on Livia\'s guidance, suggesting an underlying anxiety and a diminishing grip on his own judgment, revealing a vulnerability masked by imperial command.',
        ap.emotional_tags = ["augustus begins in a state of volcanic fury, fueled by a sense of betrayed authority", "familial embarrassment. he is outwardly loud", "assertive, yet beneath this bluster lies a deep insecurity about his control", "legacy. as the scene progresses, his anger gives way to weariness", "a wavering uncertainty. he appears increasingly reliant on livia's guidance, suggesting an underlying anxiety", "a diminishing grip on his own judgment, revealing a vulnerability masked by imperial command.", "augustus begins in a state of volcanic fury", "fueled by a sense of betrayed authority and familial embarrassment. he is outwardly loud and assertive", "yet beneath this bluster lies a deep insecurity about his control and legacy. as the scene progresses", "his anger gives way to weariness and a wavering uncertainty. he appears increasingly reliant on livia's guidance", "suggesting an underlying anxiety and a diminishing grip on his own judgment", "revealing a vulnerability masked by imperial command."],
        ap.active_plans = ["Reassert his patriarchal authority over Tiberius and enforce familial decorum by forbidding contact with Vipsania.", "Shift focus from the uncomfortable domestic dispute to matters of state and imperial governance, seeking a distraction from personal anxieties.", "Receive and understand the dispatch from Drusus, anticipating news from the Rhine frontier and its potential impact on Roman stability."],
        ap.beliefs = ["The Emperor's family must project an image of unity and control to maintain public order and respect.", "Disobedience and personal scandals within the imperial family directly threaten his authority and the stability of Rome.", "He is the ultimate arbiter of Roman morality and must enforce his will, even within his own family."],
        ap.goals = ["Short-term: End the argument with Tiberius and re-establish his dominance in the immediate situation.", "Medium-term: Understand the content of Drusus's dispatch and assess any potential threats from Germania.", "Ultimate: Secure his legacy by maintaining control over his family and ensuring a stable succession, despite the growing cracks in the facade of imperial unity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly before Augustus, bearing the brunt of his stepfather\'s fury with a stoic yet sullen demeanor. He avoids direct eye contact, shifting his weight slightly as Augustus rants, indicating discomfort and resentment. Upon the arrival of the dispatch, he becomes noticeably tense, attempting to minimize the letter\'s importance and prevent its contents from being fully revealed, his movements becoming more constrained and hesitant.',
        ap.emotional_state = 'Tiberius is initially resentful and defensive under Augustus\'s accusations, feeling unjustly targeted and misunderstood. Beneath his stoic exterior simmers a deep-seated bitterness towards his loveless marriage and the political constraints of his life. As the dispatch is introduced, his emotional state shifts to anxiety and fear. He is acutely aware of the potentially treasonous nature of Drusus\'s letter and dreads the fallout, revealing a conflict between familial loyalty and self-preservation in the face of imperial wrath.',
        ap.emotional_tags = ["tiberius is initially resentful", "defensive under augustus's accusations, feeling unjustly targeted", "misunderstood. beneath his stoic exterior simmers a deep-seated bitterness towards his loveless marriage", "the political constraints of his life. as the dispatch is introduced, his emotional state shifts to anxiety", "fear. he is acutely aware of the potentially treasonous nature of drusus's letter", "dreads the fallout, revealing a conflict between familial loyalty", "self-preservation in the face of imperial wrath.", "tiberius is initially resentful and defensive under augustus's accusations", "feeling unjustly targeted and misunderstood. beneath his stoic exterior simmers a deep-seated bitterness towards his loveless marriage and the political constraints of his life. as the dispatch is introduced", "his emotional state shifts to anxiety and fear. he is acutely aware of the potentially treasonous nature of drusus's letter and dreads the fallout", "revealing a conflict between familial loyalty and self-preservation in the face of imperial wrath."],
        ap.active_plans = ["Endure Augustus's tirade with minimal engagement, attempting to deflect blame and avoid escalating the conflict.", "Suggest leaving Rome as a means of escaping the immediate domestic and political pressures, hinting at his profound unhappiness.", "Obfuscate the contents of Drusus's dispatch, attempting to downplay its significance and prevent the revelation of its treasonous nature."],
        ap.beliefs = ["His marriage to Julia is a political sham devoid of love, and he is trapped in a life dictated by political expediency.", "Honest expression of his feelings or vulnerabilities will be used against him in the treacherous environment of the imperial court.", "Familial loyalty is a dangerous and complicated concept within the Julio-Claudian dynasty, often overshadowed by ambition and self-interest."],
        ap.goals = ["Short-term: Survive Augustus's anger and minimize personal repercussions from the Vipsania incident.", "Medium-term: Avoid being implicated in any political fallout from Drusus's potentially treasonous dispatch.", "Ultimate: Find a way to escape the suffocating weight of his imperial duties and achieve a measure of personal freedom, however unlikely in the current circumstances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Reception Hall with an air of composed observation, her movements fluid and deliberate. She positions herself between Augustus and Tiberius, acting as a mediator, her gaze sharp and calculating as she assesses the dynamics of the confrontation. Upon the courier\'s arrival, she becomes subtly more assertive, smoothly taking control of the situation, snatching the scroll and decisively reading aloud Drusus\'s incriminating words, her posture radiating controlled power.',
        ap.emotional_state = 'Livia maintains an outward facade of calm and measured reason, projecting an image of composed empress and concerned mother. Beneath this serene surface, she is intensely calculating and opportunistic, her mind racing to exploit the unfolding situation to her advantage. She experiences a subtle surge of triumph as Drusus\'s dispatch arrives, recognizing it as a tool to further her agenda. Her emotional state is characterized by controlled ambition, strategic cunning, and a chilling detachment from genuine familial sentiment, using feigned concern as a weapon.',
        ap.emotional_tags = ["livia maintains an outward facade of calm", "measured reason, projecting an image of composed empress", "concerned mother. beneath this serene surface, she is intensely calculating", "opportunistic, her mind racing to exploit the unfolding situation to her advantage. she experiences a subtle surge of triumph as drusus's dispatch arrives, recognizing it as a tool to further her agenda. her emotional state is characterized by controlled ambition, strategic cunning,", "a chilling detachment from genuine familial sentiment, using feigned concern as a weapon.", "livia maintains an outward facade of calm and measured reason", "projecting an image of composed empress and concerned mother. beneath this serene surface", "she is intensely calculating and opportunistic", "her mind racing to exploit the unfolding situation to her advantage. she experiences a subtle surge of triumph as drusus's dispatch arrives", "recognizing it as a tool to further her agenda. her emotional state is characterized by controlled ambition", "strategic cunning", "and a chilling detachment from genuine familial sentiment", "using feigned concern as a weapon."],
        ap.active_plans = ["Intervene in the argument between Augustus and Tiberius, subtly manipulating Augustus by downplaying Tiberius's indiscretion and redirecting his anger.", "Seize control of Drusus's dispatch and weaponize its contents to discredit and ultimately eliminate Drusus as a political threat.", "Solidify her influence over Augustus by appearing as the voice of reason and strategic foresight, reinforcing his dependence on her counsel."],
        ap.beliefs = ["Ruthless pragmatism and calculated manipulation are essential tools for achieving and maintaining power in Rome.", "Drusus represents a significant obstacle to Tiberius's ascension and must be neutralized to secure her son's future.", "She is superior in intellect and strategic thinking to both Augustus and Tiberius, capable of guiding the empire through her subtle manipulations."],
        ap.goals = ["Short-term: De-escalate the immediate tension between Augustus and Tiberius while subtly shifting the focus to the more politically advantageous issue of Drusus's dispatch.", "Medium-term: Use Drusus's letter to portray him as treasonous in Augustus's eyes, justifying further action against him.", "Ultimate: Secure Tiberius's unchallenged succession to the throne by eliminating all potential rivals and consolidating her own power and influence within the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Reception Hall with a poised demeanor, her calculating gaze fixated on Augustus and Tiberius as the tension escalates. She stands slightly apart, her posture relaxed yet alert, ready to seize the moment as she observes the confrontation unfold.',
        ap.emotional_state = 'Livia exudes an air of calm confidence, masking her deeper ambition with a serene facade. While her words are measured and soothing, internally she is calculating her next move, eager to manipulate the situation in her favor. There is an underlying tension as she prepares to exploit Tiberius\'s hesitations.',
        ap.emotional_tags = ["livia exudes an air of calm confidence, masking her deeper ambition with a serene facade. while her words are measured", "soothing, internally she is calculating her next move, eager to manipulate the situation in her favor. there is an underlying tension as she prepares to exploit tiberius's hesitations.", "livia exudes an air of calm confidence", "masking her deeper ambition with a serene facade. while her words are measured and soothing", "internally she is calculating her next move", "eager to manipulate the situation in her favor. there is an underlying tension as she prepares to exploit tiberius's hesitations."],
        ap.active_plans = ["To downplay Tiberius's emotional turmoil regarding Vipsania and assert her influence over Augustus.", "To intercept the information contained in Drusus's letter, ensuring that it does not undermine her plans for Tiberius's ascension.", "To position herself as the rational mediator in the family conflict, reinforcing her control over the narrative."],
        ap.beliefs = ["Power is a game of control and manipulation, and she must always be several steps ahead of her adversaries.", "Loyalty within the family can be leveraged as a tool for greater political gain.", "The ends justify the means, and any sacrifice for her family's power is warranted."],
        ap.goals = ["Short-term: To defuse the immediate conflict between Augustus and Tiberius.", "Medium-term: To maintain her influence over Augustus and Tiberius, ensuring her son is positioned favorably.", "Ultimate: To secure Tiberius's place on the throne and eliminate any threats to her family's legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Augustus stands at the center of the Reception Hall, his posture tense as he confronts Tiberius about his actions. His gestures are emphatic, emphasizing his authority, while his voice resonates with a mix of frustration and paternal concern. He is visibly agitated, shifting his weight as he grapples with his son\'s rebelliousness.',
        ap.emotional_state = 'Augustus is a blend of anger and concern, feeling the weight of his familial duties amplified by Tiberius\'s defiance. He exhibits a veneer of authority, but beneath it lies an anxiety about his legacy and the stability of the empire. His frustration simmers as he realizes he must navigate Tiberius\'s desires while maintaining control.',
        ap.emotional_tags = ["augustus is a blend of anger", "concern, feeling the weight of his familial duties amplified by tiberius's defiance. he exhibits a veneer of authority, but beneath it lies an anxiety about his legacy", "the stability of the empire. his frustration simmers as he realizes he must navigate tiberius's desires while maintaining control.", "augustus is a blend of anger and concern", "feeling the weight of his familial duties amplified by tiberius's defiance. he exhibits a veneer of authority", "but beneath it lies an anxiety about his legacy and the stability of the empire. his frustration simmers as he realizes he must navigate tiberius's desires while maintaining control.", "augustus is a blend of anger and concern, feeling the weight of his familial duties amplified by tiberius's defiance. he exhibits a veneer of authority, but beneath it lies an anxiety about his legacy and the stability of the empire. his frustration simmers as he realizes he must navigate tiberius's desires", "maintaining control.", "augustus is a blend of anger and concern, feeling the weight of his familial duties amplified by tiberius's defiance. he exhibits a veneer of authority,", "beneath it lies an anxiety about his legacy and the stability of the empire. his frustration simmers as he realizes he must navigate tiberius's desires while maintaining control."],
        ap.active_plans = ["To assert his authority over Tiberius and compel him to conform to family expectations.", "To seek a way to manage the delicate balance of power within the family while addressing the concerns raised by Drusus's letter.", "To reinforce familial loyalty and discourage any thoughts of rebellion or escape from Tiberius."],
        ap.beliefs = ["The integrity of the Julio-Claudian dynasty must remain intact, and any sign of weakness is intolerable.", "Family unity is paramount; personal grievances should not undermine public duty.", "He bears the burden of leadership, and it is his responsibility to guide his family through chaos."],
        ap.goals = ["Short-term: To resolve the immediate conflict with Tiberius and prevent a public spectacle.", "Medium-term: To ensure Tiberius's loyalty and compliance with his plans for the family and the empire.", "Ultimate: To solidify his legacy and maintain the stability of Rome amidst familial tensions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_6'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands conflicted between Augustus and Livia, visibly tense as he attempts to read Drusus\'s letter aloud. His body language reveals hesitation and unease, as he avoids direct eye contact, fidgeting slightly with the scroll as he struggles with its implications.',
        ap.emotional_state = 'Tiberius\'s surface emotions reveal frustration and a desire to assert his autonomy, yet deep down, he battles feelings of inadequacy and familial obligation. His reluctance to share the true contents of the letter reflects inner turmoil, caught between his loyalty to Augustus and his own desires.',
        ap.emotional_tags = ["tiberius's surface emotions reveal frustration", "a desire to assert his autonomy, yet deep down, he battles feelings of inadequacy", "familial obligation. his reluctance to share the true contents of the letter reflects inner turmoil, caught between his loyalty to augustus", "his own desires.", "tiberius's surface emotions reveal frustration and a desire to assert his autonomy", "yet deep down", "he battles feelings of inadequacy and familial obligation. his reluctance to share the true contents of the letter reflects inner turmoil", "caught between his loyalty to augustus and his own desires."],
        ap.active_plans = ["To shield Augustus from the full implications of Drusus's letter, minimizing its significance.", "To express his discontent with his current life in Rome, seeking an escape from the pressures of imperial duty.", "To navigate his relationship with Livia and Augustus without provoking further conflict."],
        ap.beliefs = ["The burdens of duty and expectation are suffocating, and he wishes for freedom from them.", "Family obligations often conflict with personal desires, leading to inevitable tragedy.", "His past decisions regarding Vipsania and Julia haunt him, shaping his current emotional struggles."],
        ap.goals = ["Short-term: To downplay the significance of Drusus's letter and avoid confrontation.", "Medium-term: To seek an eventual escape from Rome to find peace and clarity.", "Ultimate: To reconcile his desires with familial expectations and find a pathway to his own identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_7'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Reception Hall with poised grace, drawn by the escalating argument. She positions herself between Augustus and Tiberius, a figure of controlled observation. Seizing the scroll from Tiberius\'s hesitant grasp, she reads aloud Drusus\'s words, her voice laced with calculated venom, each syllable a precise strike aimed at Drusus\'s reputation.',
        ap.emotional_state = 'Outwardly, Livia maintains a facade of regal composure, her expression cool and collected as she delivers Drusus\'s words like a pronouncement of doom. Internally, she is calculating and ruthless, her ambition burning with cold intensity. There\'s a concealed satisfaction in exposing Drusus\'s vulnerability, and a strategic focus on solidifying her influence over Augustus by manipulating his insecurities.',
        ap.emotional_tags = ["outwardly, livia maintains a facade of regal composure, her expression cool", "collected as she delivers drusus's words like a pronouncement of doom. internally, she is calculating", "ruthless, her ambition burning with cold intensity. there's a concealed satisfaction in exposing drusus's vulnerability,", "a strategic focus on solidifying her influence over augustus by manipulating his insecurities.", "outwardly", "livia maintains a facade of regal composure", "her expression cool and collected as she delivers drusus's words like a pronouncement of doom. internally", "she is calculating and ruthless", "her ambition burning with cold intensity. there's a concealed satisfaction in exposing drusus's vulnerability", "and a strategic focus on solidifying her influence over augustus by manipulating his insecurities."],
        ap.active_plans = ["To decisively expose Drusus's letter as treasonous to Augustus.", "To manipulate Augustus into perceiving Drusus as a genuine threat to his rule.", "To solidify her own position as Augustus's indispensable advisor and protector of the dynasty."],
        ap.beliefs = ["Unwavering loyalty to the dynasty (as she defines it) is paramount.", "Drusus's idealism and popularity pose a direct threat to Tiberius's succession.", "Ruthless action is necessary to eliminate any perceived threat to her family's power."],
        ap.goals = ["short-term\": \"Ensure Augustus fully understands the 'treasonous' nature of Drusus's letter in this moment.", "medium-term\": \"Orchestrate Drusus's downfall and removal from any position of influence.", "ultimate\": \"Secure Tiberius's unchallenged path to succession and maintain her own power behind the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'})
    ON CREATE SET
        ap.current_status = 'Augustus is initially enraged and dominating, pacing and shouting at Tiberius, consumed by his discovery of Tiberius\'s meetings with Vipsania. However, as Livia enters and the focus shifts to Drusus\'s letter, his demeanor shifts. He becomes more passive and uncertain, listening to Livia\'s reading with a growing unease, his initial anger slowly morphing into doubt and weariness.',
        ap.emotional_state = 'On the surface, Augustus displays volatile anger and insecurity, lashing out at Tiberius and demanding obedience. Beneath this bluster, there\'s a deep-seated weariness and a vulnerability to manipulation. He is easily swayed by Livia\'s calculated words, his judgment clouded by age and a desire to maintain familial harmony, even if it\'s based on illusion. He is conflicted between dismissing Drusus’s words and a nagging fear that they might hold some truth.',
        ap.emotional_tags = ["on the surface, augustus displays volatile anger", "insecurity, lashing out at tiberius", "demanding obedience. beneath this bluster, there's a deep-seated weariness", "a vulnerability to manipulation. he is easily swayed by livia's calculated words, his judgment clouded by age", "a desire to maintain familial harmony, even if it's based on illusion. he is conflicted between dismissing drusus\u2019s words", "a nagging fear that they might hold some truth.", "on the surface", "augustus displays volatile anger and insecurity", "lashing out at tiberius and demanding obedience. beneath this bluster", "there's a deep-seated weariness and a vulnerability to manipulation. he is easily swayed by livia's calculated words", "his judgment clouded by age and a desire to maintain familial harmony", "even if it's based on illusion. he is conflicted between dismissing drusus\u2019s words and a nagging fear that they might hold some truth."],
        ap.active_plans = ["To reassert his patriarchal authority over Tiberius and enforce his will regarding Julia and Vipsania.", "To maintain a semblance of familial control and unity in the face of perceived disrespect.", "Initially, to dismiss Drusus's letter as unimportant ramblings, but ultimately swayed by Livia's interpretation."],
        ap.beliefs = ["Absolute obedience and respect are due to him as Caesar and patriarch.", "Maintaining the image of a strong and unified family is essential for imperial stability.", "He is losing his grip on power and is increasingly reliant on Livia's counsel, despite his pride."],
        ap.goals = ["short-term\": \"Resolve the immediate family dispute and restore order in the reception hall.", "medium-term\": \"Maintain control over his family and the empire, even as his grip weakens.", "ultimate\": \"Secure a peaceful and stable succession, ensuring his legacy, though he is increasingly unsure how to achieve it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_7'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands before Augustus, initially defensive and sullen, attempting to deflect his father\'s anger regarding Vipsania. When the letter from Drusus is introduced, he becomes visibly uncomfortable and evasive, attempting to downplay its significance and hesitating to read it aloud. He is caught between loyalty to his brother and the fear of Augustus and Livia\'s wrath, ultimately failing to protect Drusus\'s words from exposure.',
        ap.emotional_state = 'Tiberius is outwardly resentful and withdrawn, sulking under Augustus\'s accusations and trying to minimize the situation. Internally, he is anxious and conflicted, aware of the treasonous content of Drusus\'s letter and torn between familial loyalty and self-preservation. He feels trapped and powerless, knowing that any attempt to defend Drusus will likely backfire and incur Livia\'s displeasure, further isolating him within the family.',
        ap.emotional_tags = ["tiberius is outwardly resentful", "withdrawn, sulking under augustus's accusations", "trying to minimize the situation. internally, he is anxious", "conflicted, aware of the treasonous content of drusus's letter", "torn between familial loyalty", "self-preservation. he feels trapped", "powerless, knowing that any attempt to defend drusus will likely backfire", "incur livia's displeasure, further isolating him within the family.", "tiberius is outwardly resentful and withdrawn", "sulking under augustus's accusations and trying to minimize the situation. internally", "he is anxious and conflicted", "aware of the treasonous content of drusus's letter and torn between familial loyalty and self-preservation. he feels trapped and powerless", "knowing that any attempt to defend drusus will likely backfire and incur livia's displeasure", "further isolating him within the family."],
        ap.active_plans = ["To deflect Augustus's anger away from himself and minimize the consequences of his meetings with Vipsania.", "To initially protect Drusus by downplaying the significance of the letter and its contents.", "To avoid direct confrontation and further inflaming Augustus's temper, prioritizing self-preservation."],
        ap.beliefs = ["Honesty and loyalty are dangerous vulnerabilities in the imperial court.", "Survival depends on appeasing Augustus and, more importantly, Livia.", "Drusus's idealism is naive and ultimately self-destructive in the current political climate."],
        ap.goals = ["short-term\": \"Escape the immediate wrath of Augustus and defuse the confrontation in the reception hall.", "medium-term\": \"Navigate the treacherous dynamics of the imperial family and maintain a degree of safety.", "ultimate\": \"Secure his own survival and potentially find a way to reconcile his duty with his personal desires (though this seems increasingly unlikely given the circumstances)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_8'})
    ON CREATE SET
        ap.current_status = 'Livia enters the Reception Hall with a composed demeanor, her gaze sharp and calculating as she observes the heated exchange between Augustus and Tiberius. She positions herself strategically to interject with her carefully chosen words, subtly guiding the conversation towards her desired outcome.',
        ap.emotional_state = 'Livia maintains an outward façade of calm concern, her voice smooth and persuasive. Internally, however, she revels in the opportunity to manipulate the situation to her advantage, her heart a cold chamber of ambition. She experiences a thrill at successfully steering Augustus’s anger towards Tiberius while concealing her true intentions, showing no remorse for her callousness.',
        ap.emotional_tags = ["livia maintains an outward fa\u00e7ade of calm concern, her voice smooth", "persuasive. internally, however, she revels in the opportunity to manipulate the situation to her advantage, her heart a cold chamber of ambition. she experiences a thrill at successfully steering augustus\u2019s anger towards tiberius while concealing her true intentions, showing no remorse for her callousness.", "livia maintains an outward fa\u00e7ade of calm concern", "her voice smooth and persuasive. internally", "however", "she revels in the opportunity to manipulate the situation to her advantage", "her heart a cold chamber of ambition. she experiences a thrill at successfully steering augustus\u2019s anger towards tiberius while concealing her true intentions", "showing no remorse for her callousness.", "livia maintains an outward fa\u00e7ade of calm concern, her voice smooth and persuasive. internally, however, she revels in the opportunity to manipulate the situation to her advantage, her heart a cold chamber of ambition. she experiences a thrill at successfully steering augustus\u2019s anger towards tiberius", "concealing her true intentions, showing no remorse for her callousness."],
        ap.active_plans = ["To redirect Augustus's anger from Tiberius while subtly reinforcing her control over the situation.", "To suggest recalling Drusus under the guise of concern for his well-being, masking her deadly intent.", "To position Musa, her physician, as the one who will attend to Drusus, ensuring that her plans for his demise come to fruition."],
        ap.beliefs = ["Power must be maintained through calculated manipulation and control.", "The ends always justify the means, particularly in the ruthless pursuit of securing her son's position.", "Familial bonds are expendable when ambition is at stake, allowing her to prioritize her own goals above the well-being of others."],
        ap.goals = ["Short-term: To quell Augustus's anger and shift the conversation away from Tiberius's indiscretions.", "Medium-term: To orchestrate Drusus's return to Rome, cloaked in the guise of concern for his health.", "Ultimate: To eliminate Drusus as a rival and ensure Tiberius's uncontested ascendance to power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_8'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in the reception hall, visibly agitated as he confronts Tiberius about his actions. His body language reflects frustration and authority, pacing slightly as he attempts to assert control over the situation. He is in a protective posture over the family’s reputation, demanding compliance from Tiberius.',
        ap.emotional_state = 'Augustus exhibits a mix of anger and concern, his voice rising as he expresses his displeasure with Tiberius\'s behavior. Beneath the surface, uncertainty brews, as he grapples with the fragility of his authority and the looming fears about succession. His desperation to maintain family unity clashes with his exasperation over Tiberius\'s defiance.',
        ap.emotional_tags = ["augustus exhibits a mix of anger", "concern, his voice rising as he expresses his displeasure with tiberius's behavior. beneath the surface, uncertainty brews, as he grapples with the fragility of his authority", "the looming fears about succession. his desperation to maintain family unity clashes with his exasperation over tiberius's defiance.", "augustus exhibits a mix of anger and concern", "his voice rising as he expresses his displeasure with tiberius's behavior. beneath the surface", "uncertainty brews", "as he grapples with the fragility of his authority and the looming fears about succession. his desperation to maintain family unity clashes with his exasperation over tiberius's defiance."],
        ap.active_plans = ["To admonish Tiberius and assert control over his behavior regarding Vipsania.", "To seek Livia\u2019s support in managing Tiberius\u2019s defiance and to reinforce the importance of stability within the family.", "To ensure that family disputes do not publicly embarrass him or the imperial family."],
        ap.beliefs = ["Maintaining the appearance of family unity is vital for the stability of the empire.", "Authority must be upheld to prevent dissent and maintain respect among the elite.", "The personal sacrifices of family members are necessary for the greater good of the empire."],
        ap.goals = ["Short-term: To reprimand Tiberius and ensure he understands the gravity of his actions.", "Medium-term: To reinforce the importance of familial duty and public decorum.", "Ultimate: To maintain control of the imperial family and secure a smooth succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_8'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands with a defensive posture, his frustration evident as he interacts with Augustus. He attempts to assert his feelings about his marriage to Julia while maintaining a façade of stoicism, despite his internal turmoil. His movements are tense, reflecting the strain of familial expectations weighing upon him.',
        ap.emotional_state = 'Tiberius’s surface emotion is one of irritation and defiance; he feels trapped in a situation where his desires clash with familial obligations. Internally, he is seething with frustration at being forced to conform to Augustus\'s expectations, grappling with feelings of powerlessness and resentment toward both his mother and Augustus.',
        ap.emotional_tags = ["tiberius\u2019s surface emotion is one of irritation", "defiance; he feels trapped in a situation where his desires clash with familial obligations. internally, he is seething with frustration at being forced to conform to augustus's expectations, grappling with feelings of powerlessness", "resentment toward both his mother", "augustus.", "tiberius\u2019s surface emotion is one of irritation and defiance; he feels trapped in a situation where his desires clash with familial obligations. internally", "he is seething with frustration at being forced to conform to augustus's expectations", "grappling with feelings of powerlessness and resentment toward both his mother and augustus.", "tiberius\u2019s surface emotion is one of irritation and defiance", "he feels trapped in a situation where his desires clash with familial obligations. internally, he is seething with frustration at being forced to conform to augustus's expectations, grappling with feelings of powerlessness and resentment toward both his mother and augustus."],
        ap.active_plans = ["To express his dissatisfaction with his marriage and demand the freedom to leave Rome.", "To assert his individuality in the face of Augustus's overwhelming authority.", "To navigate the delicate balance between familial loyalty and personal desire for autonomy."],
        ap.beliefs = ["True fulfillment lies beyond the constraints of familial duty and political obligation.", "He is deserving of autonomy and should not be shackled to a loveless marriage.", "The imperial expectations placed upon him are suffocating and unjust."],
        ap.goals = ["Short-term: To communicate his unhappiness with his marital situation and seek understanding.", "Medium-term: To assert his desire for freedom and a life unbound by familial expectations.", "Ultimate: To reclaim agency over his own life and destiny amidst the suffocating weight of duty."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_makeshift_bed_event_10_1'})
    ON CREATE SET
        oi.description = 'The makeshift bed is the central point of this chaotic scene, serving as the immediate destination for the severely injured Drusus. Guardsmen carefully lift Drusus and gently place him onto the bed, transforming it into a temporary sickbed within the rough military encampment. Rufus directs actions around the bed, indicating its importance as the locus of care and initial response to Drusus\'s injury. It becomes a crucial, albeit rudimentary, element for providing initial aid and rest.',
        oi.status_before = 'Prior to the event, the makeshift bed is likely unoccupied and standing ready within the military encampment. It is in a state of passive readiness, a standard piece of rudimentary furniture intended for use by soldiers, possibly for rest or in case of minor injuries, but not specifically prepared for a severe injury like Drusus’s.',
        oi.status_after = 'Following the event, the makeshift bed is now occupied by the injured Drusus. It has become a focal point of urgent medical concern and immediate action as Rufus and the guardsmen react to Drusus\'s critical condition. The bed transitions from a piece of basic camp furniture to a site of injury and vulnerability, highlighting the harsh realities of the military frontier.'
    WITH oi
    MATCH (o:Object {uuid: 'object_makeshift_bed'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_letter_from_caesar_event_10_3'})
    ON CREATE SET
        oi.description = 'The letter from Caesar is mentioned by Rufus as being delivered by the physician from Rome. Its arrival is a significant event, as it represents direct imperial communication reaching Drusus at the Rhine frontier. Rufus possesses the letter and informs Drusus of its existence, but initially withholds it, intending to present it later. Drusus immediately demands to see the letter, underscoring its perceived importance and creating tension around its contents and the timing of its delivery.',
        oi.status_before = 'The letter is sealed and in Rufus\'s possession, having just been delivered by Livia\'s physician upon his arrival from Rome. Its contents are unknown to both Rufus and Drusus, but it is understood to be official correspondence from Emperor Augustus.',
        oi.status_after = 'The letter remains unopened and in Rufus\'s possession, although Drusus has explicitly demanded to see it immediately. The event concludes with the letter still unread, its contents and potential impact on Drusus and the unfolding narrative still unknown, but its importance firmly established as a point of immediate interest and potential significance.'
    WITH oi
    MATCH (o:Object {uuid: 'object_letter_from_caesar'})
    MATCH (e:Event {uuid: 'event_10_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Centurion Rufus is the dominant figure in the chaotic encampment, physically present and barking sharp, rapid orders to his guardsmen. He gestures emphatically, directing them to fetch the doctor immediately and handle Drusus with utmost care. His movements are purposeful and commanding, reflecting his military authority and urgency in the crisis.',
        ap.emotional_state = 'Rufus projects stern authority, his voice sharp and demanding, masking a deeper concern for Drusus\'s well-being. Beneath his harsh exterior, there\'s a palpable urgency and stress in managing the situation effectively. He is likely suppressing personal emotions to maintain control and ensure his men act swiftly and efficiently in this unexpected crisis, focusing on pragmatic solutions rather than outward displays of emotion.',
        ap.emotional_tags = ["rufus projects stern authority, his voice sharp", "demanding, masking a deeper concern for drusus's well-being. beneath his harsh exterior, there's a palpable urgency", "stress in managing the situation effectively. he is likely suppressing personal emotions to maintain control", "ensure his men act swiftly", "efficiently in this unexpected crisis, focusing on pragmatic solutions rather than outward displays of emotion.", "rufus projects stern authority", "his voice sharp and demanding", "masking a deeper concern for drusus's well-being. beneath his harsh exterior", "there's a palpable urgency and stress in managing the situation effectively. he is likely suppressing personal emotions to maintain control and ensure his men act swiftly and efficiently in this unexpected crisis", "focusing on pragmatic solutions rather than outward displays of emotion."],
        ap.active_plans = ["Ensure Drusus receives immediate medical attention from the physician.", "Maintain order and discipline among the guardsmen amidst the unfolding crisis.", "Assess the situation and gather details about how Drusus sustained his injury to report accurately."],
        ap.beliefs = ["Military discipline and immediate obedience are crucial for effective action in emergencies.", "A leader must project strength and control, even in chaotic situations, to inspire confidence.", "The well-being of soldiers and officers under his command is a primary responsibility, demanding swift action."],
        ap.goals = ["Short-term: Secure the immediate safety and comfort of the injured Drusus.", "Medium-term: Restore order to the encampment and manage the crisis effectively.", "Ultimate: Uphold his duty as a centurion and maintain the efficiency and discipline of his unit in all circumstances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_1_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Guardsman 1 is physically active, responding directly to Rufus\'s commands. He carefully lifts Drusus, working in tandem with Guardsman 2, ensuring Drusus is moved gently onto the makeshift bed. His movements are deliberate and focused, reflecting his attempt to follow orders precisely and avoid any further harm to the injured officer.',
        ap.emotional_state = 'Guardsman 1 displays outward obedience and attentiveness, his actions driven by a clear desire to comply with Rufus\'s stern instructions. Internally, he is likely feeling a mix of anxiety and apprehension, aware of the centurion\'s volatile temper and the potential consequences of error. He is focused on performing his duty correctly, hoping to avoid Rufus’s harsh reprimand and contribute to managing the crisis effectively.',
        ap.emotional_tags = ["guardsman 1 displays outward obedience", "attentiveness, his actions driven by a clear desire to comply with rufus's stern instructions. internally, he is likely feeling a mix of anxiety", "apprehension, aware of the centurion's volatile temper", "the potential consequences of error. he is focused on performing his duty correctly, hoping to avoid rufus\u2019s harsh reprimand", "contribute to managing the crisis effectively.", "guardsman 1 displays outward obedience and attentiveness", "his actions driven by a clear desire to comply with rufus's stern instructions. internally", "he is likely feeling a mix of anxiety and apprehension", "aware of the centurion's volatile temper and the potential consequences of error. he is focused on performing his duty correctly", "hoping to avoid rufus\u2019s harsh reprimand and contribute to managing the crisis effectively."],
        ap.active_plans = ["Execute Rufus's orders precisely and without hesitation.", "Handle Drusus with utmost care during the transfer to the bed.", "Remain vigilant and await further instructions from Centurion Rufus."],
        ap.beliefs = ["A soldier's primary duty is to obey orders from superiors without question.", "Carelessness or incompetence in duty can lead to severe punishment in the Roman military.", "Showing attentiveness and discipline is essential for survival and advancement in the legions."],
        ap.goals = ["Short-term: Successfully and safely assist in moving Drusus onto the makeshift bed as instructed.", "Medium-term: Continue to follow Rufus's commands and contribute to maintaining order in the encampment.", "Ultimate: Fulfill his duties as a guardsman and avoid incurring the wrath of his superiors."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_2_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Guardsman 2 is actively involved in the physical task of lifting Drusus, working in close coordination with Guardsman 1. He mirrors Guardsman 1’s careful movements and focused actions as they transfer Drusus onto the makeshift bed. His posture is attentive and responsive to Rufus’s commands, indicating his readiness to obey and assist.',
        ap.emotional_state = 'Guardsman 2 mirrors Guardsman 1\'s emotional state, displaying outward compliance and a focused demeanor. Underneath, he is likely experiencing similar levels of anxiety and apprehension, acutely aware of Rufus’s stern authority and the potential for harsh repercussions. He is concentrating intently on executing his tasks flawlessly, motivated by a desire to avoid punishment and contribute effectively to the immediate crisis.',
        ap.emotional_tags = ["guardsman 2 mirrors guardsman 1's emotional state, displaying outward compliance", "a focused demeanor. underneath, he is likely experiencing similar levels of anxiety", "apprehension, acutely aware of rufus\u2019s stern authority", "the potential for harsh repercussions. he is concentrating intently on executing his tasks flawlessly, motivated by a desire to avoid punishment", "contribute effectively to the immediate crisis.", "guardsman 2 mirrors guardsman 1's emotional state", "displaying outward compliance and a focused demeanor. underneath", "he is likely experiencing similar levels of anxiety and apprehension", "acutely aware of rufus\u2019s stern authority and the potential for harsh repercussions. he is concentrating intently on executing his tasks flawlessly", "motivated by a desire to avoid punishment and contribute effectively to the immediate crisis."],
        ap.active_plans = ["Collaborate with Guardsman 1 to carefully lift and move Drusus.", "Adhere strictly to Centurion Rufus\u2019s directives and instructions.", "Remain alert and prepared for any subsequent orders or tasks that may arise."],
        ap.beliefs = ["Teamwork and coordinated action are vital for completing tasks efficiently in the military.", "Careful handling of the injured, especially officers, is of utmost importance.", "Respecting and obeying military hierarchy ensures order and prevents chaos in critical situations."],
        ap.goals = ["Short-term: Successfully and carefully help lift Drusus and place him on the makeshift bed without causing further injury.", "Medium-term: Continue to follow Rufus\u2019s orders and assist in maintaining calm and order within the military encampment.", "Ultimate: Maintain his position within the Roman legions and avoid any negative attention or reprimands from his superiors."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Drusus lies on a makeshift bed, his face contorted in pain as he describes the accident. His voice is shaky yet filled with a hint of resilience, as he recounts how his horse fell and crushed his leg.',
        ap.emotional_state = 'Drusus exhibits a mix of pain and determination. His surface bravado attempts to mask the underlying vulnerability and fear of the consequences of his injury, revealing a deeper emotional struggle as he confronts the reality of his situation.',
        ap.emotional_tags = ["drusus exhibits a mix of pain", "determination. his surface bravado attempts to mask the underlying vulnerability", "fear of the consequences of his injury, revealing a deeper emotional struggle as he confronts the reality of his situation.", "drusus exhibits a mix of pain and determination. his surface bravado attempts to mask the underlying vulnerability and fear of the consequences of his injury", "revealing a deeper emotional struggle as he confronts the reality of his situation."],
        ap.active_plans = ["To maintain a sense of humor despite his injury, using it as a coping mechanism.", "To gather information about the letter from Caesar that Rufus has, which he believes may hold significant implications for his future.", "To assess the situation regarding his mother's physician and anticipate how Livia's machinations might affect him."],
        ap.beliefs = ["The belief that resilience in the face of adversity is a mark of true Roman virtue.", "The conviction that family loyalty is paramount, even amidst the turmoil of duty and ambition.", "A growing suspicion about the possible political implications of his injury and the motivations behind his mother's involvement."],
        ap.goals = ["Short-term: To receive proper medical attention and alleviate his immediate pain.", "Medium-term: To understand the contents of the letter from Caesar and its potential impact on his status.", "Ultimate: To protect his family's legacy and navigate the treacherous waters of imperial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Rufus stands over Drusus, directing guardsmen to carefully lift him onto a makeshift bed while barking orders to summon the doctor. His stern demeanor reflects the urgency of the situation.',
        ap.emotional_state = 'Rufus maintains a pragmatic exterior, masking any concern he may feel for Drusus\'s condition. His unwavering focus on military protocol reveals an internal commitment to duty that overrides personal emotions, reflecting the harsh realities of soldiering.',
        ap.emotional_tags = ["rufus maintains a pragmatic exterior", "masking any concern he may feel for drusus's condition. his unwavering focus on military protocol reveals an internal commitment to duty that overrides personal emotions", "reflecting the harsh realities of soldiering."],
        ap.active_plans = ["To ensure Drusus receives immediate medical attention from the personal physician.", "To convey pertinent information about Drusus's injury to the higher command, emphasizing the severity of the situation.", "To maintain order among the guardsmen, ensuring that the camp remains functional and disciplined despite the chaos."],
        ap.beliefs = ["A conviction that discipline and order are crucial to the survival of the military unit.", "The belief in the importance of swift action in the face of injury to prevent further complications.", "An understanding that personal emotions must be set aside for the greater good of the legion and the empire."],
        ap.goals = ["Short-term: To stabilize Drusus\u2019s condition and facilitate the arrival of the physician.", "Medium-term: To manage the situation within the encampment, ensuring efficiency and minimizing panic.", "Ultimate: To uphold the reputation of the legion while navigating the complexities of military and familial loyalty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Drusus lies injured on a makeshift bed within the military encampment, his leg mangled and painful. He is alert and actively engaging in conversation with Rufus, despite his physical distress. He is trying to understand the circumstances of his injury and the unexpected arrival of his mother\'s personal physician, displaying a mix of stoicism and underlying suspicion as he endures the initial assessment of his wounds.',
        ap.emotional_state = 'Drusus is experiencing significant physical pain, evident in his groans and strained expressions. Beneath the surface of his attempts at bravado and sarcastic humor, there is a palpable sense of unease and suspicion. He is clearly unsettled by the mention of his mother\'s physician arriving from Rome, suggesting a pre-existing distrust or awareness of potential manipulations within his family. His forced lightness is a thin veil over his growing anxiety.',
        ap.emotional_tags = ["drusus is experiencing significant physical pain, evident in his groans", "strained expressions. beneath the surface of his attempts at bravado", "sarcastic humor, there is a palpable sense of unease", "suspicion. he is clearly unsettled by the mention of his mother's physician arriving from rome, suggesting a pre-existing distrust or awareness of potential manipulations within his family. his forced lightness is a thin veil over his growing anxiety.", "drusus is experiencing significant physical pain", "evident in his groans and strained expressions. beneath the surface of his attempts at bravado and sarcastic humor", "there is a palpable sense of unease and suspicion. he is clearly unsettled by the mention of his mother's physician arriving from rome", "suggesting a pre-existing distrust or awareness of potential manipulations within his family. his forced lightness is a thin veil over his growing anxiety."],
        ap.active_plans = ["To ascertain the severity of his leg injury and ensure he receives appropriate medical attention.", "To understand the reason for his mother's personal physician's unexpected arrival from Rome and the implications of this development.", "To immediately read the letter from Caesar, believing it might contain crucial information related to his situation or the broader political context."],
        ap.beliefs = ["He believes his injury is serious and requires immediate medical intervention.", "He suspects his mother, Livia, is involved in events surrounding his injury, given the arrival of her personal physician.", "He believes the letter from Caesar holds important information that could shed light on his current predicament and the motivations of those around him."],
        ap.goals = ["Short-term: To alleviate his physical pain and receive immediate medical care for his injured leg.", "Medium-term: To uncover the true reasons behind his mother's physician's arrival and assess any potential threats or manipulations.", "Ultimate: To protect himself from any potential political schemes and understand the broader implications of these events for his future and his family's standing in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Rufus is in command mode, efficiently managing the immediate aftermath of Drusus\'s accident. He barks orders to his guardsmen, ensuring Drusus is carefully moved and that medical assistance is summoned promptly. He is present and attentive to Drusus\'s immediate needs, providing practical support and information in a direct, soldierly manner, while maintaining order within the chaotic encampment.',
        ap.emotional_state = 'Rufus maintains a stern and professional demeanor, characteristic of a Roman centurion. While not overtly emotional, his actions and tone suggest a concern for Drusus\'s well-being, albeit expressed through practical actions and concise communication rather than overt displays of sentiment. He is focused and pragmatic, prioritizing efficient handling of the situation and conveying information factually, revealing a sense of duty and responsibility.',
        ap.emotional_tags = ["rufus maintains a stern", "professional demeanor, characteristic of a roman centurion. while not overtly emotional, his actions", "tone suggest a concern for drusus's well-being, albeit expressed through practical actions", "concise communication rather than overt displays of sentiment. he is focused", "pragmatic, prioritizing efficient handling of the situation", "conveying information factually, revealing a sense of duty", "responsibility.", "rufus maintains a stern and professional demeanor", "characteristic of a roman centurion. while not overtly emotional", "his actions and tone suggest a concern for drusus's well-being", "albeit expressed through practical actions and concise communication rather than overt displays of sentiment. he is focused and pragmatic", "prioritizing efficient handling of the situation and conveying information factually", "revealing a sense of duty and responsibility."],
        ap.active_plans = ["To ensure Drusus receives immediate and adequate medical care for his severe leg injury.", "To maintain order and control within the military encampment despite the disruption caused by Drusus's accident.", "To provide Drusus with necessary information, including the arrival of the physician and the letter from Caesar, while deferring to Drusus's authority and rank."],
        ap.beliefs = ["He believes in the importance of military discipline and efficient action, especially in crisis situations.", "He believes in following orders and protocol, including summoning medical assistance and informing Drusus of relevant developments.", "He believes in respecting rank and authority, demonstrated by his deference to Drusus despite the chaotic circumstances."],
        ap.goals = ["Short-term: To stabilize Drusus's condition and ensure his immediate safety and comfort.", "Medium-term: To manage the logistical and operational impact of Drusus's injury on the military encampment and maintain its functionality.", "Ultimate: To uphold his duty to the Roman legion and contribute to the overall stability and effectiveness of the Roman military presence on the Rhine frontier."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Antonia rushes into the chaotic military encampment, her face pale and eyes wide with distress. She approaches Drusus\'s makeshift bed with urgency, her hands trembling slightly as she reaches out to him, her body leaning forward as if to absorb his pain. The surrounding chaos seems to fade as she focuses solely on him, the weight of the moment pressing down on her.',
        ap.emotional_state = 'Antonia is visibly distraught, her surface emotions betraying a mix of fear and desperation as she rushes to Drusus\'s side. Internally, she grapples with a profound sense of helplessness, torn between her maternal instincts and the harsh realities of war. Unspoken anxieties about Drusus\'s condition clash with her fierce love for him, creating an emotional turmoil that deepens the already perilous atmosphere.',
        ap.emotional_tags = ["antonia is visibly distraught, her surface emotions betraying a mix of fear", "desperation as she rushes to drusus's side. internally, she grapples with a profound sense of helplessness, torn between her maternal instincts", "the harsh realities of war. unspoken anxieties about drusus's condition clash with her fierce love for him, creating an emotional turmoil that deepens the already perilous atmosphere.", "antonia is visibly distraught", "her surface emotions betraying a mix of fear and desperation as she rushes to drusus's side. internally", "she grapples with a profound sense of helplessness", "torn between her maternal instincts and the harsh realities of war. unspoken anxieties about drusus's condition clash with her fierce love for him", "creating an emotional turmoil that deepens the already perilous atmosphere."],
        ap.active_plans = ["To assess Drusus's condition and provide him comfort amidst the chaos.", "To gather information about the injury and the circumstances surrounding it.", "To maintain a brave front for Drusus, despite her own fears and worries."],
        ap.beliefs = ["Family is worth fighting for, and the bonds of love endure even in suffering.", "She believes in the importance of being strong for her loved ones, even when feeling weak.", "War's cost is not just borne by soldiers but deeply impacts their families as well."],
        ap.goals = ["Short-term: To ensure Drusus receives proper medical attention and support.", "Medium-term: To understand the full scope of the injury and its implications for their family.", "Ultimate: To protect her family from the undeniable toll of war and ambition, striving for peace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Drusus lies on a makeshift bed, his body visibly weakened and in pain from the injury. He attempts to raise his head to reassure Antonia, but the effort is evident through grimaces of pain. His posture is one of vulnerability, yet he strives to appear stoic, revealing both his physical suffering and his determination to maintain a semblance of strength in front of his wife.',
        ap.emotional_state = 'Drusus\'s surface emotions convey a mix of pain and annoyance at his predicament, though he masks this with a brave front, attempting to reassure Antonia. Internally, he is grappling with fear and vulnerability—a warrior\'s pride clashing with the reality of his injury. His thoughts are clouded with anxiety over the implications of his condition and the political machinations at play, hinting at deeper concerns about his family\'s safety and future.',
        ap.emotional_tags = ["drusus's surface emotions convey a mix of pain", "annoyance at his predicament, though he masks this with a brave front, attempting to reassure antonia. internally, he is grappling with fear", "vulnerability\u2014a warrior's pride clashing with the reality of his injury. his thoughts are clouded with anxiety over the implications of his condition", "the political machinations at play, hinting at deeper concerns about his family's safety", "future.", "drusus's surface emotions convey a mix of pain and annoyance at his predicament", "though he masks this with a brave front", "attempting to reassure antonia. internally", "he is grappling with fear and vulnerability\u2014a warrior's pride clashing with the reality of his injury. his thoughts are clouded with anxiety over the implications of his condition and the political machinations at play", "hinting at deeper concerns about his family's safety and future."],
        ap.active_plans = ["To downplay his injury to reassure Antonia and maintain her composure.", "To gather information about the circumstances of his injury and what comes next.", "To convey his concerns about the political implications of his injury to Rufus."],
        ap.beliefs = ["Honor and strength are paramount; vulnerability is a sign of weakness.", "The loyalty of family must endure through adversity, despite the pains of war.", "He believes in facing the consequences of his duty, regardless of personal cost."],
        ap.goals = ["Short-term: To receive medical care and comfort from Antonia.", "Medium-term: To understand the implications of his injury on his military duties and family.", "Ultimate: To ensure his family's safety amidst the treacherous currents of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Rufus stands at the forefront of the chaos, barking orders and maintaining a stern demeanor even as he assesses Drusus’s condition. His posture is rigid, embodying the authority of a seasoned centurion. He moves swiftly, ensuring the guardsmen attend to Drusus carefully while balancing the urgent demands of the encampment.',
        ap.emotional_state = 'Rufus displays a tough exterior, masking any personal concern for Drusus’s injury with a pragmatic focus on military efficiency. However, beneath his stern façade, a flicker of empathy exists for the wounded soldier, as he understands the deep implications of war on both a personal and communal level. He feels the weight of responsibility for Drusus\'s safety amidst the chaos.',
        ap.emotional_tags = ["rufus displays a tough exterior, masking any personal concern for drusus\u2019s injury with a pragmatic focus on military efficiency. however, beneath his stern fa\u00e7ade, a flicker of empathy exists for the wounded soldier, as he understands the deep implications of war on both a personal", "communal level. he feels the weight of responsibility for drusus's safety amidst the chaos.", "rufus displays a tough exterior", "masking any personal concern for drusus\u2019s injury with a pragmatic focus on military efficiency. however", "beneath his stern fa\u00e7ade", "a flicker of empathy exists for the wounded soldier", "as he understands the deep implications of war on both a personal and communal level. he feels the weight of responsibility for drusus's safety amidst the chaos."],
        ap.active_plans = ["To ensure Drusus receives immediate medical attention and proper care.", "To manage the guardsmen effectively, driving home the seriousness of the situation.", "To relay the urgency of contacting the personal physician and handling the incoming letter from Caesar."],
        ap.beliefs = ["Military duty demands unwavering resilience and efficiency, especially in times of crisis.", "The wellbeing of soldiers is paramount, reflecting the strength of the legion.", "Leadership requires a balance of authority and compassion, even if it is unspoken."],
        ap.goals = ["Short-term: To stabilize Drusus's condition and expedite medical assistance.", "Medium-term: To navigate the chaotic atmosphere of the encampment while maintaining order.", "Ultimate: To uphold the honor of the legion and ensure the safety of all soldiers under his command."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Augustus paces the room, his movements restless and agitated, a stark contrast to his usual imperial composure. He repeatedly questions the circumstances of Drusus\'s accident, unable to reconcile the report with his understanding of his son\'s capabilities. He is physically present in his palace, directing his questions towards both Livia and Tiberius, seeking clarity and understanding.',
        ap.emotional_state = 'Augustus is gripped by a palpable disbelief and suspicion. Outwardly, he expresses confusion and skepticism about the \'simple fall,\' his tone laced with doubt. Internally, he is wrestling with a growing unease, sensing that the official explanation is insufficient. He is emotionally troubled by the news, oscillating between paternal concern for Drusus and a ruler\'s instinct to detect potential threats or deception within his own family.',
        ap.emotional_tags = ["augustus is gripped by a palpable disbelief", "suspicion. outwardly, he expresses confusion", "skepticism about the 'simple fall,' his tone laced with doubt. internally, he is wrestling with a growing unease, sensing that the official explanation is insufficient. he is emotionally troubled by the news, oscillating between paternal concern for drusus", "a ruler's instinct to detect potential threats or deception within his own family.", "augustus is gripped by a palpable disbelief and suspicion. outwardly", "he expresses confusion and skepticism about the 'simple fall", "' his tone laced with doubt. internally", "he is wrestling with a growing unease", "sensing that the official explanation is insufficient. he is emotionally troubled by the news", "oscillating between paternal concern for drusus and a ruler's instinct to detect potential threats or deception within his own family."],
        ap.active_plans = ["To ascertain the true nature and severity of Drusus's injury.", "To gauge Livia and Tiberius's reactions to the news to discern any hidden agendas or knowledge.", "To decide on an appropriate imperial response, balancing concern for his son with the need for political stability and control."],
        ap.beliefs = ["Accidents, especially those involving experienced soldiers like Drusus, are often more than they seem.", "Maintaining control requires understanding the truth behind events, even within his own family.", "Public displays of concern and piety are expected of a ruler, regardless of personal feelings or suspicions."],
        ap.goals = ["Short-term: Uncover the real story behind Drusus's 'accident'.", "Medium-term: Ensure the stability of the succession and the empire amidst potential familial discord.", "Ultimate: Secure his legacy as a wise and discerning ruler, even as he confronts the limitations of his power and understanding in old age."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly by, physically present but emotionally reserved. He listens intently to Augustus and Livia, his body language suggesting a contained grief and a simmering urgency. When prompted, he offers terse responses, initially downplaying the potential severity of falls, but quickly pivoting to express a resolute need to travel to his brother\'s side, demonstrating a soldier\'s directness amidst courtly intrigue.',
        ap.emotional_state = 'Tiberius is grappling with a potent mix of grief and suppressed alarm. On the surface, he maintains a stoic facade, characteristic of his hardened nature, offering brief, seemingly pragmatic replies. However, beneath this exterior, a deep concern for Drusus is evident, fueling his urgent desire to depart. He is likely suspicious of the circumstances surrounding the accident, given the court\'s treacherous nature, but refrains from voicing these suspicions openly, internalizing his anxieties while processing the ominous news.',
        ap.emotional_tags = ["tiberius is grappling with a potent mix of grief", "suppressed alarm. on the surface, he maintains a stoic facade, characteristic of his hardened nature, offering brief, seemingly pragmatic replies. however, beneath this exterior, a deep concern for drusus is evident, fueling his urgent desire to depart. he is likely suspicious of the circumstances surrounding the accident, given the court's treacherous nature, but refrains from voicing these suspicions openly, internalizing his anxieties while processing the ominous news.", "tiberius is grappling with a potent mix of grief and suppressed alarm. on the surface", "he maintains a stoic facade", "characteristic of his hardened nature", "offering brief", "seemingly pragmatic replies. however", "beneath this exterior", "a deep concern for drusus is evident", "fueling his urgent desire to depart. he is likely suspicious of the circumstances surrounding the accident", "given the court's treacherous nature", "but refrains from voicing these suspicions openly", "internalizing his anxieties while processing the ominous news.", "tiberius is grappling with a potent mix of grief and suppressed alarm. on the surface, he maintains a stoic facade, characteristic of his hardened nature, offering brief, seemingly pragmatic replies. however, beneath this exterior, a deep concern for drusus is evident, fueling his urgent desire to depart. he is likely suspicious of the circumstances surrounding the accident, given the court's treacherous nature, but refrains from voicing these suspicions openly, internalizing his anxieties", "processing the ominous news.", "tiberius is grappling with a potent mix of grief and suppressed alarm. on the surface, he maintains a stoic facade, characteristic of his hardened nature, offering brief, seemingly pragmatic replies. however, beneath this exterior, a deep concern for drusus is evident, fueling his urgent desire to depart. he is likely suspicious of the circumstances surrounding the accident, given the court's treacherous nature,", "refrains from voicing these suspicions openly, internalizing his anxieties while processing the ominous news."],
        ap.active_plans = ["To assess the immediate danger to Drusus based on the available information.", "To convince Augustus of the necessity of his personal presence at Drusus's side.", "To prepare for a swift departure to the Rhine frontier, overriding any potential political obstacles or delays."],
        ap.beliefs = ["Blood ties and fraternal duty supersede political maneuvering and courtly decorum.", "Direct action and personal presence are essential in times of crisis, especially when family is involved.", "Official accounts can be unreliable, and firsthand observation is crucial to discern the truth."],
        ap.goals = ["Short-term: Reach Drusus's bedside as quickly as possible.", "Medium-term: Provide comfort and support to Drusus, and ascertain the true circumstances of his injury.", "Ultimate: Protect his family and honor his brother's legacy, even as he navigates the treacherous currents of imperial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Livia observes Augustus with an air of calculated coolness, her posture suggesting detachment and control amidst the unfolding drama. She interjects with dismissive remarks about Drusus\'s accident, subtly steering the conversation towards political interpretations of his absence. She remains physically composed, her presence in the room a silent assertion of her influence and unwavering agenda, watching as Augustus and Tiberius react to her carefully crafted narrative.',
        ap.emotional_state = 'Livia is emotionally detached and strategically focused, betraying no outward concern for Drusus\'s well-being. Her surface emotions are carefully controlled, projecting an image of pragmatic cynicism and imperial resolve. Internally, she is likely satisfied with the progression of her plans, viewing Drusus\'s \'accident\' as a successful step towards securing Tiberius\'s succession. Her unspoken conflict lies in maintaining her facade of concern while subtly manipulating Augustus and Tiberius to accept her narrative and prevent any interference with her machinations.',
        ap.emotional_tags = ["livia is emotionally detached", "strategically focused, betraying no outward concern for drusus's well-being. her surface emotions are carefully controlled, projecting an image of pragmatic cynicism", "imperial resolve. internally, she is likely satisfied with the progression of her plans, viewing drusus's 'accident' as a successful step towards securing tiberius's succession. her unspoken conflict lies in maintaining her facade of concern while subtly manipulating augustus", "tiberius to accept her narrative", "prevent any interference with her machinations.", "livia is emotionally detached and strategically focused", "betraying no outward concern for drusus's well-being. her surface emotions are carefully controlled", "projecting an image of pragmatic cynicism and imperial resolve. internally", "she is likely satisfied with the progression of her plans", "viewing drusus's 'accident' as a successful step towards securing tiberius's succession. her unspoken conflict lies in maintaining her facade of concern while subtly manipulating augustus and tiberius to accept her narrative and prevent any interference with her machinations.", "livia is emotionally detached and strategically focused, betraying no outward concern for drusus's well-being. her surface emotions are carefully controlled, projecting an image of pragmatic cynicism and imperial resolve. internally, she is likely satisfied with the progression of her plans, viewing drusus's 'accident' as a successful step towards securing tiberius's succession. her unspoken conflict lies in maintaining her facade of concern", "subtly manipulating augustus and tiberius to accept her narrative and prevent any interference with her machinations."],
        ap.active_plans = ["To minimize Augustus's concern for Drusus and redirect his focus towards political considerations.", "To subtly plant seeds of doubt about Drusus's loyalty and motives, portraying him as a potential threat.", "To discourage both Augustus and Tiberius from investigating Drusus's accident too closely, maintaining plausible deniability."],
        ap.beliefs = ["Drusus is an obstacle to Tiberius's ascension and his removal is a necessary evil for the stability of the dynasty.", "Emotional displays are weaknesses to be exploited; calculated manipulation is the true path to power.", "Family ties are secondary to the overarching goal of securing and maintaining imperial control for her lineage."],
        ap.goals = ["Short-term: Control the narrative surrounding Drusus's accident and Augustus's reaction.", "Medium-term: Ensure Drusus's permanent incapacitation and removal from political contention.", "Ultimate: Solidify Tiberius's path to the throne and secure her own enduring influence as Empress Mother, shaping the future of Rome according to her will."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands coolly, her posture relaxed yet assertive, observing Augustus as he paces anxiously. She delivers her words with a chilling detachment, dismissing the gravity of Drusus’s injury and insinuating treachery with the subtle raise of an eyebrow and a cold smile.',
        ap.emotional_state = 'Livia appears outwardly calm and composed, exuding an air of confidence and control. Internally, she is calculating and suspicious, harboring resentment against her son Drusus and potentially viewing his injury as a strategic opportunity to manipulate the family dynamics and consolidate Tiberius\'s position. Her cold demeanor betrays a deep-seated ambition that drives her actions.',
        ap.emotional_tags = ["livia appears outwardly calm", "composed, exuding an air of confidence", "control. internally, she is calculating", "suspicious, harboring resentment against her son drusus", "potentially viewing his injury as a strategic opportunity to manipulate the family dynamics", "consolidate tiberius's position. her cold demeanor betrays a deep-seated ambition that drives her actions.", "livia appears outwardly calm and composed", "exuding an air of confidence and control. internally", "she is calculating and suspicious", "harboring resentment against her son drusus and potentially viewing his injury as a strategic opportunity to manipulate the family dynamics and consolidate tiberius's position. her cold demeanor betrays a deep-seated ambition that drives her actions."],
        ap.active_plans = ["To undermine Drusus's credibility and cast doubt on his loyalty to the family.", "To manipulate Tiberius's emotions and actions regarding Drusus to strengthen her influence over him.", "To maintain her control over the narrative surrounding Drusus\u2019s injury, framing it as a betrayal rather than a misfortune."],
        ap.beliefs = ["Power is best secured through manipulation and sowing discord among rivals.", "Familial loyalty is secondary to ambition and political advantage.", "Her son Tiberius must be positioned advantageously within the imperial family, regardless of the cost to others."],
        ap.goals = ["Short-term: To discourage Tiberius's emotional response to Drusus's injury and encourage a sense of suspicion.", "Medium-term: To consolidate Tiberius's power as the rightful heir by weakening any threats posed by Drusus.", "Ultimate: To secure the throne for Tiberius, ensuring her legacy as the architect of his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands by, his body tense and posture rigid. He listens intently to Livia\'s dismissive comments, his brow furrowed in concern and frustration as he prepares to speak against her insinuations about his brother Drusus, defensively crossing his arms and shaking his head.',
        ap.emotional_state = 'Tiberius exhibits a surface level of agitation and concern for his brother, visibly struggling against the undercurrents of familial tension. Internally, he grapples with anger towards Livia\'s dismissiveness and a sense of helplessness over his circumstances, which fuels his urgent desire to act and check on Drusus. His loyalty to his brother clashes with his awareness of Livia\'s manipulative tendencies.',
        ap.emotional_tags = ["tiberius exhibits a surface level of agitation", "concern for his brother, visibly struggling against the undercurrents of familial tension. internally, he grapples with anger towards livia's dismissiveness", "a sense of helplessness over his circumstances, which fuels his urgent desire to act", "check on drusus. his loyalty to his brother clashes with his awareness of livia's manipulative tendencies.", "tiberius exhibits a surface level of agitation and concern for his brother", "visibly struggling against the undercurrents of familial tension. internally", "he grapples with anger towards livia's dismissiveness and a sense of helplessness over his circumstances", "which fuels his urgent desire to act and check on drusus. his loyalty to his brother clashes with his awareness of livia's manipulative tendencies."],
        ap.active_plans = ["To assert the importance of familial loyalty and support Drusus despite Livia's comments.", "To convince Augustus of the need to allow him to travel to Drusus\u2019s side.", "To confront Livia's cold dismissal of Drusus's situation and advocate for his brother."],
        ap.beliefs = ["Family loyalty supersedes political maneuvering, even amidst the treacherous court.", "Drusus's injury deserves genuine concern and should not be used as a tool for political advantage.", "His brother's welfare is paramount, and he feels an obligation to protect him from perceived treachery."],
        ap.goals = ["Short-term: To gain permission from Augustus to travel to Drusus and offer him support.", "Medium-term: To reaffirm his role as a loyal brother and ally against Livia's manipulative influence.", "Ultimate: To protect his family from the deadly game of politics while navigating the treacherous waters of imperial ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands in Augustus\'s palace, initially listening to Augustus and Livia discuss Drusus\'s accident with a stoic posture. However, as Livia insinuates Drusus is feigning illness, Tiberius\'s stance shifts. He becomes more assertive, directly addressing Livia and then firmly declaring his intention to travel to Drusus\'s side, ignoring Augustus\'s pragmatic concerns. He exits the room with haste, driven by a powerful need to be with his brother.',
        ap.emotional_state = 'Tiberius is deeply troubled by the news of Drusus\'s grave injury, his concern evident despite his attempts at a stoic demeanor. He outwardly expresses frustration and a hint of anger towards Livia\'s manipulative words, his voice rising in protest. Internally, he is likely experiencing a surge of grief and worry for his brother, battling against the cynicism and political calculations of his mother and stepfather. Beneath the surface, a strong current of familial loyalty and brotherly love drives his resolute decision, contrasting sharply with the cold pragmatism of the imperial court.',
        ap.emotional_tags = ["tiberius is deeply troubled by the news of drusus's grave injury, his concern evident despite his attempts at a stoic demeanor. he outwardly expresses frustration", "a hint of anger towards livia's manipulative words, his voice rising in protest. internally, he is likely experiencing a surge of grief", "worry for his brother, battling against the cynicism", "political calculations of his mother", "stepfather. beneath the surface, a strong current of familial loyalty", "brotherly love drives his resolute decision, contrasting sharply with the cold pragmatism of the imperial court.", "tiberius is deeply troubled by the news of drusus's grave injury", "his concern evident despite his attempts at a stoic demeanor. he outwardly expresses frustration and a hint of anger towards livia's manipulative words", "his voice rising in protest. internally", "he is likely experiencing a surge of grief and worry for his brother", "battling against the cynicism and political calculations of his mother and stepfather. beneath the surface", "a strong current of familial loyalty and brotherly love drives his resolute decision", "contrasting sharply with the cold pragmatism of the imperial court."],
        ap.active_plans = ["Assert his unwavering loyalty to Drusus and his family bond.", "Overcome Augustus's pragmatic objections and secure permission to depart.", "Travel to the Rhine frontier with utmost speed to reach Drusus's bedside."],
        ap.beliefs = ["Familial duty and loyalty supersede political considerations.", "He has a moral obligation to be present for his brother in a crisis.", "Livia's manipulative nature is a constant threat to genuine familial bonds."],
        ap.goals = ["short_term\": \"To immediately depart for the Rhine Frontier.", "medium_term\": \"To reach Drusus's side and offer him comfort and support during his illness, or be present in his final moments.", "ultimate\": \"To uphold his familial responsibilities and maintain the integrity of his bond with Drusus, even amidst the treacherous political landscape of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Augustus paces within his palace, his movements betraying his inner turmoil and concern upon hearing the news of Drusus\'s accident. He directs questions at both Livia and Tiberius, seeking to understand the situation. Initially, he voices pragmatic objections to Tiberius\'s impulsive decision to travel, citing distance and potential futility. However, he eventually relents, granting Tiberius permission to depart before abruptly shifting his focus to the Senate\'s decree of his deification in Palmyra, adopting a more detached, philosophical tone as Tiberius exits.',
        ap.emotional_state = 'Augustus displays a surface level of concern regarding Drusus\'s injury, questioning the circumstances with a hint of suspicion, though his primary emotional register is one of weary pragmatism. He outwardly expresses doubt about the severity of the situation and the practicality of Tiberius\'s journey, reflecting a ruler\'s concern for logistics and appearances. Internally, he may be wrestling with genuine worry for Drusus, overshadowed by his ingrained political calculations and the burdens of empire. The sudden shift to discussing his deification reveals an underlying detachment and perhaps a resignation to the vagaries of fate and the superficiality of power, contrasting with Tiberius\'s raw emotional response.',
        ap.emotional_tags = ["augustus displays a surface level of concern regarding drusus's injury, questioning the circumstances with a hint of suspicion, though his primary emotional register is one of weary pragmatism. he outwardly expresses doubt about the severity of the situation", "the practicality of tiberius's journey, reflecting a ruler's concern for logistics", "appearances. internally, he may be wrestling with genuine worry for drusus, overshadowed by his ingrained political calculations", "the burdens of empire. the sudden shift to discussing his deification reveals an underlying detachment", "perhaps a resignation to the vagaries of fate", "the superficiality of power, contrasting with tiberius's raw emotional response.", "augustus displays a surface level of concern regarding drusus's injury", "questioning the circumstances with a hint of suspicion", "though his primary emotional register is one of weary pragmatism. he outwardly expresses doubt about the severity of the situation and the practicality of tiberius's journey", "reflecting a ruler's concern for logistics and appearances. internally", "he may be wrestling with genuine worry for drusus", "overshadowed by his ingrained political calculations and the burdens of empire. the sudden shift to discussing his deification reveals an underlying detachment and perhaps a resignation to the vagaries of fate and the superficiality of power", "contrasting with tiberius's raw emotional response."],
        ap.active_plans = ["Assess the potential political ramifications of Drusus's injury and Tiberius's reaction.", "Maintain a semblance of imperial control and reasoned decision-making, even in the face of unsettling news.", "Offer symbolic gestures of support, such as sacrifices and prayers, while maintaining a pragmatic distance from the emotional turmoil of the situation."],
        ap.beliefs = ["Political pragmatism and reasoned judgment are paramount for an emperor.", "Emotional displays should be tempered by strategic considerations.", "Public perception and religious rituals are essential components of imperial authority."],
        ap.goals = ["short_term\": \"To understand the true nature of Drusus's condition and its potential impact on the empire.", "medium_term\": \"To ensure the stability of the empire and maintain his image as a composed and rational ruler in the face of crisis.", "ultimate\": \"To secure his legacy as a divinely ordained emperor and maintain the Pax Romana, even as familial and political tensions escalate around him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Augustus paces with a furrowed brow, revealing his concern as he processes the gravity of Drusus\'s injury. He stands before Tiberius, his posture suggesting both authority and weariness, while Livia observes with a calculating demeanor, her presence unyielding yet poised.',
        ap.emotional_state = 'Augustus\'s surface emotions reflect anxiety and frustration. His brow knits together as he grapples with the implications of Drusus\'s fall. Internally, he wrestles with the weight of impending loss and the disconnection growing between him and his family, revealing an emotional detachment that leads him to dismiss Tiberius\'s urgency.',
        ap.emotional_tags = ["augustus's surface emotions reflect anxiety", "frustration. his brow knits together as he grapples with the implications of drusus's fall. internally, he wrestles with the weight of impending loss", "the disconnection growing between him", "his family, revealing an emotional detachment that leads him to dismiss tiberius's urgency.", "augustus's surface emotions reflect anxiety and frustration. his brow knits together as he grapples with the implications of drusus's fall. internally", "he wrestles with the weight of impending loss and the disconnection growing between him and his family", "revealing an emotional detachment that leads him to dismiss tiberius's urgency."],
        ap.active_plans = ["To assess the situation with Drusus and gauge the seriousness of his injuries.", "To offer Tiberius a chance to express familial love while also maintaining a fa\u00e7ade of control over the situation.", "To divert attention to his own divine status, perhaps as a coping mechanism to mask his emotional turmoil."],
        ap.beliefs = ["He believes that maintaining control over his family and the empire is paramount, even at the cost of personal connections.", "He holds a conviction that external appearances of divinity and power can mask internal familial chaos.", "He thinks that expressions of love can sometimes serve as mere formalities rather than genuine emotions."],
        ap.goals = ["Short-term: To quickly conclude the conversation about Drusus and allow Tiberius to leave without further emotional turmoil.", "Medium-term: To stabilize the family dynamics by maintaining a semblance of unity in the face of crisis.", "Ultimate: To secure his legacy as a revered ruler, which may involve putting family loyalty above emotional connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands beside Augustus, his form tense yet resolute. He shifts his weight as urgency overtakes him, his body language revealing a deep-seated need to act. When he insists on going to Drusus, his gestures and tone reflect both determination and desperation.',
        ap.emotional_state = 'Tiberius outwardly displays urgency and concern for his brother. He speaks with intensity and emotion, reflecting his loyalty and love. Beneath the surface, anxiety and fear churn; he is haunted by the weight of familial duty, grappling with feelings of inadequacy in the face of impending sorrow.',
        ap.emotional_tags = ["tiberius outwardly displays urgency", "concern for his brother. he speaks with intensity", "emotion, reflecting his loyalty", "love. beneath the surface, anxiety", "fear churn; he is haunted by the weight of familial duty, grappling with feelings of inadequacy in the face of impending sorrow.", "tiberius outwardly displays urgency and concern for his brother. he speaks with intensity and emotion", "reflecting his loyalty and love. beneath the surface", "anxiety and fear churn; he is haunted by the weight of familial duty", "grappling with feelings of inadequacy in the face of impending sorrow.", "tiberius outwardly displays urgency and concern for his brother. he speaks with intensity and emotion, reflecting his loyalty and love. beneath the surface, anxiety and fear churn", "he is haunted by the weight of familial duty, grappling with feelings of inadequacy in the face of impending sorrow."],
        ap.active_plans = ["To secure permission from Augustus to travel to Drusus's side.", "To convey his love and support to Drusus despite the distance.", "To assert his role as a protective brother, demonstrating his commitment to family even amid political chaos."],
        ap.beliefs = ["He believes that familial bonds should take precedence over political obligations, especially in times of crisis.", "He holds a conviction that loyalty and love can influence fate, driving him to act despite the distance.", "He thinks that personal sacrifice is necessary to uphold the honor of his family."],
        ap.goals = ["Short-term: To hasten departure to be with Drusus, showing his commitment as a brother.", "Medium-term: To reaffirm familial connections that he fears are fraying under the weight of their roles.", "Ultimate: To navigate the complexities of his destiny as a son and brother while trying to secure a better future for the family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Augustus paces restlessly within his palace, visibly agitated by the news of Drusus\'s accident. He questions the details of the event, seeking clarification and perhaps reassurance, while directing his inquiries towards both Livia and Tiberius. His movements and speech betray a deep unease and a need to understand the situation fully before him.',
        ap.emotional_state = 'On the surface, Augustus expresses concern and confusion regarding Drusus\'s accident, questioning its severity and suddenness. However, beneath this veneer of concern lies a deep-seated vanity and insecurity. His abrupt shift to the Senate\'s decision to deify him in Palmyra reveals a preoccupation with his legacy and public image, suggesting a need for external validation even in moments of potential personal tragedy. There is a palpable tension between his stated worry for family and his self-absorbed need for divine recognition.',
        ap.emotional_tags = ["on the surface, augustus expresses concern", "confusion regarding drusus's accident, questioning its severity", "suddenness. however, beneath this veneer of concern lies a deep-seated vanity", "insecurity. his abrupt shift to the senate's decision to deify him in palmyra reveals a preoccupation with his legacy", "public image, suggesting a need for external validation even in moments of potential personal tragedy. there is a palpable tension between his stated worry for family", "his self-absorbed need for divine recognition.", "on the surface", "augustus expresses concern and confusion regarding drusus's accident", "questioning its severity and suddenness. however", "beneath this veneer of concern lies a deep-seated vanity and insecurity. his abrupt shift to the senate's decision to deify him in palmyra reveals a preoccupation with his legacy and public image", "suggesting a need for external validation even in moments of potential personal tragedy. there is a palpable tension between his stated worry for family and his self-absorbed need for divine recognition."],
        ap.active_plans = ["To ascertain the true nature and severity of Drusus's injury.", "To process the news of his impending deification in Palmyra and its implications for his legacy.", "To maintain an outward appearance of imperial control and composure despite the unsettling news from the Rhine frontier."],
        ap.beliefs = ["His authority and imperial power are paramount and must be visibly maintained at all times.", "Public perception and his historical legacy are crucial components of his rule and must be actively managed.", "Even with the honor of deification, his power and influence have practical limitations in the face of mortality and real-world problems."],
        ap.goals = ["{short_term: To quickly understand the facts surrounding Drusus's accident and its immediate impact on the stability of the empire., medium_term: To manage the political ramifications of Drusus's potential incapacitation or death, ensuring a smooth transition and preventing any power vacuum., ultimate: To solidify his legacy as a divinely recognized emperor, securing his place in history and ensuring the long-term stability and veneration of the Julio-Claudian dynasty.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Livia observes Augustus\'s agitation with a composed and calculating demeanor, remaining physically still while her mind is clearly active. She interjects with cynical remarks about Drusus\'s accident, suggesting it might be a fabrication to avoid returning to Rome, her tone sharp and dismissive. Her posture is likely controlled, betraying no outward sign of emotion beyond cool observation.',
        ap.emotional_state = 'Livia outwardly expresses a cynical disbelief regarding the seriousness of Drusus\'s injury, dismissing it as a convenient excuse. Internally, she is likely experiencing a cold satisfaction, seeing Drusus\'s potential removal from the political landscape as advantageous for her ambitions for Tiberius. Her emotional state is characterized by a chilling pragmatism; she prioritizes political expediency over familial sentimentality, masking her manipulative intentions behind a veneer of detached observation and pointed skepticism. There is a calculated tension between her dismissive words and her inner satisfaction.',
        ap.emotional_tags = ["livia outwardly expresses a cynical disbelief regarding the seriousness of drusus's injury, dismissing it as a convenient excuse. internally, she is likely experiencing a cold satisfaction, seeing drusus's potential removal from the political landscape as advantageous for her ambitions for tiberius. her emotional state is characterized by a chilling pragmatism; she prioritizes political expediency over familial sentimentality, masking her manipulative intentions behind a veneer of detached observation", "pointed skepticism. there is a calculated tension between her dismissive words", "her inner satisfaction.", "livia outwardly expresses a cynical disbelief regarding the seriousness of drusus's injury", "dismissing it as a convenient excuse. internally", "she is likely experiencing a cold satisfaction", "seeing drusus's potential removal from the political landscape as advantageous for her ambitions for tiberius. her emotional state is characterized by a chilling pragmatism; she prioritizes political expediency over familial sentimentality", "masking her manipulative intentions behind a veneer of detached observation and pointed skepticism. there is a calculated tension between her dismissive words and her inner satisfaction.", "livia outwardly expresses a cynical disbelief regarding the seriousness of drusus's injury, dismissing it as a convenient excuse. internally, she is likely experiencing a cold satisfaction, seeing drusus's potential removal from the political landscape as advantageous for her ambitions for tiberius. her emotional state is characterized by a chilling pragmatism", "she prioritizes political expediency over familial sentimentality, masking her manipulative intentions behind a veneer of detached observation and pointed skepticism. there is a calculated tension between her dismissive words and her inner satisfaction."],
        ap.active_plans = ["To minimize Augustus's concern for Drusus and subtly steer his focus towards potential political motivations behind Drusus's absence.", "To sow seeds of doubt in Augustus's mind regarding Drusus's loyalty and intentions, portraying him as potentially opportunistic and self-serving.", "To reinforce the narrative that Drusus's absence is not a genuine tragedy but a calculated political maneuver, thus justifying a lack of deep emotional response from Augustus and the court."],
        ap.beliefs = ["Drusus poses a significant obstacle to Tiberius's uncontested succession and must be neutralized, even if through seemingly accidental means.", "Manipulation and deception are essential and justifiable tools for achieving her dynastic goals, especially when dealing with political rivals or inconvenient family members.", "Augustus, despite his power, is susceptible to her carefully crafted influence and can be subtly manipulated to serve her agenda and reinforce her desired narrative."],
        ap.goals = ["{short_term: To successfully downplay the perceived tragedy of Drusus's accident in Augustus's eyes, preventing any genuine outpouring of grief or investigation., medium_term: To ensure Drusus's continued absence and eventual removal from the political scene, solidifying Tiberius's path to succession by eliminating potential rivals., ultimate: To secure the Julio-Claudian dynasty under Tiberius's rule, establishing her family's enduring legacy and consolidating her own lasting influence and power within the empire.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Antonia kneels beside her ailing husband Drusus, her posture leaning forward with concern, her hands gently resting on his arm as she gazes into his eyes, searching for clarity in his whisper. She displays a mix of urgency and tenderness, preparing to fulfill his wish.',
        ap.emotional_state = 'Antonia\'s surface emotions reflect a deep-seated worry and sorrow as she speaks with a trembling voice. Internally, she grapples with anguish, the looming specter of loss weighing heavily on her heart, embodying the dual conflict of needing to act quickly for her husband\'s wishes while facing the imminent grief of losing him. There is a fierce determination to be present for him, revealing her unwavering love even in this tragic moment.',
        ap.emotional_tags = ["antonia's surface emotions reflect a deep-seated worry", "sorrow as she speaks with a trembling voice. internally, she grapples with anguish, the looming specter of loss weighing heavily on her heart, embodying the dual conflict of needing to act quickly for her husband's wishes while facing the imminent grief of losing him. there is a fierce determination to be present for him, revealing her unwavering love even in this tragic moment.", "antonia's surface emotions reflect a deep-seated worry and sorrow as she speaks with a trembling voice. internally", "she grapples with anguish", "the looming specter of loss weighing heavily on her heart", "embodying the dual conflict of needing to act quickly for her husband's wishes while facing the imminent grief of losing him. there is a fierce determination to be present for him", "revealing her unwavering love even in this tragic moment.", "antonia's surface emotions reflect a deep-seated worry and sorrow as she speaks with a trembling voice. internally, she grapples with anguish, the looming specter of loss weighing heavily on her heart, embodying the dual conflict of needing to act quickly for her husband's wishes", "facing the imminent grief of losing him. there is a fierce determination to be present for him, revealing her unwavering love even in this tragic moment."],
        ap.active_plans = ["To fetch their children as Drusus requested, demonstrating her commitment to family in this moment of crisis.", "To provide emotional support to Drusus, ensuring he feels loved and cared for during his final moments.", "To bolster her own emotional strength, preparing herself for the impending loss and the role she will need to play for her family."],
        ap.beliefs = ["Family is paramount, and fulfilling the wishes of loved ones, especially in moments of need, is essential.", "Love and compassion can provide solace in times of despair, strengthening bonds even as they face tragedy.", "The responsibility of caring for her family, especially during dark times, is a defining aspect of her identity."],
        ap.goals = ["Short-term: To bring their children to Drusus's side to fulfill his last wish, ensuring he is surrounded by his loved ones.", "Medium-term: To comfort Drusus in his final moments, making them as peaceful as possible for him.", "Ultimate: To maintain the emotional well-being of her family in the aftermath of Drusus's loss, ensuring they navigate their grief together."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Drusus lies weak and ailing, his body ravaged by gangrene. He struggles to speak, whispering his desire for Antonia to fetch their children. His posture is slumped, reflecting his deteriorated condition, and his voice, though faint, carries an urgent plea.',
        ap.emotional_state = 'Drusus outwardly shows a mix of vulnerability and concern, his whispered words betraying his deep love for his children and his acute awareness of his impending fate. Internally, he harbors a profound sense of dread and sorrow, grappling with the potential loss of his life and the future of his family, especially in the face of Livia\'s manipulations. His comments about Rome\'s severe mother reveal a haunting premonition regarding his family\'s future.',
        ap.emotional_tags = ["drusus outwardly shows a mix of vulnerability", "concern, his whispered words betraying his deep love for his children", "his acute awareness of his impending fate. internally, he harbors a profound sense of dread", "sorrow, grappling with the potential loss of his life", "the future of his family, especially in the face of livia's manipulations. his comments about rome's severe mother reveal a haunting premonition regarding his family's future.", "drusus outwardly shows a mix of vulnerability and concern", "his whispered words betraying his deep love for his children and his acute awareness of his impending fate. internally", "he harbors a profound sense of dread and sorrow", "grappling with the potential loss of his life and the future of his family", "especially in the face of livia's manipulations. his comments about rome's severe mother reveal a haunting premonition regarding his family's future."],
        ap.active_plans = ["To impart his last wishes to Antonia, emphasizing the importance of family even as he faces death.", "To reconcile his feelings regarding Livia's influence and the implications for his children's futures before he passes.", "To ensure that his children are brought to him one last time, highlighting the love and connection to his family amidst his suffering."],
        ap.beliefs = ["Family unity is critical, especially in times of crisis, and he desires to leave his children with a sense of belonging.", "The political machinations surrounding him are dangerous, and he fears for his family's well-being under Livia's influence.", "A strong inheritance of values and love must be passed on to his children, even in the face of his own demise."],
        ap.goals = ["Short-term: To see his children one last time before he dies, ensuring they feel his love.", "Medium-term: To communicate his fears and concerns about their future in Rome, addressing the dangers posed by their family's ambitions.", "Ultimate: To impart a sense of protection and resilience to his children, hoping they can navigate the treacherous landscape of their legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Rufus enters the scene with a purposeful stride, his presence immediately shifting the atmosphere with a sense of military urgency. He addresses Antonia with a brief, respectful nod, acknowledging her presence but quickly conveying the gravity of the situation to her with a few terse words.  His posture is erect and disciplined, reflecting his military training, even in this emotionally charged environment.',
        ap.emotional_state = 'Rufus maintains a stoic demeanor, characteristic of a Roman centurion accustomed to dealing with grim realities.  Beneath the surface of his professional detachment, there\'s a discernible gravity and somberness. He is not outwardly emotional, but his clipped speech and directness convey a deep awareness of the tragic circumstances unfolding around Drusus. He is focused on duty and reporting the facts as they are, suppressing any personal feelings to maintain order and clarity in a crisis.',
        ap.emotional_tags = ["rufus maintains a stoic demeanor, characteristic of a roman centurion accustomed to dealing with grim realities.  beneath the surface of his professional detachment, there's a discernible gravity", "somberness. he is not outwardly emotional, but his clipped speech", "directness convey a deep awareness of the tragic circumstances unfolding around drusus. he is focused on duty", "reporting the facts as they are, suppressing any personal feelings to maintain order", "clarity in a crisis.", "rufus maintains a stoic demeanor", "characteristic of a roman centurion accustomed to dealing with grim realities.  beneath the surface of his professional detachment", "there's a discernible gravity and somberness. he is not outwardly emotional", "but his clipped speech and directness convey a deep awareness of the tragic circumstances unfolding around drusus. he is focused on duty and reporting the facts as they are", "suppressing any personal feelings to maintain order and clarity in a crisis.", "rufus maintains a stoic demeanor, characteristic of a roman centurion accustomed to dealing with grim realities.  beneath the surface of his professional detachment, there's a discernible gravity and somberness. he is not outwardly emotional,", "his clipped speech and directness convey a deep awareness of the tragic circumstances unfolding around drusus. he is focused on duty and reporting the facts as they are, suppressing any personal feelings to maintain order and clarity in a crisis."],
        ap.active_plans = ["Inform Antonia and Tiberius of Drusus's rapidly deteriorating condition.", "Report the factual details of Drusus's illness, focusing on the gangrene.", "Provide information regarding the physician's (Musa's) involvement in Drusus's care.", "Maintain order and a semblance of military protocol amidst the emotional turmoil."],
        ap.beliefs = ["Duty and discipline are paramount, even in the face of death and grief.", "A soldier's role is to deliver difficult truths directly and without embellishment.", "Maintaining order and control is essential, especially in a military setting.", "Respect for rank and authority dictates his interactions, even with grieving family members."],
        ap.goals = ["short-term: To effectively communicate the dire situation to Antonia and Tiberius.", "medium-term: To ensure the military protocols are followed during this crisis.", "ultimate: To uphold the honor and efficiency of the Roman legions in all circumstances, even tragic ones."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Antonia is kneeling beside Drusus, her posture reflecting a mixture of desperate care and profound sorrow. She looks up at Rufus as he enters, her face etched with worry and exhaustion, her eyes pleading for any glimmer of hope or information.  She speaks softly to Rufus about Drusus\'s request, her voice trembling slightly but firm in her resolve to fulfill her husband\'s wishes.',
        ap.emotional_state = 'Antonia is overwhelmed by grief and a palpable sense of impending loss. Her surface emotions are raw and exposed – sorrow, fear, and a deep love for Drusus are evident in her voice and demeanor. Internally, she is likely battling a rising tide of despair and helplessness, yet she is channeling her emotional energy into attending to Drusus\'s needs and final wishes. There is a subtle tension between her outward fragility and her inner strength, as she strives to remain composed for Drusus\'s sake.',
        ap.emotional_tags = ["antonia is overwhelmed by grief", "a palpable sense of impending loss. her surface emotions are raw", "exposed \u2013 sorrow, fear,", "a deep love for drusus are evident in her voice", "demeanor. internally, she is likely battling a rising tide of despair", "helplessness, yet she is channeling her emotional energy into attending to drusus's needs", "final wishes. there is a subtle tension between her outward fragility", "her inner strength, as she strives to remain composed for drusus's sake.", "antonia is overwhelmed by grief and a palpable sense of impending loss. her surface emotions are raw and exposed \u2013 sorrow", "fear", "and a deep love for drusus are evident in her voice and demeanor. internally", "she is likely battling a rising tide of despair and helplessness", "yet she is channeling her emotional energy into attending to drusus's needs and final wishes. there is a subtle tension between her outward fragility and her inner strength", "as she strives to remain composed for drusus's sake."],
        ap.active_plans = ["Communicate Drusus's request to see his children to those around her.", "Seek confirmation about Drusus's condition from Rufus, hoping for any positive update.", "Prepare to bring the children to Drusus's bedside, fulfilling his dying wish.", "Remain composed and supportive for Drusus in his final moments, despite her own overwhelming grief."],
        ap.beliefs = ["Family and fulfilling a husband's last wishes are of utmost importance.", "Compassion and empathy are essential in times of suffering.", "Maintaining a semblance of normalcy and love can provide comfort in the face of death.", "Even in tragedy, small acts of love and devotion hold profound meaning."],
        ap.goals = ["short-term: To immediately fetch the children as per Drusus's request.", "medium-term: To provide comfort and love to Drusus in his final moments, ensuring his last wishes are honored.", "ultimate: To cherish the memory of Drusus and ensure his legacy is honored, while also protecting her children in a world now devoid of their father."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters with an air of suppressed urgency and dread, his movements sharp and controlled as he seeks information. He immediately questions Antonia about Drusus\'s condition, his gaze intense and searching.  His physical presence is commanding, yet there\'s an underlying vulnerability evident in his tightly controlled demeanor, as he struggles to process the unfolding tragedy and the information being relayed to him.',
        ap.emotional_state = 'Tiberius is emotionally charged, his grief and anxiety simmering beneath a veneer of stoicism.  Surface emotions include a raw worry for Drusus and a rising suspicion regarding the circumstances of his brother\'s illness. Internally, he is wrestling with a maelstrom of grief, anger, and a dawning horror.  There\'s a conflict between his desire to maintain composure as a Roman soldier and heir, and the raw, brotherly pain that threatens to overwhelm him.  He is on the verge of losing control, his carefully constructed facade cracking under the weight of impending loss and suspicion.',
        ap.emotional_tags = ["tiberius is emotionally charged, his grief", "anxiety simmering beneath a veneer of stoicism.  surface emotions include a raw worry for drusus", "a rising suspicion regarding the circumstances of his brother's illness. internally, he is wrestling with a maelstrom of grief, anger,", "a dawning horror.  there's a conflict between his desire to maintain composure as a roman soldier", "heir,", "the raw, brotherly pain that threatens to overwhelm him.  he is on the verge of losing control, his carefully constructed facade cracking under the weight of impending loss", "suspicion.", "tiberius is emotionally charged", "his grief and anxiety simmering beneath a veneer of stoicism.  surface emotions include a raw worry for drusus and a rising suspicion regarding the circumstances of his brother's illness. internally", "he is wrestling with a maelstrom of grief", "anger", "and a dawning horror.  there's a conflict between his desire to maintain composure as a roman soldier and heir", "and the raw", "brotherly pain that threatens to overwhelm him.  he is on the verge of losing control", "his carefully constructed facade cracking under the weight of impending loss and suspicion."],
        ap.active_plans = ["Assess the immediate situation and confirm the severity of Drusus's condition.", "Seek information from Rufus regarding the specifics of Drusus's illness and treatment.", "Investigate the circumstances surrounding Drusus's illness, particularly Musa's involvement and the staff surgeon's exclusion.", "Confront Musa directly and demand answers about Drusus's care, driven by suspicion and grief."],
        ap.beliefs = ["Familial bonds and loyalty to his brother are paramount, overriding political considerations.", "Justice and truth are essential, especially when dealing with potential wrongdoing or foul play.", "Military competence and straightforwardness should prevail, contrasting with courtly intrigue and deceit.", "He holds a deep-seated distrust of Livia and her circle, suspecting manipulation and hidden agendas."],
        ap.goals = ["short-term: To ascertain the truth about Drusus's condition and the circumstances of his illness.", "medium-term: To hold those responsible for any negligence or foul play accountable, seeking justice for Drusus.", "ultimate: To mourn Drusus and protect his family, while also navigating the treacherous political landscape and ensuring his brother's death is not in vain, all while battling his own inner demons and the machinations of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands at the forefront of the military encampment, his posture tense as he approaches Drusus’s side. His eyes, filled with desperation, scan Drusus\'s ailing form, and he leans in closely, his voice trembling as he calls out for his brother, reflecting both urgency and fear.',
        ap.emotional_state = 'Tiberius is engulfed in a whirlwind of despair and anxiety; his surface confidence cracks as he struggles to maintain composure in the face of impending loss. Internally, he wrestles with guilt for not having protected Drusus from Livia’s insidious influence, and the looming grief threatens to overwhelm him as he confronts the reality of his brother\'s condition.',
        ap.emotional_tags = ["tiberius is engulfed in a whirlwind of despair", "anxiety; his surface confidence cracks as he struggles to maintain composure in the face of impending loss. internally, he wrestles with guilt for not having protected drusus from livia\u2019s insidious influence,", "the looming grief threatens to overwhelm him as he confronts the reality of his brother's condition.", "tiberius is engulfed in a whirlwind of despair and anxiety; his surface confidence cracks as he struggles to maintain composure in the face of impending loss. internally", "he wrestles with guilt for not having protected drusus from livia\u2019s insidious influence", "and the looming grief threatens to overwhelm him as he confronts the reality of his brother's condition.", "tiberius is engulfed in a whirlwind of despair and anxiety", "his surface confidence cracks as he struggles to maintain composure in the face of impending loss. internally, he wrestles with guilt for not having protected drusus from livia\u2019s insidious influence, and the looming grief threatens to overwhelm him as he confronts the reality of his brother's condition."],
        ap.active_plans = ["To understand the severity of Drusus's condition and seek immediate medical assistance.", "To confront Musa about his failure to save Drusus and to demand accountability.", "To rally his emotions and find a way to comfort Drusus, attempting to bridge the gap left by their strained relationship."],
        ap.beliefs = ["Protecting family is paramount, even at the cost of personal safety.", "The medical staff should be trusted to preserve life, a belief that is shattered with Musa's arrival.", "The loyalty of family is tested in times of crisis, and betrayal can come from the most unexpected of places."],
        ap.goals = ["Short-term: To retrieve accurate information regarding Drusus's condition and ensure he is not lost.", "Medium-term: To confront Livia and seek justice for Drusus\u2019s deterioration.", "Ultimate: To secure the safety and unity of his family amidst the chaos of political intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Rufus stands rigidly at attention, his demeanor one of stoic authority as he delivers the grim diagnosis of gangrene to Tiberius. He maintains a clinical distance, revealing the harsh reality of Drusus’s condition with a somber expression that conveys the weight of responsibility he bears as a Centurion.',
        ap.emotional_state = 'Rufus outwardly appears unflappable, embodying the discipline and pragmatism of a soldier. However, internally, he grapples with the heavy burden of bearing such dire news, feeling the weight of duty to the legions and the personal loss that accompanies the decline of a beloved brother-in-arms.',
        ap.emotional_tags = ["rufus outwardly appears unflappable, embodying the discipline", "pragmatism of a soldier. however, internally, he grapples with the heavy burden of bearing such dire news, feeling the weight of duty to the legions", "the personal loss that accompanies the decline of a beloved brother-in-arms.", "rufus outwardly appears unflappable", "embodying the discipline and pragmatism of a soldier. however", "internally", "he grapples with the heavy burden of bearing such dire news", "feeling the weight of duty to the legions and the personal loss that accompanies the decline of a beloved brother-in-arms."],
        ap.active_plans = ["To communicate Drusus\u2019s critical condition with clarity and transparency.", "To remain composed and provide Tiberius with the necessary information to assess the situation.", "To maintain order within the encampment amidst the emotional turmoil."],
        ap.beliefs = ["Duty to the legion comes before personal feelings, and emotional detachment is necessary in crisis.", "Veterans deserve respect and care, and he is determined to convey the truth, no matter how painful.", "The chain of command must be upheld, and all medical decisions should fall under the purview of those deemed appropriate."],
        ap.goals = ["Short-term: To relay the medical assessment of Drusus to Tiberius as accurately as possible.", "Medium-term: To ensure that the encampment remains stable and orderly in the face of distress.", "Ultimate: To uphold the honor of the military and support his comrades, ensuring their legacy endures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Musa enters the scene with a calculated demeanor, his movements smooth and measured as he approaches Tiberius. He presents himself as a physician, but there is an air of tension surrounding him as Tiberius’s hostility is palpable. Musa attempts to explain Drusus\'s condition, but his words are met with anger.',
        ap.emotional_state = 'Musa maintains an outward calm, but internally, he feels the pressure of the situation. He recognizes the unease and suspicion directed at him by Tiberius and understands that he is a target of blame, which breeds anxiety. His motivations are obscured, and he is aware of the precariousness of his position in Livia\'s game.',
        ap.emotional_tags = ["musa maintains an outward calm, but internally, he feels the pressure of the situation. he recognizes the unease", "suspicion directed at him by tiberius", "understands that he is a target of blame, which breeds anxiety. his motivations are obscured,", "he is aware of the precariousness of his position in livia's game.", "musa maintains an outward calm", "but internally", "he feels the pressure of the situation. he recognizes the unease and suspicion directed at him by tiberius and understands that he is a target of blame", "which breeds anxiety. his motivations are obscured", "and he is aware of the precariousness of his position in livia's game.", "musa maintains an outward calm,", "internally, he feels the pressure of the situation. he recognizes the unease and suspicion directed at him by tiberius and understands that he is a target of blame, which breeds anxiety. his motivations are obscured, and he is aware of the precariousness of his position in livia's game."],
        ap.active_plans = ["To minimize blame for Drusus's condition and deflect Tiberius's anger.", "To assert his role in the situation and offer a medical explanation that absolves him of personal fault.", "To navigate the political tension and maintain favor with Livia while managing the crisis."],
        ap.beliefs = ["The physician's duty is to heal, yet he understands the political ramifications of his actions.", "Survival in a hostile environment requires strategic communication and manipulation.", "His loyalty to Livia supersedes his allegiance to individual patients within the political landscape."],
        ap.goals = ["Short-term: To deliver a credible explanation for Drusus's condition that justifies his involvement.", "Medium-term: To protect his own position and ensure that Livia's influence remains intact.", "Ultimate: To navigate the treacherous waters of court politics while preserving his own life and career."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius bursts into the military encampment, a whirlwind of urgent concern. He immediately seeks information from Rufus about Drusus\'s condition and the attending physicians. Upon Musa\'s arrival, Tiberius\'s grief and suspicion erupt into violent action as he physically throws Livia\'s physician out of the tent, his control snapping under the weight of his brother\'s suffering and the palpable sense of foul play. He then kneels beside Drusus, desperately trying to connect with his dying brother.',
        ap.emotional_state = 'Tiberius is consumed by a volatile mix of grief, rage, and suspicion. Outwardly, his fury is directed at Musa, a manifestation of his deeper anxieties and powerlessness. Beneath this anger, profound sorrow for Drusus overwhelms him, intertwined with a growing dread about his mother\'s potential involvement in Drusus\'s fate. He is internally conflicted, torn between his love for his brother and his ingrained distrust of Livia, battling to maintain composure amidst the escalating tragedy and his dawning realization of betrayal.',
        ap.emotional_tags = ["tiberius is consumed by a volatile mix of grief, rage,", "suspicion. outwardly, his fury is directed at musa, a manifestation of his deeper anxieties", "powerlessness. beneath this anger, profound sorrow for drusus overwhelms him, intertwined with a growing dread about his mother's potential involvement in drusus's fate. he is internally conflicted, torn between his love for his brother", "his ingrained distrust of livia, battling to maintain composure amidst the escalating tragedy", "his dawning realization of betrayal.", "tiberius is consumed by a volatile mix of grief", "rage", "and suspicion. outwardly", "his fury is directed at musa", "a manifestation of his deeper anxieties and powerlessness. beneath this anger", "profound sorrow for drusus overwhelms him", "intertwined with a growing dread about his mother's potential involvement in drusus's fate. he is internally conflicted", "torn between his love for his brother and his ingrained distrust of livia", "battling to maintain composure amidst the escalating tragedy and his dawning realization of betrayal."],
        ap.active_plans = ["Demand answers about Drusus's worsening condition and the change in medical staff.", "Confront Musa directly about his competency and sudden appearance.", "Desperately reach out to Drusus in his final moments, seeking connection and understanding before it's too late."],
        ap.beliefs = ["Family bonds, especially brotherhood, are paramount and must be protected.", "His mother, Livia, is manipulative and capable of ruthless actions to achieve her goals.", "Honesty and directness are crucial, especially in dire situations, contrasting with the courtly deceit he despises."],
        ap.goals = ["Short-term: To understand the immediate circumstances of Drusus's decline and Musa's role.", "Medium-term: To provide comfort and solace to Drusus in his final moments and hear his last words.", "Ultimate: To uncover the truth behind Drusus's illness and hold those responsible accountable, even if it means confronting his own mother and the dangerous dynamics of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Drusus lies weakened and dying in the military encampment, his body ravaged by gangrene. He is barely able to speak, his voice reduced to faint whispers as death closes in. Despite his physical deterioration, he manages to focus on Tiberius, responding to his brother\'s presence and conveying a crucial, albeit cryptic, message. He is physically immobile, confined to his deathbed, his actions limited to weak speech and fading breaths.',
        ap.emotional_state = 'Drusus is resigned to death but carries a heavy burden of concern for his family and the future of Rome. Though physically weak, his mind remains sharp, focused on conveying a vital warning. He is deeply worried about Livia\'s influence and the danger she poses to his sons and the dynasty, expressing this through his haunting premonitions. Despite his impending demise, he displays a stoic resolve, prioritizing the communication of his fears to Tiberius over his own pain or despair, embodying a tragic acceptance of his fate and a final act of brotherly concern.',
        ap.emotional_tags = ["drusus is resigned to death but carries a heavy burden of concern for his family", "the future of rome. though physically weak, his mind remains sharp, focused on conveying a vital warning. he is deeply worried about livia's influence", "the danger she poses to his sons", "the dynasty, expressing this through his haunting premonitions. despite his impending demise, he displays a stoic resolve, prioritizing the communication of his fears to tiberius over his own pain or despair, embodying a tragic acceptance of his fate", "a final act of brotherly concern.", "drusus is resigned to death but carries a heavy burden of concern for his family and the future of rome. though physically weak", "his mind remains sharp", "focused on conveying a vital warning. he is deeply worried about livia's influence and the danger she poses to his sons and the dynasty", "expressing this through his haunting premonitions. despite his impending demise", "he displays a stoic resolve", "prioritizing the communication of his fears to tiberius over his own pain or despair", "embodying a tragic acceptance of his fate and a final act of brotherly concern.", "drusus is resigned to death", "carries a heavy burden of concern for his family and the future of rome. though physically weak, his mind remains sharp, focused on conveying a vital warning. he is deeply worried about livia's influence and the danger she poses to his sons and the dynasty, expressing this through his haunting premonitions. despite his impending demise, he displays a stoic resolve, prioritizing the communication of his fears to tiberius over his own pain or despair, embodying a tragic acceptance of his fate and a final act of brotherly concern."],
        ap.active_plans = ["Convey his final warning to Tiberius regarding Livia's dangerous influence.", "Reference the intercepted letter to highlight the treachery within the family.", "Express his deep-seated fear for his sons, Gauis and Lucius, and their future under Livia's rule."],
        ap.beliefs = ["Livia is a 'severe mother' to Rome and a 'cruel stepmother' to his nephews, posing a significant threat to the dynasty's future.", "The intercepted letter is a key piece of evidence in understanding the political machinations against him.", "The stability and integrity of Rome are gravely endangered by the current familial power dynamics and Livia's ambition."],
        ap.goals = ["Short-term: To communicate his dying prophecy and warning to Tiberius before he dies.", "Medium-term: To ensure Tiberius understands the gravity of Livia's threat and the implications for the family and Rome.", "Ultimate: To safeguard the future of his children and the Roman dynasty, even though he knows he will not live to see it, leaving a legacy of warning and concern."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Antonia kneels beside her ailing husband Drusus, holding their infant son Claudius in her arms. She exhibits a sense of urgency and care, desperately trying to fulfill Drusus\'s final wish.',
        ap.emotional_state = 'Antonia\'s heart is heavy with grief as she grapples with the impending loss of Drusus. Her voice is laced with both tenderness and despair, reflecting the emotional toll of the moment as she realizes that Drusus did not wait for their child.',
        ap.emotional_tags = ["antonia's heart is heavy with grief as she grapples with the impending loss of drusus. her voice is laced with both tenderness", "despair, reflecting the emotional toll of the moment as she realizes that drusus did not wait for their child.", "antonia's heart is heavy with grief as she grapples with the impending loss of drusus. her voice is laced with both tenderness and despair", "reflecting the emotional toll of the moment as she realizes that drusus did not wait for their child."],
        ap.active_plans = ["To bring Claudius to Drusus as a final gesture of familial love.", "To reassure Drusus in his final moments and provide him with some comfort.", "To navigate her own grief while remaining a pillar of strength for her family."],
        ap.beliefs = ["Family bonds are paramount, and fulfilling Drusus's last wish is her duty.", "Life must continue even amidst profound despair, as symbolized by the arrival of Claudius.", "Love and compassion can provide solace in the darkest moments."],
        ap.goals = ["Short-term: To bring Claudius to Drusus before he passes.", "Medium-term: To support her family through the grief of losing Drusus.", "Ultimate: To ensure that Claudius grows up knowing the love of both parents, despite the tragedy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Claudius, a helpless infant, is cradled in Antonia\'s arms as she enters the scene. His presence symbolizes innocence and hope amidst the chaos of impending loss.',
        ap.emotional_state = 'While Claudius cannot comprehend the gravity of the situation, his cries echo the anguish surrounding him, a poignant reminder of life in the face of death. His vulnerability accentuates the emotional weight of the moment.',
        ap.emotional_tags = ["while claudius cannot comprehend the gravity of the situation", "his cries echo the anguish surrounding him", "a poignant reminder of life in the face of death. his vulnerability accentuates the emotional weight of the moment."],
        ap.active_plans = ["To exist as a symbol of hope and continuity for his family.", "To elicit emotional responses from the adults around him, binding them in shared grief and love.", "To serve as a living legacy of Drusus's and Antonia's love."],
        ap.beliefs = ["Innocence and purity can exist even in the darkest circumstances.", "The bonds of family endure through love and sacrifice.", "Life, represented by his presence, intersects with the death and loss unfolding around him."],
        ap.goals = ["Short-term: To be held by Antonia, providing her comfort and a sense of purpose.", "Medium-term: To grow up surrounded by the memory and love of his family.", "Ultimate: To become a resilient figure in the face of familial tragedy and political turmoil."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands alone amidst the towering scrolls and cluttered furnishings of his study, his physical frailty emphasized by the intensity of his inner turmoil.  He paces slowly, almost as if measuring the weight of his words against the silence of the room. His voice, though tinged with his characteristic stammer, resonates with a newfound conviction as he speaks his thoughts aloud, gesturing slightly with a trembling hand as he articulates his accusation.',
        ap.emotional_state = 'A seed of suspicion, long planted in the fertile ground of Claudius’s mind, has now sprouted into a firm conviction. Outwardly, he maintains a semblance of his usual detached demeanor, yet beneath the surface, a profound unease churns. There\'s a flicker of intellectual excitement mixed with a chilling dread as he confronts the implications of his own pronouncements.  He is moving past passive observation into active, albeit solitary, accusation, driven by a growing certainty that the truth is being deliberately obscured.',
        ap.emotional_tags = ["a seed of suspicion", "long planted in the fertile ground of claudius\u2019s mind", "has now sprouted into a firm conviction. outwardly", "he maintains a semblance of his usual detached demeanor", "yet beneath the surface", "a profound unease churns. there's a flicker of intellectual excitement mixed with a chilling dread as he confronts the implications of his own pronouncements.  he is moving past passive observation into active", "albeit solitary", "accusation", "driven by a growing certainty that the truth is being deliberately obscured."],
        ap.active_plans = ["To articulate his suspicions regarding Drusus's death verbally, giving form to his internal doubts.", "To firmly reject the official narrative of an accidental death, solidifying his belief in foul play or gross negligence.", "To begin mentally formulating a pathway to uncover the true circumstances surrounding his father\u2019s demise, even if initially confined to his own thoughts."],
        ap.beliefs = ["He believes deeply in the power of observation and intellectual deduction, trusting his own mind to discern truth from falsehood.", "He holds a growing conviction that the official accounts of events within his family are often deliberately misleading and designed to conceal darker realities.", "He is starting to believe that incompetence alone cannot explain the inconsistencies surrounding Drusus's death, leaning towards the possibility of intentional malice or conspiracy."],
        ap.goals = ["Short-term Goal: To voice his suspicion aloud, breaking the silence of his doubt and transforming it into a tangible accusation.", "Medium-term Goal: To meticulously examine the details surrounding Drusus\u2019s death, seeking inconsistencies and hidden truths that contradict the official story.", "Ultimate Goal: To understand the true nature of the forces at play within his family, and to determine if his father's death was indeed a result of treachery, potentially safeguarding himself and his future from similar fates."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_food_in_dishes_event_14_2'})
    ON CREATE SET
        oi.description = 'The food in dishes is presented by the Servant as Claudius\'s prepared meal, intended to be nourishing and palatable. The Servant meticulously tastes it, offering details about the garlic content, aiming to assure Claudius of its quality and safety, thus attempting to establish a mundane, normal interaction. However, this very act of tasting, designed to reassure, ironically becomes a focal point for Claudius\'s paranoia, reinforcing his suspicion that the food might be poisoned, transforming the meal into a symbol of potential treachery.',
        oi.status_before = 'The food is freshly prepared by the cook, arranged on dishes, and brought into Claudius\'s private dining room, ready to be served as his meal. It is assumed to be wholesome and intended for consumption, presented as a routine part of Claudius\'s day.',
        oi.status_after = 'The food remains largely uneaten and rejected by Claudius. Deemed suspect and potentially poisoned in his paranoid mind, it loses its intended purpose as nourishment. It becomes a symbol of Claudius\'s anxieties and his rejection of normalcy, left on the table or removed by the Servant, uneaten and representing a failed attempt at routine.'
    WITH oi
    MATCH (o:Object {uuid: 'object_food_in_dishes'})
    MATCH (e:Event {uuid: 'event_14_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_wine_in_goblet_event_14_2'})
    ON CREATE SET
        oi.description = 'The wine, described as a northern vintage with specific characteristics due to a past bad summer, is poured into Claudius\'s goblet by the Servant.  Similar to the food, the Servant tastes the wine, offering connoisseurship details about its age and origin, attempting to create an atmosphere of normalcy and pleasant routine.  The wine, however, becomes another object of Claudius\'s suspicion, mirroring the food in being a potential vehicle for poison in his paranoid perception, and contributing to his rejection of the meal and the Servant\'s attempts at normalcy.',
        oi.status_before = 'The wine is stored, ready for serving, and characterized by its vintage and origin, indicating a certain level of quality and intended for Claudius\'s consumption with his meal. It exists as a normal part of a Roman dining experience, possessing a specific history and character.',
        oi.status_after = 'The wine is poured into Claudius\'s goblet and tasted by the Servant, but ultimately remains undrunk by Claudius himself. Like the food, it is rejected due to Claudius\'s paranoia, failing to fulfill its intended purpose of accompaniment to the meal and instead becoming another symbol of his distrust and isolation within his perceived dangerous environment.'
    WITH oi
    MATCH (o:Object {uuid: 'object_wine_in_goblet'})
    MATCH (e:Event {uuid: 'event_14_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Claudius, seated at a cluttered table, is physically frail yet maintains an air of sharpness as he engages in conversation with the Servant. His movements are deliberate, reflecting his state of mind, while he gestures towards the dishes on the table, expressing his disdain for their quality and hinting at his fears of poisoning.',
        ap.emotional_state = 'Claudius is enveloped in a heavy fog of grief and paranoia, his surface calm betraying a deeper turmoil. He is outwardly assertive, voicing his belief that his father\'s death was preventable, yet beneath this bravado lies a churning anxiety about those around him, particularly his wife. His words reveal a growing mistrust that colors his interactions.',
        ap.emotional_tags = ["claudius is enveloped in a heavy fog of grief", "paranoia, his surface calm betraying a deeper turmoil. he is outwardly assertive, voicing his belief that his father's death was preventable, yet beneath this bravado lies a churning anxiety about those around him, particularly his wife. his words reveal a growing mistrust that colors his interactions.", "claudius is enveloped in a heavy fog of grief and paranoia", "his surface calm betraying a deeper turmoil. he is outwardly assertive", "voicing his belief that his father's death was preventable", "yet beneath this bravado lies a churning anxiety about those around him", "particularly his wife. his words reveal a growing mistrust that colors his interactions."],
        ap.active_plans = ["To express his grief regarding his father's death and seek affirmation of its preventability.", "To investigate the loyalty of those around him, particularly the Servant, whom he suspects of collusion.", "To continue his historical writings as a means of processing his feelings and preserving his family's legacy."],
        ap.beliefs = ["He believes that negligence and betrayal led to his father's untimely death.", "He holds a deep-seated conviction that his safety is compromised by those closest to him.", "He thinks that expressing his paranoia may unveil hidden loyalties and protect him from potential threats."],
        ap.goals = ["Short-term: To have a meal that feels satisfactory amidst his fears of poisoning.", "Medium-term: To ascertain the loyalty of his household and protect himself from perceived threats.", "Ultimate: To document his family's history while ensuring that their legacy is preserved despite the treachery surrounding him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_2'})
    ON CREATE SET
        ap.current_status = 'The Servant enters the private dining room with a practiced knock, approaching Claudius with a tray laden with dishes. He meticulously tastes both the food and wine, offering commentary on their quality and origin. Throughout, he maintains a deferential posture, hovering attentively as he attempts to serve Claudius, his movements precise and economical within the cluttered space.',
        ap.emotional_state = 'On the surface, the Servant projects an air of calm professionalism and obsequious politeness, maintaining a neutral tone as he engages Claudius in mundane conversation about the meal. Internally, he likely experiences a blend of weary resignation and subtle amusement at Claudius\'s predictable paranoia. There\'s a practiced detachment in his demeanor, suggesting a long-standing familiarity with Claudius\'s eccentricities and a desire to simply fulfill his duties without personal investment.',
        ap.emotional_tags = ["on the surface, the servant projects an air of calm professionalism", "obsequious politeness, maintaining a neutral tone as he engages claudius in mundane conversation about the meal. internally, he likely experiences a blend of weary resignation", "subtle amusement at claudius's predictable paranoia. there's a practiced detachment in his demeanor, suggesting a long-standing familiarity with claudius's eccentricities", "a desire to simply fulfill his duties without personal investment.", "on the surface", "the servant projects an air of calm professionalism and obsequious politeness", "maintaining a neutral tone as he engages claudius in mundane conversation about the meal. internally", "he likely experiences a blend of weary resignation and subtle amusement at claudius's predictable paranoia. there's a practiced detachment in his demeanor", "suggesting a long-standing familiarity with claudius's eccentricities and a desire to simply fulfill his duties without personal investment."],
        ap.active_plans = ["To announce and serve Claudius's meal as per his routine duties.", "To maintain a semblance of normalcy and routine in Claudius's environment.", "To subtly deflect Claudius's paranoid accusations with lighthearted dismissal and trivial conversation."],
        ap.beliefs = ["Maintaining a calm and predictable routine is the best way to manage Claudius's volatile moods.", "Claudius's paranoia is likely exaggerated and not based in genuine threat.", "His role is to serve and attend to Claudius's needs, regardless of his eccentricities."],
        ap.goals = ["Short-term: Successfully serve the meal and wine, fulfilling his immediate task.", "Medium-term: Complete his service without incident or drawing Claudius's ire.", "Ultimate: Maintain his position within the imperial household by efficiently managing his duties and navigating the complexities of Claudius's personality."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Old Claudius sits hunched at his dining table, surrounded by scrolls and half-eaten food, his frail body contrasting with the sharpness of his mind. He engages with the Servant in a detached, almost performative manner, testing the food and wine only symbolically. His gestures are abrupt and dismissive as he waves away the meal and focuses on his historical writing, his physical presence in the room diminished by his preoccupation with internal anxieties.',
        ap.emotional_state = 'Claudius outwardly projects irritability and deep-seated paranoia, his voice laced with cynicism as he accuses his wife and stepson of plotting to poison him. Beneath this surface agitation lies a profound anxiety and fear of betrayal, fueled by genuine suspicion and a lifetime of court intrigue. There\'s a palpable tension between his intellectual sharpness and his emotional fragility, as he uses his history writing as a coping mechanism to control his narrative amidst his perceived vulnerability.',
        ap.emotional_tags = ["claudius outwardly projects irritability", "deep-seated paranoia, his voice laced with cynicism as he accuses his wife", "stepson of plotting to poison him. beneath this surface agitation lies a profound anxiety", "fear of betrayal, fueled by genuine suspicion", "a lifetime of court intrigue. there's a palpable tension between his intellectual sharpness", "his emotional fragility, as he uses his history writing as a coping mechanism to control his narrative amidst his perceived vulnerability.", "claudius outwardly projects irritability and deep-seated paranoia", "his voice laced with cynicism as he accuses his wife and stepson of plotting to poison him. beneath this surface agitation lies a profound anxiety and fear of betrayal", "fueled by genuine suspicion and a lifetime of court intrigue. there's a palpable tension between his intellectual sharpness and his emotional fragility", "as he uses his history writing as a coping mechanism to control his narrative amidst his perceived vulnerability."],
        ap.active_plans = ["To verbally express his paranoia and suspicions about being poisoned to the Servant.", "To assert his intellectual superiority and dismiss the Servant's attempts at normalcy.", "To retreat further into his historical work, using it as an escape and a means of asserting control in a world he perceives as threatening."],
        ap.beliefs = ["His wife and her son are actively plotting against him and seek his death.", "Servants are untrustworthy and potentially complicit in plots against him.", "Writing history, particularly that of his family, is a way to understand and control his legacy and the narrative surrounding his life and death."],
        ap.goals = ["Short-term: To reject the meal and dismiss the Servant, reinforcing his sense of control and isolation.", "Medium-term: To uncover evidence of plots against him, validating his paranoia and justifying his suspicions.", "Ultimate: To secure his place in history through his writings and to survive the perceived threats to his life, ensuring his narrative endures beyond his mortality."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Old Claudius sits at a modest dining table, frail yet alert, surrounded by a clutter of half-eaten food and wine, attempting to engage the Servant in conversation, his posture revealing tension and suspicion as he speaks forcefully about betrayal.',
        ap.emotional_state = 'Claudius exhibits a deep-seated paranoia, driven by fears of betrayal from those closest to him. His outward expression is sharp and accusative, masking an internal turmoil of vulnerability and grief, especially regarding his father’s death. He grapples with feelings of isolation and the heavy burden of suspicion.',
        ap.emotional_tags = ["claudius exhibits a deep-seated paranoia, driven by fears of betrayal from those closest to him. his outward expression is sharp", "accusative, masking an internal turmoil of vulnerability", "grief, especially regarding his father\u2019s death. he grapples with feelings of isolation", "the heavy burden of suspicion.", "claudius exhibits a deep-seated paranoia", "driven by fears of betrayal from those closest to him. his outward expression is sharp and accusative", "masking an internal turmoil of vulnerability and grief", "especially regarding his father\u2019s death. he grapples with feelings of isolation and the heavy burden of suspicion."],
        ap.active_plans = ["To confront the Servant about his suspicions of poisoning.", "To assert his authority as Caesar despite his physical frailty.", "To express his vulnerability while simultaneously seeking reassurance of loyalty."],
        ap.beliefs = ["That betrayal lurks behind every corner, especially from family.", "That his position as Caesar makes him a target for conspiracy.", "That his intellect and writing can preserve his legacy despite physical decline."],
        ap.goals = ["Short-term: To eat his meal without fear of poison.", "Medium-term: To complete his family history in order to secure his legacy.", "Ultimate: To ensure his safety and maintain his authority amidst perceived threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_3'})
    ON CREATE SET
        ap.current_status = 'The Servant hovers near Claudius, displaying a mixture of obsequiousness and familiarity as he tastes the food and wine, trying to maintain a light atmosphere while responding to Claudius’s increasingly paranoid remarks.',
        ap.emotional_state = 'The Servant appears calm and somewhat dismissive of Claudius\'s fears, masking any deeper concerns under a veneer of politeness. His surface demeanor suggests a desire to placate the Emperor while internally grappling with the absurdity of Claudius\'s accusations, revealing a conflict between loyalty and personal judgment.',
        ap.emotional_tags = ["the servant appears calm", "somewhat dismissive of claudius's fears, masking any deeper concerns under a veneer of politeness. his surface demeanor suggests a desire to placate the emperor while internally grappling with the absurdity of claudius's accusations, revealing a conflict between loyalty", "personal judgment.", "the servant appears calm and somewhat dismissive of claudius's fears", "masking any deeper concerns under a veneer of politeness. his surface demeanor suggests a desire to placate the emperor while internally grappling with the absurdity of claudius's accusations", "revealing a conflict between loyalty and personal judgment.", "the servant appears calm and somewhat dismissive of claudius's fears, masking any deeper concerns under a veneer of politeness. his surface demeanor suggests a desire to placate the emperor", "internally grappling with the absurdity of claudius's accusations, revealing a conflict between loyalty and personal judgment."],
        ap.active_plans = ["To serve the meal and ensure Claudius's satisfaction.", "To downplay Claudius's paranoid accusations and maintain his composure.", "To subtly imply that the real threat may come from the cook, diverting attention from himself."],
        ap.beliefs = ["That loyalty to the Emperor is paramount, even amidst irrational fears.", "That his knowledge of food and wine gives him a position of importance in the household.", "That he can navigate the complexities of court life by maintaining a facade of servitude."],
        ap.goals = ["Short-term: To fulfill his duties without inciting Claudius's paranoia.", "Medium-term: To gain Claudius's trust by offering good service.", "Ultimate: To maintain his position within the household and avoid entanglements in court intrigues."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Elderly Claudius sits alone in his dimly lit private dining room, the remnants of a meal before him, though untouched. He has just dismissed his servant, and now, in the solitude punctuated by flickering candlelight, his thoughts drift to the past. He is physically still, but his mind is actively engaged, sifting through memories and historical accounts, preparing to voice his reflections on a long-ago tragedy.',
        ap.emotional_state = 'Claudius is enveloped in a somber mood, his voiceover heavy with a sense of lingering grief and historical weight. The death of his father, Drusus, remains a palpable presence in his mind, a wound that time has not fully healed. Beneath the surface of his historical reflection lies a deep personal sorrow, tinged with a sense of loss not just for his father, but for a Rome that might have been, and a family forever altered by this tragedy. There\'s a quiet resignation in his tone, a melancholic acceptance of the past\'s enduring shadow.',
        ap.emotional_tags = ["claudius is enveloped in a somber mood, his voiceover heavy with a sense of lingering grief", "historical weight. the death of his father, drusus, remains a palpable presence in his mind, a wound that time has not fully healed. beneath the surface of his historical reflection lies a deep personal sorrow, tinged with a sense of loss not just for his father, but for a rome that might have been,", "a family forever altered by this tragedy. there's a quiet resignation in his tone, a melancholic acceptance of the past's enduring shadow.", "claudius is enveloped in a somber mood", "his voiceover heavy with a sense of lingering grief and historical weight. the death of his father", "drusus", "remains a palpable presence in his mind", "a wound that time has not fully healed. beneath the surface of his historical reflection lies a deep personal sorrow", "tinged with a sense of loss not just for his father", "but for a rome that might have been", "and a family forever altered by this tragedy. there's a quiet resignation in his tone", "a melancholic acceptance of the past's enduring shadow.", "claudius is enveloped in a somber mood, his voiceover heavy with a sense of lingering grief and historical weight. the death of his father, drusus, remains a palpable presence in his mind, a wound that time has not fully healed. beneath the surface of his historical reflection lies a deep personal sorrow, tinged with a sense of loss not just for his father,", "for a rome that might have been, and a family forever altered by this tragedy. there's a quiet resignation in his tone, a melancholic acceptance of the past's enduring shadow."],
        ap.active_plans = ["To articulate his reflections on his father's death through voiceover, emphasizing its impact.", "To contextualize his personal grief within the broader narrative of Roman history and his family's saga.", "To use this reflection as a pivotal point in his historical work, marking a significant turning point in his family's trajectory."],
        ap.beliefs = ["His father, Drusus, was a noble and important figure whose loss was deeply felt by Rome.", "The death of his father had a profound and lasting impact on his uncle, Tiberius, changing him irrevocably.", "Personal tragedies within his family have far-reaching consequences, shaping the course of Roman history and the dynasty's future."],
        ap.goals = ["short_term\": \"To express the immediate sorrow and significance of his father's death in his current narration.", "medium_term\": \"To accurately and emotionally capture the impact of Drusus's death within his historical account of his family.", "ultimate\": \"To understand and convey the long-term ramifications of his father's death on his family and the Roman Empire, ensuring history remembers the true weight of this loss."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Augustus walks slowly through the moonlit garden, leaning on Livia for support. His gait is slow and weary; his posture reflects the weight of a heavy heart, and he momentarily gazes into the distance as memories of Drusus weigh on him. He gestures expressively as he speaks of the need for music to soothe his tired mind.',
        ap.emotional_state = 'Augustus carries a deep sense of melancholy and exhaustion, evident in his tone and eyes. He outwardly tries to maintain composure, but the sadness over Drusus’s loss lurks just beneath the surface, revealing his internal struggle with grief and the burdens of leadership. He grapples with an unspoken fear of the future and the legacy he leaves behind.',
        ap.emotional_tags = ["augustus carries a deep sense of melancholy", "exhaustion, evident in his tone", "eyes. he outwardly tries to maintain composure, but the sadness over drusus\u2019s loss lurks just beneath the surface, revealing his internal struggle with grief", "the burdens of leadership. he grapples with an unspoken fear of the future", "the legacy he leaves behind.", "augustus carries a deep sense of melancholy and exhaustion", "evident in his tone and eyes. he outwardly tries to maintain composure", "but the sadness over drusus\u2019s loss lurks just beneath the surface", "revealing his internal struggle with grief and the burdens of leadership. he grapples with an unspoken fear of the future and the legacy he leaves behind.", "augustus carries a deep sense of melancholy and exhaustion, evident in his tone and eyes. he outwardly tries to maintain composure,", "the sadness over drusus\u2019s loss lurks just beneath the surface, revealing his internal struggle with grief and the burdens of leadership. he grapples with an unspoken fear of the future and the legacy he leaves behind."],
        ap.active_plans = ["Seek solace through music, attempting to distract himself from the grief of Drusus's loss.", "Encourage Livia and the boys to rest, portraying a facade of control amidst personal turmoil.", "Reflect on his legacy and the virtues he hopes to instill in his grandsons, Lucius and Gaius."],
        ap.beliefs = ["Grief must be managed and not openly expressed, in line with Roman ideals of stoicism.", "The empire's strength relies on the virtues of its future leaders, including his grandsons.", "Leadership requires a balance between personal feelings and public duties, often prioritizing the latter."],
        ap.goals = ["Short-term: Ensure the family retires for the night, promoting rest after a long evening.", "Medium-term: Cultivate Lucius and Gaius into noble leaders who embody Roman virtues.", "Ultimate: Maintain stability and power in Rome while managing personal grief and familial expectations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands close to Augustus, providing both physical support and a quiet, watchful presence. Her posture is regal, embodying both strength and subtle authority, as she listens intently to Augustus\'s reflections. There is an air of calculated concern as she observes the interaction between Augustus and the boys, her eyes flickering with unspoken thoughts.',
        ap.emotional_state = 'Livia\'s emotional state is a blend of concern and calculated detachment. While she feigns sympathy for Augustus\'s grief, her internal motivations are more complex, as she weighs the implications of Drusus\'s death on her plans. Her demeanor is poised, masking any discord beneath a veneer of support, revealing the cunning nature that drives her ambitions.',
        ap.emotional_tags = ["livia's emotional state is a blend of concern", "calculated detachment. while she feigns sympathy for augustus's grief, her internal motivations are more complex, as she weighs the implications of drusus's death on her plans. her demeanor is poised, masking any discord beneath a veneer of support, revealing the cunning nature that drives her ambitions.", "livia's emotional state is a blend of concern and calculated detachment. while she feigns sympathy for augustus's grief", "her internal motivations are more complex", "as she weighs the implications of drusus's death on her plans. her demeanor is poised", "masking any discord beneath a veneer of support", "revealing the cunning nature that drives her ambitions."],
        ap.active_plans = ["Reinforce Augustus's emotional state to maintain his focus on stability and legacy.", "Monitor the responses of Lucius and Gaius to gauge their readiness for future leadership roles.", "Subtly steer the conversation to ensure Augustus remains aligned with her ambitions for Tiberius."],
        ap.beliefs = ["Control of emotions is essential, especially in public displays of grief.", "The future of the empire rests on the strategic grooming of her son, Tiberius, and his cousins.", "Strength lies in both emotional manipulation and the ability to maintain a facade of support."],
        ap.goals = ["Short-term: Ensure Augustus feels supported, strengthening her position as his confidante.", "Medium-term: Influence the upbringing and perspectives of Lucius and Gaius to align with her ambitions.", "Ultimate: Secure Tiberius's ascension to the throne, using her influence over Augustus and the younger generation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Lucius walks closely behind Augustus and Livia, his youthful energy contrasting with the somber atmosphere. He looks eager to please, glancing at Augustus with admiration. His movements are animated, reflecting the innocence of youth, as he absorbs the interactions around him.',
        ap.emotional_state = 'Lucius appears enthusiastic yet somewhat confused by the heavy mood surrounding him. His youthful exuberance struggles against the somber reflection of death in the garden. He displays a desire to engage and comfort but lacks the understanding of the weight of the moment, embodying the innocence of youth amidst tragedy.',
        ap.emotional_tags = ["lucius appears enthusiastic yet somewhat confused by the heavy mood surrounding him. his youthful exuberance struggles against the somber reflection of death in the garden. he displays a desire to engage", "comfort but lacks the understanding of the weight of the moment, embodying the innocence of youth amidst tragedy.", "lucius appears enthusiastic yet somewhat confused by the heavy mood surrounding him. his youthful exuberance struggles against the somber reflection of death in the garden. he displays a desire to engage and comfort but lacks the understanding of the weight of the moment", "embodying the innocence of youth amidst tragedy.", "lucius appears enthusiastic yet somewhat confused by the heavy mood surrounding him. his youthful exuberance struggles against the somber reflection of death in the garden. he displays a desire to engage and comfort", "lacks the understanding of the weight of the moment, embodying the innocence of youth amidst tragedy."],
        ap.active_plans = ["Engage with Augustus and Livia to understand their mood and expectations.", "Seek approval and validation from Augustus through attentive behavior.", "Absorb the lessons of leadership indirectly from the conversations around him."],
        ap.beliefs = ["Family is central to identity and the well-being of Rome.", "Honor and virtue are traits to aspire to, especially as a grandson of Augustus.", "Youthful exuberance can contribute positively to the somber atmosphere, helping others feel better."],
        ap.goals = ["Short-term: Be supportive and attentive to Augustus as he reflects on Drusus.", "Medium-term: Learn by observation, preparing for the responsibilities of leadership.", "Ultimate: Grow into a respected figure in Rome, embodying the noble qualities of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Gaius trails behind the adults, a competitive glint in his eyes. He mirrors Lucius’s eagerness to impress Augustus while also showcasing the strategic mindset he’s been developing. He stands tall, exuding youthful confidence, ready for any opportunity to engage.',
        ap.emotional_state = 'Gaius demonstrates a mixture of determination and slight trepidation. He feels the weight of expectations on his shoulders and yearns to prove himself, wanting to be seen as competent. The somberness of the setting contrasts with his desire to participate, creating an internal conflict between the heaviness of grief and his aspirations.',
        ap.emotional_tags = ["gaius demonstrates a mixture of determination", "slight trepidation. he feels the weight of expectations on his shoulders", "yearns to prove himself, wanting to be seen as competent. the somberness of the setting contrasts with his desire to participate, creating an internal conflict between the heaviness of grief", "his aspirations.", "gaius demonstrates a mixture of determination and slight trepidation. he feels the weight of expectations on his shoulders and yearns to prove himself", "wanting to be seen as competent. the somberness of the setting contrasts with his desire to participate", "creating an internal conflict between the heaviness of grief and his aspirations."],
        ap.active_plans = ["Position himself favorably in Augustus's sight to showcase his potential as a leader.", "Engage in conversation that reflects his understanding of strategy and honor.", "Observe the dynamics between Augustus and Livia to learn about power play."],
        ap.beliefs = ["Leadership requires both wisdom and strength, and he seeks to embody these qualities.", "Honoring family legacy is paramount; he feels the burden of expectation to live up to Drusus's memory.", "Competition can strengthen resolve; he believes in proving his worth through strategic thinking."],
        ap.goals = ["Short-term: Capture Augustus's attention and approval through meaningful interaction.", "Medium-term: Develop his strategic skills while preparing for future leadership roles.", "Ultimate: Become a respected leader in Rome, continuing the legacy of his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Livia walks beside Augustus, physically supporting his weary frame as they stroll through the palace garden under the night sky. Her steps are measured and graceful, her posture erect, even as she offers a comforting presence to her husband. She listens attentively to Augustus\'s melancholic musings, her gaze steady and focused, subtly guiding him forward both physically and emotionally.',
        ap.emotional_state = 'On the surface, Livia presents an air of calm composure and wifely support, her tone gentle and reassuring as she speaks to Augustus. Internally, however, a pragmatic resolve hardens her heart against excessive grief.  She views prolonged mourning as a weakness, a luxury Rome cannot afford. While she acknowledges Drusus\'s loss, her primary emotion is likely impatience with Augustus\'s lingering sorrow, perceiving it as a potential impediment to their dynastic ambitions and the stability of the empire.',
        ap.emotional_tags = ["on the surface, livia presents an air of calm composure", "wifely support, her tone gentle", "reassuring as she speaks to augustus. internally, however, a pragmatic resolve hardens her heart against excessive grief.  she views prolonged mourning as a weakness, a luxury rome cannot afford. while she acknowledges drusus's loss, her primary emotion is likely impatience with augustus's lingering sorrow, perceiving it as a potential impediment to their dynastic ambitions", "the stability of the empire.", "on the surface", "livia presents an air of calm composure and wifely support", "her tone gentle and reassuring as she speaks to augustus. internally", "however", "a pragmatic resolve hardens her heart against excessive grief.  she views prolonged mourning as a weakness", "a luxury rome cannot afford. while she acknowledges drusus's loss", "her primary emotion is likely impatience with augustus's lingering sorrow", "perceiving it as a potential impediment to their dynastic ambitions and the stability of the empire."],
        ap.active_plans = ["Gently steer Augustus away from dwelling on Drusus's death and towards a more forward-looking perspective.", "Reinforce the Roman ideal of stoicism and discourage public displays of prolonged grief.", "Subtly direct Augustus's attention to Lucius and Gaius as the future of the dynasty, instilling hope and diverting focus from past losses."],
        ap.beliefs = ["Excessive grief is a sign of weakness and is unbecoming of Roman leadership.", "The needs of the state and the dynasty must always take precedence over personal emotions.", "The Roman way is to be pragmatic, resilient, and focused on the future, not the past."],
        ap.goals = ["short-term: To comfort Augustus in a way that redirects his grief into a more productive emotional state.", "medium-term: To ensure Augustus remains strong and focused on the future of Rome and the succession.", "ultimate: To solidify the Julio-Claudian dynasty's power and legacy by emphasizing strength, duty, and forward momentum over emotional indulgence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Augustus shuffles slowly through the palace garden, leaning heavily on Livia for physical support. His steps are unsteady, mirroring his emotional state. He speaks in a rambling, weary tone, reminiscing about Drusus and expressing a deep sense of loss. He gestures vaguely, his movements reflecting his aged frailty and the emotional weight he carries.',
        ap.emotional_state = 'Augustus is outwardly melancholic and reflective, deeply affected by the memory of Drusus, even a year after his death. His words betray a profound sadness and a sense of loss that lingers heavily.  Beneath the surface sorrow, there\'s a weariness, a sense of being burdened by the responsibilities of empire and the weight of familial tragedy.  He seems to be seeking solace and perhaps validation from Livia, though his grief is tinged with a Roman stoicism he feels obligated to uphold, creating a tension between his genuine feelings and the expected imperial composure.',
        ap.emotional_tags = ["augustus is outwardly melancholic", "reflective, deeply affected by the memory of drusus, even a year after his death. his words betray a profound sadness", "a sense of loss that lingers heavily.  beneath the surface sorrow, there's a weariness, a sense of being burdened by the responsibilities of empire", "the weight of familial tragedy.  he seems to be seeking solace", "perhaps validation from livia, though his grief is tinged with a roman stoicism he feels obligated to uphold, creating a tension between his genuine feelings", "the expected imperial composure.", "augustus is outwardly melancholic and reflective", "deeply affected by the memory of drusus", "even a year after his death. his words betray a profound sadness and a sense of loss that lingers heavily.  beneath the surface sorrow", "there's a weariness", "a sense of being burdened by the responsibilities of empire and the weight of familial tragedy.  he seems to be seeking solace and perhaps validation from livia", "though his grief is tinged with a roman stoicism he feels obligated to uphold", "creating a tension between his genuine feelings and the expected imperial composure."],
        ap.active_plans = ["Express his lingering grief and sense of loss over Drusus's death, seeking to process his emotions aloud.", "Reflect on Drusus's virtues, perhaps as a way to honor his memory and articulate his ideal of Roman nobility.", "Unconsciously seek comfort and reassurance from Livia, even though he is aware of her pragmatic nature."],
        ap.beliefs = ["Drusus was a noble and virtuous Roman, and his loss is a significant blow to Rome.", "Roman leaders should ideally embody virtue and strength, even in the face of personal tragedy.", "The future of Rome depends on raising successors who can emulate the virtues of past heroes like Drusus."],
        ap.goals = ["short-term: To articulate and momentarily alleviate his lingering grief by sharing his thoughts with Livia.", "medium-term: To find a way to reconcile his personal sorrow with his imperial responsibilities and the need for Roman stoicism.", "ultimate: To secure a stable and virtuous future for Rome, hoping that Lucius and Gaius will embody the qualities he admired in Drusus and ensure the dynasty's continued strength."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Augustus walks slowly through the illuminated garden, supported by Livia\'s steady presence. His posture is slightly hunched, reflecting both his physical weariness and the emotional burden of his thoughts. He gestures lightly as he speaks to the young princes, urging them toward their beds, his hands moving in slow, deliberate motions. His eyes reveal a depth of sadness as he reflects on Drusus, embodying both the weight of authority and the grief of loss.',
        ap.emotional_state = 'Surface emotions reveal a weary resignation, tinged with sorrow for Drusus\'s loss. His tone is slightly melancholic, evoking both nostalgia and a sense of duty. Internally, there is a struggle between the facade of strength expected of an emperor and the vulnerability of a grieving family member, creating tension as he tries to maintain control over his emotions and the atmosphere.',
        ap.emotional_tags = ["surface emotions reveal a weary resignation, tinged with sorrow for drusus's loss. his tone is slightly melancholic, evoking both nostalgia", "a sense of duty. internally, there is a struggle between the facade of strength expected of an emperor", "the vulnerability of a grieving family member, creating tension as he tries to maintain control over his emotions", "the atmosphere.", "surface emotions reveal a weary resignation", "tinged with sorrow for drusus's loss. his tone is slightly melancholic", "evoking both nostalgia and a sense of duty. internally", "there is a struggle between the facade of strength expected of an emperor and the vulnerability of a grieving family member", "creating tension as he tries to maintain control over his emotions and the atmosphere."],
        ap.active_plans = ["To uplift the mood through music, seeking solace and distraction from grief.", "To guide the young princes towards sleep, instilling in them a sense of duty and decorum.", "To express his feelings about Drusus, subtly reminding Livia and the boys of the family\u2019s legacy and the weight of their expectations."],
        ap.beliefs = ["The need to maintain a stoic facade as emperor, showing strength in the face of personal loss.", "The belief that time should heal grief, as reflected in his admonition that a year is long enough for mourning.", "The conviction that the future of Rome relies on the virtues of the next generation, particularly embodied in Lucius and Gaius."],
        ap.goals = ["Short-term: To conclude the evening with music and ensure the young princes are settled for the night.", "Medium-term: To subtly instill a sense of responsibility and legacy in Lucius and Gaius, preparing them for leadership.", "Ultimate: To navigate the complexities of succession and maintain stability within the Julio-Claudian dynasty amidst the shadows of loss and ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_15_4'})
    ON CREATE SET
        ap.current_status = 'Antonia materializes in the palace corridor after Augustus and Livia have retreated indoors. She pauses, observing Livia still lingering in the garden\'s shadows, before addressing her with a quiet, measured tone. Her posture is composed yet carries a subtle weight of sorrow, her gaze steady as she delivers her poignant words.',
        ap.emotional_state = 'Beneath a veneer of outward composure, Antonia is deeply affected by the passage of time since Drusus\'s death. Her surface emotion is a restrained sadness, tinged with a quiet defiance against Livia\'s pragmatic dismissal of grief. Internally, she is wrestling with the enduring pain of loss, a sharp contrast to the expected Roman stoicism. There\'s an unspoken conflict brewing within her, a gentle but firm resistance to the superficiality she perceives in Livia\'s approach to mourning.',
        ap.emotional_tags = ["beneath a veneer of outward composure", "antonia is deeply affected by the passage of time since drusus's death. her surface emotion is a restrained sadness", "tinged with a quiet defiance against livia's pragmatic dismissal of grief. internally", "she is wrestling with the enduring pain of loss", "a sharp contrast to the expected roman stoicism. there's an unspoken conflict brewing within her", "a gentle but firm resistance to the superficiality she perceives in livia's approach to mourning.", "beneath a veneer of outward composure, antonia is deeply affected by the passage of time since drusus's death. her surface emotion is a restrained sadness, tinged with a quiet defiance against livia's pragmatic dismissal of grief. internally, she is wrestling with the enduring pain of loss, a sharp contrast to the expected roman stoicism. there's an unspoken conflict brewing within her, a gentle", "firm resistance to the superficiality she perceives in livia's approach to mourning."],
        ap.active_plans = ["To voice her disagreement with Livia's seemingly facile view of grief.", "To subtly honor Drusus's memory by highlighting the inadequacy of a year to heal deep wounds.", "To maintain a degree of polite decorum while delivering a pointed emotional truth to Livia."],
        ap.beliefs = ["Genuine grief is a profound and enduring experience that cannot be neatly compartmentalized or timed.", "Remembering and honoring the deceased is crucial, especially for those deeply loved.", "Emotional honesty, even when challenging societal expectations, is more valuable than forced stoicism."],
        ap.goals = ["short-term\": \"To make Livia consider the true depth of grief and the inadequacy of her pronouncements on its duration.", "medium-term\": \"To ensure Drusus's memory and the genuine sorrow of his loss are not diminished or forgotten within the family narrative.", "ultimate\": \"To uphold emotional authenticity and compassion within the often-callous world of Roman politics, preserving her own integrity amidst the court's pressures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_4'})
    ON CREATE SET
        ap.current_status = 'Livia remains in the palace garden after Augustus\'s exit, enveloped by the night\'s shadows and the lingering fragrance of jasmine. She stands regally, observing the departing emperor and his grandsons. When Antonia appears in the corridor, Livia turns her attention, her posture unwavering, maintaining an air of composed empress even in the face of Antonia\'s quiet challenge.',
        ap.emotional_state = 'Livia projects an image of serene stoicism, outwardly embodying the Roman ideal of controlled grief and pragmatic acceptance of loss. On the surface, she appears unmoved by Augustus\'s sentimental musings and Antonia\'s subtle rebuke, maintaining her carefully constructed facade of emotional invulnerability. However, beneath this composed exterior, there might be a calculated detachment, a strategic suppression of any personal grief to maintain her position of power and control. She prioritizes the image of strength over any genuine display of vulnerability.',
        ap.emotional_tags = ["livia projects an image of serene stoicism, outwardly embodying the roman ideal of controlled grief", "pragmatic acceptance of loss. on the surface, she appears unmoved by augustus's sentimental musings", "antonia's subtle rebuke, maintaining her carefully constructed facade of emotional invulnerability. however, beneath this composed exterior, there might be a calculated detachment, a strategic suppression of any personal grief to maintain her position of power", "control. she prioritizes the image of strength over any genuine display of vulnerability.", "livia projects an image of serene stoicism", "outwardly embodying the roman ideal of controlled grief and pragmatic acceptance of loss. on the surface", "she appears unmoved by augustus's sentimental musings and antonia's subtle rebuke", "maintaining her carefully constructed facade of emotional invulnerability. however", "beneath this composed exterior", "there might be a calculated detachment", "a strategic suppression of any personal grief to maintain her position of power and control. she prioritizes the image of strength over any genuine display of vulnerability."],
        ap.active_plans = ["To reinforce the Roman ideal of stoicism and swift recovery from grief, both to Augustus and the family.", "To dismiss any prolonged mourning as unproductive and un-Roman, maintaining a pragmatic perspective.", "To subtly assert her emotional control and authority within the family dynamic, deflecting any challenge to her stoic persona."],
        ap.beliefs = ["Public displays of grief are a sign of weakness, detrimental to the image of imperial strength.", "Emotional control and pragmatism are essential virtues for Roman leadership and stability.", "Dwelling on past losses hinders progress and distracts from the immediate needs of the empire and her ambitions."],
        ap.goals = ["short-term\": \"To dismiss Antonia's implied criticism and reassert her stoic stance, ending the exchange swiftly.", "medium-term\": \"To ensure the family narrative around Drusus's death shifts from mourning to a celebration of his virtues, but without lingering sorrow.", "ultimate\": \"To solidify her image as a figure of unwavering strength and control, capable of managing both personal and imperial emotions with ruthless efficiency, further securing her influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands alone in the shadows of the palace corridor, his posture tense and guarded. He shifts slightly, a brooding figure obscured by the dim light, his eyes reflecting both the weight of his burdens and a flicker of defiance as he grapples with his thoughts about leaving Rome and the stifling presence of his mother.',
        ap.emotional_state = 'Tiberius\'s surface emotions are marked by resentment and bitterness, sharply expressed in his words and demeanor. Internally, he wrestles with feelings of grief over his brother\'s death and frustration directed at Livia\'s ambitions, which suffocate his own desires. He feels a profound disconnect from his mother, underscored by a sense of betrayal regarding the loss of Drusus.',
        ap.emotional_tags = ["tiberius's surface emotions are marked by resentment", "bitterness, sharply expressed in his words", "demeanor. internally, he wrestles with feelings of grief over his brother's death", "frustration directed at livia's ambitions, which suffocate his own desires. he feels a profound disconnect from his mother, underscored by a sense of betrayal regarding the loss of drusus.", "tiberius's surface emotions are marked by resentment and bitterness", "sharply expressed in his words and demeanor. internally", "he wrestles with feelings of grief over his brother's death and frustration directed at livia's ambitions", "which suffocate his own desires. he feels a profound disconnect from his mother", "underscored by a sense of betrayal regarding the loss of drusus."],
        ap.active_plans = ["To express his desire to escape Rome and its associated burdens.", "To confront Livia about her indifference towards Drusus's death and their strained relationship.", "To assert his own agency against Livia's attempts to control him."],
        ap.beliefs = ["Loyalty to family should come with emotional support, which he feels he lacks.", "Power dynamics within the family are toxic, especially regarding Livia's manipulation.", "He believes that leaving Rome may be the only way to reclaim his sense of self and autonomy."],
        ap.goals = ["Short-term: To communicate his frustrations to Livia and consider leaving Rome.", "Medium-term: To navigate the political landscape without his mother\u2019s controlling influence.", "Ultimate: To find personal freedom and a life that allows him to reunite with his true desires and identity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Livia remains in the palace garden, strategically positioned just beyond the colonnade, partially concealed in shadow. Her physical stillness contrasts with the weight of her words as she projects her voice into the corridor where Tiberius stands isolated. She does not move closer, maintaining a distance that emphasizes both her control and her emotional detachment.',
        ap.emotional_state = 'Livia exudes an icy composure, her voice measured and devoid of warmth, reflecting a heart seemingly untouched by grief or empathy. Beneath this veneer of control lies a steely resolve, fueled by her unwavering ambition for Tiberius and her dynasty. There\'s a subtle undercurrent of impatience and perhaps even anger at Tiberius\'s resistance, masked by her practiced calm. Her lack of visible emotion regarding Drusus is a calculated display, reinforcing her image as a figure of ruthless pragmatism.',
        ap.emotional_tags = ["livia exudes an icy composure, her voice measured", "devoid of warmth, reflecting a heart seemingly untouched by grief or empathy. beneath this veneer of control lies a steely resolve, fueled by her unwavering ambition for tiberius", "her dynasty. there's a subtle undercurrent of impatience", "perhaps even anger at tiberius's resistance, masked by her practiced calm. her lack of visible emotion regarding drusus is a calculated display, reinforcing her image as a figure of ruthless pragmatism.", "livia exudes an icy composure", "her voice measured and devoid of warmth", "reflecting a heart seemingly untouched by grief or empathy. beneath this veneer of control lies a steely resolve", "fueled by her unwavering ambition for tiberius and her dynasty. there's a subtle undercurrent of impatience and perhaps even anger at tiberius's resistance", "masked by her practiced calm. her lack of visible emotion regarding drusus is a calculated display", "reinforcing her image as a figure of ruthless pragmatism."],
        ap.active_plans = ["Intimidate Tiberius into submission by threatening to withdraw her support.", "Reinforce her authority as the matriarch and manipulator of the family's destiny.", "Ensure Tiberius remains in Rome to continue his path towards imperial power, despite his personal desires to escape."],
        ap.beliefs = ["Unwavering patience and strategic control are the most potent tools for achieving lasting power.", "Tiberius's personal desires are secondary to his imperial duty and her dynastic ambitions.", "Emotional displays are weaknesses that must be suppressed in the pursuit of power."],
        ap.goals = ["{short_term: Force Tiberius to remain in Rome and abandon any thoughts of leaving., medium_term: Solidify Tiberius's position as the heir apparent, despite any challenges or setbacks., ultimate: Secure the Julio-Claudian dynasty's reign over Rome, ensuring her legacy through Tiberius's future emperorship.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands in the shadows of the palace corridor, his brooding figure reflecting the weight of resentment and frustration. His posture is tense, revealing his inner turmoil, as he confronts Livia with pointed accusations. Each gesture is deliberate, emphasizing his emotional struggle against the backdrop of the opulent palace.',
        ap.emotional_state = 'Tiberius\'s surface emotions depict bitterness and defiance, his facial expressions tight with suppressed fury. Internally, he grapples with feelings of betrayal and helplessness, wrestling with resentment towards his mother’s ambition and the chaos it has caused. His words are laden with a deep sense of loss and a yearning for freedom, revealing unspoken conflicts over his duty and familial loyalties.',
        ap.emotional_tags = ["tiberius's surface emotions depict bitterness", "defiance, his facial expressions tight with suppressed fury. internally, he grapples with feelings of betrayal", "helplessness, wrestling with resentment towards his mother\u2019s ambition", "the chaos it has caused. his words are laden with a deep sense of loss", "a yearning for freedom, revealing unspoken conflicts over his duty", "familial loyalties.", "tiberius's surface emotions depict bitterness and defiance", "his facial expressions tight with suppressed fury. internally", "he grapples with feelings of betrayal and helplessness", "wrestling with resentment towards his mother\u2019s ambition and the chaos it has caused. his words are laden with a deep sense of loss and a yearning for freedom", "revealing unspoken conflicts over his duty and familial loyalties."],
        ap.active_plans = ["To confront Livia about her failures in maintaining power and control within the family.", "To express his desire to escape Rome and its suffocating politics.", "To reaffirm his independence from Livia's manipulations."],
        ap.beliefs = ["Family loyalty is paramount, yet it is being compromised by ambition.", "Power and control are fleeting and often lead to personal losses.", "His duty to Rome should not come at the expense of his own happiness."],
        ap.goals = ["Short-term: To assert his feelings of frustration and loss towards Livia.", "Medium-term: To explore the possibility of leaving Rome to reclaim his autonomy.", "Ultimate: To break free from Livia's manipulative grasp and seek a life that aligns with his own desires."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Livia, partially obscured by the colonnade in the garden, presents an image of regal composure even as she engages in this tense exchange. She stands with an air of authority, her posture defiant and unwavering, embodying the cold confidence of a woman who has navigated power for years.',
        ap.emotional_state = 'Livia exudes an icy calmness, yet underneath her composed exterior lies a simmering anger and frustration at Tiberius\'s accusations. While she maintains a facade of control, she feels the sting of his words, revealing her internal conflict between maternal concern and ruthless ambition. The absence of tears for Drusus underscores her emotional distance and the sacrifices she is willing to make for power.',
        ap.emotional_tags = ["livia exudes an icy calmness, yet underneath her composed exterior lies a simmering anger", "frustration at tiberius's accusations. while she maintains a facade of control, she feels the sting of his words, revealing her internal conflict between maternal concern", "ruthless ambition. the absence of tears for drusus underscores her emotional distance", "the sacrifices she is willing to make for power.", "livia exudes an icy calmness", "yet underneath her composed exterior lies a simmering anger and frustration at tiberius's accusations. while she maintains a facade of control", "she feels the sting of his words", "revealing her internal conflict between maternal concern and ruthless ambition. the absence of tears for drusus underscores her emotional distance and the sacrifices she is willing to make for power."],
        ap.active_plans = ["To reinforce her control over Tiberius and dissuade him from leaving Rome.", "To maintain her image as the strong matriarch of the family despite the chaos.", "To subtly manipulate the dynamics of power to her advantage."],
        ap.beliefs = ["Ambition and power are essential for survival in the imperial court.", "Emotional connections, such as grief, can be a weakness in the pursuit of power.", "Tiberius must learn to embrace patience and the role he is destined for."],
        ap.goals = ["Short-term: To assert her authority over Tiberius and dissuade him from leaving.", "Medium-term: To solidify her position and influence over the imperial family.", "Ultimate: To secure a lasting legacy for her son, Tiberius, at any cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Livia remains in the palace garden, strategically positioned within the colonnade\'s partial concealment, observing Tiberius who stands isolated in the shadows of the palace corridor. She responds to his outburst with a calculated vocal command rather than physical approach, maintaining an air of imperial detachment and control even as she delivers a deeply personal threat. Her posture suggests unwavering resolve, each word a precise weapon in her arsenal of manipulation.',
        ap.emotional_state = 'Livia presents a facade of icy resolve and controlled fury. Outwardly, her tone is sharp and devoid of warmth, reflecting a calculated severity designed to intimidate Tiberius. Beneath this veneer, there\'s a simmering anger at Tiberius\'s perceived ingratitude and defiance, especially his pointed remark about Drusus.  She is internally wrestling with frustration, perhaps even a flicker of hurt masked by layers of pragmatism, as she hardens her stance, prioritizing political dominance over maternal affection, choosing to wield the threat of complete emotional abandonment as her ultimate leverage.',
        ap.emotional_tags = ["livia presents a facade of icy resolve", "controlled fury. outwardly, her tone is sharp", "devoid of warmth, reflecting a calculated severity designed to intimidate tiberius. beneath this veneer, there's a simmering anger at tiberius's perceived ingratitude", "defiance, especially his pointed remark about drusus.  she is internally wrestling with frustration, perhaps even a flicker of hurt masked by layers of pragmatism, as she hardens her stance, prioritizing political dominance over maternal affection, choosing to wield the threat of complete emotional abandonment as her ultimate leverage.", "livia presents a facade of icy resolve and controlled fury. outwardly", "her tone is sharp and devoid of warmth", "reflecting a calculated severity designed to intimidate tiberius. beneath this veneer", "there's a simmering anger at tiberius's perceived ingratitude and defiance", "especially his pointed remark about drusus.  she is internally wrestling with frustration", "perhaps even a flicker of hurt masked by layers of pragmatism", "as she hardens her stance", "prioritizing political dominance over maternal affection", "choosing to wield the threat of complete emotional abandonment as her ultimate leverage."],
        ap.active_plans = ["Intimidate Tiberius into submission by threatening to sever their bond completely if he disobeys her.", "Reassert her control over Tiberius's actions and ensure he remains in Rome to fulfill his role in her grand scheme.", "Reinforce her image as an unyielding and ruthless figure, capable of dispensing with even her own son if he deviates from her plans."],
        ap.beliefs = ["Tiberius's presence in Rome is crucial for her political ambitions and the future of her dynasty.", "Emotional manipulation and the threat of abandonment are effective tools to control Tiberius's behavior.", "Maternal sentimentality must be sacrificed for the greater goal of securing power and ensuring the family's supremacy."],
        ap.goals = ["short_term\": \"Prevent Tiberius from leaving Rome and immediately quell his rebellious thoughts.", "medium_term\": \"Solidify Tiberius's position as the heir apparent, ensuring a smooth transition of power when Augustus passes.", "ultimate\": \"Secure the Julio-Claudian dynasty's long-term rule over Rome, with Tiberius as her compliant instrument on the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Julia lies sprawled on a couch, her disheveled appearance signaling her intoxication. As Tiberius enters, she stirs from her stupor, leans forward slightly, and with a mix of boldness and desperation, invites him to join her, her gestures exaggerated and provocative, embodying both her drunkenness and her yearning for attention.',
        ap.emotional_state = 'Julia\'s surface emotions reflect a mix of drunken bravado and vulnerability. Her provocative invitation is underscored by a deep-seated resentment and a longing for connection. Internally, she battles feelings of inadequacy and frustration with her loveless marriage, revealing an emotional conflict between her desires for affection and the biting sarcasm she wields as a shield.',
        ap.emotional_tags = ["julia's surface emotions reflect a mix of drunken bravado", "vulnerability. her provocative invitation is underscored by a deep-seated resentment", "a longing for connection. internally, she battles feelings of inadequacy", "frustration with her loveless marriage, revealing an emotional conflict between her desires for affection", "the biting sarcasm she wields as a shield.", "julia's surface emotions reflect a mix of drunken bravado and vulnerability. her provocative invitation is underscored by a deep-seated resentment and a longing for connection. internally", "she battles feelings of inadequacy and frustration with her loveless marriage", "revealing an emotional conflict between her desires for affection and the biting sarcasm she wields as a shield."],
        ap.active_plans = ["To provoke Tiberius into a reaction, showcasing her defiance against their strained marriage.", "To seek validation and affection, even if in a twisted manner, through sexual innuendo.", "To distract herself from her own dissatisfaction with life by creating chaos in her relationship with Tiberius."],
        ap.beliefs = ["She believes that her worth is tied to her charm and sexual appeal, despite her drunken state.", "Julia holds a conviction that she deserves love and autonomy in a life constrained by political expectations.", "She thinks her sharp wit and sarcasm can navigate the complexities of her loveless marriage."],
        ap.goals = ["Short-term: To engage Tiberius in a way that elicits a response and distracts from her own emotional turmoil.", "Medium-term: To assert some control over her own narrative within the confines of her marriage.", "Ultimate: To regain a sense of identity and affection in a life dominated by duty and disappointment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters Julia\'s chambers with a mix of annoyance and reluctance. Upon hearing Julia\'s crude invitation, he reacts with visible disgust, slapping her across the face in a moment of explosive anger, his posture rigid with indignation and his expression a mask of frustration and bitterness.',
        ap.emotional_state = 'Tiberius\'s surface emotions are dominated by anger and disdain at Julia\'s advances. His slap signifies a deep-seated frustration not only with her drunken antics but also with the broader circumstances of their marriage. Internally, he grapples with feelings of entrapment and melancholy, as he yearns for genuine connection yet feels suffocated by familial obligation and the resentment he harbors towards Julia.',
        ap.emotional_tags = ["tiberius's surface emotions are dominated by anger", "disdain at julia's advances. his slap signifies a deep-seated frustration not only with her drunken antics but also with the broader circumstances of their marriage. internally, he grapples with feelings of entrapment", "melancholy, as he yearns for genuine connection yet feels suffocated by familial obligation", "the resentment he harbors towards julia.", "tiberius's surface emotions are dominated by anger and disdain at julia's advances. his slap signifies a deep-seated frustration not only with her drunken antics but also with the broader circumstances of their marriage. internally", "he grapples with feelings of entrapment and melancholy", "as he yearns for genuine connection yet feels suffocated by familial obligation and the resentment he harbors towards julia.", "tiberius's surface emotions are dominated by anger and disdain at julia's advances. his slap signifies a deep-seated frustration not only with her drunken antics", "also with the broader circumstances of their marriage. internally, he grapples with feelings of entrapment and melancholy, as he yearns for genuine connection yet feels suffocated by familial obligation and the resentment he harbors towards julia."],
        ap.active_plans = ["To assert dominance and push back against Julia's provocative behavior.", "To distance himself emotionally and physically from the toxic dynamics of his marriage.", "To maintain his dignity and standing in the imperial family amidst the chaos of personal and political turmoil."],
        ap.beliefs = ["He believes that his position and duty require him to uphold a stoic front, rejecting Julia\u2019s advances.", "Tiberius is convinced that weakness, particularly emotional displays, can be exploited and must be avoided.", "He holds the conviction that love should be genuine and not reduced to crude provocation or sarcastic exchanges."],
        ap.goals = ["Short-term: To firmly shut down Julia's overtures and restore some semblance of control over the situation.", "Medium-term: To navigate the complexities of familial loyalty while seeking his own pathway away from Julia.", "Ultimate: To reclaim his identity as a warrior and ruler instead of a pawn in the web of familial politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters Julia\'s chambers to find her in a drunken stupor. He is immediately subjected to her sexual proposition which quickly turns venomous as she insults his physique and makes a deeply cutting remark about a male prostitute resembling his deceased wife, Vipsania. Overwhelmed by rage and humiliation, Tiberius lashes out physically, slapping Julia hard across the face.',
        ap.emotional_state = 'On the surface, Tiberius erupts in anger, resorting to physical violence after enduring Julia\'s barrage of insults. However, beneath this outward rage simmers a deep well of humiliation and frustration. He is constantly subjected to Julia\'s scorn and feels emasculated in their toxic marriage. Julia\'s cruel comparison to Vipsania is a particularly devastating blow, striking at his deepest vulnerabilities and triggering a loss of control born from accumulated resentment and despair.',
        ap.emotional_tags = ["on the surface, tiberius erupts in anger, resorting to physical violence after enduring julia's barrage of insults. however, beneath this outward rage simmers a deep well of humiliation", "frustration. he is constantly subjected to julia's scorn", "feels emasculated in their toxic marriage. julia's cruel comparison to vipsania is a particularly devastating blow, striking at his deepest vulnerabilities", "triggering a loss of control born from accumulated resentment", "despair.", "on the surface", "tiberius erupts in anger", "resorting to physical violence after enduring julia's barrage of insults. however", "beneath this outward rage simmers a deep well of humiliation and frustration. he is constantly subjected to julia's scorn and feels emasculated in their toxic marriage. julia's cruel comparison to vipsania is a particularly devastating blow", "striking at his deepest vulnerabilities and triggering a loss of control born from accumulated resentment and despair."],
        ap.active_plans = ["Escape Julia's presence and the suffocating atmosphere of her chambers.", "Retaliate against Julia's verbal attacks and reclaim a sense of masculine dominance.", "Unconsciously seek to provoke a decisive confrontation that might alter the unbearable status quo of his marriage, even if it results in further punishment."],
        ap.beliefs = ["Physical violence is a justifiable response when honor and dignity are publicly and viciously attacked.", "As a Roman man, he must assert his authority when confronted with disrespect, especially from his wife.", "He is trapped in a hopeless marriage and must react decisively to defend his already fragile sense of self."],
        ap.goals = ["Short-term: Silence Julia's insults and stop the immediate humiliation.", "Medium-term: Escape the toxic and loveless marriage, seeking any form of separation or relief.", "Ultimate: Reclaim a sense of self-respect and dignity, escaping the constant emotional torment inflicted by Julia and the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Julia lies drunkenly on her couch, barely conscious. As Tiberius enters, she rouses and immediately makes a lascivious invitation, quickly pivoting to vicious personal attacks. She insults Tiberius’s physique, calling him \'skinny like a boy\' and makes a cruel comparison involving a male prostitute and his deceased ex-wife. She is then violently slapped by Tiberius, causing her to cry out and summon Augustus.',
        ap.emotional_state = 'Julia presents a facade of drunken bravado and spite, using sexually charged language and cruel insults as weapons against Tiberius. Outwardly, she is provocative and mocking. However, beneath this aggressive exterior lies a deep well of unhappiness and resentment. She is trapped in a loveless marriage and feels powerless, channeling her frustration into verbal attacks, seeking attention and a reaction from Tiberius, even if it is negative. Her provocative behavior is a desperate attempt to assert some control and agency in her miserable situation, masking her inner pain with outward aggression.',
        ap.emotional_tags = ["julia presents a facade of drunken bravado", "spite, using sexually charged language", "cruel insults as weapons against tiberius. outwardly, she is provocative", "mocking. however, beneath this aggressive exterior lies a deep well of unhappiness", "resentment. she is trapped in a loveless marriage", "feels powerless, channeling her frustration into verbal attacks, seeking attention", "a reaction from tiberius, even if it is negative. her provocative behavior is a desperate attempt to assert some control", "agency in her miserable situation, masking her inner pain with outward aggression.", "julia presents a facade of drunken bravado and spite", "using sexually charged language and cruel insults as weapons against tiberius. outwardly", "she is provocative and mocking. however", "beneath this aggressive exterior lies a deep well of unhappiness and resentment. she is trapped in a loveless marriage and feels powerless", "channeling her frustration into verbal attacks", "seeking attention and a reaction from tiberius", "even if it is negative. her provocative behavior is a desperate attempt to assert some control and agency in her miserable situation", "masking her inner pain with outward aggression."],
        ap.active_plans = ["Provoke Tiberius and assert dominance, however fleeting, in their dysfunctional relationship.", "Humiliate Tiberius by attacking his masculinity and past relationships, aiming to wound him where she knows it will hurt most.", "Manipulate the situation to gain attention and sympathy, especially from her father, Augustus, by playing the victim after provoking Tiberius\u2019s violent reaction."],
        ap.beliefs = ["She is entitled to express her unhappiness and discontent, even through crude and hurtful means, as a form of rebellion against her constrained life.", "Tiberius is weak and inadequate, deserving of her scorn and humiliation.", "She can manipulate her father, Augustus, to intervene on her behalf, using her victimhood to gain leverage in the family power dynamics."],
        ap.goals = ["Short-term: Provoke a reaction from Tiberius and assert her power, however negatively, in their immediate interaction.", "Medium-term: Seek escape from the unhappy marriage, even if divorce is unlikely, perhaps through increased separation or by making Tiberius's life as unpleasant as possible.", "Ultimate: Find some form of autonomy and agency within her constrained life, seeking validation and attention, even if it manifests through negative interactions and familial conflict."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Augustus enters Julia\'s chambers with a stormy expression, his posture rigid and authoritative. He confronts Julia and Tiberius amidst the chaos, his presence dominating the room. His gestures are emphatic, filled with frustration as he calls attention to Tiberius\'s aggression and Julia\'s distress, reflecting his role as the stabilizing force he believes he must embody.',
        ap.emotional_state = 'Augustus is visibly agitated, his anger bubbling beneath the surface. His tone is sharp and filled with disappointment, directed at both Julia and Tiberius. Internally, he grapples with feelings of helplessness and frustration, aware that his authority is being challenged not just within his family, but in the empire itself. There is a growing unease as he contemplates the implications of this discord on his reign.',
        ap.emotional_tags = ["augustus is visibly agitated, his anger bubbling beneath the surface. his tone is sharp", "filled with disappointment, directed at both julia", "tiberius. internally, he grapples with feelings of helplessness", "frustration, aware that his authority is being challenged not just within his family, but in the empire itself. there is a growing unease as he contemplates the implications of this discord on his reign.", "augustus is visibly agitated", "his anger bubbling beneath the surface. his tone is sharp and filled with disappointment", "directed at both julia and tiberius. internally", "he grapples with feelings of helplessness and frustration", "aware that his authority is being challenged not just within his family", "but in the empire itself. there is a growing unease as he contemplates the implications of this discord on his reign.", "augustus is visibly agitated, his anger bubbling beneath the surface. his tone is sharp and filled with disappointment, directed at both julia and tiberius. internally, he grapples with feelings of helplessness and frustration, aware that his authority is being challenged not just within his family,", "in the empire itself. there is a growing unease as he contemplates the implications of this discord on his reign."],
        ap.active_plans = ["To reassert control over the family dynamics by forbidding any possibility of divorce between Tiberius and Julia, emphasizing the importance of appearances.", "To shift blame away from Tiberius and Julia, focusing instead on the perceived failures of their judgments to maintain the stability of the imperial family.", "To rally support for his vision of succession, particularly leaning on the younger generation, Agrippa's sons, to ensure the future of the dynasty."],
        ap.beliefs = ["The stability of the empire is paramount, and family discord undermines that stability.", "Divorce and personal grievances should not disrupt the grand narrative of imperial legacy.", "Loyalty and duty are non-negotiable, both in politics and familial relationships."],
        ap.goals = ["Short-term: To address the immediate conflict between Julia and Tiberius and prevent any further public scandal.", "Medium-term: To maintain the facade of a united front within the imperial family, preserving the essence of Roman virtue.", "Ultimate: To secure the future of the empire through his lineage and ensure that the next generation can support his vision."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Livia enters the scene closely following Augustus, her posture poised and collected. She observes the altercation between Julia and Tiberius with a calculating gaze, her hands clasped elegantly before her. She remains slightly in the background, exuding an aura of quiet authority while subtly assessing the emotional fallout of the confrontation.',
        ap.emotional_state = 'Livia’s exterior is calm and composed, yet beneath lies a keen awareness of the power play unfolding before her. She feels a sense of satisfaction at the discord, knowing it serves her purposes. There is an undercurrent of strategic planning as she considers how to turn these tensions to her advantage, ensuring her son\'s position remains secure amid familial chaos.',
        ap.emotional_tags = ["livia\u2019s exterior is calm", "composed, yet beneath lies a keen awareness of the power play unfolding before her. she feels a sense of satisfaction at the discord, knowing it serves her purposes. there is an undercurrent of strategic planning as she considers how to turn these tensions to her advantage, ensuring her son's position remains secure amid familial chaos.", "livia\u2019s exterior is calm and composed", "yet beneath lies a keen awareness of the power play unfolding before her. she feels a sense of satisfaction at the discord", "knowing it serves her purposes. there is an undercurrent of strategic planning as she considers how to turn these tensions to her advantage", "ensuring her son's position remains secure amid familial chaos."],
        ap.active_plans = ["To support Augustus in his resolve to keep Julia and Tiberius together, reinforcing the image of a stable imperial family.", "To manipulate any fallout from this confrontation to further isolate Tiberius and solidify her control over his destiny.", "To nurture Augustus's dependence on her through his frustrations, positioning herself as the calming influence amidst familial strife."],
        ap.beliefs = ["The family must present a facade of unity to maintain the strength of their rule.", "Disorder within the family is a threat to her ambitions and her son's future reign.", "Her manipulations are justified by the greater good of securing her family\u2019s power."],
        ap.goals = ["Short-term: To reinforce her husband\u2019s authority and prevent any idea of divorce from taking root.", "Medium-term: To position herself as indispensable in Augustus's decision-making, ensuring her influence grows.", "Ultimate: To secure Tiberius's ascension to the throne while eliminating potential threats from within the family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Julia sprawls on the couch, initially appearing vulnerable and half-asleep before springing into emotional turmoil. Her movements are animated as she expresses her frustration towards Tiberius and her father, punctuating her pleas with gestures that reflect her desperation and defiance. The slap from Tiberius leaves her momentarily stunned, but she quickly reverts to a fierce, indignant posture.',
        ap.emotional_state = 'Julia\'s surface emotions shift from dreamy to furious in an instant. Outwardly, she displays anger and hurt, especially following the slap. Internally, she battles feelings of betrayal and entrapment, acutely aware of her limited power in both her marriage and her father\'s oppressive expectations. There is a raw conflict between her desire for autonomy and the harsh reality of her situation.',
        ap.emotional_tags = ["julia's surface emotions shift from dreamy to furious in an instant. outwardly, she displays anger", "hurt, especially following the slap. internally, she battles feelings of betrayal", "entrapment, acutely aware of her limited power in both her marriage", "her father's oppressive expectations. there is a raw conflict between her desire for autonomy", "the harsh reality of her situation.", "julia's surface emotions shift from dreamy to furious in an instant. outwardly", "she displays anger and hurt", "especially following the slap. internally", "she battles feelings of betrayal and entrapment", "acutely aware of her limited power in both her marriage and her father's oppressive expectations. there is a raw conflict between her desire for autonomy and the harsh reality of her situation."],
        ap.active_plans = ["To demand a divorce, seeking personal freedom from an oppressive marriage.", "To express her dissatisfaction with Tiberius openly, hoping to ignite change in her dismal circumstances.", "To rally support from Augustus by appealing to his paternal instincts, emphasizing her plight."],
        ap.beliefs = ["Her worth and happiness are intertwined with her autonomy and the ability to make choices.", "Marriage should be based on love and partnership, not mere political expediency.", "Her father\u2019s authority must not supersede her right to happiness."],
        ap.goals = ["Short-term: To express her pain and frustration in hopes of being heard and understood.", "Medium-term: To secure her freedom from Tiberius and end the cycle of loveless marriages.", "Ultimate: To redefine her role as a woman within the constraints of Roman society, seeking genuine affection and autonomy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the room with a tense demeanor, his body language rigid and defensive. He reacts violently, slapping Julia in a moment of frustration that amplifies the already charged atmosphere. His movements convey a mixture of anger and helplessness as he grapples with the familial expectations and pressures surrounding him.',
        ap.emotional_state = 'Tiberius\'s surface emotions reflect aggression and frustration, especially in his confrontation with Julia. Internally, he battles feelings of guilt and resentment, torn between his mother\'s ambitions and his own unmet desires. The slap reveals both a moment of loss of control and an undercurrent of despair, highlighting the emotional toll of his situation.',
        ap.emotional_tags = ["tiberius's surface emotions reflect aggression", "frustration, especially in his confrontation with julia. internally, he battles feelings of guilt", "resentment, torn between his mother's ambitions", "his own unmet desires. the slap reveals both a moment of loss of control", "an undercurrent of despair, highlighting the emotional toll of his situation.", "tiberius's surface emotions reflect aggression and frustration", "especially in his confrontation with julia. internally", "he battles feelings of guilt and resentment", "torn between his mother's ambitions and his own unmet desires. the slap reveals both a moment of loss of control and an undercurrent of despair", "highlighting the emotional toll of his situation."],
        ap.active_plans = ["To express his deep-seated frustration with Julia's demands and her perceived lack of understanding of their situation.", "To assert dominance in the moment, yet grapple with the resulting guilt from his aggressive actions.", "To seek a resolution that aligns with his mother\u2019s desires while trying to maintain some semblance of personal integrity."],
        ap.beliefs = ["Duty and familial obligation are heavy burdens that must be borne, even at the cost of personal happiness.", "Violence is not the answer, yet he feels cornered by the complexities of his life.", "His mother\u2019s ambitions, while suffocating, are ultimately necessary for the stability of Rome."],
        ap.goals = ["Short-term: To diffuse the immediate conflict with Julia without conceding to her demands.", "Medium-term: To navigate the familial expectations and find a way to balance his desires with his responsibilities.", "Ultimate: To fulfill his role as a dutiful son while yearning for a life beyond the confines of familial duty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_4'})
    ON CREATE SET
        ap.current_status = 'Augustus bursts into Julia\'s chambers in a rage, witnessing the aftermath of Tiberius\'s slap. He immediately takes charge, positioning himself as the patriarchal authority. He confronts Julia about the marital discord, declaring there will be no divorce, and then turns his ire to the absent Tiberius, ordering his immediate exile from Rome. Throughout the scene, Augustus paces and gestures emphatically, projecting his imperial dominance even within his fractured family.',
        ap.emotional_state = 'Augustus is initially consumed by paternalistic anger and indignation at the violence against Julia, fueled by a long-held dislike for Tiberius. Beneath this surface rage, a profound frustration simmers – he feels deeply impotent in controlling his own family despite ruling an empire. This evolves into despair as he laments their inability to \'get on\', highlighting his emotional exhaustion and the heavy burden of leadership. Finally, he grasps at hope in Agrippa\'s sons, showcasing a desperate need for reassurance and legacy.',
        ap.emotional_tags = ["augustus is initially consumed by paternalistic anger", "indignation at the violence against julia, fueled by a long-held dislike for tiberius. beneath this surface rage, a profound frustration simmers \u2013 he feels deeply impotent in controlling his own family despite ruling an empire. this evolves into despair as he laments their inability to 'get on', highlighting his emotional exhaustion", "the heavy burden of leadership. finally, he grasps at hope in agrippa's sons, showcasing a desperate need for reassurance", "legacy.", "augustus is initially consumed by paternalistic anger and indignation at the violence against julia", "fueled by a long-held dislike for tiberius. beneath this surface rage", "a profound frustration simmers \u2013 he feels deeply impotent in controlling his own family despite ruling an empire. this evolves into despair as he laments their inability to 'get on'", "highlighting his emotional exhaustion and the heavy burden of leadership. finally", "he grasps at hope in agrippa's sons", "showcasing a desperate need for reassurance and legacy."],
        ap.active_plans = ["To immediately quell the domestic disturbance and reassert patriarchal control over his family.", "To definitively end the Julia-Tiberius marital conflict by forbidding divorce and exiling Tiberius.", "To seek solace and future stability by focusing on Agrippa's sons as potential heirs and sources of comfort."],
        ap.beliefs = ["Marriage is an unbreakable bond ordained by patriarchal authority, regardless of personal unhappiness.", "A father's primary duty is to protect his daughter's honor and enforce societal norms.", "The stability of his family directly reflects his ability to govern the empire, and familial chaos undermines his imperial authority."],
        ap.goals = ["{short_term: Restore order and silence the immediate family conflict within Julia's chambers and the palace., medium_term: Secure the future stability of the Julio-Claudian dynasty through capable heirs., ultimate: Ensure the enduring legacy of his reign and the Pax Romana, even if his own family is in disarray.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_4'})
    ON CREATE SET
        ap.current_status = 'Julia is initially found reclining on a couch, disoriented and intoxicated. She attempts to engage Tiberius intimately and then lashes out with insults when rejected and struck. Following the slap, she becomes more alert and vocal, directly appealing to Augustus for a divorce.  She stands and gestures passionately as she argues her case, ultimately exiting the chambers in tears, defeated and unheard, her physical state shifting from languid to distraught.',
        ap.emotional_state = 'Julia begins in a state of drunken haze, her words slurring and desires unfocused, masking a deeper loneliness and desperation for connection.  When provoked, her surface emotions erupt into sharp, venomous insults, a defense mechanism born of pain and frustration. Beneath this bravado, she is deeply unhappy and feels trapped in her loveless marriage. Her plea for divorce reveals a yearning for freedom and self-determination, quickly crushed by Augustus\'s patriarchal decree, leaving her in despair and heartbroken.',
        ap.emotional_tags = ["julia begins in a state of drunken haze, her words slurring", "desires unfocused, masking a deeper loneliness", "desperation for connection.  when provoked, her surface emotions erupt into sharp, venomous insults, a defense mechanism born of pain", "frustration. beneath this bravado, she is deeply unhappy", "feels trapped in her loveless marriage. her plea for divorce reveals a yearning for freedom", "self-determination, quickly crushed by augustus's patriarchal decree, leaving her in despair", "heartbroken.", "julia begins in a state of drunken haze", "her words slurring and desires unfocused", "masking a deeper loneliness and desperation for connection.  when provoked", "her surface emotions erupt into sharp", "venomous insults", "a defense mechanism born of pain and frustration. beneath this bravado", "she is deeply unhappy and feels trapped in her loveless marriage. her plea for divorce reveals a yearning for freedom and self-determination", "quickly crushed by augustus's patriarchal decree", "leaving her in despair and heartbroken."],
        ap.active_plans = ["To seduce Tiberius, driven by a mix of drunken impulse and perhaps a desperate attempt at intimacy or provocation.", "To retaliate against Tiberius's rejection with verbal barbs, fueled by wounded pride and pent-up resentment.", "To implore Augustus for a divorce, hoping to leverage her father's authority to escape her miserable marital situation."],
        ap.beliefs = ["She is entitled to happiness and should not be condemned to a loveless and abusive marriage.", "Her previous widowhoods are unjust burdens unfairly used against her by her father.", "She has a right to express her desires and expect her father, Augustus, to understand and support her needs."],
        ap.goals = ["{short_term: Escape the immediate confrontation and her unwanted presence in the room, seeking emotional release through tears., medium_term: Secure a divorce from Tiberius and regain control over her personal life and future., ultimate: Find genuine love and happiness, and break free from the constraints of her politically arranged and emotionally barren existence.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_4'})
    ON CREATE SET
        ap.current_status = 'Livia enters Julia\'s chambers following Augustus, her presence initially passive as she observes the volatile scene unfold. She positions herself beside Augustus, offering silent support while he confronts Julia.  Towards the end, Livia becomes subtly active, responding to Augustus\'s despair by redirecting his attention to Agrippa\'s sons, reassuring him of their promise and subtly promising to care for them. Her movements are minimal, her power exerted through calculated words and poised observation.',
        ap.emotional_state = 'Livia maintains a composed and outwardly supportive demeanor throughout the chaotic scene, presenting a facade of calm concern for Augustus and Julia.  Internally, she is likely calculating and opportunistic, observing the family conflict with a detached strategic mind. Her surface emotions are carefully controlled, masking a deeper ambition and manipulative intent as she subtly steers Augustus\'s thoughts towards Agrippa\'s sons.  Beneath her placid exterior lies a ruthless pragmatism and a focus on long-term power dynamics.',
        ap.emotional_tags = ["livia maintains a composed", "outwardly supportive demeanor throughout the chaotic scene, presenting a facade of calm concern for augustus", "julia.  internally, she is likely calculating", "opportunistic, observing the family conflict with a detached strategic mind. her surface emotions are carefully controlled, masking a deeper ambition", "manipulative intent as she subtly steers augustus's thoughts towards agrippa's sons.  beneath her placid exterior lies a ruthless pragmatism", "a focus on long-term power dynamics.", "livia maintains a composed and outwardly supportive demeanor throughout the chaotic scene", "presenting a facade of calm concern for augustus and julia.  internally", "she is likely calculating and opportunistic", "observing the family conflict with a detached strategic mind. her surface emotions are carefully controlled", "masking a deeper ambition and manipulative intent as she subtly steers augustus's thoughts towards agrippa's sons.  beneath her placid exterior lies a ruthless pragmatism and a focus on long-term power dynamics."],
        ap.active_plans = ["To observe and assess the family conflict, gauging the emotional states and vulnerabilities of Augustus and Julia.", "To offer silent support to Augustus, reinforcing his patriarchal role and gaining his trust through perceived loyalty.", "To subtly manipulate Augustus's focus towards Agrippa's sons, positioning herself as their protector and future guardian to advance her own agenda and influence over the succession."],
        ap.beliefs = ["Maintaining a semblance of family unity, even amidst chaos, is crucial for projecting imperial strength.", "Augustus is emotionally vulnerable and can be easily influenced through reassurance and flattery, particularly concerning his legacy.", "Agrippa's sons represent a significant opportunity for consolidating her family's power and ensuring long-term control over the Julio-Claudian dynasty."],
        ap.goals = ["{short_term: Maintain a calm and supportive presence during the immediate family crisis, solidifying her position as Augustus's confidante., medium_term: Strengthen her influence over Augustus's decisions regarding succession and the upbringing of Agrippa's sons., ultimate: Secure the long-term dominance of her lineage and ensure the continuation of her family's power within the Roman Empire, potentially through her grandsons, while maintaining a facade of familial harmony.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_5'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in the dim light of Julia\'s chambers, his posture tense and his expression a mixture of frustration and concern as he confronts the chaotic aftermath of Tiberius\'s violent outburst. His voice is raised, echoing his authority as he chastises both Julia and Tiberius, attempting to assert control over the unraveling family dynamics.',
        ap.emotional_state = 'Augustus experiences a profound internal conflict, his surface authority clashing with his growing sense of helplessness. He is frustrated by his daughter’s tumultuous relationships and the chaotic state of his family, feeling the weight of his responsibilities as emperor even as he longs for domestic peace. The flicker of unease when looking at Livia hints at his awareness of her manipulative nature.',
        ap.emotional_tags = ["augustus experiences a profound internal conflict, his surface authority clashing with his growing sense of helplessness. he is frustrated by his daughter\u2019s tumultuous relationships", "the chaotic state of his family, feeling the weight of his responsibilities as emperor even as he longs for domestic peace. the flicker of unease when looking at livia hints at his awareness of her manipulative nature.", "augustus experiences a profound internal conflict", "his surface authority clashing with his growing sense of helplessness. he is frustrated by his daughter\u2019s tumultuous relationships and the chaotic state of his family", "feeling the weight of his responsibilities as emperor even as he longs for domestic peace. the flicker of unease when looking at livia hints at his awareness of her manipulative nature."],
        ap.active_plans = ["Reinforce his authority over Julia and Tiberius to maintain family unity.", "Project a facade of familial harmony to outsiders, reflecting the strength of the imperial family.", "Prepare for the future leadership of his grandsons, whom he sees as the hope for his legacy."],
        ap.beliefs = ["Familial loyalty is paramount and must be enforced regardless of personal feelings.", "The stability of the empire relies on the appearance of a united family.", "He cannot afford any weakness in the face of political machinations; authority must be maintained."],
        ap.goals = ["Short-term: Reestablish order within his family following the altercation between Tiberius and Julia.", "Medium-term: Ensure that his grandsons are prepared to inherit the mantle of leadership.", "Ultimate: Secure the legacy of his rule through a stable and united imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_5'})
    ON CREATE SET
        ap.current_status = 'Livia stands beside Augustus in Julia\'s chambers, her demeanor calm and poised as she supports Augustus’s assertions about their grandsons. She exudes an air of maternal concern while subtly reinforcing Augustus\'s need for reassurance, using her charm to manipulate the atmosphere and ensure her influence remains unchallenged.',
        ap.emotional_state = 'Livia maintains a veneer of serenity, yet beneath her composed exterior lies a calculating mind, ever aware of the intricate political dance unfolding around her. She feels a surge of satisfaction as she manipulates Augustus\'s anxieties about family unity, even as a flicker of ambition stirs within her, reminding her of her ultimate goals.',
        ap.emotional_tags = ["livia maintains a veneer of serenity", "yet beneath her composed exterior lies a calculating mind", "ever aware of the intricate political dance unfolding around her. she feels a surge of satisfaction as she manipulates augustus's anxieties about family unity", "even as a flicker of ambition stirs within her", "reminding her of her ultimate goals."],
        ap.active_plans = ["Reinforce her position within the family by subtly steering Augustus's perception of their grandsons.", "Maintain the appearance of familial harmony to counteract the chaos caused by Julia and Tiberius's conflict.", "Utilize Augustus's reliance on her to secure her influence over future decisions regarding the imperial family."],
        ap.beliefs = ["Power must be carefully managed and wielded; appearances are crucial in maintaining influence.", "The future of her son Tiberius hinges on her ability to manipulate family dynamics.", "Control and stability are paramount in the imperial family, and her role is crucial in achieving that."],
        ap.goals = ["Short-term: Ensure Augustus remains focused on their grandsons as the future of the empire.", "Medium-term: Strengthen her grip on the family dynamics to position Tiberius favorably for succession.", "Ultimate: Cement her legacy and influence over the Julio-Claudian dynasty through strategic maneuvers."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
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
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
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
MATCH (a:Event {uuid: 'event_2_5'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_4'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
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
MATCH (a:Event {uuid: 'event_3_6'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_5'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_3_7'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_6'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
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
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_slave_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_slave_2_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_slave_2_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
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
MATCH (a:Event {uuid: 'event_5_6'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_5'}),
          (b:Event {uuid: 'event_5_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_7'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_6'}),
          (b:Event {uuid: 'event_5_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_8'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_7'}),
          (b:Event {uuid: 'event_5_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_9'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_8'}),
          (b:Event {uuid: 'event_5_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_10'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_9'}),
          (b:Event {uuid: 'event_5_10'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_11'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_10'}),
          (b:Event {uuid: 'event_5_11'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_12'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_11'}),
          (b:Event {uuid: 'event_5_12'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_13'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_12'}),
          (b:Event {uuid: 'event_5_13'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_5_14'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_5_13'}),
          (b:Event {uuid: 'event_5_14'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_6'}),
          (b:Event {uuid: 'event_5_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_6'}),
          (b:Event {uuid: 'event_5_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_7'}),
          (b:Event {uuid: 'event_5_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_8'}),
          (b:Event {uuid: 'event_5_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_8'}),
          (b:Event {uuid: 'event_5_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_9'}),
          (b:Event {uuid: 'event_5_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_9'}),
          (b:Event {uuid: 'event_5_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_9'}),
          (b:Event {uuid: 'event_5_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_10'}),
          (b:Event {uuid: 'event_5_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_10'}),
          (b:Event {uuid: 'event_5_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_11'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_11'}),
          (b:Event {uuid: 'event_5_11'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_11'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_11'}),
          (b:Event {uuid: 'event_5_11'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_11'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_11'}),
          (b:Event {uuid: 'event_5_11'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_12'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_5_12'}),
          (b:Event {uuid: 'event_5_12'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_12'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_12'}),
          (b:Event {uuid: 'event_5_12'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_13'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_13'}),
          (b:Event {uuid: 'event_5_13'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_13'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_13'}),
          (b:Event {uuid: 'event_5_13'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_14'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_5_14'}),
          (b:Event {uuid: 'event_5_14'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_14'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_14'}),
          (b:Event {uuid: 'event_5_14'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_5'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_6_1'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_2'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_1'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_6_3'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_2'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_vipsania'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_vipsania'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_vipsania'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_vipsania_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_6'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_7_1'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_2'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_1'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_senator'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_senator'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_senator_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_8'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_9_1'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_2'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_1'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_3'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_2'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_4'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_3'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_5'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_4'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_6'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_5'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_7'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_6'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_9_8'}),
          (b:Scene {uuid: 'scene_9'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_9_7'}),
          (b:Event {uuid: 'event_9_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_5'}),
          (b:Event {uuid: 'event_9_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_6'}),
          (b:Event {uuid: 'event_9_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_7'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_7'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_7'}),
          (b:Event {uuid: 'event_9_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_8'}),
          (b:Event {uuid: 'event_9_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_9_8'}),
          (b:Event {uuid: 'event_9_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_9_8'}),
          (b:Event {uuid: 'event_9_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_2'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_10_3'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_2'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_10_4'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_3'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_guardsman_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_1_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_1_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_guardsman_2'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_2_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_guardsman_2_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_10'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_2'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_1'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_11_3'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_2'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_11_4'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_3'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_11_5'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_4'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_11'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_12_1'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_2'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_1'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_12_3'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_2'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_12_4'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_3'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_12_5'}),
          (b:Scene {uuid: 'scene_12'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_12_4'}),
          (b:Event {uuid: 'event_12_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_rufus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_rufus_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_12_5'}),
          (b:Event {uuid: 'event_12_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'}),
          (b:Event {uuid: 'event_12_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_13'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_2'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_1'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_14_3'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_2'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_14_4'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_3'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_servant_14'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_servant_14'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_servant_14_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_2'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_15_3'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_2'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_15_4'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_3'}),
          (b:Event {uuid: 'event_15_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_lucius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_lucius_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gaius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gaius_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_15_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_15_4'}),
          (b:Event {uuid: 'event_15_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_15_4'}),
          (b:Event {uuid: 'event_15_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_15'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_16_1'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_16_2'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_16_1'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_16_3'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_16_2'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_16_4'}),
          (b:Scene {uuid: 'scene_16'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_16_3'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_family_affairs'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_16'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_2'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_17_3'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_2'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_17_4'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_3'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_17_5'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_17_4'}),
          (b:Event {uuid: 'event_17_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_4'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_17_4'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_4'}),
          (b:Event {uuid: 'event_17_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_event_17_5'}),
          (b:Event {uuid: 'event_17_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_17_5'}),
          (b:Event {uuid: 'event_17_5'})
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
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_2'}),
                      (e2:Event {uuid: 'event_2_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_3'}),
                      (e2:Event {uuid: 'event_2_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_4'}),
                      (e2:Event {uuid: 'event_2_5'})
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
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_5'}),
                      (e2:Event {uuid: 'event_3_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_5'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_6'}),
                      (e2:Event {uuid: 'event_3_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_9'}),
                      (e2:Event {uuid: 'event_5_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_9'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_10'}),
                      (e2:Event {uuid: 'event_5_11'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_9'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_10'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_11'}),
                      (e2:Event {uuid: 'event_5_12'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_9'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_10'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_11'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_12'}),
                      (e2:Event {uuid: 'event_5_13'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_1'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_2'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_3'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_4'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_5'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_6'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_7'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_8'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_9'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_10'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_11'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_12'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_5_13'}),
                      (e2:Event {uuid: 'event_5_14'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_3'}),
                      (e2:Event {uuid: 'event_9_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_3'}),
                      (e2:Event {uuid: 'event_9_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_4'}),
                      (e2:Event {uuid: 'event_9_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_3'}),
                      (e2:Event {uuid: 'event_9_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_4'}),
                      (e2:Event {uuid: 'event_9_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_5'}),
                      (e2:Event {uuid: 'event_9_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_3'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_4'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_5'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_6'}),
                      (e2:Event {uuid: 'event_9_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_1'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_2'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_3'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_4'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_5'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_6'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_9_7'}),
                      (e2:Event {uuid: 'event_9_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_2'}),
                      (e2:Event {uuid: 'event_10_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_2'}),
                      (e2:Event {uuid: 'event_10_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_3'}),
                      (e2:Event {uuid: 'event_10_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_3'}),
                      (e2:Event {uuid: 'event_11_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_3'}),
                      (e2:Event {uuid: 'event_11_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_4'}),
                      (e2:Event {uuid: 'event_11_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_2'}),
                      (e2:Event {uuid: 'event_12_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_2'}),
                      (e2:Event {uuid: 'event_12_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_3'}),
                      (e2:Event {uuid: 'event_12_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_1'}),
                      (e2:Event {uuid: 'event_12_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_2'}),
                      (e2:Event {uuid: 'event_12_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_3'}),
                      (e2:Event {uuid: 'event_12_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_12_4'}),
                      (e2:Event {uuid: 'event_12_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_1'}),
                      (e2:Event {uuid: 'event_14_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_1'}),
                      (e2:Event {uuid: 'event_14_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_2'}),
                      (e2:Event {uuid: 'event_14_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_1'}),
                      (e2:Event {uuid: 'event_14_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_2'}),
                      (e2:Event {uuid: 'event_14_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_3'}),
                      (e2:Event {uuid: 'event_14_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_3'}),
                      (e2:Event {uuid: 'event_15_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_1'}),
                      (e2:Event {uuid: 'event_16_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_1'}),
                      (e2:Event {uuid: 'event_16_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_2'}),
                      (e2:Event {uuid: 'event_16_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_1'}),
                      (e2:Event {uuid: 'event_16_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_2'}),
                      (e2:Event {uuid: 'event_16_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_3'}),
                      (e2:Event {uuid: 'event_16_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_1'}),
                      (e2:Event {uuid: 'event_17_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_1'}),
                      (e2:Event {uuid: 'event_17_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_2'}),
                      (e2:Event {uuid: 'event_17_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_1'}),
                      (e2:Event {uuid: 'event_17_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_2'}),
                      (e2:Event {uuid: 'event_17_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_3'}),
                      (e2:Event {uuid: 'event_17_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_1'}),
                      (e2:Event {uuid: 'event_17_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_2'}),
                      (e2:Event {uuid: 'event_17_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_3'}),
                      (e2:Event {uuid: 'event_17_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_17_4'}),
                      (e2:Event {uuid: 'event_17_5'})
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
