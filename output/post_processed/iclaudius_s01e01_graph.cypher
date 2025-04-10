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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e01_graph.json',
        creation_timestamp: '2025-04-10T09:39:30.648063',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'None',
        a.description = 'Elderly Claudius, a man now burdened by the weight of his past and the stigma of being perceived as a fool, is haunted and driven by the prophecy from the Sibyl. In his youth, he was timid and hesitant, seeking answers about his destiny. Now, he is introspective, revealing deep-seated fears and a desire to reclaim his narrative amidst the chaos of Roman politics. A keen observer with a sharp intellect concealed beneath layers of societal prejudice, he grapples with his identity as he records his life driven by the Sibyl\'s words in the face of impending doom from a poisoning plot.',
        a.traits = ["Paranoid", "Urgent", "Fearful", "Determined", "Introspective"],
        a.sphere_of_influence = 'Historical Record'
    ;
MERGE (a:Agent {uuid: 'agent_sibyl'})
    ON CREATE SET
        a.name = 'Sibyl of Cumae',
        a.title = 'None',
        a.description = 'An ancient and enigmatic seer dwelling within the depths of her cave at Cumae. The Sibyl is shrouded in mystique and imbued with the power of prophecy. Her piercing eyes seem to gaze beyond the present into the swirling currents of time, and her voice resonates like the cracking of dry earth. As a conduit to ancient forces that shape destinies, her pronouncements are cryptic yet laden with profound meaning.',
        a.traits = ["Prophetic", "Mysterious", "Timeless", "Enigmatic"],
        a.sphere_of_influence = 'Prophecy and fate'
    ;
MERGE (a:Agent {uuid: 'agent_augustus_caesar'})
    ON CREATE SET
        a.name = 'Augustus Caesar',
        a.title = 'Emperor',
        a.description = 'Augustus Caesar, the aging Emperor of Rome, embodies might and manipulation. He presides over his empire with a façade of paternal authority, yet beneath the surface lies deep insecurity and a desperate need for control. Haunted by the fragility of his power and the specter of succession, he navigates treacherous family dynamics and political alliances with calculated charm and ruthless pragmatism.',
        a.traits = ["Manipulative", "Insecure", "Authoritative", "Pragmatic"],
        a.sphere_of_influence = 'Imperial Governance'
    ;
MERGE (a:Agent {uuid: 'agent_livia'})
    ON CREATE SET
        a.name = 'Livia Drusilla',
        a.title = 'Empress',
        a.description = 'Livia Drusilla is a woman of ice and ambition, serving as the silent power behind the throne. With a calculating gaze, she manipulates events and individuals with ruthless efficiency. Her fierce desire for her son, Tiberius, to inherit the empire drives her masterful strategic maneuvers within the court.',
        a.traits = ["Ambitious", "Cunning", "Cold", "Strategic"],
        a.sphere_of_influence = 'Political Manipulation'
    ;
MERGE (a:Agent {uuid: 'agent_marcus_agrippa'})
    ON CREATE SET
        a.name = 'Marcus Agrippa',
        a.title = 'General',
        a.description = 'Marcus Agrippa is a battle-hardened general and a loyal comrade of Augustus. Known for his stern pragmatism and unwavering devotion to Rome, he recovered his position in the empire after a period of estrangement. His military prowess and political cunning are evident as he navigates power struggles and proposes strategic alliances, including a marriage alliance to solidify bonds with the imperial family.',
        a.traits = ["Pragmatic", "Ambitious", "Loyal (conditionally)", "Strategic", "Assertive", "Weathered"],
        a.sphere_of_influence = 'Military Strategy, Roman Politics'
    ;
MERGE (a:Agent {uuid: 'agent_marcellus'})
    ON CREATE SET
        a.name = 'Marcellus',
        a.title = 'None',
        a.description = 'Marcellus, the youthful scion of Augustus\'s bloodline, navigates the corridors of power with a lion cub’s swagger. Though his laughter and charm win over the crowds, a simmering cynicism is evident in his dismissive attitude towards veteran figures like Agrippa. His character hints at vulnerability and underlying conflict within the intricacies of imperial dynamics.',
        a.traits = ["Deceased", "Recently ill", "Adopted Son", "Victim (implied)"],
        a.sphere_of_influence = 'Public Popularity (formerly)'
    ;
MERGE (a:Agent {uuid: 'agent_julia'})
    ON CREATE SET
        a.name = 'Julia',
        a.title = 'None',
        a.description = 'Julia, daughter of Augustus, is sharp-witted and observant, with a cynical perspective on Roman society. She navigates the treacherous waters of court life with a keen awareness of political undercurrents, expressing disdain for the superficiality of public life and hinting at her desire for more than her prescribed role.',
        a.traits = ["Grief-stricken (implied)", "Vulnerable", "Royal Daughter", "To be comforted"],
        a.sphere_of_influence = 'Imperial Family'
    ;
MERGE (a:Agent {uuid: 'agent_thallus'})
    ON CREATE SET
        a.name = 'Thallus',
        a.title = 'Servant',
        a.description = 'Thallus is an efficient and dutiful servant in Augustus\'s palace. Formerly an actor, he is now subservient, ensuring that guests are well-cared for and commands are promptly executed. His articulate nature contrasts with his relegated status, highlighting the rigid social hierarchy of Rome.',
        a.traits = ["Obedient", "Efficient", "Servile", "Articulate", "Former Actor"],
        a.sphere_of_influence = 'Service, Imperial Household'
    ;
MERGE (a:Agent {uuid: 'agent_aristarchus_of_athens'})
    ON CREATE SET
        a.name = 'Aristarchus of Athens',
        a.title = 'Orator',
        a.description = 'Aristarchus of Athens is a celebrated Greek orator famed for his eloquence and theatrical flair. Invited to Rome by Augustus to commemorate the Battle of Actium, he delivers elaborate and poetic speeches, blending his mastery of rhetoric with a keen observation of Roman customs, though often remaining oblivious to underlying political tensions.',
        a.traits = ["Eloquent", "Theatrical", "Observant", "Self-assured", "Poetic"],
        a.sphere_of_influence = 'Oration, Rhetoric, Greek Culture'
    ;
MERGE (a:Agent {uuid: 'agent_mark_antony'})
    ON CREATE SET
        a.name = 'Mark Antony',
        a.title = 'None',
        a.description = 'Mark Antony is referred to as the former husband of Octavia and a figure tied to the tumultuous history of Roman power struggles. His legacy is marked by historical significance and a personal portrayal as an unpleasant and antagonistic figure in his relationships, contrasting with the present dynamics within the imperial family.',
        a.traits = ["deceased", "historically significant", "antagonistic to Augustus", "unpleasant husband (implied)"],
        a.sphere_of_influence = 'roman history'
    ;
MERGE (a:Agent {uuid: 'agent_cleopatra'})
    ON CREATE SET
        a.name = 'Cleopatra',
        a.title = 'Queen',
        a.description = 'Cleopatra, Queen of Egypt, is depicted as an ambitious and seductive historical figure whose dreams of ruling Rome were ultimately crushed. Portrayed as a symbol of Eastern decadence and a threat to Roman power, her dramatic downfall following the Battle of Actium is emphasized through derogatory references and her romantic antagonism.',
        a.traits = ["Ambitious", "Seductive", "Regal", "Defeated", "Otherized"],
        a.sphere_of_influence = 'Egyptian Rule (Historically), Seduction'
    ;
MERGE (a:Agent {uuid: 'agent_pylades'})
    ON CREATE SET
        a.name = 'Pylades',
        a.title = 'None',
        a.description = 'Pylades is a covert operator serving Livia’s intricate plots. Unlike the flamboyant senators or vainglorious legionaries, his power comes from unwavering loyalty and chilling efficiency. Dispatched to gather intelligence, deliver veiled threats, and ensure the execution of schemes, he operates from the shadows as an essential enforcer of Livia\'s designs.',
        a.traits = ["Loyal", "Efficient", "Discrete", "Subservient"],
        a.sphere_of_influence = 'Manipulation and espionage'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Nero',
        a.title = 'None',
        a.description = 'Tiberius Claudius Nero, the son of Livia and stepson of Augustus, is trapped between his mother\'s political ambitions and his own desire for recognition. His cautious nature and internal conflict are evident as he contends with the pressures of familial loyalty and the harsh realities of court politics.',
        a.traits = ["Cautious", "Reluctant", "Conflicted", "Observant"],
        a.sphere_of_influence = 'Roman Politics'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia',
        a.title = 'None',
        a.description = 'Antonia is a young, pretty, and dutiful member of the imperial family. Characterized by her eagerness to please and a gentle, naive demeanor, she strives for familial harmony and seeks approval through domestic tasks, such as weaving cloth for her uncle Augustus, reflecting a sheltered view amidst the ambitious intrigues of court life.',
        a.traits = ["young", "pretty", "dutiful", "naive", "earnest"],
        a.sphere_of_influence = 'domesticity'
    ;
MERGE (a:Agent {uuid: 'agent_octavia'})
    ON CREATE SET
        a.name = 'Octavia',
        a.title = 'None',
        a.description = 'Octavia, the grieving sister of Augustus, is a silent witness to the unfolding political machinations. Marked by profound losses, including her troubled past with Mark Antony and the absence of her son Marcellus, she embodies quiet strength and mournful resilience within the imperial palace.',
        a.traits = ["Grief-stricken", "Mourning", "Resigned", "Distraught"],
        a.sphere_of_influence = 'Family'
    ;
MERGE (a:Agent {uuid: 'agent_musa'})
    ON CREATE SET
        a.name = 'Musa',
        a.title = 'Physician',
        a.description = 'Musa is a compassionate physician in Augustus\'s palace, torn between his professional oath and the oppressive power dynamics surrounding him. Working in the shadow of political intrigue, he tends to the ailing with a profound sense of duty and sorrow, his internal struggle reflecting the tragic cost of ambition and the constraints of loyalty.',
        a.traits = ["Professional", "Concerned", "Helpless", "Loyal to Augustus"],
        a.sphere_of_influence = 'Medicine'
    ;
MERGE (a:Agent {uuid: 'agent_slave'})
    ON CREATE SET
        a.name = 'Slave',
        a.title = 'None',
        a.description = 'The Slave is a minor, unseen character whose role is to serve as a messenger within the imperial household. Represented only by a voice, this character underscores the rigid hierarchical structure of Roman society, functioning as a dutiful and subservient link between the powerful figures and the private realm of the palace.',
        a.traits = ["Obedient", "Servile", "Functional", "Minor", "Unseen"],
        a.sphere_of_influence = 'Domestic Service'
    ;
MERGE (o:Object {uuid: 'object_hidden_journal'})
    ON CREATE SET
        o.name = 'Hidden Journal',
        o.description = 'A small, discreet journal in which Claudius records his personal thoughts, experiences, and secret history. Originally concealed away within his chamber, it serves as both a private repository of his inner life and a defiant legacy against those who seek to misrepresent his narrative.',
        o.purpose = 'To record the personal history, secret thoughts, and inner truth of Claudius, preserving his legacy against historical erasure.',
        o.significance = 'Represents Claudius\'s desperate desire to reclaim and control his narrative for the future, acting as a vessel of his legacy and defiance.'
    ;
MERGE (o:Object {uuid: 'object_ship_cake'})
    ON CREATE SET
        o.name = 'Ship Cake',
        o.description = 'A large and elaborate cake meticulously crafted in the shape of a Roman warship, complete with decorative details resembling Agrippa\'s flagship and a candied cherry figurehead representing Agrippa himself.',
        o.purpose = 'To commemorate and celebrate Marcus Agrippa\'s naval victories, serving as both a tribute and a symbolic centerpiece at the banquet.',
        o.significance = 'Symbolizes Roman naval power and military achievements while also becoming a point of mockery and political tension among the characters.'
    ;
MERGE (o:Object {uuid: 'object_candied_cherry_agrippa'})
    ON CREATE SET
        o.name = 'Candied Cherry Agrippa',
        o.description = 'A small, candied cherry placed on the prow of the ship-shaped cake. It is intentionally designed to represent Marcus Agrippa, adding a humorous, slightly mocking touch that highlights both personalization and ridicule.',
        o.purpose = 'To serve as a decorative element that represents Agrippa, while simultaneously mocking his self-importance.',
        o.significance = 'Functions as a trivialized representation of Agrippa, becoming a focal point for mockery and emphasizing the undercurrent of disrespect within the imperial family.'
    ;
MERGE (o:Object {uuid: 'object_oration_actium_anniversary'})
    ON CREATE SET
        o.name = 'Oration for Actium Anniversary',
        o.description = 'A prepared speech by Aristarchus of Athens, commissioned by Augustus that acts as an eloquent, celebratory piece glorifying the Roman victory at Actium. Its delivery becomes the center of political tension and character conflict during the scene.',
        o.purpose = 'To commemorate the seventh anniversary of the Battle of Actium through political theater and entertainment.',
        o.significance = 'Marks the anniversary of a key Roman victory and catalyzes conflict by highlighting the political and generational divides among the characters.'
    ;
MERGE (o:Object {uuid: 'object_prose_hymn'})
    ON CREATE SET
        o.name = 'Prose Hymn',
        o.description = 'A novel form of Greek oratory blending prose and poetic elements. Delivered by Aristarchus, it encapsulates the innovative artistic expression and rhetorical performance valued in the cultural exchange between Greek and Roman traditions.',
        o.purpose = 'To serve as an artistic and rhetorical performance that showcases Greek innovation in oratory.',
        o.significance = 'Represents the evolving nature of artistic expression and underscores Roman curiosity and occasional misunderstanding of Greek cultural innovations.'
    ;
MERGE (o:Object {uuid: 'object_weaving'})
    ON CREATE SET
        o.name = 'Weaving',
        o.description = 'A meticulously crafted piece of cloth being woven on a loom by Antonia, intended as a thoughtful gift for her uncle, Augustus. It reflects the domestic craft and skill of its maker.',
        o.purpose = 'To serve as a gift for Augustus, demonstrating familial affection and domestic dedication.',
        o.significance = 'Acts as a symbol of domesticity and familial affection, highlighting Antonia\'s desire to please and connect with her influential relative.'
    ;
MERGE (o:Object {uuid: 'object_pears'})
    ON CREATE SET
        o.name = 'Pears',
        o.description = 'A selection of ordinary pears noted for their beauty and taste. One is notably picked by Augustus, who praises its qualities and even offers a light-hearted, paternal suggestion regarding its consumption.',
        o.purpose = 'To serve as food within a domestic and political context, providing a moment of everyday life amidst broader tensions.',
        o.significance = 'Represents domesticity and the mundane aspects of life, offering a contrast to the surrounding political drama.'
    ;
MERGE (o:Object {uuid: 'object_games_of_marcellus'})
    ON CREATE SET
        o.name = 'Games of Marcellus',
        o.description = 'A large-scale public entertainment event orchestrated by Marcellus in celebration of his political appointment as City Magistrate. The event promises extravagant spectacles designed to captivate the Roman populace.',
        o.purpose = 'To celebrate Marcellus\'s appointment and to entertain the public with innovative and captivating spectacles.',
        o.significance = 'Highlights the intersection of politics and spectacle in ancient Rome, reflecting Marcellus’s ambition for public recognition.'
    ;
MERGE (o:Object {uuid: 'object_cloth'})
    ON CREATE SET
        o.name = 'Cloth',
        o.description = 'A reference to luxurious fabric abundant in Augustus\'s wardrobe, indicative of his immense wealth. It is mentioned as a background detail emphasizing the opulent imperial lifestyle.',
        o.purpose = 'To function as clothing material, symbolizing wealth and the readiness to adorn or outfit on a grand scale.',
        o.significance = 'Stands as a symbol of imperial affluence and status, indirectly highlighting the lavish nature of the Roman court.'
    ;
MERGE (o:Object {uuid: 'object_rhinoceros'})
    ON CREATE SET
        o.name = 'Rhinoceros',
        o.description = 'An extraordinary exotic beast featuring a distinctive horn, arranged by Marcellus as part of the Games. Its presence is designed to awe the audience with its grandeur and rarity.',
        o.purpose = 'To serve as a central attraction in the Games, showcasing exotic animal spectacle to the crowd.',
        o.significance = 'Embodies the grandeur and lavishness of Roman entertainment, reflecting Marcellus\'s ambitious and extravagant plans.'
    ;
MERGE (o:Object {uuid: 'object_bed'})
    ON CREATE SET
        o.name = 'Bed',
        o.description = 'A bed situated in Marcellus\'s chambers, marked by its conversion into a deathbed for the ailing Marcellus. It dominates the room as a symbol of vulnerability and confinement.',
        o.purpose = 'Originally intended for sleep and rest, it now serves as a representation of Marcellus\'s decline and demise.',
        o.significance = 'Symbolizes Marcellus\'s vulnerability, physical decline, and the broader tragic shifts within the narrative.'
    ;
MERGE (o:Object {uuid: 'object_corpse'})
    ON CREATE SET
        o.name = 'Corpse',
        o.description = 'The lifeless body of Marcellus, lying on the bed in his chambers. It is depicted as a stark reminder of his sudden death and the tragic consequences of political ambition.',
        o.purpose = 'To represent death and the fallout from Marcellus\'s abrupt demise.',
        o.significance = 'Acts as a catalyst for both political calculation and emotional grief, marking the tragic end of a once vibrant figure.'
    ;
MERGE (o:Object {uuid: 'object_statutes'})
    ON CREATE SET
        o.name = 'Statues',
        o.description = 'Public monuments and representations of Roman figures or deities dotting the streets of Rome. These serve as enduring symbols of Roman authority and order amid the prevailing chaos.',
        o.purpose = 'To symbolize Roman authority and cultural legacy, even as they become targets during moments of public unrest.',
        o.significance = 'Represent the established order and authority of Rome, their desecration marking the deep societal breakdown during the riot.'
    ;
MERGE (o:Object {uuid: 'object_shops'})
    ON CREATE SET
        o.name = 'Shops',
        o.description = 'Commercial establishments lining the streets of Rome that fall victim to looting during the riot. They embody the vulnerability of civilian economic life during periods of chaos.',
        o.purpose = 'To serve as centers of commerce, whose plunder marks the erosion of social order.',
        o.significance = 'Symbolize the breakdown of societal structure and the vulnerability of private property amidst widespread public unrest.'
    ;
MERGE (l:Location {uuid: 'location_claudius_writing_chamber'})
    ON CREATE SET
        l.name = 'Claudius\'s Writing Chamber',
        l.description = 'A dimly lit chamber filled with scrolls lining the walls, evoking a sense of history and knowledge. The heavy scent of old parchment pervades the air, serving as both a refuge and a prison for Claudius as he grapples with his inner fears and the weight of his past while chronicling his life.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_cumae_sibyls_cave'})
    ON CREATE SET
        l.name = 'Cumae - Sibyl\'s Cave',
        l.description = 'The Sibyl\'s Cave in Cumae is a dark and foreboding cavern with an entrance resembling a monstrous maw in the hillside. The damp air is heavy with the scent of earth and lingering incense from forgotten rituals. Rough-hewn rock walls shrouded in shadows create an atmosphere of mystery and unease, where the veil between realms thins and fate’s pronouncements echo with chilling clarity.',
        l.type = 'Cave'
    ;
MERGE (l:Location {uuid: 'location_imperial_banquet_hall'})
    ON CREATE SET
        l.name = 'Imperial Banquet Hall',
        l.description = 'A lavish and spacious hall within Augustus\'s palace, designed for grand feasts and imperial celebrations. Dominated by a long table laden with food and decorated with tapestries and ornate embellishments, the hall fills with the heavy scents of rich food and strong perfumes, reflecting opulence and underlying political tension.',
        l.type = 'Banquet Hall'
    ;
MERGE (l:Location {uuid: 'location_augustus_palace'})
    ON CREATE SET
        l.name = 'Augustus\' Palace',
        l.description = 'The grand and imposing residence of Emperor Augustus in Rome, this sprawling complex of richly decorated halls and private chambers symbolizes imperial power and luxury. It functions as both a home and the center of Roman governance, where personal lives and public duties intermingle amid intense political intrigue and surveillance.',
        l.type = 'Palace'
    ;
MERGE (l:Location {uuid: 'location_athens'})
    ON CREATE SET
        l.name = 'Athens',
        l.description = 'A renowned city in Greece celebrated for its rich history in philosophy, arts, and oratory. Within the narrative, Athens is notable as the origin of Aristarchus, the celebrated orator whose eloquence represents Greek cultural and intellectual influence within the Roman Empire.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_actium'})
    ON CREATE SET
        l.name = 'Actium',
        l.description = 'A coastal region in Greece renowned as the site of the decisive naval Battle of Actium. This pivotal battle marked Augustus\'s victory over Antony and Cleopatra, symbolizing Roman military triumph and the consolidation of imperial power.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_harbor_of_actium'})
    ON CREATE SET
        l.name = 'Harbor of Actium',
        l.description = 'The specific harbor at Actium where the historic naval battle took place, serving as the epicenter for the conflict between the fleets of Augustus and Antony/Cleopatra. This harbor is a powerful symbol of Roman military engagement and decisiveness.',
        l.type = 'Harbor'
    ;
MERGE (l:Location {uuid: 'location_egypt'})
    ON CREATE SET
        l.name = 'Egypt',
        l.description = 'An ancient and wealthy kingdom which, following the defeat of Cleopatra and Antony, falls under Roman influence. Representing both a conquered territory and a symbol of the decadent East, Egypt is evoked as a land of exoticism and rivalry in contrast to Roman supremacy.',
        l.type = 'Kingdom'
    ;
MERGE (l:Location {uuid: 'location_rome'})
    ON CREATE SET
        l.name = 'Rome',
        l.description = 'The bustling capital city of the Roman Empire, depicted as a vibrant yet chaotic metropolis teeming with diverse populations. Rome serves as a melting pot of cultures and power, its crowded streets providing a stage for public spectacle and personal dramas.',
        l.type = 'City'
    ;
MERGE (l:Location {uuid: 'location_heaven'})
    ON CREATE SET
        l.name = 'Heaven',
        l.description = 'A figurative and idealized realm referenced in Aristarchus\'s oration as the ultimate destination sought to escape defeat. In this narrative context, Heaven functions as a poetic device to elevate the gravity of historical events rather than denote an actual physical location.',
        l.type = 'Figurative Location'
    ;
MERGE (l:Location {uuid: 'location_livias_chambers'})
    ON CREATE SET
        l.name = 'Livia\'s Private Chambers',
        l.description = 'A private sanctum of opulent darkness within the palace, richly adorned and filled with an aura of conspiracies. The chambers combine luxury with tension, serving as a strategic command center for Livia\'s manipulations while offering a view of the chaotic Roman streets below.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_palace_private_audience_chamber'})
    ON CREATE SET
        l.name = 'Palace - Private Audience Chamber',
        l.description = 'A quiet, formal room within the palace designed specifically for private imperial discussions. Bathed in soft, filtered sunlight with minimal furnishings including a gilded chair, the room exudes a blend of intimacy and authority in its restrained, official atmosphere.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_syria'})
    ON CREATE SET
        l.name = 'Syria',
        l.description = 'A province in the eastern Roman Empire, depicted as an essential administrative and military region. Governed by Agrippa\'s deputy while Agrippa remained in Lesbos, Syria represents significant territorial responsibility and serves as a focal point for Roman governance.',
        l.type = 'Province'
    ;
MERGE (l:Location {uuid: 'location_claudian_villa_sitting_room'})
    ON CREATE SET
        l.name = 'Claudian Villa - Sitting Room',
        l.description = 'The comfortably appointed sitting room in the Claudian Villa, bathed in soft sunlight and featuring a loom where Antonia weaves. This domestic space exudes refined elegance and subdued tensions that hint at the underlying political and familial rivalries within the imperial family.',
        l.type = 'Sitting Room'
    ;
MERGE (l:Location {uuid: 'location_roman_streets'})
    ON CREATE SET
        l.name = 'Roman Streets',
        l.description = 'The chaotic streets of Rome, filled with rioting citizens and widespread unrest. They serve as a dramatic backdrop for the narrative’s depiction of public discontent and the tension between imperial authority and a frenzied populace following the death of Marcellus.',
        l.type = 'Streets'
    ;
MERGE (l:Location {uuid: 'location_theatres'})
    ON CREATE SET
        l.name = 'Theatres',
        l.description = 'Large public entertainment venues in Rome, traditionally open-air structures where theatrical spectacles are held. Referenced as sites for upcoming games, the theatres underscore the public display of Roman cultural grandeur and entertainment.',
        l.type = 'Entertainment Venue'
    ;
MERGE (l:Location {uuid: 'location_marketplace'})
    ON CREATE SET
        l.name = 'Marketplace',
        l.description = 'The bustling marketplace of Rome, a large open public space where commerce thrives. In the narrative, it is envisioned to be transformed into a giant, multi-colored marquee for grand entertainment events, highlighting its prominence in the urban landscape.',
        l.type = 'Public Space'
    ;
MERGE (l:Location {uuid: 'location_roman_coliseum'})
    ON CREATE SET
        l.name = 'Roman Coliseum',
        l.description = 'A colossal arena in Rome renowned for its grandeur and the fervent energy of its crowds. With imposing stone walls and an imperial box, the Roman Coliseum not only hosts spectacular games but also symbolizes Roman might and public devotion to grand spectacles.',
        l.type = 'Arena'
    ;
MERGE (l:Location {uuid: 'location_claudian_villa_hallway'})
    ON CREATE SET
        l.name = 'Claudian Villa - Hallway',
        l.description = 'A dimly lit hallway within the Claudian Villa that serves as a transitional, private space away from the public spectacle. Its subdued lighting and tense atmosphere at night underscore the underlying concerns and strained conversations between Augustus and Livia.',
        l.type = 'Hallway'
    ;
MERGE (l:Location {uuid: 'location_roman_games'})
    ON CREATE SET
        l.name = 'The Games',
        l.description = 'A grand public entertainment event known as the Roman Games, characterized by elaborate spectacles that may take place in venues such as the Coliseum or theatres throughout Rome. The event epitomizes Roman extravagance and serves to enhance the public image of its organizers.',
        l.type = 'Entertainment Event'
    ;
MERGE (l:Location {uuid: 'location_eastern_provinces'})
    ON CREATE SET
        l.name = 'Eastern Provinces',
        l.description = 'A vast geographical region of the Roman Empire located to the east of Italy. The Eastern Provinces encompass significant territories under Roman governance, reflecting the expansive reach and administrative challenges of the empire.',
        l.type = 'Region'
    ;
MERGE (l:Location {uuid: 'location_lesbos'})
    ON CREATE SET
        l.name = 'Lesbos',
        l.description = 'An island in the Aegean Sea noted as the current location of Agrippa. Portrayed as a place of relative isolation and limited influence compared to more critical provinces, Lesbos reflects Agrippa’s diminished status in the eyes of Augustus.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_marcellus_chambers'})
    ON CREATE SET
        l.name = 'MARCELLUS\'S CHAMBERS',
        l.description = 'The dimly lit, somber chambers of Marcellus, marked by a central bed and a pervasive sense of confinement and vulnerability. Once part of Caesar\'s opulent palace, these chambers now evoke enforced isolation and the tragic decline of their occupant’s health.',
        l.type = 'Chamber'
    ;
MERGE (l:Location {uuid: 'location_livias_study'})
    ON CREATE SET
        l.name = 'Livia\'s Study',
        l.description = 'A richly decorated room that functions both as a retreat and a strategic command center for Livia. Adorned with opulent fabrics and intricate patterns, the study exudes elegance while serving as a backdrop for her subtle manipulations and calculated orchestration of events.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_room'})
    ON CREATE SET
        l.name = 'Julia\'s Room',
        l.description = 'Julia\'s Room is a private space within the palace, serving as both a refuge and a place of isolation in her grief. It offers a temporary sanctuary from the political machinations of the court where she retreats to mourn and process the news of Marcellus\'s death.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_augustus_study'})
    ON CREATE SET
        l.name = 'Augustus\'s Study',
        l.description = 'A richly appointed study within the Imperial Palace, featuring walls lined with ancient scrolls and busts of past emperors. Designed for private imperial discussions and strategic planning, the study resonates with the weight of tradition and legacy, and is charged with palpable tension.',
        l.type = 'Study'
    ;
MERGE (l:Location {uuid: 'location_claudius_chamber'})
    ON CREATE SET
        l.name = 'Claudius\'s Chamber',
        l.description = 'A private, dimly lit chamber characterized by flickering candlelight and shifting shadows that evoke secrecy and confinement. Scattered parchment and scrolls hint at scholarly pursuits, making this space feel both like a sanctuary and a prison that amplifies a sense of isolation and hidden threats.',
        l.type = 'Chamber'
    ;
MERGE (o:Organization {uuid: 'org_rome'})
    ON CREATE SET
        o.name = 'Rome',
        o.description = 'The vast and powerful Roman Empire, ruled by Augustus Caesar. Depicted as a city in turmoil following Marcellus\'s death, Rome is a center of imperial governance amid public unrest, with a struggling imperial family striving to maintain order.',
        o.sphere_of_influence = 'Imperial Governance and Military Power'
    ;
MERGE (o:Organization {uuid: 'org_egypt'})
    ON CREATE SET
        o.name = 'Egypt',
        o.description = 'Historically a wealthy and powerful kingdom, Egypt is now viewed as a defeated territory under Roman dominance. In this narrative, it is symbolized by Cleopatra as a past rival to Rome, representing exotic decadence in contrast to Roman ideals of order and strength.',
        o.sphere_of_influence = 'Historically North Africa, Symbolic Rival to Rome'
    ;
MERGE (o:Organization {uuid: 'org_senate'})
    ON CREATE SET
        o.name = 'Senate',
        o.description = 'The Roman Senate, a political body within Rome, is portrayed as a traditional yet waning force in the face of imperial autocracy. Described as a farce of self-governance by figures like Livia and Julia, its influence is overshadowed by the imperial will.',
        o.sphere_of_influence = 'roman politics'
    ;
MERGE (o:Organization {uuid: 'org_city_watchmen'})
    ON CREATE SET
        o.name = 'City Watchmen',
        o.description = 'The City Watchmen of Rome function as the urban law enforcement, tasked with maintaining order and dealing with public disturbances. In the scene, they are referenced as handling a rampaging mob, although their effectiveness is questioned by Livia.',
        o.sphere_of_influence = 'Urban Law Enforcement'
    ;
MERGE (o:Organization {uuid: 'org_guard'})
    ON CREATE SET
        o.name = 'Guard',
        o.description = 'Representing the elite military force such as the Praetorian Guard, this organization is responsible for the security of Rome and the imperial family. Their potential brutality and the political risks associated with their use are highlighted by Livia\'s directive to deploy them against unrest.',
        o.sphere_of_influence = 'Imperial Security'
    ;
MERGE (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    ON CREATE SET
        ep.title = 'Part 1 of 13: A Touch of Murder',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'The Stammerer\'s Confession',
        s.description = 'In the dimly lit solitude of his writing chamber, Claudius, the supposed fool of the imperial court, begins to pen his secret history. Scrolls line the walls, hinting at untold stories, and the air is thick with the scent of aged parchment, creating an atmosphere of hushed secrecy and introspection.  Sunlight struggles to penetrate the heavy drapes, reinforcing the sense of a hidden world, a mind shielded from the prying eyes of Rome. Claudius, burdened by the weight of prophecy and the constant threat of spies, speaks directly to a future audience, his words imbued with a mix of weariness, determination, and a touch of madness. This scene serves as the narrative prologue, establishing Claudius as the unreliable narrator, setting the stage for a tale of intrigue, and introducing the central themes of hidden truths and manipulated perceptions within the treacherous world of imperial Rome.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_writing_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Claudius Commences His Secret History',
        e.description = 'Elderly Claudius, in his private chamber filled with scrolls, begins writing in a hidden journal. He identifies himself with his full imperial name, then immediately acknowledges the mocking epithets he\'s known by – \'Claudius the Idiot,\' \'Fool Claudius,\' and \'Claudius the Stammerer.\' This establishes his public persona versus his private, intellectual self, and clearly states his purpose: to write the \'strange history of my life.\' This act of writing is the inciting incident of the scene, setting up Claudius as the narrator and chronicler.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: I, Tiberius Claudius Drusus Nero Germanicus, oh, this-that-and-the-other... who was once, and not so long ago, better known to my friends and relatives as Claudius the Idiot, or that Fool Claudius, or Claudius the Stammerer. Am now about to write this strange history of my life."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Claudius Speaks to the Unseen Future',
        e.description = 'Claudius pauses his writing and directly addresses an imagined audience in the future. He asks \'Are you there?\' and immediately answers himself in voice-over, confirming their presence. This breaks the fourth wall and establishes a direct connection with viewers, emphasizing the timeless nature of his story and the intended readership for his secret history. It highlights his awareness that his words are meant for posterity, not just his contemporaries.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: Are you there?", "CLAUDIUS (V.O.) Yes you're there, I can feel it. I can feel your presence. Yes. I knew you would come the moment I began to write. Yes. It was inevitable."]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Fear of Surveillance',
        e.description = 'Claudius\'s tone shifts to paranoia as he whispers about spies. In voice-over, he elaborates on the omnipresence of spies in Roman society, imagining them everywhere – \'In my bed. At my prayers. On the street. Even in the lavoratory.\' This reveals the oppressive atmosphere of constant surveillance in Rome and Claudius\'s acute awareness of being watched, justifying his need for secrecy and hidden writing.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS (V.O.) Spies. Spies everywhere. Spying on me. In my bed. At my prayers. On the street.", "CLAUDIUS: Even in the lavoratory. Spies."]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Claudius Vows to Outwit the Spies',
        e.description = 'Despite his fear, Claudius declares in voice-over, \'I\'ll cheat them. Every one.\' This demonstrates his resolve and cunning beneath the facade of foolishness. He intends to outsmart the pervasive surveillance, suggesting he has a plan to keep his history secret and ensure its survival, highlighting his intelligence and agency despite being underestimated by others.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS (V.O.) I'll cheat them. Every one."]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'Claudius Remembers the Sibyl\'s Prophecy',
        e.description = 'Claudius transitions to recalling a pivotal moment from his past – his visit to the Sibyl at Cumae. In voice-over, he states, \'It was prophesied by the Sybil,\' establishing the prophecy as a key motivation for his writing. He describes the Sibyl\'s renowned fame and the unexpected event of her consenting to see him, building anticipation for the prophecy\'s revelation and emphasizing its personal significance for Claudius.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CLAUDIUS (V.O.) It was prophesied by the Sybil.", "CLAUDIUS (V.O.) Spies.", "CLAUDIUS (V.O.) It was prophesied by the Sybil. I went to Cumae many years ago to consult her. She was most famous. Her prophecies had achieved worldwide renown and she did not consent to see everyone. Unexpectedly she consented to see me. I was terrified."]
    ;
MERGE (e:Event {uuid: 'event_1_6'})
    ON CREATE SET
        e.title = 'The Sibyl Delivers Her Prophecy',
        e.description = 'Claudius recounts his fearful encounter with the Sibyl in voice-over. He recalls asking about \'Rome\'s fate and mine.\' The Sibyl\'s response is delivered, mimicking Claudius\'s stammer, \'Hear me Cla-Cla-Claudius,\' mocking his speech impediment. She declares herself the mouthpiece of Apollo and commands him to \'Listen closely,\' before delivering the core prophecy itself which will be revealed later. This event reveals the origin of Claudius\'s conviction that his voice and story are destined to be heard, despite his current perceived foolishness.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: \"Oh Sybil\", I said, \"I've co-co-come to question you about Rome's fate and mine\".", "CLAUDIUS (V.O.) \"Hear me Cla-Cla-Claudius\", she answered, mocking my stammer. \"Apollo speaks to you through me. Listen closely.\""]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'The Sibyl\'s Prophecy',
        s.description = 'The scene is set outside the foreboding mouth of Cumae\'s Sibyl\'s Cave, where darkness looms ominously. CLAUDIUS, younger and more timid, approaches with trepidation, the cave\'s entrance framed by jagged rocks and a sense of ancient mystery. The air is thick with the scent of damp earth and the weight of unspoken truths. Inside, shadows dance, hinting at the secrets that lie within. SIBYL, an ancient woman with piercing eyes that seem to hold centuries of knowledge, stands before him, her presence commanding yet enigmatic. Her voice, like a whisper of the past, unveils a prophecy, cryptic yet resonant. The atmosphere is heavy with anticipation as she reveals that Claudius is destined for a gift that others crave yet will elude him for nearly two millennia. The prophecy foreshadows a future where his voice will eventually shatter the silence of history, embedding his truth amid the tumult of time. This moment carries significant narrative weight, suggesting the intertwining of fate and ambition that will haunt Claudius throughout his life.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_cumae_sibyls_cave'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Claudius Seeks the Sibyl\'s Wisdom',
        e.description = 'In a moment laden with trepidation, younger CLAUDIUS stands before the Sibyl, seeking insight into his uncertain future. The Sibyl, her eyes gleaming with ancient wisdom, unveils a dark prophecy, hinting at the burdens he will carry. Her words are cryptic yet profound, suggesting that Claudius will be granted a gift that others desire, yet it will come with a heavy price. The revelation that he shall speak clearly after nineteen hundred years encapsulates the weight of his destiny, foreshadowing the profound impact he will have on history despite his current insignificance. This moment crystallizes the theme of identity, as Claudius grapples with his perceived weakness in contrast to the grand destiny foretold by the Sibyl.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["What groans beneath the Punic curse and strangles in the strings of purse before she mends must sicken worse.", "Ten years, fifty days and three, Cla-Cla-Claudius shall be given thee a gift that all desire but he.", "But when he's done, and no more here, nineteen hundred year or near, Cla-Cla-Claudius shall speak clear."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Weight of Nineteen Centuries',
        s.description = 'In the hushed solitude of his writing chamber, bathed in the soft light of day, Claudius experiences a profound epiphany. The Sibyl\'s cryptic prophecy, once a riddle, now snaps into sharp focus. The weight of \'nineteen hundred years\' settles upon him, revealing the true audience for his voice – not the vipers of Rome, but generations yet unborn. A sense of solemn purpose descends as he resolves to become history\'s hidden witness. The chamber, lined with scrolls and redolent with the scent of aged parchment, transforms into a sanctuary of secrets. A hidden journal, his confidante, awaits the chronicle of his family\'s treacherous ascent. The atmosphere is thick with a blend of quiet determination and conspiratorial anticipation, as Claudius embraces his destiny as a chronicler for posterity, a voice echoing from the shadows of the past into the distant future. This scene is pivotal, marking the genesis of Claudius\'s historical mission and establishing the narrative framework for his clandestine account of Rome\'s darkest secrets.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_writing_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'The Prophecy Unveiled',
        e.description = 'A flicker of understanding ignites in Claudius\'s eyes as the Sibyl\'s words resonate with newfound clarity. The cryptic phrase \'nineteen hundred years\' ceases to be a riddle, revealing itself as the span of time that must pass before his voice will be heard. He grasps the profound implication: his true audience lies not in the treacherous present of Rome, but in the distant future, a realization that shifts his perspective and purpose.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Yes, that's what it means. In nineteen hundred years from now they'll hear me.", "CLAUDIUS: Not before."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'A Chronicle For Posterity',
        e.description = 'Driven by this revelation, Claudius makes a decisive resolution. He will become the chronicler of his family\'s dark history, a secret scribe capturing the truth of their ambition and the fall of the Republic. The idea of a \'box\' materializes in his mind – a vessel to safeguard his forbidden knowledge from prying eyes and the corrosive touch of time. He envisions burying his history, ensuring its survival until the prophesied moment of discovery, centuries into the future.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: A box. I need a box.", "CLAUDIUS (V.O.) I'll put all it all in here. My story. My history of the family. Yes. And the end of the Republic. Yes. And when I've finished, I'll seal it up and bury it where no one will find it.", "CLAUDIUS: No. No one."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'An Oath to the Unborn',
        e.description = 'Claudius, with a solemn intensity, addresses the \'you\' of the future, an unseen audience separated by the gulf of time. He pledges to entrust his entire history within the hidden box, a sealed testament to the truth. He speaks of his family, of Livia, Augustus, Agrippa, and Marcellus, signaling the key players in his unfolding drama. In voice-over, his narration begins, marking the genesis of his chronicle, a promise to posterity whispered across the ages, ensuring that the truth of Rome will eventually emerge from the shadows.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS (V.O.) Not for nineteen hundred years or more. And then it will turn up. Suddenly. People will read it. They'll know the truth. My voice, as the Sybil said, as she prophesied. For them. Not for these fools in Rome. But for them, out there, in remote posterity.", "CLAUDIUS: Yes, for you. Yes, it will all be in here. Sealed. You will find it. I promise you.", "CLAUDIUS (V.O.) I, Claudius am now about to begin this strange history of my life, of my family, of LIVIA my grandmother, of AUGUSTUS CAESAR, of MARCUS AGRIPPA, yes, and his hatred for MARCELLUS..."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'A Feast of Tension',
        s.description = 'In the lavish Imperial Banquet Hall of Augustus\'s palace, the atmosphere is thick with the scent of rich foods and the murmur of conversation. The grand table is laden with exotic dishes, reflecting the opulence of Rome, while Augustus, the Emperor, presides with an air of authority. Around him sit his family and closest allies: Livia, his ambitious wife, whose keen eyes miss nothing; Agrippa, the loyal general, a bulwark against youthful insolence; Marcellus, the entitled nephew, radiating impatience; and Julia, the Emperor\'s daughter, caught between familial expectations and personal desires. The tension simmers just below the surface, as Augustus prepares to unveil a grand cake shaped like Agrippa\'s warship and announces the arrival of Aristarchus, an orator from Athens, stirring a conflict of opinions that reveals the deep rifts within the imperial family. This scene serves as a microcosm of the larger power struggles at play in Rome, showcasing the interplay of ambition, rivalry, and the fragility of loyalty amidst the grand spectacle of imperial celebration.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_banquet_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Augustus Prepares the Banquet',
        e.description = 'As the banquet unfolds, Augustus commands Thallus to ensure the guests are well fed, emphasizing the importance of hospitality. His light-hearted banter about sparing them the leftovers reveals his desire to impress and maintain authority.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Excellent! Excellent! Thallus... See they're well taken care of, they were splendid, really.", "Don't give them the scraps and the leftovers."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'The Reveal of the Cake',
        e.description = 'Augustus expresses his excitement about the special cake shaped like Agrippa\'s ship, insisting on its immediate presentation despite Thallus\'s objections. His eagerness is met with mixed reactions from the guests, foreshadowing the underlying tensions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Bring in the cake.", "I want the family to see it."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Aristarchus Enters',
        e.description = 'As Aristarchus enters, he is welcomed by Augustus, who hopes for a stirring oration to commemorate Actium. The light-hearted tone is quickly overshadowed by Marcellus\'s dismissive attitude towards the significance of the battle.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Thallus! Caesar calls for silence!", "Oh, that explains it. Resting, are you?"]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'The Orator\'s Speech',
        e.description = 'Aristarchus begins his oration, recounting the tales of the Battle of Actium with poetic flourish, yet his words inadvertently highlight the differing views on the battle\'s significance, igniting a clash between Marcellus and Agrippa.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Your names and theirs, in history, will be forever intertwined.", "Ah, but words do not kill and curses sink no ships."]
    ;
MERGE (e:Event {uuid: 'event_4_5'})
    ON CREATE SET
        e.title = 'Tensions Rise',
        e.description = 'As Aristarchus\'s speech continues, Marcellus openly criticizes the glorification of Actium, leading to Agrippa\'s indignation. The lively discourse reveals the generational divide and the personal stakes involved, escalating the dinner\'s tension.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Well, one wine-soaked lover and his Egyptian whore.", "When you've actually done something lad, instead of just studied it, come back and talk to me again."]
    ;
MERGE (e:Event {uuid: 'event_4_6'})
    ON CREATE SET
        e.title = 'Augustus\'s Frustration',
        e.description = 'As the argument escalates, Augustus attempts to defuse the situation, signaling Thallus to manage the guests. His frustration with Marcellus\'s arrogance highlights the delicate balance of power and loyalty within the family.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["Now, now, now Marcellus. Get rid of them. Marcus...", "It's early."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'A Summons Interrupted',
        s.description = 'Night envelops Livia\'s private chambers, casting long shadows across the opulent furnishings. The room is a sanctuary of rich fabrics and hushed tones, usually a space for Livia to strategize and command in private.  A low-burning lamp casts a warm glow, highlighting the intimacy of the setting.  However, the tranquility is broken by a knock and an urgent message from Caesar himself.  The news that Agrippa is with Augustus injects a sudden tension into the air. This scene, though brief, serves as a sharp pivot, pulling Livia from her private sphere into the center of imperial affairs. It foreshadows an impending confrontation or critical discussion, disrupting whatever private matter Livia was attending to with Pylades and forcing her to address the urgent demands of the Emperor and the presence of her political rival.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Urgent Summons from Caesar',
        e.description = 'Pylades, Livia\'s servant, is in her chambers when a knock at the door abruptly interrupts their conversation. Pylades, responding to the knock, delivers a message from Caesar, indicating Augustus urgently requests Livia\'s presence. The urgency is underscored by the detail that Marcus Agrippa is currently with the Emperor, suggesting the matter is of considerable importance and likely politically charged. This unexpected summons immediately shifts the scene\'s tone from private consultation to one of impending imperial engagement.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PYLADES: [_knocking_] Yes? Yes?", "LIVIA: Caesar is asking for you lady.", "PYLADES: Yes, I'll come soon.", "LIVIA: He says at once. Marcus Vipsanius Agrippa is with him."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'The Tension of Departure',
        s.description = 'In the opulent yet tense atmosphere of the Private Audience Chamber of Augustus\'s palace, the tension is palpable as AUGUSTUS, seated regally, faces his loyal general, MARCUS AGRIPPA. Sunlight breaks through sheer curtains, illuminating the dust motes dancing in the air, symbolizing both clarity and the unrest swirling around them. LIVIA stands slightly behind Augustus, her calculating gaze observing the exchange with keen interest. The atmosphere is thick with unspoken conflict as AGRIPPA expresses his desire to leave Rome for Syria, presenting it as a strategic move while Augustus grapples with insecurities about his authority and the implications of Agrippa\'s departure. The scene unfolds with veiled accusations and reassurances, reflecting the intricate dynamics of friendship, ambition, and control. It is a moment that marks a significant turning point in their relationship, foreshadowing the brewing storm of rivalry and ambition that threatens to engulf the empire.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_private_audience_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Agrippa Requests to Leave Rome',
        e.description = 'AGRIPPA boldly asserts his need to leave Rome, framing it as an opportunity to serve the empire better in Syria. His words carry a double entendre, hinting at his ambition while dismissing any notion of discontent regarding MARCELLUS\'s newly appointed role. AUGUSTUS, visibly unsettled, challenges Agrippa\'s motives, revealing the cracks in their friendship and the underlying tension between loyalty and ambition.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I told you why. You don't need me here anymore.", "Let me be the judge of that."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Augustus\' Growing Paranoia',
        e.description = 'AUGUSTUS\'s frustration boils over as he questions AGRIPPA directly about his feelings towards MARCELLUS\'s rise in the political hierarchy. AGRIPPA vehemently denies any animosity, claiming fondness for the young man, which only serves to deepen AUGUSTUS\'s suspicion. This exchange highlights the delicate balance of power in their relationship, as AGRIPPA tries to maintain his standing while subtly asserting his influence.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh no, don't say that to me. If there's one man been straight with you, that man is Marcus Vipsanius Agrippa.", "If you've advanced him a little ahead of his years, well that's only natural too."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Livia\'s Subtle Manipulations',
        e.description = 'LIVIA interjects with a calm but pointed suggestion that AUGUSTUS should recall AGRIPPA when necessary, presenting it as a matter of strategy. Her words carry a hidden threat, emphasizing the impermanence of AGRIPPA\'s loyalty and the potential dangers of his departure. AUGUSTUS\'s refusal to heed her advice signals the growing divide in their partnership, revealing the complexities of ambition and control at play within the imperial family.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Give him four or five months then call him back.", "No! I know what I'm doing."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'The Departure and Aftermath',
        e.description = 'AGRIPPA exits the chamber, leaving behind a charged atmosphere. AUGUSTUS, now alone with LIVIA, expresses his simmering anger and frustration at Agrippa\'s audacity, revealing his insecurities about his authority. LIVIA\'s cold observation that Agrippa sees himself as Augustus\'s successor crystallizes the tension in their relationship and foreshadows the impending conflict over succession and power dynamics within the court.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Damn him. Who does he think he is?", "We know whom he thinks he is. Your successor."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'A Frosty Farewell and Maternal Ambition',
        s.description = 'In the formal and austere Private Audience Chamber of the Palace, Augustus delivers a perfunctory and cold send-off to Tiberius, who is departing to lead troops in Germany. The Emperor emphasizes the need for good generals but offers no personal warmth, betraying a clear emotional distance from his stepson. Once Augustus abruptly exits, Tiberius and Livia remain alone. Tiberius voices his perennial complaint of feeling unloved by Augustus. Livia, ever pragmatic and ambitious, dismisses his self-pity, launching into a calculated reassurance steeped in her own long-term strategy. She invokes the tale of the prophetic chickens from Tiberius\'s birth, underscoring the virtue of patience and strategic waiting. Livia reveals her unwavering ambition for Tiberius, urging him to focus on military success in the Rhine and surpass his rivals, particularly Marcellus and Agrippa, in the subtle but deadly game for imperial succession. This scene highlights the frigid dynamic between Augustus and Tiberius while showcasing Livia’s masterful manipulation and long-range planning, setting the stage for future power plays within the imperial family and foreshadowing the looming threat to Marcellus.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_private_audience_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'A Brusque Send-Off',
        e.description = 'Augustus summons Tiberius into the Private Audience Chamber. In a curt and impersonal manner, he gives Tiberius leave to depart for Germany, where he is to command troops. Augustus stresses the importance of strong generals for the empire\'s stability but offers no genuine paternal affection, instructing Tiberius to send reports and then swiftly dismissing him, eager to return to his many imperial duties.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: Ah, Tiberius. You're off to join our troops in Germany?", "TIBERIUS: Yes Caesar.", "AUGUSTUS: Yes, well I'm sure you'll do well for us. And remember that we need good generals. The empire won't hold together without. Now, write to me, tell me all what's going on. I like to have views from all sides. It helps me to make up my mind about things. Yes. And now I have things to do. Yes, yes, many things. Well, the best of luck go with you and all the muses..."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Tiberius Feels Unloved',
        e.description = 'Following Augustus\'s abrupt departure, Tiberius expresses his long-held resentment to Livia. He remarks on the futility of a warmer farewell, stating plainly that Augustus dislikes him. This starkly reveals the emotional chasm between stepson and stepfather and Tiberius\'s acute awareness of Augustus\'s coldness towards him.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: I could have saved myself the trouble.", "LIVIA: Oh, you're so keen to save yourself trouble. Did that cost you so much - a hail and farewell?", "TIBERIUS: He doesn't like me."]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Livia\'s Chicken Prophecy',
        e.description = 'Livia dismisses Tiberius\'s self-pity with a sharp retort and pivots to a familiar strategy of reassurance and ambition. She recounts the story of the \'prophetic chickens\' from Tiberius\'s birth – a tale meant to illustrate destiny and favorable omens. She uses this anecdote to instill patience in Tiberius, mirroring her own calculated approach to power by recounting her strategic marriage to Augustus after recognizing the shift towards a one-man rule.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: Well. We can't all be lovable, though we can all try a little harder.", "TIBERIUS: Well, it's my nature and I can't change it now.", "LIVIA: And wouldn't if you could, I suspect. You've a mighty high opinion of yourself on the equite didn't you.", "TIBERIUS: No wonder you didn't transfer your hopes to my brother.", "LIVIA: I might have done that long ago, if he didn't share the same idiotic hopes your father had of the return of the Republic. Besides, I took the auspices when you were born and they were very favorable.", "TIBERIUS: Oh, not that old chicken story again.", "LIVIA: You may sneer all you like, but I marked a Zodiac on the floor of the hen-house and a chicken came down and rested on your birth sign. I took its egg and warmed it in my hands and it hatched - a young cock chick, and it already had a fine comb on its head... You haven't much patience, have you? You want everything at once. Twenty years ago, Augustus ruled with Mark Antony, but I could see that wouldn't last - I could see that soon one man would be king. So I divorced your father and married Augustus and waited. Now where would I be now if I'd wanted everything at once, eh? And by the same token where would you be?"]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'A Mother\'s Ambition for Dominion',
        e.description = 'Livia explicitly lays out her ambitious vision for Tiberius\'s future, contrasting his long-term prospects favorably against those of Marcellus and Agrippa. She urges him to be patient, to kiss her in farewell, and to focus on achieving military success in the Rhine. She emphasizes the need for him to outshine his rivals, particularly his brother, who is currently gaining glory in Illyricum. This reveals her strategic blueprint for Tiberius’s ascent – one built on calculated patience, military achievement, and surpassing all competitors in the quest for power.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["LIVIA: You are my son and I am Augustus' wife - that's where you are. And in the long run, that's better than being anybody else, even Marcellus or Marcus Agrippa... And, Now you may kiss me and take your leave... Remember my prophetic chickens and have patience, hmmm. Do well on the Rhine. Your brother is covering himself with glory in Illyricum. We mustn't fall behind.", "TIBERIUS: Well, have I ever?", "LIVIA: No. When it comes to the less imaginative arts, you are certainly to be relied upon."]
    ;
MERGE (e:Event {uuid: 'event_7_5'})
    ON CREATE SET
        e.title = 'Foreshadowing Marcellus\'s End',
        e.description = 'As Tiberius departs, Claudius\'s voiceover concludes the scene with a chillingly direct statement, revealing that Livia\'s thoughts are now increasingly focused on \'the removal of Marcellus.\' This voiceover serves as dramatic irony, providing the audience with insight into Livia’s deadly intentions and setting the stage for the next phase of her plan to secure Tiberius\'s path to imperial power by eliminating key rivals.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CLAUDIUS (V.O.) And now my grandmother's mind turned more and more towards the removal of Marcellus."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Threads of Ambition',
        s.description = 'In the cozy yet tension-filled sitting room of the Claudian Villa, sunlight spills through sheer curtains, casting a soft glow on the figures within. Livia, imperious and sharp-witted, sits near a loom, while young Antonia, eager to please, weaves diligently, her hands deftly working the threads. Octavia observes them with a weary expression, burdened by the weight of her past. Nearby, the youthful Marcellus and Julia lounge, exchanging banter that masks deeper currents of ambition and rivalry. As Augustus enters, beaming with paternal pride, the atmosphere shifts, revealing the delicate dynamics at play. The conversation turns to the oppressive noise of the streets, echoing the chaos simmering beyond the villa\'s walls, while Marcellus outlines his ambitious plans for the upcoming games. Livia’s sharp retorts and Julia’s subtle jabs add layers of tension to the scene, hinting at their unfulfilled desires and the relentless pursuit of power that defines their lives, interwoven with familial bonds and unspoken resentments.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudian_villa_sitting_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Antonia Weaves for Augustus',
        e.description = 'Antonia, eager to impress, mentions that she is weaving for Augustus, provoking Livia\'s sharp response about Augustus\'s already ample wardrobe. The exchange highlights the competitive atmosphere among the women, with Livia\'s imperious nature at play.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Who've you been weaving that for?", "For Uncle.", "He's got enough cloth upstairs to outfit the army."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'Augustus Celebrates Antonia\'s Work',
        e.description = 'Augustus enters, beaming as he examines Antonia\'s weaving, praising her talent. This moment emphasizes his affection for family while showcasing the tension between Livia\'s ambitions and the softer familial bonds within the household.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Look at this little creature. Now, you tell me what it is?", "She's very pretty. She looks like her father."]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Octavia\'s Concern for the Noise',
        e.description = 'Octavia expresses her discomfort with the noise from the streets, indicating a deeper worry about the unrest brewing outside the villa. Marcellus’s dismissive response reveals his casual attitude toward the chaos, highlighting a generational divide in their perspectives.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["There seems to be so much noise in the streets at night. Can't we do something about it?", "Well, the traffic must move sometime."]
    ;
MERGE (e:Event {uuid: 'event_8_4'})
    ON CREATE SET
        e.title = 'Julia\'s Discontent with Rome',
        e.description = 'Julia laments the influx of people into Rome, expressing her belief that the city has become unbearable. This moment underscores her discontent with the current state of affairs and foreshadows her rebellious spirit. Marcellus defends the newcomers, revealing his attachment to the vitality they bring to the city.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["There's too many people in Rome. They keep on coming in and coming in from everywhere.", "But they're the life blood of the city Julia. They make Rome what it is."]
    ;
MERGE (e:Event {uuid: 'event_8_5'})
    ON CREATE SET
        e.title = 'MARCELLUS\'s Ambitious Games Proposal',
        e.description = 'Marcellus shares his grand plans for the upcoming games to celebrate his new position as City Magistrate, revealing his desire for a spectacular celebration. His enthusiasm contrasts sharply with the more dangerous realities of their political world, highlighting youthful ambition clashing with the weight of responsibility.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["I want to do something new.", "I want to tent in all the theatres and hang them with tapestries."]
    ;
MERGE (e:Event {uuid: 'event_8_6'})
    ON CREATE SET
        e.title = 'Financial Concerns Arise',
        e.description = 'As Marcellus outlines his ambitious plans, Augustus raises concerns over the financial implications, highlighting the tension between grand ideas and the practical realities of governance. Octavia\'s interjection emphasizes her role in supporting her son\'s ambitions, showcasing the intertwined relationships within the family.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["And who's going to pay for all this?", "I am, for part. And so are you."]
    ;
MERGE (e:Event {uuid: 'event_8_7'})
    ON CREATE SET
        e.title = 'Julia\'s Subtle Discontent',
        e.description = 'Julia observes the dynamics around her with a subtle expression, hinting at her awareness of the underlying tensions and ambitions. Her comment about Marcellus\'s charm reveals her complex feelings about his popularity and the competition within the family.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["People are always falling over themselves to do things for him."]
    ;
MERGE (e:Event {uuid: 'event_8_8'})
    ON CREATE SET
        e.title = 'Livia\'s Insight into Marcellus\'s Popularity',
        e.description = 'Livia\'s probing question about Julia\'s feelings toward Marcellus underscores the political stakes of their relationship, revealing Livia\'s awareness of the potential implications of their union. Julia\'s retort about the lack of children raises the specter of succession, further complicating their discussions.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["With you too?", "Why do you ask?"]
    ;
MERGE (e:Event {uuid: 'event_8_9'})
    ON CREATE SET
        e.title = 'Recollection of Childhood Memories',
        e.description = 'Livia reminisces about Julia and Tiberius\'s childhood, evoking a sense of nostalgia that contrasts with the present political tensions. This moment deepens the familial bonds while simultaneously hinting at the complexities of their future relationships.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["You know, when I first married your father, you were a little girl and Tiberius was a little boy and you used to play together. Do you remember that?"]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Triumphant Entrance at the Coliseum',
        s.description = 'The Roman Coliseum pulsates with the energy of a vast crowd, their collective roar a physical force. Augustus and Livia are positioned in the imperial box, a stark contrast in demeanor; Augustus visibly restless, impatient for the spectacle to begin, while Livia remains detached, immersed in state correspondence even amidst the public games. The atmosphere crackles with anticipation, heightened by Augustus\'s eagerness for Marcellus\'s arrival and the promised exotic beast, a rhinoceros.  This scene serves to underscore Marcellus\'s immense popularity with the Roman populace, a fact that both pleases and subtly unsettles Augustus. Livia\'s pragmatic focus on governance, even during leisure, highlights her ever-present ambition and control. The arrival of Marcellus, Julia, and Octavia is met with a thunderous ovation, solidifying Marcellus’s image as a celebrated figure and momentarily eclipsing Augustus’s own imperial presence in the public eye. The scene is charged with the themes of public image, the performance of power, and the undercurrents of familial and political dynamics within the seemingly celebratory facade of the games.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_coliseum'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Imperial Impatience and Pragmatic Duty',
        e.description = 'Augustus, visibly agitated by Marcellus\'s tardiness, expresses his desire to begin the games, highlighting his concern for appearances and punctuality, mirroring his uncle Julius Caesar\'s habits. He is distracted and wishes to be entertained. Livia, in stark contrast, calmly attends to urgent state matters, reading letters and petitions, demonstrating her unwavering commitment to governance even during public spectacles. Augustus, disapproving of Livia\'s focus on paperwork during the games, remarks on the optics, revealing his sensitivity to public perception and historical precedent, referencing Julius Caesar\'s unpopularity for similar behavior. Livia, dismissive of Augustus\'s concerns, continues her work, underscoring her pragmatic nature and prioritization of duty over spectacle. This exchange establishes a subtle tension between the imperial couple, highlighting their differing approaches to leadership and public image.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["AUGUSTUS: I wish to await the arrival of Marcellus... My dear, you're not going to read letters and petitions during the performance?", "LIVIA: I see no reason to sit here doing nothing while we wait for the games to begin.", "AUGUSTUS: Oh, it looks so bad.", "LIVIA: Shish. These are urgent stop fussing.", "AUGUSTUS: My great uncle JULIUS used to do it and the crowd never liked it..."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Anticipation of the Exotic Beast',
        e.description = 'Augustus shifts his focus from impatience to excitement, teasing the spectacle Marcellus has arranged, specifically mentioning a \'rhinoceros,\' an exotic and unfamiliar creature to the Romans. He attempts to pique Livia\'s interest by describing its unique feature – \'a horn on its nose.\' Livia, however, responds with sardonic wit, referencing Scipio\'s wife and suggesting a more practical, albeit darkly humorous, use for such a horn. This exchange reveals Augustus\'s childlike enthusiasm for spectacle and Livia\'s sharp, often cynical, perspective, even towards the promised entertainment. It also subtly foreshadows the potentially dangerous and unpredictable nature of the games themselves, and the exotic and potentially violent displays Marcellus is orchestrating to gain further public acclaim.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: Oh... Wait till you see what Marcellus has arranged. He's got a rhinoceros.", "LIVIA: What's that?", "AUGUSTUS: Well, it's an extraordinary beast. It's got a horn on its nose.", "LIVIA: So has Scipio's wife. He could have used her. "]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Marcellus\'s Triumphant Arrival and Acclamation',
        e.description = 'Marcellus, accompanied by Julia and Octavia, makes a grand entrance into the imperial box at the Coliseum. Their arrival is met with a \'thunderous ovation\' from the massive crowd, signifying Marcellus\'s immense popularity and public adoration. Augustus, acknowledging the enthusiastic reception, greets Marcellus and the others, emphasizing Marcellus\'s name in particular, almost as if to underscore his own awareness of his nephew\'s public appeal. He remarks to Livia, \'I told you he was popular,\' displaying a mixture of pride and perhaps a hint of underlying calculation regarding Marcellus\'s influence. Marcellus, basking in the crowd\'s adulation, immediately takes charge, declaring \'Let the Games begin!\' This moment solidifies Marcellus\'s image as a charismatic and beloved figure, capable of commanding the attention and affection of the Roman populace, a power that both Augustus and Livia are acutely aware of.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["AUGUSTUS: Ah, Marcellus. We've been waiting for you. Julia. Octavia... Marcellus!", "AUGUSTUS: I told you he was popular.", "MARCELLUS: Let the Games begin!"]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'A Tenuous Reunion',
        s.description = 'The scene unfolds in the dimly lit hallway of the Claudian Villa, a space imbued with an air of tension and unspoken worries. Augustus strides purposefully, his brow furrowed with concern as he approaches Livia, who appears unwell, her demeanor heavy with the weight of hidden schemes. The contrast between Augustus\'s robust presence and Livia\'s frailty underscores the political dynamics at play. Augustus, eager to return to the splendid Games, dismisses his wife\'s ailments with a mix of paternal concern and latent arrogance. Their exchange reveals layers of tension: Livia\'s subtle manipulation of Augustus\'s departure to secure control, and the tension between her feigned weakness and his obliviousness to the burgeoning power struggle. The dialogue reveals the cracks in their relationship, as Augustus’s conviction in Marcellus’s success is met with Livia’s muted acknowledgment, hinting at her deeper ambitions. The scene encapsulates the fragile balance of power within the imperial family, foreshadowing the chaos to come as Augustus prepares to journey to the Eastern provinces, unaware of the treachery festering in his absence.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudian_villa_hallway'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Augustus Checks on Livia',
        e.description = 'Augustus walks down the hallway, visibly concerned about Livia’s wellbeing. He finds her looking unwell and inquires if she is alright. Despite her claim of having a headache, Augustus attempts to reassure her about the Games, showcasing his preoccupation with public affairs over personal ones.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Are you all right?", "I have a headache.", "What a shame. The games are wonderful. Can't you come back?"]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'AUGUSTUS Dismisses Worries',
        e.description = 'Augustus shifts the conversation to Marcellus\'s success, attempting to reassure Livia that she has nothing to worry about in his absence. His comments reveal both his confidence in Marcellus and his obliviousness to the underlying tensions, as Livia’s response is a subdued acknowledgment of the situation, emphasizing her hidden machinations and ambitions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Marcellus is a huge success.", "Yes, well... I'll go back to the Games..."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Livia Questions Augustus\'s Plans',
        e.description = 'Inquiring about the duration of Augustus\'s trip to the Eastern provinces, Livia subtly probes for information, revealing her strategic mind as she prepares for the power vacuum his absence creates. Augustus\'s nonchalant dismissal of Agrippa fortifies her resolve to manipulate the political landscape in her favor during his absence.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["How long will you be gone?", "About four or five months. I haven't been to the Eastern provinces for years, it's time I did.", "Will you see Agrippa?"]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'Augustus Dismisses Agrippa',
        e.description = 'Augustus asserts his independence by stating he does not need Agrippa, revealing his growing confidence in his ability to manage the empire without his former ally. This moment not only emphasizes Augustus’s arrogance but also highlights the precariousness of alliances in the imperial court, setting the stage for future conflicts as Livia’s ambitions remain unchallenged in his absence.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["No, why should I? He never got any further than Lesbos.", "He can manage without him now. He can see that. Now let him stew. I don't need him..."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Veiled Inquiries in the Empress\'s Chambers',
        s.description = 'Sunlight filters into Livia\'s private chambers, illuminating the opulent yet subtly menacing space. Rich fabrics and ornate decorations speak of imperial power, but the atmosphere is far from relaxed. Livia, draped in regal attire, is in control, her demeanor outwardly composed but her eyes sharp and probing. She engages her loyal servant Pylades in seemingly casual conversation, yet beneath the surface of polite inquiries lies a calculated interrogation. The air is thick with unspoken tension as Livia subtly probes for information about Marcellus\'s condition, her questions laced with an undercurrent of veiled suspicion and strategic interest. This scene serves to highlight Livia\'s manipulative nature and her keen awareness of events within the palace, even as she maintains a facade of detached Empress. It underscores the theme of hidden agendas within the imperial court, where even simple questions can carry significant weight and consequence.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Empress\'s Inquiry for Imperial News',
        e.description = 'Pylades enters Livia\'s chambers, and she immediately seeks information about correspondence from Augustus. This seemingly innocuous question establishes Livia\'s constant vigilance and her need to stay informed of all imperial affairs. It subtly hints at her desire to control the flow of information and her position at the heart of the empire\'s workings.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["PYLADES: Yes...", "LIVIA: Are there any letters from the Emperor?"]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Subtle Summons and Citizen Role Pretext',
        e.description = 'Livia, feigning interest in civic duties, instructs Pylades to invite Marcellus to a meeting before dinner. She uses the guise of discussing the \'citizens role\' as a pretext for their encounter, masking her true intentions. This reveals Livia\'s manipulative tactics – using official business as a cover for personal agendas. It also suggests she desires a private audience with Marcellus, hinting at a need to assess or influence him directly.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["LIVIA: Ah, now when you take that to him, ask him would he be good enough to come and see me before dinner? There are some names on this citizens role I want to discuss."]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Revelation of Marcellus\'s Sudden Illness and Isolation',
        e.description = 'Pylades delivers news that Marcellus is already in possession of a letter, but more significantly, reveals that Marcellus is confined to bed and \'seeing no one\' due to a \'chill on the stomach\'. This information is crucial. Marcellus\'s sudden illness and isolation raise immediate red flags, especially given the context of political intrigue and Livia\'s known ambitions. Pylades\'s added detail about Marcellus being alone, with his wife and mother absent, further emphasizes his vulnerability and Livia\'s potential opportunity. The \'chill on the stomach\' is presented as a trivial ailment, yet the scene\'s subtext suggests something far more sinister may be at play.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["PYLADES: He already has the letter, but it seems my lord Marcellus is in bed and has been seeing no one today.", "LIVIA: Oh, what's the matter with him?", "PYLADES: Oh, a chill on the stomach that's all... It's a pity his wife and mother went away."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'A Winter\'s Chill',
        s.description = 'The scene unfolds in the dimly lit chambers of Marcellus, where shadows dance ominously against the walls. The air is thick with tension as Musa, the concerned physician, hovers by the bedside of the pale and slick Marcellus, drenched in sweat from his fever. Livia enters, her demeanor a perfect mask of concern, but her eyes betray a calculating nature as she scrutinizes Marcellus. The conversation is filled with a façade of familial affection, yet beneath it lies a palpable undercurrent of manipulation. Livia\'s assurances and promises of care reveal her intent to control the narrative of Marcellus\'s illness, while Musa\'s frantic insistence on the worsening symptoms foreshadows a dire outcome. The scene encapsulates the themes of deception and the brutal reality of power plays within the imperial family, highlighting the fragility of life amidst the ruthless ambitions of Rome.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_marcellus_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Musa Tends to Marcellus',
        e.description = 'In a tense atmosphere, Musa tends to the feverish Marcellus, who is adamant about rising from bed despite his worsening state. Musa expresses doubt about Marcellus\'s health and urges him to stay put, setting up the conflict between the physician\'s professional concern and Marcellus\'s stubbornness.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["If you get up now, you'll be in bed all tomorrow, I promise you.", "It's nothing, Lady. It's a summer chill that's got on the stomach. I've worked through worse than this."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Livia\'s Deceptive Care',
        e.description = 'Livia enters and immediately begins to play the role of the concerned caregiver, insisting on nursing Marcellus back to health. Her cool hand on his forehead and declarations about her prior nursing of Augustus reveal her underlying ambition to control Marcellus\'s fate, while simultaneously masking her true intentions behind a guise of maternal concern.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["I shall move my room next to yours and I shall prepare all your food myself.", "I'd never forgive myself if anything happened to you."]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Musa\'s Alarm',
        e.description = 'Musa bursts into the scene, visibly agitated about Marcellus\'s deteriorating condition, insisting that they must notify his mother and wife. Livia quickly dismisses Musa\'s concerns, revealing her manipulative nature as she emphasizes that things must get worse before they get better, suggesting a sinister layer to her care.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["We ought to inform his wife and his mother. They should be here.", "No. You exaggerate. Things have to get worse before they get better."]
    ;
MERGE (e:Event {uuid: 'event_12_4'})
    ON CREATE SET
        e.title = 'The Revelation of Symptoms',
        e.description = 'Livia\'s demeanor shifts as Musa mentions Marcellus bringing up green slime, a sign of serious illness. Livia\'s eyes widen in surprise, yet she attempts to maintain her composure, suggesting a possible interest in the chaos that could follow Marcellus\'s death. This moment elevates the tension and foreshadows the potential for manipulation and tragedy.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["He's bringing up green slime. I've never seen anything like it.", "Green, you say?"]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Whispers of Mortality, Screams of Fate',
        s.description = 'In the opulent yet private confines of Livia\'s study, a tense conversation unfolds between Livia and Tiberius. Sunlight filters into the richly decorated room, yet the atmosphere is heavy with unspoken anxieties. Livia, ever composed, subtly probes Tiberius\'s feelings towards Julia while revealing Marcellus\'s grave condition, hinting at the shifting sands of succession. Tiberius, visibly uncomfortable in the courtly setting, expresses his preference for the straightforward life of a soldier and his unwavering devotion to his wife, Vipsania, resisting his mother\'s manipulative undertones. The air crackles with unspoken agendas and familial tensions as they navigate the delicate topic of Marcellus\'s impending death and its political ramifications. Suddenly, Julia\'s piercing scream from offstage shatters the strained calm, violently announcing the death of Marcellus and plunging the room into a stark new reality. The scene abruptly shifts from hushed political maneuvering to the raw, immediate aftermath of a dynastic earthquake, leaving Tiberius stunned and Livia instantly seizing control amidst the emotional wreckage.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Veiled Discussion of Marcellus\'s Decline and Political Maneuvering',
        e.description = 'Livia and Tiberius engage in a carefully orchestrated conversation about Marcellus\'s failing health and the ensuing political landscape. Livia, with calculated nonchalance, informs Tiberius of Marcellus\'s grave condition, feigning concern while subtly assessing Tiberius\'s ambitions and availability. She probes his interest in Julia, hinting at potential dynastic arrangements, showcasing her ever-present manipulative nature. Tiberius, resistant to courtly games, asserts his contentment with military life and his steadfast love for Vipsania, rebuffing his mother\'s veiled suggestions and expressing discomfort with her political maneuvering. The dialogue is laden with subtext, revealing Livia\'s strategic mind at work and Tiberius\'s wary defensiveness in the face of her machinations.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: You're thinner... But you look better. The life of the legions agrees with you.", "TIBERIUS: Have I ever complained about the life of the legions? Frankly, I'd be as soon be in camp on the Rhine as here.", "LIVIA: I had to call you back. Augustus is still in Greece touring the provinces and Marcellus...", "TIBERIUS: How is he?", "LIVIA: I think he may die.", "TIBERIUS: Frankly, I wouldn't have thought you'd care whether he lived or died.", "LIVIA: Oh, I care very much whether he lives or dies.", "LIVIA: Tell me... What do you think of Julia?", "TIBERIUS: Nothing. Why?", "LIVIA: Nobody could accuse you of being devious. She thinks very well of you.", "TIBERIUS: Mother, I'm a happily married man. Julia doesn't interest me. She wouldn't interest me if you hung her naked from the ceiling above my bed.", "LIVIA: She might even do that if I asked her!", "TIBERIUS: Well, don't ask me to divorce Vipsania because I won't do it.", "LIVIA: Oh, what a lover we have here! Did you bring back a pocketful of poems from the Rhine?", "TIBERIUS: You may scoff all you like. Vipsania's the only thing in the world that means anything to me.", "LIVIA: I always thought a boy's mother meant something.", "TIBERIUS: Anyway, where does all this get us? There's not only Marcellus, there's Agrippa too, and Augustus prefers both of them to me."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Marcellus\'s Death Announced by Julia\'s Piercing Scream',
        e.description = 'The tense atmosphere is abruptly shattered by Julia\'s agonizing scream, echoing from offstage and reverberating through Livia\'s study. The scream violently punctuates the hushed conversation and confirms the unspoken dread hanging in the air – Marcellus has died. Julia\'s cries of grief, raw and unrestrained, fill the silence, conveying the immediate shock and emotional devastation of the event. Livia, ever pragmatic, immediately shifts from veiled political maneuvering to decisive action, silencing Julia\'s emotional outburst and directing Tiberius to \'take care of Julia\', though her primary concern is clearly the political fallout and the urgent need to inform Augustus. The scream serves as a brutal turning point, instantly altering the dynastic landscape and propelling the narrative into the chaotic aftermath of Marcellus\'s demise.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["JULIA (O.S.): No! No!", "TIBERIUS: Ye gods! What's that?", "JULIA (O.S.) No!.", "LIVIA: It sounds as if there is now only Agrippa.", "JULIA (O.S.) He's dead!", "LIVIA: Julia!", "JULIA (O.S.) He's dead!", "LIVIA: Julia! Julia! Julia! Control yourself! That's no way for a Roman woman to behave!", "JULIA (O.S.) But he's, he's, he's dead. He gave a great cry and, and, and then he rolled over and then, and then he fell off the bed. He's, he's dead!", "LIVIA: Yes. Come along.", "LIVIA: Tiberius, take care of Julia. This is very grave. We must send to Augustus at once. Tiberius! I said take care of Julia!", "JULIA (O.S.) Oh, no!"]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'The Death of Marcellus',
        s.description = 'In the dim light of Marcellus\'s chambers, the atmosphere is thick with grief and tension. Musa, the physician, stands beside the bed, wringing his hands in despair as he confronts the lifeless body of Marcellus, a victim of tragic circumstance. Octavia, his mother, is perched on the edge of the bed, her face etched with sorrow and disbelief, confirming the finality of her son\'s death. Livia, positioned nearby, feigns concern masked by her calculating nature, worried less for Marcellus than for the implications of his demise on Augustus\'s heart. Musa\'s frantic assertions about food poisoning hang in the air, while Livia expertly manipulates the narrative, dismissing the need for an inquiry into the circumstances of the death, revealing her true nature as a master of deception. As Octavia exits, Musa\'s hesitance clashes with Livia\'s cold resolve, culminating in a chilling interaction where her authority and control over the situation become evident, laying the groundwork for the ensuing chaos in Rome.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_marcellus_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Musa\'s Despair',
        e.description = 'Musa stands beside the bed, wringing his hands in despair over the death of Marcellus. He laments the futility of his efforts, insisting that he did everything possible to save him, revealing the helplessness that accompanies loss in the face of imperial expectations.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I did everything I could. Everything. I did everything I could. Everything I did for Augustus I did for him, but it made no difference."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Livia\'s Calculated Concern',
        e.description = 'Livia, with a facade of concern, questions the certainty of Marcellus\'s death, revealing her manipulative nature. She expresses false sympathy for Augustus, her tone laced with the coldness of ambition as she subtly shifts the focus away from genuine grief to the implications of power.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["He's dead? You're sure he's dead?", "Poor Augustus. His heart will break."]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'Musa Attributes the Cause',
        e.description = 'Musa, still in shock, suggests that food poisoning may be the cause of death, inadvertently casting doubt on the circumstances. His remarks highlight the sweltering conditions of summer and the precariousness of life, building tension as Livia capitalizes on his words.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["It must have been food poisoning.", "Well. The summer's been so hot. These things happen."]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Livia Dismisses Inquiry',
        e.description = 'Livia, with feigned innocence, insists that there is no need for an inquest into Marcellus\'s death, utilizing her influence to suppress any investigation. Her cold manipulation of the situation becomes clear as she asserts control over the narrative of Marcellus\'s demise.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["No. There's no need of that. We know what he died of.", "Food poisoning! Well, you said so yourself!"]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'Musa\'s Doubt',
        e.description = 'Musa expresses uncertainty about the cause of death, a flicker of doubt in the otherwise controlled environment. This moment underscores the conflict between Livia\'s manipulation and Musa\'s ethical hesitations, enhancing the atmosphere of tension as Livia cleverly counters his doubts.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Yes. I couldn't swear to it.", "No... but I could."]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'Rome in Uproar',
        s.description = 'The Roman streets are a maelstrom of public fury. A vast, seething mob has taken over the narrow thoroughfares, their collective roar echoing off the ancient buildings. Statues of past heroes are dragged from their pedestals and toppled, their marble forms shattering on the paving stones. Shopfronts are besieged, windows exploding outwards in showers of glass as the enraged populace vents its grief and anger. The atmosphere is charged with volatile emotion, a city teetering on the brink of anarchy. This scene showcases the immediate aftermath of Marcellus\'s death, revealing the fragility of Roman order and the raw power of public sentiment when unleashed. The thematic undercurrents of chaos versus control and the destructive force of grief are palpable as the city descends into violent unrest.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_streets'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Mob Fury Unleashed',
        e.description = 'A massive crowd of Romans, consumed by grief and rage over Marcellus\'s death, erupts in a violent display of public disorder. They surge through the streets, a destructive wave of human emotion. Statues, once symbols of Roman pride and authority, are pulled down and defaced, their fall signifying a deeper societal instability. The sounds of smashing glass and angry shouts fill the air, creating a cacophony of urban breakdown. This event dramatically illustrates the immediate societal impact of Marcellus\'s demise, revealing how quickly public order can dissolve and highlighting the volatile undercurrents simmering beneath the surface of imperial Rome. The mob\'s actions symbolize a rejection of the established order and a raw, visceral expression of collective sorrow and anger, threatening to plunge the city into complete chaos.',
        e.sequence_within_scene = 1,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'The Calm Before the Storm',
        s.description = 'In the dimly lit sanctuary of Livia\'s Private Chambers, tensions thicken like the air before a storm. Livia stands poised and commanding, her demeanor sharp and unyielding as she faces Tiberius, who appears torn, a reflection of the internal conflict raging within him. The room, adorned with decadent decor, echoes with the muffled sounds of chaos from the riots outside, intensifying the atmosphere of unease. Livia\'s words flow with sinister calm as she orchestrates the unfolding tragedy, delivering news of Marcellus\'s untimely death. Her calculated tone and the mention of food poisoning carry a double meaning, hinting at her deeper ambitions while manipulating the emotions of those around her. This scene encapsulates the intricate web of family loyalty and political ambition, laying bare the ruthless machinations that govern the imperial family. It foreshadows the turmoil to come, as Livia’s dark intentions cast a long shadow over the fate of Rome.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Livia Orders Tiberius to Comfort Julia',
        e.description = 'Livia, exuding an air of authority, instructs Tiberius to take Julia to her room and stay with her. Her command is layered with a protective façade, masking her true intentions as she seeks to solidify her control over her son and reinforce the family dynamic amidst emerging chaos. Tiberius\'s conflict is palpable, revealing his struggle between duty to his mother and the fear of the growing unrest outside.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Tiberius, take Julia to her room and comfort her... Stay with her a while... I'll send word to your wife what keeps you..."]
    ;
MERGE (e:Event {uuid: 'event_16_2'})
    ON CREATE SET
        e.title = 'Livia Reveals Marcellus\'s Death',
        e.description = 'Livia continues with a chilling calm, revealing to Tiberius that Marcellus, Augustus\'s adopted son, has died unexpectedly. She presents the news as a tragic misfortune, all the while subtly framing the narrative to her advantage. Her mention of food poisoning as the suspected cause serves as a veiled suggestion of vulnerability among the elite, manipulating the situation to her benefit. The dialogue underscores her cold calculation and the ominous tone of her words, as she plays on the emotions of her son amid the brewing chaos.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["My dear Augustus... a most unfortunate and tragic thing has happened... Marcellus, your adopted son has unaccountably died after a short illness. No one is certain of the cause, except that an attack of food poisoning is suspected... I must say that does seem to me the most likely explanation."]
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'Rome in Uproar',
        s.description = 'The Roman streets become a theater of chaos as an enraged mob surges through the city, their collective roar a deafening cry of grief and discontent over Marcellus\'s suspicious death. Buildings echo with the din of their fury, statues are toppled, and the very stones of Rome seem to tremble under the weight of their anger. Torches cast flickering shadows, illuminating faces contorted with rage and loss, as the mob demands a return to the Republic, their cries a direct challenge to the imperial order. The air is thick with the stench of overturned carts and the acrid smoke of hastily lit fires, a visual representation of the city\'s descent into turmoil. This scene is pivotal, revealing the raw, volatile underbelly of Roman society and the precariousness of Livia\'s carefully constructed power, underscoring the themes of chaos and control amidst the simmering discontent of the populace.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_streets'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Mob Fury Erupts in Roman Streets',
        e.description = 'The scene plunges into the heart of the Roman streets, now overrun by an angry mob. Fueled by grief and suspicion surrounding Marcellus\'s sudden demise, the populace has erupted in violent protest. Their collective outrage manifests as a destructive rampage, tearing through the city and demanding a return to the Republic. Claudius, observing from a distance or reflecting later, narrates the scene, emphasizing the depth of the public\'s fury and its direct challenge to Livia\'s authority and ambitions. This event marks a critical turning point, showcasing the immediate and chaotic repercussions of Marcellus\'s death and setting the stage for Livia\'s forceful response to regain control.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Rome erupted into fury. The suspicious death of Marcellus led to renewed demands for a return of the Republic, the last thing my grandmother wanted."]
    ;
MERGE (s:Scene {uuid: 'scene_18'})
    ON CREATE SET
        s.title = 'Livia\'s Defiance',
        s.description = 'In the shadowy confines of Livia\'s private chambers, tension hangs thick in the air like an impending storm. The room is dimly lit, adorned with opulent drapery that emphasizes the stark contrast of the chaos outside. Livia paces restlessly, her movements betraying a fierce determination to assert control over the spiraling situation. Tiberius stands rigidly by the window, his brow furrowed as he gazes at the mob wreaking havoc in the streets, a mix of concern and fear etched on his face. The cacophony of shouts and destruction filters through the walls, a visceral reminder of the power the populace holds. Livia\'s voice cuts through the tension, sharp and unwavering, urging Tiberius to take action against the rioters. Her dismissive disdain for his hesitations reveals her unyielding resolve, embodying her fearlessness and ambition. This scene serves as a pivotal moment of conflict between maternal authority and emerging power dynamics, highlighting Livia\'s willingness to confront the chaos head-on even as Tiberius grapples with the consequences of violence. The thematic undercurrents of ambition, manipulation, and the struggle for control against the backdrop of public unrest resonate deeply, foreshadowing the impending shifts in the balance of power.',
        s.scene_number = 18
    
    WITH s
    MATCH (l:Location {uuid: 'location_livias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_18_1'})
    ON CREATE SET
        e.title = 'Tiberius Reports the Chaos',
        e.description = 'Tiberius stands by the window, visibly tense, as he informs Livia about the chaos erupting outside. He describes the mob\'s rampage through the streets, their destruction of property and looting, and the inability of the City Watchmen to restore order. His concern reflects a growing fear of the consequences that may follow if the situation escalates further.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["They're rampaging through the streets, they're breaking the statutes, they're looting the shops. All the City Watchmen are out there dealing with them."]
    ;
MERGE (e:Event {uuid: 'event_18_2'})
    ON CREATE SET
        e.title = 'Livia Demands Action',
        e.description = 'Livia\'s frustration boils over as she dismisses Tiberius\'s concerns about drawing blood when confronting the mob. Her fierce defiance and refusal to be intimidated by the chaos outside reveal her character as a formidable player in the game of power. She orders the Guard to be turned out against the rioters, showcasing her willingness to take drastic measures to regain control, despite her son’s hesitations.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["They're no use! Turn the Guard out on them!", "Oh, you drooping lily! Do you want us all to be murdered in our beds? Well, go and talk to them, then."]
    ;
MERGE (e:Event {uuid: 'event_18_3'})
    ON CREATE SET
        e.title = 'Tiberius\'s Reluctance',
        e.description = 'Tiberius expresses his fear of the repercussions if blood is drawn during the conflict with the mob. His reluctance to engage directly reveals his internal struggle between loyalty to his mother and the potential consequences of her orders. This moment highlights the generational conflict between Tiberius and Livia and sets the stage for the clash of wills.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["If we draw blood, I won't answer for the consequences.", "Are you mad?"]
    ;
MERGE (e:Event {uuid: 'event_18_4'})
    ON CREATE SET
        e.title = 'Livia\'s Determination',
        e.description = 'Emboldened and undeterred, Livia sweeps past Tiberius, determined to confront the chaos head-on. Her actions illustrate her fierce character and refusal to cower in the face of danger. The interplay between mother and son reflects the broader themes of ambition, control, and the balance of power within the imperial family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = []
    ;
MERGE (s:Scene {uuid: 'scene_19'})
    ON CREATE SET
        s.title = 'Empress Quells the Riot',
        s.description = 'The Roman streets are in uproar, a dangerous mob incensed by the death of Marcellus.  Amidst the chaos, Livia strides directly into the heart of the riot, a figure of imperial authority undeterred by the volatile crowd. The air is thick with shouts and simmering rage, but as Livia appears, a stunned silence falls. She confronts the mob with imperious disdain, questioning their Roman identity and warning them of the dire consequences of their unrest – civil war, famine, and barbarian invasions. Her voice cuts through the tension, a sharp blade of command against the rabble\'s fury. Tiberius, trailing behind, appears deeply uncomfortable with his mother\'s audacious display, urging her to behave with more feminine decorum, a plea she dismisses with biting sarcasm. Livia, ever pragmatic, swiftly analyzes the situation, recognizing the need for a firm hand to restore order. She declares Agrippa\'s return essential, instructing Tiberius to deploy the Guards and resolving to write to Agrippa immediately, showcasing her decisive leadership in the face of public chaos, leaving Tiberius in her wake, overwhelmed and ineffective.',
        s.scene_number = 19
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_streets'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_19_1'})
    ON CREATE SET
        e.title = 'Livia Confronts the Mob',
        e.description = 'Emerging into the riotous Roman streets, Livia boldly steps into the throng of angry citizens. Her unexpected presence immediately commands attention, silencing the mob in stunned surprise. With unwavering authority, she challenges the crowd, questioning their Roman pride and painting a vivid picture of the horrors that await Rome should chaos prevail. She dismisses their republican yearnings as foolish and appeals to their fear of anarchy and external threats, effectively shaming them into silence with her sheer force of will.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: What do you want? A Republic? The Republic was all humbug! Do you want civil wars all over again? Do you want famine in the streets? Do you want Gauls and Huns knocking on your doors? You're all crying for the moon! Go on back to your homes and... Rabble! You call yourselves Romans? You wait till my husband gets home!"]
    ;
MERGE (e:Event {uuid: 'event_19_2'})
    ON CREATE SET
        e.title = 'Livia Orders Agrippa\'s Recall and the Deployment of Guards',
        e.description = 'Tiberius, flustered by Livia\'s uncharacteristic boldness in confronting the mob, pleads with her to act more conventionally \'womanly\'. Livia sharply rebuffs him, implying his inadequacy in handling the crisis.  Immediately pivoting to strategy, she declares that Agrippa must be recalled to Rome to quell the unrest, recognizing his unique ability to command respect from the populace. She instructs Tiberius to deploy the city guards to restore order and announces her intention to write to Augustus, demanding Agrippa\'s immediate return, showcasing her decisive leadership and strategic thinking in contrast to Tiberius\'s discomfort and ineffectiveness.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: I wish, just for once, you would behave like a normal woman!", "LIVIA: To be a normal woman you need normal men around you. Ahhh... We must get Agrippa back to Rome. He's the only one who speaks their language if you can call it that. Whatever Augustus thinks, he must patch up this quarrel and get Agrippa back at any price. I'm going to write to him at once. Meanwhile, order the Guards onto the streets!"]
    ;
MERGE (s:Scene {uuid: 'scene_20'})
    ON CREATE SET
        s.title = 'A Pact of Power',
        s.description = 'In the richly appointed study of Augustus, the atmosphere is thick with a mix of nostalgia and tension as the Emperor and Agrippa confront their past and present. Scrolls line the walls, with the map of the Roman Empire looming large, symbolizing the stakes of their reunion. Augustus\'s jovial facade contrasts sharply with Agrippa\'s underlying resentment over the past, particularly regarding Marcellus\'s disrespect. The dialogue flows as they navigate their complex friendship, revealing their intertwined fates and the need for unity amidst rising chaos. With Agrippa\'s potential return to Rome, the tension crescendos as he proposes an alliance through marriage to Julia, a bold move that could redefine their familial ties and political landscape, reflecting the intricate dance of power, loyalty, and ambition in the heart of Rome.',
        s.scene_number = 20
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_20_1'})
    ON CREATE SET
        e.title = 'Old Friends Reunite',
        e.description = 'Agrippa and Augustus engage in a heartfelt, yet tense reunion, reminiscing about their past and the rift that has formed due to their previous estrangement. Augustus expresses his desire to rekindle their friendship, even as Agrippa brings to light his grievances over the treatment he received during Marcellus\'s lifetime. The dialogue exposes the emotional undercurrents of their relationship, marked by both camaraderie and unresolved conflicts.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Marcus, there was never a time when you were out of my thoughts.", "Forgive me but it wasn't always obvious."]
    ;
MERGE (e:Event {uuid: 'event_20_2'})
    ON CREATE SET
        e.title = 'A Proposal to Bind Ties',
        e.description = 'As the conversation deepens, Agrippa suggests that the bond of friendship could be strengthened through familial ties, proposing to marry Augustus\'s daughter, Julia. This bold suggestion shifts the dynamics of their relationship, highlighting Agrippa\'s ambition and Augustus\'s surprise. The air thickens with the implications of such a union, positioning Agrippa not merely as a friend but as a potential son-in-law, which could redefine the power dynamics within the imperial family.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["To be related by blood and marriage as a public declaration of what we mean to each other.", "Why not? Don't tell me I'm not good enough for your family."]
    ;
MERGE (s:Scene {uuid: 'scene_21'})
    ON CREATE SET
        s.title = 'Imperial Fury: Livia\'s Outrage',
        s.description = 'Within the opulent yet private confines of Augustus\'s study, the air crackles with unspoken tension. Richly appointed with scrolls and imperial busts, the room, usually a space of quiet contemplation, now becomes the arena for a fierce domestic dispute.  Livia, pacing with barely suppressed rage, confronts Augustus. The soft glow of lamplight illuminates her furious expressions and sharp gestures as she questions his judgment. Augustus, seated and attempting to maintain his composure, responds with weary exasperation. The scene is thick with the emotional fallout from Agrippa\'s demand to marry Julia, revealing the deep rifts and strategic disagreements simmering beneath the surface of imperial harmony. It’s a moment of raw, unfiltered conflict that exposes the personal and political stakes intertwined within the imperial family, underscoring the thematic tension between control and chaos in their world.',
        s.scene_number = 21
    
    WITH s
    MATCH (l:Location {uuid: 'location_augustus_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_21_1'})
    ON CREATE SET
        e.title = 'Livia\'s Furious Questioning',
        e.description = 'Livia, barely containing her fury, demands to know why Augustus agreed to Agrippa\'s proposal to marry Julia. Her sharp, accusatory tone immediately sets the stage for a heated confrontation. She paces restlessly, her body language conveying a potent mix of disbelief and anger. This outburst reveals her immediate and visceral opposition to the marriage, highlighting her possessive nature and strategic mind at work.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVIA: Why? Why did you agree to it?"]
    ;
MERGE (e:Event {uuid: 'event_21_2'})
    ON CREATE SET
        e.title = 'Augustus Defends His Decision',
        e.description = 'Augustus, weary but firm, defends his decision by stating it was Agrippa\'s \'price\' for something unstated but clearly politically significant. He implies that agreeing to the marriage was a necessary concession, a calculated move in the game of power. His response suggests a pragmatic acceptance of political realities, contrasting sharply with Livia\'s emotional reaction. He is portrayed as the seasoned politician making a tough but necessary choice.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["AUGUSTUS: Because he wanted it. It was his price.", "AUGUSTUS: Well, what could I say?"]
    ;
MERGE (e:Event {uuid: 'event_21_3'})
    ON CREATE SET
        e.title = 'Livia\'s Dismissive Strategy',
        e.description = 'Livia scoffs at Augustus\'s justification and reveals her own strategy: to belittle Agrippa by reminding him of his \'low background\' and accusing him of lacking modesty for aspiring to marry into the Julian family. This reveals Livia\'s aristocratic disdain and her preferred method of direct, potentially humiliating confrontation to control individuals, showcasing her manipulative and class-conscious nature.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["LIVIA: His price!", "LIVIA: You could have said no!", "LIVIA: I could've handled him.", "LIVIA: I would have reminded him that he's a man of no background and that to assume to enter the Julian family shows the want of modesty."]
    ;
MERGE (e:Event {uuid: 'event_21_4'})
    ON CREATE SET
        e.title = 'Augustus Rejects Livia\'s Approach',
        e.description = 'Augustus immediately dismisses Livia\'s strategy as reckless and ineffective, asserting that it would have \'lost\' Agrippa entirely. He emphasizes the potential negative consequences of Livia\'s confrontational style, highlighting his own more cautious and politically astute approach. This clash in strategic thinking underscores a fundamental difference in their methods of wielding power.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["AUGUSTUS: Ha. And you would have lost him!", "LIVIA: I would not have lost him. I know very well how to deal with Marcus Agrippa!", "AUGUSTUS: You'd have lost him as quick as boiled asparagus. You'd have lost him."]
    ;
MERGE (e:Event {uuid: 'event_21_5'})
    ON CREATE SET
        e.title = 'Petty Squabble Over \'Boiled Asparagus\'',
        e.description = 'The argument momentarily devolves into a petty squabble over Augustus\'s idiom \'boiled asparagus\'. Livia criticizes the expression as foolish, while Augustus stubbornly defends his right to use it. This seemingly trivial exchange reveals the underlying tension and power dynamics in their relationship, where even minor personal preferences become points of contention. It also serves as a brief moment of dark humor amidst the serious political discussion.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["LIVIA: That is the most foolish expression. I wish you'd stop using that.", "AUGUSTUS: Well, it's my expression! I'll use it whenever I like!", "LIVIA: Ahhh."]
    ;
MERGE (e:Event {uuid: 'event_21_6'})
    ON CREATE SET
        e.title = 'Livia Feigns Concern for Julia\'s Wishes',
        e.description = 'Livia abruptly shifts her focus, now feigning concern for Julia\'s feelings and accusing Augustus of disregarding their daughter\'s wishes. She questions if they are \'selling\' their children like slaves, appealing to Augustus\'s paternal instincts and Roman societal norms. This manipulative tactic attempts to mask her true political objections behind a façade of maternal concern and moral outrage, subtly playing on Augustus\'s potential guilt and public image.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["AUGUSTUS: And, why are you so opposed to this marriage? I see no reason for you to be.", "LIVIA: It gives him more than he deserves.", "LIVIA: There is no other reason! Except... Except... You might have consulted Julia first. Are we now to ignore the wishes of our children and sell them on the market as if they were slaves? Have you no feelings?"]
    ;
MERGE (e:Event {uuid: 'event_21_7'})
    ON CREATE SET
        e.title = 'Augustus Sees Through Livia\'s Deception',
        e.description = 'Augustus, however, is not fooled. He directly challenges Livia, stating that her stated reason is not the real one and pressing her to reveal her true motivation for opposing the marriage. He demonstrates his keen awareness of Livia\'s manipulative nature and his determination to uncover her hidden agenda, highlighting the distrust and strategic maneuvering that characterize their relationship.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["AUGUSTUS: That's not the reason. There's some other reason. What is it?"]
    ;
MERGE (e:Event {uuid: 'event_21_8'})
    ON CREATE SET
        e.title = 'Livia\'s Veiled Denial',
        e.description = 'Livia firmly denies having any ulterior motive, insisting that her only concern is for Julia\'s wishes. This denial, delivered with practiced conviction, leaves her true motivations ambiguous and unresolved at the scene\'s end. It underscores her mastery of deception and her ability to maintain a façade, even when directly challenged by Augustus. The scene concludes on a note of unresolved tension and veiled conflict, leaving the audience to question Livia\'s sincerity and anticipate her next move.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["LIVIA: There is no other reason!"]
    ;
MERGE (s:Scene {uuid: 'scene_22'})
    ON CREATE SET
        s.title = 'Claudius\'s Descent into Paranoia',
        s.description = 'In the dimly lit sanctuary of Claudius\'s chamber, shadows dance across the walls, thick with the scent of aged parchment and the weight of unspoken truths. Claudius, cloaked in the solitude of his thoughts, grapples with the suffocating fear of betrayal. His voice, a raspy whisper, reveals the depths of his paranoia as he expresses his belief that he is being poisoned, trapped in a web of treachery spun by those he once considered allies. The quiet rustle of wind outside amplifies his anxiety, merging external elements with his internal turmoil. This scene serves as a poignant reflection of Claudius\'s isolation and desperation, foreshadowing the struggles he faces within the ruthless political landscape of Rome. It captures his frantic need to document his truth before he succumbs to the machinations of his rivals, highlighting themes of power, manipulation, and the fragility of life amidst ambition.',
        s.scene_number = 22
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_22_1'})
    ON CREATE SET
        e.title = 'Claudius Fears Poisoning',
        e.description = 'Claudius, consumed by paranoia, expresses his conviction that he is being poisoned by conspirators around him. In a moment of frantic clarity, he resolves to document his thoughts quickly, fearing he has little time left. This moment encapsulates his growing isolation and desperation, reflecting the toxic atmosphere of ambition and betrayal that surrounds him. His frantic musings reveal not only his fear for his life but also a profound understanding of the treacherous game being played in the imperial court.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["But she got her way in the end. Yes. She waited nine years but she got her way. Wicked woman...", "What was that? Wind? I wonder.", "They're trying to get rid of me. Yes, they're poisoning me, I know it.", "Must get it all down, quickly, before they finish me off. Haven't much time."]
    ;
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_hidden_journal'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_ship_cake'}),
          (a:Agent {uuid: 'agent_augustus_caesar'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_candied_cherry_agrippa'}),
          (a:Agent {uuid: 'agent_augustus_caesar'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_oration_actium_anniversary'}),
          (a:Agent {uuid: 'agent_augustus_caesar'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_prose_hymn'}),
          (a:Agent {uuid: 'agent_aristarchus_of_athens'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_weaving'}),
          (a:Agent {uuid: 'agent_antonia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_pears'}),
          (a:Agent {uuid: 'agent_augustus_caesar'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_games_of_marcellus'}),
          (a:Agent {uuid: 'agent_marcellus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_cloth'}),
          (a:Agent {uuid: 'agent_augustus_caesar'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bed'}),
          (a:Agent {uuid: 'agent_marcellus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_corpse'}),
          (a:Agent {uuid: 'agent_marcellus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_statutes'}),
          (a:Agent {uuid: 'org_rome'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_shops'}),
          (a:Agent {uuid: 'org_rome'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_thallus'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_aristarchus_of_athens'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (o:Organization {uuid: 'org_rome'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_cleopatra'}),
          (o:Organization {uuid: 'org_egypt'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_mark_antony'}),
          (o:Organization {uuid: 'org_egypt'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hidden_journal_event_1_1'})
    ON CREATE SET
        oi.description = 'The hidden journal serves as Claudius\'s sanctuary for his thoughts, where he records his life story and the truths he has long kept concealed. It symbolizes both his defiance against the mockery he faces and his determination to document events accurately, preserving a narrative that may defy the perceptions of others. The act of writing in this journal marks a critical moment of reclamation of his identity.',
        oi.status_before = 'The hidden journal is a personal and discreet repository, kept safe in Claudius\'s chamber, filled with blank pages awaiting the weight of his thoughts and experiences.',
        oi.status_after = 'After the event, the journal is now marked with Claudius\'s handwriting, filled with entries that begin to articulate his history and perspective, transforming it into a powerful instrument of legacy and self-definition.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hidden_journal'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Elderly Claudius sits hunched over his writing desk, surrounded by scrolls in his dimly lit chamber. He is focused intently on the hidden journal before him, his fingers moving swiftly as he writes, capturing his thoughts and memories with a fervor that belies his age. His posture, though weary, displays a sense of purpose and urgency as he embarks on this personal chronicle.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect a blend of determination and underlying melancholy. He projects a sense of resolve as he begins this significant task, yet beneath, there lies a profound sadness and vulnerability stemming from years of mockery and being underestimated. The weight of his past and the prophetic burden from the Sibyl haunt him, creating a complex emotional landscape where ambition clashes with self-doubt.',
        ap.emotional_tags = ["claudius's surface emotions reflect a blend of determination", "underlying melancholy. he projects a sense of resolve as he begins this significant task, yet beneath, there lies a profound sadness", "vulnerability stemming from years of mockery", "being underestimated. the weight of his past", "the prophetic burden from the sibyl haunt him, creating a complex emotional landscape where ambition clashes with self-doubt.", "claudius's surface emotions reflect a blend of determination and underlying melancholy. he projects a sense of resolve as he begins this significant task", "yet beneath", "there lies a profound sadness and vulnerability stemming from years of mockery and being underestimated. the weight of his past and the prophetic burden from the sibyl haunt him", "creating a complex emotional landscape where ambition clashes with self-doubt."],
        ap.active_plans = ["To record the truth of his life and legacy in a hidden journal, countering the public perception of himself as a fool.", "To confront the legacy of ridicule he has endured by owning his narrative and reclaiming his identity.", "To prepare for the future by arming himself with knowledge and insight about his family's political dynamics."],
        ap.beliefs = ["He believes that his true worth is obscured by the stigma of being labeled a fool.", "He trusts that by documenting his experiences, he can influence how history remembers him.", "He is convinced that understanding his destiny, as foretold by the Sibyl, is paramount to navigating the treacherous landscape of Roman politics."],
        ap.goals = ["Short-term: To begin writing his history and articulate his thoughts clearly in the journal.", "Medium-term: To gain a clearer understanding of his role in the power struggles of Rome and how he can influence them.", "Ultimate: To ensure his voice and truth are preserved for future generations, countering the narrative that dismisses him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Elderly Claudius, seated at his writing desk amidst the dimly lit chamber filled with scrolls, pauses in his clandestine task of writing. He lifts his gaze from the parchment, looking directly ahead as if perceiving an audience across the vast expanse of time. His posture is still, attentive, as he initiates a direct address, breaking the conventional boundaries of time and narrative.',
        ap.emotional_state = 'Claudius projects an air of cautious intimacy, directly engaging with his unseen audience as though they are present in the room. Beneath this surface, a profound sense of purpose fuels his actions. He is driven by the weight of prophecy and a deep-seated conviction that his story must be heard, suggesting an underlying urgency mixed with a lifetime of suppressed anxieties. There is a palpable tension between his need to reveal his truth and the ever-present fear of spies, creating an unspoken conflict that heightens the drama of his confession.',
        ap.emotional_tags = ["claudius projects an air of cautious intimacy, directly engaging with his unseen audience as though they are present in the room. beneath this surface, a profound sense of purpose fuels his actions. he is driven by the weight of prophecy", "a deep-seated conviction that his story must be heard, suggesting an underlying urgency mixed with a lifetime of suppressed anxieties. there is a palpable tension between his need to reveal his truth", "the ever-present fear of spies, creating an unspoken conflict that heightens the drama of his confession.", "claudius projects an air of cautious intimacy", "directly engaging with his unseen audience as though they are present in the room. beneath this surface", "a profound sense of purpose fuels his actions. he is driven by the weight of prophecy and a deep-seated conviction that his story must be heard", "suggesting an underlying urgency mixed with a lifetime of suppressed anxieties. there is a palpable tension between his need to reveal his truth and the ever-present fear of spies", "creating an unspoken conflict that heightens the drama of his confession."],
        ap.active_plans = ["To establish a personal and direct connection with his future audience, breaking the fourth wall to emphasize the timelessness of his narrative.", "To underscore the clandestine nature of his writing and the imminent danger he perceives from spies within his own time, highlighting the risks he undertakes to reveal his truth.", "To assert the significance of his history as a vital message for posterity, implying that his account will offer crucial insights lost or distorted by official narratives."],
        ap.beliefs = ["He believes in the power of prophecy, specifically the Sibyl's prediction that his voice will 'speak clear' to future generations.", "He is convinced that the truth about his life and the events of his time is essential for the future, suggesting a didactic or corrective purpose to his writing.", "He holds a firm belief in the existence of spies and constant surveillance, shaping his actions with a blend of caution and defiance as he attempts to circumvent their reach through his secret journal."],
        ap.goals = ["{type: short-term, description: To initiate contact with his imagined future audience, ensuring they are 'there' and receptive to his message.}", "{type: medium-term, description: To continue writing his secret history, circumventing the spies and ensuring his account is safely recorded for posterity.}", "{type: ultimate, description: To have his authentic narrative reach future generations, correcting historical misrepresentations and fulfilling the Sibyl's prophecy, thus securing his legacy beyond the distortions of his contemporaries.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Elderly Claudius sits hunched over his writing desk in a dimly lit chamber, surrounded by scrolls. His posture reflects weariness, but his hands move with purpose as he writes in a hidden journal, eyes darting to the shadows, embodying a deep sense of paranoia.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal a mix of anxiety and determination. He whispers about the spies, his voice trembling, hinting at an internal struggle with fear and vulnerability. Beneath this, a deep-seated tension exists, as he grapples with feelings of isolation and the burden of knowledge, aware that he is constantly being watched.',
        ap.emotional_tags = ["claudius's surface emotions reveal a mix of anxiety", "determination. he whispers about the spies, his voice trembling, hinting at an internal struggle with fear", "vulnerability. beneath this, a deep-seated tension exists, as he grapples with feelings of isolation", "the burden of knowledge, aware that he is constantly being watched.", "claudius's surface emotions reveal a mix of anxiety and determination. he whispers about the spies", "his voice trembling", "hinting at an internal struggle with fear and vulnerability. beneath this", "a deep-seated tension exists", "as he grapples with feelings of isolation and the burden of knowledge", "aware that he is constantly being watched."],
        ap.active_plans = ["To conceal his writings and thoughts to protect his narrative from those who might distort it.", "To document his history and the prophetic words of the Sibyl before it is too late.", "To understand the pervasive influence of spies in Rome and strategize how to navigate this oppressive atmosphere."],
        ap.beliefs = ["The belief that his identity and story have been misrepresented by others, fueling his desire to reclaim his narrative.", "A conviction that knowledge is power, and by writing, he can secure his legacy.", "The notion that the omnipresence of spies is a reality of his life, compelling him to act with caution."],
        ap.goals = ["Short-term: To write and protect his hidden journal from discovery.", "Medium-term: To understand and navigate the treacherous political climate of Rome.", "Ultimate: To ensure his true history is preserved and recognized by future generations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Elderly Claudius sits hunched over his writing desk in the dimly lit chamber, surrounded by scrolls that whisper tales of the past. His hand grips a quill, scratching furiously across the hidden journal as he speaks aloud, his voice resonating with a newfound resolve despite the ever-present threat of surveillance. He\'s physically engaged in the act of writing, his body language conveying a sense of determined secrecy.',
        ap.emotional_state = 'Claudius is acutely aware of the pervasive presence of spies, a fear that casts a long shadow over his actions. Yet, beneath this apprehension, a powerful determination ignites. He outwardly voices his fear of spies but immediately counters it with a defiant declaration, showcasing a layered psyche. He\'s internally battling his fear with a burgeoning cunning, driven by a need to secure his legacy against those who underestimate him. There\'s a palpable tension between vulnerability and a rising strategic resolve.',
        ap.emotional_tags = ["claudius is acutely aware of the pervasive presence of spies, a fear that casts a long shadow over his actions. yet, beneath this apprehension, a powerful determination ignites. he outwardly voices his fear of spies but immediately counters it with a defiant declaration, showcasing a layered psyche. he's internally battling his fear with a burgeoning cunning, driven by a need to secure his legacy against those who underestimate him. there's a palpable tension between vulnerability", "a rising strategic resolve.", "claudius is acutely aware of the pervasive presence of spies", "a fear that casts a long shadow over his actions. yet", "beneath this apprehension", "a powerful determination ignites. he outwardly voices his fear of spies but immediately counters it with a defiant declaration", "showcasing a layered psyche. he's internally battling his fear with a burgeoning cunning", "driven by a need to secure his legacy against those who underestimate him. there's a palpable tension between vulnerability and a rising strategic resolve.", "claudius is acutely aware of the pervasive presence of spies, a fear that casts a long shadow over his actions. yet, beneath this apprehension, a powerful determination ignites. he outwardly voices his fear of spies", "immediately counters it with a defiant declaration, showcasing a layered psyche. he's internally battling his fear with a burgeoning cunning, driven by a need to secure his legacy against those who underestimate him. there's a palpable tension between vulnerability and a rising strategic resolve."],
        ap.active_plans = ["To meticulously document his secret history in a hidden journal, ensuring no detail is overlooked.", "To devise strategies to evade the constant surveillance of spies, utilizing his perceived foolishness as a disguise.", "To secure the future discovery of his writings by generations to come, thus ensuring his version of truth prevails against potential distortions."],
        ap.beliefs = ["He believes that spies are omnipresent within the Roman court, posing a constant threat to his privacy and safety.", "He firmly believes in the power of truth and the importance of preserving his personal account of history against the lies and manipulations of others.", "He is convinced that his perceived idiocy is a strategic advantage, allowing him to operate undetected and outsmart those who underestimate his intellect."],
        ap.goals = ["Short-term Goal: To begin and continue writing his secret history in his hidden journal without immediate detection by spies.", "Medium-term Goal: To develop and implement effective methods to consistently evade surveillance and protect his writing activities from discovery.", "Ultimate Goal: To ensure his hidden journal survives the passage of time and is eventually discovered by future generations, revealing the unvarnished truth of his life and times."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched over a writing desk, his weary face illuminated by the dim light of the chamber. He scribbles intensely in his hidden journal, each stroke of the quill heavy with the weight of his memories and the significance of the prophecy he recalls. His posture is slightly slumped, reflecting both the burden of his thoughts and the fatigue of his life thus far, as he begins to articulate the pivotal moments that shaped his destiny.',
        ap.emotional_state = 'Outwardly, Claudius appears contemplative and slightly agitated, his voice steady yet tinged with a hint of urgency as he speaks to the unseen presence he senses. Internally, he is a maelstrom of anxiety and hope—haunted by the stigma of his past and grappling with the implications of the Sibyl\'s prophecy. His emotions reveal a deep yearning for validation and a desperate desire to reclaim his narrative from those who have underestimated him.',
        ap.emotional_tags = ["outwardly, claudius appears contemplative", "slightly agitated, his voice steady yet tinged with a hint of urgency as he speaks to the unseen presence he senses. internally, he is a maelstrom of anxiety", "hope\u2014haunted by the stigma of his past", "grappling with the implications of the sibyl's prophecy. his emotions reveal a deep yearning for validation", "a desperate desire to reclaim his narrative from those who have underestimated him.", "outwardly", "claudius appears contemplative and slightly agitated", "his voice steady yet tinged with a hint of urgency as he speaks to the unseen presence he senses. internally", "he is a maelstrom of anxiety and hope\u2014haunted by the stigma of his past and grappling with the implications of the sibyl's prophecy. his emotions reveal a deep yearning for validation and a desperate desire to reclaim his narrative from those who have underestimated him."],
        ap.active_plans = ["To document his personal history and experiences as a means of self-assertion.", "To unveil the prophecy of the Sibyl, emphasizing its significance to his identity and future.", "To prepare himself for the challenges ahead, driven by a determination to redefine how he is perceived."],
        ap.beliefs = ["He believes that every individual deserves to have their true story told, especially his own.", "He holds the conviction that prophecy can guide destiny, influencing the course of events in his life.", "He perceives the world as filled with spies and deceit, thus requiring him to be cautious and strategic in revealing his truths."],
        ap.goals = ["Short-term: To successfully document his thoughts and insights in the hidden journal.", "Medium-term: To convey the impact of the Sibyl's prophecy on his life to a broader audience.", "Ultimate: To establish a legacy that counters the perception of him as a fool and asserts his rightful place in history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_6'})
    ON CREATE SET
        ap.current_status = 'Claudius, in voice-over, recounts a past, deeply impactful encounter. He is not physically present in the Sibyl\'s cave within the current scene, but his voice and memory transport the audience there. He speaks with a reflective tone, revisiting a moment of profound fear and anticipation from his youth. He describes his approach to the Sibyl, emphasizing his terror and the gravity of his quest for prophecy.',
        ap.emotional_state = 'Beneath the surface of his present-day weariness, Claudius\'s voice carries a trace of the terror he felt in the Sibyl\'s presence. He is awestruck by the Sibyl\'s renown and the unexpected opportunity to consult her. There\'s a palpable sense of vulnerability and apprehension as he recalls seeking answers about his fate.  Internally, he is driven by a desperate need for understanding, masking his fear with a veneer of scholarly curiosity.',
        ap.emotional_tags = ["beneath the surface of his present-day weariness, claudius's voice carries a trace of the terror he felt in the sibyl's presence. he is awestruck by the sibyl's renown", "the unexpected opportunity to consult her. there's a palpable sense of vulnerability", "apprehension as he recalls seeking answers about his fate.  internally, he is driven by a desperate need for understanding, masking his fear with a veneer of scholarly curiosity.", "beneath the surface of his present-day weariness", "claudius's voice carries a trace of the terror he felt in the sibyl's presence. he is awestruck by the sibyl's renown and the unexpected opportunity to consult her. there's a palpable sense of vulnerability and apprehension as he recalls seeking answers about his fate.  internally", "he is driven by a desperate need for understanding", "masking his fear with a veneer of scholarly curiosity."],
        ap.active_plans = ["To vividly recall and narrate his past encounter with the Sibyl, emphasizing its importance.", "To convey the fear and awe he experienced in the Sibyl's presence to the audience.", "To set the stage for the revelation of the Sibyl's prophecy and its impact on his life and motivations."],
        ap.beliefs = ["He believes in the power and authority of prophecy, particularly that of the Sibyl of Cumae.", "He believes his life and Rome's fate are intertwined and subject to prophetic destiny.", "He believes that despite his perceived foolishness, he has a significant destiny connected to Rome's future."],
        ap.goals = ["Short-term: To accurately recount his past dialogue and emotions during the Sibyl encounter.", "Medium-term: To establish the Sibyl's prophecy as a pivotal moment that shaped his current actions and historical writing.", "Ultimate: To reveal the prophecy's content and demonstrate its long-term influence on his understanding of his role in history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Younger Claudius stands timidly at the mouth of the dark cave, his posture tense and hesitant as he faces the Sibyl. He fidgets nervously, his fingers wringing together, reflecting his uncertainty and desire for guidance. His eyes dart around, absorbing the ominous surroundings that amplify his anxiety.',
        ap.emotional_state = 'Claudius\'s surface emotions are a blend of trepidation and curiosity, evident in his wide eyes and shallow breaths. Internally, he grapples with feelings of insignificance and apprehension about his future, sensing the weight of the prophecy. There is a conflict between his desire for clarity and the fear of what he might learn.',
        ap.emotional_tags = ["claudius's surface emotions are a blend of trepidation", "curiosity, evident in his wide eyes", "shallow breaths. internally, he grapples with feelings of insignificance", "apprehension about his future, sensing the weight of the prophecy. there is a conflict between his desire for clarity", "the fear of what he might learn.", "claudius's surface emotions are a blend of trepidation and curiosity", "evident in his wide eyes and shallow breaths. internally", "he grapples with feelings of insignificance and apprehension about his future", "sensing the weight of the prophecy. there is a conflict between his desire for clarity and the fear of what he might learn."],
        ap.active_plans = ["Seek insight into his uncertain future and the destiny that awaits him.", "Understand the implications of the Sibyl's prophecy for his life and identity.", "Come to terms with the notion of a gift that others desire but may carry burdens he is not ready to bear."],
        ap.beliefs = ["Belief that destiny is something to be understood and navigated, rather than evaded.", "Conviction that he has the potential for greatness despite his perceived weaknesses.", "Understanding that prophecies hold significant weight in shaping one's path."],
        ap.goals = ["Short-term: Gain clarity and reassurance about his future from the Sibyl.", "Medium-term: Prepare himself mentally for the burdens that come with the gift foretold.", "Ultimate: Embrace his identity and the power he will eventually wield, transcending the label of a fool."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sibyl_event_2_1'})
    ON CREATE SET
        ap.current_status = 'The Sibyl stands with an air of ancient authority, her features weathered yet striking. She gazes intently at Claudius, her posture unwavering and commanding as she delivers her prophecy. Her eyes gleam with wisdom and mystery, and her gestures are deliberate, emphasizing the gravity of her words.',
        ap.emotional_state = 'The Sibyl\'s surface emotions are calm and composed, exhibiting an air of omniscience that suggests familiarity with the burdens of prophecy. Internally, she harbors the weight of the knowledge she imparts, aware of the profound impact her words will have on Claudius’s future while feeling the inevitability of fate. Her motivations are layered with a sense of duty to guide those who seek knowledge.',
        ap.emotional_tags = ["the sibyl's surface emotions are calm", "composed, exhibiting an air of omniscience that suggests familiarity with the burdens of prophecy. internally, she harbors the weight of the knowledge she imparts, aware of the profound impact her words will have on claudius\u2019s future while feeling the inevitability of fate. her motivations are layered with a sense of duty to guide those who seek knowledge.", "the sibyl's surface emotions are calm and composed", "exhibiting an air of omniscience that suggests familiarity with the burdens of prophecy. internally", "she harbors the weight of the knowledge she imparts", "aware of the profound impact her words will have on claudius\u2019s future while feeling the inevitability of fate. her motivations are layered with a sense of duty to guide those who seek knowledge.", "the sibyl's surface emotions are calm and composed, exhibiting an air of omniscience that suggests familiarity with the burdens of prophecy. internally, she harbors the weight of the knowledge she imparts, aware of the profound impact her words will have on claudius\u2019s future", "feeling the inevitability of fate. her motivations are layered with a sense of duty to guide those who seek knowledge."],
        ap.active_plans = ["Impart a cryptic yet crucial prophecy that will shape Claudius's understanding of his destiny.", "Encourage Claudius to confront his identity and potential through the revelation of future truths.", "Serve as a catalyst for Claudius\u2019s transformation, propelling him toward his role in history."],
        ap.beliefs = ["Belief that knowledge of the future can empower individuals to navigate their paths.", "Conviction that the burdens of prophecy come with a price, shaping destinies in unexpected ways.", "Understanding that her role is to reveal truths that may be uncomfortable but ultimately necessary for growth."],
        ap.goals = ["Short-term: Convey the prophecy to Claudius with clarity, ensuring he understands its significance.", "Medium-term: Influence Claudius's journey toward self-discovery and acceptance of his fate.", "Ultimate: Secure her legacy as a seer whose prophecies guide the course of history and the individuals who heed them."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hidden_journal_event_3_2'})
    ON CREATE SET
        oi.description = 'The hidden journal serves as the central vessel for Claudius\'s thoughts and reflections. He envisions it as a sacred repository where he will inscribe the truth of his family\'s ambition and the historical narrative of Rome. The act of writing in this journal symbolizes his rebellion against the fate prescribed to him, as he intends to seal it away, safeguarding it from the present and ensuring its revelation in the distant future.',
        oi.status_before = 'The hidden journal is an untouched, discreet item, previously containing blank pages where Claudius\'s personal thoughts and accounts remain unrecorded.',
        oi.status_after = 'Following Claudius\'s revelations, the journal transforms into a crucial artifact filled with his initial entries, now containing a burgeoning history of his family and a manifesto of truth poised to be sealed and buried.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hidden_journal'})
    MATCH (e:Event {uuid: 'event_3_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_hidden_journal_event_3_3'})
    ON CREATE SET
        oi.description = 'The hidden journal is the central object in this pivotal event. Claudius actively refers to it as \'it all,\' signifying that it is the intended vessel for his entire life\'s chronicle and historical account. He envisions it as the repository for his truth, the physical embodiment of his legacy, and the means by which his voice will transcend time. He intends to place this journal within the \'box,\' indicating its crucial role in his plan to preserve and transmit his history to future generations. The journal is not merely a passive recipient of his writing but an active participant in his oath to the unborn, becoming a time capsule of his insights and experiences.',
        oi.status_before = 'The hidden journal is in Claudius\'s possession within his writing chamber. It is already in use as he is actively writing in it, diligently recording his secret history and personal reflections, fulfilling its purpose as a private and clandestine chronicle.',
        oi.status_after = 'The hidden journal remains in Claudius\'s possession, now imbued with even greater significance. It is no longer just a repository of his thoughts but has transformed into a sacred vessel, destined for concealment and future revelation. Its pages are now seen as carrying the weight of his oath and the promise of truth for generations to come, ready to be sealed away for its long dormancy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_hidden_journal'})
    MATCH (e:Event {uuid: 'event_3_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Claudius, seated in his chamber amidst scrolls and parchments, lifts his head, a sudden spark of comprehension illuminating his weary features. He rises and paces slowly, his stammer momentarily absent as the weight of the Sibyl\'s prophecy finally settles upon him. He gestures with newfound purpose, a man awakened to a monumental task, speaking aloud to the silent room as if addressing the very future he now understands he will reach.',
        ap.emotional_state = 'A profound shift washes over Claudius. Relief and understanding flood his mind, banishing the confusion that clouded the Sibyl\'s cryptic words. Beneath the surface of this clarity, a surge of purpose ignites, a quiet defiance against his present insignificance.  He feels a burgeoning connection to a future he will never see, a sense of agency previously absent from his life as the court fool.  There\'s a nascent excitement mingled with the solemnity of his mission, a quiet thrill in realizing the scope of his destiny.',
        ap.emotional_tags = ["a profound shift washes over claudius. relief", "understanding flood his mind, banishing the confusion that clouded the sibyl's cryptic words. beneath the surface of this clarity, a surge of purpose ignites, a quiet defiance against his present insignificance.  he feels a burgeoning connection to a future he will never see, a sense of agency previously absent from his life as the court fool.  there's a nascent excitement mingled with the solemnity of his mission, a quiet thrill in realizing the scope of his destiny.", "a profound shift washes over claudius. relief and understanding flood his mind", "banishing the confusion that clouded the sibyl's cryptic words. beneath the surface of this clarity", "a surge of purpose ignites", "a quiet defiance against his present insignificance.  he feels a burgeoning connection to a future he will never see", "a sense of agency previously absent from his life as the court fool.  there's a nascent excitement mingled with the solemnity of his mission", "a quiet thrill in realizing the scope of his destiny."],
        ap.active_plans = ["To find or create a secure 'box' or container to house his writings, ensuring its preservation through the ages.", "To meticulously record his personal history, his family's saga, and the pivotal events surrounding the fall of the Republic, leaving no detail unwritten.", "To devise a plan to secretly seal and bury this 'box' in a location that will remain hidden from the prying eyes of his contemporaries, safeguarding it for its future discovery."],
        ap.beliefs = ["He now firmly believes in the Sibyl's prophecy and its specific timeframe, accepting that his voice and truth are destined for a future audience.", "He is convinced that his perspective and the history he will record are vital, possessing a truth that is absent or suppressed within the current Roman court.", "He holds a deep conviction that the present Roman court, filled with 'fools,' is incapable of understanding or valuing his insights, reinforcing his need to bypass them and speak directly to posterity."],
        ap.goals = ["short_term\": \"Immediately locate or construct a suitable 'box' to begin the physical process of securing his historical record.", "medium_term\": \"Diligently write and complete his detailed history, encompassing his life, family, and the tumultuous end of the Republic, ensuring no crucial detail is omitted.", "ultimate\": \"Guarantee that his meticulously recorded truth will be discovered by future generations, allowing his voice to finally be heard and understood, shaping their perception of Roman history and his family's role within it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at his writing desk, the flickering candlelight illuminating the lined pages before him. His posture is tense but determined, as his fingers hover over the pages, capturing his thoughts with urgency. Each gesture is imbued with the gravity of his revelation, with his brows furrowed in concentration as he envisions the future beyond his immediate circumstances.',
        ap.emotional_state = 'Claudius exudes a mix of introspection and resolve. Surface emotions reveal a sense of urgency and a flicker of hope, as he contemplates the monumental task ahead. Internally, he grapples with the weight of his family\'s dark history and the fear of being forgotten. His heart carries a blend of rebellion against his perceived insignificance and a profound desire to reclaim his narrative for future generations.',
        ap.emotional_tags = ["claudius exudes a mix of introspection", "resolve. surface emotions reveal a sense of urgency", "a flicker of hope, as he contemplates the monumental task ahead. internally, he grapples with the weight of his family's dark history", "the fear of being forgotten. his heart carries a blend of rebellion against his perceived insignificance", "a profound desire to reclaim his narrative for future generations.", "claudius exudes a mix of introspection and resolve. surface emotions reveal a sense of urgency and a flicker of hope", "as he contemplates the monumental task ahead. internally", "he grapples with the weight of his family's dark history and the fear of being forgotten. his heart carries a blend of rebellion against his perceived insignificance and a profound desire to reclaim his narrative for future generations."],
        ap.active_plans = ["To document the truth of his family's history and the fall of the Republic in a hidden journal.", "To create a sealed repository of his thoughts to safeguard against current judgments and future misinterpretations.", "To ensure that future generations will discover his account, thereby validating his existence and legacy."],
        ap.beliefs = ["The truth is often buried and must be preserved against the misrepresentations of the powerful.", "His voice, though silenced now, will ultimately resonate through time, as prophesied by the Sibyl.", "Recording his history is an act of defiance against those who would label him a fool or erase his contributions."],
        ap.goals = ["Short-term: To begin documenting his life and family history immediately.", "Medium-term: To create a comprehensive account that captures the essence of his experiences and the political landscape of Rome.", "Ultimate: To ensure that his story is discovered and acknowledged by future generations as a truthful narrative of his lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Claudius pauses from his writing, lifting his gaze with a newfound clarity. He is physically present in his secluded writing chamber, addressing an unseen audience beyond the confines of his room and time itself. He gestures as if making a solemn vow, his voice resonating with conviction as he outlines his plan to safeguard his historical account.',
        ap.emotional_state = 'A profound sense of purpose washes over Claudius, replacing his usual weariness with resolute determination. He is driven by the weight of the prophecy, his tone shifting from reflective to assertive as he commits to his mission. There\'s an undercurrent of urgency, a feeling that time is slipping away, yet he exudes a quiet confidence in the enduring power of his words to transcend generations.',
        ap.emotional_tags = ["a profound sense of purpose washes over claudius", "replacing his usual weariness with resolute determination. he is driven by the weight of the prophecy", "his tone shifting from reflective to assertive as he commits to his mission. there's an undercurrent of urgency", "a feeling that time is slipping away", "yet he exudes a quiet confidence in the enduring power of his words to transcend generations."],
        ap.active_plans = ["To finalize the detailed account of his life, family, and the tumultuous events of his era, ensuring no crucial detail is omitted.", "To locate a secure, inconspicuous box or container suitable for preserving his written history for an extended period.", "To devise a clandestine method for concealing the box, guaranteeing its discovery only by those in the distant future, as foretold by the Sibyl."],
        ap.beliefs = ["He firmly believes in the Sibyl's prophecy that his voice will be heard and understood by future generations, despite being disregarded in his own time.", "He is convinced of the profound importance of his unique perspective on Roman history, viewing it as a necessary corrective to the prevailing narratives.", "He holds a deep conviction in the power of truth to eventually surface and reshape understanding, even if buried for centuries under layers of political distortion and imperial propaganda."],
        ap.goals = ["short_term\": \"To immediately find a suitable 'box' to begin the process of archiving his written work, taking tangible steps towards fulfilling his prophetic destiny.", "medium_term\": \"To meticulously complete his historical record, ensuring it encompasses all critical events and personal insights he deems essential for posterity's understanding.", "ultimate\": \"To ensure his meticulously crafted history survives undiscovered for nineteen hundred years, reaching its destined audience in the far future, thereby achieving a form of immortality through his truth and voice."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_ship_cake_event_4_2'})
    ON CREATE SET
        oi.description = 'The ship cake, a meticulously crafted confection in the shape of a Roman war galley, is dramatically introduced by Augustus as a \'surprise,\' wheeled into the banquet hall at the Emperor\'s insistence, interrupting the expected flow of the meal. It becomes the immediate focal point, drawing all eyes and conversation. Augustus explicitly presents it as a tribute to Agrippa, highlighting its symbolic representation of Agrippa\'s flagship. However, the cake\'s sugary sweetness and celebratory intent are quickly undermined as it becomes a point of contention and mockery by Marcellus, revealing the simmering tensions and undercurrents of disrespect within the imperial family.',
        oi.status_before = 'Prior to the event, the ship cake was prepared and presumably located in the kitchens or a separate serving area, awaiting its intended presentation at the meal\'s conclusion, adhering to the established banquet order and hidden from the view of the guests.',
        oi.status_after = 'Following its premature unveiling, the ship cake is now prominently positioned within the banquet hall, becoming a central object of attention and conversation. Its status has shifted from a planned dessert to a catalyst for immediate interaction and tension, transforming from a symbol of celebration into a focal point that exposes the underlying rivalries and power dynamics amongst the assembled imperial family members.'
    WITH oi
    MATCH (o:Object {uuid: 'object_ship_cake'})
    MATCH (e:Event {uuid: 'event_4_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_oration_actium_anniversary_event_4_4'})
    ON CREATE SET
        oi.description = 'The oration, intended as a celebratory tribute to the Battle of Actium and Roman triumph, becomes the central object of contention in the scene. Aristarchus delivers the speech with poetic grandeur, praising Agrippa\'s victory and Roman glory. However, Marcellus\'s dismissive remarks about the battle and Agrippa directly challenge the celebratory intent of the oration, turning it into a catalyst for conflict. The oration inadvertently highlights the deep-seated rivalries and differing perspectives within Augustus\'s family, transforming a moment of intended unity into one of open discord.',
        oi.status_before = 'The oration exists as a prepared piece, commissioned by Augustus and ready to be delivered by Aristarchus at the banquet. It is intended to be a grand and celebratory performance, glorifying Roman power and unity.',
        oi.status_after = 'The oration\'s intended celebratory purpose is undermined and tainted by the ensuing argument between Marcellus and Agrippa. It becomes associated with the rising tension and open conflict within the imperial family, failing to unite and instead highlighting their divisions and rivalries. The oration, though eloquently delivered, leaves a bitter aftertaste, symbolizing the superficiality of Roman grandeur masking deep unrest.'
    WITH oi
    MATCH (o:Object {uuid: 'object_oration_actium_anniversary'})
    MATCH (e:Event {uuid: 'event_4_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the head of the long table, exuding authority and warmth. He engages in light-hearted banter with Thallus, emphasizing the need for hospitality and impressing with his command of the event. He eagerly discusses the cake and the orator\'s upcoming performance, revealing his desire to maintain control and impress his guests.',
        ap.emotional_state = 'Beneath his jovial demeanor, Augustus feels a palpable need to assert his authority and impress those around him. His light banter masks an underlying insecurity about his role as Emperor and the legacy he wishes to leave behind.',
        ap.emotional_tags = ["beneath his jovial demeanor, augustus feels a palpable need to assert his authority", "impress those around him. his light banter masks an underlying insecurity about his role as emperor", "the legacy he wishes to leave behind.", "beneath his jovial demeanor", "augustus feels a palpable need to assert his authority and impress those around him. his light banter masks an underlying insecurity about his role as emperor and the legacy he wishes to leave behind."],
        ap.active_plans = ["To ensure that all guests are well-fed and attended to, showcasing his hospitality.", "To present the cake as a surprise, reinforcing his status as a generous host.", "To promote Aristarchus's oration as a highlight of the evening, aiming to bolster his own authority and create a celebratory atmosphere."],
        ap.beliefs = ["Hospitality is a sign of strength and control as Emperor.", "Public perception is crucial for maintaining his legacy and authority.", "Engaging with guests through entertainment is a key aspect of effective leadership."],
        ap.goals = ["Short-term: To impress the guests with lavish hospitality during the banquet.", "Medium-term: To establish a memorable event that reinforces his power and legacy.", "Ultimate: To secure his place in history as a revered leader of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Thallus moves efficiently around the banquet hall, taking commands from Augustus and ensuring that the guests are well taken care of. He interacts with Augustus with deference, executing his orders promptly and maintaining a serviceable demeanor throughout the event.',
        ap.emotional_state = 'Thallus displays a composed exterior, masking any potential frustrations from being relegated to a servant\'s role. His interactions are respectful, but there is a hint of weariness in his tone, indicating a longing for the days when he was an actor rather than a servant.',
        ap.emotional_tags = ["thallus displays a composed exterior", "masking any potential frustrations from being relegated to a servant's role. his interactions are respectful", "but there is a hint of weariness in his tone", "indicating a longing for the days when he was an actor rather than a servant.", "thallus displays a composed exterior, masking any potential frustrations from being relegated to a servant's role. his interactions are respectful,", "there is a hint of weariness in his tone, indicating a longing for the days when he was an actor rather than a servant."],
        ap.active_plans = ["To execute Augustus's commands effectively and ensure the guests' satisfaction.", "To manage the timing of the cake presentation as per Augustus's wishes.", "To maintain a smooth flow of service during the banquet, avoiding any disruptions."],
        ap.beliefs = ["A servant's duty is to uphold the dignity of the Emperor through impeccable service.", "The importance of hospitality reflects on both the Emperor and himself as a servant.", "Personal grievances should be kept private and should not affect professional conduct."],
        ap.goals = ["Short-term: To ensure all guests are well-fed and satisfied during the banquet.", "Medium-term: To perform his duties without error, earning Augustus's continued favor.", "Ultimate: To regain a sense of personal worth that he felt as an actor through diligent service."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the head of the lavish banquet table, radiating an air of imperial command while directing his servant, Thallus. He leans forward with an eager posture, gesturing expansively as he insists on the immediate unveiling of the ship cake, his voice filled with forced joviality and anticipation for the \'surprise\' he has orchestrated for his guests, particularly Agrippa.',
        ap.emotional_state = 'Outwardly, Augustus presents an image of celebratory enthusiasm, his tone projecting excitement and a desire for shared merriment. However, beneath this veneer of imperial geniality, a subtle current of insecurity and control-seeking is palpable. He seems anxious to orchestrate the banquet\'s flow, seeking validation for his gestures of grandeur and subtly asserting his authority over the unfolding events, masking any underlying unease about the simmering tensions within his family.',
        ap.emotional_tags = ["outwardly, augustus presents an image of celebratory enthusiasm, his tone projecting excitement", "a desire for shared merriment. however, beneath this veneer of imperial geniality, a subtle current of insecurity", "control-seeking is palpable. he seems anxious to orchestrate the banquet's flow, seeking validation for his gestures of grandeur", "subtly asserting his authority over the unfolding events, masking any underlying unease about the simmering tensions within his family.", "outwardly", "augustus presents an image of celebratory enthusiasm", "his tone projecting excitement and a desire for shared merriment. however", "beneath this veneer of imperial geniality", "a subtle current of insecurity and control-seeking is palpable. he seems anxious to orchestrate the banquet's flow", "seeking validation for his gestures of grandeur and subtly asserting his authority over the unfolding events", "masking any underlying unease about the simmering tensions within his family."],
        ap.active_plans = ["To orchestrate a grand, celebratory atmosphere at the banquet, reinforcing his image as a benevolent and powerful ruler.", "To publicly honor Marcus Agrippa with the ship cake, aiming to reaffirm Agrippa's loyalty and placate potential resentments.", "To assert his imperial will by overriding established protocols and demanding the cake's immediate presentation, demonstrating his unchallenged authority within his household."],
        ap.beliefs = ["Imperial displays of generosity and public honor are essential tools for maintaining control and fostering loyalty within his inner circle.", "As the Emperor, his desires and whims should be immediately obeyed and executed without question by his servants and household.", "Festivities and spectacles are crucial for projecting an image of Roman strength and unity, distracting from underlying political tensions."],
        ap.goals = ["short-term\": \"To successfully present the ship cake and gauge the reactions of his guests, particularly Agrippa and Marcellus, to assess the evening's social dynamics.", "medium-term\": \"To reinforce Agrippa's allegiance and foster a sense of unity amongst his family and key figures, mitigating potential threats to his authority.", "ultimate\": \"To secure his legacy as a wise and powerful emperor who maintained stability and order within the Roman Empire, ensuring a smooth succession and lasting peace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Thallus stands attentively beside Augustus, his posture reflecting dutiful servitude. Initially, he offers a polite objection to Caesar\'s premature request for the cake, citing protocol, but immediately submits to the Emperor\'s insistence. He moves with practiced efficiency to fulfill Augustus\'s command, preparing to bring in the cake and execute his master\'s will with unquestioning obedience.',
        ap.emotional_state = 'Thallus maintains a composed and subservient demeanor, outwardly expressing respect and deference to Augustus\'s imperial authority. Internally, a flicker of professional apprehension might be present as he briefly questions deviating from established banquet procedures. Primarily, he is focused on efficiently executing his duties, driven by a desire to please Caesar and avoid any potential reprimand, revealing a professional dedication within the rigid social hierarchy.',
        ap.emotional_tags = ["thallus maintains a composed", "subservient demeanor, outwardly expressing respect", "deference to augustus's imperial authority. internally, a flicker of professional apprehension might be present as he briefly questions deviating from established banquet procedures. primarily, he is focused on efficiently executing his duties, driven by a desire to please caesar", "avoid any potential reprimand, revealing a professional dedication within the rigid social hierarchy.", "thallus maintains a composed and subservient demeanor", "outwardly expressing respect and deference to augustus's imperial authority. internally", "a flicker of professional apprehension might be present as he briefly questions deviating from established banquet procedures. primarily", "he is focused on efficiently executing his duties", "driven by a desire to please caesar and avoid any potential reprimand", "revealing a professional dedication within the rigid social hierarchy."],
        ap.active_plans = ["To swiftly and efficiently carry out Augustus's direct order to present the cake, overriding his initial reservations about protocol.", "To ensure the cake is presented smoothly and according to Caesar's implied expectations, maintaining order and decorum.", "To remain a reliable and obedient servant by promptly fulfilling the Emperor's wishes, securing his position and avoiding any displeasure from his master."],
        ap.beliefs = ["Absolute obedience to the Emperor's commands is paramount and unquestionable, regardless of established protocols.", "Maintaining order and efficiency in service reflects well upon a servant's competence and dedication.", "A servant's role is to facilitate the desires of their master, particularly the Emperor, without personal interference or questioning."],
        ap.goals = ["short-term\": \"To successfully retrieve and present the ship cake to Augustus and the guests as quickly and smoothly as possible.", "medium-term\": \"To continue performing his duties with diligence and efficiency, maintaining his position as a trusted servant within the imperial household.", "ultimate\": \"To achieve long-term stability and security within his role as a servant, ensuring a comfortable and predictable life within the rigid Roman social structure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the head of the table, animatedly engaging with his guests. He eagerly anticipates the arrival of Aristarchus and the unveiling of the cake, revealing his playful side. His gestures are grand, embodying the authority of the Emperor while masking his insecurities about the future.',
        ap.emotional_state = 'Augustus exhibits a facade of joviality and pride, but underneath, he grapples with the pressures of maintaining control and legacy. His light-hearted banter conceals a deeper anxiety about the diminishing loyalty among his family and the rising tensions between Marcellus and Agrippa.',
        ap.emotional_tags = ["augustus exhibits a facade of joviality", "pride, but underneath, he grapples with the pressures of maintaining control", "legacy. his light-hearted banter conceals a deeper anxiety about the diminishing loyalty among his family", "the rising tensions between marcellus", "agrippa.", "augustus exhibits a facade of joviality and pride", "but underneath", "he grapples with the pressures of maintaining control and legacy. his light-hearted banter conceals a deeper anxiety about the diminishing loyalty among his family and the rising tensions between marcellus and agrippa.", "augustus exhibits a facade of joviality and pride,", "underneath, he grapples with the pressures of maintaining control and legacy. his light-hearted banter conceals a deeper anxiety about the diminishing loyalty among his family and the rising tensions between marcellus and agrippa."],
        ap.active_plans = ["To entertain guests with a lavish banquet and showcase the ship-shaped cake as a symbol of Agrippa's achievements.", "To engage Aristarchus in a public display of oratory that reinforces his own legacy and the significance of Actium.", "To diffuse the brewing tension between Marcellus and Agrippa while maintaining the appearance of familial harmony."],
        ap.beliefs = ["The significance of public displays reinforces his authority as Emperor.", "Art and oratory have the power to shape history and influence public perception.", "Maintaining control over his family dynamics is crucial for the stability of his reign."],
        ap.goals = ["Short-term: To successfully host the banquet and impress his guests.", "Medium-term: To strengthen his image by commemorating the victory at Actium.", "Ultimate: To secure his legacy and ensure the stability of his rule amidst rising tensions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Aristarchus enters the banquet hall with a theatrical flourish, immediately capturing the attention of the audience. He exchanges witty banter with Thallus before launching into his oration, using grand gestures and a commanding voice to engage the crowd and set the tone for the evening.',
        ap.emotional_state = 'Aristarchus displays confidence and excitement, reveling in the opportunity to showcase his skills before the Emperor and his court. However, beneath the surface, he remains unaware of the political tensions simmering around him, focused solely on delivering his performance.',
        ap.emotional_tags = ["aristarchus displays confidence", "excitement, reveling in the opportunity to showcase his skills before the emperor", "his court. however, beneath the surface, he remains unaware of the political tensions simmering around him, focused solely on delivering his performance.", "aristarchus displays confidence and excitement", "reveling in the opportunity to showcase his skills before the emperor and his court. however", "beneath the surface", "he remains unaware of the political tensions simmering around him", "focused solely on delivering his performance."],
        ap.active_plans = ["To deliver a compelling oration that commemorates the anniversary of Actium and impresses Augustus and the court.", "To entertain the gathered nobles and solidify his reputation as a master orator in Rome.", "To gain favor with Augustus, thereby elevating his status among the Roman elite."],
        ap.beliefs = ["Rhetoric and performance are vital tools for influencing public opinion and gaining political favor.", "Artistic expression holds the power to transcend the mundane aspects of life and elevate the human experience.", "The historical significance of events like Actium deserves to be celebrated and remembered."],
        ap.goals = ["Short-term: To successfully deliver his oration without mishap and entertain the guests.", "Medium-term: To establish himself as a prominent figure in Roman society through his oratory skills.", "Ultimate: To gain recognition and influence in Rome, potentially securing future commissions and opportunities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Thallus dutifully attends to Augustus\'s needs, moving quickly to bring in the cake and ensure that Aristarchus is welcomed properly. He navigates the bustling hall with efficiency, balancing the expectations of the Emperor with the demands of the guests.',
        ap.emotional_state = 'Thallus maintains a calm and professional demeanor, though there is an underlying tension as he witnesses the interactions and conflicts among the imperial family and their guests. He is aware of the power dynamics at play but remains focused on his duties.',
        ap.emotional_tags = ["thallus maintains a calm", "professional demeanor, though there is an underlying tension as he witnesses the interactions", "conflicts among the imperial family", "their guests. he is aware of the power dynamics at play but remains focused on his duties.", "thallus maintains a calm and professional demeanor", "though there is an underlying tension as he witnesses the interactions and conflicts among the imperial family and their guests. he is aware of the power dynamics at play but remains focused on his duties.", "thallus maintains a calm and professional demeanor, though there is an underlying tension as he witnesses the interactions and conflicts among the imperial family and their guests. he is aware of the power dynamics at play", "remains focused on his duties."],
        ap.active_plans = ["To ensure that the guests are well cared for and that their needs are met during the banquet.", "To assist Augustus in showcasing his authority and the celebratory aspects of the evening.", "To ensure Aristarchus feels welcomed and valued as a guest, facilitating a smooth transition into the oration."],
        ap.beliefs = ["Serving the Emperor and his guests is paramount, and it is essential to uphold the dignity of the imperial household.", "The role of a servant is vital in maintaining the smooth operation of the palace and ensuring the satisfaction of the nobility.", "Personal opinions should remain secondary to the needs of those in power."],
        ap.goals = ["Short-term: To execute Augustus's commands efficiently and without issue.", "Medium-term: To foster a positive atmosphere at the banquet that reflects well on the Emperor.", "Ultimate: To navigate the complexities of court life while maintaining his position and reputation as a competent servant."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at the head of the banquet table, initially pleased as Aristarchus begins his oration. He beams with imperial pride, nodding slightly as the orator speaks of Roman glory. However, as Marcellus\'s disruptive comments escalate the tension, Augustus shifts his posture, becoming more rigid and his smiles strained as he attempts to mediate and regain control of the increasingly volatile atmosphere of his banquet.',
        ap.emotional_state = 'Initially, Augustus is in a celebratory mood, enjoying the spectacle of the banquet and the prospect of a grand oration enhancing his image. However, beneath this facade of imperial bonhomie, a flicker of annoyance emerges at Marcellus\'s disrespect and the burgeoning conflict with Agrippa. He is visibly discomfited by the disruption, revealing a subtle anxiety about maintaining order and his authority within his own family, masking his irritation with forced joviality.',
        ap.emotional_tags = ["initially, augustus is in a celebratory mood, enjoying the spectacle of the banquet", "the prospect of a grand oration enhancing his image. however, beneath this facade of imperial bonhomie, a flicker of annoyance emerges at marcellus's disrespect", "the burgeoning conflict with agrippa. he is visibly discomfited by the disruption, revealing a subtle anxiety about maintaining order", "his authority within his own family, masking his irritation with forced joviality.", "initially", "augustus is in a celebratory mood", "enjoying the spectacle of the banquet and the prospect of a grand oration enhancing his image. however", "beneath this facade of imperial bonhomie", "a flicker of annoyance emerges at marcellus's disrespect and the burgeoning conflict with agrippa. he is visibly discomfited by the disruption", "revealing a subtle anxiety about maintaining order and his authority within his own family", "masking his irritation with forced joviality."],
        ap.active_plans = ["To use the oration to publicly celebrate the anniversary of Actium, reinforcing his image as a victorious leader.", "To showcase Roman cultural sophistication by hosting a renowned Greek orator.", "To maintain a semblance of familial harmony and control during the banquet, despite the rising tensions."],
        ap.beliefs = ["Public celebrations and displays of culture enhance the prestige of Rome and his rule.", "Maintaining a strong and unified public image of his family is essential for stability.", "He can control and manage the ambitions and rivalries within his family through paternal authority and manipulation."],
        ap.goals = ["Short-term: To ensure the banquet proceeds smoothly and achieves its intended celebratory atmosphere.", "Medium-term: To solidify his legacy and reinforce his image as a cultured and powerful emperor through events like this oration.", "Ultimate: To secure a peaceful and unchallenged succession, maintaining the stability of the Roman Empire he has built."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Aristarchus stands tall and poised, gesturing theatrically as he delivers his oration. He projects his voice to fill the banquet hall, his eyes occasionally sweeping over the assembled guests, gauging their reactions. Initially focused on the Emperor and delivering a performance worthy of his reputation, he becomes subtly aware of the shift in atmosphere as the tension rises, though he continues his oration with professional commitment.',
        ap.emotional_state = 'Aristarchus begins with confident enthusiasm, eager to impress Caesar and the Roman court with his oratorical skills. He is likely experiencing a performer\'s mix of excitement and slight nervousness, wanting to deliver a memorable speech. As the banquet\'s mood turns sour, a flicker of unease might creep into his performance, though he maintains a professional detachment, focusing on completing his commission and maintaining his composure amidst the unexpected tension.',
        ap.emotional_tags = ["aristarchus begins with confident enthusiasm, eager to impress caesar", "the roman court with his oratorical skills. he is likely experiencing a performer's mix of excitement", "slight nervousness, wanting to deliver a memorable speech. as the banquet's mood turns sour, a flicker of unease might creep into his performance, though he maintains a professional detachment, focusing on completing his commission", "maintaining his composure amidst the unexpected tension.", "aristarchus begins with confident enthusiasm", "eager to impress caesar and the roman court with his oratorical skills. he is likely experiencing a performer's mix of excitement and slight nervousness", "wanting to deliver a memorable speech. as the banquet's mood turns sour", "a flicker of unease might creep into his performance", "though he maintains a professional detachment", "focusing on completing his commission and maintaining his composure amidst the unexpected tension."],
        ap.active_plans = ["To deliver a powerful and eloquent oration that fulfills Augustus's commission and celebrates the Battle of Actium.", "To impress Augustus and the Roman court with his rhetorical abilities, securing potential future patronage.", "To maintain his professional dignity and composure, even as the atmosphere around him becomes tense and uncomfortable."],
        ap.beliefs = ["The power of oratory can shape perceptions and immortalize events in history.", "Patronage from powerful rulers is essential for an artist's success and recognition.", "A skilled orator can transcend political tensions and focus on the art of rhetoric itself."],
        ap.goals = ["Short-term: To successfully complete the oration without faltering, despite the emerging disruptions.", "Medium-term: To establish a positive reputation in Rome as a highly skilled and sought-after orator.", "Ultimate: To achieve lasting fame and recognition as one of the greatest orators of his time, leaving a legacy through his words."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Agrippa sits stiffly at the banquet table, initially listening to the oration with a stoic expression, his body language conveying a contained tension. As Marcellus begins to openly mock Actium and his role in it, Agrippa\'s posture becomes more rigid, his gaze sharpening. He leans forward, his voice resonating with controlled fury as he directly confronts Marcellus, challenging his arrogance and defending the honor of the veterans of Actium.',
        ap.emotional_state = 'Agrippa begins in a state of watchful reserve, aware of the courtly dynamics and Marcellus\'s rising favor. Underneath his controlled exterior, simmering resentment towards Marcellus\'s arrogance is palpable. When Marcellus openly dismisses Actium, Agrippa\'s carefully maintained composure shatters, replaced by raw indignation and anger. He feels deeply disrespected and his achievements belittled, igniting a fierce need to defend his honor and the sacrifices made at Actium.',
        ap.emotional_tags = ["agrippa begins in a state of watchful reserve, aware of the courtly dynamics", "marcellus's rising favor. underneath his controlled exterior, simmering resentment towards marcellus's arrogance is palpable. when marcellus openly dismisses actium, agrippa's carefully maintained composure shatters, replaced by raw indignation", "anger. he feels deeply disrespected", "his achievements belittled, igniting a fierce need to defend his honor", "the sacrifices made at actium.", "agrippa begins in a state of watchful reserve", "aware of the courtly dynamics and marcellus's rising favor. underneath his controlled exterior", "simmering resentment towards marcellus's arrogance is palpable. when marcellus openly dismisses actium", "agrippa's carefully maintained composure shatters", "replaced by raw indignation and anger. he feels deeply disrespected and his achievements belittled", "igniting a fierce need to defend his honor and the sacrifices made at actium."],
        ap.active_plans = ["To observe the unfolding dynamics at the banquet and assess his standing in Augustus's court.", "To directly challenge Marcellus's disrespectful remarks and assert the significance of Actium and his own achievements.", "To re-establish his authority and experience in the face of Marcellus's youthful arrogance, reminding the court of his value to Rome."],
        ap.beliefs = ["The Battle of Actium was a pivotal and hard-fought victory that secured Rome's future.", "Respect for military experience and sacrifice is fundamental to Roman values and the empire's strength.", "Arrogance and disrespect from inexperienced youth should be swiftly and firmly rebuked to maintain order and respect for elders."],
        ap.goals = ["Short-term: To silence Marcellus's disrespectful mockery and publicly shame him for his arrogance.", "Medium-term: To regain lost influence and respect within the court, countering Marcellus's growing favor with Augustus.", "Ultimate: To secure his legacy as a key architect of the Roman Empire and ensure his contributions are recognized and valued, perhaps even positioning himself for future power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Marcellus reclines at the banquet table, initially feigning boredom during the oration, rolling his eyes and making dismissive gestures. As Aristarchus praises Actium and Agrippa, Marcellus\'s mockery becomes increasingly overt and vocal. He interrupts with sarcastic remarks, directly challenging Agrippa and belittling the battle, radiating an air of youthful arrogance and entitlement.',
        ap.emotional_state = 'Marcellus is fueled by youthful arrogance and a sense of entitlement, viewing Agrippa and the older generation with contempt. He feels intellectually superior and believes Actium is an overhyped event, diminishing Agrippa\'s accomplishments. He is motivated by a desire to impress Augustus with his wit and modern views, oblivious to the dangerous disrespect he displays and the growing anger he provokes. He is blinded by his own vanity and confidence in Augustus\'s favor.',
        ap.emotional_tags = ["marcellus is fueled by youthful arrogance", "a sense of entitlement, viewing agrippa", "the older generation with contempt. he feels intellectually superior", "believes actium is an overhyped event, diminishing agrippa's accomplishments. he is motivated by a desire to impress augustus with his wit", "modern views, oblivious to the dangerous disrespect he displays", "the growing anger he provokes. he is blinded by his own vanity", "confidence in augustus's favor.", "marcellus is fueled by youthful arrogance and a sense of entitlement", "viewing agrippa and the older generation with contempt. he feels intellectually superior and believes actium is an overhyped event", "diminishing agrippa's accomplishments. he is motivated by a desire to impress augustus with his wit and modern views", "oblivious to the dangerous disrespect he displays and the growing anger he provokes. he is blinded by his own vanity and confidence in augustus's favor."],
        ap.active_plans = ["To publicly mock and belittle Agrippa's achievements and the significance of the Battle of Actium.", "To assert his own intellectual superiority and modern perspective, contrasting himself with the 'old guard'.", "To entertain Augustus and the court with his wit and irreverence, solidifying his position as the favored nephew and heir apparent."],
        ap.beliefs = ["The Battle of Actium is an overrated and strategically insignificant event.", "He is more intelligent and sophisticated than Agrippa and the older generation of Roman leaders.", "Augustus favors him and will tolerate his disrespectful behavior as a sign of youthful brilliance and modern thinking."],
        ap.goals = ["Short-term: To provoke a reaction from Agrippa and demonstrate his own cleverness and daring.", "Medium-term: To diminish Agrippa's standing in the eyes of Augustus and the court, enhancing his own relative position.", "Ultimate: To secure his place as Augustus's chosen successor, eclipsing Agrippa and becoming the dominant figure in the Roman Empire, embodying a 'modern' Roman leader."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Agrippa sits at the banquet table, his posture tense as he listens to Marcellus criticize the glorification of the Battle of Actium. He leans forward slightly, his brow furrowed in indignation, and gestures emphatically while addressing Marcellus.',
        ap.emotional_state = 'Agrippa\'s surface emotions reflect indignation and frustration towards Marcellus\'s dismissive attitude. Internally, he harbors a sense of protective pride for the soldiers who fought and died at Actium, feeling a tension between his loyalty to Augustus and his resentment towards the younger generation\'s flippancy.',
        ap.emotional_tags = ["agrippa's surface emotions reflect indignation", "frustration towards marcellus's dismissive attitude. internally, he harbors a sense of protective pride for the soldiers who fought", "died at actium, feeling a tension between his loyalty to augustus", "his resentment towards the younger generation's flippancy.", "agrippa's surface emotions reflect indignation and frustration towards marcellus's dismissive attitude. internally", "he harbors a sense of protective pride for the soldiers who fought and died at actium", "feeling a tension between his loyalty to augustus and his resentment towards the younger generation's flippancy."],
        ap.active_plans = ["To defend the honor of his fellow soldiers who fought at Actium against Marcellus's scorn.", "To reiterate the significance of the battle and its impact on Rome's destiny.", "To assert his experience and authority in military matters over the youthful arrogance of Marcellus."],
        ap.beliefs = ["The sacrifices made in battle should be honored rather than mocked.", "Experience and military service grant him a deeper understanding of Rome's history and its struggles.", "Respect for tradition and the past is essential for the stability of the empire."],
        ap.goals = ["Short-term: To engage Marcellus in a discussion that emphasizes the gravity of Actium.", "Medium-term: To reinforce his standing with Augustus by demonstrating loyalty and valor.", "Ultimate: To secure a prominent position in the power dynamics of the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_5'})
    ON CREATE SET
        ap.current_status = 'Marcellus sits at the banquet, leaning back in his chair with a smirk as he openly critiques the emphasis placed on Actium. His gestures are dismissive, and he rolls his eyes at Agrippa\'s indignation, embodying youthful arrogance.',
        ap.emotional_state = 'Marcellus exudes confidence and defiance, yet beneath his bravado lies a simmering cynicism regarding the imperial narrative. He feels an internal conflict as he balances his desire for approval from Augustus with his disdain for the reverence shown to past battles.',
        ap.emotional_tags = ["marcellus exudes confidence", "defiance, yet beneath his bravado lies a simmering cynicism regarding the imperial narrative. he feels an internal conflict as he balances his desire for approval from augustus with his disdain for the reverence shown to past battles.", "marcellus exudes confidence and defiance", "yet beneath his bravado lies a simmering cynicism regarding the imperial narrative. he feels an internal conflict as he balances his desire for approval from augustus with his disdain for the reverence shown to past battles."],
        ap.active_plans = ["To challenge the glorification of Actium as an exaggerated tale.", "To provoke Agrippa and demonstrate his intellectual superiority over the older generation.", "To assert his place in the imperial hierarchy by showcasing his critical thinking."],
        ap.beliefs = ["The tales of past victories are often embellished and do not reflect the true cost of war.", "Youthful perspectives should challenge stale narratives to drive progress.", "He is destined for greater things than merely living in the shadows of his predecessors."],
        ap.goals = ["Short-term: To incite a reaction from Agrippa and engage in a spirited debate.", "Medium-term: To establish himself as a fresh voice in the imperial court that questions tradition.", "Ultimate: To gain recognition and respect as a formidable political player in his own right."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Augustus, seated at the head of the banquet table, watches the tension escalate between Marcellus and Agrippa with growing unease. He raises a hand to signal Thallus, his servant, initiating a non-verbal command to defuse the situation and manage the increasingly strained atmosphere among his guests. His posture stiffens slightly as he attempts to regain control of the convivial facade he had hoped to maintain.',
        ap.emotional_state = 'Beneath a veneer of imperial composure, Augustus is deeply frustrated. Outwardly, he feigns a dismissive amusement at Marcellus\'s youthful arrogance, attempting to wave away the disrespect as mere folly. However, internally, he is annoyed and irritated by Marcellus\'s blatant challenge to Agrippa and the disruption of his carefully planned evening. He feels his authority subtly undermined and the delicate balance of his court disturbed, his initial desire for celebration curdling into exasperation.',
        ap.emotional_tags = ["beneath a veneer of imperial composure, augustus is deeply frustrated. outwardly, he feigns a dismissive amusement at marcellus's youthful arrogance, attempting to wave away the disrespect as mere folly. however, internally, he is annoyed", "irritated by marcellus's blatant challenge to agrippa", "the disruption of his carefully planned evening. he feels his authority subtly undermined", "the delicate balance of his court disturbed, his initial desire for celebration curdling into exasperation.", "beneath a veneer of imperial composure", "augustus is deeply frustrated. outwardly", "he feigns a dismissive amusement at marcellus's youthful arrogance", "attempting to wave away the disrespect as mere folly. however", "internally", "he is annoyed and irritated by marcellus's blatant challenge to agrippa and the disruption of his carefully planned evening. he feels his authority subtly undermined and the delicate balance of his court disturbed", "his initial desire for celebration curdling into exasperation."],
        ap.active_plans = ["Restore order and decorum to the banquet, preventing further public conflict.", "Reassert his paternal authority and maintain the appearance of control over his family and court.", "Assess the underlying tensions between Marcellus and Agrippa and their implications for his succession plans."],
        ap.beliefs = ["Maintaining a semblance of unity and harmony within the imperial family is crucial for projecting strength.", "Public displays of disrespect and discord undermine the authority of the Emperor.", "His role as Emperor requires him to mediate conflicts and ensure the smooth functioning of his court."],
        ap.goals = ["Short-term: Immediately silence the escalating argument and salvage the remainder of the banquet.", "Medium-term: Re-establish his dominance and discourage future challenges to his authority from within his family.", "Ultimate: Secure a peaceful and stable transition of power, ensuring the longevity of his dynasty and the empire's stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Thallus, ever attentive to Augustus\'s needs, stands ready near the Emperor. At Augustus\'s subtle signal, his posture shifts to one of active readiness. He prepares to carry out the implicit command to \'get rid of them\', indicating his role as a discreet facilitator in managing the Emperor\'s social environment and smoothing over any disruptions to the imperial proceedings with practiced efficiency.',
        ap.emotional_state = 'Thallus maintains a professional detachment, his emotional state carefully masked by his subservient role. Outwardly, he is composed and obedient, showing no personal reaction to the escalating tension. Internally, he is focused on anticipating and executing Augustus\'s unspoken wishes, acutely aware of the Emperor\'s mounting displeasure and the need to restore calm. He is driven by a desire to fulfill his duties flawlessly and maintain his position within the imperial household.',
        ap.emotional_tags = ["thallus maintains a professional detachment, his emotional state carefully masked by his subservient role. outwardly, he is composed", "obedient, showing no personal reaction to the escalating tension. internally, he is focused on anticipating", "executing augustus's unspoken wishes, acutely aware of the emperor's mounting displeasure", "the need to restore calm. he is driven by a desire to fulfill his duties flawlessly", "maintain his position within the imperial household.", "thallus maintains a professional detachment", "his emotional state carefully masked by his subservient role. outwardly", "he is composed and obedient", "showing no personal reaction to the escalating tension. internally", "he is focused on anticipating and executing augustus's unspoken wishes", "acutely aware of the emperor's mounting displeasure and the need to restore calm. he is driven by a desire to fulfill his duties flawlessly and maintain his position within the imperial household."],
        ap.active_plans = ["Observe Augustus's cues and anticipate his next command.", "Prepare to discreetly manage the guests, as directed by Augustus, to diffuse the conflict.", "Maintain a professional and unobtrusive presence, ensuring smooth service and minimal disruption to the Emperor's evening."],
        ap.beliefs = ["Unquestioning obedience to Caesar is his primary duty and path to survival.", "A servant's role is to facilitate the Emperor's will and maintain order within the palace.", "Discretion and efficiency are paramount virtues in imperial service."],
        ap.goals = ["Short-term: Effectively carry out Augustus's command to manage the guests and de-escalate the situation.", "Medium-term: Maintain his reputation for competence and loyalty, securing his position as a trusted servant.", "Ultimate: Achieve long-term stability and potentially advancement within the imperial household through consistent and flawless service."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Marcellus remains seated at the banquet table, leaning back with an air of dismissive arrogance as Augustus attempts to intervene. He continues to provoke Agrippa, verbally challenging the significance of the Battle of Actium and openly mocking the general’s achievements. His posture is relaxed yet defiant, his gaze fixed on Agrippa, reveling in the older man\'s rising anger and the disruption he is causing.',
        ap.emotional_state = 'Marcellus is outwardly scornful and self-assured, radiating youthful arrogance and a thinly veiled contempt for Agrippa. Beneath this facade of confidence, however, lies a deep-seated need for validation and a competitive drive to assert his superiority over the established figures of the court. He delights in challenging authority and provoking reactions, fueled by a mixture of ambition and a reckless disregard for social decorum. His internal state is charged with a heady mix of entitlement and a desire to prove himself, even through disrespectful means.',
        ap.emotional_tags = ["marcellus is outwardly scornful", "self-assured, radiating youthful arrogance", "a thinly veiled contempt for agrippa. beneath this facade of confidence, however, lies a deep-seated need for validation", "a competitive drive to assert his superiority over the established figures of the court. he delights in challenging authority", "provoking reactions, fueled by a mixture of ambition", "a reckless disregard for social decorum. his internal state is charged with a heady mix of entitlement", "a desire to prove himself, even through disrespectful means.", "marcellus is outwardly scornful and self-assured", "radiating youthful arrogance and a thinly veiled contempt for agrippa. beneath this facade of confidence", "however", "lies a deep-seated need for validation and a competitive drive to assert his superiority over the established figures of the court. he delights in challenging authority and provoking reactions", "fueled by a mixture of ambition and a reckless disregard for social decorum. his internal state is charged with a heady mix of entitlement and a desire to prove himself", "even through disrespectful means."],
        ap.active_plans = ["Continue to undermine Agrippa's reputation and diminish his military achievements in front of the imperial family.", "Assert his own intellectual and social superiority by openly criticizing established figures and historical events.", "Provoke Agrippa into an uncontrolled outburst, further discrediting the older general in Augustus's eyes."],
        ap.beliefs = ["He is intellectually superior to Agrippa and the older generation of Roman leaders.", "Military achievements are less significant than intellectual prowess and sophisticated courtly demeanor.", "He is destined for greatness and entitled to challenge and surpass those who came before him."],
        ap.goals = ["Short-term: Win the verbal sparring match with Agrippa and humiliate him in front of Augustus and the court.", "Medium-term: Elevate his own standing in Augustus's favor by contrasting himself with Agrippa and other established figures.", "Ultimate: Secure his position as Augustus's heir apparent, overshadowing any potential rivals and solidifying his path to future imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_6'})
    ON CREATE SET
        ap.current_status = 'Agrippa, his weathered face hardening with anger, rises abruptly from the banquet table. He stands tall and rigid, his posture radiating controlled fury as he responds to Marcellus\'s dismissive remarks with sharp, granite-toned words. He physically distances himself from Marcellus and the banquet setting, preparing to depart in a clear display of his displeasure and refusal to tolerate further disrespect.',
        ap.emotional_state = 'Agrippa is outwardly incensed and deeply offended by Marcellus\'s arrogant dismissal of his military achievements and the sacrifices made at Actium. Internally, he seethes with rage and wounded pride, feeling personally attacked and his life\'s work belittled by a callow youth. He struggles to contain his fury, maintaining a semblance of control even as his voice sharpens with barely suppressed anger. Unspoken conflict: Loyalty to Augustus wars with his growing resentment at being undervalued and disrespected within the Emperor\'s own household.',
        ap.emotional_tags = ["agrippa is outwardly incensed", "deeply offended by marcellus's arrogant dismissal of his military achievements", "the sacrifices made at actium. internally, he seethes with rage", "wounded pride, feeling personally attacked", "his life's work belittled by a callow youth. he struggles to contain his fury, maintaining a semblance of control even as his voice sharpens with barely suppressed anger. unspoken conflict: loyalty to augustus wars with his growing resentment at being undervalued", "disrespected within the emperor's own household.", "agrippa is outwardly incensed and deeply offended by marcellus's arrogant dismissal of his military achievements and the sacrifices made at actium. internally", "he seethes with rage and wounded pride", "feeling personally attacked and his life's work belittled by a callow youth. he struggles to contain his fury", "maintaining a semblance of control even as his voice sharpens with barely suppressed anger. unspoken conflict: loyalty to augustus wars with his growing resentment at being undervalued and disrespected within the emperor's own household."],
        ap.active_plans = ["Remove himself from the banquet and the escalating conflict to avoid further engagement with Marcellus's provocations.", "Assert his dignity and refuse to participate in a debate he deems beneath him and disrespectful to the memory of fallen comrades.", "Convey his profound displeasure and wounded pride to Augustus, signaling the gravity of Marcellus's disrespect and its potential consequences."],
        ap.beliefs = ["Military service and personal sacrifice for Rome deserve unwavering respect and acknowledgment.", "Arrogance and disrespect from the young towards their elders are intolerable and reflect a decay in Roman values.", "His contributions to the empire are significant and should not be trivialized or mocked, especially in public."],
        ap.goals = ["Short-term: Exit the banquet with his dignity intact, refusing to further dignify Marcellus's insults with a prolonged response.", "Medium-term: Ensure Augustus understands the gravity of Marcellus's disrespect and the potential damage to Agrippa's loyalty and standing.", "Ultimate: Reassert his influence and authority within the Roman power structure, reminding Augustus of his indispensable value and reclaiming his due respect within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands in her private chambers, her posture poised and commanding. She engages in conversation with Pylades, her tone calm yet laced with an underlying tension as she processes the urgency of the summons from Augustus.',
        ap.emotional_state = 'On the surface, Livia maintains her composed demeanor, but beneath, a storm of ambition simmers. The urgency of Augustus\'s request ignites her strategic instincts, pulling her focus towards the impending political engagement. She feels the familiar pull of control as the shadows of her ambitions loom larger.',
        ap.emotional_tags = ["on the surface", "livia maintains her composed demeanor", "but beneath", "a storm of ambition simmers. the urgency of augustus's request ignites her strategic instincts", "pulling her focus towards the impending political engagement. she feels the familiar pull of control as the shadows of her ambitions loom larger.", "on the surface, livia maintains her composed demeanor,", "beneath, a storm of ambition simmers. the urgency of augustus's request ignites her strategic instincts, pulling her focus towards the impending political engagement. she feels the familiar pull of control as the shadows of her ambitions loom larger."],
        ap.active_plans = ["To quickly prepare herself for the audience with Augustus and Agrippa, ensuring she presents herself as the indispensable advisor.", "To assess the implications of Augustus's summons and strategize her approach to reinforce her influence in the impending discussions.", "To gather any relevant information from Pylades that could give her an edge during her confrontation with Augustus and Agrippa."],
        ap.beliefs = ["Power is held by those who are prepared and can manipulate the situation to their advantage.", "The loyalty of her allies, like Pylades, is crucial to maintaining her influence and executing her plans.", "Her son's destiny is intertwined with her own ambitions; ensuring Tiberius's ascendance is paramount."],
        ap.goals = ["Short-term: To present herself favorably in front of Augustus and Agrippa and understand the purpose of the urgent summons.", "Medium-term: To manipulate the political dynamics in her favor, securing Tiberius's claim to the throne.", "Ultimate: To solidify her legacy as the architect behind the throne, ensuring her family's power endures through Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Pylades stands at the threshold of Livia\'s chambers, having just delivered the urgent message from Augustus. His posture is attentive, eyes fixed on Livia, gauging her reaction while remaining an obedient servant.',
        ap.emotional_state = 'Pylades appears calm and composed outwardly, though internally he feels the weight of the situation. He knows that such an urgent request from Augustus, especially with Agrippa present, signals a significant moment that could affect Livia\'s plans and his own standing.',
        ap.emotional_tags = ["pylades appears calm", "composed outwardly, though internally he feels the weight of the situation. he knows that such an urgent request from augustus, especially with agrippa present, signals a significant moment that could affect livia's plans", "his own standing.", "pylades appears calm and composed outwardly", "though internally he feels the weight of the situation. he knows that such an urgent request from augustus", "especially with agrippa present", "signals a significant moment that could affect livia's plans and his own standing."],
        ap.active_plans = ["To remain alert and responsive to Livia's needs, offering support or intelligence as required.", "To prepare himself for any tasks Livia may need him to undertake following her audience with Augustus.", "To observe and assess the political atmosphere and the implications of the audience with Augustus and Agrippa."],
        ap.beliefs = ["Loyalty to Livia is paramount; her success is intertwined with his own survival and status.", "Information is power, and being well-informed enables him to serve Livia more effectively.", "The dynamics of the imperial court are perilous, and caution must be exercised when navigating them."],
        ap.goals = ["Short-term: To assist Livia in any immediate way she requires before her audience with Augustus.", "Medium-term: To play a role in Livia's plans, ensuring that her ambitions are realized, thus benefiting his position.", "Ultimate: To secure his place within Livia's inner circle as an indispensable operative whose loyalty never falters."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Agrippa stands before Augustus, projecting an image of military readiness and humble service. He maintains direct eye contact, his posture firm yet respectful, gesturing calmly as he articulates his desire to govern Syria. He strategically emphasizes his loyalty and capability, downplaying any personal ambition while subtly asserting his value to the empire. His movements are measured, conveying a controlled strength and seasoned pragmatism.',
        ap.emotional_state = 'Agrippa presents a facade of calm assurance and dutiful submission, carefully concealing any resentment or ambition beneath a veneer of loyal service. Outwardly, he is composed and respectful, his tone steady and measured. However, beneath the surface, a steely resolve and suppressed ambition are palpable. He is likely frustrated by his perceived marginalization in Rome and determined to regain influence, masking these feelings with feigned humility and calculated deference to Augustus.',
        ap.emotional_tags = ["agrippa presents a facade of calm assurance", "dutiful submission, carefully concealing any resentment or ambition beneath a veneer of loyal service. outwardly, he is composed", "respectful, his tone steady", "measured. however, beneath the surface, a steely resolve", "suppressed ambition are palpable. he is likely frustrated by his perceived marginalization in rome", "determined to regain influence, masking these feelings with feigned humility", "calculated deference to augustus.", "agrippa presents a facade of calm assurance and dutiful submission", "carefully concealing any resentment or ambition beneath a veneer of loyal service. outwardly", "he is composed and respectful", "his tone steady and measured. however", "beneath the surface", "a steely resolve and suppressed ambition are palpable. he is likely frustrated by his perceived marginalization in rome and determined to regain influence", "masking these feelings with feigned humility and calculated deference to augustus."],
        ap.active_plans = ["Secure the governorship of Syria, positioning himself in a powerful and independent command.", "Reassure Augustus of his loyalty and dispel any suspicion of rivalry with Marcellus, maintaining a facade of unity.", "Subtly assert his continued value to the empire, highlighting his military expertise and strategic importance, particularly in dealing with Parthia."],
        ap.beliefs = ["His military skills and experience are vital for Rome's security, especially in frontier regions like Syria.", "He is being underutilized and potentially sidelined in Rome, particularly with the rise of Marcellus.", "Strategic positioning and decisive action are essential for maintaining and advancing one's influence within the empire."],
        ap.goals = ["short_term\": \"Gain Augustus's approval and appointment as governor of Syria.", "medium_term\": \"Re-establish his power and prestige by successfully governing Syria and addressing the Parthian threat, demonstrating his indispensable value to Rome.", "ultimate\": \"Position himself for a potential return to Rome with enhanced influence and leverage, possibly even as a viable successor to Augustus, though this ambition remains unspoken."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits regally on his gilded chair, his posture conveying imperial authority, yet his gaze is sharp and probing as he scrutinizes Agrippa. He leans forward slightly, engaging Agrippa directly, his tone alternating between paternal concern and императорская suspicion. He uses rhetorical questions and direct challenges to unmask Agrippa\'s true intentions, subtly testing the boundaries of their long-standing relationship while maintaining an air of control.',
        ap.emotional_state = 'Augustus outwardly maintains a composed and authoritative demeanor, masking his inner turmoil and suspicion. On the surface, he attempts to project an image of paternal understanding and friendship towards Agrippa. However, beneath this facade, he is deeply unsettled and distrustful of Agrippa\'s sudden desire to leave Rome. He feels a flicker of betrayal and insecurity, sensing hidden motives and fearing potential challenges to his authority. There is a palpable tension between his desire to trust his old comrade and his императорская need for absolute control and transparency.',
        ap.emotional_tags = ["augustus outwardly maintains a composed", "authoritative demeanor, masking his inner turmoil", "suspicion. on the surface, he attempts to project an image of paternal understanding", "friendship towards agrippa. however, beneath this facade, he is deeply unsettled", "distrustful of agrippa's sudden desire to leave rome. he feels a flicker of betrayal", "insecurity, sensing hidden motives", "fearing potential challenges to his authority. there is a palpable tension between his desire to trust his old comrade", "his \u0438\u043c\u043f\u0435\u0440\u0430\u0442\u043e\u0440\u0441\u043a\u0430\u044f need for absolute control", "transparency.", "augustus outwardly maintains a composed and authoritative demeanor", "masking his inner turmoil and suspicion. on the surface", "he attempts to project an image of paternal understanding and friendship towards agrippa. however", "beneath this facade", "he is deeply unsettled and distrustful of agrippa's sudden desire to leave rome. he feels a flicker of betrayal and insecurity", "sensing hidden motives and fearing potential challenges to his authority. there is a palpable tension between his desire to trust his old comrade and his \u0438\u043c\u043f\u0435\u0440\u0430\u0442\u043e\u0440\u0441\u043a\u0430\u044f need for absolute control and transparency."],
        ap.active_plans = ["Uncover Agrippa's real motives for wanting to leave Rome, suspecting there's more to it than stated reasons of imperial service.", "Reaffirm his authority over Agrippa, testing his loyalty and ensuring he understands Augustus remains in control of their relationship.", "Assess the potential implications of Agrippa's departure on the political landscape of Rome, considering how it might affect the balance of power and his succession plans."],
        ap.beliefs = ["Loyalty and straightforwardness are paramount, especially from trusted allies like Agrippa, and any deviation raises immediate suspicion.", "He possesses a keen ability to judge character and discern hidden motives, though Agrippa's evasiveness tests this confidence.", "Maintaining absolute control and vigilance over key figures in the empire is crucial for ensuring stability and preventing threats to his rule."],
        ap.goals = ["short_term\": \"Resolve the immediate situation by granting or denying Agrippa's request while attempting to gain clarity on his true intentions.", "medium_term\": \"Re-evaluate his relationship with Agrippa based on this interaction, adjusting his trust and reliance accordingly, and consider the strategic implications of Agrippa's absence.", "ultimate\": \"Secure a stable and predictable succession, ensuring the continued strength and order of the Roman Empire, a goal indirectly threatened by any perceived disloyalty or ambition from key figures like Agrippa."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands slightly behind Augustus, a silent sentinel observing the tense exchange with an air of detached composure. Her physical stillness is contrasted by her active mental engagement, her gaze moving subtly between Augustus and Agrippa, assessing their words and body language. She interjects sparingly but strategically, her voice calm and measured, offering carefully crafted questions and comments designed to subtly influence Augustus\'s perception of Agrippa\'s motives.',
        ap.emotional_state = 'Livia outwardly projects an image of serene support and imperial composure, her expression carefully neutral, betraying little of her inner calculations. Beneath this calm exterior, she is highly alert and strategically focused, her mind dissecting Agrippa\'s words and assessing the power dynamics at play. She feels a controlled sense of anticipation, recognizing Agrippa\'s request as a potential opportunity to advance her own agenda and consolidate her influence over Augustus. There\'s a subtle tension between her outward passivity and her active manipulation of the situation through carefully chosen words and observations.',
        ap.emotional_tags = ["livia outwardly projects an image of serene support", "imperial composure, her expression carefully neutral, betraying little of her inner calculations. beneath this calm exterior, she is highly alert", "strategically focused, her mind dissecting agrippa's words", "assessing the power dynamics at play. she feels a controlled sense of anticipation, recognizing agrippa's request as a potential opportunity to advance her own agenda", "consolidate her influence over augustus. there's a subtle tension between her outward passivity", "her active manipulation of the situation through carefully chosen words", "observations.", "livia outwardly projects an image of serene support and imperial composure", "her expression carefully neutral", "betraying little of her inner calculations. beneath this calm exterior", "she is highly alert and strategically focused", "her mind dissecting agrippa's words and assessing the power dynamics at play. she feels a controlled sense of anticipation", "recognizing agrippa's request as a potential opportunity to advance her own agenda and consolidate her influence over augustus. there's a subtle tension between her outward passivity and her active manipulation of the situation through carefully chosen words and observations."],
        ap.active_plans = ["Gauge the true extent of Agrippa's ambition and assess whether his departure genuinely diminishes his threat to her own plans for Tiberius.", "Subtly reinforce Augustus's suspicions about Agrippa's motives, nudging him towards a decision that aligns with her strategic goals, even if it means appearing neutral.", "Maintain her position as Augustus's trusted advisor and confidante, using this influence to subtly steer the conversation and shape the outcome of the interaction to her advantage."],
        ap.beliefs = ["Agrippa poses a significant obstacle to her ambitions for Tiberius and needs to be strategically managed, if not eliminated, from the immediate power dynamics in Rome.", "Subtle manipulation and strategic counsel are more effective tools of power than overt confrontation, allowing her to control outcomes from behind the scenes.", "Long-term strategic planning and patience are essential for achieving her ultimate goals, requiring careful orchestration of events and individuals over time."],
        ap.goals = ["short_term\": \"Ensure Agrippa's request to leave Rome is granted by Augustus, facilitating his removal from the immediate Roman political scene.", "medium_term\": \"Monitor Agrippa's activities in Syria and assess his potential for future influence or threat, remaining prepared to counteract any resurgence of his power.", "ultimate\": \"Secure Tiberius's unchallenged succession to the throne, consolidating her family's dynasty and ensuring her enduring influence over the Roman Empire, with Agrippa's departure serving as a tactical step in this larger strategic ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Agrippa stands before Augustus, his posture confident yet defensive, maintaining eye contact as he asserts his value to the empire. He gestures slightly with his hands as he speaks, attempting to convey sincerity and conviction in his words.',
        ap.emotional_state = 'Agrippa presents a calm exterior, but beneath the surface, he feels a growing unease and frustration. He is acutely aware of Augustus\'s suspicions and feels compelled to defend his intentions while grappling with a mix of fondness for Marcellus and irritation at the insinuations against him.',
        ap.emotional_tags = ["agrippa presents a calm exterior, but beneath the surface, he feels a growing unease", "frustration. he is acutely aware of augustus's suspicions", "feels compelled to defend his intentions while grappling with a mix of fondness for marcellus", "irritation at the insinuations against him.", "agrippa presents a calm exterior", "but beneath the surface", "he feels a growing unease and frustration. he is acutely aware of augustus's suspicions and feels compelled to defend his intentions while grappling with a mix of fondness for marcellus and irritation at the insinuations against him.", "agrippa presents a calm exterior, but beneath the surface, he feels a growing unease and frustration. he is acutely aware of augustus's suspicions and feels compelled to defend his intentions", "grappling with a mix of fondness for marcellus and irritation at the insinuations against him.", "agrippa presents a calm exterior,", "beneath the surface, he feels a growing unease and frustration. he is acutely aware of augustus's suspicions and feels compelled to defend his intentions while grappling with a mix of fondness for marcellus and irritation at the insinuations against him."],
        ap.active_plans = ["Convince Augustus of his loyalty and continued usefulness to the empire.", "Reassure Augustus that he harbors no ill will towards Marcellus.", "Strategically position himself for the governorship of Syria to enhance his influence."],
        ap.beliefs = ["Loyalty to Rome is paramount, and he must prove his worth to Augustus.", "Political maneuvering is necessary for survival in the imperial court.", "Personal relationships should not interfere with duty and ambition."],
        ap.goals = ["Short-term: Maintain his current standing in Augustus's favor.", "Medium-term: Secure the governorship of Syria as a platform for power.", "Ultimate: Ensure his influence in Rome and protect his legacy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits regally in a gilded chair, leaning forward slightly as he questions Agrippa. His expression is a mix of confusion and suspicion, and he gestures for emphasis as he tries to probe Agrippa\'s true intentions.',
        ap.emotional_state = 'Augustus is increasingly frustrated and paranoid, feeling threatened by Agrippa\'s request to leave Rome. He grapples with a sense of betrayal and insecurity, suspecting that Agrippa may be positioning himself as a rival.',
        ap.emotional_tags = ["augustus is increasingly frustrated", "paranoid, feeling threatened by agrippa's request to leave rome. he grapples with a sense of betrayal", "insecurity, suspecting that agrippa may be positioning himself as a rival.", "augustus is increasingly frustrated and paranoid", "feeling threatened by agrippa's request to leave rome. he grapples with a sense of betrayal and insecurity", "suspecting that agrippa may be positioning himself as a rival."],
        ap.active_plans = ["Assure Agrippa that his role in Rome is still crucial.", "Uncover the truth behind Agrippa's motivations for wanting to leave.", "Reassert his authority as emperor and maintain control over the succession narrative."],
        ap.beliefs = ["He must maintain a tight grip on power to prevent betrayal.", "Succession must be carefully managed to secure Rome's future.", "Trust is a rare commodity that must be earned and safeguarded."],
        ap.goals = ["Short-term: Confirm Agrippa's loyalty and intentions.", "Medium-term: Strategically plan for the future succession of Rome.", "Ultimate: Preserve his legacy and ensure the stability of his empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands slightly behind Augustus, her posture composed and watchful. Her eyes are sharp as she observes the exchange between Augustus and Agrippa, her expression inscrutable yet filled with calculated intent.',
        ap.emotional_state = 'Livia maintains a calm exterior, but internally, she feels a surge of ambition and desire for control. She senses Augustus\'s insecurity and recognizes an opportunity to subtly manipulate the situation to her advantage by advocating for Agrippa\'s return.',
        ap.emotional_tags = ["livia maintains a calm exterior, but internally, she feels a surge of ambition", "desire for control. she senses augustus's insecurity", "recognizes an opportunity to subtly manipulate the situation to her advantage by advocating for agrippa's return.", "livia maintains a calm exterior", "but internally", "she feels a surge of ambition and desire for control. she senses augustus's insecurity and recognizes an opportunity to subtly manipulate the situation to her advantage by advocating for agrippa's return.", "livia maintains a calm exterior,", "internally, she feels a surge of ambition and desire for control. she senses augustus's insecurity and recognizes an opportunity to subtly manipulate the situation to her advantage by advocating for agrippa's return."],
        ap.active_plans = ["Encourage Augustus to reconsider the value of Agrippa in Rome.", "Advocate for her son Tiberius's future while keeping Agrippa close.", "Manipulate the narrative around Agrippa's departure to serve her own interests."],
        ap.beliefs = ["The power dynamics of the court must be carefully managed for her family's benefit.", "Marcus Agrippa is a potential threat to her ambitions for Tiberius.", "Control and influence are best wielded through subtlety rather than overt confrontation."],
        ap.goals = ["Short-term: Ensure Agrippa remains within her sphere of influence.", "Medium-term: Position Tiberius as the rightful successor in the eyes of Augustus.", "Ultimate: Secure her family's dynasty and power over the Roman Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Agrippa stands before Augustus in the private audience chamber, his posture ramrod straight despite the subtle game he plays. He engages in a verbal dance with the Emperor, feigning deference and agreement while subtly pushing his own agenda. His movements are economical, his gestures controlled, each word carefully chosen to project an image of loyal service and strategic clarity as he requests governorship of Syria.',
        ap.emotional_state = 'Beneath a veneer of calm respect and even feigned fondness for Marcellus, Agrippa simmers with ambition and a keen sense of being undervalued. He outwardly expresses a composed demeanor, yet internally he feels a growing resentment at being sidelined in favor of younger, less experienced figures. There\'s a subtle tension in his voice, a controlled frustration that hints at unspoken desires for greater recognition and influence, masked by a strategic facade of loyalty.',
        ap.emotional_tags = ["beneath a veneer of calm respect", "even feigned fondness for marcellus, agrippa simmers with ambition", "a keen sense of being undervalued. he outwardly expresses a composed demeanor, yet internally he feels a growing resentment at being sidelined in favor of younger, less experienced figures. there's a subtle tension in his voice, a controlled frustration that hints at unspoken desires for greater recognition", "influence, masked by a strategic facade of loyalty.", "beneath a veneer of calm respect and even feigned fondness for marcellus", "agrippa simmers with ambition and a keen sense of being undervalued. he outwardly expresses a composed demeanor", "yet internally he feels a growing resentment at being sidelined in favor of younger", "less experienced figures. there's a subtle tension in his voice", "a controlled frustration that hints at unspoken desires for greater recognition and influence", "masked by a strategic facade of loyalty."],
        ap.active_plans = ["Secure the governorship of Syria as a strategic power base outside of Rome.", "Maintain a facade of unwavering loyalty to Augustus to avoid direct confrontation.", "Subtly undermine Marcellus's perceived competence to highlight his own indispensability to the empire."],
        ap.beliefs = ["His military and strategic acumen are essential for the stability of the Roman Empire.", "Augustus, in his old age, is becoming increasingly susceptible to courtly flatteries and blind to true merit.", "He deserves greater autonomy and command to effectively serve Rome's interests."],
        ap.goals = ["short-term\": \"To successfully convince Augustus to grant him the governorship of Syria and depart Rome with imperial approval.", "medium-term\": \"To consolidate his power and influence in Syria, proving his continued value to Rome and potentially outshining rivals in the capital.", "ultimate\": \"To position himself as a vital and indispensable figure within the empire, ensuring his relevance and potentially influencing the future succession of Rome, should the opportunity arise."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Augustus sits enthroned, physically imposing yet revealing subtle signs of age in his weariness and suspicion. He leans forward, scrutinizing Agrippa with a penetrating gaze, attempting to decipher the general\'s true motives behind his request to leave Rome. He gestures with imperial authority, yet his questions betray an underlying insecurity and a desire to reassert control over a situation that feels increasingly slippery.',
        ap.emotional_state = 'Augustus projects an outward air of imperial authority and controlled questioning, but beneath the surface, he is wrestling with insecurity and suspicion regarding Agrippa\'s intentions. He expresses confusion and a need for clarity, yet internally he feels a growing unease and a sense of being manipulated. There\'s a flicker of anger when Agrippa exits, revealing a frustration that his authority is being subtly challenged, despite his attempts to maintain composure.',
        ap.emotional_tags = ["augustus projects an outward air of imperial authority", "controlled questioning, but beneath the surface, he is wrestling with insecurity", "suspicion regarding agrippa's intentions. he expresses confusion", "a need for clarity, yet internally he feels a growing unease", "a sense of being manipulated. there's a flicker of anger when agrippa exits, revealing a frustration that his authority is being subtly challenged, despite his attempts to maintain composure.", "augustus projects an outward air of imperial authority and controlled questioning", "but beneath the surface", "he is wrestling with insecurity and suspicion regarding agrippa's intentions. he expresses confusion and a need for clarity", "yet internally he feels a growing unease and a sense of being manipulated. there's a flicker of anger when agrippa exits", "revealing a frustration that his authority is being subtly challenged", "despite his attempts to maintain composure.", "augustus projects an outward air of imperial authority and controlled questioning,", "beneath the surface, he is wrestling with insecurity and suspicion regarding agrippa's intentions. he expresses confusion and a need for clarity, yet internally he feels a growing unease and a sense of being manipulated. there's a flicker of anger when agrippa exits, revealing a frustration that his authority is being subtly challenged, despite his attempts to maintain composure."],
        ap.active_plans = ["Uncover Agrippa's real motivations for wanting to leave Rome, beyond the stated reasons.", "Reaffirm his imperial authority and ensure Agrippa understands his subordinate position.", "Maintain the facade of a strong and unified leadership to both Agrippa and Livia, despite internal uncertainties."],
        ap.beliefs = ["Loyalty and transparency are paramount, especially from trusted allies like Agrippa.", "As Emperor, he is entitled to complete honesty and obedience from those in his service.", "He must remain vigilant against any perceived threats to his power, even from long-time comrades."],
        ap.goals = ["short-term\": \"To extract the 'real reason' for Agrippa's departure request during this audience, seeking to penetrate Agrippa's veiled intentions.", "medium-term\": \"To ensure the continued stability and control of the Roman Empire by managing the ambitions of key figures like Agrippa and Marcellus.", "ultimate\": \"To secure a peaceful and unchallenged succession, preserving his legacy and the dynasty he has established for Rome, despite the growing complexities and tensions within his inner circle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands subtly behind Augustus, a silent yet keenly observant presence in the audience chamber. Her physical stillness belies her active mind, as she watches and listens intently to the exchange between Augustus and Agrippa. She interjects sparingly but strategically, her posture composed and controlled, reflecting her calculated approach to courtly dynamics and power manipulation.',
        ap.emotional_state = 'Livia outwardly presents a calm and supportive demeanor, interjecting with seemingly helpful suggestions, yet internally she is calculating and strategic. She expresses a surface agreement with Agrippa\'s departure, but beneath this facade lies a deep suspicion of his motives and a determination to steer events to her advantage. There\'s an unspoken sense of control and manipulation in her calm demeanor, a subtle threat veiled within her composed and ‘helpful’ interventions.',
        ap.emotional_tags = ["livia outwardly presents a calm", "supportive demeanor, interjecting with seemingly helpful suggestions, yet internally she is calculating", "strategic. she expresses a surface agreement with agrippa's departure, but beneath this facade lies a deep suspicion of his motives", "a determination to steer events to her advantage. there's an unspoken sense of control", "manipulation in her calm demeanor, a subtle threat veiled within her composed", "\u2018helpful\u2019 interventions.", "livia outwardly presents a calm and supportive demeanor", "interjecting with seemingly helpful suggestions", "yet internally she is calculating and strategic. she expresses a surface agreement with agrippa's departure", "but beneath this facade lies a deep suspicion of his motives and a determination to steer events to her advantage. there's an unspoken sense of control and manipulation in her calm demeanor", "a subtle threat veiled within her composed and \u2018helpful\u2019 interventions.", "livia outwardly presents a calm and supportive demeanor, interjecting with seemingly helpful suggestions, yet internally she is calculating and strategic. she expresses a surface agreement with agrippa's departure,", "beneath this facade lies a deep suspicion of his motives and a determination to steer events to her advantage. there's an unspoken sense of control and manipulation in her calm demeanor, a subtle threat veiled within her composed and \u2018helpful\u2019 interventions."],
        ap.active_plans = ["Subtly undermine Augustus's trust in Agrippa by questioning his motivations and suggesting hidden agendas.", "Plant the idea of recalling Agrippa on her own terms and timing, ensuring it serves her strategic purposes.", "Reinforce her position as Augustus's trusted advisor, subtly guiding his decisions and maintaining her influence over him."],
        ap.beliefs = ["Agrippa's ambition poses a potential threat to her son Tiberius's future succession.", "Augustus, while powerful, is increasingly reliant on her strategic insight and guidance.", "Control over information and strategic timing are crucial tools for maintaining and expanding her power within the empire."],
        ap.goals = ["short-term\": \"To subtly influence Augustus to view Agrippa's departure with suspicion and consider Livia's strategic perspective on his recall.", "medium-term\": \"To weaken Agrippa's independent power base and ensure that his eventual return is on terms favorable to her and Tiberius's ambitions.", "ultimate\": \"To secure Tiberius's unchallenged succession to the imperial throne, solidifying her family's dynasty and ensuring her continued influence as Empress Mother, manipulating events to maintain long-term control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Augustus sits regally on his gilded chair, eyes narrowed and brow furrowed, signaling both authority and irritation. His posture is tense, hands clenched at his side as he engages Agrippa, his voice a mix of paternal authority and latent frustration, reflecting the struggle for control.',
        ap.emotional_state = 'Augustus is simmering with anger and insecurity, feeling challenged by Agrippa’s request to leave Rome. His outward demeanor is that of a ruler in control, yet internally, he wrestles with feelings of inadequacy and the fear of losing his grip on power, particularly in the face of potential succession threats.',
        ap.emotional_tags = ["augustus is simmering with anger", "insecurity, feeling challenged by agrippa\u2019s request to leave rome. his outward demeanor is that of a ruler in control, yet internally, he wrestles with feelings of inadequacy", "the fear of losing his grip on power, particularly in the face of potential succession threats.", "augustus is simmering with anger and insecurity", "feeling challenged by agrippa\u2019s request to leave rome. his outward demeanor is that of a ruler in control", "yet internally", "he wrestles with feelings of inadequacy and the fear of losing his grip on power", "particularly in the face of potential succession threats."],
        ap.active_plans = ["To assert his authority over Agrippa and reassert his control over the political landscape of Rome.", "To understand Agrippa's true motivations for wanting to leave and gauge potential threats to his power.", "To reassure himself of the loyalty of those around him, especially in light of Agrippa's departure."],
        ap.beliefs = ["Power must be maintained at all costs, and any indication of weakness can be exploited by rivals.", "True loyalty is rare and must be constantly evaluated, especially among close allies.", "Leadership requires a careful balance of trust and suspicion; one must always be vigilant."],
        ap.goals = ["Short-term: To manage Agrippa's departure without appearing weak or indecisive.", "Medium-term: To maintain control over the narrative of succession and solidify his position.", "Ultimate: To ensure a stable and secure succession plan that does not threaten his legacy or authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands slightly behind Augustus, her body language poised and calculating, observing the exchange with a predatory gaze. Her posture is relaxed but alert, indicating her readiness to interject strategically. She absorbs every nuance of the conversation, her expression carefully crafted to convey neutrality while masking her deeper intentions.',
        ap.emotional_state = 'Livia\'s emotional state is one of icy resolve and concealed ambition. While she maintains an appearance of calm, internally, she is calculating and scheming, keenly aware of the implications of Agrippa\'s departure and the potential shifts in power dynamics. Her words are laced with subtle manipulation, pushing Augustus to reconsider his decisions.',
        ap.emotional_tags = ["livia's emotional state is one of icy resolve", "concealed ambition. while she maintains an appearance of calm, internally, she is calculating", "scheming, keenly aware of the implications of agrippa's departure", "the potential shifts in power dynamics. her words are laced with subtle manipulation, pushing augustus to reconsider his decisions.", "livia's emotional state is one of icy resolve and concealed ambition. while she maintains an appearance of calm", "internally", "she is calculating and scheming", "keenly aware of the implications of agrippa's departure and the potential shifts in power dynamics. her words are laced with subtle manipulation", "pushing augustus to reconsider his decisions."],
        ap.active_plans = ["To manipulate Augustus's perception of Agrippa, instilling doubt and concern about his loyalty.", "To position her son, Tiberius, favorably in Augustus\u2019s eyes while sowing discord about potential successors.", "To ensure that Agrippa's influence is curtailed, thereby increasing her own power within the court."],
        ap.beliefs = ["The ends justify the means; ambition must be pursued relentlessly.", "Trust is a liability in the world of power; control is essential to survival.", "Securing her son's future as the heir requires the elimination of any rivals, especially well-liked ones like Agrippa."],
        ap.goals = ["Short-term: To influence Augustus's decisions regarding Agrippa and ensure he remains wary of him.", "Medium-term: To position Tiberius as a strong contender for succession over Agrippa or any other potential rivals.", "Ultimate: To solidify her family's grip on power in Rome and ensure Tiberius\u2019s ascendance to the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits enthroned in his private audience chamber, summoning Tiberius with an air of imperial command. He delivers a brief, business-like send-off, focusing on the practicalities of Tiberius\'s military assignment in Germany.  He gestures dismissively, eager to conclude the meeting and return to his vast array of imperial responsibilities, effectively cutting short any possibility of personal interaction.',
        ap.emotional_state = 'On the surface, Augustus projects an image of detached efficiency and imperial duty, his tone curt and impersonal, lacking any warmth or paternal affection. Beneath this facade, he seems impatient and perhaps indifferent towards Tiberius. There\'s a subtle undercurrent of dismissal, as if Tiberius is merely another task to be checked off his list, rather than a stepson deserving of genuine care or consideration.',
        ap.emotional_tags = ["on the surface, augustus projects an image of detached efficiency", "imperial duty, his tone curt", "impersonal, lacking any warmth or paternal affection. beneath this facade, he seems impatient", "perhaps indifferent towards tiberius. there's a subtle undercurrent of dismissal, as if tiberius is merely another task to be checked off his list, rather than a stepson deserving of genuine care or consideration.", "on the surface", "augustus projects an image of detached efficiency and imperial duty", "his tone curt and impersonal", "lacking any warmth or paternal affection. beneath this facade", "he seems impatient and perhaps indifferent towards tiberius. there's a subtle undercurrent of dismissal", "as if tiberius is merely another task to be checked off his list", "rather than a stepson deserving of genuine care or consideration."],
        ap.active_plans = ["To formally dispatch Tiberius to his military command in Germany.", "To maintain an image of a busy and efficient emperor, focused on the needs of the empire.", "To keep Tiberius at a distance, avoiding any personal or emotional engagement that might complicate the political landscape."],
        ap.beliefs = ["The strength of the Roman Empire relies heavily on competent military leadership.", "Personal sentiment should not interfere with the execution of imperial duties.", "Tiberius, while useful, is not someone he feels a close paternal bond with or perhaps even trusts implicitly."],
        ap.goals = ["short-term: To quickly and efficiently conclude the audience with Tiberius and send him to Germany.", "medium-term: To ensure the stability of the empire's borders by deploying capable generals like Tiberius.", "ultimate: To maintain absolute control over the empire and ensure its continued strength and prosperity, even if it means sacrificing personal familial warmth for political expediency."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the Private Audience Chamber and bows stiffly before Augustus, maintaining a formal and reserved posture. He listens intently to Augustus\'s brief instructions regarding his deployment to Germany, responding concisely and dutifully. Upon Augustus\'s abrupt exit, Tiberius remains, staring after him with an unreadable expression, before turning to Livia to express his feelings of rejection.',
        ap.emotional_state = 'Outwardly, Tiberius displays a stoic and controlled demeanor, reflecting his usual reserved nature and the formality of the imperial court. However, beneath this composed exterior, he is deeply affected by Augustus\'s coldness, feeling unliked and unwanted by his stepfather. There\'s a sense of resignation and hurt, but also a quiet anger simmering beneath the surface, fueled by years of perceived neglect and lack of paternal affection from Augustus.',
        ap.emotional_tags = ["outwardly, tiberius displays a stoic", "controlled demeanor, reflecting his usual reserved nature", "the formality of the imperial court. however, beneath this composed exterior, he is deeply affected by augustus's coldness, feeling unliked", "unwanted by his stepfather. there's a sense of resignation", "hurt, but also a quiet anger simmering beneath the surface, fueled by years of perceived neglect", "lack of paternal affection from augustus.", "outwardly", "tiberius displays a stoic and controlled demeanor", "reflecting his usual reserved nature and the formality of the imperial court. however", "beneath this composed exterior", "he is deeply affected by augustus's coldness", "feeling unliked and unwanted by his stepfather. there's a sense of resignation and hurt", "but also a quiet anger simmering beneath the surface", "fueled by years of perceived neglect and lack of paternal affection from augustus.", "outwardly, tiberius displays a stoic and controlled demeanor, reflecting his usual reserved nature and the formality of the imperial court. however, beneath this composed exterior, he is deeply affected by augustus's coldness, feeling unliked and unwanted by his stepfather. there's a sense of resignation and hurt,", "also a quiet anger simmering beneath the surface, fueled by years of perceived neglect and lack of paternal affection from augustus."],
        ap.active_plans = ["To present himself as a dutiful and obedient stepson, accepting Augustus's orders without question.", "To endure the brief and impersonal audience with Augustus as quickly as possible.", "To seek some form of emotional validation or understanding from Livia after the encounter with Augustus, expressing his feelings of rejection."],
        ap.beliefs = ["Augustus holds a deep-seated dislike for him, perceiving him as unlovable.", "His own reserved nature and lack of outward charm are impediments to gaining Augustus's favor.", "Despite Augustus's coldness, fulfilling his military duties diligently is crucial for his own standing and future prospects within the empire."],
        ap.goals = ["short-term: To navigate the audience with Augustus without displaying any outward sign of his hurt or resentment.", "medium-term: To prove his worth as a military commander in Germany, hoping to earn some measure of respect or recognition, if not affection, from Augustus and Rome.", "ultimate: To overcome the perception of being disliked and to ultimately achieve a position of power and influence within the Roman Empire, potentially surpassing even Marcellus and Agrippa in the long run, driven partly by a desire to prove himself despite Augustus's disapproval."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands stiffly in the Private Audience Chamber, his posture rigid and his gaze fixed on the doorway through which Augustus has just exited. He expresses his frustration and disappointment with Augustus\'s abrupt departure, revealing his feelings of being unloved and unappreciated.',
        ap.emotional_state = 'Tiberius is marked by a simmering resentment and a sense of inadequacy. On the surface, he appears stoic and composed, but beneath this façade lies a deep wound of rejection that festers in the shadows of his heart. His feelings of isolation are accentuated by Livia\'s attempts at manipulation, further complicating his emotional landscape.',
        ap.emotional_tags = ["tiberius is marked by a simmering resentment", "a sense of inadequacy. on the surface, he appears stoic", "composed, but beneath this fa\u00e7ade lies a deep wound of rejection that festers in the shadows of his heart. his feelings of isolation are accentuated by livia's attempts at manipulation, further complicating his emotional landscape.", "tiberius is marked by a simmering resentment and a sense of inadequacy. on the surface", "he appears stoic and composed", "but beneath this fa\u00e7ade lies a deep wound of rejection that festers in the shadows of his heart. his feelings of isolation are accentuated by livia's attempts at manipulation", "further complicating his emotional landscape.", "tiberius is marked by a simmering resentment and a sense of inadequacy. on the surface, he appears stoic and composed,", "beneath this fa\u00e7ade lies a deep wound of rejection that festers in the shadows of his heart. his feelings of isolation are accentuated by livia's attempts at manipulation, further complicating his emotional landscape."],
        ap.active_plans = ["To express his discontent with Augustus and seek understanding from Livia.", "To navigate the complexities of familial relationships while asserting his own identity.", "To rely on Livia's guidance to strengthen his position within the imperial family."],
        ap.beliefs = ["He believes that loyalty should be reciprocated, yet he feels that Augustus's disdain undermines this notion.", "Tiberius harbors a conviction that his worth is tied to his accomplishments and recognition from his stepfather.", "He holds a belief that familial bonds should provide support, yet he perceives himself as an outsider."],
        ap.goals = ["Short-term: To gain a clearer sense of his standing with Augustus and Livia.", "Medium-term: To establish a more meaningful relationship with Augustus and prove his worth.", "Ultimate: To secure his place in the line of succession and gain acceptance within the imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Livia remains poised and calculating as she engages Tiberius in conversation, her body language exuding a subtle dominance. She addresses his grievances and uses her words to redirect his feelings toward a sense of purpose and patience, all while maintaining an air of maternal authority.',
        ap.emotional_state = 'Livia\'s emotional state is one of cool detachment masked by an underlying ambition and determination. She expresses mock concern for Tiberius\'s feelings yet seeks to manipulate the conversation to reinforce her own plans. Her strategic mind races as she ponders the implications of Tiberius\'s resentment and how to use it to her advantage.',
        ap.emotional_tags = ["livia's emotional state is one of cool detachment masked by an underlying ambition", "determination. she expresses mock concern for tiberius's feelings yet seeks to manipulate the conversation to reinforce her own plans. her strategic mind races as she ponders the implications of tiberius's resentment", "how to use it to her advantage."],
        ap.active_plans = ["To reinforce Tiberius's reliance on her and persuade him to embrace patience as a virtue.", "To redirect Tiberius's frustrations towards a focus on achieving glory in military endeavors.", "To manipulate the narrative of familial loyalty, ensuring Tiberius understands his value to her ambitions."],
        ap.beliefs = ["She believes that Tiberius's potential lies in his obedience and adherence to her guidance.", "Livia holds a conviction that using patience and strategic thinking leads to long-term success in politics.", "She is steadfast in her belief that familial bonds can be leveraged for power and influence."],
        ap.goals = ["Short-term: To ensure Tiberius remains focused on his military duties and loyal to her ambitions.", "Medium-term: To position Tiberius as a contender for power while suppressing any dissent against Augustus.", "Ultimate: To secure Tiberius's ascension to the throne, thus solidifying her dynasty's influence over the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the private audience chamber with Tiberius, composed and imperious after Augustus\'s abrupt departure. She fixes Tiberius with a sharp gaze, dismissing his self-pity and launching into a strategic lecture, her body language radiating control and unwavering resolve.',
        ap.emotional_state = 'Livia is outwardly dismissive and pragmatic, showing little patience for Tiberius\'s emotional vulnerability. Beneath the surface, she is driven by her ambition for Tiberius, masking any maternal warmth with a steely resolve. She experiences a flicker of annoyance at Tiberius\'s self-pity and lack of strategic vision, but remains focused on manipulating him towards her goals.',
        ap.emotional_tags = ["livia is outwardly dismissive", "pragmatic, showing little patience for tiberius's emotional vulnerability. beneath the surface, she is driven by her ambition for tiberius, masking any maternal warmth with a steely resolve. she experiences a flicker of annoyance at tiberius's self-pity", "lack of strategic vision, but remains focused on manipulating him towards her goals.", "livia is outwardly dismissive and pragmatic", "showing little patience for tiberius's emotional vulnerability. beneath the surface", "she is driven by her ambition for tiberius", "masking any maternal warmth with a steely resolve. she experiences a flicker of annoyance at tiberius's self-pity and lack of strategic vision", "but remains focused on manipulating him towards her goals.", "livia is outwardly dismissive and pragmatic, showing little patience for tiberius's emotional vulnerability. beneath the surface, she is driven by her ambition for tiberius, masking any maternal warmth with a steely resolve. she experiences a flicker of annoyance at tiberius's self-pity and lack of strategic vision,", "remains focused on manipulating him towards her goals."],
        ap.active_plans = ["Dismiss Tiberius's self-pity and redirect his focus to ambition and strategic thinking.", "Reassure Tiberius about his destiny and future prospects using the 'prophetic chickens' anecdote.", "Instill patience and long-term strategic thinking in Tiberius, mirroring her own calculated approach to gaining power."],
        ap.beliefs = ["Destiny and omens are significant indicators of future success, as demonstrated by the 'prophetic chickens'.", "Patience and long-term strategic planning are crucial for achieving and maintaining power.", "Tiberius is destined for greatness, but he needs to cultivate patience and strategic acumen to realize his potential."],
        ap.goals = ["Short-term: To bolster Tiberius's confidence and redirect his self-pity into ambition before he departs for Germania.", "Medium-term: To ensure Tiberius achieves military success in Germania, enhancing his reputation and power base.", "Ultimate: To secure the imperial succession for Tiberius, fulfilling her long-term ambition for her son to rule Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands stiffly before Livia, his body language reflecting resentment and suppressed emotion. He stares after Augustus\'s retreating figure, then turns to Livia, engaging in a tense exchange, his posture suggesting a mix of defiance and resignation in the face of his mother\'s dominating presence.',
        ap.emotional_state = 'Tiberius is emotionally raw and resentful, feeling deeply unloved and dismissed by Augustus. He outwardly expresses self-pity and frustration, his tone laced with bitterness and a sense of being undervalued. Internally, he craves recognition and affection from Augustus, while simultaneously harboring a skeptical and somewhat dismissive attitude towards Livia\'s reassurances and prophecies.',
        ap.emotional_tags = ["tiberius is emotionally raw", "resentful, feeling deeply unloved", "dismissed by augustus. he outwardly expresses self-pity", "frustration, his tone laced with bitterness", "a sense of being undervalued. internally, he craves recognition", "affection from augustus, while simultaneously harboring a skeptical", "somewhat dismissive attitude towards livia's reassurances", "prophecies.", "tiberius is emotionally raw and resentful", "feeling deeply unloved and dismissed by augustus. he outwardly expresses self-pity and frustration", "his tone laced with bitterness and a sense of being undervalued. internally", "he craves recognition and affection from augustus", "while simultaneously harboring a skeptical and somewhat dismissive attitude towards livia's reassurances and prophecies.", "tiberius is emotionally raw and resentful, feeling deeply unloved and dismissed by augustus. he outwardly expresses self-pity and frustration, his tone laced with bitterness and a sense of being undervalued. internally, he craves recognition and affection from augustus,", "simultaneously harboring a skeptical and somewhat dismissive attitude towards livia's reassurances and prophecies."],
        ap.active_plans = ["Express his bitterness and self-pity regarding Augustus's evident dislike for him.", "Challenge Livia's attempt to reassure him with the 'prophetic chickens' story, displaying skepticism and impatience.", "Acknowledge the need to perform well in Germania, driven by a competitive desire to match his brother's (step-brother's) success, albeit tinged with resentment."],
        ap.beliefs = ["Augustus harbors a genuine dislike for him, making any attempt to gain his favor futile.", "His own reserved nature and lack of charisma are inherent and unchangeable flaws.", "He must constantly strive to prove his worth and competence, especially in comparison to more favored rivals like Marcellus."],
        ap.goals = ["Short-term: To voice his frustration and seek a modicum of sympathy or understanding from Livia, even if he expects little genuine comfort.", "Medium-term: To achieve military glory in Germania, demonstrating his competence and potentially earning a measure of respect, if not affection, from Augustus.", "Ultimate: To ultimately attain power and recognition, potentially even the imperial throne, driven by a combination of personal ambition and his mother's relentless influence, though currently overshadowed by feelings of inadequacy and resentment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands poised and powerful, her posture exuding confidence as she speaks to Tiberius. She holds his gaze intently, her expressions shifting from maternal affection to an authoritative commanding presence. Her gestures are precise, using her hands to illustrate her elaborate visions for his future.',
        ap.emotional_state = 'Livia\'s surface demeanor is calm and calculated, exuding a maternal warmth that contrasts sharply with her underlying ambition. Internally, she is fiercely determined, pushing Tiberius to embrace his destiny and unlock his potential. There is an unspoken tension as she balances nurturing with manipulation, reminding him of the stakes at play.',
        ap.emotional_tags = ["livia's surface demeanor is calm", "calculated, exuding a maternal warmth that contrasts sharply with her underlying ambition. internally, she is fiercely determined, pushing tiberius to embrace his destiny", "unlock his potential. there is an unspoken tension as she balances nurturing with manipulation, reminding him of the stakes at play.", "livia's surface demeanor is calm and calculated", "exuding a maternal warmth that contrasts sharply with her underlying ambition. internally", "she is fiercely determined", "pushing tiberius to embrace his destiny and unlock his potential. there is an unspoken tension as she balances nurturing with manipulation", "reminding him of the stakes at play."],
        ap.active_plans = ["Guide Tiberius towards military success in Germany to solidify his standing in the empire.", "Instill a sense of patience in Tiberius, emphasizing long-term strategy over immediate results.", "Diminish the threats posed by Marcellus and Agrippa by positioning Tiberius as the favored and capable son."],
        ap.beliefs = ["Patience is necessary for achieving power and ambition, as shown through her own strategic maneuvers.", "Her intrinsic role as a mother is to mold Tiberius into a strong leader for the empire.", "The eventuality of a singular ruler is inevitable; foresight and cunning are essential to secure her family's dominance."],
        ap.goals = ["Short-term: Ensure Tiberius leaves for the Rhine with a resolute sense of purpose.", "Medium-term: Position Tiberius as the rightful successor through successful military campaigns.", "Ultimate: Secure Tiberius\u2019s dominion over the empire, ensuring the legacy of her family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly, a mix of deference and frustration evident in his demeanor. He bows stiffly before Augustus and maintains a fixed gaze on Livia as they converse, his body language reflecting tension and uncertainty about his place in the family and the empire.',
        ap.emotional_state = 'On the surface, Tiberius appears resigned, acknowledging his mother’s ambitions while feeling the weight of expectation and dissatisfaction with his perceived lack of favor from Augustus. Internally, he is torn between a desire for acknowledgment and frustration at the limitations placed upon him by both his lineage and Livia’s ambitions.',
        ap.emotional_tags = ["on the surface, tiberius appears resigned, acknowledging his mother\u2019s ambitions while feeling the weight of expectation", "dissatisfaction with his perceived lack of favor from augustus. internally, he is torn between a desire for acknowledgment", "frustration at the limitations placed upon him by both his lineage", "livia\u2019s ambitions.", "on the surface", "tiberius appears resigned", "acknowledging his mother\u2019s ambitions while feeling the weight of expectation and dissatisfaction with his perceived lack of favor from augustus. internally", "he is torn between a desire for acknowledgment and frustration at the limitations placed upon him by both his lineage and livia\u2019s ambitions.", "on the surface, tiberius appears resigned, acknowledging his mother\u2019s ambitions", "feeling the weight of expectation and dissatisfaction with his perceived lack of favor from augustus. internally, he is torn between a desire for acknowledgment and frustration at the limitations placed upon him by both his lineage and livia\u2019s ambitions."],
        ap.active_plans = ["Acknowledge his mother's advice while grappling with his self-image within the imperial family.", "Compete with his brother for recognition and success in military endeavors.", "Determine his own path forward while navigating the ambitions imposed by Livia."],
        ap.beliefs = ["His worth is tied to military success and recognition, akin to the achievements of his brother.", "The dynamics within the family are politically charged, with love and loyalty often in conflict.", "Patience may be a valuable trait, yet his nature urges him towards immediate action and results."],
        ap.goals = ["Short-term: Successfully complete his military campaign in the Rhine.", "Medium-term: Gain favor from Augustus and establish his own legacy apart from Marcellus.", "Ultimate: Achieve a position of power and respect that allows him to secure his mother\u2019s vision for their family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Augustus stands in his private audience chamber, facing Tiberius. He engages in a brief, perfunctory exchange, inquiring about Tiberius\'s departure to Germany with a veneer of imperial interest. However, his body language is dismissive, his words clipped as he quickly pivots to his own supposed busyness and abruptly exits, leaving Tiberius and Livia alone, clearly signaling the end of his engagement.',
        ap.emotional_state = 'Augustus exudes an air of detached authority, masking a deeper disinterest or even dislike for Tiberius. His tone is curt, lacking genuine paternal warmth, and his abrupt departure suggests impatience and a desire to avoid prolonged interaction. Beneath the surface of imperial duty, there\'s a weariness and perhaps a subtle resentment towards Tiberius, hinted at by the lack of genuine engagement and the eagerness to conclude the audience.',
        ap.emotional_tags = ["augustus exudes an air of detached authority, masking a deeper disinterest or even dislike for tiberius. his tone is curt, lacking genuine paternal warmth,", "his abrupt departure suggests impatience", "a desire to avoid prolonged interaction. beneath the surface of imperial duty, there's a weariness", "perhaps a subtle resentment towards tiberius, hinted at by the lack of genuine engagement", "the eagerness to conclude the audience.", "augustus exudes an air of detached authority", "masking a deeper disinterest or even dislike for tiberius. his tone is curt", "lacking genuine paternal warmth", "and his abrupt departure suggests impatience and a desire to avoid prolonged interaction. beneath the surface of imperial duty", "there's a weariness and perhaps a subtle resentment towards tiberius", "hinted at by the lack of genuine engagement and the eagerness to conclude the audience."],
        ap.active_plans = ["Maintain a semblance of imperial engagement with family matters, however superficial.", "Ensure Tiberius departs for Germany as ordered, addressing potential military needs on the frontier.", "Signal his lack of personal investment in Tiberius's affairs, reinforcing Tiberius's marginalized position within the family."],
        ap.beliefs = ["The Emperor must maintain an appearance of control over all aspects of the empire, including family.", "Tiberius, while his stepson, is not a figure he holds in high regard or trusts implicitly.", "Direct and prolonged engagement with Tiberius is an unnecessary drain on his time and energy."],
        ap.goals = ["Short-term: Efficiently conclude the audience with Tiberius and return to his other imperial duties.", "Medium-term: Secure the German frontier by deploying Tiberius and Roman troops.", "Ultimate: Preserve the stability and authority of the Roman Empire under his rule, even if it means maintaining emotionally distant relationships with family members."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius enters the private audience chamber and performs a stiff bow before Augustus, maintaining a formal and respectful posture throughout the brief audience. He listens to Augustus\'s curt instructions and then remains in the chamber with Livia, engaging in a more personal, albeit strained, conversation with his mother. He stands, addressing both Augustus and Livia directly, articulating his grievances and listening to Livia\'s manipulative counsel.',
        ap.emotional_state = 'Tiberius displays a surface compliance and formality, bowing to Augustus and engaging in polite conversation. However, beneath this veneer, he harbors deep resentment and a sense of being unloved and undervalued by Augustus (\'He doesn\'t like me\'). He is weary and skeptical of Livia\'s manipulative tactics (\'not that old chicken story again\'), yet also resigned to her influence and strategic vision, hinting at a complex mix of filial duty and cynical understanding of his family\'s dynamics.',
        ap.emotional_tags = ["tiberius displays a surface compliance", "formality, bowing to augustus", "engaging in polite conversation. however, beneath this veneer, he harbors deep resentment", "a sense of being unloved", "undervalued by augustus ('he doesn't like me'). he is weary", "skeptical of livia's manipulative tactics ('not that old chicken story again'), yet also resigned to her influence", "strategic vision, hinting at a complex mix of filial duty", "cynical understanding of his family's dynamics.", "tiberius displays a surface compliance and formality", "bowing to augustus and engaging in polite conversation. however", "beneath this veneer", "he harbors deep resentment and a sense of being unloved and undervalued by augustus ('he doesn't like me'). he is weary and skeptical of livia's manipulative tactics ('not that old chicken story again')", "yet also resigned to her influence and strategic vision", "hinting at a complex mix of filial duty and cynical understanding of his family's dynamics."],
        ap.active_plans = ["Endure the audience with Augustus with outward respect, despite feeling disliked.", "Seek validation or at least acknowledgment of his feelings from Livia.", "Listen to and process Livia's strategic advice, even if he is cynical about her methods."],
        ap.beliefs = ["Augustus holds a deep personal dislike for him, making genuine paternal affection impossible.", "His own reserved nature is perceived negatively and hinders his ability to gain favor.", "Livia's ambition and manipulations are a constant force shaping his life and destiny, whether he fully trusts her or not."],
        ap.goals = ["Short-term: Navigate the awkward and dismissive audience with Augustus with as much dignity as possible.", "Medium-term: Achieve military success in Germany to prove his worth and potentially gain some recognition, possibly to outshine Marcellus's achievements.", "Ultimate: Secure a position of power and respect within the Roman Empire, potentially as Augustus's successor, driven by a desire to overcome his perceived marginalization and resentment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Livia remains in the private audience chamber after Augustus departs, immediately turning her attention to Tiberius. She engages him in a calculatedly maternal yet manipulative conversation. She stands before Tiberius, her posture commanding, delivering strategic advice, dismissing his self-pity, and subtly reinforcing her control over his ambitions.  She ends the conversation with a physical gesture of maternal affection (\'kiss me\'), immediately followed by a strategic command (\'Remember my prophetic chickens and have patience\').',
        ap.emotional_state = 'Livia presents a facade of maternal concern and strategic guidance to Tiberius. On the surface, she offers advice and reassurance, but beneath this lies a cold, calculating ambition. She displays impatience with Tiberius\'s self-pity (\'Oh, you\'re so keen to save yourself trouble\') and uses manipulative tactics like the \'prophetic chickens\' story to control him. Her underlying emotion is one of ruthless determination, focused solely on securing Tiberius\'s path to power and eliminating any obstacles, as revealed by the chilling voiceover about \'the removal of Marcellus.\'',
        ap.emotional_tags = ["livia presents a facade of maternal concern", "strategic guidance to tiberius. on the surface, she offers advice", "reassurance, but beneath this lies a cold, calculating ambition. she displays impatience with tiberius's self-pity ('oh, you're so keen to save yourself trouble')", "uses manipulative tactics like the 'prophetic chickens' story to control him. her underlying emotion is one of ruthless determination, focused solely on securing tiberius's path to power", "eliminating any obstacles, as revealed by the chilling voiceover about 'the removal of marcellus.'", "livia presents a facade of maternal concern and strategic guidance to tiberius. on the surface", "she offers advice and reassurance", "but beneath this lies a cold", "calculating ambition. she displays impatience with tiberius's self-pity ('oh", "you're so keen to save yourself trouble') and uses manipulative tactics like the 'prophetic chickens' story to control him. her underlying emotion is one of ruthless determination", "focused solely on securing tiberius's path to power and eliminating any obstacles", "as revealed by the chilling voiceover about 'the removal of marcellus.'", "livia presents a facade of maternal concern and strategic guidance to tiberius. on the surface, she offers advice and reassurance,", "beneath this lies a cold, calculating ambition. she displays impatience with tiberius's self-pity ('oh, you're so keen to save yourself trouble') and uses manipulative tactics like the 'prophetic chickens' story to control him. her underlying emotion is one of ruthless determination, focused solely on securing tiberius's path to power and eliminating any obstacles, as revealed by the chilling voiceover about 'the removal of marcellus.'"],
        ap.active_plans = ["Dismiss Tiberius's complaints and refocus his attention on strategic objectives (Germany and surpassing Marcellus's glory).", "Reiterate and reinforce her long-term strategic vision to Tiberius, emphasizing patience and her 'prophetic' insights.", "Reassert her maternal authority and control over Tiberius's ambitions, ensuring his compliance and loyalty to her plans."],
        ap.beliefs = ["She is the architect of Tiberius's destiny and the key to his success.", "Patience and long-term strategic planning are essential for achieving imperial power.", "Marcellus is a significant threat to Tiberius's ambitions and must be eliminated to clear his path to succession."],
        ap.goals = ["Short-term: Motivate and control Tiberius, ensuring he departs for Germany with a renewed sense of purpose and obedience to her strategic vision.", "Medium-term: Secure Tiberius's position by systematically removing or neutralizing key rivals, with Marcellus being the immediate target.", "Ultimate: Establish Tiberius as the unquestioned successor to Augustus, consolidating her family's dynasty and ensuring her own enduring power and influence behind the throne."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_weaving_event_8_1'})
    ON CREATE SET
        oi.description = 'The weaving is central to the scene, representing Antonia\'s dedication and desire for familial approval. It is meant as a personal gift for Augustus, showcasing her skill and care. Livia\'s dismissive remarks about the weaving reflect her larger ambitions and the competitive atmosphere among the women in the household.',
        oi.status_before = 'The weaving is in a preliminary stage, actively being crafted by Antonia as she works on it with enthusiasm, eager to present it to Augustus.',
        oi.status_after = 'The weaving remains incomplete at the scene\'s end, symbolizing Antonia\'s ongoing efforts and the unresolved tensions in family dynamics regarding approval and competition.'
    WITH oi
    MATCH (o:Object {uuid: 'object_weaving'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_weaving_event_8_2'})
    ON CREATE SET
        oi.description = 'The weaving is prominently featured as Antonia’s current project and the focal point of Augustus’s arrival and interaction with her. Antonia is actively engaged in creating it, explaining its purpose as a gift for Augustus. Augustus examines it closely, praising its quality and inquiring about its nature. The weaving serves as a catalyst for their interaction, providing a tangible representation of Antonia\'s domestic skills and becoming a vehicle for Augustus to display familial affection and patriarchal approval. It also becomes a subtle point of discussion and mild tension between Livia and Antonia regarding its purpose and recipient.',
        oi.status_before = 'The weaving is in progress on the loom within the sitting room of the Claudian Villa, actively being worked on by Antonia. It is intended as a gift specifically for Augustus, reflecting Antonia’s dutifulness and desire to please her uncle.',
        oi.status_after = 'The weaving remains on the loom, but now carries the added significance of having been admired and praised by Augustus. Its status is elevated from a simple craft project to a symbol of Antonia\'s talent and Augustus\'s paternal approval within the familial setting. It serves as a visual reminder of the interaction and the dynamics between Antonia, Augustus, and Livia in the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_weaving'})
    MATCH (e:Event {uuid: 'event_8_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_games_of_marcellus_event_8_5'})
    ON CREATE SET
        oi.description = 'The games proposed by Marcellus are set to be a grand spectacle showcasing his creativity and ambition, intended to celebrate his new role as City Magistrate. Marcellus enthusiastically outlines plans to transform the marketplace into a vibrant festival, complete with pitched battles, indicating his desire to leave a mark on Rome\'s public life.',
        oi.status_before = 'The concept of the games exists as an ambitious proposal in Marcellus\'s mind, embodying his youthful vision and desire to impress his family and the Roman populace.',
        oi.status_after = 'With the proposal shared, the games become a tangible event in the public\'s eye, creating anticipation and setting the stage for potential political fallout, as they reflect Marcellus\'s character and ambitions.'
    WITH oi
    MATCH (o:Object {uuid: 'object_games_of_marcellus'})
    MATCH (e:Event {uuid: 'event_8_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Antonia is seated at the loom, weaving diligently and eagerly presenting her work to Augustus. Her posture is upright, hands deftly manipulating the threads, conveying her excitement and desire for approval.',
        ap.emotional_state = 'Antonia exhibits a blend of eagerness and naivety, her excitement overshadowing the tension in the room. She feels a sense of pride in her work, yet there lies an undercurrent of anxiety regarding Livia\'s sharp critique of her efforts.',
        ap.emotional_tags = ["antonia exhibits a blend of eagerness", "naivety, her excitement overshadowing the tension in the room. she feels a sense of pride in her work, yet there lies an undercurrent of anxiety regarding livia's sharp critique of her efforts.", "antonia exhibits a blend of eagerness and naivety", "her excitement overshadowing the tension in the room. she feels a sense of pride in her work", "yet there lies an undercurrent of anxiety regarding livia's sharp critique of her efforts."],
        ap.active_plans = ["To impress Augustus with her weaving and gain his approval.", "To strengthen familial bonds by showcasing her skills through a personal gift.", "To navigate the competitive atmosphere among the women in the household."],
        ap.beliefs = ["Family approval is vital for her self-worth.", "Her skills can earn her a place in the heart of her uncle Augustus.", "She believes that domestic tasks are valuable contributions to the household."],
        ap.goals = ["Short-term: Complete the weaving for Augustus.", "Medium-term: Gain recognition and affection from Augustus, enhancing her status in the family.", "Ultimate: Establish herself as a valued member of the imperial family through her contributions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Livia is positioned near the loom, observing Antonia\'s weaving with a critical eye. Her posture is straight and commanding, with an air of authority as she makes cutting remarks about Augustus\'s wardrobe.',
        ap.emotional_state = 'Livia\'s surface demeanor is one of superiority, masking a deeper jealousy and competitiveness towards Antonia. Her sharp comments reveal her desire to assert dominance in the familial dynamics, as she feels threatened by Antonia\'s eagerness to please Augustus.',
        ap.emotional_tags = ["livia's surface demeanor is one of superiority, masking a deeper jealousy", "competitiveness towards antonia. her sharp comments reveal her desire to assert dominance in the familial dynamics, as she feels threatened by antonia's eagerness to please augustus.", "livia's surface demeanor is one of superiority", "masking a deeper jealousy and competitiveness towards antonia. her sharp comments reveal her desire to assert dominance in the familial dynamics", "as she feels threatened by antonia's eagerness to please augustus."],
        ap.active_plans = ["To undermine Antonia's confidence and assert her own authority in the household.", "To shift attention back to herself and her own contributions to the family.", "To maintain control over Augustus's affections and preferences."],
        ap.beliefs = ["Maintaining superiority over others in the family is essential for her influence.", "Her reputation and authority should not be challenged by younger members of the family.", "She believes that competition is a necessary aspect of courtly life."],
        ap.goals = ["Short-term: Diminish Antonia's contributions and assert her own importance.", "Medium-term: Ensure Augustus remains focused on her rather than on Antonia.", "Ultimate: Secure her position as the primary matriarch in the family, particularly for Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the sitting room, his face illuminated by a wide, genuine beam as he approaches Antonia. He moves directly towards her and the loom, his posture radiating avuncular warmth. He leans in to examine the weaving closely, gesturing towards it with a hand that also holds a pear, his attention fully captivated by Antonia\'s handiwork.',
        ap.emotional_state = 'Augustus outwardly expresses jovial delight and paternal affection, beaming and praising Antonia effusively. Beneath this cheerful surface, he is likely aware of the undercurrents of tension within the room, using this moment to project an image of familial harmony and benevolent leadership. His cheerfulness might be performative, designed to create a lighter atmosphere and momentarily deflect from more serious political anxieties and familial rivalries simmering in the background.',
        ap.emotional_tags = ["augustus outwardly expresses jovial delight", "paternal affection, beaming", "praising antonia effusively. beneath this cheerful surface, he is likely aware of the undercurrents of tension within the room, using this moment to project an image of familial harmony", "benevolent leadership. his cheerfulness might be performative, designed to create a lighter atmosphere", "momentarily deflect from more serious political anxieties", "familial rivalries simmering in the background.", "augustus outwardly expresses jovial delight and paternal affection", "beaming and praising antonia effusively. beneath this cheerful surface", "he is likely aware of the undercurrents of tension within the room", "using this moment to project an image of familial harmony and benevolent leadership. his cheerfulness might be performative", "designed to create a lighter atmosphere and momentarily deflect from more serious political anxieties and familial rivalries simmering in the background."],
        ap.active_plans = ["To reinforce a public image of a harmonious and loving family under his rule.", "To express overt approval and encouragement towards Antonia's traditionally feminine domestic skills.", "To subtly steer the conversation away from potentially contentious political topics by focusing on pleasantries and familial interactions."],
        ap.beliefs = ["The image of a united and happy family is crucial for maintaining imperial stability and public perception.", "Encouraging traditional Roman virtues, particularly in women, reinforces societal order and values.", "A benevolent and approachable public persona strengthens his authority and popularity."],
        ap.goals = ["Short-term: To enjoy a fleeting moment of familial warmth and project an image of domestic tranquility.", "Medium-term: To strengthen familial bonds and reinforce the perception of a stable and well-governed household.", "Ultimate: To secure his legacy by ensuring a peaceful and unified empire, potentially through fostering strong familial loyalty and projecting an image of virtuous leadership."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'})
    ON CREATE SET
        ap.current_status = 'Antonia is seated at the loom, her fingers deftly moving as she weaves the cloth. She pauses her work as Augustus approaches, rising slightly to greet him with a respectful and hopeful demeanor. She presents her weaving for his inspection, her posture suggesting a blend of eagerness and slight nervousness as she awaits his judgment and approval.',
        ap.emotional_state = 'Antonia displays surface emotions of eagerness and hopeful anticipation, clearly seeking validation for her efforts from Augustus and Livia. Internally, she is likely driven by a desire for familial approval and acceptance, possibly feeling somewhat insecure within the ambitious and politically charged atmosphere of the imperial household. Her quiet focus on weaving and her desire to please suggest an underlying need for affirmation and a wish to contribute positively to the family dynamic.',
        ap.emotional_tags = ["antonia displays surface emotions of eagerness", "hopeful anticipation, clearly seeking validation for her efforts from augustus", "livia. internally, she is likely driven by a desire for familial approval", "acceptance, possibly feeling somewhat insecure within the ambitious", "politically charged atmosphere of the imperial household. her quiet focus on weaving", "her desire to please suggest an underlying need for affirmation", "a wish to contribute positively to the family dynamic.", "antonia displays surface emotions of eagerness and hopeful anticipation", "clearly seeking validation for her efforts from augustus and livia. internally", "she is likely driven by a desire for familial approval and acceptance", "possibly feeling somewhat insecure within the ambitious and politically charged atmosphere of the imperial household. her quiet focus on weaving and her desire to please suggest an underlying need for affirmation and a wish to contribute positively to the family dynamic."],
        ap.active_plans = ["To meticulously complete the weaving to the best of her abilities, ensuring it is a worthy gift for Augustus.", "To actively seek and receive positive feedback and validation from both Augustus and Livia regarding her weaving skills.", "To maintain a dutiful and agreeable demeanor, reinforcing her role as a compliant and pleasing member of the imperial family."],
        ap.beliefs = ["Gaining the approval of senior family members, especially Augustus, is essential for her well-being and status within the family.", "Domestic skills and traditional feminine crafts are valuable attributes that contribute to her worth and acceptance.", "Maintaining familial harmony and avoiding conflict is crucial for a peaceful life within the imperial household."],
        ap.goals = ["Short-term: To elicit praise and positive reinforcement from Augustus for her weaving work.", "Medium-term: To solidify her position as a valued and contributing member of the family through demonstrable domestic virtue.", "Ultimate: To secure a stable and respected place within the imperial family structure, ensuring her long-term comfort and security within the Roman elite."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Octavia observes the interactions around her, seated with a weary expression. She is physically present in the sitting room, watching as Antonia weaves and the others converse. Her posture reflects a sense of fatigue and concern.',
        ap.emotional_state = 'Octavia\'s surface emotions reveal a deep unease about the noise in the streets, which echoes her inner turmoil. She expresses concern for her family\'s safety, while also feeling the weight of her past losses. The tension between her protective instincts and the chaos outside creates an emotional contradiction, revealing her as a figure haunted by grief and anxiety.',
        ap.emotional_tags = ["octavia's surface emotions reveal a deep unease about the noise in the streets, which echoes her inner turmoil. she expresses concern for her family's safety, while also feeling the weight of her past losses. the tension between her protective instincts", "the chaos outside creates an emotional contradiction, revealing her as a figure haunted by grief", "anxiety.", "octavia's surface emotions reveal a deep unease about the noise in the streets", "which echoes her inner turmoil. she expresses concern for her family's safety", "while also feeling the weight of her past losses. the tension between her protective instincts and the chaos outside creates an emotional contradiction", "revealing her as a figure haunted by grief and anxiety.", "octavia's surface emotions reveal a deep unease about the noise in the streets, which echoes her inner turmoil. she expresses concern for her family's safety,", "also feeling the weight of her past losses. the tension between her protective instincts and the chaos outside creates an emotional contradiction, revealing her as a figure haunted by grief and anxiety."],
        ap.active_plans = ["To express her discomfort with the growing unrest outside, indicating her protective instincts for her family.", "To encourage her daughter, Antonia, to take care of herself amidst the chaos.", "To seek reassurance from her family about their safety and the noise that disturbs her peace."],
        ap.beliefs = ["The safety and well-being of her family are paramount and must be prioritized.", "The chaos in the streets reflects a troubling shift in Rome that could threaten their stability.", "Living through past traumas makes her more sensitive to current unrest, compelling her to voice her concerns."],
        ap.goals = ["Short-term: To address the immediate discomfort she feels and express her concerns about the noise.", "Medium-term: To foster a sense of safety and calm within her family amidst external chaos.", "Ultimate: To protect her family from the consequences of societal unrest and ensure their legacy remains intact."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Marcellus lounges casually nearby, responding dismissively to Octavia\'s concerns. His body language is relaxed, embodying a sense of entitlement and confidence, as he engages with the family around him.',
        ap.emotional_state = 'Marcellus exhibits surface confidence and a carefree attitude, appearing unfazed by the unrest outside. However, his dismissive remarks towards Octavia reveal a lack of empathy and awareness of the deeper issues at play. There is a tension between his youthful arrogance and the gravity of the concerns expressed by his mother.',
        ap.emotional_tags = ["marcellus exhibits surface confidence", "a carefree attitude, appearing unfazed by the unrest outside. however, his dismissive remarks towards octavia reveal a lack of empathy", "awareness of the deeper issues at play. there is a tension between his youthful arrogance", "the gravity of the concerns expressed by his mother.", "marcellus exhibits surface confidence and a carefree attitude", "appearing unfazed by the unrest outside. however", "his dismissive remarks towards octavia reveal a lack of empathy and awareness of the deeper issues at play. there is a tension between his youthful arrogance and the gravity of the concerns expressed by his mother."],
        ap.active_plans = ["To maintain his relaxed demeanor and assert his position within the family despite external pressures.", "To downplay Octavia's concerns about the noise, reflecting his belief in the stability of the imperial family.", "To focus on his upcoming games and innovations, prioritizing personal ambition over family worries."],
        ap.beliefs = ["The city\u2019s vibrancy and chaos are simply part of Rome\u2019s character and vitality.", "His position as a favored nephew grants him the right to dismiss concerns raised by family members.", "Innovations and spectacles will overshadow any societal unrest, ensuring his popularity and influence."],
        ap.goals = ["Short-term: To deflect attention from Octavia's concerns and keep discussions focused on his upcoming games.", "Medium-term: To establish himself as a significant authority in the family and the city through his ambitious plans.", "Ultimate: To secure his legacy and position within the imperial lineage, irrespective of external threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Julia reclines languidly near Marcellus in the sitting room, observing the unfolding domestic scene with a detached air. She interjects into the general conversation, her voice carrying a note of weary disdain as she comments on the burgeoning population of Rome, her posture suggesting a general ennui and dissatisfaction with her surroundings and the topics of courtly conversation.',
        ap.emotional_state = 'Beneath a veneer of bored indifference, Julia simmers with discontent. Outwardly, she expresses annoyance with the city\'s congestion and noise, using sarcasm as a shield. Internally, her frustration runs deeper, stemming from a sense of confinement and a lack of personal agency within her gilded cage. There\'s an unspoken conflict between her duty as Augustus\'s daughter and her yearning for a life beyond the suffocating expectations of Roman high society, hinting at a rebellious spirit.',
        ap.emotional_tags = ["beneath a veneer of bored indifference, julia simmers with discontent. outwardly, she expresses annoyance with the city's congestion", "noise, using sarcasm as a shield. internally, her frustration runs deeper, stemming from a sense of confinement", "a lack of personal agency within her gilded cage. there's an unspoken conflict between her duty as augustus's daughter", "her yearning for a life beyond the suffocating expectations of roman high society, hinting at a rebellious spirit.", "beneath a veneer of bored indifference", "julia simmers with discontent. outwardly", "she expresses annoyance with the city's congestion and noise", "using sarcasm as a shield. internally", "her frustration runs deeper", "stemming from a sense of confinement and a lack of personal agency within her gilded cage. there's an unspoken conflict between her duty as augustus's daughter and her yearning for a life beyond the suffocating expectations of roman high society", "hinting at a rebellious spirit."],
        ap.active_plans = ["Express her dissatisfaction with Rome's current state to gauge reactions, particularly from Livia.", "Subtly probe the possibility of leaving Rome, hinting at a desire for escape.", "Observe the dynamics and power plays within the room, particularly between Livia and Marcellus, to better understand her own position and potential alliances."],
        ap.beliefs = ["Rome has become overcrowded and lost its appeal, transforming into a noisy and unpleasant place to reside.", "The constant influx of people dilutes the city's quality and exacerbates its negative aspects.", "Her personal desires and preferences are secondary to the political and social expectations placed upon her within the imperial family."],
        ap.goals = ["Short-term: Voice her discontent and make her negative feelings about Rome known.", "Medium-term: Seek opportunities to distance herself from the undesirable aspects of Roman city life and courtly obligations.", "Ultimate: Achieve a life where her own desires and preferences are prioritized, even if it means challenging or circumventing the constraints of her imperial status."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_4'})
    ON CREATE SET
        ap.current_status = 'Marcellus lounges comfortably in the sitting room, engaging in casual conversation with the assembled family members. When Julia expresses her discontent, he responds with a contrasting viewpoint, defending the influx of people into Rome. He speaks with an air of youthful confidence and civic pride, gesturing lightly as he articulates his perspective, projecting an image of a man at ease with his position and the city he governs.',
        ap.emotional_state = 'Marcellus projects an outward confidence and enthusiasm for Rome\'s bustling nature. He appears genuinely positive about the city\'s growth, viewing the newcomers as a source of vitality. Internally, he likely feels secure in his position as City Magistrate and enjoys the dynamism of a populous Rome, potentially dismissing Julia\'s complaints as aristocratic whining. He displays a subtle eagerness to impress Augustus and maintain a cheerful atmosphere, indicative of his ambition and desire for approval.',
        ap.emotional_tags = ["marcellus projects an outward confidence", "enthusiasm for rome's bustling nature. he appears genuinely positive about the city's growth, viewing the newcomers as a source of vitality. internally, he likely feels secure in his position as city magistrate", "enjoys the dynamism of a populous rome, potentially dismissing julia's complaints as aristocratic whining. he displays a subtle eagerness to impress augustus", "maintain a cheerful atmosphere, indicative of his ambition", "desire for approval.", "marcellus projects an outward confidence and enthusiasm for rome's bustling nature. he appears genuinely positive about the city's growth", "viewing the newcomers as a source of vitality. internally", "he likely feels secure in his position as city magistrate and enjoys the dynamism of a populous rome", "potentially dismissing julia's complaints as aristocratic whining. he displays a subtle eagerness to impress augustus and maintain a cheerful atmosphere", "indicative of his ambition and desire for approval."],
        ap.active_plans = ["Defend his role as City Magistrate and the positive aspects of Rome's growth and population.", "Counter Julia's negative comments with optimistic and pro-city arguments to maintain a positive tone.", "Reinforce his image as a forward-thinking and popular figure, contrasting with Julia's perceived negativity, especially in front of Augustus and Livia."],
        ap.beliefs = ["The increasing population is a sign of Rome's strength and vitality, not a detriment.", "Newcomers are essential for Rome's continued prosperity and cultural richness.", "Public events and spectacles, like the Games he is organizing, are crucial for the city's spirit and his own popularity as a leader."],
        ap.goals = ["Short-term: Present a positive image of Rome and his magistracy, directly opposing Julia's negativity.", "Medium-term: Ensure the upcoming Games are a resounding success, further enhancing his public image and political standing.", "Ultimate: Solidify his position as a leading figure in Roman society and a favoured heir apparent, maintaining popular support and imperial favour to secure future power and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Marcellus lounges nearby, filled with enthusiasm as he proposes grandiose plans for the upcoming games. He gestures animatedly, his youthful energy evident as he describes extravagant spectacles he wishes to orchestrate.',
        ap.emotional_state = 'Marcellus radiates confidence and ambition, clearly excited about his new position as City Magistrate. However, there is an underlying naivety to his enthusiasm, a disconnect from the political realities that surround him.',
        ap.emotional_tags = ["marcellus radiates confidence", "ambition, clearly excited about his new position as city magistrate. however, there is an underlying naivety to his enthusiasm, a disconnect from the political realities that surround him.", "marcellus radiates confidence and ambition", "clearly excited about his new position as city magistrate. however", "there is an underlying naivety to his enthusiasm", "a disconnect from the political realities that surround him."],
        ap.active_plans = ["To propose an extravagant celebration for his appointment as City Magistrate with the upcoming games.", "To ensure his plans are memorable and capture the attention of the Roman populace.", "To assert his position and importance in the political landscape by showcasing innovative ideas at the games."],
        ap.beliefs = ["That spectacle and grandeur can secure his popularity and legacy in Rome.", "That his youthful vision and energy will be celebrated and appreciated by his peers.", "That he can navigate the political landscape with charm and creativity."],
        ap.goals = ["Short-term: To gain the approval and admiration of Augustus and the people of Rome through his games.", "Medium-term: To establish himself as a significant political figure within the Roman Empire.", "Ultimate: To secure his legacy as a celebrated leader remembered for his innovative contributions to Roman culture."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the sitting room, beaming as he inspects Antonia’s weaving. He engages with Marcellus, expressing both pride and skepticism towards his ambitious games proposal, utilizing his authority to guide the conversation.',
        ap.emotional_state = 'Augustus displays a mixture of paternal pride and cautious skepticism. His beaming smile conceals the ever-present tension of his responsibilities and the fragility of his power, alongside a subtle concern about Marcellus\'s grand plans.',
        ap.emotional_tags = ["augustus displays a mixture of paternal pride", "cautious skepticism. his beaming smile conceals the ever-present tension of his responsibilities", "the fragility of his power, alongside a subtle concern about marcellus's grand plans.", "augustus displays a mixture of paternal pride and cautious skepticism. his beaming smile conceals the ever-present tension of his responsibilities and the fragility of his power", "alongside a subtle concern about marcellus's grand plans."],
        ap.active_plans = ["To assess Marcellus's ambitious proposal and ensure it aligns with the broader interests of Rome.", "To maintain control over the narrative surrounding the games and their potential implications.", "To balance encouragement of Marcellus with guidance to temper his youthful exuberance."],
        ap.beliefs = ["That maintaining a fa\u00e7ade of public celebration is essential for the stability of his reign.", "That youth and ambition can be both a source of strength and a potential threat to established power.", "That it is important to uphold the traditions of Rome while navigating the innovations proposed by the younger generation."],
        ap.goals = ["Short-term: To keep the peace within his family and the Senate while overseeing the preparations for the games.", "Medium-term: To ensure that the games reinforce his authority and the unity of the Empire.", "Ultimate: To secure a legacy that balances tradition with the modernity that his successors will embrace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Augustus enters the sitting room in a cheerful mood, initially focusing on Antonia\'s weaving and enjoying a pear. He then shifts his attention to Marcellus, engaging him in conversation about the upcoming Games. While maintaining a genial demeanor, Augustus subtly steers the discussion towards the financial aspects of Marcellus\'s ambitious plans, questioning the practicality of the proposed extravagances and their cost.',
        ap.emotional_state = 'Augustus presents a facade of paternal amusement and imperial magnanimity. Outwardly, he is jovial and indulgent, praising Antonia and playfully teasing Marcellus. However, beneath the surface, a current of pragmatism and fiscal responsibility is evident. He is likely experiencing a blend of weariness at Marcellus\'s extravagance and the ever-present concern for the imperial treasury, masking any potential annoyance with a calm, authoritative composure.',
        ap.emotional_tags = ["augustus presents a facade of paternal amusement", "imperial magnanimity. outwardly, he is jovial", "indulgent, praising antonia", "playfully teasing marcellus. however, beneath the surface, a current of pragmatism", "fiscal responsibility is evident. he is likely experiencing a blend of weariness at marcellus's extravagance", "the ever-present concern for the imperial treasury, masking any potential annoyance with a calm, authoritative composure.", "augustus presents a facade of paternal amusement and imperial magnanimity. outwardly", "he is jovial and indulgent", "praising antonia and playfully teasing marcellus. however", "beneath the surface", "a current of pragmatism and fiscal responsibility is evident. he is likely experiencing a blend of weariness at marcellus's extravagance and the ever-present concern for the imperial treasury", "masking any potential annoyance with a calm", "authoritative composure."],
        ap.active_plans = ["Maintain a semblance of familial harmony in public.", "Gently guide Marcellus towards more financially sensible plans for the Games without directly stifling his enthusiasm.", "Gauge the true scale and potential cost of Marcellus's proposed spectacles to assess the financial impact on Rome."],
        ap.beliefs = ["Public entertainment and spectacles are crucial for maintaining Roman populace's contentment and imperial prestige.", "Financial stability and responsible governance are paramount for the long-term strength of Rome.", "While appearing indulgent to family is politically beneficial, unchecked extravagance can undermine imperial resources."],
        ap.goals = ["Short-term: To subtly curb the financial excesses of Marcellus's Games without causing public embarrassment or familial discord.", "Medium-term: To ensure the Games are impressive enough to enhance his and Marcellus's popularity, while remaining within reasonable budgetary limits.", "Ultimate: To preserve Rome's financial stability and project an image of wise and responsible leadership, balancing popular appeal with fiscal prudence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Octavia sits observing the interactions, her posture suggesting weariness and discomfort. She interjects into the conversation to complain about the nighttime street noise and later mentions her financial contribution to Marcellus\'s Games. She eventually expresses feeling unwell due to the heat and withdraws from the room with Antonia, seeking respite from the lively atmosphere.',
        ap.emotional_state = 'Octavia is in a state of subdued discontent and physical unease. She displays outward signs of being piqued and unwell, highlighting her discomfort with the noise and the general bustle of Rome. Internally, she likely feels a sense of weariness and perhaps a quiet disapproval of the extravagance and frivolity surrounding her, contrasting with her own somber and grief-laden disposition. Her comment about Augustus spoiling Marcellus hints at underlying frustration and financial concern.',
        ap.emotional_tags = ["octavia is in a state of subdued discontent", "physical unease. she displays outward signs of being piqued", "unwell, highlighting her discomfort with the noise", "the general bustle of rome. internally, she likely feels a sense of weariness", "perhaps a quiet disapproval of the extravagance", "frivolity surrounding her, contrasting with her own somber", "grief-laden disposition. her comment about augustus spoiling marcellus hints at underlying frustration", "financial concern.", "octavia is in a state of subdued discontent and physical unease. she displays outward signs of being piqued and unwell", "highlighting her discomfort with the noise and the general bustle of rome. internally", "she likely feels a sense of weariness and perhaps a quiet disapproval of the extravagance and frivolity surrounding her", "contrasting with her own somber and grief-laden disposition. her comment about augustus spoiling marcellus hints at underlying frustration and financial concern."],
        ap.active_plans = ["Express her immediate discomfort with the noise levels in Rome.", "Assert her financial contribution to Marcellus's Games, emphasizing her practical role.", "Remove herself from the increasingly lively and, to her, possibly grating conversation by claiming to feel unwell."],
        ap.beliefs = ["Public peace and order are essential for a comfortable life, and the current noise levels are disruptive.", "Financial responsibility should be considered even for celebratory events, and unchecked spending is unwise.", "Augustus's indulgence of Marcellus is excessive and potentially detrimental."],
        ap.goals = ["Short-term: To voice her immediate grievances and remove herself from the uncomfortable environment.", "Medium-term: To subtly influence Augustus to consider fiscal prudence in managing Marcellus's ambitions.", "Ultimate: To find a measure of peace and quiet amidst the courtly and public disruptions, maintaining a sense of dignity and restraint."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_6'})
    ON CREATE SET
        ap.current_status = 'Marcellus lounges casually, initially engaging with Octavia with a dismissive and slightly teasing tone regarding her well-being and the street noise. He then shifts to a more animated posture as he enthusiastically presents his grand and expensive ideas for the Games to Augustus. He gestures expansively while detailing his innovative spectacles, eager to gain approval and demonstrate his ambition.',
        ap.emotional_state = 'Marcellus is brimming with youthful enthusiasm and self-assured confidence. Outwardly, he is jovial, charming, and excited about his plans for the Games, eager to impress and gain approval. Internally, he is driven by a desire for public acclaim and recognition, fueled by youthful ambition and a sense of entitlement as Augustus\'s favored nephew. He appears oblivious to or unconcerned with the financial implications of his extravagant proposals, focused solely on the grandeur and spectacle.',
        ap.emotional_tags = ["marcellus is brimming with youthful enthusiasm", "self-assured confidence. outwardly, he is jovial, charming,", "excited about his plans for the games, eager to impress", "gain approval. internally, he is driven by a desire for public acclaim", "recognition, fueled by youthful ambition", "a sense of entitlement as augustus's favored nephew. he appears oblivious to or unconcerned with the financial implications of his extravagant proposals, focused solely on the grandeur", "spectacle.", "marcellus is brimming with youthful enthusiasm and self-assured confidence. outwardly", "he is jovial", "charming", "and excited about his plans for the games", "eager to impress and gain approval. internally", "he is driven by a desire for public acclaim and recognition", "fueled by youthful ambition and a sense of entitlement as augustus's favored nephew. he appears oblivious to or unconcerned with the financial implications of his extravagant proposals", "focused solely on the grandeur and spectacle."],
        ap.active_plans = ["Present his innovative and extravagant plans for the Games to Augustus in a compelling manner.", "Persuade Augustus to fully endorse and fund his ambitious vision for the Games without compromise.", "Highlight the novelty and scale of his proposed spectacles to ensure they are memorable and solidify his public image as City Magistrate."],
        ap.beliefs = ["Grand, unprecedented spectacles are necessary to truly celebrate his appointment and capture the Roman public's imagination.", "Financial constraints should not limit artistic vision and the pursuit of public adoration.", "As Augustus's nephew and City Magistrate, he is entitled to substantial resources to stage magnificent Games that reflect his status and ambition."],
        ap.goals = ["Short-term: To secure Augustus's immediate approval and full financial backing for his elaborate Games.", "Medium-term: To stage the most spectacular and memorable Games Rome has ever witnessed, achieving widespread public acclaim and solidifying his popularity.", "Ultimate: To leverage the success of the Games to further enhance his political career and influence, positioning himself for future advancements and greater power within Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_7'})
    ON CREATE SET
        ap.current_status = 'Julia observes the interactions around her with a subtle expression, her eyes flickering between her family members as they engage in conversation. She remains somewhat detached, sitting nearby while occasionally glancing at Marcellus and Antonia, indicating her awareness of the dynamics at play.',
        ap.emotional_state = 'Julia feels a complex mix of admiration and resentment as she witnesses Marcellus\'s charm winning over those around him. Her outward demeanor is composed, yet internally she wrestles with discontent regarding the superficiality of their familial interactions, feeling overshadowed by Marcellus\'s popularity.',
        ap.emotional_tags = ["julia feels a complex mix of admiration", "resentment as she witnesses marcellus's charm winning over those around him. her outward demeanor is composed, yet internally she wrestles with discontent regarding the superficiality of their familial interactions, feeling overshadowed by marcellus's popularity.", "julia feels a complex mix of admiration and resentment as she witnesses marcellus's charm winning over those around him. her outward demeanor is composed", "yet internally she wrestles with discontent regarding the superficiality of their familial interactions", "feeling overshadowed by marcellus's popularity."],
        ap.active_plans = ["To navigate the complex family dynamics without openly challenging Marcellus's position.", "To express her sentiments about Marcellus's popularity in a way that reveals her true feelings without creating direct confrontation.", "To assert her own identity and significance within the family structure despite the pressures of expectation."],
        ap.beliefs = ["Julia believes that true connections are rare in the superficial world of Roman politics.", "She holds a conviction that popularity can often overshadow genuine merit and depth.", "Julia is convinced that family loyalty is often tested by ambition and competition."],
        ap.goals = ["In the short-term, Julia aims to maintain a harmonious relationship with Marcellus while subtly expressing her discontent.", "In the medium-term, she seeks to carve out a space for her own ambitions that are not overshadowed by Marcellus.", "Ultimately, Julia desires to secure her own legacy and identity within the imperial family, free from the constraints of being merely 'Marcellus's wife'."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_8'})
    ON CREATE SET
        ap.current_status = 'Livia sits calmly near the loom, outwardly engaged in a casual conversation within the sitting room of the Claudian villa. She observes Julia closely, her posture relaxed yet alert, ready to subtly steer the dialogue toward her intended target. Her actions appear benign, but every word is measured, every glance calculated as she probes for deeper insights.',
        ap.emotional_state = 'Beneath a veneer of polite curiosity, Livia is intensely strategic and probing. She is not merely making conversation; she is conducting a subtle reconnaissance mission, assessing the dynamics between Julia and Marcellus. There\'s a detached calculation in her demeanor, masking a deep-seated ambition and a need to control the narrative. While her tone is conversational, her internal state is sharply focused on political implications and potential vulnerabilities.',
        ap.emotional_tags = ["beneath a veneer of polite curiosity, livia is intensely strategic", "probing. she is not merely making conversation; she is conducting a subtle reconnaissance mission, assessing the dynamics between julia", "marcellus. there's a detached calculation in her demeanor, masking a deep-seated ambition", "a need to control the narrative. while her tone is conversational, her internal state is sharply focused on political implications", "potential vulnerabilities.", "beneath a veneer of polite curiosity", "livia is intensely strategic and probing. she is not merely making conversation; she is conducting a subtle reconnaissance mission", "assessing the dynamics between julia and marcellus. there's a detached calculation in her demeanor", "masking a deep-seated ambition and a need to control the narrative. while her tone is conversational", "her internal state is sharply focused on political implications and potential vulnerabilities.", "beneath a veneer of polite curiosity, livia is intensely strategic and probing. she is not merely making conversation", "she is conducting a subtle reconnaissance mission, assessing the dynamics between julia and marcellus. there's a detached calculation in her demeanor, masking a deep-seated ambition and a need to control the narrative. while her tone is conversational, her internal state is sharply focused on political implications and potential vulnerabilities."],
        ap.active_plans = ["Gauge the genuine affection, or lack thereof, between Julia and Marcellus to understand the stability of their union.", "Assess Julia's awareness of the political implications of her marriage and her potential usefulness in Livia's broader schemes.", "Subtly probe for any discontent or weakness in Julia that could be exploited later, particularly regarding the lack of an heir.", "Maintain a facade of amicable conversation to disarm Julia and encourage openness, making her more likely to reveal her true feelings."],
        ap.beliefs = ["Marriages within the imperial family are primarily political tools, not personal unions based on affection.", "Children, especially male heirs, are essential for securing dynastic power and ensuring the continuation of her family's influence.", "Subtle manipulation and information gathering are crucial for maintaining control in the treacherous Roman court.", "Emotional vulnerabilities, particularly in women, can be effectively leveraged for political advantage."],
        ap.goals = ["{short_term: Elicit honest responses from Julia regarding her feelings about Marcellus and the state of their marriage., medium_term: Identify any potential weaknesses or leverage points within Julia's situation that could be useful for Livia's long-term objectives., ultimate: Ensure the stability of the imperial family in a way that ultimately benefits her own ambitions and secures Tiberius's path to power, even if it means manipulating those around her.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_8'})
    ON CREATE SET
        ap.current_status = 'Julia lounges nearby, seemingly relaxed but with a palpable air of detachment. She observes Livia with a keen, almost wary gaze, her body language suggesting a practiced nonchalance that belies a sharp intellect at work. She engages in the conversation, but her responses are measured and carefully chosen, indicating a cautious approach to Livia\'s probing questions.',
        ap.emotional_state = 'Julia presents a facade of polite engagement, but beneath the surface simmers a complex blend of cynicism and guarded defiance. She is acutely aware of the political undercurrents in Livia\'s seemingly casual inquiries, recognizing the Empress\'s manipulative nature. There\'s a hint of weariness in her demeanor, a sense of being perpetually scrutinized and assessed. While she maintains a veneer of composure, internally she is wary and defensive, carefully choosing her words to reveal as little as possible.',
        ap.emotional_tags = ["julia presents a facade of polite engagement, but beneath the surface simmers a complex blend of cynicism", "guarded defiance. she is acutely aware of the political undercurrents in livia's seemingly casual inquiries, recognizing the empress's manipulative nature. there's a hint of weariness in her demeanor, a sense of being perpetually scrutinized", "assessed. while she maintains a veneer of composure, internally she is wary", "defensive, carefully choosing her words to reveal as little as possible.", "julia presents a facade of polite engagement", "but beneath the surface simmers a complex blend of cynicism and guarded defiance. she is acutely aware of the political undercurrents in livia's seemingly casual inquiries", "recognizing the empress's manipulative nature. there's a hint of weariness in her demeanor", "a sense of being perpetually scrutinized and assessed. while she maintains a veneer of composure", "internally she is wary and defensive", "carefully choosing her words to reveal as little as possible.", "julia presents a facade of polite engagement,", "beneath the surface simmers a complex blend of cynicism and guarded defiance. she is acutely aware of the political undercurrents in livia's seemingly casual inquiries, recognizing the empress's manipulative nature. there's a hint of weariness in her demeanor, a sense of being perpetually scrutinized and assessed. while she maintains a veneer of composure, internally she is wary and defensive, carefully choosing her words to reveal as little as possible."],
        ap.active_plans = ["Maintain a polite and cooperative demeanor to avoid direct confrontation with Livia, while subtly deflecting her more pointed questions.", "Conceal her true feelings about Marcellus, particularly any discontent or dissatisfaction, to avoid giving Livia ammunition for future manipulation.", "Test Livia's intentions by offering carefully worded responses and observing her reactions, attempting to gauge the true purpose behind her probing.", "Subtly assert her own awareness of courtly dynamics and political games, signaling to Livia that she is not naive or easily manipulated."],
        ap.beliefs = ["Conversations with Livia are never casual; they are always strategic and often manipulative.", "Genuine happiness in marriage, especially within the imperial family, is a rare and perhaps unattainable ideal.", "Openly expressing vulnerability or discontent to Livia is dangerous and will likely be used against her.", "Maintaining a degree of emotional distance and guardedness is essential for survival in the treacherous Roman court."],
        ap.goals = ["{short_term: Navigate the conversation with Livia without revealing any personal vulnerabilities or genuine feelings about her marriage., medium_term: Maintain a semblance of control over her own image and narrative within the court, resisting attempts to be fully defined or controlled by Livia or others., ultimate: Find a way to carve out a degree of personal autonomy and agency within the constraints of her dynastic role, even if it means playing the game of courtly politics with a degree of cynicism and detachment.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_9'})
    ON CREATE SET
        ap.current_status = 'Livia sits imperiously near a loom, observing the interactions between Julia and Antonia, her posture commanding and poised. She engages in light conversation, though her demeanor hints at a deeper calculation as she monitors the familial dynamics.',
        ap.emotional_state = 'Livia displays a facade of warmth and nostalgia as she recalls Julia and Tiberius\'s childhood. However, beneath this exterior lies a shrewd awareness of the political implications of their relationships, revealing her ambition and control over the family.',
        ap.emotional_tags = ["livia displays a facade of warmth", "nostalgia as she recalls julia", "tiberius's childhood. however, beneath this exterior lies a shrewd awareness of the political implications of their relationships, revealing her ambition", "control over the family.", "livia displays a facade of warmth and nostalgia as she recalls julia and tiberius's childhood. however", "beneath this exterior lies a shrewd awareness of the political implications of their relationships", "revealing her ambition and control over the family."],
        ap.active_plans = ["To foster a sense of unity within the family while subtly reinforcing her influence over them.", "To manipulate Julia's feelings toward Tiberius to strengthen her son's position within the hierarchy.", "To maintain an appearance of maternal affection while orchestrating the dynamics of power subtly."],
        ap.beliefs = ["Family loyalty is paramount, yet it must be guided by ambition and strategic advantage.", "Nostalgia can be a powerful tool in fostering alliances and controlling narratives.", "The future of the empire rests on the union of strong familial ties."],
        ap.goals = ["Short-term: To encourage familial bonding during the moment of reminiscence.", "Medium-term: To position Tiberius favorably against potential rivals within the family.", "Ultimate: To secure Tiberius\u2019s inheritance and ensure the continuation of her lineage's power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_9'})
    ON CREATE SET
        ap.current_status = 'Julia lounges nearby, engaging in conversation with her family, her expression shifting from amusement to concern as she reminisces about her childhood with Tiberius. She is perceptive, responding to Livia’s probing with cautious answers.',
        ap.emotional_state = 'Julia exhibits a blend of nostalgia and frustration, as she remembers the simplicity of her childhood with Tiberius juxtaposed against current familial tensions. Her sarcasm hints at deeper discontent with her role, revealing a desire for autonomy and recognition.',
        ap.emotional_tags = ["julia exhibits a blend of nostalgia", "frustration, as she remembers the simplicity of her childhood with tiberius juxtaposed against current familial tensions. her sarcasm hints at deeper discontent with her role, revealing a desire for autonomy", "recognition.", "julia exhibits a blend of nostalgia and frustration", "as she remembers the simplicity of her childhood with tiberius juxtaposed against current familial tensions. her sarcasm hints at deeper discontent with her role", "revealing a desire for autonomy and recognition."],
        ap.active_plans = ["To subtly defend her relationship with Marcellus while navigating familial expectations.", "To keep Livia's ambitions in check by maintaining her own independence and agency.", "To express her frustrations about the political climate while connecting with her family."],
        ap.beliefs = ["The superficiality of court life is suffocating and stifles genuine connection.", "Nostalgia can be both comforting and painful, reflecting the complexities of familial relationships.", "As a woman, her desires and ambitions are often secondary to those of the men around her."],
        ap.goals = ["Short-term: To foster a sense of camaraderie while subtly asserting her individuality.", "Medium-term: To challenge the perceptions of her role in a male-dominated world.", "Ultimate: To find personal fulfillment and assert her identity beyond the confines of her family\u2019s expectations."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_rhinoceros_event_9_2'})
    ON CREATE SET
        oi.description = 'The rhinoceros is introduced as an extraordinary spectacle for the Games, its presence designed to awe the crowd and symbolize the grandeur of the imperial event. Augustus\'s description highlights its unique horn, sparking interest in the exotic nature of the beast, while Livia\'s sardonic remark about Scipio\'s wife underscores the potential for dark humor and subversion in the face of spectacle.',
        oi.status_before = 'The rhinoceros was an exotic creature, arranged by Marcellus for display at the Games, its existence a symbol of the empire\'s reach and ambition.',
        oi.status_after = 'The rhinoceros remains a focal point of the Games, its presence contributing to the spectacle and public excitement, while simultaneously foreshadowing the underlying violence and unpredictability of such displays.'
    WITH oi
    MATCH (o:Object {uuid: 'object_rhinoceros'})
    MATCH (e:Event {uuid: 'event_9_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_games_of_marcellus_event_9_3'})
    ON CREATE SET
        oi.description = 'The Games of Marcellus are the central object of this event, serving as the very occasion for the scene. They are anticipated by Augustus and Livia, and their commencement is eagerly awaited by the massive crowd in the Coliseum. Marcellus\'s arrival signals the imminent start of these games, which are designed to showcase his generosity and solidify his popularity among the Roman populace. They function as a stage for Marcellus to perform his role as a public figure and to garner further public adoration, reinforcing his political standing.',
        oi.status_before = 'The Games are prepared and ready to begin, but are paused awaiting the arrival of Marcellus and the imperial family in the imperial box. Anticipation for the spectacle is high among the gathered crowd, and Augustus and Livia are also waiting for them to commence.',
        oi.status_after = 'The Games are officially initiated by Marcellus\'s declaration, \'Let the Games begin!\'. The spectacle is now underway, unfolding as a public entertainment event intended to glorify Marcellus and impress the Roman populace, serving their intended function of enhancing his public image and solidifying his political capital.'
    WITH oi
    MATCH (o:Object {uuid: 'object_games_of_marcellus'})
    MATCH (e:Event {uuid: 'event_9_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits restlessly in the imperial box, visibly agitated by the delay in the games\' commencement. He fidgets and glances towards the entrance, his focus torn between the spectacle about to unfold and the tardiness of Marcellus. He gestures with slight irritation, voicing his impatience to Livia and emphasizing his desire for the entertainment to begin, mirroring a historical precedent he keenly remembers.',
        ap.emotional_state = 'Augustus is outwardly impatient and somewhat fretful. He expresses annoyance at the delay and seems preoccupied with maintaining proper imperial decorum and public perception, recalling the negative reactions to his uncle Julius Caesar\'s similar behavior. Beneath the surface, there\'s a hint of insecurity about his control over events and a deep-seated need for public approval, masked by his desire for entertainment and diversion from the burdens of rule.',
        ap.emotional_tags = ["augustus is outwardly impatient", "somewhat fretful. he expresses annoyance at the delay", "seems preoccupied with maintaining proper imperial decorum", "public perception, recalling the negative reactions to his uncle julius caesar's similar behavior. beneath the surface, there's a hint of insecurity about his control over events", "a deep-seated need for public approval, masked by his desire for entertainment", "diversion from the burdens of rule.", "augustus is outwardly impatient and somewhat fretful. he expresses annoyance at the delay and seems preoccupied with maintaining proper imperial decorum and public perception", "recalling the negative reactions to his uncle julius caesar's similar behavior. beneath the surface", "there's a hint of insecurity about his control over events and a deep-seated need for public approval", "masked by his desire for entertainment and diversion from the burdens of rule."],
        ap.active_plans = ["To initiate the games promptly to appease the impatient crowd.", "To project an image of imperial authority and enjoyment of the public spectacle.", "To ensure Marcellus's arrival and the smooth running of the event, reflecting well on his family and reign."],
        ap.beliefs = ["Maintaining a positive public image is crucial for imperial stability.", "Roman rulers should provide grand spectacles for the populace.", "Punctuality and adherence to tradition are vital for public events and imperial prestige."],
        ap.goals = ["Short-term: To start the games and be entertained by the spectacle.", "Medium-term: To reinforce his popularity and project an image of a strong and capable emperor.", "Ultimate: To secure his legacy as a beloved and successful ruler who provided prosperity and entertainment for Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Livia remains seated beside Augustus in the imperial box, an island of calm amidst his agitation. Unperturbed by the surrounding spectacle and Augustus\'s restlessness, she is deeply engrossed in reading letters and petitions. Her attention is firmly fixed on the documents in her hands, her posture composed and unwavering, demonstrating her unwavering commitment to her imperial duties even during public events.',
        ap.emotional_state = 'Livia projects an air of serene detachment and unwavering focus. Her outward demeanor is calm and composed, seemingly unaffected by Augustus\'s impatience or the anticipation of the games. Internally, she is prioritizing pragmatic governance over frivolous spectacle, viewing the public entertainment as secondary to the pressing matters of state. There\'s a subtle undercurrent of self-assuredness and perhaps a hint of disdain for Augustus\'s preoccupation with appearances, underscoring her pragmatic and duty-driven nature.',
        ap.emotional_tags = ["livia projects an air of serene detachment", "unwavering focus. her outward demeanor is calm", "composed, seemingly unaffected by augustus's impatience or the anticipation of the games. internally, she is prioritizing pragmatic governance over frivolous spectacle, viewing the public entertainment as secondary to the pressing matters of state. there's a subtle undercurrent of self-assuredness", "perhaps a hint of disdain for augustus's preoccupation with appearances, underscoring her pragmatic", "duty-driven nature.", "livia projects an air of serene detachment and unwavering focus. her outward demeanor is calm and composed", "seemingly unaffected by augustus's impatience or the anticipation of the games. internally", "she is prioritizing pragmatic governance over frivolous spectacle", "viewing the public entertainment as secondary to the pressing matters of state. there's a subtle undercurrent of self-assuredness and perhaps a hint of disdain for augustus's preoccupation with appearances", "underscoring her pragmatic and duty-driven nature."],
        ap.active_plans = ["To efficiently address urgent state matters by reviewing and responding to letters and petitions.", "To subtly assert her dedication to governance and her pragmatic approach to leadership.", "To remain composed and in control, contrasting with Augustus's visible agitation and reinforcing her image as a steadfast ruler."],
        ap.beliefs = ["Effective governance and diligent attention to duty are paramount responsibilities.", "Pragmatic action and efficient management are more important than public appearances and entertainment.", "Maintaining control and composure is essential for demonstrating imperial strength and stability."],
        ap.goals = ["Short-term: To process and address pressing state matters efficiently.", "Medium-term: To maintain her influence in governance and ensure the smooth functioning of the empire.", "Ultimate: To secure long-term stability and prosperity for Rome, and to solidify her own and Tiberius's power and legacy within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits in the imperial box, fidgeting with impatience as he awaits Marcellus\'s arrival. His excitement builds as he speaks animatedly about the rhinoceros, gesturing with enthusiasm to illustrate its distinctive features.',
        ap.emotional_state = 'Augustus exhibits a mix of impatience and childlike excitement, eager for the spectacle to begin. His enthusiasm is palpable, contrasting sharply with Livia’s cool demeanor, suggesting an underlying vulnerability beneath his imperial façade.',
        ap.emotional_tags = ["augustus exhibits a mix of impatience", "childlike excitement, eager for the spectacle to begin. his enthusiasm is palpable, contrasting sharply with livia\u2019s cool demeanor, suggesting an underlying vulnerability beneath his imperial fa\u00e7ade.", "augustus exhibits a mix of impatience and childlike excitement", "eager for the spectacle to begin. his enthusiasm is palpable", "contrasting sharply with livia\u2019s cool demeanor", "suggesting an underlying vulnerability beneath his imperial fa\u00e7ade."],
        ap.active_plans = ["To engage Livia's interest in the upcoming games by highlighting the spectacle of the rhinoceros.", "To assert his role as the Emperor who appreciates public entertainment and excitement.", "To showcase the popularity of Marcellus, reinforcing his position and the importance of family ties."],
        ap.beliefs = ["Public spectacle is essential for maintaining imperial authority and popularity.", "Family loyalty and achievement are paramount in securing the future of the empire.", "The grandeur of the games reflects the might and culture of Rome."],
        ap.goals = ["Short-term: To enjoy the games and the entertainment provided by Marcellus.", "Medium-term: To reinforce his position by demonstrating support for his family\u2019s achievements.", "Ultimate: To solidify his legacy and the stability of the empire through public favor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Livia sits calmly, reading letters while Augustus fidgets beside her, demonstrating her composed demeanor amidst the chaotic excitement of the Games. She responds with biting wit to Augustus\'s enthusiasm about the rhinoceros.',
        ap.emotional_state = 'Livia displays a detached, sardonic wit, masking any amusement with a critical edge. Her apparent disinterest in the festivities reflects a calculated distance, as she prioritizes her own agendas over the superficial spectacle.',
        ap.emotional_tags = ["livia displays a detached", "sardonic wit", "masking any amusement with a critical edge. her apparent disinterest in the festivities reflects a calculated distance", "as she prioritizes her own agendas over the superficial spectacle."],
        ap.active_plans = ["To maintain control of the narrative around the games and assert her own wit and intelligence.", "To subtly undermine Augustus's enthusiasm and remind him of the more pragmatic aspects of their world.", "To gather information from the letters, prioritizing her strategic ambitions over public spectacle."],
        ap.beliefs = ["The games are superficial distractions from the underlying political machinations of Rome.", "Wit and intelligence are more powerful tools than mere entertainment.", "Her son's future is paramount, and all actions should align with ensuring Tiberius's rise."],
        ap.goals = ["Short-term: To engage with Augustus without losing her position of control.", "Medium-term: To subtly manipulate perceptions of the games and their significance.", "Ultimate: To secure her son's place in the succession and diminish threats to her family's power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Augustus is seated in the imperial box at the Coliseum, visibly restless as he awaits Marcellus\'s arrival. He fidgets and expresses concern about Livia reading letters during the games, revealing his anxiety about public perception. Upon Marcellus\'s entrance, he greets him with overt enthusiasm, acknowledging the crowd\'s roaring approval.',
        ap.emotional_state = 'Augustus is experiencing a mix of anticipation and anxiety. Outwardly, he projects imperial composure and paternal pride in Marcellus\'s popularity, yet beneath the surface, there\'s a flicker of insecurity about maintaining a favorable public image, referencing Julius Caesar\'s past missteps. He is also slightly irritated by Livia\'s pragmatic detachment from the spectacle, hinting at a deeper tension in their dynamic.',
        ap.emotional_tags = ["augustus is experiencing a mix of anticipation", "anxiety. outwardly, he projects imperial composure", "paternal pride in marcellus's popularity, yet beneath the surface, there's a flicker of insecurity about maintaining a favorable public image, referencing julius caesar's past missteps. he is also slightly irritated by livia's pragmatic detachment from the spectacle, hinting at a deeper tension in their dynamic.", "augustus is experiencing a mix of anticipation and anxiety. outwardly", "he projects imperial composure and paternal pride in marcellus's popularity", "yet beneath the surface", "there's a flicker of insecurity about maintaining a favorable public image", "referencing julius caesar's past missteps. he is also slightly irritated by livia's pragmatic detachment from the spectacle", "hinting at a deeper tension in their dynamic."],
        ap.active_plans = ["To present a united and celebratory imperial family to the Roman populace.", "To gauge the extent of Marcellus's popularity and its political implications.", "To enjoy the spectacle of the games, at least outwardly, maintaining the appearance of imperial leisure and benevolence."],
        ap.beliefs = ["Maintaining a positive public image is crucial for imperial authority and stability.", "Family unity, even if performative, is essential for projecting strength.", "Lavish public spectacles are effective tools for managing and pleasing the Roman populace."],
        ap.goals = ["Short-term: To appear in control and pleased with the unfolding events at the Coliseum.", "Medium-term: To solidify his dynasty's image and ensure a smooth succession, albeit still uncertain.", "Ultimate: To maintain the Pax Romana and secure his legacy as a wise and popular emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Livia is seated beside Augustus in the imperial box, maintaining an air of serene detachment. She calmly reads letters and petitions, seemingly unfazed by the roaring crowd and Augustus\'s fidgeting. Her posture is composed, her actions efficient, even amidst the spectacle of the games, indicating her unwavering focus on imperial matters.',
        ap.emotional_state = 'Livia is characterized by her pragmatic focus and emotional detachment. On the surface, she appears calm and collected, dismissing Augustus\'s concerns about appearances as \'fussing\'. Internally, she is likely assessing the political landscape, observing Marcellus\'s popularity with a calculating gaze, and prioritizing the efficient management of imperial affairs over the theatrical displays of the Coliseum.',
        ap.emotional_tags = ["livia is characterized by her pragmatic focus", "emotional detachment. on the surface, she appears calm", "collected, dismissing augustus's concerns about appearances as 'fussing'. internally, she is likely assessing the political landscape, observing marcellus's popularity with a calculating gaze,", "prioritizing the efficient management of imperial affairs over the theatrical displays of the coliseum.", "livia is characterized by her pragmatic focus and emotional detachment. on the surface", "she appears calm and collected", "dismissing augustus's concerns about appearances as 'fussing'. internally", "she is likely assessing the political landscape", "observing marcellus's popularity with a calculating gaze", "and prioritizing the efficient management of imperial affairs over the theatrical displays of the coliseum."],
        ap.active_plans = ["To utilize the waiting time productively by attending to urgent imperial correspondence and petitions.", "To observe Marcellus's public reception and gauge his political influence.", "To maintain her image as a pragmatic and efficient Empress, focused on real governance rather than mere spectacle."],
        ap.beliefs = ["Time is a valuable resource and should not be wasted on idle waiting, even at public events.", "True power lies in effective governance and strategic action, not in superficial displays.", "Public popularity can be a useful tool, but it must be carefully managed and assessed for its true worth."],
        ap.goals = ["Short-term: To efficiently manage her imperial duties even during public events.", "Medium-term: To subtly assess and potentially manipulate Marcellus's public standing to serve her long-term dynastic goals.", "Ultimate: To secure Tiberius's succession and ensure the enduring power of her lineage, prioritizing strategic efficiency over fleeting public adoration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Marcellus arrives at the imperial box accompanied by Julia and Octavia, making a grand entrance that immediately captivates the Coliseum crowd. He is met with a \'thunderous ovation\', showcasing his immense popularity. He acknowledges the crowd\'s adoration with confident gestures and promptly takes center stage, declaring \'Let the Games begin!\'',
        ap.emotional_state = 'Marcellus is radiating triumphant confidence and basking in the overwhelming public adoration. Outwardly, he displays charismatic enthusiasm and regal command, clearly relishing his role as the popular figurehead. Internally, he is likely feeling validated and empowered by the crowd\'s response, reinforcing his sense of entitlement and ambition. There is a palpable sense of pride and perhaps a touch of arrogance in his demeanor.',
        ap.emotional_tags = ["marcellus is radiating triumphant confidence", "basking in the overwhelming public adoration. outwardly, he displays charismatic enthusiasm", "regal command, clearly relishing his role as the popular figurehead. internally, he is likely feeling validated", "empowered by the crowd's response, reinforcing his sense of entitlement", "ambition. there is a palpable sense of pride", "perhaps a touch of arrogance in his demeanor.", "marcellus is radiating triumphant confidence and basking in the overwhelming public adoration. outwardly", "he displays charismatic enthusiasm and regal command", "clearly relishing his role as the popular figurehead. internally", "he is likely feeling validated and empowered by the crowd's response", "reinforcing his sense of entitlement and ambition. there is a palpable sense of pride and perhaps a touch of arrogance in his demeanor."],
        ap.active_plans = ["To make a memorable and impactful entrance, maximizing the spectacle and public acclaim.", "To solidify his image as a beloved and charismatic leader through the orchestrated Games.", "To assert his authority and popularity by immediately taking charge and initiating the games."],
        ap.beliefs = ["Public adoration is a direct measure of power and legitimacy in Rome.", "He is naturally entitled to public acclaim and leadership due to his lineage and charisma.", "Lavish public entertainment is essential for maintaining public order and showcasing imperial grandeur."],
        ap.goals = ["Short-term: To bask in the glory of the public ovation and enjoy his moment of triumph.", "Medium-term: To further enhance his public image and solidify his position as a favored leader and potential heir.", "Ultimate: To succeed Augustus and rule Rome, leveraging his popularity and charisma to maintain power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Julia arrives at the imperial box alongside Marcellus and Octavia, her presence noted but less emphasized than Marcellus\'s grand entrance. She stands beside him, part of the imperial tableau, likely maintaining a composed and dignified public demeanor befitting Augustus\'s daughter, though her inner thoughts remain concealed.',
        ap.emotional_state = 'Julia\'s emotional state is likely characterized by a detached cynicism masked by outward composure. On the surface, she presents a regal facade as part of the imperial family. Internally, she is likely observing the spectacle and Marcellus\'s triumphant reception with a critical eye, possibly feeling alienated from the manufactured enthusiasm and aware of the superficiality of public life and her own constrained role within it.',
        ap.emotional_tags = ["julia's emotional state is likely characterized by a detached cynicism masked by outward composure. on the surface, she presents a regal facade as part of the imperial family. internally, she is likely observing the spectacle", "marcellus's triumphant reception with a critical eye, possibly feeling alienated from the manufactured enthusiasm", "aware of the superficiality of public life", "her own constrained role within it.", "julia's emotional state is likely characterized by a detached cynicism masked by outward composure. on the surface", "she presents a regal facade as part of the imperial family. internally", "she is likely observing the spectacle and marcellus's triumphant reception with a critical eye", "possibly feeling alienated from the manufactured enthusiasm and aware of the superficiality of public life and her own constrained role within it."],
        ap.active_plans = ["To fulfill her dynastic duty by appearing alongside Marcellus and Octavia in the imperial box.", "To observe the dynamics of public perception and political performance at the Coliseum.", "To maintain a composed and dignified public image, masking any personal feelings of cynicism or discontent."],
        ap.beliefs = ["Public life in Rome is largely performative and lacks genuine substance.", "Her role as Augustus's daughter is primarily to serve dynastic purposes and maintain appearances.", "Marcellus's popularity is likely a carefully constructed image, and the public's adoration is fickle."],
        ap.goals = ["Short-term: To endure the public spectacle and fulfill her expected role in the imperial family display.", "Medium-term: To navigate the constraints of her dynastic position while maintaining a degree of personal autonomy and observation.", "Ultimate: To find some form of personal agency or meaning within her limited sphere of influence, potentially through subtle acts of defiance or observation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Octavia arrives at the imperial box with Marcellus and Julia, her presence contributing to the imperial family\'s collective appearance. She is mentioned as part of the group arriving, suggesting she maintains a quiet and supportive presence, likely observing the scene with a sense of weary resignation.',
        ap.emotional_state = 'Octavia\'s emotional state is likely subdued and melancholic, reflecting her ongoing grief and weary acceptance of her role in the imperial family. Outwardly, she probably maintains a composed and dignified demeanor. Internally, she is likely experiencing a sense of detachment from the spectacle, her thoughts possibly preoccupied with her losses and the heavy weight of familial duty, observing the scene with a quiet sorrow.',
        ap.emotional_tags = ["octavia's emotional state is likely subdued", "melancholic, reflecting her ongoing grief", "weary acceptance of her role in the imperial family. outwardly, she probably maintains a composed", "dignified demeanor. internally, she is likely experiencing a sense of detachment from the spectacle, her thoughts possibly preoccupied with her losses", "the heavy weight of familial duty, observing the scene with a quiet sorrow.", "octavia's emotional state is likely subdued and melancholic", "reflecting her ongoing grief and weary acceptance of her role in the imperial family. outwardly", "she probably maintains a composed and dignified demeanor. internally", "she is likely experiencing a sense of detachment from the spectacle", "her thoughts possibly preoccupied with her losses and the heavy weight of familial duty", "observing the scene with a quiet sorrow."],
        ap.active_plans = ["To fulfill her familial duty by accompanying Marcellus and Julia to the public games.", "To offer silent support to Marcellus, her son, in his public appearance.", "To endure the public spectacle with quiet resignation, minimizing her personal engagement with the performative aspects of the event."],
        ap.beliefs = ["Life is inherently filled with sorrow and loss, particularly within the context of imperial ambition.", "Public appearances are a necessary but often superficial aspect of imperial life.", "Family duty and loyalty, despite the personal cost, are paramount obligations."],
        ap.goals = ["Short-term: To fulfill her immediate familial obligations at the Coliseum with quiet dignity.", "Medium-term: To navigate her grief and loss while maintaining her public role within the imperial family.", "Ultimate: To find peace and solace amidst the ongoing turmoil and personal tragedies of imperial life, perhaps through quiet acts of familial devotion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Augustus walks down the hallway with a concerned demeanor, his brow furrowed as he approaches Livia, who is seated and appears unwell. He halts beside her, leaning slightly forward with an intent gaze, reaching out in a gesture of care while observing her pallid complexion.',
        ap.emotional_state = 'Surface emotions reveal a mix of concern and duty; Augustus\'s tone carries a paternal warmth as he checks on Livia, but beneath that, an underlying tension simmers regarding his responsibilities to both her and the empire. He feels the gnaw of his political obligations overshadowing personal connections.',
        ap.emotional_tags = ["surface emotions reveal a mix of concern", "duty; augustus's tone carries a paternal warmth as he checks on livia, but beneath that, an underlying tension simmers regarding his responsibilities to both her", "the empire. he feels the gnaw of his political obligations overshadowing personal connections.", "surface emotions reveal a mix of concern and duty; augustus's tone carries a paternal warmth as he checks on livia", "but beneath that", "an underlying tension simmers regarding his responsibilities to both her and the empire. he feels the gnaw of his political obligations overshadowing personal connections.", "surface emotions reveal a mix of concern and duty", "augustus's tone carries a paternal warmth as he checks on livia, but beneath that, an underlying tension simmers regarding his responsibilities to both her and the empire. he feels the gnaw of his political obligations overshadowing personal connections.", "surface emotions reveal a mix of concern and duty; augustus's tone carries a paternal warmth as he checks on livia,", "beneath that, an underlying tension simmers regarding his responsibilities to both her and the empire. he feels the gnaw of his political obligations overshadowing personal connections."],
        ap.active_plans = ["To reassure Livia about the ongoing Games and distract her from her discomfort.", "To maintain a facade of normalcy amidst his impending journey to the Eastern provinces.", "To subtly assert his authority by downplaying Agrippa's absence, reinforcing his control over the situation."],
        ap.beliefs = ["Loyalty to the empire should take precedence over personal concerns.", "His role as Emperor requires him to maintain a strong, unyielding front, even with family.", "Public appearances and celebrations are paramount for maintaining the image of stability in Rome."],
        ap.goals = ["Short-term: To check on Livia\u2019s health and reassure her.", "Medium-term: To successfully navigate his upcoming trip to the Eastern provinces without unrest in Rome.", "Ultimate: To secure his legacy and ensure the stability of his rule amidst rising tensions in the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Livia sits in the hallway, propped against the wall with a slight wince on her face, indicating discomfort. She shakes her head slowly in response to Augustus\'s inquiries, her posture slightly slumped, showcasing a facade of fatigue.',
        ap.emotional_state = 'Outwardly, Livia presents a stoic demeanor, feigning weakness as she claims to have a headache. Internally, she is calculating, weighing Augustus\'s concern against her own ambitions. There\'s a tension between her desire to appear vulnerable and her relentless ambition for power.',
        ap.emotional_tags = ["outwardly, livia presents a stoic demeanor, feigning weakness as she claims to have a headache. internally, she is calculating, weighing augustus's concern against her own ambitions. there's a tension between her desire to appear vulnerable", "her relentless ambition for power.", "outwardly", "livia presents a stoic demeanor", "feigning weakness as she claims to have a headache. internally", "she is calculating", "weighing augustus's concern against her own ambitions. there's a tension between her desire to appear vulnerable and her relentless ambition for power."],
        ap.active_plans = ["To manipulate Augustus's concern for her health to maintain his attention and influence over him.", "To gather information about Augustus's plans regarding Agrippa and the Eastern provinces.", "To position herself as essential to Augustus's well-being and decision-making, subtly reinforcing her dominance."],
        ap.beliefs = ["Weakness can be a strategic advantage if wielded correctly.", "Her son, Tiberius, should inherit the throne, and she must navigate the political landscape to ensure that outcome.", "The health of her relationship with Augustus is vital for sustaining her power; thus, she must maintain the appearance of loyalty and concern."],
        ap.goals = ["Short-term: To recover from her headache and maintain Augustus's concern and focus on her.", "Medium-term: To influence Augustus's decisions regarding Agrippa and the Eastern provinces while subtly undermining potential rivals.", "Ultimate: To secure her family's position in the empire and Tiberius's ascendance to the throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Augustus walks down a hallway, seeking out Livia. He stops upon finding her, standing close and attempting to engage her in conversation. He gestures expansively as he speaks of the Games and Marcellus, his movements confident and Emperor-like, before preparing to depart back to the spectacle, leaving Livia alone in the hallway.',
        ap.emotional_state = 'Augustus projects an air of paternal reassurance, appearing concerned for Livia\'s health with a superficial politeness. Beneath this facade, he is brimming with self-satisfaction regarding Marcellus\'s success, seeing it as a personal triumph and validation of his judgment. However, a subtle undercurrent of insecurity surfaces in his questioning of Livia\'s worries, hinting at a deeper need for her approval and a slight paranoia about being truly needed.',
        ap.emotional_tags = ["augustus projects an air of paternal reassurance, appearing concerned for livia's health with a superficial politeness. beneath this facade, he is brimming with self-satisfaction regarding marcellus's success, seeing it as a personal triumph", "validation of his judgment. however, a subtle undercurrent of insecurity surfaces in his questioning of livia's worries, hinting at a deeper need for her approval", "a slight paranoia about being truly needed.", "augustus projects an air of paternal reassurance", "appearing concerned for livia's health with a superficial politeness. beneath this facade", "he is brimming with self-satisfaction regarding marcellus's success", "seeing it as a personal triumph and validation of his judgment. however", "a subtle undercurrent of insecurity surfaces in his questioning of livia's worries", "hinting at a deeper need for her approval and a slight paranoia about being truly needed."],
        ap.active_plans = ["To reassure Livia of his impending departure by emphasizing Marcellus's competence in his absence.", "To assert his imperial authority by subtly dismissing Agrippa's importance and highlighting his own indispensable role in governing the Eastern provinces.", "To return to the Roman Coliseum and bask in the public adoration and spectacle of the Games, reinforcing his image as a beloved leader."],
        ap.beliefs = ["Marcellus is a capable and reliable successor, fully able to manage affairs in Rome during his absence.", "His presence is essential for the stability and governance of the Roman Empire, particularly in the distant Eastern provinces.", "Agrippa's influence is waning and no longer poses a significant threat to his power or plans."],
        ap.goals = ["Short-term: Rejoin the Games and enjoy the festivities, reinforcing his public image.", "Medium-term: Ensure a smooth and unchallenged rule in Rome during his months-long absence, delegating authority to Marcellus.", "Ultimate: Secure his legacy as a powerful and respected emperor who successfully managed both domestic and foreign affairs of Rome, while subtly undermining potential rivals like Agrippa."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the hallway, positioned as if retreating or withdrawing from the public eye. She feigns illness, claiming a headache and subtly shaking her head to decline Augustus\'s invitation to rejoin the Games. Her physical presence is subdued, her movements minimal, maintaining an aura of fragility and disinterest in the surrounding spectacle, while carefully observing Augustus.',
        ap.emotional_state = 'On the surface, Livia presents a picture of delicate illness and subdued acknowledgment of Marcellus\'s triumphs, expressing a lack of energy and enthusiasm for the Games. Internally, she is in full control, using her feigned ailment as a strategic maneuver to detach herself from public events and manipulate Augustus. Her subdued responses mask a keen assessment of Augustus\'s ego and his overconfidence in Marcellus, emotions likely ranging from cold calculation to subtle satisfaction at her plan unfolding.',
        ap.emotional_tags = ["on the surface, livia presents a picture of delicate illness", "subdued acknowledgment of marcellus's triumphs, expressing a lack of energy", "enthusiasm for the games. internally, she is in full control, using her feigned ailment as a strategic maneuver to detach herself from public events", "manipulate augustus. her subdued responses mask a keen assessment of augustus's ego", "his overconfidence in marcellus, emotions likely ranging from cold calculation to subtle satisfaction at her plan unfolding.", "on the surface", "livia presents a picture of delicate illness and subdued acknowledgment of marcellus's triumphs", "expressing a lack of energy and enthusiasm for the games. internally", "she is in full control", "using her feigned ailment as a strategic maneuver to detach herself from public events and manipulate augustus. her subdued responses mask a keen assessment of augustus's ego and his overconfidence in marcellus", "emotions likely ranging from cold calculation to subtle satisfaction at her plan unfolding."],
        ap.active_plans = ["To maintain the facade of illness to avoid returning to the Games, providing a cover for her private schemes and machinations away from public scrutiny.", "To subtly probe Augustus's state of mind, gauging his confidence in Marcellus and his obliviousness to any underlying tensions or her true intentions.", "To gather crucial information about Augustus's impending trip to the East, particularly the duration and whether it might involve any interaction with Agrippa, assessing potential shifts in the political landscape."],
        ap.beliefs = ["Feigning illness is an effective tool to manipulate situations and gain strategic advantages, allowing her to operate outside of the usual expectations and scrutiny of court life.", "Augustus is easily swayed by flattery and blind to deeper manipulations, especially when his ego is stroked with reassurances about his control and popularity.", "Marcellus's public success, while seemingly beneficial to Augustus, is ultimately a stepping stone in her larger plan, a pawn to be maneuvered towards her own dynastic ambitions."],
        ap.goals = ["Short-term: Successfully maintain her pretense of illness to remain removed from the Games and focus on her private agenda.", "Medium-term: Continue to subtly manipulate Augustus's perceptions of Marcellus and Agrippa, guiding him towards decisions that ultimately benefit Tiberius's path to succession.", "Ultimate: Secure Tiberius's ascension to power, ensuring her family's dominance over Rome and consolidating her own position as the power behind the throne, regardless of the cost or necessary deceptions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Augustus walks down the hallway, his posture slightly hunched with worry as he approaches Livia. He stands close, using gestures of concern to convey his care, but his demeanor remains authoritative, a subtle mix of paternalism and detachment reflecting the burden of leadership.',
        ap.emotional_state = 'Surface emotions reveal Augustus\'s concern for Livia, yet beneath, there lies an undercurrent of dismissive confidence in his own power. His tone is casual, betraying an internal struggle between genuine concern for his wife and the burdens of impending political maneuvering. He projects a façade of calm, masking anxiety about his plans.',
        ap.emotional_tags = ["surface emotions reveal augustus's concern for livia, yet beneath, there lies an undercurrent of dismissive confidence in his own power. his tone is casual, betraying an internal struggle between genuine concern for his wife", "the burdens of impending political maneuvering. he projects a fa\u00e7ade of calm, masking anxiety about his plans.", "surface emotions reveal augustus's concern for livia", "yet beneath", "there lies an undercurrent of dismissive confidence in his own power. his tone is casual", "betraying an internal struggle between genuine concern for his wife and the burdens of impending political maneuvering. he projects a fa\u00e7ade of calm", "masking anxiety about his plans."],
        ap.active_plans = ["To assess Livia's health and determine if her condition might impact his travel plans.", "To reassure Livia that the games are a grand success, implying his own importance in the empire's affairs.", "To prepare for his departure to the Eastern provinces, focusing on maintaining control over the political landscape."],
        ap.beliefs = ["Belief in his authority as emperor and the need to maintain a strong front.", "Conviction that the games and his governance are sufficient to secure loyalty and stability in Rome.", "Faith in his ability to manage familial dynamics, believing that Marcellus can fulfill duties in his absence."],
        ap.goals = ["Short-term: To ensure Livia feels supported before he departs.", "Medium-term: To successfully manage the empire's affairs during his absence in the Eastern provinces.", "Ultimate: To solidify his legacy and maintain control over succession, ensuring the stability of his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the hallway, her body language conveys a subtle vulnerability as she leans against the wall. She shakes her head in response to Augustus, her gestures indicating both weariness and a strategic detachment, masking her true intentions behind an air of frailness.',
        ap.emotional_state = 'Outwardly, Livia expresses mild discomfort, her tone laced with feigned concern for her own health, but internally she is sharp, calculating, and focused. She harbors unspoken ambitions, viewing Augustus’s departure as an opportunity to manipulate the power vacuum it creates, revealing her internal conflict between loyalty to Augustus and her desire for control.',
        ap.emotional_tags = ["outwardly, livia expresses mild discomfort, her tone laced with feigned concern for her own health, but internally she is sharp, calculating,", "focused. she harbors unspoken ambitions, viewing augustus\u2019s departure as an opportunity to manipulate the power vacuum it creates, revealing her internal conflict between loyalty to augustus", "her desire for control.", "outwardly", "livia expresses mild discomfort", "her tone laced with feigned concern for her own health", "but internally she is sharp", "calculating", "and focused. she harbors unspoken ambitions", "viewing augustus\u2019s departure as an opportunity to manipulate the power vacuum it creates", "revealing her internal conflict between loyalty to augustus and her desire for control.", "outwardly, livia expresses mild discomfort, her tone laced with feigned concern for her own health,", "internally she is sharp, calculating, and focused. she harbors unspoken ambitions, viewing augustus\u2019s departure as an opportunity to manipulate the power vacuum it creates, revealing her internal conflict between loyalty to augustus and her desire for control."],
        ap.active_plans = ["To gauge Augustus's mindset regarding Agrippa and use this information to her advantage.", "To subtly instill worry in Augustus about his plans, ensuring he feels more tethered to her and less independent.", "To prepare for the imminent power shift caused by Augustus's absence and position herself strategically for influence."],
        ap.beliefs = ["Belief that her health serves as both a shield and a weapon in her political machinations.", "Conviction that she must manipulate the dynamics of power to secure Tiberius\u2019s place in the succession.", "Faith in her ability to turn any situation to her advantage through careful strategy."],
        ap.goals = ["Short-term: To keep Augustus concerned about her health and focused on her needs.", "Medium-term: To manipulate the political landscape during Augustus's absence, creating a power vacuum.", "Ultimate: To ensure Tiberius\u2019s ascension to the throne while dismantling any threats, particularly from Agrippa."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Augustus paces down a dimly lit hallway of the Claudian Villa, his brow furrowed with concern as he seeks out Livia. Upon finding her, he stands before her, inquiring about her well-being and then launching into a somewhat boastful account of Marcellus\'s success at the Games. He gestures expansively as he outlines his upcoming trip to the Eastern provinces, emphasizing the duration and his self-assuredness in managing affairs without Agrippa.',
        ap.emotional_state = 'Augustus projects an air of imperial confidence and dismissiveness, particularly regarding Agrippa. He attempts to appear unconcerned and in control, boasting about Marcellus\'s popularity and his own ability to govern effectively without relying on his former ally. However, beneath this facade of self-assurance, a flicker of insecurity and perhaps even a need for validation might be detected. His repeated assertions of independence from Agrippa suggest an underlying awareness of Agrippa’s significant capabilities and influence, which he is actively trying to downplay, both to Livia and perhaps to himself.',
        ap.emotional_tags = ["augustus projects an air of imperial confidence", "dismissiveness, particularly regarding agrippa. he attempts to appear unconcerned", "in control, boasting about marcellus's popularity", "his own ability to govern effectively without relying on his former ally. however, beneath this facade of self-assurance, a flicker of insecurity", "perhaps even a need for validation might be detected. his repeated assertions of independence from agrippa suggest an underlying awareness of agrippa\u2019s significant capabilities", "influence, which he is actively trying to downplay, both to livia", "perhaps to himself.", "augustus projects an air of imperial confidence and dismissiveness", "particularly regarding agrippa. he attempts to appear unconcerned and in control", "boasting about marcellus's popularity and his own ability to govern effectively without relying on his former ally. however", "beneath this facade of self-assurance", "a flicker of insecurity and perhaps even a need for validation might be detected. his repeated assertions of independence from agrippa suggest an underlying awareness of agrippa\u2019s significant capabilities and influence", "which he is actively trying to downplay", "both to livia and perhaps to himself."],
        ap.active_plans = ["Reassure Livia that his upcoming absence is routine and poses no threat to the stability of Rome.", "Assert his authority and self-sufficiency by explicitly stating he no longer needs Agrippa's support.", "Prepare for his four to five month trip to the Eastern provinces, intending to reinforce Roman presence and authority there."],
        ap.beliefs = ["The Emperor must project an image of unwavering strength and self-reliance to maintain control.", "Direct imperial presence in the provinces is essential for effective governance and maintaining order.", "His own judgment and capabilities are now sufficient to manage the empire, eclipsing the need for key advisors like Agrippa."],
        ap.goals = ["{short_term: Depart for the Eastern provinces without raising alarms or appearing weak, ensuring a smooth transition of day-to-day affairs., medium_term: Solidify Roman authority and his personal influence in the Eastern provinces during his extended visit, reinforcing imperial dominance., ultimate: Secure his legacy as the unquestioned and indispensable ruler of Rome, demonstrating his absolute control and diminishing the perceived importance of potential rivals or indispensable figures like Agrippa in the eyes of the court and the populace.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands passively in the hallway as Augustus approaches, subtly conveying an air of delicate unwellness, indicated by her claim of a headache and a slight shake of her head. She listens intently to Augustus, her physical stillness contrasting with the active calculations occurring behind her veiled expressions. She responds minimally, confirming Marcellus\'s success but remaining reserved, her posture suggesting a strategic withdrawal from the public spectacle of the Games.',
        ap.emotional_state = 'On the surface, Livia presents a picture of mild discomfort and subdued interest, using her feigned illness as a convenient shield and a tool to draw Augustus into a more private and controlled interaction. Internally, she is sharply observant and calculating, subtly probing Augustus\'s intentions regarding Agrippa and his upcoming trip. Beneath her composed exterior lies a strategic mind assessing the power dynamics at play and the implications of Augustus\'s declarations about Agrippa. Her veiled responses mask a keen interest in Augustus\'s true feelings and any potential vulnerabilities his pronouncements might reveal, all while carefully concealing her own ambitions.',
        ap.emotional_tags = ["on the surface, livia presents a picture of mild discomfort", "subdued interest, using her feigned illness as a convenient shield", "a tool to draw augustus into a more private", "controlled interaction. internally, she is sharply observant", "calculating, subtly probing augustus's intentions regarding agrippa", "his upcoming trip. beneath her composed exterior lies a strategic mind assessing the power dynamics at play", "the implications of augustus's declarations about agrippa. her veiled responses mask a keen interest in augustus's true feelings", "any potential vulnerabilities his pronouncements might reveal, all while carefully concealing her own ambitions.", "on the surface", "livia presents a picture of mild discomfort and subdued interest", "using her feigned illness as a convenient shield and a tool to draw augustus into a more private and controlled interaction. internally", "she is sharply observant and calculating", "subtly probing augustus's intentions regarding agrippa and his upcoming trip. beneath her composed exterior lies a strategic mind assessing the power dynamics at play and the implications of augustus's declarations about agrippa. her veiled responses mask a keen interest in augustus's true feelings and any potential vulnerabilities his pronouncements might reveal", "all while carefully concealing her own ambitions.", "on the surface, livia presents a picture of mild discomfort and subdued interest, using her feigned illness as a convenient shield and a tool to draw augustus into a more private and controlled interaction. internally, she is sharply observant and calculating, subtly probing augustus's intentions regarding agrippa and his upcoming trip. beneath her composed exterior lies a strategic mind assessing the power dynamics at play and the implications of augustus's declarations about agrippa. her veiled responses mask a keen interest in augustus's true feelings and any potential vulnerabilities his pronouncements might reveal, all", "carefully concealing her own ambitions."],
        ap.active_plans = ["Maintain the facade of illness to avoid further engagement at the Games and control the interaction with Augustus on her own terms.", "Subtly probe Augustus\u2019s genuine feelings towards Agrippa and the real motivations behind his dismissive statements.", "Assess the implications of Augustus\u2019s extended absence and how it might create opportunities to further her own agenda, particularly regarding Tiberius's position and Agrippa's diminished influence."],
        ap.beliefs = ["Strategic manipulation through feigned vulnerability and controlled emotional displays is a potent tool in courtly politics.", "Understanding and subtly influencing Augustus's perceptions and insecurities is crucial for achieving her long-term objectives.", "Agrippa remains a significant obstacle to Tiberius's succession and must be strategically neutralized or further marginalized to secure her son's path to power."],
        ap.goals = ["{short_term: Gather intelligence on Augustus's true intentions and vulnerabilities regarding Agrippa and his Eastern provinces trip, using her feigned illness as a pretext for private conversation., medium_term: Exploit Augustus's declared dismissal of Agrippa and his upcoming absence to strategically weaken Agrippa's influence within the court and further solidify Tiberius's standing as the most viable successor., ultimate: Secure Tiberius's unchallenged succession to the imperial throne, ensuring the continuation of her lineage's power and influence over Rome, by methodically eliminating or neutralizing all potential threats and rivals, including Agrippa.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Livia sits poised in her chambers, her posture straight and commanding, as she inquires about any letters from Augustus. Her tone is smooth yet edged with impatience, needing to control the information flow and maintain her influence.',
        ap.emotional_state = 'Livia exhibits a calculated calm, though beneath the surface, there is a palpable tension fueled by her insatiable ambition and desire for power. Her inquiry reflects a deep-seated need to stay informed, revealing both her vigilance and her underlying anxiety about potential threats to her plans.',
        ap.emotional_tags = ["livia exhibits a calculated calm, though beneath the surface, there is a palpable tension fueled by her insatiable ambition", "desire for power. her inquiry reflects a deep-seated need to stay informed, revealing both her vigilance", "her underlying anxiety about potential threats to her plans.", "livia exhibits a calculated calm", "though beneath the surface", "there is a palpable tension fueled by her insatiable ambition and desire for power. her inquiry reflects a deep-seated need to stay informed", "revealing both her vigilance and her underlying anxiety about potential threats to her plans."],
        ap.active_plans = ["To gain access to all relevant imperial correspondence, ensuring her influence over decisions.", "To manipulate the information regarding Marcellus's condition to her advantage, possibly using it to exert pressure or gain sympathy.", "To prepare for a meeting with Marcellus, aiming to steer the conversation towards her political interests."],
        ap.beliefs = ["Information is power, and controlling the narrative is essential for maintaining her position.", "Family loyalty is a tool to be wielded for strategic advantage in her ambition to see Tiberius succeed.", "Weakness, such as Marcellus's illness, must be exploited to further her own agenda."],
        ap.goals = ["Short-term: To ascertain the latest news from Augustus to prepare for potential shifts in power dynamics.", "Medium-term: To manipulate Marcellus and the information about his condition to strengthen her family's position.", "Ultimate: To ensure her son Tiberius ascends to the throne, solidifying her control over the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Pylades stands at the threshold of Livia\'s chambers, his posture respectful and attentive, delivering messages with precision and an air of subservience. He conveys the news of Marcellus\'s condition with practiced neutrality.',
        ap.emotional_state = 'Pylades maintains a stoic demeanor, reflecting loyalty and duty. However, an undercurrent of concern is present as he delivers potentially troubling news regarding Marcellus, aware that this information could impact Livia\'s plans and his own standing.',
        ap.emotional_tags = ["pylades maintains a stoic demeanor, reflecting loyalty", "duty. however, an undercurrent of concern is present as he delivers potentially troubling news regarding marcellus, aware that this information could impact livia's plans", "his own standing.", "pylades maintains a stoic demeanor", "reflecting loyalty and duty. however", "an undercurrent of concern is present as he delivers potentially troubling news regarding marcellus", "aware that this information could impact livia's plans and his own standing."],
        ap.active_plans = ["To relay information accurately and efficiently, serving as Livia\u2019s eyes and ears in the palace.", "To navigate the delicate situation regarding Marcellus's health without provoking Livia's wrath.", "To maintain his role as a trusted servant, ensuring Livia's directives are followed to the letter."],
        ap.beliefs = ["Absolute loyalty to Livia is paramount for his survival and success in the court.", "The flow of information is critical to the functioning of power dynamics within the palace.", "Understanding the desires and motivations of those in power is essential to anticipate their needs."],
        ap.goals = ["Short-term: To provide Livia with the information she seeks about Marcellus's condition.", "Medium-term: To ensure that Livia\u2019s plans regarding Marcellus's health are executed smoothly without complications.", "Ultimate: To maintain Livia's favor, securing his position and influence within her schemes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Livia is positioned within her private chambers, orchestrating events with calculated precision. She engages Pylades, issuing instructions with an air of imperial authority, yet cloaking her true intentions beneath a veneer of civic concern. Her posture is likely composed, each gesture measured and deliberate as she manipulates those around her.',
        ap.emotional_state = 'Livia outwardly projects an image of calm composure and regal purpose. Beneath this facade, she is driven by a potent mix of suspicion and strategic calculation. While she feigns interest in the \'citizens role\', her true motive is likely to probe Marcellus\'s state or to initiate a manipulation. There is a palpable tension between her spoken words and her underlying, unspoken agenda, fueled by her ambition and desire for control.',
        ap.emotional_tags = ["livia outwardly projects an image of calm composure", "regal purpose. beneath this facade, she is driven by a potent mix of suspicion", "strategic calculation. while she feigns interest in the 'citizens role', her true motive is likely to probe marcellus's state or to initiate a manipulation. there is a palpable tension between her spoken words", "her underlying, unspoken agenda, fueled by her ambition", "desire for control.", "livia outwardly projects an image of calm composure and regal purpose. beneath this facade", "she is driven by a potent mix of suspicion and strategic calculation. while she feigns interest in the 'citizens role'", "her true motive is likely to probe marcellus's state or to initiate a manipulation. there is a palpable tension between her spoken words and her underlying", "unspoken agenda", "fueled by her ambition and desire for control."],
        ap.active_plans = ["Summon Marcellus to her chambers under the guise of discussing official business.", "Assess Marcellus's current health and mental state, potentially gauging his vulnerability.", "Maintain a public image of diligent empress, concerned with the affairs of Rome, while secretly pursuing personal agendas."],
        ap.beliefs = ["Control is maintained through information and strategic maneuvering.", "Deception is a necessary tool to achieve political objectives.", "Her family's dominance requires constant vigilance and proactive measures."],
        ap.goals = ["Short-term: Secure a private meeting with Marcellus to evaluate him.", "Medium-term: Understand and potentially influence Marcellus's position within the court.", "Ultimate: Weaken or eliminate any threats to Tiberius's succession, solidifying her family's grip on power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Pylades stands before Livia in her chambers, attentive and obedient. He delivers news of a letter arrived for Marcellus and reports on Marcellus\'s current indisposition. He listens intently to Livia\'s instructions, ready to execute her commands with unquestioning loyalty and efficiency, embodying his role as her discreet instrument.',
        ap.emotional_state = 'Pylades maintains a neutral and dutiful demeanor, reflecting his position as a servant. He is likely focused on fulfilling his duties accurately and efficiently, showing no outward emotion. Internally, he is likely attuned to the subtle power dynamics of the court and the need for unwavering obedience to Livia. He is a figure of quiet competence, prioritizing service above personal expression.',
        ap.emotional_tags = ["pylades maintains a neutral", "dutiful demeanor, reflecting his position as a servant. he is likely focused on fulfilling his duties accurately", "efficiently, showing no outward emotion. internally, he is likely attuned to the subtle power dynamics of the court", "the need for unwavering obedience to livia. he is a figure of quiet competence, prioritizing service above personal expression.", "pylades maintains a neutral and dutiful demeanor", "reflecting his position as a servant. he is likely focused on fulfilling his duties accurately and efficiently", "showing no outward emotion. internally", "he is likely attuned to the subtle power dynamics of the court and the need for unwavering obedience to livia. he is a figure of quiet competence", "prioritizing service above personal expression."],
        ap.active_plans = ["Relay information about the letter for Marcellus to Livia.", "Report Marcellus's current condition and unavailability to Livia.", "Convey Livia's summons to Marcellus, should the opportunity arise, using the 'citizens role' pretext."],
        ap.beliefs = ["Loyalty and obedience to Livia are paramount for his role and survival.", "Discretion and efficiency are essential qualities for a valued servant.", "Remaining neutral and observant is crucial in the treacherous court environment."],
        ap.goals = ["Short-term: Accurately deliver information and instructions between Livia and Marcellus.", "Medium-term: Maintain Livia's trust and continue to be a reliable and effective servant.", "Ultimate: Secure his position and ensure his continued service within Livia's household by consistently fulfilling her commands."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Livia remains poised in her chambers, her posture radiating control and purpose. She listens intently as Pylades delivers news about Marcellus, her fingers steepled in contemplation, revealing her strategic mindset. Her movements are deliberate, as she subtly shifts her focus to the implications of Marcellus\'s illness, indicating her keen awareness of the power dynamics at play.',
        ap.emotional_state = 'Livia exudes calm, but beneath the surface, a tempest of ambition brews. Outwardly, she appears concerned about Marcellus, yet internally, she feels a sense of opportunity arising from his vulnerability. This juxtaposition highlights her manipulative nature, revealing her ability to mask her true intentions while plotting her next moves with ruthless precision.',
        ap.emotional_tags = ["livia exudes calm", "but beneath the surface", "a tempest of ambition brews. outwardly", "she appears concerned about marcellus", "yet internally", "she feels a sense of opportunity arising from his vulnerability. this juxtaposition highlights her manipulative nature", "revealing her ability to mask her true intentions while plotting her next moves with ruthless precision.", "livia exudes calm, but beneath the surface, a tempest of ambition brews. outwardly, she appears concerned about marcellus, yet internally, she feels a sense of opportunity arising from his vulnerability. this juxtaposition highlights her manipulative nature, revealing her ability to mask her true intentions", "plotting her next moves with ruthless precision.", "livia exudes calm,", "beneath the surface, a tempest of ambition brews. outwardly, she appears concerned about marcellus, yet internally, she feels a sense of opportunity arising from his vulnerability. this juxtaposition highlights her manipulative nature, revealing her ability to mask her true intentions while plotting her next moves with ruthless precision."],
        ap.active_plans = ["To leverage Marcellus's illness to further isolate him and manipulate the narrative around his health.", "To subtly communicate her authority over the court by expressing concern for Marcellus, thereby enhancing her power dynamics.", "To gather intelligence on the citizens role, which may hold implications for influencing public perception as Marcellus's health deteriorates."],
        ap.beliefs = ["Control over information is vital to maintaining her power.", "Vulnerability in others presents an opportunity for strategic manipulation.", "Her ambition for Tiberius's ascension justifies any means necessary to eliminate rivals."],
        ap.goals = ["Short-term: To extract more information about Marcellus's condition and use it to her advantage.", "Medium-term: To orchestrate a situation that positions her son, Tiberius, favorably for succession.", "Ultimate: To solidify her family's power within the Roman Empire, ensuring Tiberius's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Marcellus is confined to his bed, uncharacteristically passive. He lies beneath the silk covers, his brow furrowed in discomfort. His movements are minimal, showcasing his weakened state, and he avoids the eyes of those around him, indicating a sense of isolation and vulnerability. The absence of his family adds to his plight, leaving him without support in this moment of need.',
        ap.emotional_state = 'Marcellus experiences a mix of frustration and anxiety due to his sudden illness. Outwardly, he may feign courage, but internally he wrestles with feelings of vulnerability and concern for his standing in the court. The knowledge that he cannot fulfill his duties, compounded by the absence of familial support, further intensifies his emotional turmoil.',
        ap.emotional_tags = ["marcellus experiences a mix of frustration", "anxiety due to his sudden illness. outwardly, he may feign courage, but internally he wrestles with feelings of vulnerability", "concern for his standing in the court. the knowledge that he cannot fulfill his duties, compounded by the absence of familial support, further intensifies his emotional turmoil.", "marcellus experiences a mix of frustration and anxiety due to his sudden illness. outwardly", "he may feign courage", "but internally he wrestles with feelings of vulnerability and concern for his standing in the court. the knowledge that he cannot fulfill his duties", "compounded by the absence of familial support", "further intensifies his emotional turmoil.", "marcellus experiences a mix of frustration and anxiety due to his sudden illness. outwardly, he may feign courage,", "internally he wrestles with feelings of vulnerability and concern for his standing in the court. the knowledge that he cannot fulfill his duties, compounded by the absence of familial support, further intensifies his emotional turmoil."],
        ap.active_plans = ["To recover from his illness and regain his position of influence within the court.", "To ensure that his reputation remains intact despite this setback.", "To use this time to assess the loyalties of those around him, particularly Livia and Pylades."],
        ap.beliefs = ["Strength and vitality are paramount in maintaining his status within the political landscape.", "The support of family is crucial during times of personal crisis.", "Ambition requires constant vigilance and readiness to counter rival schemes."],
        ap.goals = ["Short-term: To recover quickly from his illness and return to public duties.", "Medium-term: To reaffirm his position within the court and navigate the political challenges ahead.", "Ultimate: To solidify his claim to power and ensure his legacy within the Julio-Claudian dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Pylades stands by Livia\'s door, his demeanor efficient and unobtrusive. He communicates the status of Marcellus with a measured tone, maintaining a neutral posture that reflects his loyalty to Livia and his role as her informant. His gestures are minimal yet precise, ensuring he conveys the gravity of the information he shares.',
        ap.emotional_state = 'Pylades feels a sense of duty, his loyalty to Livia driving his actions. However, he is also mindful of the tension surrounding Marcellus\'s illness, aware of the potential implications for the court\'s power dynamics. Although he remains composed, there is an undercurrent of concern for the political ramifications of his report.',
        ap.emotional_tags = ["pylades feels a sense of duty", "his loyalty to livia driving his actions. however", "he is also mindful of the tension surrounding marcellus's illness", "aware of the potential implications for the court's power dynamics. although he remains composed", "there is an undercurrent of concern for the political ramifications of his report."],
        ap.active_plans = ["To accurately relay information to Livia regarding Marcellus's condition without revealing any personal opinions.", "To maintain discretion about Marcellus's isolation, ensuring the information is used to Livia's advantage.", "To remain vigilant for any further developments that could impact Livia's plans."],
        ap.beliefs = ["Loyalty to Livia supersedes all other allegiances.", "Information is power, and the right details can shift the balance in political maneuvering.", "His role as Livia's servant is both a privilege and a peril, one that requires careful navigation."],
        ap.goals = ["Short-term: To provide Livia with timely and accurate information about Marcellus without drawing undue attention.", "Medium-term: To facilitate Livia's plans regarding Marcellus's situation and the political landscape.", "Ultimate: To ensure his continued favor with Livia, maintaining his role in her schemes."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_12_1'})
    ON CREATE SET
        oi.description = 'The bed in Marcellus\'s chamber becomes the focal point of the scene, serving as a stage for his confinement and Musa\'s medical examination. It physically restricts Marcellus, highlighting his weakened state against his will to be active. Musa leans over it to attend to Marcellus, using it as a platform to deliver his medical assessment and advice. The bed also becomes a silent witness to the power dynamics as Livia enters and dominates the space around it, further emphasizing Marcellus\'s vulnerability and lack of control over his own situation.',
        oi.status_before = 'The bed is in its normal state within Marcellus\'s chambers, presumably well-maintained and serving its usual function as a place of rest and sleep for its owner.',
        oi.status_after = 'The bed transforms into a sickbed, heavily associated with Marcellus\'s illness and increasing fragility. It becomes a symbol of his confinement and declining health, foreshadowing a potential turn for the worse and the bed\'s imminent transformation into a deathbed as his condition deteriorates within its confines.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_12_2'})
    ON CREATE SET
        oi.description = 'The bed serves as the focal point of Marcellus\'s vulnerability during the scene, dominating the dimly lit room. It transforms from a simple piece of furniture into a poignant symbol of his frailty and impending mortality, as Livia\'s entrance and care unfold against the backdrop of his confinement to it.',
        oi.status_before = 'Prior to the event, the bed is merely a place of rest, but with Marcellus\'s illness, it becomes a symbol of his weakened state and the potential rapid decline in health, setting the stage for Livia\'s manipulative care.',
        oi.status_after = 'After the event, the bed remains a physical manifestation of Marcellus\'s deteriorating health, now marked by the tension and drama of Livia\'s care, symbolizing not just his physical condition but the lethal games being played for control over his fate.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Musa is physically present in Marcellus\'s dimly lit chamber, leaning over the bed where Marcellus lies. He is actively engaged in his duties as a physician, his movements suggesting he is checking Marcellus\'s pulse and temperature, his brow furrowed with concern as he observes his patient\'s pallid and sweating state. He gestures with his hands as he tries to persuade Marcellus to remain resting.',
        ap.emotional_state = 'Musa is deeply worried and professionally concerned about Marcellus\'s rapidly deteriorating health. He is outwardly expressing his medical opinion and urging rest, but beneath the surface, there\'s a growing anxiety. He senses the seriousness of Marcellus\'s condition and is frustrated by Marcellus\'s stubborn denial and Livia\'s dismissive attitude. He feels a mounting pressure, caught between his professional duty and the suffocating political undercurrents of the palace, hinting at a sense of helplessness against forces beyond medicine.',
        ap.emotional_tags = ["musa is deeply worried", "professionally concerned about marcellus's rapidly deteriorating health. he is outwardly expressing his medical opinion", "urging rest, but beneath the surface, there's a growing anxiety. he senses the seriousness of marcellus's condition", "is frustrated by marcellus's stubborn denial", "livia's dismissive attitude. he feels a mounting pressure, caught between his professional duty", "the suffocating political undercurrents of the palace, hinting at a sense of helplessness against forces beyond medicine.", "musa is deeply worried and professionally concerned about marcellus's rapidly deteriorating health. he is outwardly expressing his medical opinion and urging rest", "but beneath the surface", "there's a growing anxiety. he senses the seriousness of marcellus's condition and is frustrated by marcellus's stubborn denial and livia's dismissive attitude. he feels a mounting pressure", "caught between his professional duty and the suffocating political undercurrents of the palace", "hinting at a sense of helplessness against forces beyond medicine.", "musa is deeply worried and professionally concerned about marcellus's rapidly deteriorating health. he is outwardly expressing his medical opinion and urging rest,", "beneath the surface, there's a growing anxiety. he senses the seriousness of marcellus's condition and is frustrated by marcellus's stubborn denial and livia's dismissive attitude. he feels a mounting pressure, caught between his professional duty and the suffocating political undercurrents of the palace, hinting at a sense of helplessness against forces beyond medicine."],
        ap.active_plans = ["Assess Marcellus's vital signs and diagnose the illness based on observable symptoms.", "Convince Marcellus of the severity of his condition and the necessity of bed rest for recovery.", "Attempt to communicate the urgency of the situation to others, potentially seeking support from Marcellus's family despite Livia's presence and subtle discouragement."],
        ap.beliefs = ["Medical expertise and careful observation are crucial for accurate diagnosis and effective treatment.", "Rest and proper care are fundamental to recovery from illness, especially from what seems like a severe ailment.", "A physician's primary duty is to advocate for the patient's well-being, even when facing resistance or political pressures."],
        ap.goals = ["Short-term: Accurately determine the nature and severity of Marcellus's illness.", "Medium-term: Stabilize Marcellus's condition and prevent further worsening through appropriate medical intervention and rest.", "Ultimate: Ensure Marcellus's full recovery and return to health, upholding his professional commitment to healing and care."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Marcellus is confined to his bed, his body weakened by illness, yet he attempts to project an image of strength and defiance. He lies pale and sweating, but tries to sit up and dismiss his ailment as a mere \'summer chill\'. He waves his hand dismissively, attempting to minimize his condition to both Musa and Livia, even as his physical state betrays his words.',
        ap.emotional_state = 'Marcellus is outwardly impatient and dismissive, determined to downplay the severity of his sickness. He projects a facade of robust health and eagerness to resume his duties, masking a deeper unease and physical discomfort. Internally, he is likely wrestling with fear and weakness, but his pride and ambition drive him to deny any vulnerability. There\'s a clear tension between his declining physical state and his desperate need to maintain an image of strength and control, especially in front of Livia.',
        ap.emotional_tags = ["marcellus is outwardly impatient", "dismissive, determined to downplay the severity of his sickness. he projects a facade of robust health", "eagerness to resume his duties, masking a deeper unease", "physical discomfort. internally, he is likely wrestling with fear", "weakness, but his pride", "ambition drive him to deny any vulnerability. there's a clear tension between his declining physical state", "his desperate need to maintain an image of strength", "control, especially in front of livia.", "marcellus is outwardly impatient and dismissive", "determined to downplay the severity of his sickness. he projects a facade of robust health and eagerness to resume his duties", "masking a deeper unease and physical discomfort. internally", "he is likely wrestling with fear and weakness", "but his pride and ambition drive him to deny any vulnerability. there's a clear tension between his declining physical state and his desperate need to maintain an image of strength and control", "especially in front of livia.", "marcellus is outwardly impatient and dismissive, determined to downplay the severity of his sickness. he projects a facade of robust health and eagerness to resume his duties, masking a deeper unease and physical discomfort. internally, he is likely wrestling with fear and weakness,", "his pride and ambition drive him to deny any vulnerability. there's a clear tension between his declining physical state and his desperate need to maintain an image of strength and control, especially in front of livia."],
        ap.active_plans = ["Minimize the perception of his illness and project an image of resilience and quick recovery to those around him.", "Dismiss Musa's medical advice and assert his own determination to overcome the 'minor' ailment quickly.", "Reassure Livia, and perhaps himself, that he is not seriously ill and will soon be back to his public duties, maintaining his position and influence."],
        ap.beliefs = ["Illness is a sign of weakness and must be quickly overcome to maintain his public image and political standing.", "His own willpower and determination are sufficient to overcome a 'summer chill' without significant rest or medical intervention.", "Maintaining a strong and active public presence is crucial to securing and advancing his position within the Roman court."],
        ap.goals = ["Short-term: Get out of bed immediately and appear healthy and active, defying the illness.", "Medium-term: Quickly return to his normal routine and public duties, demonstrating his unwavering strength and fitness.", "Ultimate: Solidify his image as a strong and capable leader, reinforcing his claim to power and influence within Rome, and not be perceived as weak or vulnerable."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Livia enters the dimly lit room with a poised demeanor, immediately approaching Marcellus\'s bedside. She places a cool hand on his forehead, her eyes scrutinizing him with a feigned maternal concern, while maintaining a calm and composed posture that masks her true intentions.',
        ap.emotional_state = 'Outwardly, Livia projects a calm and caring facade, her tone soothing and concerned. Internally, however, she is calculating and ambitious, using this moment to gain control over Marcellus\'s fate and solidify her power base. The contradiction between her apparent compassion and her ulterior motives creates a palpable tension.',
        ap.emotional_tags = ["outwardly, livia projects a calm", "caring facade, her tone soothing", "concerned. internally, however, she is calculating", "ambitious, using this moment to gain control over marcellus's fate", "solidify her power base. the contradiction between her apparent compassion", "her ulterior motives creates a palpable tension.", "outwardly", "livia projects a calm and caring facade", "her tone soothing and concerned. internally", "however", "she is calculating and ambitious", "using this moment to gain control over marcellus's fate and solidify her power base. the contradiction between her apparent compassion and her ulterior motives creates a palpable tension."],
        ap.active_plans = ["To manipulate Marcellus\u2019s illness to her advantage, ensuring he becomes dependent on her care.", "To undermine Musa's authority by claiming superiority in nursing, positioning herself as the only person capable of ensuring Marcellus's recovery.", "To subtly frame the narrative around Marcellus\u2019s health in a way that aligns with her ambitions for Tiberius's future."],
        ap.beliefs = ["That the ends justify the means in her pursuit of power.", "That displaying maternal concern will solidify her influence over those in the imperial family.", "That she can control the narrative around Marcellus\u2019s health to benefit her own ambitions."],
        ap.goals = ["Short-term: To nurse Marcellus back to health while controlling his dependency on her.", "Medium-term: To eliminate any competition for power from Marcellus, thereby securing Tiberius's position.", "Ultimate: To ensure her son, Tiberius, inherits the empire, positioning herself as the architect of his rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Marcellus lies in bed, visibly pale and sweating, presenting a vulnerable image. He attempts to assert his strength by dismissing his illness as a mere chill, though his weak posture and labored breathing reveal his distress. He interacts with Livia, seeking to maintain a façade of normalcy.',
        ap.emotional_state = 'Marcellus exhibits a brave front, trying to downplay his illness with an air of bravado; however, deep down, he is anxious about his health and the implications of his vulnerability. The tension between his outward confidence and internal fear creates a compelling character moment.',
        ap.emotional_tags = ["marcellus exhibits a brave front, trying to downplay his illness with an air of bravado; however, deep down, he is anxious about his health", "the implications of his vulnerability. the tension between his outward confidence", "internal fear creates a compelling character moment.", "marcellus exhibits a brave front", "trying to downplay his illness with an air of bravado; however", "deep down", "he is anxious about his health and the implications of his vulnerability. the tension between his outward confidence and internal fear creates a compelling character moment.", "marcellus exhibits a brave front, trying to downplay his illness with an air of bravado", "however, deep down, he is anxious about his health and the implications of his vulnerability. the tension between his outward confidence and internal fear creates a compelling character moment."],
        ap.active_plans = ["To convince Livia and Musa that he is not as ill as he appears, asserting his ability to recover quickly.", "To reassure Livia of his well-being to avoid appearing weak or reliant on her.", "To maintain his standing in the imperial family by downplaying the seriousness of his condition."],
        ap.beliefs = ["That showing weakness could undermine his position within the court.", "That he can recover quickly without needing Livia's intervention.", "That his previous resilience in the face of adversity will carry him through this illness as well."],
        ap.goals = ["Short-term: To recover from his illness without losing face in front of Livia and Musa.", "Medium-term: To regain control of his health and responsibilities within the imperial court.", "Ultimate: To secure his position as a powerful and influential figure in the empire without being perceived as frail."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Musa bursts into Marcellus\'s chambers, interrupting Livia\'s seemingly caring bedside vigil. He is visibly distressed, his movements rushed and his speech urgent as he addresses Livia directly at the door. He is focused on conveying the alarming deterioration of Marcellus\'s condition and the immediate need for action.',
        ap.emotional_state = 'Musa is gripped by acute anxiety and professional alarm. Outwardly, his agitation is clear in his rushed words and desperate knocking. Internally, he is likely battling a growing fear for Marcellus\'s life and a sense of helplessness against Livia\'s dismissive authority. He is torn between his duty to his patient and the chilling realization that something more sinister than a simple illness might be at play, struggling to voice his deep unease.',
        ap.emotional_tags = ["musa is gripped by acute anxiety", "professional alarm. outwardly, his agitation is clear in his rushed words", "desperate knocking. internally, he is likely battling a growing fear for marcellus's life", "a sense of helplessness against livia's dismissive authority. he is torn between his duty to his patient", "the chilling realization that something more sinister than a simple illness might be at play, struggling to voice his deep unease.", "musa is gripped by acute anxiety and professional alarm. outwardly", "his agitation is clear in his rushed words and desperate knocking. internally", "he is likely battling a growing fear for marcellus's life and a sense of helplessness against livia's dismissive authority. he is torn between his duty to his patient and the chilling realization that something more sinister than a simple illness might be at play", "struggling to voice his deep unease."],
        ap.active_plans = ["Immediately inform Livia of Marcellus's rapid decline.", "Urge Livia to notify Marcellus's mother and wife, believing family presence is crucial.", "Seek external validation or support for his assessment of Marcellus's critical condition, hoping to circumvent Livia's control."],
        ap.beliefs = ["Marcellus's condition has taken a dangerous turn for the worse and is now critical.", "Marcellus's family has an undeniable right to be informed and present during this crisis.", "Ethical medical practice demands transparency and the involvement of loved ones in severe health deteriorations."],
        ap.goals = ["{short_term: To convince Livia of the urgency and severity of Marcellus's failing health.}", "{medium_term: To ensure Marcellus receives appropriate and comprehensive care, potentially by involving his family and other authorities.}", "{ultimate: To uphold his Hippocratic oath and do everything in his power to protect Marcellus's life and well-being, even against powerful opposition.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Livia initially maintains a composed facade of concern, positioned within Marcellus\'s chambers as a caregiver. However, upon Musa\'s agitated entrance, she transitions to a dismissive and controlling posture, standing firm at the doorway to intercept his alarm. Her movements are deliberate and measured, contrasting sharply with Musa\'s frantic energy as she asserts her dominance over the situation.',
        ap.emotional_state = 'Livia outwardly projects an air of calm authority and calculated dismissal, minimizing Musa\'s distress as mere exaggeration. Beneath this veneer, she is likely experiencing a cold satisfaction at the confirmation of Marcellus\'s decline, aligning with her covert objectives. Her internal state is characterized by ruthless determination and chilling resolve, masking any trace of empathy or genuine concern for Marcellus. The unspoken conflict lies in her calculated manipulation versus Musa\'s genuine medical alarm, creating a palpable tension in the chamber.',
        ap.emotional_tags = ["livia outwardly projects an air of calm authority", "calculated dismissal, minimizing musa's distress as mere exaggeration. beneath this veneer, she is likely experiencing a cold satisfaction at the confirmation of marcellus's decline, aligning with her covert objectives. her internal state is characterized by ruthless determination", "chilling resolve, masking any trace of empathy or genuine concern for marcellus. the unspoken conflict lies in her calculated manipulation versus musa's genuine medical alarm, creating a palpable tension in the chamber.", "livia outwardly projects an air of calm authority and calculated dismissal", "minimizing musa's distress as mere exaggeration. beneath this veneer", "she is likely experiencing a cold satisfaction at the confirmation of marcellus's decline", "aligning with her covert objectives. her internal state is characterized by ruthless determination and chilling resolve", "masking any trace of empathy or genuine concern for marcellus. the unspoken conflict lies in her calculated manipulation versus musa's genuine medical alarm", "creating a palpable tension in the chamber."],
        ap.active_plans = ["Immediately dismiss Musa's concerns and downplay the severity of Marcellus's condition.", "Prevent any notification of Marcellus's mother and wife, maintaining her exclusive control over the narrative.", "Reinforce her image as the sole caregiver and decision-maker in Marcellus's sickroom, solidifying her manipulative grip on the situation."],
        ap.beliefs = ["Marcellus's worsening condition is a necessary and desirable step in her grand scheme.", "She is superior in judgment to Musa and capable of managing the situation without external interference.", "Involving Marcellus's family would jeopardize her carefully orchestrated plan and potentially expose her true intentions."],
        ap.goals = ["{short_term: To swiftly neutralize Musa's alarm and prevent him from escalating the situation further.}", "{medium_term: To continue isolating Marcellus and controlling the perception of his illness, ensuring no external intervention disrupts her plans.}", "{ultimate: To ensure Marcellus's demise proceeds as planned, paving the way for Tiberius's ascent and solidifying her own power and influence within the empire.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Musa stands at Marcellus\'s bedside, his brow furrowed in concern as he tends to the ailing young man. He moves with urgency, taking quick glances between Marcellus and Livia, a mix of professional urgency and personal worry evident in his demeanor. He rushes to the door when he hears the knocking, reflecting his anxiety over Marcellus\'s worsening condition.',
        ap.emotional_state = 'Musa\'s surface emotions reveal a deep concern for Marcellus\'s health, with a tone of urgency and agitation as he interacts with Livia. Internally, he grapples with the weight of his professional duty, feeling the oppressive pressure of Livia\'s looming influence and the potential consequences of his medical assessments. His internal struggle highlights his loyalty to Marcellus versus the threats posed by the court.',
        ap.emotional_tags = ["musa's surface emotions reveal a deep concern for marcellus's health, with a tone of urgency", "agitation as he interacts with livia. internally, he grapples with the weight of his professional duty, feeling the oppressive pressure of livia's looming influence", "the potential consequences of his medical assessments. his internal struggle highlights his loyalty to marcellus versus the threats posed by the court.", "musa's surface emotions reveal a deep concern for marcellus's health", "with a tone of urgency and agitation as he interacts with livia. internally", "he grapples with the weight of his professional duty", "feeling the oppressive pressure of livia's looming influence and the potential consequences of his medical assessments. his internal struggle highlights his loyalty to marcellus versus the threats posed by the court."],
        ap.active_plans = ["To treat Marcellus's symptoms and stabilize his condition.", "To communicate the seriousness of Marcellus's illness to Livia without alarming her.", "To gather the family members to ensure Marcellus receives the necessary care."],
        ap.beliefs = ["A physician's duty is to protect and heal, regardless of the political implications.", "His medical expertise can save lives, even in the face of powerful adversaries.", "Communication with family is crucial in medical care, despite the risks involved."],
        ap.goals = ["Short-term: To address and alleviate Marcellus's immediate health concerns.", "Medium-term: To ensure that Marcellus's family is aware of his critical condition.", "Ultimate: To navigate the treacherous political environment while fulfilling his role as a healer."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Livia enters the dimly lit room, projecting a facade of concern as she approaches Marcellus\'s bedside. She places a cool hand on his forehead, scrutinizing his condition while maintaining a composed exterior. Her demeanor is calculated, her eyes glinting with a mix of genuine maternal concern and underlying ambition as she assesses the implications of Marcellus\'s illness.',
        ap.emotional_state = 'Livia outwardly displays concern for Marcellus, her voice sweet and soothing, yet her internal feelings are complex and layered. Beneath her facade, she harbors ambitions tied to the potential chaos that could follow Marcellus\'s demise. The mention of \'green slime\' stirs a flicker of interest in her eyes, revealing her capacity to manipulate circumstances for her advantage, highlighting the tension between her maternal instincts and her cold ambition.',
        ap.emotional_tags = ["livia outwardly displays concern for marcellus, her voice sweet", "soothing, yet her internal feelings are complex", "layered. beneath her facade, she harbors ambitions tied to the potential chaos that could follow marcellus's demise. the mention of 'green slime' stirs a flicker of interest in her eyes, revealing her capacity to manipulate circumstances for her advantage, highlighting the tension between her maternal instincts", "her cold ambition.", "livia outwardly displays concern for marcellus", "her voice sweet and soothing", "yet her internal feelings are complex and layered. beneath her facade", "she harbors ambitions tied to the potential chaos that could follow marcellus's demise. the mention of 'green slime' stirs a flicker of interest in her eyes", "revealing her capacity to manipulate circumstances for her advantage", "highlighting the tension between her maternal instincts and her cold ambition."],
        ap.active_plans = ["To feign concern and manipulate the situation to her advantage.", "To ensure she can control Marcellus's care and influence his recovery narrative.", "To position herself favorably in the eyes of Augustus by showcasing her loyalty and care."],
        ap.beliefs = ["The appearance of concern can be a powerful tool for manipulation.", "Loyalty is a currency that can be used to gain influence and control.", "The health of Marcellus can be leveraged to secure her son's position in the empire."],
        ap.goals = ["Short-term: To maintain the appearance of a caring figure in Marcellus's life.", "Medium-term: To eliminate any threats posed by Marcellus's potential recovery or influence.", "Ultimate: To ensure Tiberius's unchallenged path to the throne, using Marcellus's fate as a stepping stone."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Livia sits poised in her study, directly facing Tiberius. She observes him with a calculated intensity, her posture suggesting control and command of the conversation. She initiates the dialogue, steering it towards Marcellus\'s health with a veneer of concern, all while subtly probing Tiberius\'s reactions and political inclinations. She is the orchestrator of this encounter, dictating the pace and direction of their exchange.',
        ap.emotional_state = 'Livia outwardly projects a composed and concerned demeanor regarding Marcellus\'s illness, yet beneath the surface, she is cold and calculating. Her tone is laced with subtle manipulation, probing Tiberius\'s ambitions while masking her own strategic agenda. There is a distinct lack of genuine emotion; her concern for Marcellus feels performative, serving a larger political purpose. Internally, she is assessing Tiberius\'s pliability and readiness to seize the opportunity presented by Marcellus\'s potential demise.',
        ap.emotional_tags = ["livia outwardly projects a composed", "concerned demeanor regarding marcellus's illness, yet beneath the surface, she is cold", "calculating. her tone is laced with subtle manipulation, probing tiberius's ambitions while masking her own strategic agenda. there is a distinct lack of genuine emotion; her concern for marcellus feels performative, serving a larger political purpose. internally, she is assessing tiberius's pliability", "readiness to seize the opportunity presented by marcellus's potential demise.", "livia outwardly projects a composed and concerned demeanor regarding marcellus's illness", "yet beneath the surface", "she is cold and calculating. her tone is laced with subtle manipulation", "probing tiberius's ambitions while masking her own strategic agenda. there is a distinct lack of genuine emotion; her concern for marcellus feels performative", "serving a larger political purpose. internally", "she is assessing tiberius's pliability and readiness to seize the opportunity presented by marcellus's potential demise.", "livia outwardly projects a composed and concerned demeanor regarding marcellus's illness, yet beneath the surface, she is cold and calculating. her tone is laced with subtle manipulation, probing tiberius's ambitions while masking her own strategic agenda. there is a distinct lack of genuine emotion", "her concern for marcellus feels performative, serving a larger political purpose. internally, she is assessing tiberius's pliability and readiness to seize the opportunity presented by marcellus's potential demise.", "livia outwardly projects a composed and concerned demeanor regarding marcellus's illness, yet beneath the surface, she is cold and calculating. her tone is laced with subtle manipulation, probing tiberius's ambitions", "masking her own strategic agenda. there is a distinct lack of genuine emotion; her concern for marcellus feels performative, serving a larger political purpose. internally, she is assessing tiberius's pliability and readiness to seize the opportunity presented by marcellus's potential demise."],
        ap.active_plans = ["Inform Tiberius of Marcellus's critical condition and gauge his reaction to this news.", "Subtly assess Tiberius's political ambitions and readiness to step into a more prominent role.", "Propose Julia as a potential strategic alliance, testing Tiberius's willingness to consider a dynastic marriage for political gain."],
        ap.beliefs = ["Political power is the ultimate goal, and strategic maneuvering is essential to achieve it.", "Marcellus's death, while regrettable, presents a significant opportunity to advance Tiberius's position and her own agenda.", "Tiberius, despite his resistance, must be guided and strategically positioned to secure the imperial succession for their lineage."],
        ap.goals = ["{short_term: Control the immediate narrative surrounding Marcellus's illness and impending death, ensuring it serves her political objectives.}", "{medium_term: Position Tiberius as the most logical and acceptable successor in the eyes of Augustus and the Roman elite, overshadowing Agrippa and any other potential rivals.}", "{ultimate: Secure the imperial throne for her son Tiberius, establishing her family's dynasty as the undisputed rulers of Rome, solidifying her own enduring power and legacy.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits opposite Livia, his posture suggesting discomfort and unease. He listens intently to his mother, his gaze wary and guarded. He responds to her questions and pronouncements with a deliberate caution, physically present in the room but emotionally distant, creating a palpable tension between them as he tries to maintain his composure in the face of her probing.',
        ap.emotional_state = 'Tiberius displays a surface of polite attentiveness towards Livia, but internally he is deeply uncomfortable and suspicious. He is wary of his mother\'s manipulative nature and her predictable political machinations. There is a palpable resistance in his tone and demeanor as he deflects her veiled suggestions regarding Julia. Beneath the surface, he feels trapped and resentful of being drawn back into the courtly intrigue he despises, longing for the comparative honesty of military life and remaining steadfast in his devotion to Vipsania as a refuge from his mother\'s schemes.',
        ap.emotional_tags = ["tiberius displays a surface of polite attentiveness towards livia, but internally he is deeply uncomfortable", "suspicious. he is wary of his mother's manipulative nature", "her predictable political machinations. there is a palpable resistance in his tone", "demeanor as he deflects her veiled suggestions regarding julia. beneath the surface, he feels trapped", "resentful of being drawn back into the courtly intrigue he despises, longing for the comparative honesty of military life", "remaining steadfast in his devotion to vipsania as a refuge from his mother's schemes.", "tiberius displays a surface of polite attentiveness towards livia", "but internally he is deeply uncomfortable and suspicious. he is wary of his mother's manipulative nature and her predictable political machinations. there is a palpable resistance in his tone and demeanor as he deflects her veiled suggestions regarding julia. beneath the surface", "he feels trapped and resentful of being drawn back into the courtly intrigue he despises", "longing for the comparative honesty of military life and remaining steadfast in his devotion to vipsania as a refuge from his mother's schemes.", "tiberius displays a surface of polite attentiveness towards livia,", "internally he is deeply uncomfortable and suspicious. he is wary of his mother's manipulative nature and her predictable political machinations. there is a palpable resistance in his tone and demeanor as he deflects her veiled suggestions regarding julia. beneath the surface, he feels trapped and resentful of being drawn back into the courtly intrigue he despises, longing for the comparative honesty of military life and remaining steadfast in his devotion to vipsania as a refuge from his mother's schemes."],
        ap.active_plans = ["Determine the true reason for Livia summoning him back from the Rhine and understand her underlying agenda.", "Resist being drawn into Livia's political games and maintain his distance from her manipulative schemes.", "Clearly and unequivocally assert his loyalty to Vipsania, shutting down any suggestion of a political marriage or romantic entanglement with Julia."],
        ap.beliefs = ["His personal happiness and genuine love for Vipsania are more valuable than political alliances or dynastic ambitions.", "Livia's methods are manipulative and distasteful, and he is determined to avoid becoming a pawn in her power games.", "The straightforwardness and honor found in military life are preferable to the deceit and treachery of the Roman court."],
        ap.goals = ["{short_term: Deflect Livia's attempts to involve him in any political maneuvering, especially concerning Julia and the succession.}", "{medium_term: Maintain his marriage to Vipsania and preserve their relationship from the corrosive influence of court politics and Livia's ambitions.}", "{ultimate: Find a measure of personal autonomy and respect, whether within the military or outside the immediate orbit of the imperial court, seeking a life defined by his own values rather than being dictated by Livia's relentless ambition and potentially earning genuine paternal regard from Augustus.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Julia, in a state of heightened emotional distress, sits offstage, her voice breaking through the tension with a piercing scream that echoes throughout Livia\'s study. Her cry signals the tragic news of Marcellus\'s death, reflecting her raw grief and desperation.',
        ap.emotional_state = 'Julia is engulfed in a tumult of despair and shock. Outwardly, her scream conveys the intensity of her sorrow and helplessness at losing Marcellus. Internally, she wrestles with feelings of betrayal and the weight of her role in the political machinations surrounding their lives, feeling trapped in a web of familial duty and personal loss.',
        ap.emotional_tags = ["julia is engulfed in a tumult of despair", "shock. outwardly, her scream conveys the intensity of her sorrow", "helplessness at losing marcellus. internally, she wrestles with feelings of betrayal", "the weight of her role in the political machinations surrounding their lives, feeling trapped in a web of familial duty", "personal loss.", "julia is engulfed in a tumult of despair and shock. outwardly", "her scream conveys the intensity of her sorrow and helplessness at losing marcellus. internally", "she wrestles with feelings of betrayal and the weight of her role in the political machinations surrounding their lives", "feeling trapped in a web of familial duty and personal loss."],
        ap.active_plans = ["To express her grief and anguish over Marcellus's death.", "To seek comfort and support from her family during this traumatic moment.", "To navigate the fallout of his death within the treacherous political landscape of the imperial court."],
        ap.beliefs = ["Family loyalty is paramount, even amidst betrayal.", "The emotional responses to loss are valid and should be expressed.", "The struggles of women in the imperial family are often overlooked."],
        ap.goals = ["Short-term: To mourn and honor Marcellus's memory.", "Medium-term: To ensure her voice and feelings are heard amidst the political turmoil.", "Ultimate: To find a way to assert her agency in the patriarchal structures of Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Livia, seated with a calm demeanor, listens intently as Julia\'s screams erupt from offstage. She quickly shifts her focus from the personal agony of the moment to the political implications of Marcellus\'s death, maintaining a facade of control in a chaotic situation.',
        ap.emotional_state = 'Livia\'s outward composure masks a calculating mind. She feels a rush of fierce determination, recognizing the opportunity that Marcellus\'s death presents. Internally, she grapples with the delicate balance between her ambition for Tiberius and her need to manage the emotional fallout that could destabilize her plans.',
        ap.emotional_tags = ["livia's outward composure masks a calculating mind. she feels a rush of fierce determination, recognizing the opportunity that marcellus's death presents. internally, she grapples with the delicate balance between her ambition for tiberius", "her need to manage the emotional fallout that could destabilize her plans.", "livia's outward composure masks a calculating mind. she feels a rush of fierce determination", "recognizing the opportunity that marcellus's death presents. internally", "she grapples with the delicate balance between her ambition for tiberius and her need to manage the emotional fallout that could destabilize her plans."],
        ap.active_plans = ["To maintain control over the situation and ensure that Tiberius manages Julia's emotional outburst.", "To quickly inform Augustus about Marcellus's death to manage the narrative.", "To position herself strategically in the wake of Marcellus's demise, leveraging the chaos to further her ambitions."],
        ap.beliefs = ["Power must be maintained through control and manipulation of emotions.", "Loyalty is a tool to be wielded, not a bond of trust.", "The death of Marcellus could be turned to her advantage in the complex dynamics of succession."],
        ap.goals = ["Short-term: To manage Julia's reaction and prevent any public displays of chaos.", "Medium-term: To ensure Tiberius is positioned favorably in the aftermath of Marcellus's death.", "Ultimate: To secure her family's dynasty and elevate Tiberius to a position of power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits across from Livia, visibly uncomfortable as he navigates the tense conversation. When Julia\'s scream pierces the air, he reacts in shock, momentarily losing his composure as he contemplates the implications of Marcellus\'s death.',
        ap.emotional_state = 'Tiberius experiences a mix of dread and urgency. His external demeanor is one of shock and concern, particularly for Julia. Internally, he feels a rising anxiety about his precarious position within the imperial family and the looming power vacuum that Marcellus\'s death creates.',
        ap.emotional_tags = ["tiberius experiences a mix of dread", "urgency. his external demeanor is one of shock", "concern, particularly for julia. internally, he feels a rising anxiety about his precarious position within the imperial family", "the looming power vacuum that marcellus's death creates.", "tiberius experiences a mix of dread and urgency. his external demeanor is one of shock and concern", "particularly for julia. internally", "he feels a rising anxiety about his precarious position within the imperial family and the looming power vacuum that marcellus's death creates."],
        ap.active_plans = ["To assess the situation and respond to Julia's emotional state.", "To support Livia in managing the political fallout of Marcellus's death.", "To protect Vipsania and maintain his marriage amidst the chaos."],
        ap.beliefs = ["Family loyalty is important, but personal happiness must also be preserved.", "The political machinations of the court are fraught with danger.", "Ambition must be tempered with caution, especially in times of upheaval."],
        ap.goals = ["Short-term: To ensure Julia is taken care of and that she does not spiral further into despair.", "Medium-term: To navigate the political landscape following Marcellus's death and solidify his position.", "Ultimate: To secure a legacy that honors both his family and his own desires, without compromising his marriage."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_corpse_event_14_1'})
    ON CREATE SET
        oi.description = 'The corpse of Marcellus dominates the scene, lying still and lifeless upon the bed. It serves as the grim focal point of the chamber, the undeniable evidence of death that prompts Musa\'s despair and initiates the subsequent dialogue about the cause of death. Octavia sits beside it, mourning, and Livia confirms its status, highlighting the corpse as the central object around which the immediate drama revolves. It is the silent catalyst that triggers emotional responses and sets the stage for political maneuvering.',
        oi.status_before = 'The corpse did not exist prior to the event; Marcellus was alive but gravely ill in the moments immediately preceding his death, occupying the bed as a living, suffering patient.',
        oi.status_after = 'The object now exists as a corpse, the physical remains of Marcellus. Its status has fundamentally shifted from a living person to a deceased body, becoming a symbol of loss, mortality, and a key element in the unfolding political intrigue surrounding his death. The corpse remains on the bed, a silent testament to the tragedy and a potent symbol within the scene.'
    WITH oi
    MATCH (o:Object {uuid: 'object_corpse'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bed_event_14_1'})
    ON CREATE SET
        oi.description = 'The bed functions as Marcellus\'s deathbed, the immediate setting where his life concludes. The corpse lies upon it, making the bed the central piece of furniture and the focal point of the immediate grief and discussion. Musa stands beside it, indicating his proximity to the deceased and his role as the attending physician who was unable to prevent the death occurring on this very bed. It is not merely furniture but a symbolic stage for the tragic event.',
        oi.status_before = 'Before the event, the bed was Marcellus\'s sickbed, a place of illness and medical treatment, representing his vulnerability and confinement due to sickness. It was a site of hope for recovery, however frail.',
        oi.status_after = 'Following the event, the bed transforms into a deathbed, indelibly marked by Marcellus\'s demise. It now represents finality, loss, and the stark reality of death. The bed becomes a somber fixture in the room, a silent witness to the unfolding drama and a symbol of the tragic end of Marcellus\'s life.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bed'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_corpse_event_14_2'})
    ON CREATE SET
        oi.description = 'The corpse of Marcellus, lying lifeless on the bed, serves as a grim focal point for the scene. It underscores the tragic consequences of political ambition and the personal toll it takes on those involved. Livia\'s questioning about his death manipulates the narrative around this lifeless body, using it to further her own agendas while appearing sympathetic.',
        oi.status_before = 'Prior to the event, the corpse of Marcellus is a stark reminder of his sudden death, lying undisturbed in his chambers as witnesses grapple with the implications of his demise.',
        oi.status_after = 'After the event, the corpse remains in the chamber, a chilling testament to the chaos unleashed by his death and the burgeoning intrigues that will follow, forever altering the power dynamics within the imperial family.'
    WITH oi
    MATCH (o:Object {uuid: 'object_corpse'})
    MATCH (e:Event {uuid: 'event_14_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Musa is positioned beside Marcellus\'s bed, his posture conveying deep distress as he wrings his hands. He is actively verbalizing his despair and professional helplessness, attempting to explain his perceived failure to save Marcellus despite his efforts. His words are a mix of lament and justification, seeking to articulate the limits of his medical abilities in the face of death.',
        ap.emotional_state = 'Musa is overwhelmed by a potent blend of despair, guilt, and anxiety. Outwardly, his distress manifests through frantic hand-wringing and repeated pronouncements of his efforts. Internally, he grapples with a profound sense of failure, questioning his competence and fearing potential repercussions for not saving Marcellus. Beneath the surface, there\'s a subtle tension – a hint of unease as he proposes \'food poisoning\' as the cause of death, possibly sensing a darker undercurrent he dare not fully acknowledge in Livia\'s presence.',
        ap.emotional_tags = ["musa is overwhelmed by a potent blend of despair, guilt,", "anxiety. outwardly, his distress manifests through frantic hand-wringing", "repeated pronouncements of his efforts. internally, he grapples with a profound sense of failure, questioning his competence", "fearing potential repercussions for not saving marcellus. beneath the surface, there's a subtle tension \u2013 a hint of unease as he proposes 'food poisoning' as the cause of death, possibly sensing a darker undercurrent he dare not fully acknowledge in livia's presence.", "musa is overwhelmed by a potent blend of despair", "guilt", "and anxiety. outwardly", "his distress manifests through frantic hand-wringing and repeated pronouncements of his efforts. internally", "he grapples with a profound sense of failure", "questioning his competence and fearing potential repercussions for not saving marcellus. beneath the surface", "there's a subtle tension \u2013 a hint of unease as he proposes 'food poisoning' as the cause of death", "possibly sensing a darker undercurrent he dare not fully acknowledge in livia's presence."],
        ap.active_plans = ["Express his profound regret and professional failure to Octavia and Livia, seeking some form of acknowledgment for his efforts.", "Propose 'food poisoning' as a plausible, if somewhat uncertain, cause of death to provide a simple explanation and potentially deflect further scrutiny.", "Initially suggest an inquest, perhaps as a professional reflex to ascertain the true cause of death, but quickly retract this suggestion when faced with Livia's dismissive reaction."],
        ap.beliefs = ["Believes in the efficacy of his medical training and the power of his skills, as indicated by his insistence on 'doing everything he could'.", "Believes in professional accountability and the importance of understanding the cause of death, initially suggesting an inquest.", "Believes in deferring to higher authority, quickly accepting Livia's 'food poisoning' diagnosis and dismissing the need for an inquest, showcasing his understanding of the power dynamics at play."],
        ap.goals = ["Short-term Goal: To voice his distress and professional efforts, seeking to alleviate his immediate feelings of failure and guilt.", "Medium-term Goal: To offer a medically plausible explanation (food poisoning) for Marcellus's death to avoid personal blame and potential negative consequences from Augustus or Livia.", "Ultimate Goal: To maintain his position and reputation as a competent physician within Augustus's household, ensuring his continued employment and standing in the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands in the dimly lit chamber, her posture deceptively composed, hands clasped in front of her, as she feigns concern for Marcellus\'s demise. Her voice is steady, even soothing, as she converses with Musa and Octavia, subtly probing for details about the cause of death, her eyes glinting with the cold calculation behind her facade.',
        ap.emotional_state = 'Livia’s surface emotions reflect a calculated sympathy, her tone laced with a feigned sorrow for Augustus\'s loss. Internally, however, she is elated by the death that removes a rival and may serve her ambitions. There is a tension between her outward demeanor and her internal motivations, as she skillfully navigates the grief to maintain her power.',
        ap.emotional_tags = ["livia\u2019s surface emotions reflect a calculated sympathy, her tone laced with a feigned sorrow for augustus's loss. internally, however, she is elated by the death that removes a rival", "may serve her ambitions. there is a tension between her outward demeanor", "her internal motivations, as she skillfully navigates the grief to maintain her power.", "livia\u2019s surface emotions reflect a calculated sympathy", "her tone laced with a feigned sorrow for augustus's loss. internally", "however", "she is elated by the death that removes a rival and may serve her ambitions. there is a tension between her outward demeanor and her internal motivations", "as she skillfully navigates the grief to maintain her power."],
        ap.active_plans = ["To manipulate the narrative surrounding Marcellus\u2019s death and ensure the focus remains away from her own possible involvement.", "To maintain her facade of concern for Augustus while ensuring that any inquest into Marcellus's death is swiftly dismissed.", "To position herself as a source of support for Augustus, reinforcing her influence in the court during this period of turmoil."],
        ap.beliefs = ["The ends justify the means, and the political game requires strategic manipulation.", "Loyalty is a fluid concept, and familial bonds can be sacrificed for greater ambition.", "Power is maintained through control of narratives, especially in times of tragedy."],
        ap.goals = ["Short-term: To deflect suspicion away from herself regarding Marcellus's death.", "Medium-term: To strengthen her position as a trusted advisor to Augustus during his time of grief.", "Ultimate: To secure the throne for her son Tiberius and eliminate threats to their dynasty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Musa stands at the bedside of the deceased Marcellus, visibly agitated and wringing his hands in distress. He is speaking to Livia and Octavia, attempting to articulate his professional efforts and perceived failure to save Marcellus. His posture is one of defeat and defensiveness, marked by repetitive phrases and an attempt to justify his actions and diagnosis.',
        ap.emotional_state = 'Musa is in a state of shock and professional distress, grappling with the sudden death of Marcellus under his care. Outwardly, he expresses guilt and confusion, repeatedly stating he \'did everything he could,\' suggesting a need for reassurance or to deflect blame. Internally, he is likely battling feelings of inadequacy and fear, caught between his medical assessment and the politically charged atmosphere, sensing the shift in power dynamics with Marcellus\'s demise.',
        ap.emotional_tags = ["musa is in a state of shock", "professional distress, grappling with the sudden death of marcellus under his care. outwardly, he expresses guilt", "confusion, repeatedly stating he 'did everything he could,' suggesting a need for reassurance or to deflect blame. internally, he is likely battling feelings of inadequacy", "fear, caught between his medical assessment", "the politically charged atmosphere, sensing the shift in power dynamics with marcellus's demise.", "musa is in a state of shock and professional distress", "grappling with the sudden death of marcellus under his care. outwardly", "he expresses guilt and confusion", "repeatedly stating he 'did everything he could", "' suggesting a need for reassurance or to deflect blame. internally", "he is likely battling feelings of inadequacy and fear", "caught between his medical assessment and the politically charged atmosphere", "sensing the shift in power dynamics with marcellus's demise."],
        ap.active_plans = ["To verbally assure those present, especially Livia, that he provided the best possible care for Marcellus.", "To propose 'food poisoning' as a natural and less politically sensitive explanation for the death.", "To initially suggest an inquest as a standard procedure, though quickly retracting the idea under Livia's implied disapproval."],
        ap.beliefs = ["He believes in the efficacy of his medical training and the treatments he administered.", "He believes in natural causes of illness, such as food poisoning, especially in hot weather, as a rational explanation for sudden death.", "He believes in established medical procedures, like inquests, to ascertain causes of death in unclear circumstances."],
        ap.goals = ["Short-term Goal: Articulate a plausible cause of death (food poisoning) to explain Marcellus's demise and alleviate immediate pressure.", "Medium-term Goal: Avoid professional blame or repercussions for Marcellus's death by attributing it to uncontrollable external factors.", "Ultimate Goal: Maintain his position and reputation as a competent physician within Augustus's household, navigating the dangerous political implications of his patient's death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Livia stands with a façade of concern, observing the scene with a carefully crafted expression that masks her true intentions. She moves with deliberate grace, her posture composed and confident, as she engages with Musa and Octavia, asserting her control over the unfolding narrative.',
        ap.emotional_state = 'On the surface, Livia displays concern and innocence regarding Marcellus’s death, her tone smooth and measured. Internally, however, she is calculating and unyielding, aware that this moment presents an opportunity to manipulate the narrative to conceal her involvement. The juxtaposition of her feigned grief with her underlying ruthlessness creates a complex emotional landscape.',
        ap.emotional_tags = ["on the surface, livia displays concern", "innocence regarding marcellus\u2019s death, her tone smooth", "measured. internally, however, she is calculating", "unyielding, aware that this moment presents an opportunity to manipulate the narrative to conceal her involvement. the juxtaposition of her feigned grief with her underlying ruthlessness creates a complex emotional landscape.", "on the surface", "livia displays concern and innocence regarding marcellus\u2019s death", "her tone smooth and measured. internally", "however", "she is calculating and unyielding", "aware that this moment presents an opportunity to manipulate the narrative to conceal her involvement. the juxtaposition of her feigned grief with her underlying ruthlessness creates a complex emotional landscape."],
        ap.active_plans = ["To suppress any inquiry into Marcellus's death and control the narrative surrounding it.", "To maintain the appearance of innocence and concern to evade suspicion.", "To protect her ambitions for Tiberius's future by eliminating potential threats posed by Marcellus\u2019s death."],
        ap.beliefs = ["Power must be secured through manipulation and control of information.", "Emotions are tools to be wielded strategically in the pursuit of ambition.", "Loyalty is secondary to the greater goal of ensuring her son\u2019s ascension to power."],
        ap.goals = ["Short-term: To convince others that Marcellus's death was due to food poisoning and prevent any inquiry.", "Medium-term: To solidify her control over the narrative of succession in the wake of Marcellus\u2019s death.", "Ultimate: To ensure Tiberius inherits the empire and eliminate any rivals who threaten her family's ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Musa stands beside Marcellus\'s deathbed, his hands twisting together in a display of distress. He speaks in hushed, regretful tones, addressing Livia and Octavia, attempting to explain his perceived failure to save Marcellus and the potential cause of death.',
        ap.emotional_state = 'Musa is visibly distraught, his surface emotions dominated by guilt and professional failure, evident in his repeated phrase \'I did everything I could.\' Internally, he is wrestling with uncertainty and ethical conflict. He is unsure about the \'food poisoning\' diagnosis, revealing a deeper professional doubt and a growing unease under Livia\'s intense gaze, sensing the manipulative undercurrents of the court.',
        ap.emotional_tags = ["musa is visibly distraught, his surface emotions dominated by guilt", "professional failure, evident in his repeated phrase 'i did everything i could.' internally, he is wrestling with uncertainty", "ethical conflict. he is unsure about the 'food poisoning' diagnosis, revealing a deeper professional doubt", "a growing unease under livia's intense gaze, sensing the manipulative undercurrents of the court.", "musa is visibly distraught", "his surface emotions dominated by guilt and professional failure", "evident in his repeated phrase 'i did everything i could.' internally", "he is wrestling with uncertainty and ethical conflict. he is unsure about the 'food poisoning' diagnosis", "revealing a deeper professional doubt and a growing unease under livia's intense gaze", "sensing the manipulative undercurrents of the court."],
        ap.active_plans = ["Articulate his professional assessment of Marcellus's death.", "Defend his medical actions and emphasize his efforts to save Marcellus.", "Suggest the need for a formal inquest to establish the definite cause of death, adhering to standard procedures."],
        ap.beliefs = ["In the efficacy of his medical training and the limits of his abilities in the face of death.", "In the importance of proper procedure and thorough investigation, especially in cases of sudden death.", "In professional honesty and the ethical obligation to express his doubts when certainty is lacking."],
        ap.goals = ["Short-term: To voice his uncertainty regarding 'food poisoning' as the definitive cause of death.", "Medium-term: To advocate for a formal inquest to ensure a transparent and thorough examination of the circumstances surrounding Marcellus's death.", "Ultimate: To uphold his professional integrity and contribute to uncovering the truth, even in a politically charged environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Livia enters Marcellus\'s chambers, her presence immediately commanding attention. She questions Musa with sharp, probing words, ensuring Marcellus is truly dead. She then swiftly steers the conversation towards \'food poisoning\' as the accepted cause, actively shutting down any suggestion of further investigation.',
        ap.emotional_state = 'Livia outwardly projects an air of controlled concern, expressing feigned sympathy for Augustus, \'Poor Augustus. His heart will break.\' However, beneath this veneer, her true emotions are cold calculation and strategic focus. She is relieved by Marcellus\'s death and immediately moves to control the narrative, suppressing any doubt or possibility of an inquest.  There is a stark contrast between her performative grief and her ruthless, decisive internal state.',
        ap.emotional_tags = ["livia outwardly projects an air of controlled concern, expressing feigned sympathy for augustus, 'poor augustus. his heart will break.' however, beneath this veneer, her true emotions are cold calculation", "strategic focus. she is relieved by marcellus's death", "immediately moves to control the narrative, suppressing any doubt or possibility of an inquest.  there is a stark contrast between her performative grief", "her ruthless, decisive internal state.", "livia outwardly projects an air of controlled concern", "expressing feigned sympathy for augustus", "'poor augustus. his heart will break.' however", "beneath this veneer", "her true emotions are cold calculation and strategic focus. she is relieved by marcellus's death and immediately moves to control the narrative", "suppressing any doubt or possibility of an inquest.  there is a stark contrast between her performative grief and her ruthless", "decisive internal state."],
        ap.active_plans = ["Confirm definitively that Marcellus is dead, ensuring there is no ambiguity.", "Establish 'food poisoning' as the officially accepted cause of death, leveraging Musa's initial suggestion.", "Prevent any inquest or further investigation into Marcellus's demise to avoid scrutiny.", "Control the narrative surrounding Marcellus's death to preempt any suspicion or rumors of foul play, particularly directed towards her."],
        ap.beliefs = ["In the paramount importance of controlling information and public perception to maintain power.", "In the necessity of eliminating obstacles to her ambitions, and Marcellus's death serves this purpose.", "In the effectiveness of decisive action and narrative manipulation to shape events and outcomes in her favor."],
        ap.goals = ["Short-term: To immediately dismiss the need for an inquest and solidify 'food poisoning' as the explanation.", "Medium-term: To ensure the 'food poisoning' narrative is widely accepted, preventing any further scrutiny or suspicion, thus protecting her and advancing Tiberius's position.", "Ultimate: To secure Tiberius's path to the throne by eliminating rivals and controlling the flow of information, ensuring her family's dynasty and her own enduring influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Livia stands rigidly before Tiberius in her private chambers, her posture erect and unwavering despite the distant sounds of rioting reaching them. She addresses Tiberius with a sharp, commanding tone, her physical presence dominating the space and emphasizing her absolute control in this moment of unfolding chaos. Her gestures are minimal yet purposeful, each movement designed to underscore the gravity and urgency of her instructions.',
        ap.emotional_state = 'On the surface, Livia projects an image of unwavering composure and authority, her voice firm and devoid of any outward sign of distress. However, beneath this facade of imperial strength, a cold calculation drives her actions. She is acutely aware of the chaos erupting in Rome and sees Marcellus\'s death as an opportunity to solidify her position and manipulate the narrative to her advantage. There is a subtle undercurrent of triumph mixed with carefully modulated grief, her internal state a complex blend of ambition and strategic maneuvering.',
        ap.emotional_tags = ["on the surface, livia projects an image of unwavering composure", "authority, her voice firm", "devoid of any outward sign of distress. however, beneath this facade of imperial strength, a cold calculation drives her actions. she is acutely aware of the chaos erupting in rome", "sees marcellus's death as an opportunity to solidify her position", "manipulate the narrative to her advantage. there is a subtle undercurrent of triumph mixed with carefully modulated grief, her internal state a complex blend of ambition", "strategic maneuvering.", "on the surface", "livia projects an image of unwavering composure and authority", "her voice firm and devoid of any outward sign of distress. however", "beneath this facade of imperial strength", "a cold calculation drives her actions. she is acutely aware of the chaos erupting in rome and sees marcellus's death as an opportunity to solidify her position and manipulate the narrative to her advantage. there is a subtle undercurrent of triumph mixed with carefully modulated grief", "her internal state a complex blend of ambition and strategic maneuvering."],
        ap.active_plans = ["To immediately control Tiberius's actions, ensuring he follows her directives without question.", "To manage the immediate fallout of Marcellus's death within the family, specifically controlling Julia's emotional response and public perception.", "To maintain an outward appearance of imperial control and stability, despite the growing unrest in Rome, reinforcing her image as a leader capable of handling crisis."],
        ap.beliefs = ["Unwavering belief in the necessity of control and order, especially during times of crisis.", "Deep conviction that Tiberius is the rightful heir and that she must pave the way for his ascension, no matter the cost.", "Firm belief in her own strategic brilliance and ability to manipulate events and people to achieve her desired outcomes."],
        ap.goals = ["Short-term Goal: Ensure Tiberius immediately comforts Julia and remains with her, controlling both their actions and appearances.", "Medium-term Goal: Shape the narrative around Marcellus's death to deflect suspicion and quell unrest, using the 'food poisoning' explanation to maintain order.", "Ultimate Goal: Secure Tiberius's path to the imperial throne by strategically managing this crisis and further consolidating her own power and influence within the Roman court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands before Livia, his posture reflecting his internal conflict. He is physically present in the chamber, listening to his mother\'s sharp commands, but his stance is not fully assertive, indicating his struggle with her directive. His gaze is likely averted or downcast, avoiding direct eye contact with Livia, and his movements are hesitant, revealing his apprehension and inner turmoil as he receives her orders.',
        ap.emotional_state = 'Tiberius is visibly conflicted and emotionally torn. On the surface, he displays a dutiful demeanor, nodding and listening to Livia\'s instructions, yet his internal state is fraught with unease. He likely feels a mixture of fear and resentment towards his mother\'s controlling nature, coupled with apprehension about the growing riot outside and the uncomfortable task of comforting Julia. There\'s an unspoken conflict within him, a tension between his ingrained obedience to Livia and a possible sense of moral discomfort or personal reluctance to participate in her manipulations.',
        ap.emotional_tags = ["tiberius is visibly conflicted", "emotionally torn. on the surface, he displays a dutiful demeanor, nodding", "listening to livia's instructions, yet his internal state is fraught with unease. he likely feels a mixture of fear", "resentment towards his mother's controlling nature, coupled with apprehension about the growing riot outside", "the uncomfortable task of comforting julia. there's an unspoken conflict within him, a tension between his ingrained obedience to livia", "a possible sense of moral discomfort or personal reluctance to participate in her manipulations.", "tiberius is visibly conflicted and emotionally torn. on the surface", "he displays a dutiful demeanor", "nodding and listening to livia's instructions", "yet his internal state is fraught with unease. he likely feels a mixture of fear and resentment towards his mother's controlling nature", "coupled with apprehension about the growing riot outside and the uncomfortable task of comforting julia. there's an unspoken conflict within him", "a tension between his ingrained obedience to livia and a possible sense of moral discomfort or personal reluctance to participate in her manipulations."],
        ap.active_plans = ["To passively receive and acknowledge Livia's orders, showing outward compliance to avoid her displeasure.", "To process and understand the implications of Livia's command, particularly regarding Julia and the context of Marcellus's death and the riot.", "To prepare himself mentally to carry out the uncomfortable task of comforting Julia, despite his potential personal feelings or reservations."],
        ap.beliefs = ["Belief in the necessity of obeying Livia's commands, ingrained from years of her dominant influence.", "Conviction that duty to family and imperial expectations outweighs personal desires or discomfort.", "A growing belief that the situation in Rome is precarious and dangerous, requiring careful navigation and obedience to authority (represented by Livia)."],
        ap.goals = ["Short-term Goal: Follow Livia's immediate instructions to comfort Julia and remain with her, fulfilling his mother's direct command.", "Medium-term Goal: Navigate the immediate chaos and familial tensions without incurring Livia's wrath, maintaining a semblance of dutiful son and imperial figure.", "Ultimate Goal: Unclear in this moment, but potentially to survive the unfolding crisis and find a way to assert some agency within the oppressive dynamic of his relationship with Livia, though this is overshadowed by immediate obedience."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Julia is not physically present in Livia\'s chambers, but she is the subject of Livia\'s command to Tiberius. Her location is implied to be in her own room, and her state is inferred to be one of distress following the news of Marcellus\'s death. She is positioned as a passive recipient in this event, someone to be acted upon and \'comforted\' according to Livia\'s strategic plan.',
        ap.emotional_state = 'While Julia\'s emotions are not explicitly detailed in this scene, it can be inferred that she is experiencing a complex mix of feelings upon hearing of Marcellus\'s death. On the surface, she would likely be expected to display grief and sorrow for her deceased husband. However, internally, Julia\'s cynicism and sharp intellect suggest a more layered response. She is likely aware of the political machinations surrounding Marcellus\'s death and might harbor a sense of detachment or even suspicion. Unspoken conflicts include her resentment of being a dynastic pawn and her awareness of the superficiality of courtly emotions.',
        ap.emotional_tags = ["while julia's emotions are not explicitly detailed in this scene, it can be inferred that she is experiencing a complex mix of feelings upon hearing of marcellus's death. on the surface, she would likely be expected to display grief", "sorrow for her deceased husband. however, internally, julia's cynicism", "sharp intellect suggest a more layered response. she is likely aware of the political machinations surrounding marcellus's death", "might harbor a sense of detachment or even suspicion. unspoken conflicts include her resentment of being a dynastic pawn", "her awareness of the superficiality of courtly emotions.", "while julia's emotions are not explicitly detailed in this scene", "it can be inferred that she is experiencing a complex mix of feelings upon hearing of marcellus's death. on the surface", "she would likely be expected to display grief and sorrow for her deceased husband. however", "internally", "julia's cynicism and sharp intellect suggest a more layered response. she is likely aware of the political machinations surrounding marcellus's death and might harbor a sense of detachment or even suspicion. unspoken conflicts include her resentment of being a dynastic pawn and her awareness of the superficiality of courtly emotions."],
        ap.active_plans = ["To react to the news of Marcellus's death, potentially with outward displays of grief as expected of her role.", "To passively receive Tiberius's 'comfort,' understanding that this is a politically motivated act rather than genuine solace.", "To observe and assess the unfolding situation, discerning the true motives and power dynamics at play within the imperial family in the wake of Marcellus's demise."],
        ap.beliefs = ["Belief that her personal emotions and well-being are secondary to the political needs of the imperial family.", "Conviction that she is a pawn in dynastic games, her role defined by political expediency rather than genuine affection or agency.", "Deep-seated cynicism about the sincerity and authenticity of emotions displayed within the Roman court, recognizing the pervasive manipulation and deceit."],
        ap.goals = ["Short-term Goal: Navigate the immediate aftermath of Marcellus's death and the forced 'comfort' from Tiberius while maintaining a semblance of composure.", "Medium-term Goal: Understand the political implications of Marcellus's death for her own position and future within the imperial family, assessing the shifting power dynamics.", "Ultimate Goal: To potentially find a way to exert some agency or influence within her constrained role, or at least to survive the treacherous currents of court life with her sharp intellect and spirit intact."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Livia stands composed, her posture confident yet poised, expertly framing the revelation of Marcellus\'s death as a tragic misfortune. Her gestures are controlled, with an unwavering gaze that commands attention and subservience. She orchestrates the room\'s atmosphere with chilling calm, manipulating Tiberius\'s emotions as she delivers the news.',
        ap.emotional_state = 'Livia\'s surface emotion is one of tragic concern, yet beneath lies a cold calculation, revealing her emotional detachment from the gravity of Marcellus\'s death. She exhibits a chilling calmness that masks her true intentions, displaying no grief but rather a strategic delight in the power shift this event brings. This duality emphasizes her ruthless ambition.',
        ap.emotional_tags = ["livia's surface emotion is one of tragic concern", "yet beneath lies a cold calculation", "revealing her emotional detachment from the gravity of marcellus's death. she exhibits a chilling calmness that masks her true intentions", "displaying no grief but rather a strategic delight in the power shift this event brings. this duality emphasizes her ruthless ambition.", "livia's surface emotion is one of tragic concern, yet beneath lies a cold calculation, revealing her emotional detachment from the gravity of marcellus's death. she exhibits a chilling calmness that masks her true intentions, displaying no grief", "rather a strategic delight in the power shift this event brings. this duality emphasizes her ruthless ambition."],
        ap.active_plans = ["To manipulate Tiberius into taking immediate action regarding Julia, reinforcing her control over both.", "To carefully frame Marcellus's death to divert suspicion from any foul play and maintain her narrative dominance.", "To consolidate her influence over Augustus by shaping how he perceives the tragedy, ensuring it serves her strategic interests."],
        ap.beliefs = ["Power must be seized and maintained through manipulation and strategic deception.", "Emotional vulnerability can be exploited to control others, especially family.", "The ends justify the means when it comes to securing her family's dynasty."],
        ap.goals = ["Short-term: To ensure Tiberius comforts Julia, binding them closer in their shared grief.", "Medium-term: To eliminate any rivals who threaten her son\u2019s claim to power, starting with the narrative surrounding Marcellus's death.", "Ultimate: To secure Tiberius\u2019s ascendance as Emperor while maintaining her own influence over Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands before Livia, his posture reflecting internal conflict as he grapples with duty and fear. He shifts uncomfortably, betraying his tension as he contemplates Livia\'s command to comfort Julia. His eyes dart toward the sound of the riot, suggesting his concern for the chaos outside.',
        ap.emotional_state = 'Tiberius exhibits surface apprehension and confusion, torn between his mother\'s demands and his own apprehensions about the chaos outside. Internally, he feels a deep-seated fear of Livia\'s ambitions and the expectations placed upon him. This tension highlights his struggle between familial loyalty and his own aspirations.',
        ap.emotional_tags = ["tiberius exhibits surface apprehension", "confusion, torn between his mother's demands", "his own apprehensions about the chaos outside. internally, he feels a deep-seated fear of livia's ambitions", "the expectations placed upon him. this tension highlights his struggle between familial loyalty", "his own aspirations.", "tiberius exhibits surface apprehension and confusion", "torn between his mother's demands and his own apprehensions about the chaos outside. internally", "he feels a deep-seated fear of livia's ambitions and the expectations placed upon him. this tension highlights his struggle between familial loyalty and his own aspirations."],
        ap.active_plans = ["To comply with Livia's directive and offer comfort to Julia, reinforcing family bonds.", "To navigate the chaotic situation outside while keeping Livia's trust intact.", "To assess the shifting power dynamics in the court, understanding the implications of Marcellus\u2019s death."],
        ap.beliefs = ["Loyalty to his mother is paramount, but it often conflicts with his desire for independence.", "The chaos in Rome reflects the fragility of their power, which must be navigated carefully.", "The court is a dangerous place where even family can turn into rivals."],
        ap.goals = ["Short-term: To maintain peace with his mother while fulfilling his duty to Julia.", "Medium-term: To gain recognition and power within the imperial court, balancing Livia's ambitions with his own.", "Ultimate: To establish his position as a respected leader without being overshadowed by Livia\u2019s manipulations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Although Augustus is not present in this scene, Livia\'s mention of him implies his looming presence over the event. The knowledge of his reaction to Marcellus\'s death hangs in the air, influencing the dynamics between Livia and Tiberius as they discuss the tragedy.',
        ap.emotional_state = 'Augustus\'s emotional state can be inferred as anxious and vulnerable, facing the consequences of Marcellus\'s unexpected death. It suggests a mixture of paternal concern for his adopted son and deep-seated fears regarding the stability of his legacy and the succession.',
        ap.emotional_tags = ["augustus's emotional state can be inferred as anxious", "vulnerable, facing the consequences of marcellus's unexpected death. it suggests a mixture of paternal concern for his adopted son", "deep-seated fears regarding the stability of his legacy", "the succession.", "augustus's emotional state can be inferred as anxious and vulnerable", "facing the consequences of marcellus's unexpected death. it suggests a mixture of paternal concern for his adopted son and deep-seated fears regarding the stability of his legacy and the succession."],
        ap.active_plans = ["To react to the news of Marcellus's death with the appropriate public display of grief and strength.", "To investigate the circumstances surrounding Marcellus's death, seeking to maintain control and authority.", "To reassess his position in the succession line, considering the implications for both Tiberius and Julia."],
        ap.beliefs = ["The stability of the empire is paramount, and familial loyalty should align with political ambition.", "Public perception is crucial; maintaining an image of control is essential after a tragedy.", "The loyalty of those around him can shift unexpectedly, requiring vigilance and strategy."],
        ap.goals = ["Short-term: To manage the immediate fallout from Marcellus\u2019s death, ensuring it does not destabilize his rule.", "Medium-term: To reestablish the imperial family's unity and strength in the eyes of the people.", "Ultimate: To secure a stable succession plan that continues his legacy and fortifies the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Claudius observes the tumultuous scene unfolding in the Roman streets, likely from a window or elevated vantage point within his villa, detached from the immediate chaos but intensely focused on the spectacle. He stands as a solitary figure, removed from the mob\'s frenzy, his gaze absorbing every detail of the unfolding riot as he mentally records the historical significance of this moment. His physical stance is probably still, contemplative, less participant and more chronicler.',
        ap.emotional_state = 'Claudius experiences a complex mix of emotions: a detached fascination with the raw power of the mob, tinged with apprehension about the unpredictable nature of such unrest. Internally, he likely feels a grim vindication, witnessing the societal instability he perhaps always sensed beneath Rome\'s imperial veneer. There\'s an unspoken conflict between his fear for the immediate chaos and a darker satisfaction that this upheaval validates his cynical view of Roman power as built on shaky foundations and popular manipulation. He is observing, but also judging, the scene with a historian\'s cool detachment and a personal sense of foreboding.',
        ap.emotional_tags = ["claudius experiences a complex mix of emotions: a detached fascination with the raw power of the mob, tinged with apprehension about the unpredictable nature of such unrest. internally, he likely feels a grim vindication, witnessing the societal instability he perhaps always sensed beneath rome's imperial veneer. there's an unspoken conflict between his fear for the immediate chaos", "a darker satisfaction that this upheaval validates his cynical view of roman power as built on shaky foundations", "popular manipulation. he is observing, but also judging, the scene with a historian's cool detachment", "a personal sense of foreboding.", "claudius experiences a complex mix of emotions: a detached fascination with the raw power of the mob", "tinged with apprehension about the unpredictable nature of such unrest. internally", "he likely feels a grim vindication", "witnessing the societal instability he perhaps always sensed beneath rome's imperial veneer. there's an unspoken conflict between his fear for the immediate chaos and a darker satisfaction that this upheaval validates his cynical view of roman power as built on shaky foundations and popular manipulation. he is observing", "but also judging", "the scene with a historian's cool detachment and a personal sense of foreboding.", "claudius experiences a complex mix of emotions: a detached fascination with the raw power of the mob, tinged with apprehension about the unpredictable nature of such unrest. internally, he likely feels a grim vindication, witnessing the societal instability he perhaps always sensed beneath rome's imperial veneer. there's an unspoken conflict between his fear for the immediate chaos and a darker satisfaction that this upheaval validates his cynical view of roman power as built on shaky foundations and popular manipulation. he is observing,", "also judging, the scene with a historian's cool detachment and a personal sense of foreboding."],
        ap.active_plans = ["To meticulously observe and document the unfolding riot, capturing the details of the mob's actions and the atmosphere of chaos for his historical record.", "To analyze the underlying causes and political implications of the mob's fury, interpreting this event as a significant turning point in the power dynamics of Rome.", "To ensure his own safety and maintain a low profile, avoiding any direct involvement or drawing attention to himself amidst the volatile public unrest."],
        ap.beliefs = ["He believes that the appearance of Roman stability and order is a fragile facade, easily shattered by public discontent and the machinations of power.", "He believes that Livia's ambition and actions surrounding Marcellus's death are the primary drivers of this public fury, and that her response will be ruthless and decisive.", "He believes that the Republic, though invoked by the mob, is likely an unattainable ideal in the current Roman political landscape, and that the unrest will ultimately serve to further consolidate imperial power, albeit through force."],
        ap.goals = ["short_term\": \"To remain a detached observer and accurately record the events of the mob violence without personal risk or interference.", "medium_term\": \"To understand how this eruption of public anger will reshape the political landscape of Rome and impact the power struggle between Livia and other key players.", "ultimate\": \"To ensure his historical account captures the true significance of this chaotic event, preserving it for future generations as a testament to the underlying tensions and fragilities of the Roman Empire, fulfilling the Sibyl's prophecy."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_statutes_event_18_1'})
    ON CREATE SET
        oi.description = 'The statues serve as symbols of Roman authority and order, now under threat as the mob rampages through the streets. Their destruction signifies the unraveling of societal norms and the chaos that ensues when public sentiment turns hostile.',
        oi.status_before = 'The statues stand as proud representations of Roman leaders and deities, embodying the ideals of stability and order within the city.',
        oi.status_after = 'Following the mob\'s rampage, the statues are vandalized or toppled, marking a significant loss of respect for authority and contributing to the atmosphere of unrest.'
    WITH oi
    MATCH (o:Object {uuid: 'object_statutes'})
    MATCH (e:Event {uuid: 'event_18_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_shops_event_18_1'})
    ON CREATE SET
        oi.description = 'The shops lining the streets are targeted for looting by the mob, representing the vulnerability of civilian life during times of upheaval. Their destruction illustrates the chaos and loss of economic stability that accompanies social unrest.',
        oi.status_before = 'The shops are bustling commercial establishments serving the local populace, integral to the daily life and economy of Rome.',
        oi.status_after = 'After the chaos, the shops remain in disarray, with broken windows and emptied shelves, reflecting the immediate impact of the mob\'s violence on the community\'s livelihood.'
    WITH oi
    MATCH (o:Object {uuid: 'object_shops'})
    MATCH (e:Event {uuid: 'event_18_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly by the window, his posture tense as he observes the chaos erupting in the streets. He delivers a report to Livia, detailing the mob\'s rampage, their destruction of property, and the City Watchmen\'s impotence in restoring order.',
        ap.emotional_state = 'Tiberius exhibits a mix of anxiety and frustration. Outwardly, he maintains a composed demeanor, but internally, he feels a growing fear of the consequences that bloodshed may bring. His apprehension is evident as he grapples with the urgency of the situation.',
        ap.emotional_tags = ["tiberius exhibits a mix of anxiety", "frustration. outwardly, he maintains a composed demeanor, but internally, he feels a growing fear of the consequences that bloodshed may bring. his apprehension is evident as he grapples with the urgency of the situation.", "tiberius exhibits a mix of anxiety and frustration. outwardly", "he maintains a composed demeanor", "but internally", "he feels a growing fear of the consequences that bloodshed may bring. his apprehension is evident as he grapples with the urgency of the situation.", "tiberius exhibits a mix of anxiety and frustration. outwardly, he maintains a composed demeanor,", "internally, he feels a growing fear of the consequences that bloodshed may bring. his apprehension is evident as he grapples with the urgency of the situation."],
        ap.active_plans = ["To assess the situation outside and report it accurately to Livia.", "To strategize on how to manage the mob without escalating violence.", "To engage in dialogue with the rioters, hoping to diffuse tensions and prevent further chaos."],
        ap.beliefs = ["Violence will only escalate the unrest and lead to greater consequences.", "The protection of the imperial family and their interests must take precedence.", "It is important to maintain a semblance of control amidst chaos to avoid panic."],
        ap.goals = ["Short-term: To inform Livia about the escalating situation promptly.", "Medium-term: To negotiate a peaceful resolution with the mob.", "Ultimate: To establish himself as a competent leader capable of managing crises."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Livia paces with a determined attitude, brushing past Tiberius as she prepares to confront the chaos head-on. Her body language is assertive and commanding, demonstrating her intent to take control of the situation.',
        ap.emotional_state = 'Livia displays an outward confidence laced with a steely resolve. Beneath her composed exterior lies an undercurrent of anger and urgency, as she dismisses Tiberius\'s caution and expresses her disdain for the mob\'s actions.',
        ap.emotional_tags = ["livia displays an outward confidence laced with a steely resolve. beneath her composed exterior lies an undercurrent of anger", "urgency, as she dismisses tiberius's caution", "expresses her disdain for the mob's actions.", "livia displays an outward confidence laced with a steely resolve. beneath her composed exterior lies an undercurrent of anger and urgency", "as she dismisses tiberius's caution and expresses her disdain for the mob's actions."],
        ap.active_plans = ["To mobilize the Guard against the mob immediately.", "To assert her authority and demonstrate strength in the face of chaos.", "To take matters into her own hands, indicating her willingness to confront the mob directly."],
        ap.beliefs = ["Showing weakness or fear in the face of the mob will lead to greater threats to her family.", "Immediate and decisive action is necessary to restore order and assert control.", "The safety of the imperial family is paramount, and she will do whatever it takes to secure it."],
        ap.goals = ["Short-term: To quell the chaos outside as quickly as possible.", "Medium-term: To secure her position of power by demonstrating her decisiveness.", "Ultimate: To eliminate threats to her family's rule and ensure Tiberius's ascension."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Livia is a whirlwind of restless energy within her private chambers, pacing with sharp, deliberate strides as if the very floor tiles offend her. She dominates the space with her physical agitation, her movements reflecting the turmoil in her mind. She sweeps past Tiberius with dismissive force, heading towards the chamber\'s entrance, a clear signal of her intent to take charge and confront the chaos directly.',
        ap.emotional_state = 'Livia\'s surface emotion is a volcanic eruption of frustration and incandescent anger. Her tone is laced with scorn and impatience, directed at Tiberius\'s perceived weakness. Internally, she is driven by a ruthless determination to regain control and quell the insurrection. Beneath this fury lies a deep-seated fear of losing her grip on power and the meticulously constructed order she has imposed. Her unspoken motivation is to reassert dominance and extinguish any threat to her ambition, viewing the riot as a personal affront and a challenge to her authority.',
        ap.emotional_tags = ["livia's surface emotion is a volcanic eruption of frustration", "incandescent anger. her tone is laced with scorn", "impatience, directed at tiberius's perceived weakness. internally, she is driven by a ruthless determination to regain control", "quell the insurrection. beneath this fury lies a deep-seated fear of losing her grip on power", "the meticulously constructed order she has imposed. her unspoken motivation is to reassert dominance", "extinguish any threat to her ambition, viewing the riot as a personal affront", "a challenge to her authority.", "livia's surface emotion is a volcanic eruption of frustration and incandescent anger. her tone is laced with scorn and impatience", "directed at tiberius's perceived weakness. internally", "she is driven by a ruthless determination to regain control and quell the insurrection. beneath this fury lies a deep-seated fear of losing her grip on power and the meticulously constructed order she has imposed. her unspoken motivation is to reassert dominance and extinguish any threat to her ambition", "viewing the riot as a personal affront and a challenge to her authority."],
        ap.active_plans = ["Immediately suppress the riot with overwhelming force by deploying the Guard.", "Assert her dominance over Tiberius, dismissing his cautious approach as weakness and indecision.", "Restore order in Rome swiftly and decisively, demonstrating her unwavering strength and resolve to the court and the populace."],
        ap.beliefs = ["Unwavering strength and decisive action are the only languages chaos understands.", "Any sign of hesitation or compassion is a fatal flaw in leadership, inviting further disorder.", "She, Livia, is the only one capable of making the tough decisions necessary to maintain order and protect Rome's stability."],
        ap.goals = ["short_term\": \"To immediately halt the rioting and re-establish physical control over the streets of Rome.", "medium_term\": \"To quash any dissent and reinforce her image as a strong and unyielding ruler capable of handling any crisis.", "ultimate\": \"To secure her dynasty's future by demonstrating her indispensable role in maintaining Roman stability, thus solidifying her power and paving the way for Tiberius's ascension."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly by the window, a statue of apprehension, his gaze fixed on the tumultuous scenes unfolding outside. He is physically present in Livia\'s chambers but emotionally withdrawn, observing the chaos with a detached concern. His posture is stiff, reflecting his internal conflict and hesitation. He speaks cautiously, voicing his reservations about deploying the Guard and drawing blood, indicating a deep unease with his mother\'s proposed course of action.',
        ap.emotional_state = 'Tiberius outwardly displays worry and apprehension, his voice laced with caution as he speaks of the \'consequences\' of violence. Internally, he is deeply conflicted, torn between his awareness of the escalating chaos and his fear of the repercussions of brutal suppression. He is anxious about the potential for public backlash and the moral implications of ordering the Guard to fire on Roman citizens. His unspoken conflict is his struggle to assert his own judgment against Livia\'s forceful will, and his desire to be seen as a just and considered leader, not merely a ruthless enforcer.',
        ap.emotional_tags = ["tiberius outwardly displays worry", "apprehension, his voice laced with caution as he speaks of the 'consequences' of violence. internally, he is deeply conflicted, torn between his awareness of the escalating chaos", "his fear of the repercussions of brutal suppression. he is anxious about the potential for public backlash", "the moral implications of ordering the guard to fire on roman citizens. his unspoken conflict is his struggle to assert his own judgment against livia's forceful will,", "his desire to be seen as a just", "considered leader, not merely a ruthless enforcer.", "tiberius outwardly displays worry and apprehension", "his voice laced with caution as he speaks of the 'consequences' of violence. internally", "he is deeply conflicted", "torn between his awareness of the escalating chaos and his fear of the repercussions of brutal suppression. he is anxious about the potential for public backlash and the moral implications of ordering the guard to fire on roman citizens. his unspoken conflict is his struggle to assert his own judgment against livia's forceful will", "and his desire to be seen as a just and considered leader", "not merely a ruthless enforcer."],
        ap.active_plans = ["Assess the extent and nature of the riot from a distance, gathering information about the unfolding chaos.", "Caution Livia against resorting to immediate and potentially excessive violence, arguing for a more measured response.", "Implicitly, hope for a less confrontational solution that avoids bloodshed and maintains a semblance of public order without further inflaming tensions."],
        ap.beliefs = ["Excessive force can have unintended and damaging consequences, potentially escalating the unrest and alienating the populace.", "A leader should strive for restraint and consider the long-term ramifications of their actions, rather than reacting impulsively.", "Drawing Roman blood is a grave act that should be avoided if possible, even in the face of civil unrest."],
        ap.goals = ["short_term\": \"To prevent an immediate escalation of violence and convince Livia to consider alternatives to deploying the Guard.", "medium_term\": \"To manage the riot in a way that minimizes bloodshed and maintains some level of public order without inciting further rebellion.", "ultimate\": \"To establish himself as a more thoughtful and measured leader than his mother, differentiating his approach and perhaps gaining public favor by advocating for restraint, even in crisis."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands rigidly by the window, his posture tense as he observes the chaos erupting in the streets below. His body language is defensive, with arms crossed, as he grapples with the weight of his mother\'s demands. His gaze flickers between the tumult outside and Livia\'s determined figure, reflecting his internal struggle.',
        ap.emotional_state = 'Tiberius is caught in a maelstrom of conflicting emotions. On the surface, he exhibits a calm demeanor, but beneath lies a deep-seated fear for the potential consequences of drawing blood. His loyalty to Livia battles against a growing apprehension about the chaos and violence. This tension reveals his struggle between wanting to please his mother and his instinct to protect the populace.',
        ap.emotional_tags = ["tiberius is caught in a maelstrom of conflicting emotions. on the surface, he exhibits a calm demeanor, but beneath lies a deep-seated fear for the potential consequences of drawing blood. his loyalty to livia battles against a growing apprehension about the chaos", "violence. this tension reveals his struggle between wanting to please his mother", "his instinct to protect the populace.", "tiberius is caught in a maelstrom of conflicting emotions. on the surface", "he exhibits a calm demeanor", "but beneath lies a deep-seated fear for the potential consequences of drawing blood. his loyalty to livia battles against a growing apprehension about the chaos and violence. this tension reveals his struggle between wanting to please his mother and his instinct to protect the populace.", "tiberius is caught in a maelstrom of conflicting emotions. on the surface, he exhibits a calm demeanor,", "beneath lies a deep-seated fear for the potential consequences of drawing blood. his loyalty to livia battles against a growing apprehension about the chaos and violence. this tension reveals his struggle between wanting to please his mother and his instinct to protect the populace."],
        ap.active_plans = ["Attempt to persuade Livia against drawing the Guard out against the mob.", "Consider alternative methods to address the rioting without violence.", "Weigh his loyalty to his mother against his own moral compass regarding the safety of the citizens."],
        ap.beliefs = ["Belief in the sanctity of life, making him hesitant to engage in violence against the mob.", "Conviction that the repercussions of drawing blood could spiral out of control, endangering their positions.", "Awareness of the political consequences that could arise from his mother's impulsive commands."],
        ap.goals = ["Short-term: Prevent immediate violence and chaos in the city.", "Medium-term: Maintain his relationship with his mother while asserting his own moral stance.", "Ultimate: Establish himself as a responsible leader who can balance Livia's ambition with the welfare of the people."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_3'})
    ON CREATE SET
        ap.current_status = 'Livia paces with a commanding presence, exuding a sense of urgency and control. She sweeps past Tiberius, her movements deliberate as she ignores his concerns. Her posture is strong and resolute, embodying her fierce determination to take charge amidst the chaos.',
        ap.emotional_state = 'Livia displays a facade of confidence and fearlessness, her words laced with a steely resolve. Beneath the surface, however, there is a chilling ambition driving her actions, revealing her complete lack of regard for the mob\'s humanity. Her impatience and disdain for Tiberius\'s hesitance expose a deeper belief in her own authority and superiority.',
        ap.emotional_tags = ["livia displays a facade of confidence", "fearlessness, her words laced with a steely resolve. beneath the surface, however, there is a chilling ambition driving her actions, revealing her complete lack of regard for the mob's humanity. her impatience", "disdain for tiberius's hesitance expose a deeper belief in her own authority", "superiority.", "livia displays a facade of confidence and fearlessness", "her words laced with a steely resolve. beneath the surface", "however", "there is a chilling ambition driving her actions", "revealing her complete lack of regard for the mob's humanity. her impatience and disdain for tiberius's hesitance expose a deeper belief in her own authority and superiority."],
        ap.active_plans = ["Directly confront the mob to assert control and eliminate the threat to her family.", "Manipulate Tiberius into acting decisively on her orders, disregarding his fears.", "Reinforce her position as the decisive leader amid the turmoil, furthering her plans for Tiberius's succession."],
        ap.beliefs = ["Belief that strength must be shown in the face of chaos to maintain power.", "Conviction that her ambition for Tiberius\u2019s rule justifies any means necessary.", "View of the mob as an obstacle to be controlled or eliminated rather than individuals deserving of consideration."],
        ap.goals = ["Short-term: Quell the uprising swiftly to restore order and demonstrate her power.", "Medium-term: Solidify her influence over Tiberius and the imperial family.", "Ultimate: Secure her legacy through the ascendance of Tiberius, ensuring her family's dominance in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_4'})
    ON CREATE SET
        ap.current_status = 'Livia is a whirlwind of motion within her private chambers, pacing restlessly as reports of the city\'s unrest flood in. She is physically dominant, sweeping past Tiberius with unwavering momentum towards the chamber entrance, her movements radiating a fierce determination to take charge and confront the chaos directly. Her posture is erect, her gestures decisive, indicating a leader ready to act.',
        ap.emotional_state = 'On the surface, Livia projects unwavering resolve and controlled fury, dismissing Tiberius\'s anxieties with sharp contempt. Her tone is imperious and impatient, betraying a deep-seated frustration with what she perceives as weakness. Internally, she is driven by a potent mix of anger at the disruption to Roman order, a steely resolve to assert her authority, and perhaps a carefully concealed anxiety about the escalating situation. Her outward fearlessness is likely a mask for a more complex emotional landscape, where ambition and survival instincts clash.',
        ap.emotional_tags = ["on the surface, livia projects unwavering resolve", "controlled fury, dismissing tiberius's anxieties with sharp contempt. her tone is imperious", "impatient, betraying a deep-seated frustration with what she perceives as weakness. internally, she is driven by a potent mix of anger at the disruption to roman order, a steely resolve to assert her authority,", "perhaps a carefully concealed anxiety about the escalating situation. her outward fearlessness is likely a mask for a more complex emotional landscape, where ambition", "survival instincts clash.", "on the surface", "livia projects unwavering resolve and controlled fury", "dismissing tiberius's anxieties with sharp contempt. her tone is imperious and impatient", "betraying a deep-seated frustration with what she perceives as weakness. internally", "she is driven by a potent mix of anger at the disruption to roman order", "a steely resolve to assert her authority", "and perhaps a carefully concealed anxiety about the escalating situation. her outward fearlessness is likely a mask for a more complex emotional landscape", "where ambition and survival instincts clash."],
        ap.active_plans = ["To immediately confront the rioting mob and quell the unrest.", "To override Tiberius's cautious approach and assert her decisive leadership.", "To restore order in Rome swiftly and decisively, reinforcing imperial control."],
        ap.beliefs = ["Direct action and strength are the only effective responses to chaos.", "Fear is a weakness that must be suppressed, both in herself and in those around her.", "Maintaining order is paramount to preserving Roman power and her family's position."],
        ap.goals = ["short_term\": \"To physically reach and address the mob, demonstrating her authority.", "medium_term\": \"To suppress the riot and re-establish control over the city of Rome.", "ultimate\": \"To consolidate her power and ensure the stability of the empire, thereby securing her son's future succession."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands stiffly by the window, a rigid observer of the escalating chaos in the Roman streets below. He is physically static, his posture suggesting a reluctance to engage directly, preferring to assess the situation from a distance. He reports the events to Livia, describing the mob\'s destructive actions and the deployment of the City Watchmen, his stance one of passive observation rather than active intervention.',
        ap.emotional_state = 'Tiberius outwardly expresses apprehension and concern, voicing his worries about the consequences of using force against the rioters. His tone is hesitant, reflecting an internal conflict between the need for order and his fear of inciting further violence. Beneath the surface, he is likely experiencing a mixture of anxiety, indecision, and a sense of being overwhelmed by the unfolding events. He appears to be both in awe and intimidated by Livia\'s forceful personality, a dynamic evident in his reluctant compliance to her dominating will.',
        ap.emotional_tags = ["tiberius outwardly expresses apprehension", "concern, voicing his worries about the consequences of using force against the rioters. his tone is hesitant, reflecting an internal conflict between the need for order", "his fear of inciting further violence. beneath the surface, he is likely experiencing a mixture of anxiety, indecision,", "a sense of being overwhelmed by the unfolding events. he appears to be both in awe", "intimidated by livia's forceful personality, a dynamic evident in his reluctant compliance to her dominating will.", "tiberius outwardly expresses apprehension and concern", "voicing his worries about the consequences of using force against the rioters. his tone is hesitant", "reflecting an internal conflict between the need for order and his fear of inciting further violence. beneath the surface", "he is likely experiencing a mixture of anxiety", "indecision", "and a sense of being overwhelmed by the unfolding events. he appears to be both in awe and intimidated by livia's forceful personality", "a dynamic evident in his reluctant compliance to her dominating will."],
        ap.active_plans = ["To monitor the riot's progression and relay information to Livia.", "To advocate for a more restrained approach, cautioning against the use of excessive force.", "To avoid direct confrontation and potential escalation of violence by the imperial guard."],
        ap.beliefs = ["Violence should be a last resort due to its unpredictable and potentially damaging outcomes.", "A measured and cautious response is more prudent than rash action.", "Livia's impulsive nature may lead to undesirable consequences."],
        ap.goals = ["short_term\": \"To accurately assess the level of threat posed by the mob and inform Livia.", "medium_term\": \"To find a solution that restores order without triggering widespread bloodshed and further unrest.", "ultimate\": \"To contribute to the long-term stability of Rome, albeit through a more cautious and less confrontational approach than his mother's."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Livia strides confidently into the heart of the riot, her presence immediately commanding attention. As she steps into the chaos, the mob momentarily quiets, their surprise at her audacity palpable. She stands firm, her posture upright and assertive, gesturing emphatically as she challenges the crowd with her words.',
        ap.emotional_state = 'Outwardly, Livia exudes confidence and authority, her voice ringing clear and unwavering amidst the clamor. Internally, however, a storm brews; she is aware of the precariousness of her position and the simmering anger of the mob. Beneath her calm facade lies a fierce determination to maintain control and a deep-seated fear of losing power. Her motivations are driven by a mix of maternal ambition for Tiberius and a need to reinstate order.',
        ap.emotional_tags = ["outwardly, livia exudes confidence", "authority, her voice ringing clear", "unwavering amidst the clamor. internally, however, a storm brews; she is aware of the precariousness of her position", "the simmering anger of the mob. beneath her calm facade lies a fierce determination to maintain control", "a deep-seated fear of losing power. her motivations are driven by a mix of maternal ambition for tiberius", "a need to reinstate order.", "outwardly", "livia exudes confidence and authority", "her voice ringing clear and unwavering amidst the clamor. internally", "however", "a storm brews; she is aware of the precariousness of her position and the simmering anger of the mob. beneath her calm facade lies a fierce determination to maintain control and a deep-seated fear of losing power. her motivations are driven by a mix of maternal ambition for tiberius and a need to reinstate order.", "outwardly, livia exudes confidence and authority, her voice ringing clear and unwavering amidst the clamor. internally, however, a storm brews", "she is aware of the precariousness of her position and the simmering anger of the mob. beneath her calm facade lies a fierce determination to maintain control and a deep-seated fear of losing power. her motivations are driven by a mix of maternal ambition for tiberius and a need to reinstate order."],
        ap.active_plans = ["To assert her authority over the mob and quell their unrest by appealing to their fears.", "To manipulate the situation by painting a dire picture of the consequences of civil disorder, thus shaming the crowd into compliance.", "To strategize the return of Agrippa, believing his presence is vital in restoring order and bridging the gap between the government and the people."],
        ap.beliefs = ["The people are driven by fear and can be controlled through manipulation of their emotions.", "A strong hand is necessary to maintain order; weakness invites chaos.", "Agrippa possesses the qualities needed to speak to the common people and alleviate their discontent."],
        ap.goals = ["Short-term: To silence the mob and restore calm in the streets.", "Medium-term: To secure Agrippa's return to Rome as an ally to stabilize her family's power.", "Ultimate: To ensure Tiberius ascends to the throne and solidifies Livia's legacy as a powerful matriarch."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Livia strides fearlessly into the heart of the raging riot, her imperial purple standing out against the chaotic backdrop of the Roman streets. She directly confronts the mob, her physical presence commanding immediate attention as she pushes through the throng, undeterred by Tiberius\'s attempts to restrain her forceful advance.',
        ap.emotional_state = 'Outwardly, Livia displays fierce anger and disdain towards the rioting mob, her tone sharp and dismissive as she labels them \'rabble\'. Beneath this surface anger, a steely determination burns; she is resolute in her intent to quell the unrest and reassert control.  Her sharp rebuke of Tiberius reveals impatience and a deep-seated belief in her own superior judgment and strategic acumen, highlighting her frustration with what she perceives as his weakness.',
        ap.emotional_tags = ["outwardly, livia displays fierce anger", "disdain towards the rioting mob, her tone sharp", "dismissive as she labels them 'rabble'. beneath this surface anger, a steely determination burns; she is resolute in her intent to quell the unrest", "reassert control.  her sharp rebuke of tiberius reveals impatience", "a deep-seated belief in her own superior judgment", "strategic acumen, highlighting her frustration with what she perceives as his weakness.", "outwardly", "livia displays fierce anger and disdain towards the rioting mob", "her tone sharp and dismissive as she labels them 'rabble'. beneath this surface anger", "a steely determination burns; she is resolute in her intent to quell the unrest and reassert control.  her sharp rebuke of tiberius reveals impatience and a deep-seated belief in her own superior judgment and strategic acumen", "highlighting her frustration with what she perceives as his weakness.", "outwardly, livia displays fierce anger and disdain towards the rioting mob, her tone sharp and dismissive as she labels them 'rabble'. beneath this surface anger, a steely determination burns", "she is resolute in her intent to quell the unrest and reassert control.  her sharp rebuke of tiberius reveals impatience and a deep-seated belief in her own superior judgment and strategic acumen, highlighting her frustration with what she perceives as his weakness."],
        ap.active_plans = ["To immediately suppress the ongoing riot and restore order to the Roman streets through direct confrontation and decisive action.", "To publicly assert her authority and leadership, demonstrating her capability to manage crises even in the face of widespread chaos.", "To strategically recall Agrippa to Rome, recognizing his unique ability to pacify the populace and stabilize the precarious political landscape."],
        ap.beliefs = ["The Roman Republic was fundamentally flawed and inherently prone to disorder, thus justifying the necessity of autocratic imperial rule.", "Strong, unwavering leadership, even if unconventional or perceived as unwomanly, is crucial for maintaining control and preventing societal collapse.", "Marcus Agrippa, despite any personal or political tensions, is indispensable for restoring stability and commanding the respect of the Roman populace in times of crisis."],
        ap.goals = ["{short_term: To immediately silence and disperse the angry mob, preventing further violence and property damage within Rome., medium_term: To swiftly restore order and stability throughout the city, quelling the insurrection and reinforcing the authority of the imperial regime., ultimate: To secure the long-term stability of the Roman Empire and solidify her own influence by ensuring the right individuals are in positions of power, even if it means overriding conventional expectations and challenging established norms.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius trails behind Livia in the tumultuous Roman streets, his physical presence marked by discomfort and hesitation. He attempts to pull her back from the confrontational scene, his movements reactive and lacking the assertive drive that characterizes Livia\'s actions as he visibly struggles to keep pace with her forceful stride into the riot.',
        ap.emotional_state = 'Tiberius is visibly flustered and deeply uncomfortable amidst the chaos, his embarrassment evident in his attempts to restrain Livia and his plea for her to behave \'normally\'. Internally, he is likely experiencing a mix of frustration, inadequacy, and perhaps a touch of fear. He feels out of his depth in handling the volatile mob and is likely chafing against Livia\'s unconventional and domineering approach, wishing for a more traditional, less publicly assertive resolution to the crisis.',
        ap.emotional_tags = ["tiberius is visibly flustered", "deeply uncomfortable amidst the chaos, his embarrassment evident in his attempts to restrain livia", "his plea for her to behave 'normally'. internally, he is likely experiencing a mix of frustration, inadequacy,", "perhaps a touch of fear. he feels out of his depth in handling the volatile mob", "is likely chafing against livia's unconventional", "domineering approach, wishing for a more traditional, less publicly assertive resolution to the crisis.", "tiberius is visibly flustered and deeply uncomfortable amidst the chaos", "his embarrassment evident in his attempts to restrain livia and his plea for her to behave 'normally'. internally", "he is likely experiencing a mix of frustration", "inadequacy", "and perhaps a touch of fear. he feels out of his depth in handling the volatile mob and is likely chafing against livia's unconventional and domineering approach", "wishing for a more traditional", "less publicly assertive resolution to the crisis."],
        ap.active_plans = ["To persuade Livia to withdraw from the potentially dangerous confrontation with the mob, prioritizing her safety and social decorum.", "To avoid direct engagement with the rioting populace, preferring a more detached, conventional approach to restoring order.", "To defer to Livia's decisions and directives, albeit with visible reluctance and underlying disapproval, ultimately yielding to her dominant will despite his own reservations."],
        ap.beliefs = ["Women, especially those of noble stature, should adhere to conventional societal expectations of behavior, particularly in public and during times of crisis.", "Directly confronting an angry mob is a reckless and inappropriate course of action, likely to escalate rather than de-escalate the situation.", "Livia's methods, while sometimes effective, often disregard social norms and risk upsetting the delicate balance of Roman society through their sheer audacity."],
        ap.goals = ["{short_term: To extract Livia from the potentially dangerous and socially compromising situation of directly addressing the mob., medium_term: To restore order to Rome, but through more conventional and less confrontational means, such as deploying the city guards as instructed., ultimate: To maintain social stability and imperial authority within Rome, ideally through methods that align with traditional Roman values and expectations, even if overshadowed by Livia's more assertive and unconventional tactics.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Augustus sits at a large table in his richly appointed study, his commanding presence radiating authority despite his aging frame. He engages Agrippa in a heartfelt reunion, emphasizing their past friendships while trying to bridge the rift created by Marcellus\'s death. His gestures are animated but tempered, reflecting the weight of unspoken grievances.',
        ap.emotional_state = 'Augustus oscillates between nostalgia and defensiveness. Outwardly, he displays warmth, a smile playing at the corners of his lips as he reminisces about the past. Internally, however, he grapples with vulnerability and insecurity regarding his friendships and political standing, particularly in light of Agrippa\'s grievances.',
        ap.emotional_tags = ["augustus oscillates between nostalgia", "defensiveness. outwardly, he displays warmth, a smile playing at the corners of his lips as he reminisces about the past. internally, however, he grapples with vulnerability", "insecurity regarding his friendships", "political standing, particularly in light of agrippa's grievances.", "augustus oscillates between nostalgia and defensiveness. outwardly", "he displays warmth", "a smile playing at the corners of his lips as he reminisces about the past. internally", "however", "he grapples with vulnerability and insecurity regarding his friendships and political standing", "particularly in light of agrippa's grievances."],
        ap.active_plans = ["Reinstate Agrippa's position in Rome to stabilize his own power structure.", "Reinforce the bond of friendship with Agrippa to counterbalance the political chaos following Marcellus's death.", "Propose a family alliance through Agrippa's marriage to Julia, thus solidifying political ties."],
        ap.beliefs = ["Friendship and loyalty are paramount in times of turmoil, especially among allies.", "The bonds of blood and marriage strengthen political alliances and help secure the empire.", "The past, though painful, must be acknowledged to move forward in unity."],
        ap.goals = ["Short-term: mend the relationship with Agrippa to ensure his support.", "Medium-term: stabilize the political landscape in Rome after Marcellus's death.", "Ultimate: secure a lasting legacy by aligning with powerful allies through familial bonds."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Agrippa sits opposite Augustus at the large table, his weathered demeanor reflecting both camaraderie and the weight of past grievances. He maintains eye contact, expressing his thoughts with measured words, occasionally leaning forward to emphasize his sincerity, yet his posture reveals a lingering tension, indicative of past wounds.',
        ap.emotional_state = 'Agrippa\'s outward demeanor is a blend of warmth and guardedness. He expresses a sense of nostalgia for the old days, yet his internal state is marked by resentment and disappointment over past insults. His grievances regarding Marcellus\'s treatment linger, creating an undercurrent of tension that complicates their reunion.',
        ap.emotional_tags = ["agrippa's outward demeanor is a blend of warmth", "guardedness. he expresses a sense of nostalgia for the old days, yet his internal state is marked by resentment", "disappointment over past insults. his grievances regarding marcellus's treatment linger, creating an undercurrent of tension that complicates their reunion.", "agrippa's outward demeanor is a blend of warmth and guardedness. he expresses a sense of nostalgia for the old days", "yet his internal state is marked by resentment and disappointment over past insults. his grievances regarding marcellus's treatment linger", "creating an undercurrent of tension that complicates their reunion."],
        ap.active_plans = ["Re-establish his place and influence within Augustus's inner circle.", "Seek to address his grievances over Marcellus's treatment and restore mutual respect with Augustus.", "Propose a marriage alliance to solidify their bond and secure his status within the imperial family."],
        ap.beliefs = ["True loyalty must be reciprocated, and past grievances must be acknowledged for a relationship to heal.", "Building family alliances can strengthen one's position and ensure political stability.", "Friendship, once strained, requires effort and understanding to be restored."],
        ap.goals = ["Short-term: address and resolve grievances with Augustus to reinstate their friendship.", "Medium-term: gain back his former influence in Rome while ensuring his family ties are strengthened.", "Ultimate: achieve personal and familial security through an advantageous marriage to Julia."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Augustus sits across from Agrippa in his study, leaning forward with an air of forced joviality, attempting to bridge the chasm of their estrangement. He initiates a sentimental dialogue, reminiscing about their youthful camaraderie and lamenting the \'silly things\' that drove them apart. He uses expansive gestures and a warm tone, striving to project an image of sincere regret and renewed friendship as he seeks to draw Agrippa back into his fold.',
        ap.emotional_state = 'Beneath a veneer of nostalgic warmth and regret, Augustus is calculating and subtly anxious. He outwardly expresses relief and happiness at Agrippa\'s return, emphasizing his need for his \'old friend.\' Internally, he\'s driven by a pragmatic necessity to stabilize Rome post-Marcellus\'s death and secure Agrippa\'s loyalty.  Suspicion lingers, however, as he gauges Agrippa\'s true motives, masking his imperial authority with a facade of vulnerable, personal appeal.',
        ap.emotional_tags = ["beneath a veneer of nostalgic warmth", "regret, augustus is calculating", "subtly anxious. he outwardly expresses relief", "happiness at agrippa's return, emphasizing his need for his 'old friend.' internally, he's driven by a pragmatic necessity to stabilize rome post-marcellus's death", "secure agrippa's loyalty.  suspicion lingers, however, as he gauges agrippa's true motives, masking his imperial authority with a facade of vulnerable, personal appeal.", "beneath a veneer of nostalgic warmth and regret", "augustus is calculating and subtly anxious. he outwardly expresses relief and happiness at agrippa's return", "emphasizing his need for his 'old friend.' internally", "he's driven by a pragmatic necessity to stabilize rome post-marcellus's death and secure agrippa's loyalty.  suspicion lingers", "however", "as he gauges agrippa's true motives", "masking his imperial authority with a facade of vulnerable", "personal appeal."],
        ap.active_plans = ["Reintegrate Agrippa into the core of Roman power to restore stability and order after Marcellus's death.", "Assess Agrippa's true loyalty and commitment to him after their period of separation and perceived slights.", "Manipulate Agrippa through appeals to their past friendship and flattery to ensure his willing return to service and obedience to Augustus's will."],
        ap.beliefs = ["The stability of Rome and the continuation of his rule are paramount, justifying any personal compromises.", "Personal relationships are tools of statecraft, to be leveraged for political advantage and imperial security.", "As Emperor, he is entitled to the unwavering loyalty and service of his allies, especially those like Agrippa who owe him their positions."],
        ap.goals = ["Short-term Goal: Secure Agrippa's immediate and public return to Rome to project an image of strength and unity.", "Medium-term Goal: Utilize Agrippa's military and political acumen to quell unrest and consolidate his authority in the wake of recent turmoil.", "Ultimate Goal: Ensure the long-term stability of his dynasty and legacy, even if it requires strategic alliances and personal concessions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Agrippa listens to Augustus\'s overtures with a stoic demeanor, seated across the table in the Emperor\'s study. He maintains a measured posture, his gaze direct and unwavering, reflecting a seasoned warrior assessing a battlefield. He responds to Augustus\'s sentimental appeals with a degree of formality, acknowledging their shared history but also pointedly reminding Augustus of past neglect and slights, ensuring his own worth is recognized.',
        ap.emotional_state = 'Agrippa projects an aura of controlled reserve, his weathered face betraying little of his inner thoughts. While he engages in the conciliatory conversation, there\'s an undercurrent of caution and calculation. He\'s likely experiencing a complex blend of emotions: perhaps a flicker of genuine nostalgia for his past friendship with Augustus, mingled with resentment for past disregard and a healthy dose of suspicion regarding the Emperor\'s sudden warmth. He is aware of his own indispensable value and feels assertive, strategically maneuvering to maximize his renewed influence.',
        ap.emotional_tags = ["agrippa projects an aura of controlled reserve, his weathered face betraying little of his inner thoughts. while he engages in the conciliatory conversation, there's an undercurrent of caution", "calculation. he's likely experiencing a complex blend of emotions: perhaps a flicker of genuine nostalgia for his past friendship with augustus, mingled with resentment for past disregard", "a healthy dose of suspicion regarding the emperor's sudden warmth. he is aware of his own indispensable value", "feels assertive, strategically maneuvering to maximize his renewed influence.", "agrippa projects an aura of controlled reserve", "his weathered face betraying little of his inner thoughts. while he engages in the conciliatory conversation", "there's an undercurrent of caution and calculation. he's likely experiencing a complex blend of emotions: perhaps a flicker of genuine nostalgia for his past friendship with augustus", "mingled with resentment for past disregard and a healthy dose of suspicion regarding the emperor's sudden warmth. he is aware of his own indispensable value and feels assertive", "strategically maneuvering to maximize his renewed influence."],
        ap.active_plans = ["Re-establish himself as a pivotal figure in Roman politics, leveraging Augustus's obvious need for his skills and authority.", "Evaluate the sincerity of Augustus's welcome and the shifting power dynamics within Rome, especially following Marcellus's demise.", "Propose marriage to Julia as a bold strategic move to solidify his position within the imperial family and secure a direct path to enhanced power and influence."],
        ap.beliefs = ["His military and political expertise are essential to Rome's strength and stability, making him indispensable to Augustus's reign.", "Loyalty and past service deserve recognition and tangible rewards, including a significant role in the empire's future.", "Strategic alliances, such as marriage into the imperial family, are legitimate and effective means of consolidating power and ensuring long-term influence."],
        ap.goals = ["Short-term Goal: Secure a powerful position in Rome and regain Augustus's explicit favor and trust immediately upon his return.", "Medium-term Goal: Consolidate his political influence, potentially positioning himself as a key figure in the line of succession and shaping the future of the Empire.", "Ultimate Goal: Ensure his lasting legacy and the continued prominence of his family within the Roman power structure, possibly even paving the way for his own descendants to ascend to greater heights."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Livia paces with contained fury, her movements sharp and restless, as she confronts Augustus about his decision. Her posture is tense, and her gestures emphasize her disbelief and anger, underscoring the intensity of her emotions.',
        ap.emotional_state = 'Livia\'s surface emotions radiate rage and frustration, punctuated by her sharp tone and accusatory remarks. Internally, she grapples with feelings of possessiveness and a strategic sense of betrayal, as her ambitions for Tiberius clash with Augustus\'s decisions. There is a fierce desire to assert her control and influence.',
        ap.emotional_tags = ["livia's surface emotions radiate rage", "frustration, punctuated by her sharp tone", "accusatory remarks. internally, she grapples with feelings of possessiveness", "a strategic sense of betrayal, as her ambitions for tiberius clash with augustus's decisions. there is a fierce desire to assert her control", "influence.", "livia's surface emotions radiate rage and frustration", "punctuated by her sharp tone and accusatory remarks. internally", "she grapples with feelings of possessiveness and a strategic sense of betrayal", "as her ambitions for tiberius clash with augustus's decisions. there is a fierce desire to assert her control and influence."],
        ap.active_plans = ["To challenge Augustus's decision regarding Agrippa's proposal and assert her own authority.", "To remind Augustus of the implications of this marriage for Julia and the family dynamics.", "To manipulate the situation to regain her influence and control over the succession narrative."],
        ap.beliefs = ["Livia believes that power and lineage are paramount, and that Agrippa is unworthy of the Julian name.", "She believes she is best suited to navigate the treacherous waters of court politics and protect her family's legacy.", "Livia is convinced that Augustus's decisions must align with the family's interests, particularly regarding Tiberius's future."],
        ap.goals = ["Short-term: To dissuade Augustus from agreeing to Agrippa\u2019s marriage proposal.", "Medium-term: To secure a favorable position for Tiberius within the imperial succession.", "Ultimate: To establish her family\u2019s dominance over the Roman Empire by eliminating competition and empowering Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm, countering Livia\'s accusations with a calm demeanor, despite the rising tension. His posture is authoritative, and he uses deliberate gestures to emphasize his points, demonstrating a mix of control and defensiveness.',
        ap.emotional_state = 'Augustus outwardly projects confidence and authority, but beneath the surface, he harbors insecurities about his decisions and the stability of his power. There is a tension between his desire to maintain control and the discomfort of Livia’s confrontational tone.',
        ap.emotional_tags = ["augustus outwardly projects confidence", "authority, but beneath the surface, he harbors insecurities about his decisions", "the stability of his power. there is a tension between his desire to maintain control", "the discomfort of livia\u2019s confrontational tone.", "augustus outwardly projects confidence and authority", "but beneath the surface", "he harbors insecurities about his decisions and the stability of his power. there is a tension between his desire to maintain control and the discomfort of livia\u2019s confrontational tone.", "augustus outwardly projects confidence and authority,", "beneath the surface, he harbors insecurities about his decisions and the stability of his power. there is a tension between his desire to maintain control and the discomfort of livia\u2019s confrontational tone."],
        ap.active_plans = ["To defend his decision to agree to Agrippa's proposal and maintain his authority in the face of Livia's anger.", "To manage the dynamics of the family and court politics, ensuring loyalty while navigating dissent.", "To reinforce the perception of his paternal role and the rationale behind his choices to protect Julia's interests."],
        ap.beliefs = ["Augustus believes that maintaining alliances through marriage is essential for the stability of the empire.", "He believes in his own wisdom and authority as the Emperor, feeling justified in his decision regarding Agrippa.", "He values the importance of family and succession, yet struggles with the ramifications of his choices."],
        ap.goals = ["Short-term: To reassure Livia and assert his decision about Agrippa\u2019s proposal without appearing weak.", "Medium-term: To stabilize the political landscape by fostering alliances through Agrippa's union with Julia.", "Ultimate: To secure a smooth succession for the empire while preserving the power and legacy he has built."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm in his study, directly facing Livia and maintaining eye contact as he defends his politically motivated decision. He gestures minimally, his posture suggesting a weariness but also a resolute stance against Livia\'s escalating agitation. He uses clear, declarative statements to justify his actions, emphasizing the necessity of his choice and the pragmatism behind it.',
        ap.emotional_state = 'Outwardly, Augustus projects an air of weary patience and imperial authority, his tone measured and rational as he attempts to reason with Livia. However, beneath the surface of his composed demeanor, there is a hint of annoyance at Livia\'s persistent questioning and emotional outburst. He seems to be internally frustrated by the need to constantly justify his political strategies, perhaps even feeling a sense of resignation to the unending power struggles within his own family.',
        ap.emotional_tags = ["outwardly, augustus projects an air of weary patience", "imperial authority, his tone measured", "rational as he attempts to reason with livia. however, beneath the surface of his composed demeanor, there is a hint of annoyance at livia's persistent questioning", "emotional outburst. he seems to be internally frustrated by the need to constantly justify his political strategies, perhaps even feeling a sense of resignation to the unending power struggles within his own family.", "outwardly", "augustus projects an air of weary patience and imperial authority", "his tone measured and rational as he attempts to reason with livia. however", "beneath the surface of his composed demeanor", "there is a hint of annoyance at livia's persistent questioning and emotional outburst. he seems to be internally frustrated by the need to constantly justify his political strategies", "perhaps even feeling a sense of resignation to the unending power struggles within his own family."],
        ap.active_plans = ["To firmly justify his decision regarding Agrippa to Livia, emphasizing the political necessity.", "To maintain control over the conversation and his authority as Emperor within his own study.", "To de-escalate Livia's emotional reaction and bring the argument to a swift, pragmatic conclusion."],
        ap.beliefs = ["Political stability and strategic alliances are paramount for the security of Rome, even if they require personal concessions.", "As Emperor, his judgment on matters of state is ultimately sound and in the best interest of Rome.", "Emotional reactions must be secondary to pragmatic political calculations when making crucial decisions for the empire."],
        ap.goals = ["short-term\": \"To end the immediate argument with Livia and assert his dominance in the current disagreement.", "medium-term\": \"To secure Agrippa's loyalty and continued cooperation by fulfilling his 'price' and solidifying their political alliance.", "ultimate\": \"To ensure the long-term stability and prosperity of Rome, even if it involves making unpopular or personally challenging decisions that are politically expedient."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Livia paces within Augustus\'s study, her movements betraying a \'contained fury\' that suggests an intense internal agitation barely held in check. She confronts Augustus directly, her body language reflecting her confrontational stance as she questions his decision with sharp, rhetorical questions. Her pacing emphasizes her restless energy and deep dissatisfaction with the situation, highlighting her inability to remain still in the face of what she perceives as a grave error.',
        ap.emotional_state = 'Livia is consumed by fury and frustration, her surface emotions evident in her sharp tone and agitated pacing. Internally, she is likely feeling deeply betrayed and undermined by Augustus\'s decision, viewing it as a dangerous concession that elevates Agrippa at the expense of her own ambitions and Tiberius\'s future. Her unspoken conflict is her burning desire to control the succession and ensure Tiberius\'s path to power is unobstructed, a plan she sees directly threatened by Agrippa\'s increasing influence and this strategic marriage alliance.',
        ap.emotional_tags = ["livia is consumed by fury", "frustration, her surface emotions evident in her sharp tone", "agitated pacing. internally, she is likely feeling deeply betrayed", "undermined by augustus's decision, viewing it as a dangerous concession that elevates agrippa at the expense of her own ambitions", "tiberius's future. her unspoken conflict is her burning desire to control the succession", "ensure tiberius's path to power is unobstructed, a plan she sees directly threatened by agrippa's increasing influence", "this strategic marriage alliance.", "livia is consumed by fury and frustration", "her surface emotions evident in her sharp tone and agitated pacing. internally", "she is likely feeling deeply betrayed and undermined by augustus's decision", "viewing it as a dangerous concession that elevates agrippa at the expense of her own ambitions and tiberius's future. her unspoken conflict is her burning desire to control the succession and ensure tiberius's path to power is unobstructed", "a plan she sees directly threatened by agrippa's increasing influence and this strategic marriage alliance."],
        ap.active_plans = ["To aggressively challenge Augustus's decision, attempting to make him reconsider and reverse his agreement to the marriage.", "To undermine Agrippa's perceived worthiness of the Julian family and highlight the perceived insult of his ambition.", "To manipulate Augustus's emotions by invoking parental feelings for Julia, appealing to his sense of responsibility and potentially guilt-tripping him into changing his mind."],
        ap.beliefs = ["Agrippa is a social climber who is overreaching his station and does not deserve further elevation within Roman society.", "Her political instincts and strategic judgment are superior to Augustus's, particularly concerning matters of succession and power dynamics.", "Dynastic marriages should be strategically beneficial to her family and not simply concessions to rivals, especially if they empower figures she deems dangerous."],
        ap.goals = ["short-term\": \"To convince Augustus to retract his agreement to the marriage and prevent it from proceeding.", "medium-term\": \"To diminish Agrippa's political power and influence, ensuring he does not become a significant obstacle to Tiberius's ascent.", "ultimate\": \"To secure Tiberius's unchallenged succession to the Roman throne, solidifying her family's dynasty and maintaining her own position as the power behind the Emperor, free from threats posed by figures like Agrippa."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Livia paces the study, her posture tense and her movements sharp as she engages Augustus in heated conversation. Her gestures are animated, emphasizing her points as she scoffs at his reasoning, projecting a relentless determination to assert her authority.',
        ap.emotional_state = 'Livia\'s surface emotions reflect a simmering fury and disdain, as her sharp tone and quick retorts reveal her deep-seated frustration. Internally, she grapples with a potent mix of ambition and insecurity, feeling threatened by Agrippa\'s potential rise and driven by a fierce desire to control the narrative surrounding the upcoming marriage.',
        ap.emotional_tags = ["livia's surface emotions reflect a simmering fury", "disdain, as her sharp tone", "quick retorts reveal her deep-seated frustration. internally, she grapples with a potent mix of ambition", "insecurity, feeling threatened by agrippa's potential rise", "driven by a fierce desire to control the narrative surrounding the upcoming marriage.", "livia's surface emotions reflect a simmering fury and disdain", "as her sharp tone and quick retorts reveal her deep-seated frustration. internally", "she grapples with a potent mix of ambition and insecurity", "feeling threatened by agrippa's potential rise and driven by a fierce desire to control the narrative surrounding the upcoming marriage."],
        ap.active_plans = ["To undermine Agrippa's worthiness by highlighting his humble origins and questioning his modesty.", "To manipulate Augustus by instilling doubt about his decision-making, subtly challenging his authority.", "To advocate for Julia's feelings in the marriage arrangement, framing it as a betrayal to their daughter."],
        ap.beliefs = ["Noble birth and lineage are paramount in Roman society, and those without it should remain in their place.", "Control over familial relationships is essential to secure her son Tiberius's future and her own power.", "Ambition must be confronted directly; manipulation through humiliation is an effective strategy."],
        ap.goals = ["Short-term: To dissuade Augustus from supporting Agrippa's marriage to Julia.", "Medium-term: To consolidate Tiberius's position as the rightful heir by eliminating potential rivals.", "Ultimate: To secure her family's dominance in Rome through strategic manipulation and ruthless ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Augustus stands somewhat defensively as Livia paces, his posture relaxed yet indicating the strain of maintaining control. He uses hand gestures to emphasize his points, attempting to quell Livia\'s fury with reasoned arguments, even as his frustration surfaces at her accusations.',
        ap.emotional_state = 'Augustus displays a facade of calm, but his emotional state is fraught with tension. He feels defensive, sensing Livia\'s challenge to his authority and the fragility of his decisions. Beneath his placating demeanor lies a current of irritation and the weight of responsibility for the empire\'s future.',
        ap.emotional_tags = ["augustus displays a facade of calm, but his emotional state is fraught with tension. he feels defensive, sensing livia's challenge to his authority", "the fragility of his decisions. beneath his placating demeanor lies a current of irritation", "the weight of responsibility for the empire's future.", "augustus displays a facade of calm", "but his emotional state is fraught with tension. he feels defensive", "sensing livia's challenge to his authority and the fragility of his decisions. beneath his placating demeanor lies a current of irritation and the weight of responsibility for the empire's future.", "augustus displays a facade of calm,", "his emotional state is fraught with tension. he feels defensive, sensing livia's challenge to his authority and the fragility of his decisions. beneath his placating demeanor lies a current of irritation and the weight of responsibility for the empire's future."],
        ap.active_plans = ["To justify his decision to allow Agrippa to marry Julia, framing it as a necessary political move.", "To maintain a united front with Livia despite her dissent, aiming to prevent further conflict.", "To negotiate the complexities of familial dynamics while protecting his authority as Emperor."],
        ap.beliefs = ["Political expediency often necessitates difficult decisions, even at the cost of familial relationships.", "Maintaining the stability of the empire is paramount, and alliances through marriage are essential.", "Livia's ambition can be harnessed to serve their collective interests, despite her aggressive tactics."],
        ap.goals = ["Short-term: To defend his choice regarding Agrippa and quell Livia's anger.", "Medium-term: To navigate the treacherous dynamics of his family while ensuring the empire's stability.", "Ultimate: To secure a legacy that ensures the continuity and strength of the Julio-Claudian line."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_4'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm in his study, listening to Livia\'s agitated pacing but remaining composed. He dismisses her proposed strategy with a wave of his hand and a tone of weary authority, asserting his own judgment as final. He is physically stationary, observing Livia\'s outburst with a mixture of annoyance and paternalistic dismissal, maintaining his ground in their disagreement.',
        ap.emotional_state = 'On the surface, Augustus displays irritation and exasperation with Livia\'s passionate opposition. He projects an air of weary patience, suggesting he\'s dealt with her strong opinions many times before. Internally, he likely feels confident in his political acumen, perhaps even a little smug in his perceived superiority. There\'s an undercurrent of annoyance that Livia questions his decisions, but he masks it with paternalism, ultimately believing he knows best.',
        ap.emotional_tags = ["on the surface, augustus displays irritation", "exasperation with livia's passionate opposition. he projects an air of weary patience, suggesting he's dealt with her strong opinions many times before. internally, he likely feels confident in his political acumen, perhaps even a little smug in his perceived superiority. there's an undercurrent of annoyance that livia questions his decisions, but he masks it with paternalism, ultimately believing he knows best.", "on the surface", "augustus displays irritation and exasperation with livia's passionate opposition. he projects an air of weary patience", "suggesting he's dealt with her strong opinions many times before. internally", "he likely feels confident in his political acumen", "perhaps even a little smug in his perceived superiority. there's an undercurrent of annoyance that livia questions his decisions", "but he masks it with paternalism", "ultimately believing he knows best.", "on the surface, augustus displays irritation and exasperation with livia's passionate opposition. he projects an air of weary patience, suggesting he's dealt with her strong opinions many times before. internally, he likely feels confident in his political acumen, perhaps even a little smug in his perceived superiority. there's an undercurrent of annoyance that livia questions his decisions,", "he masks it with paternalism, ultimately believing he knows best."],
        ap.active_plans = ["To shut down Livia's argument and reassert his authority as Emperor and head of the family.", "To justify his decision regarding Agrippa's marriage proposal as the most politically sound option.", "To subtly remind Livia of her place and avoid escalating the conflict into a larger power struggle within their relationship."],
        ap.beliefs = ["Political decisions should be based on pragmatism and strategic advantage, not emotional reactions.", "He possesses superior political instincts and experience compared to Livia.", "Maintaining stability and control requires careful negotiation and compromise, not aggressive confrontation."],
        ap.goals = ["Short-term: To end the argument with Livia and restore calm in his study.", "Medium-term: To ensure Agrippa's loyalty and integrate him smoothly back into the imperial structure through the marriage.", "Ultimate: To maintain control over the empire and secure a peaceful and stable future for Rome, even if it means making compromises he personally dislikes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_4'})
    ON CREATE SET
        ap.current_status = 'Livia paces within Augustus\'s study, her movements contained yet radiating intense frustration. She argues vehemently against Augustus\'s decision, her voice sharp and insistent as she outlines her preferred confrontational approach. Her physical agitation mirrors her inner turmoil as she struggles to sway Augustus and regain control of the situation, her pacing emphasizing her restless energy and determination to be heard.',
        ap.emotional_state = 'Livia is outwardly furious and deeply frustrated by Augustus\'s agreement to Agrippa\'s demand. Her surface emotions are a controlled explosion of anger, evident in her sharp tone and agitated movements. Internally, she feels undermined and disregarded, her strategic advice dismissed out of hand.  Beneath her fury lies a deeper anxiety – a fear of losing control and allowing Agrippa to gain too much power, jeopardizing her long-term plans for Tiberius. Her emotional state is a volatile mix of rage and strategic calculation.',
        ap.emotional_tags = ["livia is outwardly furious", "deeply frustrated by augustus's agreement to agrippa's demand. her surface emotions are a controlled explosion of anger, evident in her sharp tone", "agitated movements. internally, she feels undermined", "disregarded, her strategic advice dismissed out of hand.  beneath her fury lies a deeper anxiety \u2013 a fear of losing control", "allowing agrippa to gain too much power, jeopardizing her long-term plans for tiberius. her emotional state is a volatile mix of rage", "strategic calculation.", "livia is outwardly furious and deeply frustrated by augustus's agreement to agrippa's demand. her surface emotions are a controlled explosion of anger", "evident in her sharp tone and agitated movements. internally", "she feels undermined and disregarded", "her strategic advice dismissed out of hand.  beneath her fury lies a deeper anxiety \u2013 a fear of losing control and allowing agrippa to gain too much power", "jeopardizing her long-term plans for tiberius. her emotional state is a volatile mix of rage and strategic calculation."],
        ap.active_plans = ["To aggressively challenge Augustus's decision and make him reconsider his agreement to Agrippa's marriage demands.", "To assert the validity and effectiveness of her confrontational strategy, emphasizing the perceived weakness in Augustus's approach.", "To plant seeds of doubt in Augustus's mind about his own judgment and highlight the potential dangers of appeasing Agrippa."],
        ap.beliefs = ["Direct confrontation and a display of strength are necessary to manage ambitious men like Agrippa and maintain control.", "Agrippa's ambition is a direct threat to her family's power and must be checked with firm opposition.", "Her strategic instincts are sharper and more effective than Augustus's, especially in dealing with political rivals and power dynamics."],
        ap.goals = ["Short-term: To win the argument with Augustus and force him to retract or modify his agreement with Agrippa.", "Medium-term: To diminish Agrippa's perceived power and influence, preventing him from becoming a dominant force within the imperial family.", "Ultimate: To secure the unchallenged succession of Tiberius to the throne and ensure her family's continued dominance over Rome, which she believes is threatened by Agrippa's growing influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_5'})
    ON CREATE SET
        ap.current_status = 'Augustus stands his ground, maintaining a posture of defiance and authority as Livia paces, his expression a mix of irritation and resolve. His gestures are measured, emphasizing his points while he defends his decisions regarding the marriage to Agrippa.',
        ap.emotional_state = 'Augustus exhibits surface frustration, his voice tinged with a hint of impatience. Internally, he wrestles with the weight of his choices, feeling the strain of familial expectations against his desire to maintain control. His stubbornness hides a flicker of vulnerability, revealing his insecurity about his decisions.',
        ap.emotional_tags = ["augustus exhibits surface frustration", "his voice tinged with a hint of impatience. internally", "he wrestles with the weight of his choices", "feeling the strain of familial expectations against his desire to maintain control. his stubbornness hides a flicker of vulnerability", "revealing his insecurity about his decisions."],
        ap.active_plans = ["To assert his authority in the face of Livia's criticism, reinforcing his decisions regarding Agrippa's marriage.", "To deflect Livia\u2019s attacks by framing the situation as one of necessity rather than choice.", "To maintain a sense of humor in the argument to lighten the mood, despite the underlying tensions."],
        ap.beliefs = ["He believes in the importance of preserving alliances through strategic marriages.", "He holds that leadership requires making difficult choices that may not always please everyone.", "He views himself as the ultimate authority within the family and the empire, entitled to make decisions without needing to justify them."],
        ap.goals = ["Short-term: To resolve the immediate argument with Livia without conceding his position.", "Medium-term: To solidify his decision regarding Agrippa and ensure stability in the empire.", "Ultimate: To secure his legacy and the future of Rome through strategic alliances."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_5'})
    ON CREATE SET
        ap.current_status = 'Livia paces with restrained fury, her movements sharp and purposeful. She gestures emphatically, her posture rigid as she confronts Augustus, her expression a blend of frustration and determination as she challenges his decisions.',
        ap.emotional_state = 'Livia\'s surface anger is palpable, marked by a sharp tone and piercing gaze. Internally, she grapples with feelings of betrayal and the urgency to protect her family\'s interests, particularly Tiberius\'s future. Her frustration is also fueled by her desire for control in a situation that undermines her plans.',
        ap.emotional_tags = ["livia's surface anger is palpable, marked by a sharp tone", "piercing gaze. internally, she grapples with feelings of betrayal", "the urgency to protect her family's interests, particularly tiberius's future. her frustration is also fueled by her desire for control in a situation that undermines her plans.", "livia's surface anger is palpable", "marked by a sharp tone and piercing gaze. internally", "she grapples with feelings of betrayal and the urgency to protect her family's interests", "particularly tiberius's future. her frustration is also fueled by her desire for control in a situation that undermines her plans."],
        ap.active_plans = ["To undermine Augustus's rationale for the marriage, asserting that it grants Agrippa more power than he deserves.", "To assert her influence by questioning Augustus's decision-making process and proposing her own strategies.", "To protect her son Tiberius's position by ensuring that influential marriages do not threaten his claim to power."],
        ap.beliefs = ["She believes that political marriages should reinforce her family's position rather than elevate those without noble lineage.", "She holds that her insights and strategies are more effective than Augustus's, especially regarding familial matters.", "She views Agrippa as a potential threat to her son\u2019s inheritance and the future of her family."],
        ap.goals = ["Short-term: To halt the marriage arrangement with Agrippa and regain control over her family's narrative.", "Medium-term: To influence Augustus's decisions regarding future alliances to favor Tiberius's interests.", "Ultimate: To secure Tiberius's position as the rightful heir to the empire, ensuring her family's dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_6'})
    ON CREATE SET
        ap.current_status = 'Livia paces within Augustus\'s study, her movements tight and controlled, indicative of her barely contained fury. She confronts Augustus directly, questioning his decision with sharp, pointed remarks, her physical agitation mirroring her inner turmoil as she challenges his authority in private.',
        ap.emotional_state = 'Outwardly, Livia displays anger and frustration, her tone sharp and accusatory as she questions Augustus\'s judgment. However, beneath this surface agitation lies a deeper current of political anxiety and strategic calculation. She is not genuinely concerned for Julia\'s feelings but is using this as a manipulative tactic to mask her fear of Agrippa\'s rising influence and the threat it poses to her ambitions for Tiberius. Her feigned maternal concern is a calculated performance designed to sway Augustus.',
        ap.emotional_tags = ["outwardly, livia displays anger", "frustration, her tone sharp", "accusatory as she questions augustus's judgment. however, beneath this surface agitation lies a deeper current of political anxiety", "strategic calculation. she is not genuinely concerned for julia's feelings but is using this as a manipulative tactic to mask her fear of agrippa's rising influence", "the threat it poses to her ambitions for tiberius. her feigned maternal concern is a calculated performance designed to sway augustus.", "outwardly", "livia displays anger and frustration", "her tone sharp and accusatory as she questions augustus's judgment. however", "beneath this surface agitation lies a deeper current of political anxiety and strategic calculation. she is not genuinely concerned for julia's feelings but is using this as a manipulative tactic to mask her fear of agrippa's rising influence and the threat it poses to her ambitions for tiberius. her feigned maternal concern is a calculated performance designed to sway augustus.", "outwardly, livia displays anger and frustration, her tone sharp and accusatory as she questions augustus's judgment. however, beneath this surface agitation lies a deeper current of political anxiety and strategic calculation. she is not genuinely concerned for julia's feelings", "is using this as a manipulative tactic to mask her fear of agrippa's rising influence and the threat it poses to her ambitions for tiberius. her feigned maternal concern is a calculated performance designed to sway augustus."],
        ap.active_plans = ["Undermine Augustus's acceptance of Agrippa's marriage proposal to Julia.", "Shift the focus of the argument from her own political motivations to a seemingly more virtuous concern for Julia's well-being.", "Create doubt in Augustus's mind about his decision-making by appealing to his paternal instincts and Roman social norms regarding family honor and children's wishes."],
        ap.beliefs = ["Agrippa is socially inferior and marrying into the Julian family elevates him undeservedly.", "Her political acumen is superior to Augustus's, and she is better equipped to handle threats like Agrippa.", "Julia's personal desires are secondary to the strategic needs of the family, but can be exploited for political leverage."],
        ap.goals = ["{short_term: Halt or weaken the momentum of the proposed marriage between Agrippa and Julia in this immediate conversation with Augustus.}", "{medium_term: Protect and advance Tiberius's position in the line of succession by limiting Agrippa's influence within the Julian family.}", "{ultimate: Secure the imperial succession for Tiberius and establish her family's long-term dominance over Rome, solidifying her legacy as a powerful empress.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_6'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm in his study, facing Livia’s agitated pacing with a degree of weary defensiveness. He parries her accusations, justifying his agreement to Agrippa’s demand with a blend of imperial pragmatism and paternalistic rationale. He uses colloquial language and asserts his personal preferences, indicating a growing irritation with Livia\'s persistent questioning of his authority.',
        ap.emotional_state = 'Augustus initially presents a facade of calm authority, defending his decision with logical explanations and dismissing Livia\'s objections as unfounded. However, beneath this controlled exterior, a flicker of annoyance and defensiveness is evident. He is weary of Livia’s constant political maneuvering and feels his judgment is being challenged in his own study. There\'s a subtle undercurrent of insecurity; while he asserts his dominance, his need to justify his decision to Livia suggests a possible internal doubt or a desire for her approval, even as he outwardly rejects her criticism.',
        ap.emotional_tags = ["augustus initially presents a facade of calm authority, defending his decision with logical explanations", "dismissing livia's objections as unfounded. however, beneath this controlled exterior, a flicker of annoyance", "defensiveness is evident. he is weary of livia\u2019s constant political maneuvering", "feels his judgment is being challenged in his own study. there's a subtle undercurrent of insecurity; while he asserts his dominance, his need to justify his decision to livia suggests a possible internal doubt or a desire for her approval, even as he outwardly rejects her criticism.", "augustus initially presents a facade of calm authority", "defending his decision with logical explanations and dismissing livia's objections as unfounded. however", "beneath this controlled exterior", "a flicker of annoyance and defensiveness is evident. he is weary of livia\u2019s constant political maneuvering and feels his judgment is being challenged in his own study. there's a subtle undercurrent of insecurity; while he asserts his dominance", "his need to justify his decision to livia suggests a possible internal doubt or a desire for her approval", "even as he outwardly rejects her criticism.", "augustus initially presents a facade of calm authority, defending his decision with logical explanations and dismissing livia's objections as unfounded. however, beneath this controlled exterior, a flicker of annoyance and defensiveness is evident. he is weary of livia\u2019s constant political maneuvering and feels his judgment is being challenged in his own study. there's a subtle undercurrent of insecurity", "while he asserts his dominance, his need to justify his decision to livia suggests a possible internal doubt or a desire for her approval, even as he outwardly rejects her criticism.", "augustus initially presents a facade of calm authority, defending his decision with logical explanations and dismissing livia's objections as unfounded. however, beneath this controlled exterior, a flicker of annoyance and defensiveness is evident. he is weary of livia\u2019s constant political maneuvering and feels his judgment is being challenged in his own study. there's a subtle undercurrent of insecurity;", "he asserts his dominance, his need to justify his decision to livia suggests a possible internal doubt or a desire for her approval, even as he outwardly rejects her criticism."],
        ap.active_plans = ["Defend his strategic rationale for agreeing to Agrippa's marriage request, emphasizing political pragmatism and necessity.", "Reassert his authority as Emperor and the head of the household against Livia's implicit challenge to his decision-making.", "Dismiss Livia's objections by framing them as irrational or emotionally driven, attempting to end the argument and maintain his position of control."],
        ap.beliefs = ["His agreement to Agrippa's request was a necessary political calculation to maintain stability and appease a powerful figure.", "He possesses superior political insight and understands the complexities of Roman power dynamics better than Livia.", "As Emperor, his decisions are final and should not be questioned, especially not in his own study and by his wife."],
        ap.goals = ["{short_term: End the argument with Livia and re-establish his dominance in the immediate domestic power dynamic, silencing her criticism.}", "{medium_term: Ensure Agrippa's continued loyalty and service to Rome by fulfilling his demands, even if it means a politically complicated marriage.}", "{ultimate: Secure a stable and relatively peaceful reign, managing the various ambitions and rivalries within his family and court to prevent open conflict and ensure the longevity of his legacy, though in this scene, immediate control and domestic tranquility are prioritized over long-term legacy concerns.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_7'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm, maintaining a commanding posture as he faces Livia. His gestures are animated yet controlled, hands gesturing emphatically as he expresses his views on the marriage arrangement. He exudes an air of authority, his presence dominating the intimate space of the study.',
        ap.emotional_state = 'Augustus displays a mix of frustration and determination. Outwardly, he appears resolute, challenging Livia’s objections. Internally, a sense of unease simmers beneath the surface, revealing his awareness of the complexities in their relationship and the underlying tension in their dialogue.',
        ap.emotional_tags = ["augustus displays a mix of frustration", "determination. outwardly, he appears resolute, challenging livia\u2019s objections. internally, a sense of unease simmers beneath the surface, revealing his awareness of the complexities in their relationship", "the underlying tension in their dialogue.", "augustus displays a mix of frustration and determination. outwardly", "he appears resolute", "challenging livia\u2019s objections. internally", "a sense of unease simmers beneath the surface", "revealing his awareness of the complexities in their relationship and the underlying tension in their dialogue."],
        ap.active_plans = ["To assert his authority and justify his decision regarding Agrippa's marriage to Julia.", "To challenge Livia's motives and uncover her true intentions behind her opposition.", "To maintain a semblance of control over the political dynamics within his family."],
        ap.beliefs = ["He believes that maintaining alliances through marriage is essential for political stability.", "He trusts in his ability to navigate familial discord and manipulate outcomes to his advantage.", "He holds a conviction that Livia\u2019s ambitions often cloud her judgment, leading her to irrational conclusions."],
        ap.goals = ["To solidify Agrippa's position within the family through the marriage.", "To demonstrate his control over the political landscape to Livia and others present.", "To ensure the stability of his rule by managing the relationships within his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_7'})
    ON CREATE SET
        ap.current_status = 'Livia paces the room with contained fury, her movements sharp and deliberate. She stops occasionally to face Augustus, her gestures emphatic as she argues passionately against his decision, her body language reflecting her agitation and frustration.',
        ap.emotional_state = 'Livia’s outward expression reveals fierce indignation and urgency. Internally, her emotions are a whirlpool of ambition and resentment, as she grapples with her desire for control and the threat posed by Agrippa\'s increasing influence. Her motivations are layered, blending personal and political stakes.',
        ap.emotional_tags = ["livia\u2019s outward expression reveals fierce indignation", "urgency. internally, her emotions are a whirlpool of ambition", "resentment, as she grapples with her desire for control", "the threat posed by agrippa's increasing influence. her motivations are layered, blending personal", "political stakes.", "livia\u2019s outward expression reveals fierce indignation and urgency. internally", "her emotions are a whirlpool of ambition and resentment", "as she grapples with her desire for control and the threat posed by agrippa's increasing influence. her motivations are layered", "blending personal and political stakes."],
        ap.active_plans = ["To manipulate Augustus into reconsidering the marriage arrangement for Agrippa.", "To assert her influence by framing the marriage as a threat to their family dynamics.", "To challenge Augustus\u2019s decisions in a way that reinforces her position within the power structure."],
        ap.beliefs = ["She believes that her son Tiberius deserves the throne and that any rival's rise threatens his future.", "She holds that familial loyalty should come before political alliances, particularly regarding marriage arrangements.", "She is convinced that Augustus's decisions often lack foresight and are detrimental to their family's legacy."],
        ap.goals = ["To prevent Agrippa's marriage to Julia, which she perceives as a power grab.", "To assert her own influence and authority in matters of succession.", "To protect her family's interests by ensuring her son\u2019s position is not undermined."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_8'})
    ON CREATE SET
        ap.current_status = 'Livia paces within Augustus\'s study, her movements deliberate and contained, yet betraying an inner agitation. She is physically present, engaging Augustus directly in a tense verbal confrontation, her posture suggesting controlled fury as she challenges his decision.',
        ap.emotional_state = 'On the surface, Livia presents an air of righteous indignation, emphasizing her concern for Julia\'s feelings and decrying the perceived lack of consideration for their daughter. Beneath this facade, a volcanic anger simmers, fueled by Augustus\'s agreement to Agrippa\'s demand. She feels undermined, her carefully laid plans threatened, and her control slipping, masked by a veneer of maternal concern and wifely disapproval.',
        ap.emotional_tags = ["on the surface, livia presents an air of righteous indignation, emphasizing her concern for julia's feelings", "decrying the perceived lack of consideration for their daughter. beneath this facade, a volcanic anger simmers, fueled by augustus's agreement to agrippa's demand. she feels undermined, her carefully laid plans threatened,", "her control slipping, masked by a veneer of maternal concern", "wifely disapproval.", "on the surface", "livia presents an air of righteous indignation", "emphasizing her concern for julia's feelings and decrying the perceived lack of consideration for their daughter. beneath this facade", "a volcanic anger simmers", "fueled by augustus's agreement to agrippa's demand. she feels undermined", "her carefully laid plans threatened", "and her control slipping", "masked by a veneer of maternal concern and wifely disapproval."],
        ap.active_plans = ["Undermine Augustus's confidence in his decision by highlighting the potential negative implications.", "Discredit Agrippa by suggesting he is immodest and socially climbing, unworthy of the Julian lineage.", "Evoke Augustus's paternal instincts by framing her opposition as concern for Julia's well-being and wishes, masking her own power-driven motives."],
        ap.beliefs = ["Agrippa is an upstart who overestimates his position and deserves to be kept in check.", "Her political acumen surpasses Augustus's, and she is better equipped to handle complex situations.", "Maintaining the purity and prestige of the Julian family is paramount, and Agrippa's inclusion through marriage is a misstep."],
        ap.goals = ["short-term\": \"To sow seeds of doubt in Augustus's mind regarding the marriage agreement and provoke him to reconsider.", "medium-term\": \"To weaken Agrippa's standing within the imperial family and limit his potential for further advancement.", "ultimate\": \"To safeguard Tiberius's path to succession by neutralizing any emerging threats or rivals, including Agrippa, ensuring her lineage's dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_8'})
    ON CREATE SET
        ap.current_status = 'Augustus stands firm in his study, facing Livia\'s contained fury with a mixture of weariness and imperial authority. He engages in a direct verbal exchange, defending his decision with a blend of pragmatic reasoning and dismissive pronouncements, his physical presence suggesting a resistance to Livia\'s challenge.',
        ap.emotional_state = 'Outwardly, Augustus displays annoyance and a degree of condescension towards Livia\'s passionate outburst, using dismissive language and asserting his authority as the ultimate decision-maker. Internally, he is likely feeling defensive about his political maneuver and perhaps a touch irritated by Livia\'s constant attempts to second-guess and control his actions. There is a subtle undercurrent of power assertion as he pushes back against her veiled criticisms.',
        ap.emotional_tags = ["outwardly, augustus displays annoyance", "a degree of condescension towards livia's passionate outburst, using dismissive language", "asserting his authority as the ultimate decision-maker. internally, he is likely feeling defensive about his political maneuver", "perhaps a touch irritated by livia's constant attempts to second-guess", "control his actions. there is a subtle undercurrent of power assertion as he pushes back against her veiled criticisms.", "outwardly", "augustus displays annoyance and a degree of condescension towards livia's passionate outburst", "using dismissive language and asserting his authority as the ultimate decision-maker. internally", "he is likely feeling defensive about his political maneuver and perhaps a touch irritated by livia's constant attempts to second-guess and control his actions. there is a subtle undercurrent of power assertion as he pushes back against her veiled criticisms."],
        ap.active_plans = ["Justify his agreement to Agrippa's marriage demand as a necessary political calculation and a pragmatic move to maintain stability.", "Assert his dominance in the relationship and within the empire by dismissing Livia's concerns as unfounded and emotional.", "Conclude the argument swiftly by reiterating his authority and shutting down Livia's line of reasoning with flippant remarks."],
        ap.beliefs = ["Political pragmatism and strategic alliances are essential for maintaining imperial stability, even if they involve personal compromises.", "As Emperor, his decisions are final and should not be questioned, especially on matters of state and political expediency.", "Livia's perspective, while valuable at times, is often clouded by personal biases and emotional reactions, hindering clear political judgment."],
        ap.goals = ["short-term\": \"To end the confrontation with Livia and reassert his position as the ultimate authority in their relationship and in Rome.", "medium-term\": \"To solidify the political alliance with Agrippa through the marriage, ensuring loyalty and stability within the power structure.", "ultimate\": \"To secure the long-term stability and continuity of the Roman Empire, even if it necessitates making unpopular or personally disagreeable decisions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in his dimly lit chamber, a look of distress etched across his weary face. His hands tremble as he scrawls frantically on a piece of parchment, his posture hunched and anxious, as if the very act of writing might stave off the impending doom he senses. He shifts nervously, glancing towards the door as if expecting an intruder at any moment.',
        ap.emotional_state = 'Claudius is engulfed in a maelstrom of paranoia and desperation. Outwardly, he exhibits visible anxiety, with furrowed brows and breathless utterances. Internally, he grapples with profound fear and isolation, acutely aware of the conspiratorial atmosphere around him. This fear is compounded by a sense of urgency, as he strives to record his thoughts before it\'s too late.',
        ap.emotional_tags = ["claudius is engulfed in a maelstrom of paranoia", "desperation. outwardly, he exhibits visible anxiety, with furrowed brows", "breathless utterances. internally, he grapples with profound fear", "isolation, acutely aware of the conspiratorial atmosphere around him. this fear is compounded by a sense of urgency, as he strives to record his thoughts before it's too late.", "claudius is engulfed in a maelstrom of paranoia and desperation. outwardly", "he exhibits visible anxiety", "with furrowed brows and breathless utterances. internally", "he grapples with profound fear and isolation", "acutely aware of the conspiratorial atmosphere around him. this fear is compounded by a sense of urgency", "as he strives to record his thoughts before it's too late."],
        ap.active_plans = ["Document his fears and suspicions about poisoning to preserve his narrative.", "Identify and confront the perceived threats in his environment.", "Seek a way to protect himself from the alleged conspirators."],
        ap.beliefs = ["He believes he is a target of a poisoning plot among those he once trusted.", "He is convinced that time is running out, heightening his urgency to write.", "He maintains a belief in the power of his written words to outlast his life and expose the truth."],
        ap.goals = ["Short-term: To quickly document his thoughts and fears before he is silenced.", "Medium-term: To uncover the identities of those conspiring against him.", "Ultimate: To ensure that his true history and perspective are preserved for future generations."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Event {uuid: 'event_1_6'}),
          (b:Scene {uuid: 'scene_1'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_1_5'}),
          (b:Event {uuid: 'event_1_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_6'}),
          (b:Event {uuid: 'event_1_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_1'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_2_1'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sibyl'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sibyl_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sibyl_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Event {uuid: 'event_4_6'}),
          (b:Scene {uuid: 'scene_4'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_4_5'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thallus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thallus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aristarchus_of_athens'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thallus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aristarchus_of_athens'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aristarchus_of_athens_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_5'}),
          (b:Event {uuid: 'event_4_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thallus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thallus_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_4_6'}),
          (b:Event {uuid: 'event_4_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_5_1'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pylades'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Event {uuid: 'event_6_4'}),
          (b:Scene {uuid: 'scene_6'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_6_3'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Event {uuid: 'event_7_3'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_2'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_7_4'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_3'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_7_5'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_4'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_2'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_3'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_2'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_4'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_3'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_5'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_4'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_6'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_5'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_7'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_6'}),
          (b:Event {uuid: 'event_8_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_8'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_7'}),
          (b:Event {uuid: 'event_8_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_8_9'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_8_8'}),
          (b:Event {uuid: 'event_8_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_octavia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_octavia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_8_6'}),
          (b:Event {uuid: 'event_8_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_7'}),
          (b:Event {uuid: 'event_8_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_8'}),
          (b:Event {uuid: 'event_8_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_8'}),
          (b:Event {uuid: 'event_8_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_8_9'}),
          (b:Event {uuid: 'event_8_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_8_9'}),
          (b:Event {uuid: 'event_8_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_octavia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_octavia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pylades'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pylades'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_pylades'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_pylades_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcellus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcellus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_12'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_2'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_1'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Event {uuid: 'event_14_5'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_4'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_musa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_musa_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
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
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_julia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_julia_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_16'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_17_1'}),
          (b:Scene {uuid: 'scene_17'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_18'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_17'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_18_1'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_18_2'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_18_1'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_18_3'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_18_2'}),
          (b:Event {uuid: 'event_18_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_18_4'}),
          (b:Scene {uuid: 'scene_18'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_18_3'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_3'}),
          (b:Event {uuid: 'event_18_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_3'}),
          (b:Event {uuid: 'event_18_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_18_4'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_4'}),
          (b:Event {uuid: 'event_18_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_19'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_18'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_19_1'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_19_2'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_19_1'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_19_2'}),
          (b:Event {uuid: 'event_19_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_20'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_19'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_20_1'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_20_2'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_20_1'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_agrippa'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_agrippa_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_21'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_20'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_21_1'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_2'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_1'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_3'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_2'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_4'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_3'}),
          (b:Event {uuid: 'event_21_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_5'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_4'}),
          (b:Event {uuid: 'event_21_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_6'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_5'}),
          (b:Event {uuid: 'event_21_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_7'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_6'}),
          (b:Event {uuid: 'event_21_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_21_8'}),
          (b:Scene {uuid: 'scene_21'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_21_7'}),
          (b:Event {uuid: 'event_21_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_4'}),
          (b:Event {uuid: 'event_21_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_4'}),
          (b:Event {uuid: 'event_21_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_5'}),
          (b:Event {uuid: 'event_21_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_5'}),
          (b:Event {uuid: 'event_21_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_6'}),
          (b:Event {uuid: 'event_21_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_6'}),
          (b:Event {uuid: 'event_21_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_7'}),
          (b:Event {uuid: 'event_21_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_7'}),
          (b:Event {uuid: 'event_21_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livia_event_21_8'}),
          (b:Event {uuid: 'event_21_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_augustus_caesar'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_augustus_caesar_event_21_8'}),
          (b:Event {uuid: 'event_21_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_22'}),
          (ep:Episode {uuid: 'episode_part_1_of_13:_a_touch_of_murder'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_21'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_22_1'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'}),
          (b:Event {uuid: 'event_22_1'})
    MERGE (a)-[:IN_EVENT]->(b);

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_2'}),
                      (e2:Event {uuid: 'event_1_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_2'}),
                      (e2:Event {uuid: 'event_1_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_3'}),
                      (e2:Event {uuid: 'event_1_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_2'}),
                      (e2:Event {uuid: 'event_1_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_3'}),
                      (e2:Event {uuid: 'event_1_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_4'}),
                      (e2:Event {uuid: 'event_1_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_1'}),
                      (e2:Event {uuid: 'event_1_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_2'}),
                      (e2:Event {uuid: 'event_1_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_3'}),
                      (e2:Event {uuid: 'event_1_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_4'}),
                      (e2:Event {uuid: 'event_1_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_1_5'}),
                      (e2:Event {uuid: 'event_1_6'})
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
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_4'}),
                      (e2:Event {uuid: 'event_4_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_1'}),
                      (e2:Event {uuid: 'event_4_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_2'}),
                      (e2:Event {uuid: 'event_4_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_3'}),
                      (e2:Event {uuid: 'event_4_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_4'}),
                      (e2:Event {uuid: 'event_4_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_4_5'}),
                      (e2:Event {uuid: 'event_4_6'})
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
                

                MATCH (e1:Event {uuid: 'event_6_1'}),
                      (e2:Event {uuid: 'event_6_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_2'}),
                      (e2:Event {uuid: 'event_6_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_6_3'}),
                      (e2:Event {uuid: 'event_6_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_4'}),
                      (e2:Event {uuid: 'event_7_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_7'}),
                      (e2:Event {uuid: 'event_8_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_1'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_2'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_3'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_4'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_5'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_6'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_7'}),
                      (e2:Event {uuid: 'event_8_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_8_8'}),
                      (e2:Event {uuid: 'event_8_9'})
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
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_2'})
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
                

                MATCH (e1:Event {uuid: 'event_14_1'}),
                      (e2:Event {uuid: 'event_14_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_2'}),
                      (e2:Event {uuid: 'event_14_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_3'}),
                      (e2:Event {uuid: 'event_14_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_4'}),
                      (e2:Event {uuid: 'event_14_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_16_1'}),
                      (e2:Event {uuid: 'event_16_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_1'}),
                      (e2:Event {uuid: 'event_18_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_1'}),
                      (e2:Event {uuid: 'event_18_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_2'}),
                      (e2:Event {uuid: 'event_18_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_1'}),
                      (e2:Event {uuid: 'event_18_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_2'}),
                      (e2:Event {uuid: 'event_18_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_18_3'}),
                      (e2:Event {uuid: 'event_18_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_19_1'}),
                      (e2:Event {uuid: 'event_19_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_20_1'}),
                      (e2:Event {uuid: 'event_20_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_4'}),
                      (e2:Event {uuid: 'event_21_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_4'}),
                      (e2:Event {uuid: 'event_21_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_5'}),
                      (e2:Event {uuid: 'event_21_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_4'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_5'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_6'}),
                      (e2:Event {uuid: 'event_21_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_1'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_2'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_3'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_4'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_5'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_6'}),
                      (e2:Event {uuid: 'event_21_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_21_7'}),
                      (e2:Event {uuid: 'event_21_8'})
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
