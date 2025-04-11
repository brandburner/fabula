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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e10_graph.json',
        creation_timestamp: '2025-04-11T16:17:39.762770',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_tiberius_claudius_drusus'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Drusus Nero Germanicus',
        a.title = 'None',
        a.description = 'An unlikely emperor and scholar caught in the treacherous political machinations of Rome. Initially portrayed as a brilliant yet timid academic burdened by family disdain and court treachery, his journey forces him to confront his fear and pragmatically navigate a chaotic, murderous court. In a later moment, he is seen reacting with shock and fear at the unfolding regicide, revealing both his inherent pragmatism and deep apprehension about the rising tide of violence.',
        a.traits = ["Timid", "Intelligent", "Pragmatic", "Reluctant leader", "Shocked", "Fearful", "Confused", "Observational"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_calpurnia'})
    ON CREATE SET
        a.name = 'Calpurnia',
        a.title = 'None',
        a.description = 'Calpurnia is a striking woman of beauty and sharp intelligence navigating the treacherous landscape of the Roman court. Fiercely protective of Claudius, she balances genuine affection with her own calculated ambition. A politically astute figure, she maneuvers through palace intrigue with grace while positioning herself for greater influence during chaotic times.',
        a.traits = ["ambitious", "alluring", "protective", "politically astute", "anxious", "strategic"],
        a.sphere_of_influence = 'Politics and Court Intrigue'
    ;
MERGE (a:Agent {uuid: 'agent_briseis'})
    ON CREATE SET
        a.name = 'Briseis',
        a.title = 'Servant Girl',
        a.description = 'Briseis is a young servant girl serving Claudius whose loyalty and agitation mark her as a key observer of the moral decay in the court. Quick to deliver scandalous news, she plays an essential role in unveiling the corruption seeping through the Roman corridors of power.',
        a.traits = ["Loyal", "Agitated", "Inquisitive", "Outspoken"],
        a.sphere_of_influence = 'Servitude, Imperial Palace'
    ;
MERGE (a:Agent {uuid: 'agent_sabinus'})
    ON CREATE SET
        a.name = 'Sabinus',
        a.title = 'None',
        a.description = 'Sabinus is a worried and anxious man who becomes entangled in the conspiracy to assassinate Caligula. Motivated by personal grievances and a call for retribution, he evolves from a subordinate figure into a determined conspirator who frames the act as vindication for the wronged wives of Rome.',
        a.traits = ["Complicit", "Retributive", "Anxious", "Determined", "Subordinate"],
        a.sphere_of_influence = 'Conspiracy'
    ;
MERGE (a:Agent {uuid: 'agent_diana'})
    ON CREATE SET
        a.name = 'Diana',
        a.title = 'None',
        a.description = 'Diana is Sabinus\'s young, postpartum wife, embodying vulnerability and fierce maternal instinct amid the brutal realities of Caligula\'s regime. Terrified and distressed, she resists the dehumanizing pressures of the imperial court while symbolizing the tragic plight of ordinary citizens caught in the midst of tyranny.',
        a.traits = ["Terrified", "Distressed", "Vulnerable", "Resistant"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_poppaea'})
    ON CREATE SET
        a.name = 'Poppaea',
        a.title = 'None',
        a.description = 'Poppaea is a strikingly beautiful and ruthlessly ambitious woman thriving within the predatory environment of the palace brothel. Exuding confidence and malice, she uses her sardonic wit to assert authority, assess others as commodities, and mock the vulnerabilities of those around her in a corrupt, decadent social order.',
        a.traits = ["Strikingly beautiful", "Confident", "Malicious", "Predatory", "Ambitious"],
        a.sphere_of_influence = 'Imperial Palace Brothel'
    ;
MERGE (a:Agent {uuid: 'agent_marcus_vinicius'})
    ON CREATE SET
        a.name = 'Marcus Vinicius',
        a.title = 'Roman military officer',
        a.description = 'Marcus Vinicius is a Roman military officer caught in the volatile power plays of Caligula\'s court. Ambitious yet increasingly fearful under the Emperor\'s erratic reign, he is resourceful and quick-thinking—demonstrated when concocting a plan under pressure to lure Caligula out.',
        a.traits = ["Ambitious", "Resourceful", "Fearful", "Agitated"],
        a.sphere_of_influence = 'Military and political maneuvering'
    ;
MERGE (a:Agent {uuid: 'agent_caesonia'})
    ON CREATE SET
        a.name = 'Caesonia',
        a.title = 'None',
        a.description = 'Caesonia, Caligula\'s wife, arrives in a state of distress amidst the chaos following the assassination. Distraught, panicked, and deeply maternal, she is primarily driven by the instinct to protect her child while grappling with the traumatic collapse of authority in Rome.',
        a.traits = ["Distraught", "Maternal", "Confused", "Vulnerable", "Panicked"],
        a.sphere_of_influence = 'Imperial Family'
    ;
MERGE (a:Agent {uuid: 'agent_caligula'})
    ON CREATE SET
        a.name = 'Caligula',
        a.title = 'Emperor',
        a.description = 'Caligula is the epitome of tyranny and madness in Rome—a young Emperor whose erratic, delusional behavior casts a terrifying shadow over the empire. His despotic rule fosters an atmosphere of fear and unpredictability, making him both a cautionary figure and the central catalyst for political upheaval.',
        a.traits = ["Tyrannical", "Erratic", "Delusional", "Fearful"],
        a.sphere_of_influence = 'Empire of Rome'
    ;
MERGE (a:Agent {uuid: 'agent_cassius'})
    ON CREATE SET
        a.name = 'Cassius',
        a.title = 'Conspirator',
        a.description = 'Cassius is a determined conspirator driven by a fierce resolve to strike against Caligula\'s tyranny. Representing the struggle for freedom against despotic rule, he embodies a breaking point of loyalty under oppression and is willing to commit regicide to liberate Rome.',
        a.traits = ["Determined", "Strategic", "Loyal", "Courageous"],
        a.sphere_of_influence = 'Military Conspiracy'
    ;
MERGE (a:Agent {uuid: 'agent_young_man'})
    ON CREATE SET
        a.name = 'Young Man',
        a.title = 'None',
        a.description = 'The Young Man is a minor but poignant character who is forcibly dragged into a scene by guards, symbolizing the arbitrary cruelty and capricious tyranny of Caligula\'s regime. His desperate cries for freedom vividly portray the cruelty and unpredictability characteristic of the imperial court.',
        a.traits = ["Helpless", "Frightened", "Resistant", "Victim of Tyranny"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_asprenas'})
    ON CREATE SET
        a.name = 'Asprenas',
        a.title = 'Officer',
        a.description = 'Asprenas is an officer in Caligula\'s military circle who finds himself drawn into Cassius’ plans. Sharing similarities with other military figures at court, his pragmatic and concerned demeanor reflects the weight of the tumultuous events unfolding around him.',
        a.traits = ["Pragmatic", "Concerned", "Realistic", "Follower", "Apprehensive"],
        a.sphere_of_influence = 'Military'
    ;
MERGE (a:Agent {uuid: 'agent_valeria_messalina'})
    ON CREATE SET
        a.name = 'Valeria Messalina',
        a.title = 'Noblewoman',
        a.description = 'Valeria Messalina is a young noblewoman navigating the dangerous intricacies of the Roman court. Initially apprehensive and seeking security, she exhibits both resilience and ambition, with her interactions hinting at a potential alliance or marriage with Claudius as she strives for stability in a tumultuous social environment.',
        a.traits = ["Apprehensive", "Resilient", "Ambitious", "Charming"],
        a.sphere_of_influence = 'Noble Court'
    ;
MERGE (a:Agent {uuid: 'agent_gratus'})
    ON CREATE SET
        a.name = 'Gratus',
        a.title = 'Praetorian Guard',
        a.description = 'Gratus is a burly and aggressive member of the Praetorian Guard, whose brutish demeanor and ambitious nature mirror the chaos in the wake of Caligula\'s assassination. His impulsive actions and loyalty to the Guard underscore the volatile instability of Rome\'s military might during this transformative period.',
        a.traits = ["Brutish", "Ambitious", "Loyal to the Guard", "Impulsive"],
        a.sphere_of_influence = 'Imperial Military'
    ;
MERGE (o:Object {uuid: 'object_scroll_from_herod'})
    ON CREATE SET
        o.name = 'Scroll from Herod',
        o.description = 'A small scroll received from Herod containing a personal message and a gift that reflects the dynamics of friendship and obligation. It introduces tension by highlighting Claudius\'s reluctance to engage in corrupt practices at court.',
        o.purpose = 'To convey personal messages and obligations between friends.',
        o.significance = 'Highlights Claudius\'s connections and the pressures he faces within the corrupt court.'
    ;
MERGE (o:Object {uuid: 'object_brothel_advertisement'})
    ON CREATE SET
        o.name = 'Brothel Advertisement',
        o.description = 'An advertisement pinned on the temple door promoting a brothel within the palace, serving as a shocking illustration of the moral decay at the imperial court.',
        o.purpose = 'To inform and incite scandal within the society.',
        o.significance = 'Reveals the corruption and exploitation occurring at the highest levels of Roman society, deepening the conflict.'
    ;
MERGE (o:Object {uuid: 'object_bassinet'})
    ON CREATE SET
        o.name = 'Bassinet',
        o.description = 'A bassinet located in a quieter corner of the Reception Hall, holding Caesonia and Caligula\'s newborn baby. It provides a focal point for a tender moment amidst the chaos, symbolizing maternal love and the innocence of new life.',
        o.purpose = 'To hold a baby.',
        o.significance = 'Symbol of innocence and maternal love amidst corruption.'
    ;
MERGE (o:Object {uuid: 'object_gift_for_baby'})
    ON CREATE SET
        o.name = 'Gift for the Baby',
        o.description = 'A modest token mentioned by Claudius as a \'little gift for the baby\'. Although not described in detail, it implies goodwill and traditional offering, highlighting Claudius\'s kindness in a corrupt environment.',
        o.purpose = 'Gift-giving.',
        o.significance = 'Symbol of Claudius\'s kindness and social grace.'
    ;
MERGE (o:Object {uuid: 'object_seashells'})
    ON CREATE SET
        o.name = 'Seashells',
        o.description = 'A collection of ordinary seashells brandished by Caligula as \'booty\' from his alleged victory over Neptune. Their mundane nature contrasts with the grandiosity of his claims, underscoring his delusional and erratic behavior.',
        o.purpose = 'Symbol of Caligula\'s \'victory\' over Neptune.',
        o.significance = 'Represents Caligula\'s madness and the absurdity of his reign.'
    ;
MERGE (o:Object {uuid: 'object_poisoned_fruit'})
    ON CREATE SET
        o.name = 'Poisoned Fruit',
        o.description = 'A mention of fruit laced with poison as a method Caligula might employ to eliminate his enemies. It underscores the pervasive treachery and paranoia within the Roman court where even gifts can hide fatal dangers.',
        o.purpose = 'Method of assassination (threat).',
        o.significance = 'Symbol of treachery and paranoia.'
    ;
MERGE (o:Object {uuid: 'object_gates_covered_way'})
    ON CREATE SET
        o.name = 'Gates of the Covered Way',
        o.description = 'Functional gates capable of being slammed shut from the outside to isolate the covered way from the corridor. They form a crucial tactical barrier in Cassius\'s assassination plan targeting Caligula.',
        o.purpose = 'To isolate and trap Caligula.',
        o.significance = 'Key component of the assassination plan.'
    ;
MERGE (o:Object {uuid: 'object_dice'})
    ON CREATE SET
        o.name = 'Dice',
        o.description = 'A pair of small, cube-shaped objects, typically crafted from ivory or wood, used in gambling. In this context, they symbolize the randomness of fate and Caligula\'s volatile, unpredictable behavior.',
        o.purpose = 'To play games of chance, determining outcomes based on rolls.',
        o.significance = 'Symbolizes the randomness of fate and Caligula\'s volatile disposition.'
    ;
MERGE (o:Object {uuid: 'object_sword'})
    ON CREATE SET
        o.name = 'Sword',
        o.description = 'Roman gladii, short double-edged blades wielded by Cassius and Sabinus. These swords function not only as weapons but also as symbols of rebellion, violence, and the brutal enforcement of regime change.',
        o.purpose = 'Weaponry and assassination.',
        o.significance = 'Instruments of rebellion and violence, symbols of regime change.'
    ;
MERGE (o:Object {uuid: 'object_tattered_purple_robe'})
    ON CREATE SET
        o.name = 'Tattered Purple Robe',
        o.description = 'A worn, tattered purple robe that symbolizes the fading imperial authority which Claudius reluctantly inherits. Once a mark of grandeur, it has been reduced to a shabby prop amidst the chaos following Caligula\'s rule.',
        o.purpose = 'To symbolize authority and power.',
        o.significance = 'Represents Claudius\'s accidental rise to power amidst chaos.'
    ;
MERGE (l:Location {uuid: 'location_palace_corridor'})
    ON CREATE SET
        l.name = 'Palace Corridor',
        l.description = 'The Palace Corridor is a dimly lit, stone passage within the sprawling Imperial Palace, characterized by echoing emptiness, oppressive atmosphere, and shadows clinging to arched ceilings and rough-hewn walls. It serves as a tense staging ground for conspirators finalizing their desperate plan to assassinate Caligula, charged with dramatic tension and the palpable threat of discovery.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    ON CREATE SET
        l.name = 'Imperial Palace Reception Hall',
        l.description = 'The Imperial Palace Reception Hall is a large, ornate chamber within the palace. It functions as a bustling hub of commerce and political interaction where deals are struck and favors exchanged amid the mingled scents of perfume, sweat, and ambition. Its numerous archways suggest a vast network of palace spaces beyond the immediate hall.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_council_chamber'})
    ON CREATE SET
        l.name = 'Council Chamber',
        l.description = 'The Council Chamber is a grand yet chaotic audience room where political machinations are palpable. Sunlight streams through high windows illuminating distressed officers and scattered maps. The flowing Tiber River visible through the windows adds a restless, foreboding atmosphere, reflecting the turbulent state of Rome.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_imperial_hall'})
    ON CREATE SET
        l.name = 'Imperial Hall',
        l.description = 'The Imperial Hall is an expansive, marble-lined thoroughfare connecting the inner palace with the public streets of Rome. Once vibrant with celebratory atmosphere, it now resonates with muted anger and disillusionment. Its cold marble and vastness amplify the sense of decay in Roman grandeur under Caligula’s hollow victory, symbolically linking the Emperor’s madness with the city at large.',
        l.type = 'Hall'
    ;
MERGE (l:Location {uuid: 'location_palace_elaborate_reception_room_dancing_pavilion'})
    ON CREATE SET
        l.name = 'Elaborate Reception Room/Dancing Pavilion',
        l.description = 'The Elaborate Reception Room/Dancing Pavilion is a stunningly decorated space within the palace. Echoing the recent sounds of a Greek ballet rehearsal, lavish curtains and ornate furnishings bathe in soft dawn light, juxtaposing the beauty and decadence of Roman society with the brewing political tensions.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_claudius_room'})
    ON CREATE SET
        l.name = 'Claudius\'s Room',
        l.description = 'Claudius\'s Room is a private chamber within the Imperial Palace that reflects the scholarly and secluded nature of its occupant. It is filled with scrolls and books in a genteel clutter, offering a relatively safe haven from the chaotic and dangerous court life, even as the outside threats intrude.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_imperial_box'})
    ON CREATE SET
        l.name = 'Imperial Box',
        l.description = 'The Imperial Box is an opulent space within the palace designed for imperial leisure and spectacle. Overlooking the arena, its lavish decorations and panoramic view of the games encapsulate the decadence and moral decay under Caligula’s rule, where the atmosphere is charged with tension and the unpredictable threat of imperial wrath.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_palace_covered_way'})
    ON CREATE SET
        l.name = 'Palace - Covered Way',
        l.description = 'The Palace - Covered Way is a stone passage sheltered by a roof, open on one side to the elements yet secluded. Serving as a zone for clandestine meetings or ambushes, its controlled access and tense ambiance set the stage for desperate confrontations unfolded under the threat of drawn swords and frantic cries.',
        l.type = 'Exterior Structure'
    ;
MERGE (l:Location {uuid: 'location_grand_throne_room'})
    ON CREATE SET
        l.name = 'Grand Throne Room',
        l.description = 'The Grand Throne Room is an imposing hall within the palace that, despite being ransacked, retains its grandeur. Overrun by soldiers including Praetorian Guards and German mercenaries, the room is rife with looting and fear as the once-absolute symbol of power—the throne—becomes merely a platform for plunder, while senators cower in terror.',
        l.type = 'Building'
    ;
MERGE (o:Organization {uuid: 'org_praetorian_guard'})
    ON CREATE SET
        o.name = 'Praetorian Guard',
        o.description = 'The Praetorian Guard is the elite military unit responsible for the personal safety of the Emperor and maintaining order within Rome. They are directly controlled by the Emperor and wield significant political influence.',
        o.sphere_of_influence = 'Imperial Rome'
    ;
MERGE (o:Organization {uuid: 'org_senate'})
    ON CREATE SET
        o.name = 'Senate',
        o.description = 'The Roman Senate is a political body composed of Rome\'s elite citizens. Historically wielding significant influence in governance, under Caligula\'s tyranny their power was diminished as they became largely a rubber-stamping force, representing the old guard of Roman power forced to endure the Emperor\'s unpredictable rage.',
        o.sphere_of_influence = 'Roman Politics'
    ;
MERGE (o:Organization {uuid: 'org_imperial_family'})
    ON CREATE SET
        o.name = 'Imperial Family',
        o.description = 'The Imperial Family refers to the relatives of the Emperor, specifically Caligula\'s close kin. They are viewed as a distinct political group and potential threat to any emerging regime, marking them as targets for elimination due to their association with the ruling figure.',
        o.sphere_of_influence = 'Roman Dynasty'
    ;
MERGE (ep:Episode {uuid: 'episode_hail_who?'})
    ON CREATE SET
        ep.title = 'Hail Who?',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'A Palace Scandal Unveiled',
        s.description = 'In a shadowed corridor within the Imperial Palace, religious austerity clashes with blatant decadence. Imperial notices and scandalous advertisements are haphazardly pinned to the walls near the Temple of Castor, creating a jarring juxtaposition of the sacred and profane. The air, thick with incense, carries an undercurrent of something far less holy, hinting at the moral corruption festering within. Claudius, accompanied by Calpurnia, initially shares a moment of lighthearted amusement over a letter from Herod, a brief respite from the oppressive atmosphere. However, the scene quickly turns to shock and outrage as Briseis bursts in with news of a scandalous brothel advertisement pinned to the temple door, revealing the depths of Caligula\'s depravity. This revelation forces Claudius to confront the emperor\'s blatant corruption and draws a line for himself, signaling his burgeoning resistance against the tyrannical regime. The scene serves to expose the thematic decay of Rome under Caligula and establish Claudius\'s initial, albeit personal, stand against it.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'Herod\'s Generous, Needling Gift',
        e.description = 'Claudius and Calpurnia are in the palace corridor, examining a scroll from Herod. Claudius reads aloud Herod\'s letter, which playfully chides him for living in poverty and encloses a \'small present.\' Calpurnia is curious about the gift, initially underwhelmed by its size. Upon closer inspection, she recognizes it as a set of dice, though she immediately notes they are crooked and unusable. Claudius chuckles fondly at Herod\'s familiar teasing, expressing his affection for his old friend. This lighthearted exchange momentarily distracts from the surrounding tension and establishes Claudius\'s modest circumstances and his connection to friends outside of Rome\'s immediate corruption.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: It's from Herod.", "CALPURNIA: What does he say?", "CLAUDIUS: \u201cMy dear old friend, what is all this I hear about you living in three rooms in the p-poor quarter of town? Is it serious? Why did you not write to me? Is it that absurd p-pride of yours? Well, I shall attend to that shortly. Meanwhile, knowing how loath you are to accept money and being the only p-practical friend you ever had, I enclose a little p-p-present for you. Please make proper use of it. Herod.\u201d", "CALPURNIA: What is it? It seems very small.", "CALPURNIA: Well, I don't think that's very generous... Venus! Oh, Claudius, I think your luck is changing. I'm sure it's an omen! ... Those dice are crooked. You can't possibly use them!", "CLAUDIUS: HaHaHa. Oh, dear Herod! How I miss him."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Scandalous Brothel Advertisement Shocks the Palace',
        e.description = 'Briseis rushes into the corridor, visibly agitated, interrupting the lighthearted moment between Claudius and Calpurnia. She presents Claudius with shocking news: a brothel advertisement has been pinned to the door of the Temple of Castor.  Briseis reports that these scandalous notices are appearing all over the city. Calpurnia is genuinely shocked and struggles to comprehend the audacity of a brothel being established within the palace itself.  The dialogue reveals the sheer scope of Caligula\'s depravity and the normalization of scandal within the imperial residence, highlighting the moral freefall of Rome under his rule. Calpurnia\'s shock underscores the unprecedented nature of this particular outrage.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["BRISEIS: Master. Master, have you seen this?", "CLAUDIUS: What?", "BRISEIS: It was pinned on the door of the temple of Castor.", "CLAUDIUS: What is it?", "BRISEIS: It's advertising a brothel in the palace! They're all over the city.", "CALPURNIA: A brothel? In the palace? But... But who is to serve in it?"]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'Claudius Refuses to Serve Caligula\'s Depravity',
        e.description = 'Calpurnia presses Claudius for answers, asking who is meant to serve in this palace brothel. Claudius reveals the horrifying extent of Caligula\'s plan: nobility, including senators and their wives, and even Caligula\'s own sisters and cousins are intended to be forced into prostitution. Calpurnia is astonished that Claudius was already aware of this atrocity and questions why he kept it from her, suspecting Caligula wants Claudius involved. Briseis expresses her outrage at the \'monster\' Caligula for forcing nobility into prostitution. In a moment of surprising candor, Calpurnia declares that prostitution is her profession and one she is not ashamed of, correcting Briseis’s assumption that she is now above such things. Despite Calpurnia\'s pragmatism, Claudius firmly states his refusal to participate in Caligula\'s brothel in any capacity, either as a doorkeeper or bouncer. He declares that there is a moral limit he will not cross, drawing a personal boundary against Caligula\'s corruption and signaling his burgeoning defiance.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: His sisters, his cousins, senators and their wives.", "CALPURNIA: You knew about it?", "CLAUDIUS: Yes.", "CALPURNIA: Why didn't you tell me?", "CALPURNIA: He wants you there?", "CLAUDIUS: He wants me to take the m-money on the door.", "CALPURNIA: Oh, Claudius.", "BRISEIS: The monster. The little monster. Forcing the nobility into prostitution. And in the palace! Why, even Calpurnia wouldn't serve in such a place, and that's her profession!", "CLAUDIUS: Briseis, that is not her profession any more!", "CALPURNIA: My dear, that was and is my profession. I'm a prostitute and I've never been ashamed of it.", "CLAUDIUS: All the same, I won't serve in his brothel! Either as d-doorkeeper or as chucker out. There's some price a man won't pay."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Desperation in the Reception Hall',
        s.description = 'The scene unfolds in the opulent yet oppressive Reception Hall of the Imperial Palace, where the air is thick with the mingled scents of perfume and perspiration, reflecting the moral decay of Rome\'s elite. Ornate decorations and a constant flow of people symbolize both commerce and treachery, making the chamber a cauldron of ambition and anxiety. As Sabinus and his terrified wife Diana plead with Claudius to spare her from a fate that lurks within the palace, the emotional atmosphere shifts from desperation to tension. Claudius, embodying the cold pragmatism of a ruler resigned to the empire\'s corruption, dismisses their pleas, revealing the brutal reality of a world where survival often entails moral compromises. The arrival of Caligula amplifies the chaos, as his manic laughter and delusions of grandeur loom over the characters, underscoring the ever-present threat of tyranny. This scene serves as a pivotal moment, introducing the moral complexities of power dynamics while foreshadowing the destructive ambition that will ensue. Themes of desperation, survival, and the corrupting influence of power interweave throughout, creating a rich tapestry of tension that propels the narrative forward.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_reception_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Sabinus Pleads for Diana\'s Safety',
        e.description = 'Sabinus stands nervously with his wife Diana, who is terrified at the prospect of entering the palace brothel. Desperate for Claudius\'s help, he appeals to him, revealing Diana\'s recent childbirth and the threat she faces if she is forced into the brothel. Despite his pleas, Claudius remains resolute, illustrating the harsh realities of their situation.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Claudius, I was told to bring her here but she's terrified.", "Claudius please listen. She's given birth six weeks ago. If somebody in there touches her I'm afraid of what she'll do.", "There must be a room or somewhere to put her. No one will notice. Please!"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Claudius Dismisses Sabinus',
        e.description = 'As tensions escalate, Claudius coldly dismisses Sabinus\'s pleas, emphasizing the lack of exceptions in the palace\'s morally ambiguous environment. His refusal to act compassionately reflects his internal conflict and the necessity of maintaining his standing amidst the empire\'s corruption.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Do you want my throat cut along with yours? Now you've paid your fee, go on in! Enjoy yourself.", "That's what I'm here for and that's what I'm doing."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Poppaea and Marcus Arrive',
        e.description = 'Poppaea, embodying the ruthless ambition of the court, approaches the couple with a predatory gaze. Marcus Vinicius, with his lecherous intentions, joins the scene, revealing the predatory nature of the environment and the commodification of women within it. This moment underscores the dehumanization prevalent in the palace, setting a grim tone for what is to unfold.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Ah, another customer. And we were just running out of men. Haha, real men. Sabinus, isn't it?", "Make him pay through the nose, my dear. You're worth it."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Claudius Confronts Marcus',
        e.description = 'Claudius intervenes, fiercely confronting Marcus as he attempts to take Diana, asserting his authority in a moment of moral clarity. This act of protection underscores Claudius\'s complex character, revealing a glimmer of compassion amidst the overarching corruption and chaos of the palace.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Chuck you out!", "Out! See him off the premises."]
    ;
MERGE (e:Event {uuid: 'event_2_5'})
    ON CREATE SET
        e.title = 'Diana\'s Escape and Caligula\'s Arrival',
        e.description = 'After successfully expelling Marcus, Claudius urges Diana to leave the palace unharmed. Just then, Caesonia enters, her worried demeanor highlighting the political tension and instability. Moments later, Caligula bursts in, filled with manic energy, setting a chaotic tone that threatens to engulf everyone present.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Go on. Go home.", "You are a good man, Claudius."]
    ;
MERGE (e:Event {uuid: 'event_2_6'})
    ON CREATE SET
        e.title = 'Caligula\'s Madness Unleashed',
        e.description = 'Caligula enters with a laugh, exuding madness and chaos. His erratic behavior and grandiose proclamations about war and conquest create an atmosphere of impending doom. The juxtaposition of his laughter against the serious undertones of the previous conversations amplifies the tension and foreshadows the violent upheaval that awaits in Rome.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["HaHaHa. 'Vulcan, with awkward grace his office plies...'", "I swear to fight a war against the Germans that will end in their total annihilation."]
    ;
MERGE (e:Event {uuid: 'event_2_7'})
    ON CREATE SET
        e.title = 'Claudius and Caesonia\'s Private Conversation',
        e.description = 'In the midst of the chaos, Caesonia draws Claudius into a quieter corner, revealing her vulnerability and affection for Caligula. Their discussion reflects the complexities of love and loyalty amid the ruins of imperial sanity, hinting at the psychological burdens shared by those entwined in the Emperor\'s erratic reign.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["Perhaps that you, alone among everyone... truly love him.", "He is more afraid than any of us."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Emperor\'s Divine Reprimand',
        s.description = 'The Council Chamber, usually a space of Roman order and authority, is thrown into disarray, reflecting the chaotic rule of Caligula. Sunlight spills into the room, illuminating scattered maps and anxious officers, their hurried movements underscoring the instability gripping Rome. The emotional atmosphere is thick with fear and tension as Caligula, in a state of divine delusion, holds court. His pronouncements swing wildly from reprimanding river gods to threatening envoys, creating an environment of utter unpredictability. This scene serves to dramatically underscore Caligula\'s descent into madness and the terror he instills in those around him. It highlights the theme of madness and tyranny, and the fragile nature of order under such erratic rule. The Tiber River, visible through the windows, becomes a silent witness to the unfolding absurdity, a constant reminder of the city Caligula governs with such capricious cruelty.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_council_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Divine Discourse with a River God',
        e.description = 'Caligula, in a state of self-proclaimed divinity, regales Cassius with a tale of reprimanding a river god. He claims the god threatened him, but Caligula swiftly put the deity in his place, demonstrating his absolute power even over nature itself. This bizarre pronouncement immediately establishes Caligula\'s delusional state and the absurd reality of his court, where even seasoned soldiers like Cassius must humor his emperor\'s madness.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CALIGULA: Cassius! I've just been talking to that river god. He threatened to drown me.", "CASSIUS: Does he know who you are?", "CALIGULA: Oh, he does now. I've just given him a severe reprimand. He'll soon shudder. Well, the river's going down, isn't it?", "CASSIUS: Yes, Caesar. Your uncle is here with Marcus Vinicius and Asprenas."]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'Envoys Arrive to a Hostile Welcome',
        e.description = 'Claudius, accompanied by Marcus and Asprenas, enters the Council Chamber to deliver the Senate\'s congratulations. Their arrival is immediately met with suspicion and hostility by Caligula, who fixates not on their diplomatic mission but on the missing carts carrying valuables. Caligula\'s volatile mood swings from demanding the carts to threatening Claudius\'s life for arriving \'empty-handed\', showcasing his utter disregard for protocol and rational thought. The scene quickly descends into a terrifying display of imperial capriciousness.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CALIGULA: Let them in.  The doors open, and CLAUDIUS (50s), MARCUS VINICIUS (40s), and ASPRENAS (40s) enter hesitantly. Claudius bows deeply.", "CLAUDIUS: Hail Caesar, Lord of the Heavens. The Senate and the people of Rome...", "CALIGULA: Where are my carts?", "CLAUDIUS: C-carts?"]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'Threat of Drowning and Accusation of Conspiracy',
        e.description = 'Caligula\'s rage escalates as he misinterprets Claudius\'s explanation about the carts arriving by road. He orders Claudius to be thrown into the river for arriving \'without\' them, demonstrating his impulsiveness and tyrannical nature. Shifting his paranoia to Marcus and Asprenas, Caligula accuses them of conspiring with Neptune against him, highlighting his descent into irrationality where perceived slights become evidence of treasonous plots against his \'divine\' authority. Fear grips the envoys as they face the emperor\'s unpredictable wrath.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CALIGULA: The carts, you idiot, with the valuables in them.", "CLAUDIUS: Oh, heaven bless Your Majesty, they're coming by road. They'll be a few days yet. We wanted to get here as soon, so we came across the water.", "CALIGULA: Oh, then back by water you'll go! Throw him in the river!", "CLAUDIUS: Oh, merciful god!", "CALIGULA: How dare you arrive without my carts?", "CLAUDIUS: But you only said the carts should come by road!", "CALIGULA: Take him onto the bridge and throw him off!", "CALIGULA: Did I not tell you that I've had a quarrel with Neptune? That he plagues me all the time with his sea noises, stirs the river gods up against me and makes war on me everywhere. How dare you ride with him!  He glares at Marcus and Asprenas.", "CALIGULA: Perhaps... Yes... Perhaps you plotted with him."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Saved by Homeric Verse',
        e.description = 'Facing imminent death, Marcus and Asprenas desperately plead for their lives. Claudius, surprisingly, interjects with lines from Homer, cleverly adapting them to flatter Caligula\'s inflated ego and \'divine\' status. He equates Caligula to Jove, and uses the verses to suggest that challenging Caligula is as futile as defying the king of the gods. This display of scholarly wit and quick thinking, combined with the opportune flattery, momentarily amuses and appeases Caligula, diverting his murderous intent.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CALIGULA: Cassius, give me your sword.", "MARCUS: Oh, please! In the name of my wife, your sister...", "CALIGULA: How dare you mention that whore to me?", "MARCUS: But what have we done?", "CALIGULA: I'll show the Senate what I think of their envoys! I'll send you back to Rome in pieces.", "MARCUS: No!", "CLAUDIUS: Oh... \"I felt the Thunderer's might, Hurled headlong down from the ethereal height, Breathless I fell, in giddy motions lost. The Sinthians raised me on the Lemnian coast.\" For \"Lemnian\" read \"Rhenium\".", "CALIGULA: Oh, by Jove! Which is always to say \"by myself\", this fellow knows his Homer.", "MARCUS: Please, Claudius, beseech the Emperor to save our lives.", "CLAUDIUS: \"Be silent and obey! Dear as you are, if Jove his arm extend, I can but grieve, unable to defend.\"", "CALIGULA: Look, if the next two lines are apt, then they're saved. If not, I'll have their throats cut.", "CLAUDIUS: \"What soul so daring in your aid to move, Or lift his arm against the might of Jove?\" For \"Jove\" read \"C-C...\""]
    ;
MERGE (e:Event {uuid: 'event_3_5'})
    ON CREATE SET
        e.title = 'A Reprieve and a Blanket',
        e.description = 'Claudius\'s clever recitation of Homer, with its flattering adaptation, successfully defuses the immediate threat. Caligula, amused and momentarily placated, declares Marcus and Asprenas \'saved by Claudius\' ready tongue\'. He invites them into another room, promising a blanket, a starkly mundane offer following his earlier homicidal rage. This abrupt shift underscores Caligula\'s unpredictable nature and the precariousness of life under his rule, where survival depends on navigating his erratic whims.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CALIGULA: Me! Oh, he's got a line for everything. Come on get up. You're saved. Saved by Claudius' ready tongue. HaHaHa. Come into the other room. I'll give you a blanket. Oh, Cassius."]
    ;
MERGE (e:Event {uuid: 'event_3_6'})
    ON CREATE SET
        e.title = 'The Watchword: \'Give Us a Kiss\'',
        e.description = 'As Caligula prepares to leave, Cassius, ever the soldier, requests the watchword for the night. Caligula, in another display of bizarre humor and casual cruelty, chooses \'Give us a kiss\', a watchword designed to humiliate the stoic Cassius. This seemingly trivial detail reveals Caligula\'s delight in demeaning even his most loyal officers and further emphasizes the atmosphere of absurdity and underlying menace that permeates his court. Cassius\'s impassive reaction masks a deep unease, hinting at the brewing resentment against Caligula\'s tyranny.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CALIGULA: Cassius. What is the watchword for tonight, Caesar?", "CALIGULA: Oh. The watchword for tonight? Let me see. What about \"Give us a kiss\"?"]
    ;
MERGE (e:Event {uuid: 'event_3_7'})
    ON CREATE SET
        e.title = 'Cassius\'s Grim Prophecy',
        e.description = 'Left alone briefly with Claudius, Cassius delivers a stark and chilling observation. He acknowledges the ever-present danger under Caligula\'s reign, stating that death could come at any moment, to anyone. His words, devoid of emotion yet heavy with foreboding, solidify the scene\'s tension and foreshadow the inevitable consequences of Caligula\'s madness. Cassius\'s grim determination hints at the growing unrest and the potential for rebellion against the tyrannical emperor.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["CASSIUS: It could have been just now. It could happen tomorrow or the next day to you or to me. But do not doubt it will happen one day."]
    ;
MERGE (e:Event {uuid: 'event_3_8'})
    ON CREATE SET
        e.title = 'Caligula\'s Cry-Baby Accusation and Torture Confession',
        e.description = 'Caligula returns, elaborating on his choice of watchword and revealing his cruel motivation: to humiliate Cassius, whom he calls a \'cry-baby\'. He recounts an incident where Cassius supposedly wept while witnessing torture, using this to justify his demeaning behavior and explain why he denied Cassius a command. This reveals Caligula\'s distorted perception of bravery and his enjoyment of psychological torment, even towards his most loyal soldiers. He then abruptly shifts to discussing his insomnia and questions Claudius about his sanity, further highlighting his paranoia and self-doubt beneath the facade of godhood.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["CLAUDIUS: Did that surprise you, the watchword that I gave to Cassius Chaerea?", "CLAUDIUS: Oh, I t-thought it was a j-j-joke.", "CALIGULA: Well, it was, but it's my joke, not his. I do it to annoy him. Every time he addresses a commander of the guard, he has to say \"Give us a kiss\"! Yesterday, I gave him \"Touch me, Titus\"!", "CLAUDIUS: Why, if I m-may ask, d-do you do that?", "CALIGULA: Because he's a cry-baby.", "CLAUDIUS: Cassius? I thought he was the b-bravest soldier in the army.", "CALIGULA: Oh, so did I, but he's not. I had him torture Gaetulicus to get some information out of him.., and Gaetulicus... Well we got no information out of him and he died under torture, and one of the guards told me that Cassius wept. Well, I was going to give him Macro's command, but I certainly didn't after that.", "CALIGULA: How many hours a night do you sleep?", "CLAUDIUS: Sleep? Oh, eight or n-nine, I suppose.", "CALIGULA: Well, I sleep barely three!"]
    ;
MERGE (e:Event {uuid: 'event_3_9'})
    ON CREATE SET
        e.title = 'Claudius Explains Divine Insomnia and Sanity',
        e.description = 'Claudius, adept at navigating Caligula\'s madness, offers a carefully constructed explanation for the emperor\'s insomnia and self-doubt. He attributes Caligula\'s lack of sleep to the strain of occupying a mortal body as a god, flattering Caligula\'s delusions while subtly deflecting the question of his sanity. He reassures Caligula that he is the \'standard of sanity\', expertly playing to the emperor\'s vanity and paranoia to ensure his own survival.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["CLAUDIUS: Do g-g-gods need more?", "CALIGULA: Do you think I'm mad?", "CLAUDIUS: M-m-mad?", "CALIGULA: Yes. Sometimes I think that I'm going mad. Do you...? Oh no, be honest with me, has that thought ever crossed your mind?", "CLAUDIUS: Never. N-never. Why, the idea is preposterous! You set the standard of s-sanity for the whole world.", "CALIGULA: Then why is there all this galloping in my head? And why do I sleep so little?", "CLAUDIUS: Well, um... it's your mortal disguise. You see, a physical b-body is a great strain if you're not used to it... which a god isn't. Um, err... And that explains too, I think... um... the three hours sleep. You see, undisguised gods never sleep at all"]
    ;
MERGE (e:Event {uuid: 'event_3_10'})
    ON CREATE SET
        e.title = 'Prophecy of a Hated God-Emperor and a Rhine Expedition',
        e.description = 'Caligula, momentarily reassured by Claudius\'s flattery, reveals his conviction that he is the prophesied god of the Jews, destined to die young and hated. He then abruptly shifts to planning a military expedition across the Rhine, envisioning triumphs against the Germans and a battle with Neptune himself. He commands Claudius to join him, dismissing him afterwards with a wave of his hand. This final outburst reveals Caligula\'s grandiose delusions, his obsession with divine status, and his detachment from reality, leaving Claudius to exit and Cassius to contemplate the grim implications of Caligula\'s madness.',
        e.sequence_within_scene = 10,
        e.key_dialogue = ["CALIGULA: Yes, you're probably right. But then if I'm a god, which of course I am, then why didn't I think of that? Anyway, whatever the reason, it's very hard to be a god. Oh, you do know that I am that all-powerful god whose coming the Jews have prophesied for centuries?", "CLAUDIUS: Oh, yes, yes, you told me. I feel very p-privileged to receive that information, especially as the Jews, apparently, don't know it.", "CALIGULA: Yes, but it's prophesied that he'll die young and hated by his own people.", "CLAUDIUS: No, I can't believe that. No. Not hated.", "CALIGULA: It's incredible, isn't it? It must be true. Uncle, I want you to come with us on this expedition. When we've auctioned the stuff in the carts... When they arrive! We shall cross the Rhine, defeat the Germans and then we shall march towards the sea and I shall do battle with my old enemy Neptune, and oh what triumphs I shall have when we return to Rome. Now you may leave me. I have a headache."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'Caligula\'s Return and Wrath',
        s.description = 'The scene unfolds in the vast, marble-lined Imperial Hall, resonating with the echoes of muted anger and disillusionment as CALIGULA, clad in ornate battle regalia, confronts a gathering of SENATORS. The hall\'s grandeur starkly contrasts with the palpable tension; senators display fear and resentment as they face their Emperor. CLAUDIUS and CAESONIA observe nearby, their expressions revealing concern amidst the chaos. Distant applause punctuates the atmosphere, underscoring the disconnect between Caligula\'s expectations and the reality of his return. This moment encapsulates the broader discontent in Rome, serving as a harbinger of the impending clash between the Emperor\'s madness and the senators\' cowardice. Themes of tyranny, powerlessness, and the fragility of authority resonate throughout the exchange, revealing character arcs and foreshadowing future conflict.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_hall'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Caligula Addresses the Senators',
        e.description = 'CALIGULA stands before a group of SENATORS, expressing outrage over their failure to celebrate his return. He humorously brandishes a handful of seashells, symbolizing the spoils of his naval conquests, and chastises the senators for their cowardice while he fought as a soldier. This absurdity highlights his unstable psyche while simultaneously reflecting the senators\' fear of his wrath.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Your Emperor is amongst you once again. All his wars successfully concluded...", "What did he find? This conqueror of the Germans, this victor over the mighty Neptune? The streets empty of crowds and flowers..."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Senators Tremble Under Threat',
        e.description = 'Amidst CALIGULA\'s tirade, one SENATOR attempts to explain the absence of celebrations by referencing a new temple built in his honor. CALIGULA, however, grows furious and threatens to sever their heads. CLAUDIUS intervenes, pleading for mercy and suggesting that the historical account of the day should not include bloodshed. This moment showcases Claudius\'s emerging role as a stabilizing force and highlights the senators\' desperation to appease the volatile Emperor.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Would you spoil the great day of your return by the spilling of blood?", "Think of your little daughter. One day when she is older, she will read the account of your return."]
    ;
MERGE (e:Event {uuid: 'event_4_3'})
    ON CREATE SET
        e.title = 'Marcus Vinicius Attempts Flattery',
        e.description = 'After some coaxing from CAESONIA, CALIGULA relents, lowering his hand and sparing the SENATORS. Following this tense moment, MARCUS VINICIUS approaches CALIGULA, seeking to flatter him by acknowledging the rightness of punishing the senators for their earlier celebrations. However, his remark regarding Agrippa, Caligula\'s grandfather, darkens the mood as CALIGULA\'s fury ignites once more, signaling a shift from flattery to danger.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["How right you were, Jove, to think of punishing them for celebrating the battle of Actium.", "Marcus Vinicius, you are no longer my friend."]
    ;
MERGE (e:Event {uuid: 'event_4_4'})
    ON CREATE SET
        e.title = 'Cassius\'s Warning',
        e.description = 'As the tension escalates, CASSIUS steps forward, using the opportunity to suggest that if MARCUS is no longer CALIGULA\'s friend, he can only be seen as an enemy. This exchange emphasizes the atmosphere of paranoia within the court, where alliances shift quickly under Caligula\'s mercurial rule. MARCUS\'s unease grows as he reflects on this warning, hinting at the dangerous games that are being played.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["If you're no longer his friend, what can you be but his enemy?", "If we all go our own way, we shall all end by going the same way."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Dawn Disrupted by Hasty Summons',
        s.description = 'The opulent reception room, adorned with lavish decorations and still resonating with the faint echoes of a Greek ballet rehearsal, is bathed in the soft, nascent light of dawn filtering through the tall windows. The atmosphere, moments ago serene and contemplative, is abruptly shattered by a series of loud, insistent knocks that reverberate through the spacious chamber. Claudius, caught off guard in this tranquil interlude, is startled by the sudden intrusion, his peaceful dawn shattered by an urgent, unseen summons. This scene serves as a sharp, jarring transition, pulling Claudius from a moment of quietude into the unfolding drama, hinting at an external force about to impinge upon his carefully constructed solitude and hinting at the escalating events of the day to come.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_elaborate_reception_room_dancing_pavilion'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Startled by Ominous Knocking',
        e.description = 'Claudius is within the lavish reception room, the air still subtly imbued with the lingering grace of a recent ballet rehearsal as dawn paints the room in soft hues. His peaceful contemplation is violently interrupted by a series of loud, insistent knocks emanating from off-screen. The sudden, sharp sounds shatter the tranquility of the early morning, jolting Claudius and filling the opulent space with an immediate sense of urgency and intrusion.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Yes. I'm coming! Oh, yes, yes, I'm coming, I'm coming, I'm coming."]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'A Urgent Call to Action',
        s.description = 'In Claudius\'s dimly lit room, the air feels thick with tension. The sparse furnishings reflect his scholarly life, but the atmosphere is charged with urgency as Calpurnia’s voice pierces the quiet. She stands off-screen, agitated, warning Claudius of potential assassins lurking nearby, her anxiety palpable. Claudius, caught off guard, cautiously opens the door, his confusion and trepidation evident in his stammering response. Cassius\'s commanding voice emerges from the shadows, demanding Claudius\'s immediate presence at the palace. The frantic urgency escalates as Claudius grapples with the implications of the moment, torn between his instinct for safety and the pressing call to face danger. This scene marks a pivotal moment in the narrative, highlighting the looming threat of violence and the characters’ need to confront their fate amidst the turmoil of Roman politics. Themes of loyalty, survival, and the chilling specter of assassination echo throughout this charged exchange.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Calpurnia\'s Warning',
        e.description = 'Calpurnia, in a state of agitation, implores Claudius not to leave his room, fearing for his safety against potential assassins. Her urgency sets the tone for the scene, emphasizing the heightened stakes surrounding Claudius\'s life.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Oh, Claudius, don't go. They could be assassins."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Claudius\'s Hesitation',
        e.description = 'Claudius, startled by Calpurnia\'s warning, cautiously opens the door, questioning who is there and what they want. His stammering reveals his anxiety and uncertainty about the situation, showcasing his vulnerability in the face of danger.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Who are you? What do you want?"]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'The Command to Hurry',
        e.description = 'Cassius announces himself outside the door, insisting that Claudius is wanted at the palace immediately. His authoritative tone adds urgency to the situation, pressing Claudius to act quickly despite the threat looming over him.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["You're wanted at the palace!", "Yes. Hurry up."]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Reluctant Compliance',
        e.description = 'Despite his fear, Claudius presses for details, displaying his confusion and reluctance to leave the safety of his room. Cassius urges him to forgo dressing and simply don a cloak, highlighting the gravity of the situation and the need for haste.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["W-Well, what's the matter?", "Never mind about dressing just throw on a cloak."]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'From Fear to Farce',
        s.description = 'In the pre-dawn hours, Claudius, Marcus, and Asprenas are held captive in the palace reception room, remnants of a dance performance lingering around them, amplifying the surreal atmosphere.  Anxiety hangs heavy as they await Caligula\'s whim, the opulent setting doing little to soothe their fear. The air shifts dramatically with Caligula\'s sudden, amused entrance. His capricious nature is immediately evident as he mocks Claudius\'s earnest reaction to a rehearsal, then, in a moment of cruel jest, decides to marry the young dancer, Messalina, to Claudius. What began as a terrifying wait morphs into an absurd spectacle, culminating in a forced betrothal announced with dark humor and a nonsensical watchword. Despite the farcical nature of the situation, a flicker of genuine connection sparks between Claudius and Messalina, offering a fragile hope amidst the surrounding madness, even as the looming threat of Caligula\'s unpredictable reign persists.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_elaborate_reception_room_dancing_pavilion'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Waiting in Fear',
        e.description = 'Claudius, Marcus, and Asprenas huddle together, their anxiety palpable as they contemplate their uncertain fate at the hands of Caligula. Hours crawl by in agonizing suspense, amplifying their dread. Marcus, in a moment of raw vulnerability, apologizes to Claudius for past mockery, seeking reconciliation in the face of potential death. Claudius, equally fearful, accepts the gesture, finding a small comfort in human connection amidst the terror.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MARCUS: How long...? How long have we been sitting here, do you think?", "CLAUDIUS: About t-t-two hours. It must be nearly light.", "MARCUS: What do you think he's going to do with us?", "CLAUDIUS: I don't know. I j-just hope it's q-quick, that's all.", "MARCUS: Claudius, I'm sorry I've made fun of you in the past.", "CLAUDIUS: Oh, it doesn't m-matter now.", "MARCUS: Will you give me your hand?", "CLAUDIUS: Thank you, that's a great comfort to me."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'A Song in the Silence',
        e.description = 'A hauntingly beautiful song drifts through the reception room, performed by a lone singer. The lyrics, about the dance between night and dawn, offer a poignant contrast to the men\'s fear and the oppressive atmosphere. Claudius, momentarily captivated, finds himself genuinely moved by the performance, a brief respite from the dread that consumes him and his companions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SINGER: Whenever the God of Night sleeps on.. The rosy-fingered goddess, Dawn.. Tiptoes on his domain.. And then she flits across the skies from star to star about.. She lightens darkness where she flies and blows Night's candles out.. Raging on her heels Night treads.. And tries to hold her fast.. And bring her loveliness to bed and ravish her at last.. And every night he once contrives to win a single kiss.. To win a single kiss.. Before the morning sun arrives.. To rob him of his bliss.. And now she turns and lightly treads.. On pillows everywhere.. She must awaken from their beds.. The secret lovers there.. But loath to part they linger there.. She urges them away.. Oh, Dawn, of goddesses most fair.. We worship you each day.. We worship you each day!"]
    ;
MERGE (e:Event {uuid: 'event_7_3'})
    ON CREATE SET
        e.title = 'Emperor\'s Mocking Praise',
        e.description = 'Caligula enters, observing Claudius\'s enthusiastic applause with amusement. He approaches Claudius, feigning interest in his enjoyment of the dance rehearsal. His praise is laced with condescension, subtly mocking Claudius\'s earnestness and highlighting the power imbalance between them. This sets a tone of capricious authority that foreshadows his bizarre pronouncements to come.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Oh, god of gods! Never have I witnessed a dance that gave me such p-profound s-spiritual joy!", "CALIGULA: Oh. Did you like it?", "CLAUDIUS: It was indesc-cribable.", "CALIGULA: Well, it was only a rehearsal.", "CLAUDIUS: Oh. W-whatever will the f-finished performance be like?", "CALIGULA: Get up. Come here."]
    ;
MERGE (e:Event {uuid: 'event_7_4'})
    ON CREATE SET
        e.title = 'A Marriage of Absurdity',
        e.description = 'Caligula, after scrutinizing Claudius, announces his outlandish plan: he will marry the dancer, Messalina, to Claudius. He revels in the absurdity of the pairing, emphasizing the mismatch between Messalina\'s beauty and Claudius\'s perceived inadequacies as a \'silly crippled old fool.\' This cruel joke underscores Caligula\'s tyrannical whims and his entertainment at the expense of others. Messalina is summoned, entering with evident apprehension, now a pawn in Caligula\'s twisted game.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CALIGULA: What did you think of the girl?", "CLAUDIUS: Oh, b-beautiful.", "CALIGULA: You old lecher!", "CALIGULA: Bring the girl back! I'm going to marry her to you tomorrow!", "CLAUDIUS: T-t-to me?", "CALIGULA: Mmm. I think it'd be very funny. All that loveliness married to a silly crippled old fool like you. I mean, what on earth would you do with it?", "CALIGULA: Oh, Messalina, come here. I'm going to marry you... to Uncle Claudius! And you can both come and live in the palace.", "MESSALINA: Thank you, Caesar."]
    ;
MERGE (e:Event {uuid: 'event_7_5'})
    ON CREATE SET
        e.title = 'Emperor\'s Watchword',
        e.description = 'Caligula, his bizarre decree delivered, announces his departure to \'shed more light,\' a grandiose and self-important statement. As a final, absurd touch, he declares the night\'s watchword to be the crude and nonsensical phrase, \'Bottoms up!\' This ridiculous pronouncement epitomizes his detachment from reality and the debasement of imperial authority under his reign. He exits laughing, leaving behind a stunned silence.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CALIGULA: And now I must away to shed more light. Oh, Cassius! Oh, yes. The watchword for tonight. \"Bottoms up!\""]
    ;
MERGE (e:Event {uuid: 'event_7_6'})
    ON CREATE SET
        e.title = 'Marcus\'s Defiance',
        e.description = 'Marcus, utterly disgusted by Caligula\'s crass behavior and the emperor\'s chosen watchword, offers a starkly contrasting alternative: \'Liberty.\' This single word is a quiet act of rebellion, a whispered defiance against Caligula\'s tyranny and a longing for a return to Roman ideals. It underscores the growing dissent and the simmering desire for liberation amongst those subjected to Caligula\'s madness.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["MARCUS: I give you another watchword - \"Liberty\"."]
    ;
MERGE (e:Event {uuid: 'event_7_7'})
    ON CREATE SET
        e.title = 'An Unlikely Union',
        e.description = 'Claudius, seemingly taking responsibility for the absurd situation, apologizes. Messalina, however, reassures him, confessing her genuine fear of Caligula and expressing a sense of safety in the prospect of marrying Claudius. She tentatively seeks affection, asking if he could ever love her. Claudius, in a surprising and sincere declaration, states that he is already in love with her, marking the unexpected beginning of a connection born out of fear and circumstance, yet hinting at a possibility for genuine affection.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["CLAUDIUS: I'm s-s-sorry.", "MESSALINA: Don't you want to marry me?", "CLAUDIUS: Well, it's j-just that I'm so much older than you.", "MESSALINA: I'd be very happy to be married to you. To tell you the truth, I was terrified when he brought me here. I thought he was going to... I'd feel safe being married to you. Do you think you could ever love me?", "CLAUDIUS: I think... I'm in l-l-love with you already."]
    ;
MERGE (e:Event {uuid: 'event_7_8'})
    ON CREATE SET
        e.title = 'Wedding Preparations Begin',
        e.description = 'Messalina, accepting her impending marriage to Claudius, announces her departure to prepare for the ceremony scheduled for the next day. Her goodbye to Claudius carries a newfound warmth. An usher formally announces the arrival of \'Tiberius Claudius Drusus Nero Germanicus, his family and friends,\' followed by the absurd pronouncement of \'the noble senator Incitatus,\' Caligula\'s horse, as part of the wedding party. Messalina welcomes Claudius and his unusual entourage, highlighting the farcical nature of the upcoming nuptials.',
        e.sequence_within_scene = 8,
        e.key_dialogue = ["MESSALINA: Well, if I'm to be married tomorrow, I must go home and get ready. Goodbye, Claudius.", "CLAUDIUS: G-g-g... g-goodbye.", "USHER: Tiberius Claudius Drusus Nero Germanicus, his family and friends.", "MESSALINA: Welcome, Tiberius Claudius Drusus Nero Germanicus, to you and your family and your friends.", "CLAUDIUS: I thank you, V-Valeria Messalina, for my family and my friends. And I thank you for m-myself.", "USHER: The noble senator Incitatus."]
    ;
MERGE (e:Event {uuid: 'event_7_9'})
    ON CREATE SET
        e.title = 'Senator Horse and Auspices Ordered',
        e.description = 'Caligula\'s voice echoes from off-screen, delivering a final sarcastic remark about Incitatus, his horse, being present at the wedding and highlighting the absurdity of his senatorial appointment. He then orders the auspices to be taken, signaling the imminent commencement of the wedding ceremony. The scene concludes on this note of chaotic farce, with Claudius and Messalina about to be bound together in a union orchestrated by Caligula\'s madness.',
        e.sequence_within_scene = 9,
        e.key_dialogue = ["CALIGULA (O.S.) You know everybody, don't you? Well, find yourself a place. He's never been to a wedding before. His life has really opened up since I made him a senator. Well, let the auspices be taken."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'The Conspiracy Deepens',
        s.description = 'In a dimly lit corridor of the Imperial Palace, shadows cling to the marble walls as CASSIUS, a battle-hardened soldier with a fierce determination, paces impatiently before his fellow conspirators MARCUS and ASPRENAS. The atmosphere is thick with tension as they discuss the urgent need to eliminate Caligula, revealing their fear and desperation in the face of impending doom. The narrowness of the corridor symbolizes their precarious situation—a tight space where every decision could lead to liberation or disaster. Outside, the final day of the Games looms, a chaotic backdrop that heightens the stakes of their plot. The conspiratorial whispers echo with betrayal and bravery, underscoring the intricate dance of loyalty and survival within a treacherous empire. This scene serves as a pivotal moment in the narrative, marking the clear escalation of the conspiracy against Caligula, revealing character motivations, moral dilemmas, and the dire consequences of inaction. Themes of tyranny, betrayal, and the struggle for freedom resonate deeply as they plot to reclaim Rome from madness.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Cassius Calls for Action',
        e.description = 'CASSIUS asserts his impatience, urging MARCUS and ASPRENAS to kill Caligula immediately. His conviction challenges their hesitations, illustrating the urgency of their situation. The tension rises as they weigh the risks of assassination against the looming threat of Caligula’s tyranny. CASSIUS’s passionate plea reveals his readiness to act, setting the tone for the subsequent discussions about their conspiracy.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Kill him. We've talked enough. I say kill him.", "It's risky."]
    ;
MERGE (e:Event {uuid: 'event_8_2'})
    ON CREATE SET
        e.title = 'The Plan Takes Shape',
        e.description = 'MARCUS expresses concern about the risk involved in the assassination, highlighting the presence of German guards. CASSIUS counters, insisting that risks must be taken to achieve their goal. This exchange deepens their conflict, emphasizing the stakes involved in their plot. The dialogue shifts as CASSIUS outlines a detailed plan for executing the assassination during the final day of the Games, showcasing his strategic mindset and determination.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["You can't kill a man without taking a risk.", "But those German guards never leave him."]
    ;
MERGE (e:Event {uuid: 'event_8_3'})
    ON CREATE SET
        e.title = 'Strategies and Risks',
        e.description = 'CASSIUS emphasizes the necessity of acting swiftly, urging MARCUS to persuade Caligula to use a specific exit. The group engages in tactical discussions about the assassination, debating how to isolate Caligula from his guards. This moment illustrates their resolve but also the moral complexity of their plan, as they weigh the lives of innocents against their desperate need for freedom from tyranny.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["You must be sure to be behind Caligula.", "As he steps out, into the covered way, you must stumble or drop something, anything to give us time to slam the gates from the outside."]
    ;
MERGE (e:Event {uuid: 'event_8_4'})
    ON CREATE SET
        e.title = 'The Weight of Consequences',
        e.description = 'ASPRENAS raises concerns about the implications of their plan, asking who else will die alongside Caligula. CASSIUS reassures them of his control over the situation, but the moral quandary lingers in the air. The tension escalates as they ponder the potential loss of innocent lives, underscoring the stakes of their rebellion and the grim reality of the choices they face.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Who dies with Caligula?", "The whole Imperial family, CAESONIA, the child, the two sisters... and dear old Uncle CLAUDIUS and his new wife."]
    ;
MERGE (e:Event {uuid: 'event_8_5'})
    ON CREATE SET
        e.title = 'Divided Loyalties',
        e.description = 'MARCUS expresses his reluctance to assassinate anyone other than Caligula, showcasing his internal conflict. This moment reflects the moral dilemmas faced by each conspirator, revealing the complexities of loyalty and survival under a tyrant\'s rule. CASSIUS ultimately concedes to target Caligula alone, demonstrating his adaptability and focus on the immediate goal of liberation.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["No, I don't want that.", "All right. Just Caligula."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'Dice with Destiny',
        s.description = 'Within the opulent yet tense confines of the Imperial Box overlooking the Games, Emperor Caligula, draped in imperial finery, indulges in a dice game with Claudius and Marcus. Sunlight streams into the box, illuminating the lavish setting but doing little to dispel the underlying tension. The roar of the crowd from the arena below occasionally punctuates the dialogue, a stark reminder of the brutal spectacle unfolding. Caligula\'s mood swings wildly with the roll of the dice, his frustration mounting as he loses. Claudius, ever the obsequious uncle, attempts to appease the volatile emperor, offering both money and \'lucky\' dice. Marcus observes the power play with a guarded demeanor. The atmosphere is thick with the unspoken threat of Caligula\'s unpredictable nature, each roll of the dice carrying not just monetary stakes, but the precarious balance of favor and imperial whim. This scene underscores Caligula\'s capricious tyranny and Claudius\'s careful navigation of the treacherous court, where even a friendly game can become a dangerous dance.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_box'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Caligula\'s Losing Streak',
        e.description = 'Frustration mounts as Caligula repeatedly loses at dice. He throws the dice down in exasperation, declaring he\'s out of money and done playing. His outburst reveals his petulant nature and ill-concealed rage at his misfortune, even in a trivial game. Claudius, with practiced subservience, immediately offers to lend him funds, attempting to placate the Emperor\'s sour mood and maintain a semblance of calm within the charged atmosphere of the Imperial Box.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CALIGULA: Oh, damn! I've lost all my money! I'm not playing any more.", "CLAUDIUS: Here, Lord, let me lend you some."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'A Gift of Lucky Dice',
        e.description = 'Claudius subtly pivots from offering a loan to presenting Caligula with a set of dice he claims were a gift from Herod and once belonged to Alexander the Great. He spins a tale of their legendary provenance, flattering Caligula by drawing a parallel between him and Alexander. This calculated move is designed to appeal to Caligula\'s vanity and superstitious nature, shifting the focus from his losing streak to the potential for a change in fortune. The roar of the crowd from the arena provides a dramatic soundscape to their tense exchange.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CALIGULA: Lend? You know how I hate running up debt.", "CLAUDIUS: Oh... well, have half of my set...", "CALIGULA: Accepted. ... Why am I so unlucky today! Unless of course it's your dice I'm playing with.", "MARCUS: My dice? Why should my dice be any different from any other?", "CLAUDIUS: Oh, a dice is a very personal thing. One man's dice may be lucky for himself, but not for his friend. Here, Lord, try these. They were sent to me by Herod. He claims they once belonged to Alexander the G-Great.", "CALIGULA: Really? I'd no idea that Alexander played dice.", "CLAUDIUS: He had many things in common with you, Lord.", "CALIGULA: What is it?"]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Caligula\'s Luck Turns (or So He Thinks)',
        e.description = 'Using Claudius\'s \'lucky\' dice, Caligula\'s fortunes seemingly reverse. He declares the dice are promising and starts winning, demanding everyone pay up. He credits Claudius for changing his luck, momentarily basking in the renewed thrill of victory. This quick turnaround reinforces Caligula\'s egocentric worldview, where even chance is interpreted through the lens of his own importance. Marcus, attempting to lighten the mood, suggests food, but Caligula, now energized by his perceived good fortune, is too engrossed in the game.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: He had many things in common with you, Lord.  **SOUND** of a crowd roaring.", "CLAUDIUS: He's got the Thracian down. The crowd want him spared, they've turned their thumbs up.", "CALIGULA: The Thracian? If they only had one neck, I'd hack it through. ... I never did like that Thracian. He's lost me a lot of money over the last year. Alexander, you say? Well, let's see. By Jove, which is always to say \"by myself\", that looks promising. Come one, pay up, everybody. I think I'm indebted to you, Uncle. You've changed my luck.", "CLAUDIUS: Oh, some dice are fit only for gods to throw.", "MARCUS: What about something to eat? Is Caesar hungry?", "CALIGULA: No. ... Oh, I see what you mean! These dice were made for me."]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Raising the Stakes and Shifting the Debt',
        e.description = 'Caligula, emboldened by his winning streak, dramatically raises the stakes to 3,000, turning the game into a high-stakes affair. He pointedly accuses Marcus of harming him with his previous dice, further highlighting his paranoia and tendency to blame others for his misfortunes. When Claudius claims to be out of funds, Caligula, in a display of imperial entitlement, declares he will take an IOU and suggests leveraging the wealth of Claudius\'s new wife to cover the debt. This final act underscores Caligula\'s tyrannical reach, extending his demands even into Claudius\'s personal life and finances, leaving Claudius in a vulnerable and indebted position.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CALIGULA: Come on, pay up again. You did me a lot of harm with those dice, Marcus. And I'm raising the stakes to 3,000.", "CLAUDIUS: I've r-run out of money, Lord.", "CALIGULA: Well, that doesn't matter. Your new wife's got plenty. I'll take an IOU. Come on, pay up."]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Preparations for Revolution',
        s.description = 'In the dimly lit Palace Corridor, tension thickens the air as Cassius, a determined conspirator, meticulously checks his sword, the weight of impending action heavy on his shoulders. The corridor, lined with cold marble, echoes with whispers of ambition and rebellion. Sabinus, visibly anxious, stands nearby, embodying the anxiety of the moment. The atmosphere is charged with urgency; shadows flicker along the walls, hinting at the chaos that awaits. Outside, the distant sounds of the Games reverberate through the palace, a cruel distraction from their grim purpose. This scene marks a critical juncture in the narrative, as Cassius and Sabinus prepare for a decisive confrontation against Caligula\'s tyranny, illuminating themes of loyalty, courage, and the quest for freedom amidst the oppressive atmosphere of Roman politics.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Cassius Prepares for Action',
        e.description = 'Cassius steels himself for the impending confrontation, checking his sword with a resolute determination. His command over the situation is apparent as he reveals that he has stationed guards to block any potential interruptions, displaying both foresight and leadership. The urgency in his actions reflects the critical nature of their mission, suggesting a readiness to face the consequences of rebellion. As Sabinus expresses concern about the timing of their actions, the gravity of their plot against Caligula becomes increasingly palpable, foreshadowing the violent upheaval that lies ahead.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I've posted guards at both ends and told them to prevent anyone coming through here.", "Jove himself couldn't stop me."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'A Game of Suspicion',
        s.description = 'The opulent Imperial Box, high above the Games, becomes a claustrophobic stage for Caligula\'s capricious whims. Sunlight streams in, illuminating the tension etched on the faces of Claudius and Marcus as Caligula, flushed with a recent victory in some unseen game, toys with them. The atmosphere shifts from superficially playful to menacingly suspicious as Caligula\'s attention narrows on Marcus\'s unease. Laughter hangs in the air, but it\'s brittle, edged with the threat of imperial displeasure. This scene is a pressure cooker, highlighting the constant fear and precariousness of life under Caligula\'s rule. It reveals Caligula\'s paranoia and sharpens the focus on Marcus, planting seeds of doubt about his loyalty and foreshadowing potential conflicts to come. The underlying theme is the ever-present danger of Caligula\'s unpredictable nature and the survival tactics employed by those around him.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_box'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Dismissal of Play and Shifting Mood',
        e.description = 'Caligula, basking in the afterglow of a presumed victory, abruptly declares an end to their game, sensing a shift in the mood. He pivots to the spectacle of the Games, a typical Roman distraction, but his tone suggests a deeper unease, a subtle probing of the others\' reactions.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CALIGULA: Well, I can see you don't want to play any more. You only like playing when you're winning. Shall we watch the Games for a while?"]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Evasive Suggestion and Imperial Whim',
        e.description = 'Marcus, attempting to diffuse the charged atmosphere, suggests a change of pace—a swim and a meal. Caligula curtly dismisses this, his disinterest palpable. He then turns his attention to Claudius, his tone shifting from petulant to deceptively amiable as he inquires about granting a \'small favor,\' a loaded request under a tyrant\'s rule.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MARCUS: What about a swim and then something to eat?", "CALIGULA: No, I don't think so. I don't feel very hungry today but I've had a wonderful morning, Uncle, thanks to you.. Is there any small favor I could grant you?"]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Claudius\'s Sycophantic Dodge',
        e.description = 'Claudius, ever the survivor, interprets Caligula\'s \'favor\' as a potential trap. He deflects with elaborate, stammering praise, attributing his happiness to witnessing Caligula\'s joy, cleverly turning the emperor\'s vanity into a shield. He meticulously avoids asking for anything, understanding the danger of making any request of Caligula.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["CLAUDIUS: Oh, Lord, please, regard it as a small return for the g-great happiness you've given me with my new wife.", "CALIGULA: Happiness? She wasn't supposed to make you happy, nor you her. It was meant to be a joke!", "CLAUDIUS: Oh, no, no. You misunderstand me. No, no. What I meant was that my happiness comes from contemplating yours. To be the cause of s-so much merriment is the source of d-deepest satisfaction to me."]
    ;
MERGE (e:Event {uuid: 'event_11_4'})
    ON CREATE SET
        e.title = 'Cruel Joke and Shifting Suspicion',
        e.description = 'Caligula reveals the cruel underbelly of his \'gift\' to Claudius – the marriage was intended as a joke, a source of amusement for him at Claudius\'s expense. This casual cruelty underscores his tyrannical nature. Abruptly, his attention snaps to Marcus, noticing his attempt to leave and questioning his motives, suspicion now taking root.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CALIGULA: Happiness? She wasn't supposed to make you happy, nor you her. It was meant to be a joke!", "CALIGULA: Where are you going, Marcus?"]
    ;
MERGE (e:Event {uuid: 'event_11_5'})
    ON CREATE SET
        e.title = 'Nervous Excuse and Overt Suspicion',
        e.description = 'Marcus, visibly flustered under Caligula\'s sudden scrutiny, offers a flimsy excuse about digestive troubles. Caligula dismisses it with thinly veiled contempt, his suspicion hardening into open accusation. He voices his observation of Marcus\'s nervous behavior directly, demanding an explanation without uttering the question directly.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["MARCUS: To tell the truth, Lord, nature calls. It must've been something I ate last night.", "CALIGULA: Don't look at me. If I decide to doctor your food, you won't have to wait until morning to find out. ... That's odd. He wanted to eat a moment ago. His behavior's very strange lately."]
    ;
MERGE (e:Event {uuid: 'event_11_6'})
    ON CREATE SET
        e.title = 'Universal Fear and Abrupt Exit',
        e.description = 'Claudius again attempts to defuse the situation, offering a general explanation for Marcus\'s nervousness – everyone is afraid of Caligula. It’s a truth universally acknowledged in this court, yet Caligula, in his self-absorbed madness, claims incomprehension. He abruptly dismisses the conversation and exits, leaving Claudius alone in the unsettling silence, the weight of Caligula\'s paranoia hanging heavy in the air.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["CLAUDIUS: Strange?", "CALIGULA: Well, nervous. What has he got to be nervous about?", "CLAUDIUS: We're all nervous in your presence, Lord.", "CALIGULA: I've never been able to understand that. ... Excuse me. Thank you."]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'Desperation and Deceit',
        s.description = 'In the tense corridor of the Imperial Palace, the atmosphere is charged with urgency and fear. The walls, adorned with lavish decorations that reflect the empire\'s glory, echo the frantic footsteps of MARCUS as he bursts in, visibly sweating. This physical manifestation of anxiety underscores the high stakes of the situation, where every moment counts in a perilous game of survival. The lighting is dim, casting long shadows that mirror the moral ambiguity of the characters\' intentions. The emotional atmosphere is fraught with desperation as CASSIUS, fueled by anger and a desire for vengeance, suggests a radical course of action: the assassination of Caligula. MARCUS, driven by a protective instinct, attempts to reason with him, revealing the tension between loyalty and pragmatism. The scene serves as a pivotal moment in the narrative, highlighting the simmering conflict within the empire and the characters\' moral dilemmas. It encapsulates themes of ambition, treachery, and the lengths to which one will go to reclaim power. The characters\' dialogue, filled with urgency and conflicting motivations, propels the story forward toward the looming confrontation.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Marcus Urges Caution',
        e.description = 'MARCUS bursts into the corridor, sweating profusely and conveying urgent news about Caligula\'s refusal to eat. His words reflect a deep concern for the emperor\'s state and the implications for their plans. He insists that the proposed plan cannot proceed under such conditions, indicating the precariousness of their situation and the high stakes of their actions.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["He doesn't want to eat. We'll have to put it off, it won't work."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Cassius\'s Fury',
        e.description = 'In a moment of heated desperation, CASSIUS declares his intent to kill Caligula. His raw emotion and willingness to resort to violence exemplify the intense pressure he feels and the lengths he is prepared to go to end the tyranny. This bold declaration serves as a critical turning point, showcasing the drastic measures the conspirators are willing to consider.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Then I'll go in and kill him where he sits!", "What's that to me? But I'll call on you for help before they do."]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Marcus\'s Plea for Strategy',
        e.description = 'MARCUS counters CASSIUS\'s impulsive plan with a strategic suggestion, proposing to tell Caligula that his Greek ballet has arrived, hoping to coax the emperor out into a more favorable situation. This moment highlights Marcus\'s tactical thinking and concern for the consequences of rash actions, juxtaposing his cautious approach against Cassius\'s fiery temperament.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["No, wait! I'll tell him his Greek ballet have arrived. He'll come out for that.", "Anything. But get him out here!"]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'The Bait of the Ballet',
        s.description = 'Inside the opulent Imperial Box, amidst the roaring spectacle of the Games, a subtle but deadly plot unfolds. Marcus returns to Caligula, feigning nonchalance, and announces the arrival of a \'Greek ballet\' prepared to perform in the Emperor\'s honor. The air in the box is thick with false pretenses as Marcus subtly guides Caligula towards the rear exit, away from the crowded front, under the guise of leading him to the performers. Caligula, vain and easily swayed by the promise of entertainment and adoration, eagerly accepts the bait, his suspicion completely disarmed. This scene serves as the crucial setup for the impending assassination, drawing Caligula away from public view and directly into the conspirators\' trap. The atmosphere is charged with a deceptive calm, a stark contrast to the violent act about to erupt, as the stage is set for the tyrant\'s downfall.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_box'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'The Greek Ballet Ruse',
        e.description = 'Marcus returns to the Imperial Box, attempting to appear casual despite the gravity of the impending assassination. He informs Caligula that Cassius has announced the arrival of a Greek ballet troupe, ostensibly ready to perform in Caligula\'s honor. Marcus subtly suggests that these dancers are waiting outside, ready to greet and perform for the Emperor, setting the stage for luring Caligula away from the safety of the box.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MARCUS: Lord, Cassius informs me your Greek ballet is here.", "CALIGULA: Greek ballet? Where are they?", "MARCUS: Waiting outside to greet you."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'Tyrant Lured to His Doom',
        e.description = 'Caligula, intrigued and vain, readily accepts the premise of the ballet performance. Marcus elaborates that the dancers are waiting at the rear of the Imperial Box, away from the crowded front, to perform a dance in his honor. Flattered by the idea of a private performance and even envisioning himself joining the dance, Caligula agrees to go and meet the dancers. He is willingly led by Marcus out of the Imperial Box, unknowingly walking directly into the trap laid by the conspirators, sealing his fate as he steps away from public view and towards his assassins.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CALIGULA: Bring them in and present them. Oh, just the boys. The girls can wait.", "MARCUS: Lord, they say that they have prepared a dance in your honor which they wish to perform for you outside.", "CALIGULA: Oh well, in that case, we mustn't disappoint them. Shall we go and see what they've prepared?", "MARCUS: Lord, they're at the rear, the front is too full of people.", "CALIGULA: Well, if they're as good as people say they are, I might let them dance with me.  CALIGULA leads the way out."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'The Confrontation of Liberty',
        s.description = 'In the tense atmosphere of the covered way outside the palace, the air is thick with impending violence. The grand architecture of the Imperial Palace looms in the background, its once-majestic facade now a reminder of crumbling authority. Caligula, draped in the vestiges of his power, steps into the scene, oblivious to the fate that awaits him. Cassius and Sabinus stand resolutely, swords drawn, embodying the spirit of rebellion. The emotional atmosphere is charged with fear and exhilaration; Caligula’s frantic denial of his mortality and pleas for mercy clash with the cold determination of his assailants. The time is set in a dimly lit dusk, underscoring the gravity of the moment. This scene marks the climax of rebellion against tyranny, as Caligula\'s delusions of divinity collide with the harsh reality of his impending demise. Themes of liberation, the struggle for power, and the fragility of life echo throughout this pivotal moment in Rome’s history.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_covered_way'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Cassius Declares Liberty',
        e.description = 'Cassius confronts Caligula with the declaration of \'Liberty!\' as the watchword of their rebellion, revealing the depth of their resolve to end his tyrannical reign. This pivotal moment signifies the shift from fear to action, as Cassius takes a stand against the perceived divinity of Caligula.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["The watchword, butcher, is 'Liberty!'"]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Caligula\'s Desperation',
        e.description = 'In a frantic bid for survival, Caligula pleads, proclaiming his divinity and fearfully cries out for Drusilla. His desperate attempts to assert his status as a god paint a tragic picture of a ruler stripped of power and facing his mortality. This event highlights the madness that has enveloped him and the stark contrast between his self-perception and the reality of his situation.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh no! ... No you can't, I'm a god! I'm a god! You can't kill me! ... Drusilla! I'm dying!"]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'The Final Command',
        e.description = 'Cassius issues the final order to finish Caligula, a decisive moment that signifies the culmination of their rebellion. This command represents the turning point in their struggle, as the conspirators are finally prepared to act and reclaim their agency from their tyrant.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Finish him!"]
    ;
MERGE (e:Event {uuid: 'event_14_4'})
    ON CREATE SET
        e.title = 'Sabinus\'s Tribute',
        e.description = 'Sabinus reveals the personal stakes of their rebellion by stating that the attack is for their wives, reminding the audience of the familial ties and emotional burdens that drive the conspirators. This moment emphasizes the human cost of Caligula\'s tyranny and deepens the narrative\'s emotional resonance.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["This is from our wives, Jove."]
    ;
MERGE (e:Event {uuid: 'event_14_5'})
    ON CREATE SET
        e.title = 'Claudius\'s Realization',
        e.description = 'As the chaos unfolds, Claudius steps in, horrified by the turn of events. He shouts in disbelief, realizing that Caligula is being killed right before him. This moment signifies Claudius\'s complex relationship with power and his place in the turmoil, as he is thrust into a situation beyond his control.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["You fools! You've let them kill him! Your Emperor! After them!"]
    ;
MERGE (e:Event {uuid: 'event_14_6'})
    ON CREATE SET
        e.title = 'Caesonia\'s Panic',
        e.description = 'In a moment of desperation, Caesonia calls out for Cassius, revealing the personal connections and the stakes involved in the chaotic unfolding of events. Her panic over the safety of their child underscores the personal costs of political strife and the treacherous world they inhabit.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["Oh, Cassius. Cassius, what's happened? Where has everybody gone? No, not the baby! No!"]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'Hail to the Unwilling Emperor',
        s.description = 'The Grand Throne Room, once the heart of Roman power, is now desecrated, echoing with the chaotic sounds of looting. Sunlight streams in, illuminating the debris and the scrambling figures of Praetorian and German soldiers seizing valuables. Senators, symbols of the old order, huddle in fear, their authority evaporated. The air is thick with the dust of ransacked treasures and the raw energy of opportunism. This scene marks the immediate aftermath of Caligula\'s assassination, plunging Rome into a power vacuum. It is a moment of raw, ungoverned impulse where the pragmatic concerns of the Praetorian Guard collide with Claudius\'s scholarly detachment, resulting in his absurd and unwanted elevation to Emperor. The scene highlights the themes of chaos and order, the fickle nature of power, and the unexpected ascent of the reluctant hero.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_grand_throne_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Looting the Spoils of Power',
        e.description = 'The Grand Throne Room is overrun by soldiers, a chaotic mix of Praetorians and Germans, indulging in unrestrained looting. They ransack chests, overturn furniture, and jostle senators aside in their frenzied search for valuables. The throne, stripped of its symbolic power, serves merely as a platform for plunder, highlighting the collapse of order and the raw grab for immediate gain following the emperor\'s assassination. The scene establishes the atmosphere of anarchy and opportunism that permeates the power vacuum.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["SERGEANT: This way lads. The main room, hurry, There's some stuff in here. Hurry up, lads! Take what you can. Let's get out before the Germans come. Get anything you can take. Check it's got gold in it."]
    ;
MERGE (e:Event {uuid: 'event_15_2'})
    ON CREATE SET
        e.title = 'Claudius Mistaken for Assassin',
        e.description = 'Amidst the looting, Gratus, a Praetorian Guard, spots Claudius cowering amongst the senators and mistakenly identifies him as one of Caligula\'s assassins. Driven by anger and fear for their own future without an Emperor, Gratus aggressively confronts Claudius, threatening violence. This moment of mistaken identity sets the stage for the absurd turn of events, highlighting the guards\' desperation for stability and their lack of discernment in the chaotic aftermath.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["GRATUS: Here's one of them. It's one of the assassins!", "CLAUDIUS: N-no! Don't kill me, s-sir, I b-beg you! I had nothing to do with it!", "GRATUS: You bastard. Kill our beloved Emperor, would you? Put us all out of work?"]
    ;
MERGE (e:Event {uuid: 'event_15_3'})
    ON CREATE SET
        e.title = 'Sergeant Recognizes Claudius and Intervenes',
        e.description = 'The Sergeant, arriving on the scene, swiftly corrects Gratus\'s error, recognizing Claudius not as an assassin but as the Emperor\'s uncle and Germanicus\' brother. He dismisses Claudius as harmless due to his physical disabilities, ordering Gratus to leave him alone. The Sergeant\'s intervention offers Claudius temporary relief but also underscores the low esteem in which Claudius is held, seen as insignificant and easily dismissed, unaware of the destiny about to be thrust upon him.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["SERGEANT: Wait a minute, Gratus, that's not an assassin. It's the Emperor's uncle, Germanicus' lame old brother. He's harmless. Leave him alone, can't you see he's crippled. Come on, sir, get up. We won't harm you.", "CLAUDIUS: Thank you.", "SERGEANT: There, you see, the lads are a bit angry, sir. Without an Emperor, there's no Praetorian Guard, and it's back to the army for the lot of us."]
    ;
MERGE (e:Event {uuid: 'event_15_4'})
    ON CREATE SET
        e.title = 'Guards Propose Claudius as Emperor',
        e.description = 'As Claudius expresses his desire to find his wife and attempts to leave, Gratus, driven by a pragmatic desperation, suggests the unthinkable: making Claudius the new Emperor. The Sergeant initially scoffs at the idea, dismissing Claudius as a simpleton. However, Gratus persists, arguing that Claudius is \'better than nothing\' in the current chaotic power vacuum. This casual, almost accidental suggestion marks the turning point where Claudius\'s fate is unexpectedly and absurdly sealed.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["CLAUDIUS: I m-must go and f-find my wife.", "SERGEANT: Of course, you must sir. Gratus, take a couple of lads and go with this gentlemen!", "GRATUS: Why can't we have him for an Emperor?", "SERGEANT: What? Old Claudius? Don't be stupid, lad. He's a simpleton. He's...", "GRATUS: I don't know, he's better than nothing."]
    ;
MERGE (e:Event {uuid: 'event_15_5'})
    ON CREATE SET
        e.title = 'Claudius Rejects Imperial Crown, Declares Republic',
        e.description = 'Claudius, horrified by the suggestion, vehemently rejects the idea of becoming Emperor, passionately declaring his desire for a Republic. This outburst of republican idealism, utterly out of sync with the Praetorian Guards\' self-serving motives, is met with laughter by the Sergeant. Claudius\'s genuine aversion to power and his scholarly ideals are starkly contrasted with the brutal pragmatism of the soldiers, setting up the central irony of his unwilling reign.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CLAUDIUS: No, no! I don't want to be Emperor! I want a Republic!", "SERGEANT: You a member of the Imperial family, sir? Don't make me laugh!"]
    ;
MERGE (e:Event {uuid: 'event_15_6'})
    ON CREATE SET
        e.title = 'Praetorians Proclaim Claudius Emperor',
        e.description = 'Ignoring Claudius\'s protests, the Sergeant, seizing the opportunity, announces to the other soldiers that they have found an Emperor. This pronouncement is amplified by Gratus, who enthusiastically embraces the idea. The arrival of a German Guard adds a layer of potential conflict, but Gratus quickly defuses it by declaring Claudius as \'Kaiser,\' Emperor, to the German as well. The Praetorians, motivated by self-preservation and the desire for continued employment, forcefully impose the imperial mantle upon the bewildered Claudius.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["SERGEANT: Hey, lads! We've found an Emperor!", "GERMAN GUARD: Das ist eine! Da achtung!", "GRATUS: Wait a minute, Just a minute, Herman. That's our new Emperor. Kaiser! Emperor!", "GERMAN GUARD: Ja?", "GRATUS: Ja!"]
    ;
MERGE (e:Event {uuid: 'event_15_7'})
    ON CREATE SET
        e.title = 'Forced Ascension and Grotesque Coronation',
        e.description = 'The Praetorian Guards hoist the terrified and protesting Claudius onto their shoulders, physically forcing him into the role of Emperor. Gratus attempts to reassure Claudius, dismissing his fears and promising that he will \'get used to it.\' In a final act of absurd coronation, Gratus grabs a tattered purple robe from the looted goods and throws it over Claudius, a pathetic and ironic symbol of imperial power. Claudius\'s desperate pleas are drowned out by the growing chants of \'Long live the Emperor!\', culminating in a grotesque forced smile, highlighting the tragicomic and involuntary nature of his ascension.',
        e.sequence_within_scene = 7,
        e.key_dialogue = ["GRATUS: Lift him up, lads! Long live the Emperor Claudius!", "CLAUDIUS: No! Put me down! Put me down!", "GRATUS: Oh, don't worry, sir, you'll get used to it. It's not such a bad life. Put this on him.", "CLAUDIUS: Put me down! I don't want to be an Emperor! I w-want a Republic.", "GRATUS: Don't keep saying that, sir. Not in front of the Germans, they'll slit your throat. Now, come on, smile. Smile. That's it, that's it. Look happy. Long live the Emperor!"]
    ;
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_scroll_from_herod'}),
          (a:Agent {uuid: 'agent_tiberius_claudius_drusus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_bassinet'}),
          (a:Agent {uuid: 'agent_caesonia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_gift_for_baby'}),
          (a:Agent {uuid: 'agent_tiberius_claudius_drusus_nero_germanicus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_seashells'}),
          (a:Agent {uuid: 'agent_caligula'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_poisoned_fruit'}),
          (a:Agent {uuid: 'agent_caligula'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_dice'}),
          (a:Agent {uuid: 'agent_caligula'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (o:Organization {uuid: 'org_praetorian_guard'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus_nero_germanicus'}),
          (o:Organization {uuid: 'org_imperial_family'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_from_herod_event_1_1'})
    ON CREATE SET
        oi.description = 'The scroll from Herod serves as the central prop that initiates the event. Claudius receives and unfolds the scroll, reading aloud its contents to Calpurnia. The scroll contains a playful, needling letter from Herod, teasing Claudius about his supposed poverty and including a gift of dice. The scroll\'s contents drive the dialogue and reveal information about Claudius\'s past relationship with Herod, his current modest living situation, and his character. It acts as a catalyst for a brief moment of lightheartedness before the scene transitions to the darker revelation of the palace brothel.',
        oi.status_before = 'The scroll is unopened and newly arrived from Jerusalem, delivered to Claudius. Its contents and the nature of the \'present\' are unknown to both Claudius and Calpurnia at the start of the event.',
        oi.status_after = 'The scroll has been read aloud by Claudius, and its message and the enclosed dice have been examined and discussed by both Claudius and Calpurnia. The scroll has served its narrative purpose of delivering Herod\'s message and gift and is likely still in Claudius\'s possession, now unfolded and its contents known.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll_from_herod'})
    MATCH (e:Event {uuid: 'event_1_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_brothel_advertisement_event_1_2'})
    ON CREATE SET
        oi.description = 'The brothel advertisement serves as a catalyst for the event, shocking Claudius and Calpurnia while symbolizing the moral decay infiltrating the palace. Pinned on the door of the Temple of Castor, it signifies the audacity of Caligula\'s regime, showcasing the normalization of scandal and depravity in a once-sacred space.',
        oi.status_before = 'Prior to the event, the brothel advertisement is a mere piece of paper, unnoticed and unaddressed, representing the hidden corruption within the palace.',
        oi.status_after = 'Following the event, the brothel advertisement becomes a focal point of outrage and discussion, symbolizing the decline of the moral fabric of Rome and the urgent need for characters like Claudius and Calpurnia to confront the reality of their situation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_brothel_advertisement'})
    MATCH (e:Event {uuid: 'event_1_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in a palace corridor, holding and reading aloud from a scroll to Calpurnia. He gestures slightly with the scroll as he reads, his focus shifting between the text and Calpurnia, occasionally pausing to chuckle at the contents of Herod\'s letter and to examine the enclosed gift of dice with mild curiosity and affection.',
        ap.emotional_state = 'Claudius is in a relatively lighthearted and amused mood, evident in his chuckling and fond remarks about Herod. There\'s a sense of warmth and nostalgia as he reads the letter from his old friend, momentarily lifting his spirits from the likely grim atmosphere of the palace. However, a subtle undercurrent of self-awareness about his \'poor\' living situation and reliance on Herod\'s generosity might be present, though it\'s overshadowed by his genuine appreciation for the gesture.',
        ap.emotional_tags = ["claudius is in a relatively lighthearted", "amused mood, evident in his chuckling", "fond remarks about herod. there's a sense of warmth", "nostalgia as he reads the letter from his old friend, momentarily lifting his spirits from the likely grim atmosphere of the palace. however, a subtle undercurrent of self-awareness about his 'poor' living situation", "reliance on herod's generosity might be present, though it's overshadowed by his genuine appreciation for the gesture.", "claudius is in a relatively lighthearted and amused mood", "evident in his chuckling and fond remarks about herod. there's a sense of warmth and nostalgia as he reads the letter from his old friend", "momentarily lifting his spirits from the likely grim atmosphere of the palace. however", "a subtle undercurrent of self-awareness about his 'poor' living situation and reliance on herod's generosity might be present", "though it's overshadowed by his genuine appreciation for the gesture."],
        ap.active_plans = ["To share the contents of Herod's letter with Calpurnia, creating a moment of shared amusement.", "To understand the nature of Herod's gift and appreciate the thought behind it, despite its perceived lack of material value.", "To momentarily escape the pressures of palace life by reminiscing about a cherished friendship and engaging in lighthearted banter with Calpurnia."],
        ap.beliefs = ["Values genuine friendship and long-standing connections, as seen in his warm reaction to Herod's letter.", "Accepts his current modest circumstances with a degree of resignation, but without losing his sense of humor.", "Believes in maintaining personal relationships as a source of comfort and stability amidst the chaos of Roman politics."],
        ap.goals = ["Short-term: To enjoy this brief moment of levity and connection with Calpurnia and remember Herod fondly.", "Medium-term: To maintain his friendship with Herod despite the distance and potential political complications.", "Ultimate: To find moments of genuine human connection and respite from the corruption and danger of the Roman court, preserving his sense of self and inner peace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Calpurnia stands close to Claudius in the palace corridor, attentively listening as he reads the scroll from Herod. She leans in to examine the \'present\' when mentioned, her gaze curious and assessing. She reacts with initial underwhelmed amusement at the smallness of the gift, before her expression shifts to recognition and a more positive, almost excited interpretation upon identifying the dice.',
        ap.emotional_state = 'Calpurnia begins with playful curiosity and amusement, eager to hear Herod\'s letter and seemingly expecting something entertaining. She displays a touch of playful disappointment at the perceived lack of generosity in the gift\'s size, but quickly transitions to a more optimistic and almost excited state when she recognizes the dice. She interprets them as a potentially positive omen, showcasing her hopeful and opportunistic nature, even in seemingly trivial matters.',
        ap.emotional_tags = ["calpurnia begins with playful curiosity", "amusement, eager to hear herod's letter", "seemingly expecting something entertaining. she displays a touch of playful disappointment at the perceived lack of generosity in the gift's size, but quickly transitions to a more optimistic", "almost excited state when she recognizes the dice. she interprets them as a potentially positive omen, showcasing her hopeful", "opportunistic nature, even in seemingly trivial matters.", "calpurnia begins with playful curiosity and amusement", "eager to hear herod's letter and seemingly expecting something entertaining. she displays a touch of playful disappointment at the perceived lack of generosity in the gift's size", "but quickly transitions to a more optimistic and almost excited state when she recognizes the dice. she interprets them as a potentially positive omen", "showcasing her hopeful and opportunistic nature", "even in seemingly trivial matters.", "calpurnia begins with playful curiosity and amusement, eager to hear herod's letter and seemingly expecting something entertaining. she displays a touch of playful disappointment at the perceived lack of generosity in the gift's size,", "quickly transitions to a more optimistic and almost excited state when she recognizes the dice. she interprets them as a potentially positive omen, showcasing her hopeful and opportunistic nature, even in seemingly trivial matters."],
        ap.active_plans = ["To listen intently to Claudius reading Herod's letter, seeking amusement and information from it.", "To assess Herod's gift and understand its potential significance, initially judging it based on its apparent material value.", "To interpret the gift optimistically, framing it as a positive omen and sharing this hopeful perspective with Claudius to boost his spirits and hers."],
        ap.beliefs = ["Believes in the significance of omens and signs, seeing everyday objects as potential indicators of future fortune.", "Is inherently optimistic and seeks positive interpretations of events, even in seemingly mundane situations.", "Values Claudius's well-being and seeks to encourage and support him, even through lighthearted interpretations of gifts."],
        ap.goals = ["Short-term: To enjoy this shared moment with Claudius and find amusement in Herod's letter and gift.", "Medium-term: To maintain a positive outlook and encourage Claudius to do the same, using the dice as a symbol of potential good fortune.", "Ultimate: To navigate the complexities of Roman society and improve her and Claudius's position, seizing any opportunities, even seemingly small ones, that might indicate a shift in their fortunes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Briseis rushes into the corridor with urgency, her eyes wide and frantic as she interrupts the lighthearted exchange between Claudius and Calpurnia. She stands slightly hunched forward, clutching a piece of parchment, her body vibrating with the weight of the shocking news she bears.',
        ap.emotional_state = 'Briseis is visibly agitated, her surface emotions reflecting a mix of fear and indignation as she delivers her news. Internally, she grapples with a sense of betrayal and moral outrage at the corruption festering in the palace, torn between loyalty to her master and repulsion at the state of affairs.',
        ap.emotional_tags = ["briseis is visibly agitated, her surface emotions reflecting a mix of fear", "indignation as she delivers her news. internally, she grapples with a sense of betrayal", "moral outrage at the corruption festering in the palace, torn between loyalty to her master", "repulsion at the state of affairs.", "briseis is visibly agitated", "her surface emotions reflecting a mix of fear and indignation as she delivers her news. internally", "she grapples with a sense of betrayal and moral outrage at the corruption festering in the palace", "torn between loyalty to her master and repulsion at the state of affairs."],
        ap.active_plans = ["To inform Claudius of the scandalous advertisement and its implications.", "To express her outrage at the moral decay within the palace.", "To rally Claudius and Calpurnia against Caligula's depravity."],
        ap.beliefs = ["Believes in the sanctity of the palace as a place of honor and dignity.", "Firmly thinks that the nobility should not be involved in such disgraceful acts.", "Feels a personal responsibility to protect Claudius from the moral corruption around him."],
        ap.goals = ["Short-term: To deliver the shocking news about the brothel.", "Medium-term: To persuade Claudius to take a stand against the establishment of the brothel.", "Ultimate: To see the restoration of dignity and morality in the palace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Calpurnia stands close to Claudius, her posture reflecting both elegance and tension as she leans in to examine the scroll. When Briseis bursts in, her expression shifts to one of shock, hands clasped tightly together, revealing her dismay at the news of the brothel.',
        ap.emotional_state = 'Calpurnia\'s initial amusement turns to genuine shock and concern as she processes the information regarding the brothel. Her outward composure is challenged by the internal conflict of her ambitions versus the moral implications of the brothel\'s existence within the palace, revealing her distress about the scandalous development.',
        ap.emotional_tags = ["calpurnia's initial amusement turns to genuine shock", "concern as she processes the information regarding the brothel. her outward composure is challenged by the internal conflict of her ambitions versus the moral implications of the brothel's existence within the palace, revealing her distress about the scandalous development.", "calpurnia's initial amusement turns to genuine shock and concern as she processes the information regarding the brothel. her outward composure is challenged by the internal conflict of her ambitions versus the moral implications of the brothel's existence within the palace", "revealing her distress about the scandalous development."],
        ap.active_plans = ["To assess the implications of the brothel for her relationship with Claudius.", "To express concern and disbelief over the establishment of a brothel in the palace.", "To strategize her next moves within the palace's chaotic political environment."],
        ap.beliefs = ["Believes in the preservation of dignity and reputation in the imperial household.", "Considers herself a protector of Claudius, aligning her ambitions with his well-being.", "Thinks that the moral decay reflected in the brothel advertisement could compromise her standing in court."],
        ap.goals = ["Short-term: To comprehend the extent of the scandal and its impact on Claudius.", "Medium-term: To align Claudius's actions with her ambitions while addressing the brothel issue.", "Ultimate: To navigate the political landscape effectively and secure her influence in a corrupt court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the corridor, somewhat stooped as he reads from the scroll. His gestures are tentative, underscoring his discomfort with the topic. When Briseis interrupts, he visibly stiffens, his face reflecting a mix of disbelief and apprehension about the implications of the brothel.',
        ap.emotional_state = 'Claudius\'s initial demeanor is light-hearted, yet swiftly turns to shock and dismay upon hearing the news. Internally, he is filled with a sense of moral outrage and helplessness, caught between his awareness of Caligula\'s depravity and his own reluctance to confront the reality of the palace\'s situation.',
        ap.emotional_tags = ["claudius's initial demeanor is light-hearted, yet swiftly turns to shock", "dismay upon hearing the news. internally, he is filled with a sense of moral outrage", "helplessness, caught between his awareness of caligula's depravity", "his own reluctance to confront the reality of the palace's situation.", "claudius's initial demeanor is light-hearted", "yet swiftly turns to shock and dismay upon hearing the news. internally", "he is filled with a sense of moral outrage and helplessness", "caught between his awareness of caligula's depravity and his own reluctance to confront the reality of the palace's situation."],
        ap.active_plans = ["To express his refusal to participate in Caligula's brothel.", "To grapple with the moral implications of the news and its impact on his standing.", "To seek a means to avoid involvement while contemplating the broader consequences for Rome."],
        ap.beliefs = ["Believes in maintaining a sense of integrity despite the chaos around him.", "Holds the conviction that some forms of participation are unacceptable, even for survival.", "Fears the instability of the imperial court and its potential impact on his safety."],
        ap.goals = ["Short-term: To reject the idea of working in the brothel.", "Medium-term: To find a way to distance himself from Caligula's immoral activities.", "Ultimate: To navigate the treacherous political landscape without compromising his own principles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Calpurnia is initially engaged in a light conversation with Claudius, leaning in to examine a small object from Herod\'s letter with curiosity and a playful demeanor. Her posture shifts to one of shock and concern as Briseis announces the brothel advertisement. She directly questions Claudius, seeking to understand the implications and the scope of Caligula\'s depravity.',
        ap.emotional_state = 'Calpurnia transitions from amusement and lightheartedness to genuine shock and disbelief upon learning about the palace brothel. While outwardly composed, a subtle unease underlies her questions, hinting at a deeper calculation about the political ramifications and her own position.  Despite the scandalous nature of the news, she maintains a pragmatic outlook, underscored by her candid and unashamed declaration about her profession, showcasing her self-assuredness.',
        ap.emotional_tags = ["calpurnia transitions from amusement", "lightheartedness to genuine shock", "disbelief upon learning about the palace brothel. while outwardly composed, a subtle unease underlies her questions, hinting at a deeper calculation about the political ramifications", "her own position.  despite the scandalous nature of the news, she maintains a pragmatic outlook, underscored by her candid", "unashamed declaration about her profession, showcasing her self-assuredness.", "calpurnia transitions from amusement and lightheartedness to genuine shock and disbelief upon learning about the palace brothel. while outwardly composed", "a subtle unease underlies her questions", "hinting at a deeper calculation about the political ramifications and her own position.  despite the scandalous nature of the news", "she maintains a pragmatic outlook", "underscored by her candid and unashamed declaration about her profession", "showcasing her self-assuredness."],
        ap.active_plans = ["To fully comprehend the extent of Caligula's brothel scheme and its implications for the Roman court.", "To assess Claudius's reaction to the news and understand his intended course of action regarding Caligula's decree.", "To assert her own identity and past without shame, challenging any implied social judgment or assumptions about her status."],
        ap.beliefs = ["Pragmatism and adaptability are essential for survival and advancement in the treacherous Roman court.", "One's past profession does not dictate present worth or societal standing.", "Understanding the motivations and schemes of those in power is crucial for navigating political landscapes."],
        ap.goals = ["short-term\": \"To gain a clear understanding of the immediate impact of the brothel on her and Claudius's position.", "medium-term\": \"To maintain or enhance her influence within the court, possibly by aligning with Claudius's emerging stance against Caligula.", "ultimate\": \"To secure a position of lasting influence and stability in Roman society, leveraging her intelligence and strategic acumen, regardless of past roles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Briseis bursts into the palace corridor in a state of visible agitation, interrupting Claudius and Calpurnia with urgent news. She physically presents the shocking advertisement as evidence of Caligula\'s latest atrocity, her movements and tone reflecting her distress and moral outrage at the unfolding events.',
        ap.emotional_state = 'Briseis is deeply disturbed and morally incensed by the brothel advertisement. Her surface emotions are raw shock and outrage, expressed through her rushed entrance and exclamations. Internally, she feels a profound disgust and perhaps fear at the escalating depravity within the palace walls, revealing a strong moral compass and a sense of loyalty to Claudius that fuels her agitated state.',
        ap.emotional_tags = ["briseis is deeply disturbed", "morally incensed by the brothel advertisement. her surface emotions are raw shock", "outrage, expressed through her rushed entrance", "exclamations. internally, she feels a profound disgust", "perhaps fear at the escalating depravity within the palace walls, revealing a strong moral compass", "a sense of loyalty to claudius that fuels her agitated state.", "briseis is deeply disturbed and morally incensed by the brothel advertisement. her surface emotions are raw shock and outrage", "expressed through her rushed entrance and exclamations. internally", "she feels a profound disgust and perhaps fear at the escalating depravity within the palace walls", "revealing a strong moral compass and a sense of loyalty to claudius that fuels her agitated state."],
        ap.active_plans = ["To immediately inform Claudius about the scandalous brothel advertisement pinned on the Temple of Castor.", "To express her strong moral condemnation of Caligula's actions and highlight the injustice inflicted upon the nobility.", "To elicit a reaction from Claudius, hoping he will intervene or take a stand against Caligula's immoral decree."],
        ap.beliefs = ["Caligula's actions represent a profound moral corruption and are a deep stain on Rome's honor.", "Forcing nobility into prostitution is an unacceptable act of tyranny and degradation.", "Claudius, as a figure of relative integrity, should recognize and oppose such blatant injustices."],
        ap.goals = ["short-term\": \"To ensure Claudius is fully aware of the brothel advertisement and its scandalous nature.", "medium-term\": \"To see Caligula's immoral and tyrannical actions challenged or stopped, restoring some semblance of decency.", "ultimate\": \"To contribute to a restoration of moral order and justice within the palace and Roman society, even in a small, servant's role."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially relaxed, reading and sharing a letter from Herod with Calpurnia, even chuckling at its contents and showing a small gift. Upon Briseis\'s urgent arrival and the revelation of the brothel advertisement, his posture becomes more serious and attentive. He engages in questioning with Calpurnia, ultimately drawing a firm line against participating in Caligula\'s scheme, his stance becoming resolute.',
        ap.emotional_state = 'Claudius begins in a state of light amusement and nostalgic fondness for Herod. This shifts to a more somber and determined mood as the brothel news breaks. While outwardly calm and measured in his initial responses, his internal state is one of growing moral indignation and resolve.  His stammer, though present, does not impede his firm declaration of refusal, indicating an inner strength solidifying against Caligula\'s tyranny.',
        ap.emotional_tags = ["claudius begins in a state of light amusement", "nostalgic fondness for herod. this shifts to a more somber", "determined mood as the brothel news breaks. while outwardly calm", "measured in his initial responses, his internal state is one of growing moral indignation", "resolve.  his stammer, though present, does not impede his firm declaration of refusal, indicating an inner strength solidifying against caligula's tyranny.", "claudius begins in a state of light amusement and nostalgic fondness for herod. this shifts to a more somber and determined mood as the brothel news breaks. while outwardly calm and measured in his initial responses", "his internal state is one of growing moral indignation and resolve.  his stammer", "though present", "does not impede his firm declaration of refusal", "indicating an inner strength solidifying against caligula's tyranny."],
        ap.active_plans = ["To assess the full scope and implications of Caligula's brothel order and its impact on Roman society.", "To define and articulate his personal moral boundaries in the face of Caligula's escalating corruption.", "To firmly communicate his refusal to participate in any aspect of the brothel, regardless of potential repercussions, establishing his defiance."],
        ap.beliefs = ["Even in a corrupt and tyrannical regime, there are fundamental moral lines that should not be crossed.", "Personal dignity and integrity are valuable and worth defending, even at personal risk.", "Caligula's rule has become intolerably depraved, necessitating individual acts of resistance to maintain self-respect."],
        ap.goals = ["short-term\": \"To unequivocally state his refusal to be involved in Caligula's brothel operation in any capacity.", "medium-term\": \"To maintain his personal integrity and avoid direct complicity in Caligula's immoral acts, seeking a path of resistance.", "ultimate\": \"To navigate Caligula's reign without complete moral compromise, and to contribute, however indirectly, to a more just and decent Rome, upholding his personal sense of honor."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_bassinet_event_2_7'})
    ON CREATE SET
        oi.description = 'The bassinet serves as a poignant symbol of innocence and maternal love during this chaotic scene. Its presence draws Claudius and Caesonia closer, allowing for a tender moment amid their turbulent lives. As they discuss family and loyalty, the bassinet embodies the weight of their responsibilities and the fragility of their situation, juxtaposing the stark madness of the imperial court.',
        oi.status_before = 'The bassinet is situated peacefully in a quieter corner of the reception hall, holding the newborn baby, symbolizing the hope and tenderness of new life in the midst of turmoil.',
        oi.status_after = 'Following the conversation, the bassinet remains in place, still holding the baby, representing the ongoing maternal bond and the precarious nature of their familial situation as chaos continues to unfold around them.'
    WITH oi
    MATCH (o:Object {uuid: 'object_bassinet'})
    MATCH (e:Event {uuid: 'event_2_7'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Sabinus stands nervously near the entrance of the palace brothel, shifting his weight from one foot to another. His hands twitch as he clutches Diana\'s arm, visibly anxious as he pleads with Claudius for her safety, embodying desperation in his posture and voice.',
        ap.emotional_state = 'Sabinus exhibits surface-level anxiety, marked by a furrowed brow and fidgeting hands. Internally, he grapples with an overwhelming sense of fear and protectiveness towards Diana, feeling helpless in the face of the grim realities imposed by the imperial regime. His pleas are tinged with desperation, reflecting an unspoken fear for her safety and the potential consequences of failure.',
        ap.emotional_tags = ["sabinus exhibits surface-level anxiety, marked by a furrowed brow", "fidgeting hands. internally, he grapples with an overwhelming sense of fear", "protectiveness towards diana, feeling helpless in the face of the grim realities imposed by the imperial regime. his pleas are tinged with desperation, reflecting an unspoken fear for her safety", "the potential consequences of failure.", "sabinus exhibits surface-level anxiety", "marked by a furrowed brow and fidgeting hands. internally", "he grapples with an overwhelming sense of fear and protectiveness towards diana", "feeling helpless in the face of the grim realities imposed by the imperial regime. his pleas are tinged with desperation", "reflecting an unspoken fear for her safety and the potential consequences of failure."],
        ap.active_plans = ["Convince Claudius to spare Diana from the brothel, appealing to his sense of decency.", "Ensure that Diana's safety is prioritized, revealing his protective instincts as a husband.", "Seek a way to navigate the corrupt system to secure a safe alternative for Diana."],
        ap.beliefs = ["Belief in the inherent goodness of Claudius, hoping he will intervene.", "Conviction that preserving Diana's safety is paramount, even at great personal risk.", "View of the court's power as corrupt yet still susceptible to moral appeals."],
        ap.goals = ["Short-term: Secure a reprieve for Diana from entering the brothel.", "Medium-term: Navigate the dangerous political landscape to protect his family.", "Ultimate: Restore dignity and safety to their lives amidst Caligula's tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Diana stands close to Sabinus, clutching his arm tightly. Her wide eyes dart around the room, reflecting her horror at the situation. She maintains a slightly hunched posture, signaling her fear and vulnerability in the oppressive atmosphere of the palace.',
        ap.emotional_state = 'Diana\'s surface emotions are dominated by fear, expressed through her trembling voice and anxious demeanor. Internally, she is terrified of the prospect of being forced into a brothel, feeling a potent mix of maternal instinct and despair. This conflict heightens her emotional turmoil as she contemplates the potential loss of her role as a mother.',
        ap.emotional_tags = ["diana's surface emotions are dominated by fear, expressed through her trembling voice", "anxious demeanor. internally, she is terrified of the prospect of being forced into a brothel, feeling a potent mix of maternal instinct", "despair. this conflict heightens her emotional turmoil as she contemplates the potential loss of her role as a mother.", "diana's surface emotions are dominated by fear", "expressed through her trembling voice and anxious demeanor. internally", "she is terrified of the prospect of being forced into a brothel", "feeling a potent mix of maternal instinct and despair. this conflict heightens her emotional turmoil as she contemplates the potential loss of her role as a mother."],
        ap.active_plans = ["Protect her dignity and safety at all costs, resisting the pressures of the court.", "Support Sabinus's pleas, leveraging their emotional bond to sway Claudius.", "Seek a way to return to a life of normalcy, away from the corrupt influences of the palace."],
        ap.beliefs = ["Belief that her value as a person transcends the dehumanizing expectations of the court.", "Conviction that motherhood is paramount, motivating her desire to remain with her child.", "View that the world around her is cruel and unpredictable, leading to profound mistrust."],
        ap.goals = ["Short-term: Avoid being forced into the brothel and protect her dignity.", "Medium-term: Ensure her child's safety and maintain her role as a mother.", "Ultimate: Escape the clutches of Caligula's tyranny and find peace."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Sabinus stands before Claudius in the bustling Reception Hall, his posture tense with anxiety. He nervously gestures towards his young wife, Diana, who clings to his arm, her terror palpable. Sabinus\'s voice trembles as he pleads with Claudius, attempting to reason and bargain for his wife\'s exemption from the Emperor\'s decree.',
        ap.emotional_state = 'Sabinus is overwhelmed by fear and desperation. Outwardly, he is visibly anxious, his voice pleading and his body language conveying distress. Beneath the surface, he is likely battling a deeper turmoil – the conflict between his societal obligations and his primal urge to protect his wife from harm. He is emotionally exposed, revealing his vulnerability and the depth of his concern for Diana\'s well-being in this perilous environment.',
        ap.emotional_tags = ["sabinus is overwhelmed by fear", "desperation. outwardly, he is visibly anxious, his voice pleading", "his body language conveying distress. beneath the surface, he is likely battling a deeper turmoil \u2013 the conflict between his societal obligations", "his primal urge to protect his wife from harm. he is emotionally exposed, revealing his vulnerability", "the depth of his concern for diana's well-being in this perilous environment.", "sabinus is overwhelmed by fear and desperation. outwardly", "he is visibly anxious", "his voice pleading and his body language conveying distress. beneath the surface", "he is likely battling a deeper turmoil \u2013 the conflict between his societal obligations and his primal urge to protect his wife from harm. he is emotionally exposed", "revealing his vulnerability and the depth of his concern for diana's well-being in this perilous environment."],
        ap.active_plans = ["To convince Claudius to grant Diana an exception from entering the palace brothel.", "To find an alternative safe space within the palace for Diana to avoid potential harm.", "To appeal to Claudius's sense of compassion or authority to override the Emperor's orders, even if momentarily."],
        ap.beliefs = ["He believes in the inherent vulnerability and need for protection of women, especially new mothers.", "He believes in the possibility of appealing to someone in authority, like Claudius, for compassion and intervention.", "He believes the palace brothel represents a significant danger and moral degradation for Diana."],
        ap.goals = ["Short-term: To prevent Diana from being forced into the brothel in this immediate moment.", "Medium-term: To ensure Diana's safety and well-being, removing her from the threatening palace environment.", "Ultimate: To protect his family from the corruption and moral decay of Caligula's Rome, preserving their dignity and future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_poppaea_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Poppaea strides confidently towards Sabinus and Diana, her posture exuding dominance as she assesses Diana with a predatory gaze. Her movements are smooth and calculated, embodying the air of a huntress. Her laughter is sharp, cutting through the tension, showcasing her authority in this sordid environment.',
        ap.emotional_state = 'Poppaea’s surface emotions reveal a mix of amusement and malice, her sardonic smile betraying her joy in wielding power over others. Internally, she revels in the chaos around her, feeling an intoxicating thrill from the dehumanization of those like Diana. There’s a latent contempt for their vulnerability, driving her to assert her superiority.',
        ap.emotional_tags = ["poppaea\u2019s surface emotions reveal a mix of amusement", "malice, her sardonic smile betraying her joy in wielding power over others. internally, she revels in the chaos around her, feeling an intoxicating thrill from the dehumanization of those like diana. there\u2019s a latent contempt for their vulnerability, driving her to assert her superiority.", "poppaea\u2019s surface emotions reveal a mix of amusement and malice", "her sardonic smile betraying her joy in wielding power over others. internally", "she revels in the chaos around her", "feeling an intoxicating thrill from the dehumanization of those like diana. there\u2019s a latent contempt for their vulnerability", "driving her to assert her superiority."],
        ap.active_plans = ["To manipulate the situation for her amusement and gain, showcasing her authority in the brothel.", "To ensure that Diana is seen as a commodified object for the pleasure of men, reinforcing the degradation she thrives in.", "To maintain her status among her peers by exhibiting dominance over those she perceives as weaker."],
        ap.beliefs = ["Women are mere pawns in the political game of the court and should be leveraged for personal gain.", "Power is derived from fear and manipulation, and she must embody these traits to thrive.", "Compassion is a weakness, one that she cannot afford to display in the cutthroat world of the palace."],
        ap.goals = ["Short-term: To coerce Diana into compliance with the brothel's demands.", "Medium-term: To assert her dominance over other women in the palace, reinforcing her position.", "Ultimate: To consolidate her power and influence within the court, ensuring that she is unmatched among her peers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Marcus Vinicius enters with a lecherous grin, his gaze lingering on Diana with an unsettling hunger. He stands with a slightly forward-leaning posture, indicating eagerness to seize the moment. His demeanor is predatory, embodying the very essence of the commodified environment that surrounds him.',
        ap.emotional_state = 'Externally, Marcus projects confidence and a sense of entitlement, his demeanor filled with arrogance as he eyes Diana hungrily. Internally, however, he grapples with a growing fear of Caligula\'s madness, aware that the political landscape is shifting beneath his feet. The tension between his desires and the unpredictable power dynamics creates a simmering anxiety.',
        ap.emotional_tags = ["externally, marcus projects confidence", "a sense of entitlement, his demeanor filled with arrogance as he eyes diana hungrily. internally, however, he grapples with a growing fear of caligula's madness, aware that the political landscape is shifting beneath his feet. the tension between his desires", "the unpredictable power dynamics creates a simmering anxiety.", "externally", "marcus projects confidence and a sense of entitlement", "his demeanor filled with arrogance as he eyes diana hungrily. internally", "however", "he grapples with a growing fear of caligula's madness", "aware that the political landscape is shifting beneath his feet. the tension between his desires and the unpredictable power dynamics creates a simmering anxiety."],
        ap.active_plans = ["To take advantage of Diana\u2019s vulnerability, seeing her as an object of desire to fulfill his own lecherous intentions.", "To assert his authority as Caligula's brother-in-law, using it to intimidate and manipulate others.", "To navigate the chaotic environment of the palace while maintaining his standing and avoiding Caligula's wrath."],
        ap.beliefs = ["Women in Rome are possessions to be used for pleasure and status.", "His familial connection to Caligula grants him a degree of immunity and power over others.", "Survival in the political arena requires taking what one desires, even at the expense of others."],
        ap.goals = ["Short-term: To seduce or coerce Diana into submission as part of his immediate desires.", "Medium-term: To solidify his influence in the court while keeping himself distanced from potential fallout.", "Ultimate: To gain more power and prestige in the court, ensuring that he is not only a participant but a key player in the game of politics and pleasure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Sabinus stands nervously with his arm protectively clutching Diana, his posture tense as he seeks to shield her from the predatory gaze of Poppaea and Marcus. He fidgets slightly, indicating his deep discomfort and anxiety in this perilous situation.',
        ap.emotional_state = 'Sabinus displays outward anxiety and desperation, his voice trembling as he pleads for Diana\'s safety. Internally, he is consumed by fear and helplessness, knowing the dangers that lurk in the palace. His motivations stem from a protective instinct for his wife, yet he wrestles with the realization of his impotence in this corrupt environment.',
        ap.emotional_tags = ["sabinus displays outward anxiety", "desperation, his voice trembling as he pleads for diana's safety. internally, he is consumed by fear", "helplessness, knowing the dangers that lurk in the palace. his motivations stem from a protective instinct for his wife, yet he wrestles with the realization of his impotence in this corrupt environment.", "sabinus displays outward anxiety and desperation", "his voice trembling as he pleads for diana's safety. internally", "he is consumed by fear and helplessness", "knowing the dangers that lurk in the palace. his motivations stem from a protective instinct for his wife", "yet he wrestles with the realization of his impotence in this corrupt environment."],
        ap.active_plans = ["To find a way to safeguard Diana from the lecherous intentions of those around them.", "To negotiate with Claudius for a possible reprieve from the brothel\u2019s demands, hoping to shield his wife.", "To assert his role as a protector despite the overwhelming odds stacked against him."],
        ap.beliefs = ["Marriage entails the duty of protection, and he must do everything to safeguard his wife.", "The palace is a den of iniquity, where morality has been discarded for pleasure.", "There exists a fundamental injustice within the social structure that must be challenged for the sake of those he loves."],
        ap.goals = ["Short-term: To successfully navigate the immediate threat posed by Poppaea and Marcus to Diana's safety.", "Medium-term: To rally support or find allies in the court to protect his wife and others like her.", "Ultimate: To dismantle the oppressive structures of the brothel system and restore some dignity to the women ensnared in it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Marcus enters the Reception Hall, his gaze immediately fixated on Diana with a lecherous grin. He strides towards her, oozing entitlement, and reaches out to physically take her into the brothel, assuming his desires will be met without question. His advance is abruptly halted when Claudius steps in and grabs his arm, physically obstructing his path and challenging his assumed authority.',
        ap.emotional_state = 'Marcus outwardly displays a predatory confidence and lecherous desire, evident in his grin and forward actions towards Diana. Beneath the surface, he simmers with entitlement and arrogance, fully expecting to have his way. When Claudius intervenes, surprise quickly morphs into indignation and anger at being challenged, particularly by someone he likely views as beneath him in social standing. He is likely baffled and enraged that his advances are not only unwelcome but actively resisted.',
        ap.emotional_tags = ["marcus outwardly displays a predatory confidence", "lecherous desire, evident in his grin", "forward actions towards diana. beneath the surface, he simmers with entitlement", "arrogance, fully expecting to have his way. when claudius intervenes, surprise quickly morphs into indignation", "anger at being challenged, particularly by someone he likely views as beneath him in social standing. he is likely baffled", "enraged that his advances are not only unwelcome but actively resisted.", "marcus outwardly displays a predatory confidence and lecherous desire", "evident in his grin and forward actions towards diana. beneath the surface", "he simmers with entitlement and arrogance", "fully expecting to have his way. when claudius intervenes", "surprise quickly morphs into indignation and anger at being challenged", "particularly by someone he likely views as beneath him in social standing. he is likely baffled and enraged that his advances are not only unwelcome but actively resisted.", "marcus outwardly displays a predatory confidence and lecherous desire, evident in his grin and forward actions towards diana. beneath the surface, he simmers with entitlement and arrogance, fully expecting to have his way. when claudius intervenes, surprise quickly morphs into indignation and anger at being challenged, particularly by someone he likely views as beneath him in social standing. he is likely baffled and enraged that his advances are not only unwelcome", "actively resisted."],
        ap.active_plans = ["To assert his dominance and entitlement by taking Diana into the brothel as he pleases.", "To indulge in the pleasures offered within the palace brothel, taking advantage of the Emperor's permissive environment.", "To publicly demonstrate his status and power by acting without consequence, expecting others to yield to his desires."],
        ap.beliefs = ["Men of his standing, especially those connected to the Emperor, are entitled to the women and pleasures available within the palace.", "His social status and familial connection to the Emperor place him above common rules and moral constraints.", "Women, particularly those brought to the brothel, are objects for male gratification and should be compliant to men's desires."],
        ap.goals = ["short_term\": \"To immediately satisfy his lecherous desires by taking Diana into the brothel.", "medium_term\": \"To maintain and exploit his privileged position within the Roman court for personal pleasure and gain.", "ultimate\": \"To live a life of unchecked privilege and indulgence, free from consequences and societal constraints, leveraging his connections for personal gratification."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Caesonia enters the hall, heavily pregnant and visibly anxious. Her posture reflects her distress, with hands clasped tightly and a furrowed brow. She moves cautiously, seeking Claudius amidst the chaos, her body language betraying her worry for Caligula\'s state and the safety of her child.',
        ap.emotional_state = 'Outwardly, Caesonia conveys deep concern, her eyes darting to the chaos unfolding around her. Internally, she grapples with a profound fear for both her husband\'s well-being and the threat posed to her family. This conflict between maternal instinct and loyalty to her husband creates a palpable tension in her demeanor, revealing a woman caught in a web of loyalty and fear.',
        ap.emotional_tags = ["outwardly, caesonia conveys deep concern, her eyes darting to the chaos unfolding around her. internally, she grapples with a profound fear for both her husband's well-being", "the threat posed to her family. this conflict between maternal instinct", "loyalty to her husband creates a palpable tension in her demeanor, revealing a woman caught in a web of loyalty", "fear.", "outwardly", "caesonia conveys deep concern", "her eyes darting to the chaos unfolding around her. internally", "she grapples with a profound fear for both her husband's well-being and the threat posed to her family. this conflict between maternal instinct and loyalty to her husband creates a palpable tension in her demeanor", "revealing a woman caught in a web of loyalty and fear."],
        ap.active_plans = ["To persuade Claudius to aid her husband Caligula, believing that strong allies are needed to stabilize the Empire.", "To ensure the safety of her child and herself amidst the brewing chaos in the palace.", "To navigate the treacherous political landscape by maintaining her composure while expressing her worry for Caligula."],
        ap.beliefs = ["Strongly believes in her duty to support her husband, regardless of his madness.", "Holds the conviction that love can prevail even in the face of tyranny and chaos.", "Believes that the presence of good people around Caligula could mitigate his erratic behavior."],
        ap.goals = ["Short-term: To secure Claudius's assistance in ensuring Caligula's safety and sanity.", "Medium-term: To maintain a semblance of stability in her household as well as the palace.", "Ultimate: To protect her family and restore a sense of order to Rome, hoping for a better future for her child."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Diana stands clinging to Sabinus\'s arm, visibly trembling and overwhelmed by the dire circumstances. Her posture is one of dread, with her head slightly bowed as she avoids eye contact, embodying a woman on the brink of panic as she faces the threat of being taken against her will.',
        ap.emotional_state = 'Diana\'s surface emotions are marked by fear and desperation; her wide eyes and quivering voice reveal her terror at the prospect of being forced into the palace\'s dark machinations. Beneath this exterior lies a profound maternal instinct, fueled by thoughts of her child and the possible consequences of her situation. This internal conflict elevates her vulnerability, as she fights against the forces aiming to strip her of her autonomy.',
        ap.emotional_tags = ["diana's surface emotions are marked by fear", "desperation; her wide eyes", "quivering voice reveal her terror at the prospect of being forced into the palace's dark machinations. beneath this exterior lies a profound maternal instinct, fueled by thoughts of her child", "the possible consequences of her situation. this internal conflict elevates her vulnerability, as she fights against the forces aiming to strip her of her autonomy.", "diana's surface emotions are marked by fear and desperation; her wide eyes and quivering voice reveal her terror at the prospect of being forced into the palace's dark machinations. beneath this exterior lies a profound maternal instinct", "fueled by thoughts of her child and the possible consequences of her situation. this internal conflict elevates her vulnerability", "as she fights against the forces aiming to strip her of her autonomy.", "diana's surface emotions are marked by fear and desperation", "her wide eyes and quivering voice reveal her terror at the prospect of being forced into the palace's dark machinations. beneath this exterior lies a profound maternal instinct, fueled by thoughts of her child and the possible consequences of her situation. this internal conflict elevates her vulnerability, as she fights against the forces aiming to strip her of her autonomy."],
        ap.active_plans = ["To escape the palace unscathed and protect her child from the horrors of the imperial court.", "To express her fears to Sabinus, hoping he can find a solution or a way out.", "To resist the pressures of the court and assert her will against those who wish to exploit her."],
        ap.beliefs = ["Believes in the importance of personal autonomy, especially as a new mother.", "Holds the conviction that she must protect her child at all costs, even if it means standing against powerful figures.", "Trusts Sabinus to advocate for her safety and well-being in the face of systemic oppression."],
        ap.goals = ["Short-term: To convince Sabinus to help her escape the immediate threat posed by the palace.", "Medium-term: To establish a safe environment for her child away from the court's dangers.", "Ultimate: To reclaim her agency and protect her family from the tyranny of Caligula's rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_2_6'})
    ON CREATE SET
        ap.current_status = 'Caligula bursts into the Reception Hall, his entrance marked by a loud, unsettling laugh that immediately draws all eyes. He is dressed in extravagant, flamboyant attire, highlighting his desire for attention and theatrical self-presentation. He strides confidently into the space, directly addressing Claudius with a mix of mockery and forced camaraderie, then turns to Cassius to further display his perceived dominance and control over the scene.',
        ap.emotional_state = 'Caligula\'s surface emotion is manic glee, expressed through his wild laughter and theatrical pronouncements. However, this outward display masks a deeper instability and paranoia. His erratic behavior and need to constantly assert dominance suggest a profound insecurity and fear of losing control. The grandiose nature of his declarations hints at a desperate attempt to convince himself, as much as others, of his power and importance, betraying a fragile ego beneath the veneer of madness.',
        ap.emotional_tags = ["caligula's surface emotion is manic glee, expressed through his wild laughter", "theatrical pronouncements. however, this outward display masks a deeper instability", "paranoia. his erratic behavior", "need to constantly assert dominance suggest a profound insecurity", "fear of losing control. the grandiose nature of his declarations hints at a desperate attempt to convince himself, as much as others, of his power", "importance, betraying a fragile ego beneath the veneer of madness.", "caligula's surface emotion is manic glee", "expressed through his wild laughter and theatrical pronouncements. however", "this outward display masks a deeper instability and paranoia. his erratic behavior and need to constantly assert dominance suggest a profound insecurity and fear of losing control. the grandiose nature of his declarations hints at a desperate attempt to convince himself", "as much as others", "of his power and importance", "betraying a fragile ego beneath the veneer of madness."],
        ap.active_plans = ["To dominate the room and assert his imperial authority through theatrical madness and unpredictable behavior.", "To publicly announce his war plans against the Germans, reinforcing his image as a powerful and decisive leader.", "To belittle and mock Claudius, maintaining his perceived intellectual and social superiority while simultaneously seeking Claudius's approval or reaction."],
        ap.beliefs = ["He is a divinely appointed ruler, entitled to absolute power and unbound by normal human constraints.", "Instilling fear and maintaining an atmosphere of chaos are essential tools for controlling his court and the Roman populace.", "Military conquest and expansion are necessary to solidify his legacy and prove his strength as a leader, both to Rome and to himself."],
        ap.goals = ["short-term\": \"To command immediate attention and obedience within the Reception Hall, ensuring everyone recognizes his dominance.", "medium-term\": \"To successfully launch and win a war against the Germans, returning to Rome with glory and riches to bolster his popularity and authority.", "ultimate\": \"To establish himself as a legendary, god-like emperor, feared and revered throughout history, securing his place in Roman pantheon despite his inner turmoil and instability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_2_6'})
    ON CREATE SET
        ap.current_status = 'Cassius stands rigidly behind Caligula, a figure of stoic military bearing amidst the Emperor\'s chaotic outburst. He maintains a formal posture, observing Caligula and the scene with a stern, impassive face. When directly addressed by Caligula, he responds with curt, professional deference, suggesting a practiced control and outward obedience despite the evident madness unfolding before him. His physical presence is a stark contrast to Caligula\'s flamboyance, highlighting his grounded and disciplined nature.',
        ap.emotional_state = 'Cassius projects an outward calm and professional detachment, his stern face betraying little emotion in the face of Caligula\'s manic display. However, beneath this impassive exterior, he likely experiences deep disapproval and growing resentment towards the Emperor\'s tyrannical madness. His controlled demeanor suggests a soldier suppressing his true feelings, maintaining composure while witnessing the decay of Roman leadership. There\'s an undercurrent of tension in his stillness, hinting at a boiling point of frustration and a potential for action against Caligula.',
        ap.emotional_tags = ["cassius projects an outward calm", "professional detachment, his stern face betraying little emotion in the face of caligula's manic display. however, beneath this impassive exterior, he likely experiences deep disapproval", "growing resentment towards the emperor's tyrannical madness. his controlled demeanor suggests a soldier suppressing his true feelings, maintaining composure while witnessing the decay of roman leadership. there's an undercurrent of tension in his stillness, hinting at a boiling point of frustration", "a potential for action against caligula.", "cassius projects an outward calm and professional detachment", "his stern face betraying little emotion in the face of caligula's manic display. however", "beneath this impassive exterior", "he likely experiences deep disapproval and growing resentment towards the emperor's tyrannical madness. his controlled demeanor suggests a soldier suppressing his true feelings", "maintaining composure while witnessing the decay of roman leadership. there's an undercurrent of tension in his stillness", "hinting at a boiling point of frustration and a potential for action against caligula.", "cassius projects an outward calm and professional detachment, his stern face betraying little emotion in the face of caligula's manic display. however, beneath this impassive exterior, he likely experiences deep disapproval and growing resentment towards the emperor's tyrannical madness. his controlled demeanor suggests a soldier suppressing his true feelings, maintaining composure", "witnessing the decay of roman leadership. there's an undercurrent of tension in his stillness, hinting at a boiling point of frustration and a potential for action against caligula."],
        ap.active_plans = ["To remain vigilant and observant of Caligula's erratic behavior and pronouncements, assessing the immediate impact and potential consequences of his madness.", "To maintain a facade of unwavering loyalty and obedience, avoiding any action or expression that might draw Caligula's unpredictable ire or suspicion.", "To continue subtly gauging the mood and reactions of others in the court, identifying potential allies and assessing the feasibility of future conspiratorial actions against Caligula's regime."],
        ap.beliefs = ["Order and stability are paramount for the well-being of Rome, and Caligula's chaotic rule is a direct threat to these values.", "Loyalty to Rome and its traditional values supersedes personal loyalty to a tyrannical and insane emperor.", "Decisive action, even if drastic, is necessary to remove Caligula and restore a semblance of rational governance and justice to the empire."],
        ap.goals = ["short-term\": \"To survive this immediate encounter with Caligula unscathed, avoiding becoming a target of the Emperor's unpredictable rage.", "medium-term\": \"To solidify and expand the conspiracy against Caligula, carefully recruiting allies and formulating a plan for his removal.", "ultimate\": \"To liberate Rome from Caligula's tyranny and contribute to the restoration of order, justice, and a more stable political environment, even if through violent overthrow."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_7'})
    ON CREATE SET
        ap.current_status = 'Caesonia stands close to Claudius, her body slightly turned towards him in a protective yet vulnerable posture. Her fingers lightly touch his arm as she speaks, conveying both her anxiety and affection. The tension in her stance is palpable as she leans in, creating an intimate space amid the surrounding chaos.',
        ap.emotional_state = 'Caesonia\'s surface emotions oscillate between worry and fierce protectiveness as she expresses concern for Caligula and their child. Internally, she grapples with feelings of insecurity and confusion about her role in Caligula\'s life, revealing a deeper struggle with her love for him despite his madness. The contradiction between her loyalty and the chaos surrounding her weighs heavily on her.',
        ap.emotional_tags = ["caesonia's surface emotions oscillate between worry", "fierce protectiveness as she expresses concern for caligula", "their child. internally, she grapples with feelings of insecurity", "confusion about her role in caligula's life, revealing a deeper struggle with her love for him despite his madness. the contradiction between her loyalty", "the chaos surrounding her weighs heavily on her.", "caesonia's surface emotions oscillate between worry and fierce protectiveness as she expresses concern for caligula and their child. internally", "she grapples with feelings of insecurity and confusion about her role in caligula's life", "revealing a deeper struggle with her love for him despite his madness. the contradiction between her loyalty and the chaos surrounding her weighs heavily on her."],
        ap.active_plans = ["To seek reassurance from Claudius regarding her husband's mental state and his treatment of her and their child.", "To express her affection for Caligula and her desire to maintain their family unit despite the turmoil.", "To subtly gauge Claudius's perception of Caligula's behavior and decisions, seeking insight into the political landscape."],
        ap.beliefs = ["Believes in the importance of familial bonds, even amidst chaos, valuing her role as a mother and a wife.", "Holds a conviction that love can transcend the madness surrounding Caligula, believing she can influence his actions.", "Is deeply aware that loyalty to Caligula may put her at risk but prioritizes her emotional connection to him."],
        ap.goals = ["Short-term: To ensure Claudius understands her vulnerabilities and her plea for help regarding Caligula.", "Medium-term: To protect her child and maintain her family\u2019s stability amidst the uncertainties of Caligula's reign.", "Ultimate: To navigate and survive the politically treacherous environment of the court while striving for a semblance of peace for her family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Caligula dominates the Council Chamber with theatrical flair, standing imperiously as he recounts his fantastical dialogue with a river god to a stoic Cassius. He gesticulates wildly, his movements erratic and unpredictable, embodying the chaos of his reign. His posture is one of exaggerated self-importance, every gesture designed to reinforce his self-proclaimed divinity and command absolute attention and belief from those around him.',
        ap.emotional_state = 'On the surface, Caligula exudes manic glee and supreme confidence, laughing as he describes his reprimand of the river god. However, beneath this veneer of divine assurance lurks a profound insecurity and paranoia. He craves validation of his godhood, desperately needing Cassius to acknowledge his fabricated power and reinforce his delusional self-image. This performance masks a deep-seated fear of being disbelieved or undermined, fueling his exaggerated pronouncements and erratic behavior as he seeks to control his reality through sheer force of personality.',
        ap.emotional_tags = ["on the surface, caligula exudes manic glee", "supreme confidence, laughing as he describes his reprimand of the river god. however, beneath this veneer of divine assurance lurks a profound insecurity", "paranoia. he craves validation of his godhood, desperately needing cassius to acknowledge his fabricated power", "reinforce his delusional self-image. this performance masks a deep-seated fear of being disbelieved or undermined, fueling his exaggerated pronouncements", "erratic behavior as he seeks to control his reality through sheer force of personality.", "on the surface", "caligula exudes manic glee and supreme confidence", "laughing as he describes his reprimand of the river god. however", "beneath this veneer of divine assurance lurks a profound insecurity and paranoia. he craves validation of his godhood", "desperately needing cassius to acknowledge his fabricated power and reinforce his delusional self-image. this performance masks a deep-seated fear of being disbelieved or undermined", "fueling his exaggerated pronouncements and erratic behavior as he seeks to control his reality through sheer force of personality."],
        ap.active_plans = ["Solidify his image as a divine ruler in the eyes of his court and subjects through increasingly outlandish pronouncements and performances.", "Maintain absolute control over his surroundings by instilling fear and unpredictability in the behavior of those around him, ensuring unquestioning obedience.", "Seek constant reassurance and validation of his self-proclaimed divinity, probing for any sign of doubt or dissent to immediately crush it."],
        ap.beliefs = ["He is unequivocally a god in mortal form, possessing absolute divine authority and power over both mortals and the natural world.", "Everyone in Rome, and indeed the world, should recognize, fear, and worship his divine status without question or hesitation.", "His every whim, pronouncement, and action is divinely inspired and therefore inherently just, correct, and beyond reproach."],
        ap.goals = ["Short-term: To be immediately believed and obeyed in his current fantastical narrative, reinforcing his dominance in the present moment.", "Medium-term: To firmly establish his godhood in the collective consciousness of Rome, ensuring his legacy as a divine emperor for generations to come.", "Ultimate: To transcend mortal limitations entirely and achieve undisputed divine status, worshipped as an immortal deity, both in his lifetime and eternally after."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Cassius stands rigidly at Caligula\'s side, a stark contrast to the emperor\'s flamboyant display. He maintains an outwardly impassive and respectful demeanor, his body language controlled and deferential. He listens to Caligula\'s increasingly bizarre pronouncements with a soldier\'s discipline, his physical stillness betraying nothing of his internal state as he observes the emperor\'s descent further into madness.',
        ap.emotional_state = 'Beneath his stoic exterior, Cassius is likely battling a maelstrom of conflicting emotions. Outwardly, he projects unwavering obedience and deference, a necessary mask for survival in Caligula\'s court. Internally, however, he is likely experiencing a potent mix of disgust, weariness, and a chilling realization of the depth of Caligula\'s derangement. The emperor\'s delusional claims serve to solidify Cassius\'s growing resolve that action must be taken to save Rome from this tyrannical madness. His impassivity is a carefully constructed shield, concealing his simmering anger and the burgeoning seeds of rebellion that are taking root.',
        ap.emotional_tags = ["beneath his stoic exterior, cassius is likely battling a maelstrom of conflicting emotions. outwardly, he projects unwavering obedience", "deference, a necessary mask for survival in caligula's court. internally, however, he is likely experiencing a potent mix of disgust, weariness,", "a chilling realization of the depth of caligula's derangement. the emperor's delusional claims serve to solidify cassius's growing resolve that action must be taken to save rome from this tyrannical madness. his impassivity is a carefully constructed shield, concealing his simmering anger", "the burgeoning seeds of rebellion that are taking root.", "beneath his stoic exterior", "cassius is likely battling a maelstrom of conflicting emotions. outwardly", "he projects unwavering obedience and deference", "a necessary mask for survival in caligula's court. internally", "however", "he is likely experiencing a potent mix of disgust", "weariness", "and a chilling realization of the depth of caligula's derangement. the emperor's delusional claims serve to solidify cassius's growing resolve that action must be taken to save rome from this tyrannical madness. his impassivity is a carefully constructed shield", "concealing his simmering anger and the burgeoning seeds of rebellion that are taking root."],
        ap.active_plans = ["Observe and meticulously assess the escalating extent of Caligula's madness, carefully noting the emperor's increasingly erratic behavior and pronouncements.", "Maintain an outward facade of unwavering loyalty and obedience to Caligula, ensuring his own survival and avoiding any suspicion that might jeopardize future actions.", "Silently gauge the sentiments of other influential figures within the court and military, subtly seeking out potential allies and support for a future intervention to restore order."],
        ap.beliefs = ["Caligula's reign has devolved into a dangerous and destructive tyranny that poses an existential threat to the stability and future of Rome.", "The restoration of order, reason, and traditional Roman values is paramount, even if achieving this requires extreme and potentially violent measures.", "His duty to Rome and the well-being of its citizens supersedes any personal loyalty to a mad and tyrannical emperor, justifying actions against Caligula for the greater good."],
        ap.goals = ["Short-term: To navigate the immediate dangers of Caligula's unpredictable court, ensuring his own survival and avoiding becoming a target of the emperor's whims.", "Medium-term: To discreetly assess the feasibility and strategize the logistics of removing Caligula from power, exploring potential alliances and opportunities for action.", "Ultimate: To restore stability and order to Rome by ending Caligula's tyrannical reign, paving the way for a return to rational governance and ensuring the long-term prosperity of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously, his wild eyes darting around the room as he paces erratically, arms gesticulating with manic energy. His posture is commanding yet unstable, embodying his volatile temperament. He exudes an air of dominance, yet there\'s an underlying tension as he reacts to the arrival of Claudius and others with suspicion.',
        ap.emotional_state = 'Outwardly, Caligula displays fury and frustration, his voice rising as he berates Claudius and the others. Internally, his paranoia festers, driven by an irrational fear of betrayal and a desperate need for control. His conflicting emotions manifest as he swings from laughter to threats, revealing a fractured psyche battling between arrogance and insecurity.',
        ap.emotional_tags = ["outwardly, caligula displays fury", "frustration, his voice rising as he berates claudius", "the others. internally, his paranoia festers, driven by an irrational fear of betrayal", "a desperate need for control. his conflicting emotions manifest as he swings from laughter to threats, revealing a fractured psyche battling between arrogance", "insecurity.", "outwardly", "caligula displays fury and frustration", "his voice rising as he berates claudius and the others. internally", "his paranoia festers", "driven by an irrational fear of betrayal and a desperate need for control. his conflicting emotions manifest as he swings from laughter to threats", "revealing a fractured psyche battling between arrogance and insecurity."],
        ap.active_plans = ["To intimidate the Senate's envoys by demanding the missing carts of valuables.", "To assert his authority through violent threats and erratic behavior.", "To solidify his position and eliminate perceived threats by using fear as a weapon."],
        ap.beliefs = ["Power must be maintained through fear and intimidation.", "His divinity is unquestionable and must be acknowledged by all.", "Loyalty is fragile, and betrayal lurks behind every corner."],
        ap.goals = ["Short-term: To ensure the immediate compliance of Claudius and the other envoys.", "Medium-term: To demonstrate his unchecked power and control over Rome's elite.", "Ultimate: To solidify his reign as a god-like figure unchallenged by others."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Claudius enters hesitantly, bowing deeply before Caligula. He stands slightly hunched, embodying a mix of reverence and fear as he tries to articulate the Senate\'s congratulations. His gestures are cautious, marked by uncertainty and a desperate desire to appease the volatile Emperor.',
        ap.emotional_state = 'Claudius displays fear and anxiety as he confronts Caligula\'s hostility. His stammer and hesitations reveal his internal turmoil and apprehension about the Emperor\'s unpredictable reactions. Beneath his outward compliance is a simmering conflict between his scholarly instincts and the primal need to survive in a dangerous court.',
        ap.emotional_tags = ["claudius displays fear", "anxiety as he confronts caligula's hostility. his stammer", "hesitations reveal his internal turmoil", "apprehension about the emperor's unpredictable reactions. beneath his outward compliance is a simmering conflict between his scholarly instincts", "the primal need to survive in a dangerous court."],
        ap.active_plans = ["To deliver the Senate's congratulations without provoking Caligula.", "To maintain his own safety by appeasing the Emperor.", "To subtly navigate the treacherous political landscape while keeping his dignity."],
        ap.beliefs = ["Survival in the court depends on appeasing those in power.", "Intellect and reason may not save him from Caligula's whims.", "Betrayal is a constant threat, and caution is necessary."],
        ap.goals = ["Short-term: To complete the diplomatic mission without inciting Caligula's wrath.", "Medium-term: To find a way to stabilize his position within the court.", "Ultimate: To navigate the chaos of Rome while preserving his life and dignity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Marcus stands beside Claudius, his posture tense and defensive. He watches Caligula\'s erratic behavior with a mix of dread and determination. His movements are calculated as he attempts to interject reason into the chaotic dialogue, yet he remains visibly shaken by the Emperor\'s hostility.',
        ap.emotional_state = 'Marcus feels a deep-seated anxiety as Caligula\'s unpredictable mood swings threaten their survival. He outwardly maintains composure but internally grapples with fear for his safety and loyalty to Claudius. His desperation to placate Caligula showcases an internal struggle between ambition and self-preservation.',
        ap.emotional_tags = ["marcus feels a deep-seated anxiety as caligula's unpredictable mood swings threaten their survival. he outwardly maintains composure but internally grapples with fear for his safety", "loyalty to claudius. his desperation to placate caligula showcases an internal struggle between ambition", "self-preservation.", "marcus feels a deep-seated anxiety as caligula's unpredictable mood swings threaten their survival. he outwardly maintains composure", "internally grapples with fear for his safety and loyalty to claudius. his desperation to placate caligula showcases an internal struggle between ambition and self-preservation."],
        ap.active_plans = ["To intervene and calm Caligula's temper when necessary.", "To ensure the safety of Claudius and Asprenas during the confrontation.", "To navigate the Emperor's rage to find a diplomatic solution."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, but self-preservation is crucial.", "Diplomacy may still serve as a path to survival amidst madness.", "Caligula's whims can be unpredictable and dangerous, requiring vigilance."],
        ap.goals = ["Short-term: To survive the immediate confrontation with Caligula.", "Medium-term: To establish a rapport with the Emperor to ensure future safety.", "Ultimate: To restore some stability within the chaos of the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Asprenas stands close to Marcus, his expression a mix of concern and determination. He exhibits a tense posture, ready to respond to Caligula\'s threats. His movements are subtle yet attentive, indicating his awareness of the volatile atmosphere in the room.',
        ap.emotional_state = 'Asprenas experiences anxiety but remains focused, driven by a sense of duty. He displays an outward composure, yet inside, he navigates fear of Caligula\'s unpredictable outbursts. His commitment to his comrades\' safety defines his internal struggle against the chaos surrounding them.',
        ap.emotional_tags = ["asprenas experiences anxiety but remains focused", "driven by a sense of duty. he displays an outward composure", "yet inside", "he navigates fear of caligula's unpredictable outbursts. his commitment to his comrades' safety defines his internal struggle against the chaos surrounding them.", "asprenas experiences anxiety", "remains focused, driven by a sense of duty. he displays an outward composure, yet inside, he navigates fear of caligula's unpredictable outbursts. his commitment to his comrades' safety defines his internal struggle against the chaos surrounding them."],
        ap.active_plans = ["To support Marcus in negotiating with Caligula.", "To keep a keen eye on Caligula's behavior for any signs of escalation.", "To ensure that any threats are defused before they escalate into violence."],
        ap.beliefs = ["The power dynamics in the Emperor's court are volatile and dangerous.", "Loyalty to comrades is vital for survival in the current climate.", "Rational dialogue may still be achievable despite Caligula's madness."],
        ap.goals = ["Short-term: To survive the encounter without incurring Caligula's wrath.", "Medium-term: To aid in preserving the fragile alliances within the court.", "Ultimate: To navigate through the court's treachery and restore stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Caligula dominates the Council Chamber with erratic movements and a commanding presence. He initially engages with Cassius, then pivots abruptly to confront Claudius, Marcus, and Asprenas upon their arrival. Pacing restlessly, he punctuates his volatile pronouncements with grand gestures, snatching Cassius\'s sword and brandishing it to emphasize his threats against the terrified envoys.',
        ap.emotional_state = 'Caligula\'s surface emotions are a tempest of rage, paranoia, and delusional grandeur. He projects an image of divine authority, yet beneath the surface lies deep insecurity and a fear of betrayal. His internal state is a chaotic mix of self-deification and paranoia, oscillating between laughter and violent threats, revealing a mind teetering on the brink of madness, desperate for control and validation.',
        ap.emotional_tags = ["caligula's surface emotions are a tempest of rage, paranoia,", "delusional grandeur. he projects an image of divine authority, yet beneath the surface lies deep insecurity", "a fear of betrayal. his internal state is a chaotic mix of self-deification", "paranoia, oscillating between laughter", "violent threats, revealing a mind teetering on the brink of madness, desperate for control", "validation.", "caligula's surface emotions are a tempest of rage", "paranoia", "and delusional grandeur. he projects an image of divine authority", "yet beneath the surface lies deep insecurity and a fear of betrayal. his internal state is a chaotic mix of self-deification and paranoia", "oscillating between laughter and violent threats", "revealing a mind teetering on the brink of madness", "desperate for control and validation."],
        ap.active_plans = ["To assert his absolute authority and divine status by instilling terror in those around him.", "To punish perceived disrespect and disobedience, particularly Claudius's 'failure' to bring the carts.", "To reinforce his delusional worldview by interpreting mundane events as conspiracies against his godhood."],
        ap.beliefs = ["He is a divine being, exempt from mortal constraints and entitled to absolute obedience.", "Disobedience or perceived slights are personal affronts and signs of treachery.", "Fear is the most effective means of maintaining control and demonstrating his power."],
        ap.goals = ["short_term\": \"To immediately punish Claudius and the envoys for their perceived offenses, solidifying his dominance in the moment.", "medium_term\": \"To maintain absolute power over Rome by cultivating an atmosphere of fear and unpredictable tyranny.", "ultimate\": \"To be universally recognized and worshipped as a god, ensuring his eternal legacy and unchallenged authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the Council Chamber with hesitant steps, bowing deeply to Caligula, attempting to fulfill his senatorial duty. He stands in stark contrast to Caligula\'s volatile energy, physically shrinking under the Emperor\'s wrath. He gesticulates nervously as he tries to explain the cart situation and later clutches at a scroll of Homer, desperately seeking refuge in classical verse to deflect Caligula\'s anger.',
        ap.emotional_state = 'Outwardly, Claudius displays profound terror, stammering apologies and bowing subserviently. His surface demeanor is one of utter fear and deference, a mask of feigned idiocy to deflect Caligula\'s unpredictable rage. Internally, he is acutely anxious and fighting for survival, employing his intellect and knowledge of classics as a shield. Beneath his fearful facade, there is a strategic mind calculating how to appease the mad emperor and ensure his own survival and that of his companions.',
        ap.emotional_tags = ["outwardly, claudius displays profound terror, stammering apologies", "bowing subserviently. his surface demeanor is one of utter fear", "deference, a mask of feigned idiocy to deflect caligula's unpredictable rage. internally, he is acutely anxious", "fighting for survival, employing his intellect", "knowledge of classics as a shield. beneath his fearful facade, there is a strategic mind calculating how to appease the mad emperor", "ensure his own survival", "that of his companions.", "outwardly", "claudius displays profound terror", "stammering apologies and bowing subserviently. his surface demeanor is one of utter fear and deference", "a mask of feigned idiocy to deflect caligula's unpredictable rage. internally", "he is acutely anxious and fighting for survival", "employing his intellect and knowledge of classics as a shield. beneath his fearful facade", "there is a strategic mind calculating how to appease the mad emperor and ensure his own survival and that of his companions."],
        ap.active_plans = ["To de-escalate Caligula's immediate anger by offering explanations, however futile, and appearing non-threatening.", "To use his scholarly knowledge and wit, specifically Homeric verses, as a tool to distract and placate Caligula's volatile mind.", "To protect himself and, if possible, Marcus and Asprenas from Caligula's lethal whims by diverting the emperor's attention."],
        ap.beliefs = ["Caligula is dangerously insane and completely unpredictable, making rational appeals useless.", "Survival in Caligula's court depends on appearing harmless, intellectually inferior, and utterly subservient.", "His knowledge and scholarly pursuits, often mocked, might be his only viable defense against Caligula's madness."],
        ap.goals = ["short_term\": \"To escape the immediate threat of being thrown into the river and survive the encounter in the Council Chamber.", "medium_term\": \"To return safely to Rome and the relative safety of the Senate, avoiding further direct confrontations with Caligula.", "ultimate\": \"To endure Caligula's reign, preserving his own life and dignity while navigating the treacherous political landscape, hoping for a return to some semblance of order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Marcus enters the chamber with Asprenas and Claudius, initially hesitant but attempting to present a respectful front. As Caligula\'s rage erupts, Marcus physically shrinks back, his movements becoming reactive and fear-driven. He gestures pleadingly, attempting to interject and placate Caligula, even invoking familial ties in a desperate bid to save himself and Asprenas from the emperor\'s wrath.',
        ap.emotional_state = 'Marcus is overtly terrified, his surface emotions dominated by fear and desperation. He pleads for mercy, revealing his vulnerability and the immediate threat he perceives. Internally, he is gripped by intense anxiety and a dawning realization of the extreme danger they are in. His attempt to invoke his familial connection reveals a desperate gamble, born of fear, highlighting the precariousness of their situation and the unpredictable nature of Caligula\'s tyranny.',
        ap.emotional_tags = ["marcus is overtly terrified, his surface emotions dominated by fear", "desperation. he pleads for mercy, revealing his vulnerability", "the immediate threat he perceives. internally, he is gripped by intense anxiety", "a dawning realization of the extreme danger they are in. his attempt to invoke his familial connection reveals a desperate gamble, born of fear, highlighting the precariousness of their situation", "the unpredictable nature of caligula's tyranny.", "marcus is overtly terrified", "his surface emotions dominated by fear and desperation. he pleads for mercy", "revealing his vulnerability and the immediate threat he perceives. internally", "he is gripped by intense anxiety and a dawning realization of the extreme danger they are in. his attempt to invoke his familial connection reveals a desperate gamble", "born of fear", "highlighting the precariousness of their situation and the unpredictable nature of caligula's tyranny."],
        ap.active_plans = ["To directly appeal to Caligula's mercy, hoping to trigger a moment of empathy or familial consideration.", "To verbally protest their innocence regarding any conspiracy with Neptune, attempting to counter Caligula's delusional accusations.", "To rely on Claudius's presence and perceived influence, hoping he can intercede and diffuse the situation before it escalates further."],
        ap.beliefs = ["Caligula's madness is a mortal threat, and reason is ineffective against it.", "Appealing to personal connections, however tenuous, might offer a slim chance of survival.", "Their lives are entirely at the whim of Caligula's unpredictable and tyrannical impulses."],
        ap.goals = ["short_term\": \"To survive the immediate threat of Caligula's violence and escape the Council Chamber alive.", "medium_term\": \"To return to Rome and distance himself from Caligula's dangerous presence and erratic court.", "ultimate\": \"To navigate the treacherous political landscape of Rome, ensuring his own survival and maintaining his position within the military and court structures, despite the prevailing chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Asprenas enters the Council Chamber alongside Marcus and Claudius, mirroring their hesitant demeanor. He remains largely in the background, physically shrinking and reacting to Caligula\'s outbursts with visible terror. He offers brief, fearful assurances of their innocence, but his actions are primarily characterized by silent compliance and a desperate attempt to remain inconspicuous and avoid drawing Caligula\'s attention directly.',
        ap.emotional_state = 'Asprenas\'s emotional state is dominated by abject terror and helplessness. His surface emotions are a reflection of pure fear, showing in his shrinking posture and minimal verbal contributions. Internally, he is overwhelmed by the unpredictable and life-threatening nature of Caligula\'s rage, feeling utterly powerless and reliant on the actions of Marcus and Claudius to navigate the situation. He embodies the fear gripping the court under Caligula\'s tyranny.',
        ap.emotional_tags = ["asprenas's emotional state is dominated by abject terror", "helplessness. his surface emotions are a reflection of pure fear, showing in his shrinking posture", "minimal verbal contributions. internally, he is overwhelmed by the unpredictable", "life-threatening nature of caligula's rage, feeling utterly powerless", "reliant on the actions of marcus", "claudius to navigate the situation. he embodies the fear gripping the court under caligula's tyranny.", "asprenas's emotional state is dominated by abject terror and helplessness. his surface emotions are a reflection of pure fear", "showing in his shrinking posture and minimal verbal contributions. internally", "he is overwhelmed by the unpredictable and life-threatening nature of caligula's rage", "feeling utterly powerless and reliant on the actions of marcus and claudius to navigate the situation. he embodies the fear gripping the court under caligula's tyranny."],
        ap.active_plans = ["To remain silent and compliant, avoiding any action or word that might provoke Caligula's ire further.", "To rely on Marcus and Claudius to speak and negotiate on their behalf, hoping their interventions will appease the emperor.", "To become as inconspicuous as possible, hoping to blend into the background and avoid becoming a direct target of Caligula's madness."],
        ap.beliefs = ["Caligula is a force of irrational and deadly power, against which resistance is futile.", "Silence and compliance are the safest strategies for survival in Caligula's presence.", "His personal safety depends on the actions and interventions of others, particularly Marcus and Claudius, who are taking the lead in addressing Caligula."],
        ap.goals = ["short_term\": \"To survive the immediate encounter in the Council Chamber without attracting Caligula's direct attention or wrath.", "medium_term\": \"To escape the chamber and return to a place of relative safety, distancing himself from Caligula's immediate proximity.", "ultimate\": \"To continue serving in his military role while minimizing exposure to Caligula's unpredictable behavior, seeking to maintain a low profile and avoid becoming a target of the emperor's tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously in the Council Chamber, pacing erratically with wild eyes. He gestures violently, demanding respect and obedience from those around him, revealing his volatile nature as he prepares to mete out punishment for perceived slights.',
        ap.emotional_state = 'Caligula\'s surface emotions oscillate between manic glee and raging fury. He appears whimsical, yet underneath lies a deep-seated paranoia and insecurity, feeling threatened by any challenge to his authority. His laughter masks a tempest of rage as he contemplates punishing Marcus Vinicius for the supposed slight.',
        ap.emotional_tags = ["caligula's surface emotions oscillate between manic glee", "raging fury. he appears whimsical, yet underneath lies a deep-seated paranoia", "insecurity, feeling threatened by any challenge to his authority. his laughter masks a tempest of rage as he contemplates punishing marcus vinicius for the supposed slight.", "caligula's surface emotions oscillate between manic glee and raging fury. he appears whimsical", "yet underneath lies a deep-seated paranoia and insecurity", "feeling threatened by any challenge to his authority. his laughter masks a tempest of rage as he contemplates punishing marcus vinicius for the supposed slight."],
        ap.active_plans = ["To assert his dominance over the Senate and quell any perceived insubordination.", "To intimidate Claudius and his fellow envoys, establishing fear as a tool of control.", "To solidify his divine status by engaging in grandiose rhetoric and displays of power."],
        ap.beliefs = ["He is superior to all, viewing himself as a divine figure above mere mortals.", "Any challenge to his authority is a direct threat that must be eliminated.", "Fear is a necessary tool for maintaining control over those who serve him."],
        ap.goals = ["Short-term: To punish Marcus and Asprenas for their arrival without the promised carts.", "Medium-term: To reinforce his authority and discourage any further dissent among the Senate.", "Ultimate: To be recognized as an invincible god-emperor, feared and revered."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands uncertainly, bowing deeply as he enters the chamber, his physical presence marked by a hesitant demeanor. As he interjects with Homeric verses, he clutches the scroll nervously, fumbling with the words in a desperate attempt to calm Caligula.',
        ap.emotional_state = 'Claudius appears outwardly calm yet is internally fraught with anxiety and fear. His stammer reflects his nervousness as he navigates the treacherous waters of Caligula\'s mood, driven by a mix of self-preservation and genuine concern for his fellow envoys.',
        ap.emotional_tags = ["claudius appears outwardly calm yet is internally fraught with anxiety", "fear. his stammer reflects his nervousness as he navigates the treacherous waters of caligula's mood, driven by a mix of self-preservation", "genuine concern for his fellow envoys.", "claudius appears outwardly calm yet is internally fraught with anxiety and fear. his stammer reflects his nervousness as he navigates the treacherous waters of caligula's mood", "driven by a mix of self-preservation and genuine concern for his fellow envoys."],
        ap.active_plans = ["To use his knowledge of Homeric verses to flatter Caligula and divert his wrath.", "To save Marcus and Asprenas from immediate execution.", "To navigate the precarious political landscape by appeasing Caligula while maintaining his own dignity."],
        ap.beliefs = ["Survival in the court requires quick wit and strategic flattery.", "Caligula\u2019s unpredictable nature demands careful navigation to avoid personal peril.", "Intellectual prowess can be a shield against the brutality of power."],
        ap.goals = ["Short-term: To defuse Caligula's anger and save Marcus and Asprenas.", "Medium-term: To stabilize his own position in the court amidst the chaos.", "Ultimate: To maintain a semblance of order and protect his own life while striving for dignity in a mad world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Marcus stands in front of Caligula, visibly trembling and pleading for mercy. His body language is defensive, demonstrating a mix of fear and desperation as he attempts to articulate his innocence amidst chaotic accusations.',
        ap.emotional_state = 'Marcus\'s external demeanor is one of urgent pleading, his voice strained and panicked as he tries to appeal to Caligula\'s better nature. Internally, he grapples with a growing sense of despair, recognizing the precariousness of his life as he faces the wrath of an unstable emperor.',
        ap.emotional_tags = ["marcus's external demeanor is one of urgent pleading, his voice strained", "panicked as he tries to appeal to caligula's better nature. internally, he grapples with a growing sense of despair, recognizing the precariousness of his life as he faces the wrath of an unstable emperor.", "marcus's external demeanor is one of urgent pleading", "his voice strained and panicked as he tries to appeal to caligula's better nature. internally", "he grapples with a growing sense of despair", "recognizing the precariousness of his life as he faces the wrath of an unstable emperor."],
        ap.active_plans = ["To plead for his life and that of Asprenas, attempting to convey their loyalty.", "To deflect blame away from himself and his companions, arguing against accusations of conspiracy.", "To seek a moment of clarity from Caligula to negotiate their safety."],
        ap.beliefs = ["Loyalty to the Emperor should be rewarded, not punished.", "He must appeal to Caligula's ego to survive in this precarious situation.", "Despite Caligula's madness, there is a slim chance for mercy if he can cleverly navigate the conversation."],
        ap.goals = ["Short-term: To ensure his and Asprenas' immediate safety from execution.", "Medium-term: To maintain his standing within the military and avoid Caligula's ire.", "Ultimate: To restore order in Rome and oppose Caligula's tyrannical reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Asprenas stands nervously beside Marcus, mirroring his fear as he attempts to dissuade Caligula’s accusations. His posture is tense and defensive, reflecting the anxiety of being caught in a deadly game of politics.',
        ap.emotional_state = 'Asprenas displays a facade of calm, yet internally he is riddled with dread. He fears for his life and recognizes the absurdity of the situation, feeling the weight of impending doom as he pleads for understanding from the Emperor.',
        ap.emotional_tags = ["asprenas displays a facade of calm, yet internally he is riddled with dread. he fears for his life", "recognizes the absurdity of the situation, feeling the weight of impending doom as he pleads for understanding from the emperor.", "asprenas displays a facade of calm", "yet internally he is riddled with dread. he fears for his life and recognizes the absurdity of the situation", "feeling the weight of impending doom as he pleads for understanding from the emperor."],
        ap.active_plans = ["To support Marcus in their pleas for mercy, echoing his arguments.", "To distance himself from any implication of conspiracy with Neptune.", "To remain poised and composed, hoping that rationality prevails in Caligula's erratic mood."],
        ap.beliefs = ["Caligula's whims can be unpredictable, and survival hinges on appealing to his sense of humor.", "The power dynamic is dangerously tilted in favor of the Emperor, forcing strategic submission.", "Fear can be a motivator for rationality, and perhaps Caligula will be merciful."],
        ap.goals = ["Short-term: To avoid execution by convincing Caligula of their innocence.", "Medium-term: To maintain his reputation in the military by not being associated with failure.", "Ultimate: To see Rome free from tyranny and the chaos surrounding Caligula's madness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Cassius stands quietly, his expression inscrutable as he observes the rapid turn of events with a stoic demeanor. He remains steady by Caligula\'s side, embodying the tension of a soldier caught between duty and impending chaos.',
        ap.emotional_state = 'Cassius maintains a calm exterior, yet internally, he feels a brewing storm of unease. He knows the volatility of Caligula and the potential for violence, feeling the weight of the moment as he contemplates the implications of the Emperor\'s wrath.',
        ap.emotional_tags = ["cassius maintains a calm exterior, yet internally, he feels a brewing storm of unease. he knows the volatility of caligula", "the potential for violence, feeling the weight of the moment as he contemplates the implications of the emperor's wrath.", "cassius maintains a calm exterior", "yet internally", "he feels a brewing storm of unease. he knows the volatility of caligula and the potential for violence", "feeling the weight of the moment as he contemplates the implications of the emperor's wrath."],
        ap.active_plans = ["To support Caligula\u2019s authority while assessing the mood in the room for any opportunity.", "To prepare for any potential fallout from Caligula's decisions, staying alert for danger.", "To remain loyal, but privately evaluate the growing tensions and considering his own position."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, but survival must come first.", "Caligula's descent into madness creates an unpredictable and dangerous environment.", "The time for rebellion may soon come, but patience is required for the right moment."],
        ap.goals = ["Short-term: To maintain his position and reassure Caligula of his loyalty.", "Medium-term: To navigate the complexities of court life without inciting Caligula\u2019s wrath.", "Ultimate: To reclaim a sense of order from the chaos of tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Caligula dominates the Council Chamber, pacing and gesticulating wildly as he holds court. He shifts rapidly from furious pronouncements of violence against Claudius, Marcus, and Asprenas, drawing Cassius\'s sword to emphasize his threats, to moments of bizarre amusement at Claudius\'s recitation. He exits the chamber clapping Cassius on the shoulder, leaving the others bewildered by his capricious nature.',
        ap.emotional_state = 'Caligula is a whirlwind of volatile emotions, oscillating between explosive rage and unsettling amusement. Outwardly, he projects tyrannical fury and capricious whimsy, laughing manically one moment and threatening brutal violence the next. Beneath this chaotic surface, there\'s a palpable insecurity and a desperate need for validation, evident in his questioning Claudius about his sanity and divine status. His erratic behavior suggests a mind teetering on the brink of madness, driven by paranoia and a thirst for absolute control.',
        ap.emotional_tags = ["caligula is a whirlwind of volatile emotions, oscillating between explosive rage", "unsettling amusement. outwardly, he projects tyrannical fury", "capricious whimsy, laughing manically one moment", "threatening brutal violence the next. beneath this chaotic surface, there's a palpable insecurity", "a desperate need for validation, evident in his questioning claudius about his sanity", "divine status. his erratic behavior suggests a mind teetering on the brink of madness, driven by paranoia", "a thirst for absolute control.", "caligula is a whirlwind of volatile emotions", "oscillating between explosive rage and unsettling amusement. outwardly", "he projects tyrannical fury and capricious whimsy", "laughing manically one moment and threatening brutal violence the next. beneath this chaotic surface", "there's a palpable insecurity and a desperate need for validation", "evident in his questioning claudius about his sanity and divine status. his erratic behavior suggests a mind teetering on the brink of madness", "driven by paranoia and a thirst for absolute control."],
        ap.active_plans = ["To assert his absolute power and divine authority through unpredictable displays of rage and mercy.", "To seek reassurance about his sanity and godhood, probing Claudius for validation.", "To prepare for his upcoming military campaign, viewing it as another opportunity to demonstrate his divine power and triumph over perceived enemies like Neptune."],
        ap.beliefs = ["He believes he is a god, entitled to unquestioning obedience and worship.", "He believes everyone around him is potentially treacherous and plotting against him.", "He believes displays of extreme power and cruelty are necessary to maintain control and instill fear."],
        ap.goals = ["Short-term: To be obeyed and feared by everyone present in the Council Chamber.", "Medium-term: To achieve a glorious military victory and solidify his image as a divine and powerful ruler.", "Ultimate: To be universally recognized and worshipped as a living god, surpassing all mortal constraints and criticisms."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the chamber with trepidation, bowing deeply before Caligula. Initially, he is the terrified supplicant, stammering apologies and pleas for mercy as Caligula threatens him. He then transforms into a quick-witted scholar, seizing the opportunity to recite Homer, skillfully adapting the verses to flatter Caligula\'s ego and deflect the emperor\'s wrath. He maintains a posture of subservience and intellectual humility throughout, carefully choosing his words to survive.',
        ap.emotional_state = 'Claudius is gripped by intense fear for his life and the lives of Marcus and Asprenas, outwardly displaying terror and desperation when Caligula threatens violence. However, beneath this fear lies a sharp intellect and pragmatic cunning. He swiftly suppresses his panic and accesses his scholarly knowledge as a survival mechanism, using flattery and wit as weapons. There\'s a subtle tension between his genuine fear and his calculated deployment of intellect to manipulate the situation, highlighting his pragmatic approach to survival in a dangerous court.',
        ap.emotional_tags = ["claudius is gripped by intense fear for his life", "the lives of marcus", "asprenas, outwardly displaying terror", "desperation when caligula threatens violence. however, beneath this fear lies a sharp intellect", "pragmatic cunning. he swiftly suppresses his panic", "accesses his scholarly knowledge as a survival mechanism, using flattery", "wit as weapons. there's a subtle tension between his genuine fear", "his calculated deployment of intellect to manipulate the situation, highlighting his pragmatic approach to survival in a dangerous court.", "claudius is gripped by intense fear for his life and the lives of marcus and asprenas", "outwardly displaying terror and desperation when caligula threatens violence. however", "beneath this fear lies a sharp intellect and pragmatic cunning. he swiftly suppresses his panic and accesses his scholarly knowledge as a survival mechanism", "using flattery and wit as weapons. there's a subtle tension between his genuine fear and his calculated deployment of intellect to manipulate the situation", "highlighting his pragmatic approach to survival in a dangerous court."],
        ap.active_plans = ["To immediately defuse Caligula's rage and prevent him from carrying out his threats of violence against himself and the others.", "To leverage his scholarly knowledge and quick wit to appease Caligula's ego and redirect his attention.", "To maintain a non-threatening and subservient demeanor, reinforcing Caligula's sense of superiority and control, thus ensuring their survival."],
        ap.beliefs = ["He believes that survival under Caligula's tyranny necessitates appeasement, flattery, and intellectual maneuvering.", "He believes that his scholarly knowledge, often dismissed by others, can be a powerful tool for self-preservation in unexpected situations.", "He believes that direct confrontation with Caligula is futile and suicidal, making strategic subservience the only viable path to navigate the emperor's madness."],
        ap.goals = ["Short-term: To survive this immediate encounter with Caligula and ensure the safety of himself, Marcus, and Asprenas.", "Medium-term: To continue navigating Caligula's reign by remaining inconspicuous and avoiding becoming a target of the emperor's erratic whims.", "Ultimate: To survive the chaos of Caligula's rule and potentially witness or contribute to a more stable and sane future for Rome, though his immediate focus is personal survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Marcus enters the Council Chamber with a mix of apprehension and duty, quickly finding himself subjected to Caligula\'s volatile fury. He shrinks back in terror as Caligula threatens violence, his body language reflecting fear and desperation. He attempts to plead for mercy, invoking his familial connection to Caligula, highlighting his vulnerability and dependence on Caligula\'s unpredictable whims for survival.',
        ap.emotional_state = 'Marcus is consumed by terror throughout the event. Outwardly, he displays abject fear, pleading for his life and that of Asprenas. Internally, he is likely experiencing a profound sense of helplessness and vulnerability under Caligula\'s arbitrary power. His desperate invocation of his wife, Caligula\'s sister, reveals his reliance on personal appeals in the face of irrational tyranny, highlighting the precariousness of his position and the constant threat of sudden death in Caligula\'s court.',
        ap.emotional_tags = ["marcus is consumed by terror throughout the event. outwardly, he displays abject fear, pleading for his life", "that of asprenas. internally, he is likely experiencing a profound sense of helplessness", "vulnerability under caligula's arbitrary power. his desperate invocation of his wife, caligula's sister, reveals his reliance on personal appeals in the face of irrational tyranny, highlighting the precariousness of his position", "the constant threat of sudden death in caligula's court.", "marcus is consumed by terror throughout the event. outwardly", "he displays abject fear", "pleading for his life and that of asprenas. internally", "he is likely experiencing a profound sense of helplessness and vulnerability under caligula's arbitrary power. his desperate invocation of his wife", "caligula's sister", "reveals his reliance on personal appeals in the face of irrational tyranny", "highlighting the precariousness of his position and the constant threat of sudden death in caligula's court."],
        ap.active_plans = ["To survive Caligula's immediate rage and avoid being killed for the perceived offense of arriving without the carts.", "To reassure Caligula of his loyalty and lack of any malicious intent, attempting to dispel any suspicion of conspiracy.", "To leverage any personal connection or appeal, such as mentioning his marriage to Caligula's sister, in a desperate attempt to evoke mercy or familial consideration."],
        ap.beliefs = ["He believes Caligula is utterly irrational and dangerously unpredictable, capable of lethal violence on a whim.", "He believes that personal appeals and reminders of familial ties might offer a slim chance of survival in the face of Caligula's madness.", "He believes that life under Caligula is a constant state of precariousness, where even loyal service offers no guarantee of safety."],
        ap.goals = ["Short-term: To escape the Council Chamber alive and unharmed, along with Asprenas, and avoid immediate execution.", "Medium-term: To navigate the dangers of Caligula's court by remaining inconspicuous and avoiding any action that might provoke the emperor's wrath.", "Ultimate: To survive Caligula's reign and potentially see a return to a more stable and less terrifying political environment in Rome, though his immediate focus is moment-to-moment survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Asprenas enters the Council Chamber with Marcus and Claudius, mirroring their hesitant and respectful demeanor. When Caligula erupts in anger, Asprenas visibly shrinks back, displaying fear and deference. He supports Marcus in pleading their case to Caligula, echoing assurances of their innocence and loyalty, emphasizing his reactive role in the face of imperial tyranny.',
        ap.emotional_state = 'Asprenas is characterized by a palpable fear and anxiety throughout the encounter. Outwardly, he shows clear signs of terror, reacting physically to Caligula\'s threats and seeking to appease the emperor. Internally, he likely feels a profound sense of powerlessness and vulnerability, his emotional state dominated by the immediate threat to his life. His relief when Claudius\'s intervention saves them is evident, underscoring the immense tension and danger he perceived.',
        ap.emotional_tags = ["asprenas is characterized by a palpable fear", "anxiety throughout the encounter. outwardly, he shows clear signs of terror, reacting physically to caligula's threats", "seeking to appease the emperor. internally, he likely feels a profound sense of powerlessness", "vulnerability, his emotional state dominated by the immediate threat to his life. his relief when claudius's intervention saves them is evident, underscoring the immense tension", "danger he perceived.", "asprenas is characterized by a palpable fear and anxiety throughout the encounter. outwardly", "he shows clear signs of terror", "reacting physically to caligula's threats and seeking to appease the emperor. internally", "he likely feels a profound sense of powerlessness and vulnerability", "his emotional state dominated by the immediate threat to his life. his relief when claudius's intervention saves them is evident", "underscoring the immense tension and danger he perceived."],
        ap.active_plans = ["To survive the immediate threat posed by Caligula's rage and avoid becoming a target of his violence.", "To support Marcus's efforts to placate Caligula, reinforcing their collective plea for mercy and assurances of loyalty.", "To remain as inconspicuous as possible, avoiding any action or word that might further provoke Caligula's unpredictable temper."],
        ap.beliefs = ["He believes that Caligula's power is absolute and terrifying, and that resistance or defiance is unthinkable.", "He believes that survival depends entirely on appeasing Caligula and avoiding any action that might be misconstrued as disloyalty or disrespect.", "He believes that their lives are completely at the whim of the emperor, highlighting the arbitrary and dangerous nature of Caligula's rule."],
        ap.goals = ["Short-term: To escape the Council Chamber alive and unharmed, relying on Claudius and Marcus to navigate the situation.", "Medium-term: To remain unnoticed and avoid drawing Caligula's attention in the future, minimizing the risk of future encounters.", "Ultimate: To survive the tumultuous reign of Caligula and hope for a return to a more stable and predictable political climate, though his immediate concern is survival in the present moment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_5'})
    ON CREATE SET
        ap.current_status = 'Cassius remains rigidly at Caligula\'s side throughout the tumultuous event, a stoic figure amidst the emperor\'s chaotic outburst and the courtiers\' terror. He observes Caligula\'s erratic behavior with an impassive face, maintaining professional composure even as Caligula grabs his sword and behaves increasingly erratically. His brief interaction with Caligula about the watchword is delivered with a mask of unreadable neutrality.',
        ap.emotional_state = 'Cassius maintains an outward facade of impassivity, betraying no emotion as he witnesses Caligula\'s madness and the fear of the others. Internally, he is likely experiencing a growing sense of disgust and grim resolve. Caligula\'s increasingly erratic and tyrannical behavior likely reinforces his determination to proceed with the conspiracy. His controlled demeanor masks a simmering dissent and a calculated resolve, creating a stark contrast with the overt emotional displays of Caligula and the courtiers.',
        ap.emotional_tags = ["cassius maintains an outward facade of impassivity, betraying no emotion as he witnesses caligula's madness", "the fear of the others. internally, he is likely experiencing a growing sense of disgust", "grim resolve. caligula's increasingly erratic", "tyrannical behavior likely reinforces his determination to proceed with the conspiracy. his controlled demeanor masks a simmering dissent", "a calculated resolve, creating a stark contrast with the overt emotional displays of caligula", "the courtiers.", "cassius maintains an outward facade of impassivity", "betraying no emotion as he witnesses caligula's madness and the fear of the others. internally", "he is likely experiencing a growing sense of disgust and grim resolve. caligula's increasingly erratic and tyrannical behavior likely reinforces his determination to proceed with the conspiracy. his controlled demeanor masks a simmering dissent and a calculated resolve", "creating a stark contrast with the overt emotional displays of caligula and the courtiers."],
        ap.active_plans = ["To maintain his professional facade and avoid betraying any hint of dissent or disapproval of Caligula's behavior.", "To carefully observe Caligula's escalating madness and the reactions of others, gathering information and assessing the political climate.", "To continue planning and preparing for the conspiracy against Caligula, recognizing the increasing urgency and justification for action in light of the emperor's tyranny."],
        ap.beliefs = ["He believes Caligula's reign is becoming increasingly intolerable and poses an existential threat to Rome.", "He believes that decisive action, including regicide, is necessary to liberate Rome from Caligula's tyranny and restore order.", "He believes in maintaining stoicism and discipline, even in the face of extreme chaos and emotional volatility, as essential qualities for effective action and leadership."],
        ap.goals = ["Short-term: To remain undetected in his dissent and continue to gather information while maintaining his position close to Caligula.", "Medium-term: To finalize the conspiracy and execute the assassination of Caligula, effectively removing the tyrant from power.", "Ultimate: To restore order and stability to Rome by ending Caligula's reign, paving the way for a more just and rational governance, though his immediate focus is the successful execution of the conspiracy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously at the helm of the chaotic council chamber, his posture exuding a manic energy. He paces restlessly, eyes darting with wild intensity, and gestures dramatically as he berates Claudius for the absence of his carts. His erratic movements and theatrical proclamations create an atmosphere thick with his unpredictable fervor.',
        ap.emotional_state = 'Caligula oscillates between euphoria and rage, his laughter harsh and erratic, reflecting a surface joy that masks deeper insecurities and a volatile temperament. He revels in power, yet is simultaneously plagued by paranoia, fearing plots against him. This creates a stark dissonance between his outward bravado and the tumultuous chaos within, hinting at the instability that drives his tyranny.',
        ap.emotional_tags = ["caligula oscillates between euphoria", "rage, his laughter harsh", "erratic, reflecting a surface joy that masks deeper insecurities", "a volatile temperament. he revels in power, yet is simultaneously plagued by paranoia, fearing plots against him. this creates a stark dissonance between his outward bravado", "the tumultuous chaos within, hinting at the instability that drives his tyranny.", "caligula oscillates between euphoria and rage", "his laughter harsh and erratic", "reflecting a surface joy that masks deeper insecurities and a volatile temperament. he revels in power", "yet is simultaneously plagued by paranoia", "fearing plots against him. this creates a stark dissonance between his outward bravado and the tumultuous chaos within", "hinting at the instability that drives his tyranny."],
        ap.active_plans = ["To humiliate Claudius and assert his dominance over the Senate by enforcing absurd demands.", "To maintain an air of chaotic control that fosters fear among his advisors and subjects.", "To plan a grandiose military campaign against Neptune and the Germans, seeking glory and validation."],
        ap.beliefs = ["Power is best maintained through fear and absurdity.", "He is a god, entitled to absolute loyalty and reverence from his subjects.", "Any sign of dissent must be met with ruthless reprisals to uphold authority."],
        ap.goals = ["Short-term: To establish immediate control over the council and assert authority over Claudius.", "Medium-term: To launch a campaign that reinforces his status as a divine ruler and military leader.", "Ultimate: To solidify his legacy and god-like status within Rome, quashing any potential threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_6'})
    ON CREATE SET
        ap.current_status = 'Cassius stands rigidly beside Caligula, a silent sentinel amidst the chaos. His posture is stoic, arms crossed, betraying no hint of the internal turmoil he feels. He watches his Emperor with a mix of apprehension and disdain as Caligula revels in his cruelty, a tension evident in his tightly clenched jaw and narrowed eyes.',
        ap.emotional_state = 'Cassius\'s outward demeanor is marked by impassivity, but beneath lies a simmering unease and deep-seated resentment towards Caligula\'s erratic behavior. He grapples with conflicting emotions of loyalty to the Emperor and the growing desire to rebel against his tyranny. This internal struggle reflects the precarious balance he must maintain to survive in the treacherous political landscape.',
        ap.emotional_tags = ["cassius's outward demeanor is marked by impassivity, but beneath lies a simmering unease", "deep-seated resentment towards caligula's erratic behavior. he grapples with conflicting emotions of loyalty to the emperor", "the growing desire to rebel against his tyranny. this internal struggle reflects the precarious balance he must maintain to survive in the treacherous political landscape.", "cassius's outward demeanor is marked by impassivity", "but beneath lies a simmering unease and deep-seated resentment towards caligula's erratic behavior. he grapples with conflicting emotions of loyalty to the emperor and the growing desire to rebel against his tyranny. this internal struggle reflects the precarious balance he must maintain to survive in the treacherous political landscape.", "cassius's outward demeanor is marked by impassivity,", "beneath lies a simmering unease and deep-seated resentment towards caligula's erratic behavior. he grapples with conflicting emotions of loyalty to the emperor and the growing desire to rebel against his tyranny. this internal struggle reflects the precarious balance he must maintain to survive in the treacherous political landscape."],
        ap.active_plans = ["To observe and gather information on Caligula's erratic behavior for potential leverage.", "To maintain a fa\u00e7ade of loyalty while contemplating the feasibility of a conspiracy against the Emperor.", "To prepare himself for the inevitable confrontation that will arise from Caligula's madness."],
        ap.beliefs = ["Loyalty to the Emperor is crucial but must be balanced with personal safety.", "Caligula's madness poses a direct threat to the stability of Rome.", "A soldier's duty extends beyond mere obedience to the necessity of righteous rebellion against tyranny."],
        ap.goals = ["Short-term: To navigate the immediate chaos without drawing the ire of Caligula.", "Medium-term: To align with fellow conspirators as the climate for rebellion intensifies.", "Ultimate: To liberate Rome from Caligula's tyranny and restore order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Cassius stands firm and resolute, his body language conveying a soldier\'s stoic demeanor even as the Emperor departs in a fit of manic laughter. He turns to Claudius, his gaze direct and unwavering, delivering his grim prophecy with a quiet intensity that underscores the gravity of his words. He remains in the Council Chamber, grounded and watchful.',
        ap.emotional_state = 'Beneath his impassive exterior, Cassius harbors a deep well of grim determination and suppressed anger. He is outwardly calm, reflecting his military discipline, but internally he is burdened by the weight of Rome\'s precarious situation under Caligula\'s tyranny. There\'s a palpable sense of foreboding in his tone, a quiet despair mixed with an unyielding resolve to act against the madness consuming the empire. His emotional restraint masks a profound sense of urgency and danger.',
        ap.emotional_tags = ["beneath his impassive exterior, cassius harbors a deep well of grim determination", "suppressed anger. he is outwardly calm, reflecting his military discipline, but internally he is burdened by the weight of rome's precarious situation under caligula's tyranny. there's a palpable sense of foreboding in his tone, a quiet despair mixed with an unyielding resolve to act against the madness consuming the empire. his emotional restraint masks a profound sense of urgency", "danger.", "beneath his impassive exterior", "cassius harbors a deep well of grim determination and suppressed anger. he is outwardly calm", "reflecting his military discipline", "but internally he is burdened by the weight of rome's precarious situation under caligula's tyranny. there's a palpable sense of foreboding in his tone", "a quiet despair mixed with an unyielding resolve to act against the madness consuming the empire. his emotional restraint masks a profound sense of urgency and danger.", "beneath his impassive exterior, cassius harbors a deep well of grim determination and suppressed anger. he is outwardly calm, reflecting his military discipline,", "internally he is burdened by the weight of rome's precarious situation under caligula's tyranny. there's a palpable sense of foreboding in his tone, a quiet despair mixed with an unyielding resolve to act against the madness consuming the empire. his emotional restraint masks a profound sense of urgency and danger."],
        ap.active_plans = ["To explicitly warn Claudius about the pervasive threat of death under Caligula's rule.", "To gauge Claudius's reaction to the stark reality and potentially assess his willingness to consider more drastic measures.", "To solidify the atmosphere of tension and urgency, reinforcing the need for decisive action against Caligula."],
        ap.beliefs = ["Caligula's reign is not just erratic but fundamentally dangerous and life-threatening to everyone.", "The current state of affairs is unsustainable and will inevitably lead to widespread chaos and destruction.", "Direct and decisive action is necessary to remove Caligula from power, regardless of the personal risk."],
        ap.goals = ["short-term\": \"To ensure Claudius fully grasps the immediate and constant threat of Caligula's unpredictable tyranny.", "medium-term\": \"To strengthen the resolve of potential allies and further solidify the conspiracy against Caligula.", "ultimate\": \"To liberate Rome from Caligula's tyrannical rule and restore a semblance of order and justice, even if through violent means."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_7'})
    ON CREATE SET
        ap.current_status = 'Claudius stands slightly bewildered, his stammer momentarily absent as he directly addresses Cassius, seeking clarification on the soldier\'s ominous statement. He is positioned near Cassius in the Council Chamber, having just been dismissed by Caligula, and now finds himself in a private, intense conversation with the hardened soldier, his posture suggesting a mix of confusion and apprehension.',
        ap.emotional_state = 'Claudius is caught between his ingrained fear and a dawning realization of the gravity of Cassius\'s words. Outwardly, he displays a hesitant curiosity, questioning Cassius about the \'joke\' watchword, trying to maintain a semblance of detachment and intellectual curiosity. However, internally, he is deeply unsettled by the starkness of Cassius\'s prophecy, the casual mention of death penetrating his usual defenses. A conflict arises between his desire to downplay the danger and the undeniable reality of Caligula\'s madness, creating a palpable tension.',
        ap.emotional_tags = ["claudius is caught between his ingrained fear", "a dawning realization of the gravity of cassius's words. outwardly, he displays a hesitant curiosity, questioning cassius about the 'joke' watchword, trying to maintain a semblance of detachment", "intellectual curiosity. however, internally, he is deeply unsettled by the starkness of cassius's prophecy, the casual mention of death penetrating his usual defenses. a conflict arises between his desire to downplay the danger", "the undeniable reality of caligula's madness, creating a palpable tension.", "claudius is caught between his ingrained fear and a dawning realization of the gravity of cassius's words. outwardly", "he displays a hesitant curiosity", "questioning cassius about the 'joke' watchword", "trying to maintain a semblance of detachment and intellectual curiosity. however", "internally", "he is deeply unsettled by the starkness of cassius's prophecy", "the casual mention of death penetrating his usual defenses. a conflict arises between his desire to downplay the danger and the undeniable reality of caligula's madness", "creating a palpable tension."],
        ap.active_plans = ["To understand the full implication of Cassius's grim prediction and assess the level of immediate danger.", "To process the shift in tone from Caligula's chaotic outburst to Cassius's chillingly calm warning.", "To subtly probe Cassius's intentions and gauge whether the soldier's words are merely a warning or a prelude to action."],
        ap.beliefs = ["Caligula's madness is a source of chaos and discomfort, but perhaps not an immediate, personal threat to him.", "Maintaining a low profile and intellectual detachment is the best strategy for survival in the current climate.", "Direct confrontation or involvement in political schemes is inherently dangerous and should be avoided at all costs."],
        ap.goals = ["short-term\": \"To fully comprehend Cassius's warning and its immediate implications for his own safety.", "medium-term\": \"To reassess his strategy for survival under Caligula's reign in light of Cassius's stark assessment.", "ultimate\": \"To navigate the treacherous political landscape and ensure his personal safety, ideally without being drawn into dangerous conspiracies or confrontations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously in the council chamber, his posture tense and erratic. He paces with an air of dominion, gesturing wildly as he berates his subordinates. His movements are animated, embodying an emperor whose paranoia and delusions manifest physically as he threatens violence against those present.',
        ap.emotional_state = 'Caligula outwardly exudes madness and bravado, his laughter ringing hollow in the chamber. Yet beneath this facade lies a tumult of insecurity and paranoia, as he questions his own sanity and revels in the humiliation of Cassius. His emotional core is a turbulent mix of anger, desperation, and a desperate need to assert dominance.',
        ap.emotional_tags = ["caligula outwardly exudes madness", "bravado, his laughter ringing hollow in the chamber. yet beneath this facade lies a tumult of insecurity", "paranoia, as he questions his own sanity", "revels in the humiliation of cassius. his emotional core is a turbulent mix of anger, desperation,", "a desperate need to assert dominance.", "caligula outwardly exudes madness and bravado", "his laughter ringing hollow in the chamber. yet beneath this facade lies a tumult of insecurity and paranoia", "as he questions his own sanity and revels in the humiliation of cassius. his emotional core is a turbulent mix of anger", "desperation", "and a desperate need to assert dominance."],
        ap.active_plans = ["To humiliate Cassius by using his past as a tool for mockery and control.", "To assert his authority over the envoys by threatening violence to reinforce his power.", "To distract from his own paranoia by projecting guilt and suspicion onto others."],
        ap.beliefs = ["Power must be maintained through fear, and asserting dominance is essential.", "Betrayal is around every corner, and loyalty is a transient illusion.", "His perceived divinity and superiority justify his cruel actions."],
        ap.goals = ["Short-term: To intimidate and control his subordinates through terror.", "Medium-term: To eliminate any threats to his reign by sowing distrust among his advisors.", "Ultimate: To solidify his position as an unassailable god-emperor, feared and revered."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_8'})
    ON CREATE SET
        ap.current_status = 'Claudius stands somewhat hunched as he enters the council chamber, bowing deeply before Caligula. He fumbles with his scroll, revealing his anxiety as he attempts to appease the volatile emperor. His body language reflects his hesitance and fear, especially as tensions rise with Caligula\'s threats.',
        ap.emotional_state = 'Claudius displays a facade of respect and submission, though his underlying fear is palpable. He tries to maintain a calm demeanor even as he stammers through his responses, highlighting his internal conflict between deference to Caligula and the turmoil of the chaotic situation. His emotional state is one of apprehension and a desire for survival amidst madness.',
        ap.emotional_tags = ["claudius displays a facade of respect", "submission, though his underlying fear is palpable. he tries to maintain a calm demeanor even as he stammers through his responses, highlighting his internal conflict between deference to caligula", "the turmoil of the chaotic situation. his emotional state is one of apprehension", "a desire for survival amidst madness.", "claudius displays a facade of respect and submission", "though his underlying fear is palpable. he tries to maintain a calm demeanor even as he stammers through his responses", "highlighting his internal conflict between deference to caligula and the turmoil of the chaotic situation. his emotional state is one of apprehension and a desire for survival amidst madness."],
        ap.active_plans = ["To appease Caligula by utilizing his knowledge of literature to divert attention.", "To mitigate the situation with humor and intellect to avoid angering the emperor.", "To navigate the treacherous waters of court politics while maintaining his own safety."],
        ap.beliefs = ["Survival in the court requires cunning and adaptability in the face of tyranny.", "Knowledge can be a tool for both empowerment and protection, even in perilous situations.", "Caligula's madness must be carefully navigated to avoid becoming a target."],
        ap.goals = ["Short-term: To defuse Caligula's rage and avoid the immediate threat of violence.", "Medium-term: To maintain his position and influence within the volatile court.", "Ultimate: To survive the reign of madness and find a way to restore order in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_9'})
    ON CREATE SET
        ap.current_status = 'Caligula paces restlessly within the Council Chamber, his movements mirroring his agitated mind. He directly addresses Claudius, demanding to know if he appears mad, his physical presence dominating the space despite his internal turmoil. He seeks validation, scrutinizing Claudius\'s reaction for confirmation of his perceived godhood and sanity, or lack thereof, highlighting his deep-seated insecurities.',
        ap.emotional_state = 'Beneath a veneer of imperial arrogance, Caligula is consumed by profound self-doubt and paranoia. Outwardly, he projects tyrannical confidence, questioning his own sanity while simultaneously demanding reassurance of his divine status. Internally, he is wrestling with a fear of madness, desperately seeking external validation to quell his inner turmoil. This creates a volatile emotional landscape where insecurity fuels his tyrannical outbursts and erratic behavior.',
        ap.emotional_tags = ["beneath a veneer of imperial arrogance, caligula is consumed by profound self-doubt", "paranoia. outwardly, he projects tyrannical confidence, questioning his own sanity while simultaneously demanding reassurance of his divine status. internally, he is wrestling with a fear of madness, desperately seeking external validation to quell his inner turmoil. this creates a volatile emotional landscape where insecurity fuels his tyrannical outbursts", "erratic behavior.", "beneath a veneer of imperial arrogance", "caligula is consumed by profound self-doubt and paranoia. outwardly", "he projects tyrannical confidence", "questioning his own sanity while simultaneously demanding reassurance of his divine status. internally", "he is wrestling with a fear of madness", "desperately seeking external validation to quell his inner turmoil. this creates a volatile emotional landscape where insecurity fuels his tyrannical outbursts and erratic behavior.", "beneath a veneer of imperial arrogance, caligula is consumed by profound self-doubt and paranoia. outwardly, he projects tyrannical confidence, questioning his own sanity", "simultaneously demanding reassurance of his divine status. internally, he is wrestling with a fear of madness, desperately seeking external validation to quell his inner turmoil. this creates a volatile emotional landscape where insecurity fuels his tyrannical outbursts and erratic behavior."],
        ap.active_plans = ["To extract a reassuring affirmation from Claudius regarding his sanity and divinity.", "To assert his dominance and control over those around him through intimidation and erratic questioning.", "To alleviate his internal anxieties by projecting them onto Claudius and seeking external validation."],
        ap.beliefs = ["He believes in his own divinity and expects others to acknowledge it without question.", "He is convinced that he is constantly under scrutiny and potential threat, leading to paranoia.", "He believes that external validation is necessary to confirm his self-perception, especially regarding his sanity and godhood."],
        ap.goals = ["Short-term: To receive immediate reassurance from Claudius that he is not mad and is indeed a god.", "Medium-term: To solidify his self-perception as a divine and sane ruler in the eyes of his court and subjects.", "Ultimate: To transcend mortal limitations and be universally recognized and worshipped as an all-powerful deity, thus escaping the anxieties of his human condition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_9'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before the volatile Caligula, adopting a posture of deference and humility. He speaks with his characteristic stammer, choosing his words with extreme caution and precision. He employs his scholarly knowledge and quick wit to craft a carefully tailored explanation for Caligula\'s insomnia and self-doubt, directly addressing the emperor\'s insecurities while maintaining a submissive physical presence.',
        ap.emotional_state = 'Claudius masks his deep-seated fear with a facade of calm composure. Outwardly, he is respectful and subservient, carefully modulating his tone and expressions to avoid provoking Caligula. Internally, he is acutely aware of the precariousness of his situation, experiencing significant anxiety and tension. His primary motivation is self-preservation, driving him to strategically manipulate Caligula\'s delusions to ensure his own safety and survival in this dangerous encounter.',
        ap.emotional_tags = ["claudius masks his deep-seated fear with a facade of calm composure. outwardly, he is respectful", "subservient, carefully modulating his tone", "expressions to avoid provoking caligula. internally, he is acutely aware of the precariousness of his situation, experiencing significant anxiety", "tension. his primary motivation is self-preservation, driving him to strategically manipulate caligula's delusions to ensure his own safety", "survival in this dangerous encounter.", "claudius masks his deep-seated fear with a facade of calm composure. outwardly", "he is respectful and subservient", "carefully modulating his tone and expressions to avoid provoking caligula. internally", "he is acutely aware of the precariousness of his situation", "experiencing significant anxiety and tension. his primary motivation is self-preservation", "driving him to strategically manipulate caligula's delusions to ensure his own safety and survival in this dangerous encounter."],
        ap.active_plans = ["To defuse Caligula's self-doubt by providing a plausible and flattering explanation for his insomnia and mental state.", "To validate Caligula's delusions of divinity, reinforcing the emperor's grandiose self-image to appease him.", "To ensure his own survival by carefully navigating Caligula's unpredictable mood and avoiding any action or word that could be perceived as threatening or disrespectful."],
        ap.beliefs = ["He believes that survival in Caligula's court hinges on skillful manipulation and appeasement.", "He believes in the power of intellect and rhetoric as tools for navigating dangerous situations.", "He believes that playing along with Caligula's madness, even to the point of absurdity, is necessary for self-preservation."],
        ap.goals = ["Short-term: To successfully placate Caligula and escape the immediate threat of his wrath unharmed.", "Medium-term: To maintain a low profile and avoid becoming a target of Caligula's capricious tyranny in the long run.", "Ultimate: To survive the perilous reign of Caligula and potentially witness a return to a more rational and stable Roman political landscape, though this is a distant and uncertain hope."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_10'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously at the center of the chamber, his wild eyes darting about as he paces erratically, commanding attention. His posture is dominant, arms flailing with dramatic gestures as he embodies the chaos of his rule. He wields authority with reckless abandon, exuding an aura of both fear and unpredictability.',
        ap.emotional_state = 'Caligula\'s surface emotions are a volatile mix of arrogance and paranoia. His laughter punctuates the air, betraying an unstable psyche beneath a mask of bravado. Internally, he wrestles with deep-seated insecurities, believing himself a god yet fearing betrayal from all sides. His mood swings reveal a man who is torn between self-aggrandizement and the haunting dread of his fleeting grasp on power.',
        ap.emotional_tags = ["caligula's surface emotions are a volatile mix of arrogance", "paranoia. his laughter punctuates the air, betraying an unstable psyche beneath a mask of bravado. internally, he wrestles with deep-seated insecurities, believing himself a god yet fearing betrayal from all sides. his mood swings reveal a man who is torn between self-aggrandizement", "the haunting dread of his fleeting grasp on power.", "caligula's surface emotions are a volatile mix of arrogance and paranoia. his laughter punctuates the air", "betraying an unstable psyche beneath a mask of bravado. internally", "he wrestles with deep-seated insecurities", "believing himself a god yet fearing betrayal from all sides. his mood swings reveal a man who is torn between self-aggrandizement and the haunting dread of his fleeting grasp on power."],
        ap.active_plans = ["To assert his divine status and authority over those present.", "To orchestrate a military expedition against the Germans, seeking glory and validation.", "To eliminate perceived threats, such as Claudius and his advisors, to consolidate his power."],
        ap.beliefs = ["That he is the prophesied god destined to overwhelm his enemies and achieve greatness.", "That any perceived disrespect must be met with harsh retribution to maintain authority.", "That chaos and fear are vital tools in securing his position as emperor."],
        ap.goals = ["Short-term: To intimidate Claudius and his entourage for their perceived failures.", "Medium-term: To prepare for the upcoming military campaign against the Germans, solidifying his legacy.", "Ultimate: To be recognized as a god and feared as a ruler, achieving eternal glory."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_10'})
    ON CREATE SET
        ap.current_status = 'Claudius stands somewhat hunched, bowing deeply upon entering the chamber, his physical presence one of timidity amidst the chaos. He fumbles with his words, stammering under Caligula\'s unpredictable scrutiny. His movements are cautious, betraying a palpable fear of provoking the wrath of the emperor, yet he desperately attempts to maintain composure.',
        ap.emotional_state = 'Claudius\'s surface emotions reflect a blend of anxiety and feigned subservience, as he struggles to navigate the precarious environment. Internally, he experiences a whirlwind of terror and disbelief at Caligula\'s madness, yearning for survival while grappling with the weight of his family\'s legacy. His motivations are conflicted; he wishes to appease Caligula while preserving his own integrity.',
        ap.emotional_tags = ["claudius's surface emotions reflect a blend of anxiety", "feigned subservience, as he struggles to navigate the precarious environment. internally, he experiences a whirlwind of terror", "disbelief at caligula's madness, yearning for survival while grappling with the weight of his family's legacy. his motivations are conflicted; he wishes to appease caligula while preserving his own integrity.", "claudius's surface emotions reflect a blend of anxiety and feigned subservience", "as he struggles to navigate the precarious environment. internally", "he experiences a whirlwind of terror and disbelief at caligula's madness", "yearning for survival while grappling with the weight of his family's legacy. his motivations are conflicted; he wishes to appease caligula while preserving his own integrity.", "claudius's surface emotions reflect a blend of anxiety and feigned subservience, as he struggles to navigate the precarious environment. internally, he experiences a whirlwind of terror and disbelief at caligula's madness, yearning for survival while grappling with the weight of his family's legacy. his motivations are conflicted", "he wishes to appease caligula while preserving his own integrity.", "claudius's surface emotions reflect a blend of anxiety and feigned subservience, as he struggles to navigate the precarious environment. internally, he experiences a whirlwind of terror and disbelief at caligula's madness, yearning for survival", "grappling with the weight of his family's legacy. his motivations are conflicted; he wishes to appease caligula", "preserving his own integrity."],
        ap.active_plans = ["To placate Caligula with flattery in hopes of avoiding retribution.", "To gather information on Caligula\u2019s intentions for the Rhine expedition.", "To maintain his role within the court without drawing too much attention or ire from the emperor."],
        ap.beliefs = ["That survival in the treacherous court requires careful diplomacy and measured responses.", "That Caligula's madness poses a significant threat to himself and the stability of Rome.", "That the court's chaotic dynamics could shift violently, necessitating vigilance and adaptability."],
        ap.goals = ["Short-term: To safely navigate the current perilous encounter with Caligula.", "Medium-term: To position himself as a stabilizing force within the chaotic court.", "Ultimate: To ensure the survival of Rome and his own legacy amidst the madness."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_seashells_event_4_1'})
    ON CREATE SET
        oi.description = 'Caligula dramatically brandishes a handful of seashells before the Senate, presenting them as \'spoils of war\' from his supposed victory over Neptune. These mundane objects are central to his performance, serving as tangible evidence of his delusional grandiosity and a means to mock the Senators. He uses them to highlight the absurdity of his claims, forcing the Senators to acknowledge and fear his fabricated triumphs, thereby emphasizing his tyrannical power and their utter helplessness in the face of his madness.',
        oi.status_before = 'Prior to the event, the seashells were likely just ordinary objects, collected by Caligula during his theatrical campaign. They held no particular significance beyond being physical items he acquired during his travels and were devoid of symbolic meaning until repurposed by Caligula.',
        oi.status_after = 'Following the event, the seashells transform into potent symbols of Caligula\'s madness and the Senate\'s humiliating subjugation. They become a stark representation of the Emperor\'s detachment from reality and the court\'s enforced complicity in his delusions, forever after associated with this public display of tyrannical absurdity.'
    WITH oi
    MATCH (o:Object {uuid: 'object_seashells'})
    MATCH (e:Event {uuid: 'event_4_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Caligula, adorned in flamboyant battle regalia, dominates the Imperial Hall, standing before the cowering Senators. He gesticulates wildly with a handful of seashells, his voice echoing through the marble space as he berates the assembled dignitaries for their perceived lack of celebration upon his triumphant return. His performance is theatrical, designed to intimidate and command attention.',
        ap.emotional_state = 'On the surface, Caligula projects volcanic rage and theatrical indignation, his sarcasm dripping with contempt for the Senators. Beneath this bluster lies a deep well of insecurity and paranoia; he craves genuine adoration and respect, yet his tyrannical actions ensure he receives only fear. He feels profoundly slighted and unappreciated, his fragile ego wounded by the Senate\'s perceived indifference, fueling his descent further into madness.',
        ap.emotional_tags = ["on the surface, caligula projects volcanic rage", "theatrical indignation, his sarcasm dripping with contempt for the senators. beneath this bluster lies a deep well of insecurity", "paranoia; he craves genuine adoration", "respect, yet his tyrannical actions ensure he receives only fear. he feels profoundly slighted", "unappreciated, his fragile ego wounded by the senate's perceived indifference, fueling his descent further into madness.", "on the surface", "caligula projects volcanic rage and theatrical indignation", "his sarcasm dripping with contempt for the senators. beneath this bluster lies a deep well of insecurity and paranoia; he craves genuine adoration and respect", "yet his tyrannical actions ensure he receives only fear. he feels profoundly slighted and unappreciated", "his fragile ego wounded by the senate's perceived indifference", "fueling his descent further into madness.", "on the surface, caligula projects volcanic rage and theatrical indignation, his sarcasm dripping with contempt for the senators. beneath this bluster lies a deep well of insecurity and paranoia", "he craves genuine adoration and respect, yet his tyrannical actions ensure he receives only fear. he feels profoundly slighted and unappreciated, his fragile ego wounded by the senate's perceived indifference, fueling his descent further into madness."],
        ap.active_plans = ["To publicly humiliate and degrade the Senate for their failure to celebrate his return, asserting his absolute authority.", "To reinforce his image as a divine and invincible ruler, despite the absurdity of his claims and actions.", "To instill fear and absolute obedience in the Senators, ensuring they will not dare to question or undermine his power in the future."],
        ap.beliefs = ["He genuinely believes in his own divinity and expects to be worshipped and obeyed as a god-emperor without question.", "He views the Senate as inherently cowardly, disloyal, and incapable of appreciating his greatness.", "He is convinced that grand spectacles and extravagant displays are necessary to maintain his authority and impress his subjects, regardless of their basis in reality."],
        ap.goals = ["short_term\": \"To punish the Senators for their perceived disrespect and ensure they understand the consequences of defying him.", "medium_term\": \"To consolidate his absolute power over Rome, eliminating any potential opposition or dissent through fear and intimidation.", "ultimate\": \"To be universally recognized and worshipped as a living god, securing his place in history as a divine and unchallenged ruler."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Marcus Vinicius cautiously approaches Caligula after the Senators\' hasty retreat, attempting to ingratiate himself with the volatile Emperor. He initially succeeds by echoing Caligula\'s sentiments regarding the Senate\'s supposed disrespect. However, his attempt to further solidify his position by mentioning Agrippa backfires spectacularly, leading to his abrupt dismissal from Caligula\'s favor and leaving him isolated and exposed.',
        ap.emotional_state = 'Marcus begins the event with a veneer of opportunistic flattery, attempting to align himself with Caligula\'s rage and regain his favor. Beneath this facade is a deep-seated anxiety and fear of Caligula\'s unpredictable wrath. When he is suddenly cast out, his surface composure crumbles into genuine confusion and alarm. He is bewildered by the irrationality of Caligula\'s reaction and acutely aware of the precariousness of his position within the court.',
        ap.emotional_tags = ["marcus begins the event with a veneer of opportunistic flattery, attempting to align himself with caligula's rage", "regain his favor. beneath this facade is a deep-seated anxiety", "fear of caligula's unpredictable wrath. when he is suddenly cast out, his surface composure crumbles into genuine confusion", "alarm. he is bewildered by the irrationality of caligula's reaction", "acutely aware of the precariousness of his position within the court.", "marcus begins the event with a veneer of opportunistic flattery", "attempting to align himself with caligula's rage and regain his favor. beneath this facade is a deep-seated anxiety and fear of caligula's unpredictable wrath. when he is suddenly cast out", "his surface composure crumbles into genuine confusion and alarm. he is bewildered by the irrationality of caligula's reaction and acutely aware of the precariousness of his position within the court."],
        ap.active_plans = ["To quickly repair any perceived damage to his standing with Caligula and reaffirm his loyalty to the Emperor.", "To understand the ever-shifting and illogical rules of engagement within Caligula's court, to avoid future missteps.", "To maintain a position of relative safety and influence, navigating the treacherous currents of imperial favor as best he can."],
        ap.beliefs = ["Maintaining Caligula's approval is paramount for his personal safety and career advancement within the Roman hierarchy.", "Flattery and agreement are effective strategies for dealing with powerful, albeit irrational, figures like Caligula.", "There is still a semblance of logic or predictability to Caligula's madness, and he can learn to anticipate and manage the Emperor's whims. (This belief is increasingly challenged by the unfolding events.)"],
        ap.goals = ["short_term\": \"To immediately regain Caligula's favor and undo the damage caused by his unintended slight.", "medium_term\": \"To secure a stable and advantageous position within the court, ensuring his continued survival and influence.", "ultimate\": \"To navigate the dangerous political landscape of Caligula's reign and emerge unscathed, potentially even prospering despite the chaos and tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Caligula stands prominently in elaborate battle regalia, his posture wide and commanding as he towers over the senators. His movements are animated, gesturing vigorously with a handful of seashells, which he holds up as ridiculous proof of his conquests. His aggressive stance and furious gaze intimidate the senators, who cower in response.',
        ap.emotional_state = 'Caligula exudes rage and wounded pride, his face twisted in fury as he lashes out at the senators. Beneath the surface, however, there is an undercurrent of insecurity, stemming from his perceived inadequacies in the eyes of the public and his court. The contrast between his grandiose self-image and the reality of his welcome festers within him, igniting his volatile temperament.',
        ap.emotional_tags = ["caligula exudes rage", "wounded pride, his face twisted in fury as he lashes out at the senators. beneath the surface, however, there is an undercurrent of insecurity, stemming from his perceived inadequacies in the eyes of the public", "his court. the contrast between his grandiose self-image", "the reality of his welcome festers within him, igniting his volatile temperament.", "caligula exudes rage and wounded pride", "his face twisted in fury as he lashes out at the senators. beneath the surface", "however", "there is an undercurrent of insecurity", "stemming from his perceived inadequacies in the eyes of the public and his court. the contrast between his grandiose self-image and the reality of his welcome festers within him", "igniting his volatile temperament."],
        ap.active_plans = ["To assert his dominance over the senators through intimidation and fear.", "To publicly chastise the senators for their perceived betrayal and lack of celebration.", "To reinforce his own sense of power by demanding reverence and compliance from those around him."],
        ap.beliefs = ["He believes that displaying cruelty will solidify his control over a fearful Senate.", "He is convinced that his divine status grants him the right to punish disloyalty.", "He thinks that his victories should be recognized and celebrated, even if he feels he must demand them."],
        ap.goals = ["Short-term: To intimidate the senators into submission during this encounter.", "Medium-term: To ensure that he is celebrated as a conquering hero upon his return.", "Ultimate: To establish his divinity and unquestionable authority as Emperor, above all others."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Caesonia stands beside Claudius, her demeanor calm yet concerned as she observes the escalating confrontation between Caligula and the senators. She subtly shifts closer to Caligula, attempting to interject with soothing words to mitigate his wrath. Her posture reflects both support and apprehension as she anticipates the potential violence.',
        ap.emotional_state = 'Caesonia\'s outward expression is one of calm persuasion, yet internally she grapples with anxiety over Caligula\'s unpredictable temper. Her maternal instincts kick in as she considers the implications of violence on their family. There’s a palpable tension within her, torn between her loyalty to Caligula and her desire to protect her loved ones from harm.',
        ap.emotional_tags = ["caesonia's outward expression is one of calm persuasion, yet internally she grapples with anxiety over caligula's unpredictable temper. her maternal instincts kick in as she considers the implications of violence on their family. there\u2019s a palpable tension within her, torn between her loyalty to caligula", "her desire to protect her loved ones from harm.", "caesonia's outward expression is one of calm persuasion", "yet internally she grapples with anxiety over caligula's unpredictable temper. her maternal instincts kick in as she considers the implications of violence on their family. there\u2019s a palpable tension within her", "torn between her loyalty to caligula and her desire to protect her loved ones from harm."],
        ap.active_plans = ["To de-escalate Caligula's anger through compassionate dialogue.", "To support Claudius in advocating for mercy, aligning herself with his calming influence.", "To protect her family\u2019s legacy by ensuring that Caligula's return is remembered positively."],
        ap.beliefs = ["She believes that mercy can temper Caligula's wrath and secure their family's safety.", "She holds that her influence over Caligula can help redirect his erratic behavior.", "She thinks that history should reflect the strength of their family rather than the brutality of the Emperor."],
        ap.goals = ["Short-term: To calm Caligula and prevent bloodshed in the hall.", "Medium-term: To foster a sense of stability within the court and support Claudius's emerging role.", "Ultimate: To ensure a lasting legacy for her family and maintain a semblance of order amidst the chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Caligula, adorned in ornate battle regalia, stands center stage in the Imperial Hall, facing the cowering senators. He brandishes a handful of seashells, the absurd \'spoils\' of his supposed victory over Neptune, using them as props in his theatrical display of imperial outrage. Initially poised to strike down the senators, his hand wielding imagined execution, he is eventually swayed by Caesonia\'s gentle intervention, lowering his arm but maintaining his imperious posture.',
        ap.emotional_state = 'Caligula is a tempest of wounded pride and volatile fury. Outwardly, he projects a terrifying rage, his voice booming with accusations, his gestures grand and menacing. Beneath this theatrical display lies a deep well of insecurity and a desperate need for validation. He feels profoundly slighted by the lack of celebratory welcome, interpreting it as a personal betrayal. There\'s a palpable tension between his god-like self-image and the fragile ego easily bruised by perceived disrespect.',
        ap.emotional_tags = ["caligula is a tempest of wounded pride", "volatile fury. outwardly, he projects a terrifying rage, his voice booming with accusations, his gestures grand", "menacing. beneath this theatrical display lies a deep well of insecurity", "a desperate need for validation. he feels profoundly slighted by the lack of celebratory welcome, interpreting it as a personal betrayal. there's a palpable tension between his god-like self-image", "the fragile ego easily bruised by perceived disrespect.", "caligula is a tempest of wounded pride and volatile fury. outwardly", "he projects a terrifying rage", "his voice booming with accusations", "his gestures grand and menacing. beneath this theatrical display lies a deep well of insecurity and a desperate need for validation. he feels profoundly slighted by the lack of celebratory welcome", "interpreting it as a personal betrayal. there's a palpable tension between his god-like self-image and the fragile ego easily bruised by perceived disrespect."],
        ap.active_plans = ["To assert his absolute authority over the Senate, reminding them of his divine status and their subservience.", "To publicly humiliate and punish the senators for their perceived lack of enthusiasm and respect upon his return.", "To reinforce his delusion of godhood by showcasing the seashells as proof of his victory over Neptune, demanding belief in his fantastical claims."],
        ap.beliefs = ["He is a living god, entitled to unquestioning worship and adoration from all, especially the Roman Senate.", "Any failure to recognize his divine status or celebrate his achievements is a direct act of treachery and must be met with severe retribution.", "Fear is the most effective tool for maintaining control and ensuring obedience within his empire."],
        ap.goals = ["short_term\": \"To inflict immediate psychological torment upon the senators, making them grovel and fear for their lives as punishment for their perceived slights.", "medium_term\": \"To solidify his image as an unpredictable and fearsome ruler, ensuring future compliance and preventing any dissent or challenge to his authority.", "ultimate\": \"To be universally recognized and worshipped as a god, transcending mortal limitations and securing his legacy as a divine emperor in the annals of Roman history."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_3'})
    ON CREATE SET
        ap.current_status = 'Marcus Vinicius steps forward cautiously after the senators are dismissed, approaching Caligula with a calculated air of deference. He attempts to ingratiate himself with the volatile Emperor, positioning himself as supportive and understanding of Caligula\'s actions. He watches Caligula intently, gauging his reactions and adjusting his approach to maintain a semblance of favor.',
        ap.emotional_state = 'Marcus is driven by a blend of opportunism and anxiety. Outwardly, he projects an image of supportive agreement and flattery, his tone carefully modulated to appease Caligula. Inwardly, he is deeply uneasy and fearful of Caligula\'s unpredictable rage. He is acutely aware of the precariousness of his position and is attempting to navigate the dangerous currents of Caligula\'s court by aligning himself with the Emperor\'s perceived sentiments, hoping to regain lost favor and secure his own safety.',
        ap.emotional_tags = ["marcus is driven by a blend of opportunism", "anxiety. outwardly, he projects an image of supportive agreement", "flattery, his tone carefully modulated to appease caligula. inwardly, he is deeply uneasy", "fearful of caligula's unpredictable rage. he is acutely aware of the precariousness of his position", "is attempting to navigate the dangerous currents of caligula's court by aligning himself with the emperor's perceived sentiments, hoping to regain lost favor", "secure his own safety.", "marcus is driven by a blend of opportunism and anxiety. outwardly", "he projects an image of supportive agreement and flattery", "his tone carefully modulated to appease caligula. inwardly", "he is deeply uneasy and fearful of caligula's unpredictable rage. he is acutely aware of the precariousness of his position and is attempting to navigate the dangerous currents of caligula's court by aligning himself with the emperor's perceived sentiments", "hoping to regain lost favor and secure his own safety."],
        ap.active_plans = ["To repair his standing with Caligula, which may have been damaged by previous interactions or perceived slights.", "To flatter Caligula by validating his anger towards the senators and praising his supposed wisdom in considering punishment.", "To subtly position himself as a loyal and insightful advisor, hoping to regain a place of influence within Caligula's inner circle."],
        ap.beliefs = ["Maintaining the Emperor's favor is essential for survival and advancement in the Roman court.", "Flattery and strategic agreement with Caligula's pronouncements are effective tools for navigating his unpredictable nature.", "Personal ambition and security are best served by aligning oneself with powerful figures, even if they are erratic and dangerous."],
        ap.goals = ["short_term\": \"To immediately regain Caligula's approval and defuse any negative perceptions the Emperor might hold of him.", "medium_term\": \"To re-establish himself as a trusted member of Caligula's court, securing a position of relative safety and influence.", "ultimate\": \"To advance his career and increase his power and status within the Roman hierarchy by strategically aligning himself with the ruling power, ensuring long-term security and prosperity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Cassius steps forward from the shadows, his posture resolute yet relaxed, as he engages Marcus with a knowing look. He stands with an air of quiet confidence, gesturing subtly as he speaks, his movements deliberate and calculated.',
        ap.emotional_state = 'Cassius exhibits a calm exterior, masking the tension underlying the court\'s tumultuous atmosphere. While he appears collected, internally he harbors a growing apprehension about the shifting allegiances and the perilous game of loyalty and betrayal. His words carry an edge, hinting at his awareness of the stakes at play.',
        ap.emotional_tags = ["cassius exhibits a calm exterior, masking the tension underlying the court's tumultuous atmosphere. while he appears collected, internally he harbors a growing apprehension about the shifting allegiances", "the perilous game of loyalty", "betrayal. his words carry an edge, hinting at his awareness of the stakes at play.", "cassius exhibits a calm exterior", "masking the tension underlying the court's tumultuous atmosphere. while he appears collected", "internally he harbors a growing apprehension about the shifting allegiances and the perilous game of loyalty and betrayal. his words carry an edge", "hinting at his awareness of the stakes at play."],
        ap.active_plans = ["To alert Marcus to the precariousness of his position in relation to Caligula.", "To reinforce the idea that loyalty is a dangerous game under Caligula's erratic reign.", "To subtly encourage Marcus to reconsider his alliances or take action that could benefit Cassius's own motives."],
        ap.beliefs = ["Loyalty in Caligula's court is a fleeting and dangerous illusion.", "Survival requires a keen understanding of the dynamics of power and betrayal.", "The eventual downfall of Caligula is necessary for Rome's salvation."],
        ap.goals = ["Short-term: To instill a sense of caution in Marcus regarding his relationship with Caligula.", "Medium-term: To gather support among disillusioned senators and military officers for a potential coup.", "Ultimate: To overthrow Caligula and restore order to Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_4'})
    ON CREATE SET
        ap.current_status = 'Marcus stands near Caligula, visibly tense, his body language betraying his anxiety. He shifts his weight from one foot to the other, crossing his arms defensively as he processes Cassius\'s warning. His gaze flickers between Caligula and Cassius, revealing his inner turmoil.',
        ap.emotional_state = 'Marcus displays a mix of fear and ambition, struggling to maintain composure in front of the volatile Emperor. His surface demeanor is one of feigned loyalty, but internally, he grapples with growing unease about Caligula\'s wrath and the implications of Cassius\'s words. This conflict heightens his anxiety about his standing in the court.',
        ap.emotional_tags = ["marcus displays a mix of fear", "ambition, struggling to maintain composure in front of the volatile emperor. his surface demeanor is one of feigned loyalty, but internally, he grapples with growing unease about caligula's wrath", "the implications of cassius's words. this conflict heightens his anxiety about his standing in the court.", "marcus displays a mix of fear and ambition", "struggling to maintain composure in front of the volatile emperor. his surface demeanor is one of feigned loyalty", "but internally", "he grapples with growing unease about caligula's wrath and the implications of cassius's words. this conflict heightens his anxiety about his standing in the court.", "marcus displays a mix of fear and ambition, struggling to maintain composure in front of the volatile emperor. his surface demeanor is one of feigned loyalty,", "internally, he grapples with growing unease about caligula's wrath and the implications of cassius's words. this conflict heightens his anxiety about his standing in the court."],
        ap.active_plans = ["To maintain his loyalty to Caligula while navigating the treacherous waters of court politics.", "To assess Cassius's warning and determine its validity in the context of his relationship with Caligula.", "To find a way to continue advancing his own ambitions without attracting the Emperor's ire."],
        ap.beliefs = ["Loyalty to Caligula is essential for survival, but it is becoming increasingly dangerous.", "The political landscape is shifting, and adaptation is necessary to avoid being crushed.", "Maintaining an alliance with powerful figures like Caligula is crucial for his future aspirations."],
        ap.goals = ["Short-term: To reassure Caligula of his loyalty and avoid offending him.", "Medium-term: To align himself with influential allies to strengthen his position in the court.", "Ultimate: To rise to a position of power within the Empire, ideally without the chaos of assassination or rebellion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially at peace within the opulent reception room, likely enjoying a moment of quietude after a Greek ballet rehearsal, as suggested by the lingering atmosphere. He is suddenly jolted from his contemplation by a series of loud, insistent knocks from outside the room. Reacting verbally and with some agitation, he stammers a series of assenting responses, indicating his intention to answer the summons, though clearly caught off guard.',
        ap.emotional_state = 'Claudius transitions from a state of peaceful calm to one of startled surprise and mild anxiety. The sudden, intrusive knocking shatters his tranquility, evoking a sense of urgency and perhaps a touch of apprehension. While outwardly expressing his willingness to respond (\'Yes. I\'m coming!\'), his repeated stammering (\'I\'m coming, I\'m coming, I\'m coming\') suggests an underlying nervousness or discomfort at the unexpected interruption, hinting at a deeper seated unease within the volatile palace environment.',
        ap.emotional_tags = ["claudius transitions from a state of peaceful calm to one of startled surprise", "mild anxiety. the sudden, intrusive knocking shatters his tranquility, evoking a sense of urgency", "perhaps a touch of apprehension. while outwardly expressing his willingness to respond ('yes. i'm coming!'), his repeated stammering ('i'm coming, i'm coming, i'm coming') suggests an underlying nervousness or discomfort at the unexpected interruption, hinting at a deeper seated unease within the volatile palace environment.", "claudius transitions from a state of peaceful calm to one of startled surprise and mild anxiety. the sudden", "intrusive knocking shatters his tranquility", "evoking a sense of urgency and perhaps a touch of apprehension. while outwardly expressing his willingness to respond ('yes. i'm coming!')", "his repeated stammering ('i'm coming", "i'm coming", "i'm coming') suggests an underlying nervousness or discomfort at the unexpected interruption", "hinting at a deeper seated unease within the volatile palace environment."],
        ap.active_plans = ["Identify the source of the insistent knocking to ascertain the urgency and nature of the interruption.", "Respond to the summons by opening the door and engaging with whoever is on the other side.", "Attempt to regain composure and project an image of calm despite being startled, maintaining a semblance of control in an unpredictable environment."],
        ap.beliefs = ["Unexpected loud noises are inherently disruptive and require immediate attention, potentially signaling an urgent matter or a breach of his personal space.", "As a figure of authority (even if reluctant), he is expected to respond to those seeking access to him, regardless of the time or circumstance.", "Maintaining a composed demeanor is crucial in the palace, even when surprised, to avoid appearing weak or vulnerable in front of potential observers."],
        ap.goals = ["Short-term Goal: Immediately answer the door to address the source of the knocking and resolve the immediate interruption.", "Medium-term Goal: Quickly assess the situation and the identity of the person knocking to understand the reason for their urgent arrival and any potential implications.", "Ultimate Goal: Re-establish a sense of peace and control within his personal space and the palace environment, mitigating the disruptive impact of unexpected intrusions on his routine and mental state."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Calpurnia stands at the threshold of Claudius\'s room, her face marred by urgency. She leans slightly forward, her brow furrowed, as she speaks with fervent insistence, looking intently at Claudius. Her hands gesture emphatically, emphasizing the gravity of her warning, body tense and poised for action.',
        ap.emotional_state = 'Calpurnia\'s surface emotion is one of heightened anxiety; her voice quivers with concern as she implores Claudius to stay. Internally, fear churns within her, fueled by the dread of losing Claudius to assassination. This conflict reveals her deep protective instincts clashing with her ambitions, as she grapples with the precariousness of their situation.',
        ap.emotional_tags = ["calpurnia's surface emotion is one of heightened anxiety; her voice quivers with concern as she implores claudius to stay. internally", "fear churns within her", "fueled by the dread of losing claudius to assassination. this conflict reveals her deep protective instincts clashing with her ambitions", "as she grapples with the precariousness of their situation.", "calpurnia's surface emotion is one of heightened anxiety", "her voice quivers with concern as she implores claudius to stay. internally, fear churns within her, fueled by the dread of losing claudius to assassination. this conflict reveals her deep protective instincts clashing with her ambitions, as she grapples with the precariousness of their situation."],
        ap.active_plans = ["To prevent Claudius from leaving his room and potentially falling into a trap set by assassins.", "To convey the urgency of the danger while keeping her emotions in check, maintaining her composure.", "To position herself as a key figure in Claudius's safety, highlighting her loyalty and concern."],
        ap.beliefs = ["She believes that the political landscape is fraught with peril, and only through vigilance can they navigate it safely.", "Calpurnia holds a conviction that her role is vital in protecting Claudius, intertwining their fates amidst the chaos.", "She believes in the necessity of caution in political maneuvering, valuing survival over mere ambition."],
        ap.goals = ["Short-term: To convince Claudius to remain in his room and avoid immediate danger from potential assassins.", "Medium-term: To strengthen her position as Claudius's protector and trusted advisor in the midst of turmoil.", "Ultimate: To ensure Claudius's safety and, through his survival, secure her own influence in the political landscape of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Calpurnia is off-screen, her voice filled with alarm as she urgently tries to dissuade Claudius from leaving the room. Her words are a desperate plea, reflecting her fear that Claudius is walking into a dangerous situation, possibly an ambush by assassins. She is physically separated from Claudius in this moment but vocally present and emotionally engaged.',
        ap.emotional_state = 'Calpurnia is gripped by intense anxiety and fear. Outwardly, her agitation is clear in her urgent tone and warning. Internally, she is battling deep-seated worries for Claudius\'s safety, possibly fueled by the volatile political climate and the constant threat of violence within the palace. Her protective instincts are on high alert, driven by a genuine concern for Claudius and perhaps a strategic awareness of his vulnerability.',
        ap.emotional_tags = ["calpurnia is gripped by intense anxiety", "fear. outwardly, her agitation is clear in her urgent tone", "warning. internally, she is battling deep-seated worries for claudius's safety, possibly fueled by the volatile political climate", "the constant threat of violence within the palace. her protective instincts are on high alert, driven by a genuine concern for claudius", "perhaps a strategic awareness of his vulnerability.", "calpurnia is gripped by intense anxiety and fear. outwardly", "her agitation is clear in her urgent tone and warning. internally", "she is battling deep-seated worries for claudius's safety", "possibly fueled by the volatile political climate and the constant threat of violence within the palace. her protective instincts are on high alert", "driven by a genuine concern for claudius and perhaps a strategic awareness of his vulnerability."],
        ap.active_plans = ["Prevent Claudius from opening the door immediately.", "Instill a sense of caution in Claudius regarding whoever is outside.", "Delay Claudius's departure to assess the situation further before he potentially walks into danger."],
        ap.beliefs = ["The palace and its surroundings are currently fraught with danger and unpredictable threats.", "Claudius is in a vulnerable position and could be easily targeted.", "It is crucial to exercise extreme caution before interacting with anyone approaching unexpectedly."],
        ap.goals = ["Short-term: Ensure Claudius remains safely inside the room for the immediate moment.", "Medium-term: Understand the identity and intentions of the person outside before allowing Claudius to engage.", "Ultimate: Protect Claudius from potential harm and navigate the treacherous political landscape to ensure his survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Cassius stands just outside Claudius\'s door, his voice authoritative and impatient as he summons Claudius to the palace. He identifies himself and curtly delivers his orders, emphasizing the urgency of the situation and instructing Claudius to hurry and bring minimal attire, projecting an air of command and immediate action.',
        ap.emotional_state = 'Cassius is operating with focused urgency and a sense of duty. Outwardly, his tone is brisk and commanding, betraying no personal emotion but a clear drive to complete his mission. Internally, he is likely feeling the pressure of his orders and the weight of the unfolding events at the palace, maintaining a soldier\'s stoicism while possibly harboring underlying tension about the situation\'s gravity and speed.',
        ap.emotional_tags = ["cassius is operating with focused urgency", "a sense of duty. outwardly, his tone is brisk", "commanding, betraying no personal emotion but a clear drive to complete his mission. internally, he is likely feeling the pressure of his orders", "the weight of the unfolding events at the palace, maintaining a soldier's stoicism while possibly harboring underlying tension about the situation's gravity", "speed.", "cassius is operating with focused urgency and a sense of duty. outwardly", "his tone is brisk and commanding", "betraying no personal emotion but a clear drive to complete his mission. internally", "he is likely feeling the pressure of his orders and the weight of the unfolding events at the palace", "maintaining a soldier's stoicism while possibly harboring underlying tension about the situation's gravity and speed.", "cassius is operating with focused urgency and a sense of duty. outwardly, his tone is brisk and commanding, betraying no personal emotion but a clear drive to complete his mission. internally, he is likely feeling the pressure of his orders and the weight of the unfolding events at the palace, maintaining a soldier's stoicism", "possibly harboring underlying tension about the situation's gravity and speed.", "cassius is operating with focused urgency and a sense of duty. outwardly, his tone is brisk and commanding, betraying no personal emotion", "a clear drive to complete his mission. internally, he is likely feeling the pressure of his orders and the weight of the unfolding events at the palace, maintaining a soldier's stoicism while possibly harboring underlying tension about the situation's gravity and speed."],
        ap.active_plans = ["Execute his orders to fetch Claudius, Marcus Vinicius, and Asprenas without delay.", "Convey a sense of urgency to Claudius to ensure prompt compliance.", "Maintain a direct and no-nonsense approach to efficiently carry out his instructions."],
        ap.beliefs = ["Obeying orders promptly and efficiently is paramount in this situation.", "The matter requiring Claudius's presence at the palace is of significant importance and urgency.", "Time is of the essence, and any delay could have negative consequences."],
        ap.goals = ["Short-term: Successfully and swiftly bring Claudius to the palace as instructed.", "Medium-term: Ensure all individuals he is ordered to fetch (Claudius, Marcus, Asprenas) are gathered and transported to the palace efficiently.", "Ultimate: Contribute to the resolution of the urgent situation at the palace by fulfilling his duty and facilitating the necessary personnel's arrival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Cassius stands just outside Claudius\'s door, his posture tense and commanding. He speaks urgently, his words laced with authority and concern, signifying his determination to protect Claudius as well as urge him to act quickly in a perilous situation.',
        ap.emotional_state = 'Cassius displays a surface confidence, his voice firm and urgent as he insists on the need for haste. Beneath this facade, he grapples with the weight of responsibility and anxiety over the potential threat to Claudius\'s life, feeling the pressure of the looming danger.',
        ap.emotional_tags = ["cassius displays a surface confidence, his voice firm", "urgent as he insists on the need for haste. beneath this facade, he grapples with the weight of responsibility", "anxiety over the potential threat to claudius's life, feeling the pressure of the looming danger.", "cassius displays a surface confidence", "his voice firm and urgent as he insists on the need for haste. beneath this facade", "he grapples with the weight of responsibility and anxiety over the potential threat to claudius's life", "feeling the pressure of the looming danger."],
        ap.active_plans = ["To convince Claudius to hurry and join him at the palace, emphasizing urgency due to potential assassins.", "To ensure that both Claudius and his allies, Marcus Vinicius and Asprenas, are brought to safety or prepared for whatever awaits them at the palace.", "To reinforce his role in the conspiracy against Caligula by acting decisively and swiftly in this critical moment."],
        ap.beliefs = ["Cassius believes in the necessity of action against tyranny to restore freedom to Rome.", "He holds a conviction that life under Caligula\u2019s rule is unacceptable and that risking everything is warranted to protect allies and himself.", "Cassius believes in loyalty to his fellow conspirators and sees this moment as crucial for their collective cause."],
        ap.goals = ["Short-term: To get Claudius to leave his room and accompany him to the palace immediately.", "Medium-term: To gather Claudius, Marcus Vinicius, and Asprenas, preparing them for the imminent confrontation with Caligula.", "Ultimate: To overthrow Caligula and restore order to Rome, liberating the empire from his tyrannical rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Cassius stands just outside Claudius\'s room, his voice firm and commanding as he delivers his orders. He is terse and efficient, focused solely on the immediate task at hand: getting Claudius to the palace with utmost haste. He dismisses any concern for formality, insisting Claudius needs only to throw on a cloak, emphasizing the urgency and gravity of the situation that requires immediate action.',
        ap.emotional_state = 'Cassius projects an air of military urgency and unwavering resolve. Beneath this professional exterior, he is likely feeling the immense pressure of the unfolding conspiracy. He carries the weight of the imminent assassination, his internal state a mix of tense anticipation and determined focus. He suppresses any personal anxieties, projecting only the resolve needed to execute his part of the plan swiftly and without question.',
        ap.emotional_tags = ["cassius projects an air of military urgency", "unwavering resolve. beneath this professional exterior, he is likely feeling the immense pressure of the unfolding conspiracy. he carries the weight of the imminent assassination, his internal state a mix of tense anticipation", "determined focus. he suppresses any personal anxieties, projecting only the resolve needed to execute his part of the plan swiftly", "without question.", "cassius projects an air of military urgency and unwavering resolve. beneath this professional exterior", "he is likely feeling the immense pressure of the unfolding conspiracy. he carries the weight of the imminent assassination", "his internal state a mix of tense anticipation and determined focus. he suppresses any personal anxieties", "projecting only the resolve needed to execute his part of the plan swiftly and without question."],
        ap.active_plans = ["To swiftly and efficiently execute his orders to bring Claudius to the palace.", "To maintain absolute secrecy regarding the true nature of the summons, revealing only the necessary information.", "To ensure Claudius's immediate compliance and prevent any delays that could jeopardize the conspiratorial timeline."],
        ap.beliefs = ["Caligula's tyranny is an intolerable blight upon Rome that demands immediate and decisive action.", "Strict adherence to duty and orders is paramount, especially in times of crisis and rebellion.", "Speed and efficiency are crucial for the success of their plot to liberate Rome from Caligula's madness."],
        ap.goals = ["Short-term Goal: To successfully fetch Claudius and the other designated individuals to the palace without raising suspicion or encountering resistance.", "Medium-term Goal: To contribute to the successful execution of the assassination plot against Caligula, thus removing the tyrant from power.", "Ultimate Goal: To restore order and stability to Rome, paving the way for a return to a more just and sane leadership after Caligula's reign of terror."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Calpurnia is inside Claudius\'s room, her voice laced with anxiety as she pleads with him not to leave. She is physically present, trying to dissuade Claudius, her agitation palpable. Her movements are likely restless and concerned as she reacts to the sudden, ominous summons, fearing the worst for Claudius amidst the dangerous palace intrigues.',
        ap.emotional_state = 'Calpurnia is gripped by fear and deep concern for Claudius\'s safety. Her surface emotions are transparently anxious, evident in her pleading tone and worried questions. Internally, she is battling a surge of dread, possibly suspecting foul play or sensing the volatile atmosphere of the palace. Her fear stems from genuine affection and protectiveness towards Claudius, contrasting sharply with Cassius\'s urgent, detached military demeanor.',
        ap.emotional_tags = ["calpurnia is gripped by fear", "deep concern for claudius's safety. her surface emotions are transparently anxious, evident in her pleading tone", "worried questions. internally, she is battling a surge of dread, possibly suspecting foul play or sensing the volatile atmosphere of the palace. her fear stems from genuine affection", "protectiveness towards claudius, contrasting sharply with cassius's urgent, detached military demeanor.", "calpurnia is gripped by fear and deep concern for claudius's safety. her surface emotions are transparently anxious", "evident in her pleading tone and worried questions. internally", "she is battling a surge of dread", "possibly suspecting foul play or sensing the volatile atmosphere of the palace. her fear stems from genuine affection and protectiveness towards claudius", "contrasting sharply with cassius's urgent", "detached military demeanor."],
        ap.active_plans = ["To dissuade Claudius from leaving the perceived safety of his room, believing he might be walking into a trap.", "To understand the reason for the urgent summons before allowing Claudius to go, seeking more information to assess the potential danger.", "To prioritize Claudius's well-being and safety above all else, acting as his protector in a treacherous environment."],
        ap.beliefs = ["The Roman palace is a dangerous and unpredictable place, rife with political enemies and potential assassins.", "Caligula's court is ruled by paranoia and madness, making anyone vulnerable to sudden danger.", "Claudius, despite his lineage, is particularly vulnerable due to his perceived weakness and the court's treacherous nature, requiring vigilant protection."],
        ap.goals = ["Short-term Goal: To keep Claudius safe within his room and prevent him from responding to the potentially dangerous summons.", "Medium-term Goal: To ensure Claudius's continued survival and well-being amidst the ongoing political turmoil and threats within the palace.", "Ultimate Goal: To secure a stable and safe future for both herself and Claudius, potentially through navigating the palace intrigues to their advantage and ensuring his position is secure."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Claudius sits huddled with Marcus and Asprenas, visibly anxious and tense. He makes physical attempts to convey his presence, fidgeting slightly as he speaks. His posture is defensive, hunched over with hands clasped, reflecting a mix of fear and anticipation.',
        ap.emotional_state = 'Claudius exhibits a blend of fear and resignation. Outwardly, he expresses anxiety through his stammer and cautious words. Internally, he wrestles with a deep-seated dread of the unknown fate that awaits him, feeling the weight of his family\'s disdain and the cruelty of Caligula\'s reign. His acceptance of Marcus\'s apology reveals a yearning for connection amid chaos.',
        ap.emotional_tags = ["claudius exhibits a blend of fear", "resignation. outwardly, he expresses anxiety through his stammer", "cautious words. internally, he wrestles with a deep-seated dread of the unknown fate that awaits him, feeling the weight of his family's disdain", "the cruelty of caligula's reign. his acceptance of marcus's apology reveals a yearning for connection amid chaos.", "claudius exhibits a blend of fear and resignation. outwardly", "he expresses anxiety through his stammer and cautious words. internally", "he wrestles with a deep-seated dread of the unknown fate that awaits him", "feeling the weight of his family's disdain and the cruelty of caligula's reign. his acceptance of marcus's apology reveals a yearning for connection amid chaos."],
        ap.active_plans = ["To endure the waiting period with his companions, remaining as calm as possible.", "To find solace in shared vulnerability with Marcus.", "To mentally prepare for the possible worst outcomes from Caligula's whims."],
        ap.beliefs = ["Survival in the face of tyranny is paramount, even if it means accepting humiliation.", "Human connection can provide comfort, even in dire circumstances.", "His stammer, while a source of shame, allows him to retreat into a safer emotional space."],
        ap.goals = ["Short-term: To survive the immediate danger posed by Caligula.", "Medium-term: To maintain some semblance of dignity in a humiliating situation.", "Ultimate: To navigate the treacherous political landscape without losing his identity or humanity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Marcus sits close to Claudius, his body language tense and anxious. He glances around nervously, tapping his fingers on his knee. As he speaks to Claudius, he extends his hand in a gesture of reconciliation, desperation apparent in his demeanor.',
        ap.emotional_state = 'Marcus grapples with a tumult of emotions: fear over their uncertain fate and guilt for his past behavior towards Claudius. His apology is laced with sincerity, revealing a deep internal conflict as he seeks to make amends under the shadow of death. There is a palpable tension between his desire for forgiveness and his underlying fear of the Emperor’s anger.',
        ap.emotional_tags = ["marcus grapples with a tumult of emotions: fear over their uncertain fate", "guilt for his past behavior towards claudius. his apology is laced with sincerity, revealing a deep internal conflict as he seeks to make amends under the shadow of death. there is a palpable tension between his desire for forgiveness", "his underlying fear of the emperor\u2019s anger.", "marcus grapples with a tumult of emotions: fear over their uncertain fate and guilt for his past behavior towards claudius. his apology is laced with sincerity", "revealing a deep internal conflict as he seeks to make amends under the shadow of death. there is a palpable tension between his desire for forgiveness and his underlying fear of the emperor\u2019s anger."],
        ap.active_plans = ["To seek forgiveness from Claudius as a means of reconciling their past.", "To provide emotional support to Claudius and bolster their camaraderie.", "To strategize mentally about potential escape or survival options."],
        ap.beliefs = ["Personal relationships can be salvaged even in dire times.", "Courage is necessary to confront both external threats and internal fears.", "The bonds of friendship are vital for survival amid the chaos of Caligula's court."],
        ap.goals = ["Short-term: To find comfort in the company of Claudius and Asprenas.", "Medium-term: To secure their safety and possibly come up with a plan for escape.", "Ultimate: To resist Caligula\u2019s reign and emerge from the court's treachery with allies."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_7_1'})
    ON CREATE SET
        ap.current_status = 'Asprenas sits stiffly alongside Claudius and Marcus, his eyes darting about the room, clearly apprehensive. He remains silent, absorbing the tension, his body tense and rigid as he processes the gravity of their circumstances.',
        ap.emotional_state = 'Asprenas displays a facade of calm, yet his internal state is marked by unease and concern. His silence speaks volumes; he is acutely aware of the political danger surrounding them. This tension hints at an inner conflict between loyalty to his friends and the dread of Caligula\'s unpredictable nature, highlighting the precariousness of their situation.',
        ap.emotional_tags = ["asprenas displays a facade of calm, yet his internal state is marked by unease", "concern. his silence speaks volumes; he is acutely aware of the political danger surrounding them. this tension hints at an inner conflict between loyalty to his friends", "the dread of caligula's unpredictable nature, highlighting the precariousness of their situation.", "asprenas displays a facade of calm", "yet his internal state is marked by unease and concern. his silence speaks volumes; he is acutely aware of the political danger surrounding them. this tension hints at an inner conflict between loyalty to his friends and the dread of caligula's unpredictable nature", "highlighting the precariousness of their situation.", "asprenas displays a facade of calm, yet his internal state is marked by unease and concern. his silence speaks volumes", "he is acutely aware of the political danger surrounding them. this tension hints at an inner conflict between loyalty to his friends and the dread of caligula's unpredictable nature, highlighting the precariousness of their situation."],
        ap.active_plans = ["To remain vigilant and alert to any signs of danger from Caligula.", "To gauge the reactions of Claudius and Marcus, providing support where necessary.", "To mentally prepare for any sudden shifts in their fates as a means of self-preservation."],
        ap.beliefs = ["Staying observant is crucial for survival in a court filled with treachery.", "Alliances may shift in an instant, and one must be ready to adapt.", "True strength lies in the ability to endure and strategize quietly."],
        ap.goals = ["Short-term: To survive the immediate threat posed by Caligula\u2019s whims.", "Medium-term: To help maintain morale among his companions.", "Ultimate: To navigate the treacherous waters of Caligula's rule while preserving his own life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated and huddled with Marcus and Asprenas, initially tense and anxious about their uncertain fate at Caligula\'s whim. As the singer performs, he becomes visibly engrossed, his posture shifting from apprehension to captivated attention. He listens intently, his stammer momentarily forgotten in the face of the music, and concludes by enthusiastically applauding the performance, showing genuine appreciation.',
        ap.emotional_state = 'Beneath a surface of ever-present anxiety and fear, Claudius experiences a surprising wellspring of genuine emotion. Outwardly, his enthusiastic applause and sincere praise for the singer demonstrate a release of tension, a moment of pure aesthetic appreciation breaking through his usual timidity. Internally, he is deeply moved by the song\'s beauty, finding a fleeting spiritual solace that contrasts sharply with the surrounding dread. This moment reveals a capacity for profound emotional response often masked by his stammer and perceived weakness, suggesting a rich inner life capable of finding beauty even in oppressive circumstances.',
        ap.emotional_tags = ["beneath a surface of ever-present anxiety", "fear, claudius experiences a surprising wellspring of genuine emotion. outwardly, his enthusiastic applause", "sincere praise for the singer demonstrate a release of tension, a moment of pure aesthetic appreciation breaking through his usual timidity. internally, he is deeply moved by the song's beauty, finding a fleeting spiritual solace that contrasts sharply with the surrounding dread. this moment reveals a capacity for profound emotional response often masked by his stammer", "perceived weakness, suggesting a rich inner life capable of finding beauty even in oppressive circumstances.", "beneath a surface of ever-present anxiety and fear", "claudius experiences a surprising wellspring of genuine emotion. outwardly", "his enthusiastic applause and sincere praise for the singer demonstrate a release of tension", "a moment of pure aesthetic appreciation breaking through his usual timidity. internally", "he is deeply moved by the song's beauty", "finding a fleeting spiritual solace that contrasts sharply with the surrounding dread. this moment reveals a capacity for profound emotional response often masked by his stammer and perceived weakness", "suggesting a rich inner life capable of finding beauty even in oppressive circumstances."],
        ap.active_plans = ["To momentarily escape the oppressive fear and anxiety through immersion in the beauty of the song.", "To express genuine appreciation for the performance, demonstrating his refined sensibilities even in a perilous situation.", "To find a brief respite from the dread and uncertainty of his situation, seeking a moment of emotional equilibrium."],
        ap.beliefs = ["Beauty and art can offer profound emotional and spiritual solace even in the darkest of times.", "Genuine appreciation and emotional expression are valuable, regardless of external circumstances or personal fears.", "Moments of beauty and art can provide temporary but vital escapes from harsh realities."],
        ap.goals = ["short-term: To fully experience and appreciate the beauty of the song, allowing it to momentarily lift his spirits.", "medium-term: To find moments of peace and emotional respite amidst the ongoing anxiety and threat posed by Caligula.", "ultimate: To maintain his capacity for emotional response and appreciation for beauty as a means of preserving his humanity and inner life in a brutal world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits huddled, visibly anxious, with his body language tense as he absorbs the atmosphere of the reception. He applauds enthusiastically, his movements slightly awkward but filled with genuine admiration for the haunting performance, indicating his emotional investment in the moment.',
        ap.emotional_state = 'Claudius experiences an outward expression of joy as he applauds the performance, his stammer momentarily forgotten. However, beneath this veneer of enthusiasm lies a deep-seated anxiety about his precarious situation with Caligula. His internal fear of impending doom conflicts with his desire for acceptance and joy, creating a palpable tension within him.',
        ap.emotional_tags = ["claudius experiences an outward expression of joy as he applauds the performance, his stammer momentarily forgotten. however, beneath this veneer of enthusiasm lies a deep-seated anxiety about his precarious situation with caligula. his internal fear of impending doom conflicts with his desire for acceptance", "joy, creating a palpable tension within him.", "claudius experiences an outward expression of joy as he applauds the performance", "his stammer momentarily forgotten. however", "beneath this veneer of enthusiasm lies a deep-seated anxiety about his precarious situation with caligula. his internal fear of impending doom conflicts with his desire for acceptance and joy", "creating a palpable tension within him."],
        ap.active_plans = ["To navigate his relationship with Caligula by attempting to display genuine enthusiasm for the Emperor's whims.", "To seek solace and comfort in the small joys of life amid the political chaos surrounding him.", "To maintain a facade of compliance while secretly yearning for safety and stability."],
        ap.beliefs = ["The belief that showing enthusiasm may shield him from Caligula's wrath.", "The conviction that genuine appreciation for art can provide moments of respite from the treachery of the court.", "A growing understanding that his survival may depend on cleverly playing along with the whims of those in power."],
        ap.goals = ["Short-term: To engage positively with Caligula in the hopes of avoiding immediate danger.", "Medium-term: To establish a rapport that may offer him some protection in the treacherous political landscape.", "Ultimate: To find a way to navigate the complexities of his role while preserving his dignity and safety."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_3'})
    ON CREATE SET
        ap.current_status = 'Caligula enters the scene with an air of theatricality, observing Claudius\'s reactions with a smirk. He approaches Claudius, standing confidently and gesturing flamboyantly as he mocks Claudius\'s sincere appreciation of the performance. His posture conveys a sense of superiority and amusement.',
        ap.emotional_state = 'Caligula exhibits an outwardly jovial demeanor, filled with amusement as he mocks Claudius. Internally, however, he revels in the power he wields over Claudius, deriving pleasure from the contrast between his own chaotic authority and Claudius\'s earnestness. There is a thrill of sadistic enjoyment in belittling those beneath him.',
        ap.emotional_tags = ["caligula exhibits an outwardly jovial demeanor, filled with amusement as he mocks claudius. internally, however, he revels in the power he wields over claudius, deriving pleasure from the contrast between his own chaotic authority", "claudius's earnestness. there is a thrill of sadistic enjoyment in belittling those beneath him.", "caligula exhibits an outwardly jovial demeanor", "filled with amusement as he mocks claudius. internally", "however", "he revels in the power he wields over claudius", "deriving pleasure from the contrast between his own chaotic authority and claudius's earnestness. there is a thrill of sadistic enjoyment in belittling those beneath him."],
        ap.active_plans = ["To entertain himself by ridiculing Claudius and reinforcing his own sense of superiority.", "To manipulate the situation by suggesting an absurd marriage, enjoying the chaos it will create.", "To maintain his grip on power by showcasing the capriciousness of his rule, reminding all present of his authority."],
        ap.beliefs = ["The belief that power is best exhibited through mockery and manipulation of those perceived as weaker.", "The conviction that he must constantly assert his dominance to instill fear and loyalty in those around him.", "A self-serving notion that his whims are the ultimate source of entertainment and authority within the court."],
        ap.goals = ["Short-term: To amuse himself and assert his dominance over Claudius through mockery.", "Medium-term: To create chaos and confusion among his courtiers, reinforcing his unpredictable nature.", "Ultimate: To consolidate his power by instilling fear and loyalty through capricious displays of authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Caligula stands imperiously, orchestrating the scene with grand gestures and dramatic pronouncements. He scrutinizes Claudius with amusement, then claps his hands to summon Messalina, whom he presents as a prize in his twisted game. He exits the scene laughing, leaving chaos and bewilderment in his wake, relishing his control over the unfolding absurdity.',
        ap.emotional_state = 'Caligula is in a state of manic amusement and self-satisfied delight. Outwardly, he is jovial and theatrical, laughing and joking with cruel abandon. Internally, he revels in his power to manipulate and humiliate others, driven by a deep-seated need to assert his dominance and entertain himself at the expense of those he deems beneath him. His laughter is laced with a chilling undercurrent of tyrannical caprice.',
        ap.emotional_tags = ["caligula is in a state of manic amusement", "self-satisfied delight. outwardly, he is jovial", "theatrical, laughing", "joking with cruel abandon. internally, he revels in his power to manipulate", "humiliate others, driven by a deep-seated need to assert his dominance", "entertain himself at the expense of those he deems beneath him. his laughter is laced with a chilling undercurrent of tyrannical caprice.", "caligula is in a state of manic amusement and self-satisfied delight. outwardly", "he is jovial and theatrical", "laughing and joking with cruel abandon. internally", "he revels in his power to manipulate and humiliate others", "driven by a deep-seated need to assert his dominance and entertain himself at the expense of those he deems beneath him. his laughter is laced with a chilling undercurrent of tyrannical caprice."],
        ap.active_plans = ["To publicly humiliate Claudius by forcing him into a ridiculous marriage.", "To assert his absolute power and control over everyone in his court.", "To create a spectacle of absurdity for his own twisted entertainment."],
        ap.beliefs = ["He is above all moral and social constraints, free to act on any whim.", "Other people, especially those he deems weak or foolish, exist solely for his amusement.", "His power is absolute and unquestionable, allowing him to dictate reality."],
        ap.goals = ["short-term\": \"To enjoy the immediate spectacle of Claudius's and Messalina's discomfort and the court's reaction.", "medium-term\": \"To reinforce his image as an unpredictable and all-powerful emperor who can defy convention and logic.", "ultimate\": \"To solidify his self-perception as a god-like figure, unbound by human limitations and capable of imposing his will on the world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Claudius initially sits hunched with Marcus and Asprenas, consumed by anxiety and dread. When summoned by Caligula, he approaches hesitantly, looking up with nervous anticipation. He stammers out effusive praise for the dance, attempting to appease the emperor. Upon hearing the marriage announcement, he is visibly shocked and bewildered, stammering in disbelief, yet he later shows genuine warmth and burgeoning affection when speaking directly to Messalina.',
        ap.emotional_state = 'Claudius begins in a state of profound fear and resignation, believing his execution is imminent. He outwardly projects nervous compliance, praising Caligula\'s spectacle to avoid angering him further. Internally, he is utterly bewildered and incredulous at the absurd marriage proposal, yet a flicker of hope and tenderness emerges when he interacts with Messalina.  His surprise at being offered marriage is palpable, contrasting with his initial terror.',
        ap.emotional_tags = ["claudius begins in a state of profound fear", "resignation, believing his execution is imminent. he outwardly projects nervous compliance, praising caligula's spectacle to avoid angering him further. internally, he is utterly bewildered", "incredulous at the absurd marriage proposal, yet a flicker of hope", "tenderness emerges when he interacts with messalina.  his surprise at being offered marriage is palpable, contrasting with his initial terror.", "claudius begins in a state of profound fear and resignation", "believing his execution is imminent. he outwardly projects nervous compliance", "praising caligula's spectacle to avoid angering him further. internally", "he is utterly bewildered and incredulous at the absurd marriage proposal", "yet a flicker of hope and tenderness emerges when he interacts with messalina.  his surprise at being offered marriage is palpable", "contrasting with his initial terror."],
        ap.active_plans = ["To survive Caligula's unpredictable whims and avoid any action that could provoke his anger.", "To express excessive flattery towards Caligula to try and de-escalate the situation.", "To navigate the unexpected marriage proposal with as much grace and caution as possible, seeking a path to safety."],
        ap.beliefs = ["Caligula is dangerously unpredictable and must be appeased to survive.", "Discretion and humility are the best defenses against tyranny.", "Even in moments of absurdity, basic human kindness and connection remain important."],
        ap.goals = ["short-term\": \"To escape the immediate threat posed by Caligula's capricious attention.", "medium-term\": \"To find a measure of safety and stability amidst the chaos of Caligula's court, possibly through this unexpected marriage.", "ultimate\": \"To live a life free from fear and persecution, perhaps even finding unexpected happiness and companionship in this chaotic new arrangement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_4'})
    ON CREATE SET
        ap.current_status = 'Messalina enters the reception room with evident apprehension, summoned as an object in Caligula\'s cruel game. She stands before him, compliant and polite, accepting his pronouncement of marriage to Claudius with a formal curtsy and \'Thank you, Caesar.\' When Claudius speaks to her, she turns her attention to him, engaging in a more direct and personal exchange, seeking reassurance and expressing her own fear and relief.',
        ap.emotional_state = 'Messalina is initially gripped by fear and uncertainty upon being summoned by Caligula, anticipating a potentially dangerous or humiliating encounter. Outwardly, she maintains a composed and polite demeanor, masking her apprehension with formal courtesy. Internally, she experiences a complex mix of relief at the nature of Caligula\'s decree, and a burgeoning sense of strategic opportunity.  Her question to Claudius about love hints at a deeper desire for genuine connection amidst the political maneuvering.',
        ap.emotional_tags = ["messalina is initially gripped by fear", "uncertainty upon being summoned by caligula, anticipating a potentially dangerous or humiliating encounter. outwardly, she maintains a composed", "polite demeanor, masking her apprehension with formal courtesy. internally, she experiences a complex mix of relief at the nature of caligula's decree,", "a burgeoning sense of strategic opportunity.  her question to claudius about love hints at a deeper desire for genuine connection amidst the political maneuvering.", "messalina is initially gripped by fear and uncertainty upon being summoned by caligula", "anticipating a potentially dangerous or humiliating encounter. outwardly", "she maintains a composed and polite demeanor", "masking her apprehension with formal courtesy. internally", "she experiences a complex mix of relief at the nature of caligula's decree", "and a burgeoning sense of strategic opportunity.  her question to claudius about love hints at a deeper desire for genuine connection amidst the political maneuvering."],
        ap.active_plans = ["To navigate her encounter with Caligula without provoking his wrath or displeasure.", "To accept the marriage proposal as a potentially safer and more advantageous outcome than what she initially feared.", "To assess Claudius as a potential husband and protector, exploring the possibilities of this unexpected union."],
        ap.beliefs = ["Caligula's favor is fickle and dangerous, requiring careful navigation to survive.", "Marriage to Claudius might offer a degree of safety and social standing within the court.", "Even in politically motivated arrangements, personal security and perhaps even affection are desirable goals."],
        ap.goals = ["short-term\": \"To escape Caligula's immediate presence without harm and with a seemingly positive outcome.", "medium-term\": \"To secure a stable and potentially beneficial marriage to Claudius, improving her position and safety.", "ultimate\": \"To establish a secure and possibly even fulfilling life within the Roman court, leveraging this unexpected marriage to her advantage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_5'})
    ON CREATE SET
        ap.current_status = 'Caligula stands at the center of the Reception Room, exuding an air of chaotic authority as he delivers his absurd decree. His posture is grandiose, arms wide in a theatrical gesture, laughing maniacally as he relishes the stunned expressions of those around him.',
        ap.emotional_state = 'Caligula\'s outward demeanor is one of unhinged glee, his laughter echoing through the room, masking a deeper insecurity and paranoia that defines his reign. Beneath the surface, he feels threatened by the conspiratorial whispers around him, driving his need for absurdity and dominance. His detachment from reality creates a dissonance between his actions and the impending consequences.',
        ap.emotional_tags = ["caligula's outward demeanor is one of unhinged glee, his laughter echoing through the room, masking a deeper insecurity", "paranoia that defines his reign. beneath the surface, he feels threatened by the conspiratorial whispers around him, driving his need for absurdity", "dominance. his detachment from reality creates a dissonance between his actions", "the impending consequences.", "caligula's outward demeanor is one of unhinged glee", "his laughter echoing through the room", "masking a deeper insecurity and paranoia that defines his reign. beneath the surface", "he feels threatened by the conspiratorial whispers around him", "driving his need for absurdity and dominance. his detachment from reality creates a dissonance between his actions and the impending consequences."],
        ap.active_plans = ["To entertain himself and assert dominance through absurdity.", "To distract and intimidate those around him by belittling Claudius.", "To propagate his chaotic rule by enforcing bizarre decrees that solidify his control."],
        ap.beliefs = ["Power must be maintained through spectacle and unpredictability.", "Fear and laughter can coexist to secure loyalty and obedience.", "His divine status is unquestionable, despite the growing discontent around him."],
        ap.goals = ["Short-term: To amuse himself and diminish the anxieties of his court with absurd proclamations.", "Medium-term: To reaffirm his position as Emperor by showcasing his perceived divinity through outrageous behavior.", "Ultimate: To consolidate his power and remain unchallenged, all while indulging in the chaos of his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_6'})
    ON CREATE SET
        ap.current_status = 'Marcus stands slightly apart from Claudius and Messalina, his body tense with suppressed anger. He listens to Caligula\'s crass pronouncements about \'Bottoms up!\' with a visible tightening of his jaw.  As Caligula exits, Marcus turns, not to Claudius or Messalina, but almost to the space Caligula has just vacated, and delivers his counter watchword, \'Liberty,\' with a quiet but firm intensity.',
        ap.emotional_state = 'Marcus is consumed by disgust and outrage at Caligula\'s vulgarity and the emperor\'s utter lack of respect for Roman dignity. Beneath this surface anger, there\'s a deep-seated weariness and despair at the state of Rome. He feels a conflict between his duty as a soldier and his moral revulsion at Caligula\'s tyranny. His defiance is born not of rashness but of a controlled fury that has reached its breaking point, suggesting a long-simmering resentment finally finding expression.',
        ap.emotional_tags = ["marcus is consumed by disgust", "outrage at caligula's vulgarity", "the emperor's utter lack of respect for roman dignity. beneath this surface anger, there's a deep-seated weariness", "despair at the state of rome. he feels a conflict between his duty as a soldier", "his moral revulsion at caligula's tyranny. his defiance is born not of rashness but of a controlled fury that has reached its breaking point, suggesting a long-simmering resentment finally finding expression.", "marcus is consumed by disgust and outrage at caligula's vulgarity and the emperor's utter lack of respect for roman dignity. beneath this surface anger", "there's a deep-seated weariness and despair at the state of rome. he feels a conflict between his duty as a soldier and his moral revulsion at caligula's tyranny. his defiance is born not of rashness but of a controlled fury that has reached its breaking point", "suggesting a long-simmering resentment finally finding expression.", "marcus is consumed by disgust and outrage at caligula's vulgarity and the emperor's utter lack of respect for roman dignity. beneath this surface anger, there's a deep-seated weariness and despair at the state of rome. he feels a conflict between his duty as a soldier and his moral revulsion at caligula's tyranny. his defiance is born not of rashness", "of a controlled fury that has reached its breaking point, suggesting a long-simmering resentment finally finding expression."],
        ap.active_plans = ["Express his profound disapproval of Caligula's debased rule and values.", "Plant a seed of resistance in the minds of those present, particularly Claudius and Messalina.", "Reassert his own commitment to traditional Roman virtues like liberty and order in stark contrast to Caligula's chaos."],
        ap.beliefs = ["Rome should be governed by principles of law, order, and dignity, not by the whims of a mad tyrant.", "Caligula's reign is a profound betrayal of Roman ideals and a dangerous descent into barbarism.", "Liberty is a fundamental Roman value worth fighting for, even against overwhelming power."],
        ap.goals = ["short-term\": \"To make his feelings known immediately and unequivocally in this moment of blatant disrespect.", "medium-term\": \"To contribute to a growing sentiment of dissent among those who still value Rome and its traditions.", "ultimate\": \"To see Rome liberated from Caligula's tyranny and restored to a state of just and stable governance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_7'})
    ON CREATE SET
        ap.current_status = 'Claudius sits hunched, physically tense and anxious, his stammering speech punctuating the air with a sense of dread. He extends a hand towards Marcus, seeking a semblance of comfort in this absurd predicament. His posture, a mixture of nervous energy and reluctant acceptance, reflects his internal struggle as he grapples with the chaotic whims of Caligula.',
        ap.emotional_state = 'On the surface, Claudius displays anxiety and trepidation, accentuated by his stammer and fidgeting gestures. Internally, however, a deeper conflict brews; he feels a mix of resignation and the burgeoning realization of his potential for affection. There is a poignant vulnerability in his interactions with Messalina, revealing his desire to forge a connection amidst the chaos, even as fear of the impending doom looms large.',
        ap.emotional_tags = ["on the surface, claudius displays anxiety", "trepidation, accentuated by his stammer", "fidgeting gestures. internally, however, a deeper conflict brews; he feels a mix of resignation", "the burgeoning realization of his potential for affection. there is a poignant vulnerability in his interactions with messalina, revealing his desire to forge a connection amidst the chaos, even as fear of the impending doom looms large.", "on the surface", "claudius displays anxiety and trepidation", "accentuated by his stammer and fidgeting gestures. internally", "however", "a deeper conflict brews; he feels a mix of resignation and the burgeoning realization of his potential for affection. there is a poignant vulnerability in his interactions with messalina", "revealing his desire to forge a connection amidst the chaos", "even as fear of the impending doom looms large.", "on the surface, claudius displays anxiety and trepidation, accentuated by his stammer and fidgeting gestures. internally, however, a deeper conflict brews", "he feels a mix of resignation and the burgeoning realization of his potential for affection. there is a poignant vulnerability in his interactions with messalina, revealing his desire to forge a connection amidst the chaos, even as fear of the impending doom looms large."],
        ap.active_plans = ["To seek reassurance and comfort in the presence of his companions.", "To navigate the absurd situation with a sense of emerging responsibility.", "To explore the possibility of genuine affection towards Messalina amidst the chaos."],
        ap.beliefs = ["That safety can be found through unexpected connections, even amidst turmoil.", "That his intellectual depth can be a source of strength, despite his physical limitations.", "That love, however improbable, can blossom even in the darkest of circumstances."],
        ap.goals = ["Short-term: To survive the immediate tension and absurdity of Caligula's antics.", "Medium-term: To establish a sense of safety and trust with Messalina.", "Ultimate: To find a genuine emotional connection and reclaim his dignity in the face of adversity."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_7'})
    ON CREATE SET
        ap.current_status = 'Messalina enters the reception room, her body language revealing both apprehension and determination. She stands before Claudius, projecting a facade of calm while internally wrestling with the absurdity of her situation. As she speaks with Claudius, her posture shifts between vulnerability and a cautious desire for connection, indicative of her complex emotional landscape.',
        ap.emotional_state = 'Outwardly, Messalina appears poised yet nervous, her expressions revealing a flicker of hope amidst her fear of Caligula’s unpredictable nature. Internally, she grapples with her genuine fear of the Emperor while tentatively seeking affection from Claudius, reflecting a deep yearning for safety and emotional security. Her question about love signifies an underlying vulnerability, unveiling her desire for authentic connection in a world filled with peril.',
        ap.emotional_tags = ["outwardly, messalina appears poised yet nervous, her expressions revealing a flicker of hope amidst her fear of caligula\u2019s unpredictable nature. internally, she grapples with her genuine fear of the emperor while tentatively seeking affection from claudius, reflecting a deep yearning for safety", "emotional security. her question about love signifies an underlying vulnerability, unveiling her desire for authentic connection in a world filled with peril.", "outwardly", "messalina appears poised yet nervous", "her expressions revealing a flicker of hope amidst her fear of caligula\u2019s unpredictable nature. internally", "she grapples with her genuine fear of the emperor while tentatively seeking affection from claudius", "reflecting a deep yearning for safety and emotional security. her question about love signifies an underlying vulnerability", "unveiling her desire for authentic connection in a world filled with peril.", "outwardly, messalina appears poised yet nervous, her expressions revealing a flicker of hope amidst her fear of caligula\u2019s unpredictable nature. internally, she grapples with her genuine fear of the emperor", "tentatively seeking affection from claudius, reflecting a deep yearning for safety and emotional security. her question about love signifies an underlying vulnerability, unveiling her desire for authentic connection in a world filled with peril."],
        ap.active_plans = ["To reassure Claudius and seek his companionship as a source of stability.", "To navigate the absurdity of her impending marriage with a sense of hope.", "To express her feelings and test the waters of affection with Claudius."],
        ap.beliefs = ["That marriage to Claudius could provide her safety from Caligula's madness.", "That genuine affection can arise even from the most unlikely circumstances.", "That vulnerability in expressing feelings may lead to a deeper connection."],
        ap.goals = ["Short-term: To build a sense of trust and comfort with Claudius.", "Medium-term: To find emotional security through her potential marriage.", "Ultimate: To forge a genuine bond with Claudius, transcending the political machinations around her."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_8'})
    ON CREATE SET
        ap.current_status = 'Messalina stands before Claudius and Caligula in the palace reception room, having been summoned back after her dance rehearsal. Initially entering with apprehension evident in her posture, she visibly relaxes as Caligula announces his bizarre plan to marry her to Claudius. She directly addresses Claudius, accepting the proposition and politely indicating her need to depart and prepare for the impending wedding ceremony the following day, her demeanor shifting to one of newfound warmth and purpose.',
        ap.emotional_state = 'On the surface, Messalina projects an image of polite gratitude and agreement, thanking Caesar and expressing happiness at the prospect of marrying Claudius.  Beneath this facade, she is likely experiencing immense relief, having feared a far more sinister fate at Caligula\'s capricious whim. Her quick acceptance masks a calculated pragmatism; she recognizes marriage to Claudius as a safer, potentially advantageous alternative, offering security in a perilous court. There\'s an unspoken ambition flickering in her eyes, hinting at the possibilities this unexpected union might present.',
        ap.emotional_tags = ["on the surface, messalina projects an image of polite gratitude", "agreement, thanking caesar", "expressing happiness at the prospect of marrying claudius.  beneath this facade, she is likely experiencing immense relief, having feared a far more sinister fate at caligula's capricious whim. her quick acceptance masks a calculated pragmatism; she recognizes marriage to claudius as a safer, potentially advantageous alternative, offering security in a perilous court. there's an unspoken ambition flickering in her eyes, hinting at the possibilities this unexpected union might present.", "on the surface", "messalina projects an image of polite gratitude and agreement", "thanking caesar and expressing happiness at the prospect of marrying claudius.  beneath this facade", "she is likely experiencing immense relief", "having feared a far more sinister fate at caligula's capricious whim. her quick acceptance masks a calculated pragmatism; she recognizes marriage to claudius as a safer", "potentially advantageous alternative", "offering security in a perilous court. there's an unspoken ambition flickering in her eyes", "hinting at the possibilities this unexpected union might present.", "on the surface, messalina projects an image of polite gratitude and agreement, thanking caesar and expressing happiness at the prospect of marrying claudius.  beneath this facade, she is likely experiencing immense relief, having feared a far more sinister fate at caligula's capricious whim. her quick acceptance masks a calculated pragmatism", "she recognizes marriage to claudius as a safer, potentially advantageous alternative, offering security in a perilous court. there's an unspoken ambition flickering in her eyes, hinting at the possibilities this unexpected union might present."],
        ap.active_plans = ["Secure her immediate safety by complying with Caligula's absurd marriage plan.", "Prepare for the wedding ceremony scheduled for the next day, ensuring she fulfills her role.", "Establish a stable and potentially beneficial position as Claudius's wife within the palace, leveraging this new status for security and influence."],
        ap.beliefs = ["Marriage, even under bizarre circumstances, can provide a shield in a dangerous environment.", "Claudius, despite his perceived weaknesses, represents a safer haven compared to Caligula's unpredictable cruelty.", "Compliance and outward displays of gratitude are essential survival strategies when dealing with a tyrant like Caligula."],
        ap.goals = ["short_term\": \"Depart the reception room immediately to begin preparations for the wedding.", "medium_term\": \"Successfully marry Claudius and establish herself as his wife within the palace, securing a more stable existence.", "ultimate\": \"Achieve a position of influence and security within the Roman court, using her marriage to Claudius as a foundation for navigating the treacherous political landscape and potentially furthering her own ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_8'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially seated and huddled anxiously with Marcus and Asprenas, reflecting his deep unease about his uncertain fate under Caligula\'s scrutiny. When summoned by Caligula, he nervously approaches, stammering his praise for the dance performance in an attempt to appease the Emperor.  Upon Caligula\'s ludicrous marriage proposal, Claudius is visibly taken aback, stammering in disbelief. However, Messalina\'s unexpected acceptance and expression of seeking safety with him immediately shifts his demeanor to one of surprised delight and burgeoning affection. He then stands to bid Messalina goodbye as she prepares to leave, his posture now imbued with a tentative hope and nascent romantic interest.',
        ap.emotional_state = 'Claudius begins the event in a state of palpable anxiety and fear, dreading Caligula\'s unpredictable intentions and potential cruelty.  His genuine appreciation for the singer\'s performance reveals his underlying sensitivity and yearning for beauty amidst the court\'s brutality.  Caligula\'s marriage proposal initially evokes shock and self-deprecation, as he perceives himself as an object of ridicule. However, Messalina\'s positive response and expressed desire for his protection triggers a profound emotional shift. He experiences a surge of unexpected joy and perhaps disbelief, feeling flattered and even romantically inclined towards Messalina, his stammering expressing genuine emotion rather than just fear.',
        ap.emotional_tags = ["claudius begins the event in a state of palpable anxiety", "fear, dreading caligula's unpredictable intentions", "potential cruelty.  his genuine appreciation for the singer's performance reveals his underlying sensitivity", "yearning for beauty amidst the court's brutality.  caligula's marriage proposal initially evokes shock", "self-deprecation, as he perceives himself as an object of ridicule. however, messalina's positive response", "expressed desire for his protection triggers a profound emotional shift. he experiences a surge of unexpected joy", "perhaps disbelief, feeling flattered", "even romantically inclined towards messalina, his stammering expressing genuine emotion rather than just fear.", "claudius begins the event in a state of palpable anxiety and fear", "dreading caligula's unpredictable intentions and potential cruelty.  his genuine appreciation for the singer's performance reveals his underlying sensitivity and yearning for beauty amidst the court's brutality.  caligula's marriage proposal initially evokes shock and self-deprecation", "as he perceives himself as an object of ridicule. however", "messalina's positive response and expressed desire for his protection triggers a profound emotional shift. he experiences a surge of unexpected joy and perhaps disbelief", "feeling flattered and even romantically inclined towards messalina", "his stammering expressing genuine emotion rather than just fear."],
        ap.active_plans = ["Endure Caligula's capricious pronouncements and avoid provoking his wrath, focusing on survival in the immediate moment.", "Express enthusiastic praise for the performance to appease Caligula and deflect potential negative attention.", "Embrace the unexpected marriage proposal and Messalina's apparent acceptance, navigating this absurd situation with pragmatism and newfound hope."],
        ap.beliefs = ["Deferential behavior and outward displays of appreciation are crucial for survival under Caligula's tyrannical rule.", "Marriage to Messalina, despite its bizarre origins, represents an unforeseen and potentially positive turn of events.", "Messalina's expressed desire for safety with him is genuine and validating, offering a rare moment of personal connection and perhaps even affection."],
        ap.goals = ["short_term\": \"Formally agree to marry Messalina and politely bid her farewell as she departs to prepare for the ceremony.", "medium_term\": \"Proceed with the wedding ceremony the next day and attempt to establish a functional and perhaps even affectionate marital relationship with Messalina.", "ultimate\": \"Seek a semblance of personal happiness and companionship within the constraints of his life in the Roman court, finding unexpected fulfillment and purpose through this unlikely marriage, and potentially gaining a degree of personal agency within his constrained existence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_9'})
    ON CREATE SET
        ap.current_status = 'Caligula stands confidently in the reception room, his presence commanding attention as he leans slightly forward, a smirk playing on his lips. His posture is exaggerated, emphasizing his erratic energy, and his gestures are flamboyant as he mocks Claudius and the absurdity of the situation. With a theatrical flair, he orders the auspices to be taken, reveling in the chaos he creates.',
        ap.emotional_state = 'Caligula exhibits surface-level amusement, his laughter echoing through the room as he relishes the absurdity of marrying Claudius to Messalina. Internally, he experiences a tumultuous blend of insecurity and a desperate need for validation, masked by his bravado. This dichotomy highlights the unspoken conflict between his desire for dominance and the fragility of his mental state.',
        ap.emotional_tags = ["caligula exhibits surface-level amusement, his laughter echoing through the room as he relishes the absurdity of marrying claudius to messalina. internally, he experiences a tumultuous blend of insecurity", "a desperate need for validation, masked by his bravado. this dichotomy highlights the unspoken conflict between his desire for dominance", "the fragility of his mental state.", "caligula exhibits surface-level amusement", "his laughter echoing through the room as he relishes the absurdity of marrying claudius to messalina. internally", "he experiences a tumultuous blend of insecurity and a desperate need for validation", "masked by his bravado. this dichotomy highlights the unspoken conflict between his desire for dominance and the fragility of his mental state."],
        ap.active_plans = ["To mock Claudius by orchestrating a ridiculous marriage, reinforcing his power over the family.", "To further assert his own authority by showcasing the ridiculousness of appointing a horse as a senator, amplifying his chaotic reign.", "To distract from the mounting discontent among the Senate and military by creating spectacle and absurdity."],
        ap.beliefs = ["Power is best expressed through spectacle and mockery, as it keeps his subjects off-balance.", "His position as Emperor grants him the right to dictate the rules of engagement, no matter how outrageous.", "Those he considers weak, like Claudius, should be humiliated to reinforce his own status."],
        ap.goals = ["Short-term: To entertain himself and others with absurdity, particularly by embarrassing Claudius.", "Medium-term: To solidify his power by reinforcing his image as an unpredictable ruler.", "Ultimate: To maintain control over the empire through fear and spectacle, ensuring his reign is remembered."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_gates_covered_way_event_8_3'})
    ON CREATE SET
        oi.description = 'The gates of the covered way are not merely architectural features; they are transformed into a critical instrument of the assassination plot. Cassius designates these gates as the linchpin of their strategy, envisioning them as a means to isolate Caligula from his formidable German guards. Marcus is tasked with the crucial role of luring Caligula to use the covered way exit, setting the stage for Cassius and Sabinus, positioned strategically outside, to slam the gates shut. This action is intended to create a temporary but vital barrier, separating the Emperor from his protectors and rendering him vulnerable to the assassins\' attack within the confined space of the covered way. The gates, in this context, become more than just a passage; they are a tactical trap, a means of control, and a symbol of the conspirators\' desperate attempt to seize power through calculated manipulation of the palace\'s physical space.',
        oi.status_before = 'Prior to the conspiratorial discussion, the gates of the covered way are in their normal, functional state, serving as an unremarkable exit from the Imperial box. They are likely unnoticed and blend into the palace\'s architecture, perceived simply as a routine part of the palace infrastructure, awaiting the unsuspecting Emperor\'s passage and the conspirators\' scheme to imbue them with deadly purpose.',
        oi.status_after = 'The status of the gates after the event is contingent on the success of the assassination. If the plan unfolds as intended, the gates will have served their decisive function, becoming silent witnesses to the regicide within the covered way. They may bear physical marks of the forceful closure or become a focal point for investigation in the aftermath. Should the assassination fail, the gates may remain unused in the plot, retaining their ordinary state, yet symbolically charged as the site of a thwarted rebellion, holding the potential of future plots and the residue of near-fatal conspiracy.'
    WITH oi
    MATCH (o:Object {uuid: 'object_gates_covered_way'})
    MATCH (e:Event {uuid: 'event_8_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Cassius paces back and forth in the shadowy corridor, his movements sharp and restless, reflecting his agitated state of mind. He leans in towards Marcus and Asprenas, his voice low but insistent as he pushes for immediate action, demanding they move beyond discussion and commit to eliminating Caligula.',
        ap.emotional_state = 'Frustration simmers beneath Cassius\'s hardened exterior, a palpable impatience with the prolonged deliberation. He projects a forceful determination, bordering on anger, fueled by a conviction that further delay only increases their peril. Though outwardly resolute, an undercurrent of anxiety likely drives his urgency, masked by his aggressive stance and clipped, decisive pronouncements.',
        ap.emotional_tags = ["frustration simmers beneath cassius's hardened exterior, a palpable impatience with the prolonged deliberation. he projects a forceful determination, bordering on anger, fueled by a conviction that further delay only increases their peril. though outwardly resolute, an undercurrent of anxiety likely drives his urgency, masked by his aggressive stance", "clipped, decisive pronouncements.", "frustration simmers beneath cassius's hardened exterior", "a palpable impatience with the prolonged deliberation. he projects a forceful determination", "bordering on anger", "fueled by a conviction that further delay only increases their peril. though outwardly resolute", "an undercurrent of anxiety likely drives his urgency", "masked by his aggressive stance and clipped", "decisive pronouncements."],
        ap.active_plans = ["Force Marcus and Asprenas to commit to an immediate assassination plan.", "Outline the assassination plan, focusing on the 'when' and 'how'.", "Reassure his co-conspirators about the feasibility and necessity of the plan, dismissing their doubts."],
        ap.beliefs = ["Caligula's continued reign is an existential threat to them all.", "Decisive action is the only way to escape Caligula's tyranny.", "He is the driving force and leader needed to execute this dangerous plan."],
        ap.goals = ["Short-term: To secure the agreement of Marcus and Asprenas to assassinate Caligula.", "Medium-term: To successfully execute the assassination of Caligula during the Games.", "Ultimate: To overthrow Caligula's tyrannical rule and restore a more stable and just order in Rome, even if it means bloodshed."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Marcus stands with a posture of unease, his body language conveying hesitation and reluctance. He voices his concerns directly to Cassius, questioning the practicality and safety of immediate action, emphasizing the formidable presence of Caligula\'s German guards as a significant obstacle.',
        ap.emotional_state = 'Fear and apprehension dominate Marcus\'s emotional state. He is acutely aware of the immense risks involved in assassinating the Emperor, and the potential repercussions should they fail. He is torn between his desire to be free of Caligula\'s tyranny and his deep-seated self-preservation instincts, leading to a visible internal conflict and reluctance to fully commit.',
        ap.emotional_tags = ["fear", "apprehension dominate marcus's emotional state. he is acutely aware of the immense risks involved in assassinating the emperor,", "the potential repercussions should they fail. he is torn between his desire to be free of caligula's tyranny", "his deep-seated self-preservation instincts, leading to a visible internal conflict", "reluctance to fully commit.", "fear and apprehension dominate marcus's emotional state. he is acutely aware of the immense risks involved in assassinating the emperor", "and the potential repercussions should they fail. he is torn between his desire to be free of caligula's tyranny and his deep-seated self-preservation instincts", "leading to a visible internal conflict and reluctance to fully commit."],
        ap.active_plans = ["Assess the dangers and feasibility of Cassius's proposed assassination.", "Express his reservations and seek reassurance about the risks involved.", "Gauge Cassius's resolve and the level of commitment from Asprenas before fully agreeing."],
        ap.beliefs = ["Assassinating Caligula is an extremely dangerous undertaking with potentially fatal consequences.", "Caligula's German guards are a nearly insurmountable obstacle to overcome.", "Prudence and careful planning are essential for any attempt on the Emperor's life."],
        ap.goals = ["Short-term: To thoroughly evaluate the risks and potential outcomes of the assassination plan.", "Medium-term: To survive the immediate threat posed by Caligula's tyranny and the assassination plot.", "Ultimate: To achieve a more stable and less dangerous political environment in Rome, while ensuring his own personal safety and advancement."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Asprenas listens intently to both Cassius and Marcus, his demeanor thoughtful and concerned. He initially remains somewhat passive, observing the dynamic between the other two conspirators, before eventually aligning himself with Cassius\'s sense of urgency and reinforcing the necessity of action to Marcus.',
        ap.emotional_state = 'Asprenas is primarily driven by a sense of pragmatic worry and fear for their collective survival. He recognizes the validity of Marcus\'s concerns about risk but is ultimately more persuaded by the immediate danger of inaction under Caligula\'s rule. His emotional state is a blend of anxiety and a growing resolve to act, spurred by the logic of their precarious situation.',
        ap.emotional_tags = ["asprenas is primarily driven by a sense of pragmatic worry", "fear for their collective survival. he recognizes the validity of marcus's concerns about risk but is ultimately more persuaded by the immediate danger of inaction under caligula's rule. his emotional state is a blend of anxiety", "a growing resolve to act, spurred by the logic of their precarious situation.", "asprenas is primarily driven by a sense of pragmatic worry and fear for their collective survival. he recognizes the validity of marcus's concerns about risk but is ultimately more persuaded by the immediate danger of inaction under caligula's rule. his emotional state is a blend of anxiety and a growing resolve to act", "spurred by the logic of their precarious situation.", "asprenas is primarily driven by a sense of pragmatic worry and fear for their collective survival. he recognizes the validity of marcus's concerns about risk", "is ultimately more persuaded by the immediate danger of inaction under caligula's rule. his emotional state is a blend of anxiety and a growing resolve to act, spurred by the logic of their precarious situation."],
        ap.active_plans = ["Weigh the arguments for and against immediate action presented by Cassius and Marcus.", "Assess the overall level of risk and potential for success of the assassination plot.", "Offer his support to Cassius's plan to solidify the group's commitment and overcome Marcus's hesitation."],
        ap.beliefs = ["Continuing to live under Caligula's tyranny is unsustainable and will inevitably lead to their destruction.", "Action, despite its inherent risks, is a more viable path to survival than passive waiting.", "Unity and agreement among the conspirators are crucial for any chance of success."],
        ap.goals = ["Short-term: To reach a consensus with Cassius and Marcus on a course of action.", "Medium-term: To participate in a plan that maximizes their chances of surviving the current crisis and Caligula's reign.", "Ultimate: To see Rome restored to a state of order and stability, free from the madness and tyranny of Caligula, ensuring long-term safety for himself and his colleagues."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_2'})
    ON CREATE SET
        ap.current_status = 'CASSIUS stands resolute, pacing with an air of impatience in the dim corridor. His posture is tense, signaling urgency as he articulates a bold plan for Caligula\'s assassination. His gestures are emphatic, slicing through the air, underscoring the gravity of their mission.',
        ap.emotional_state = 'CASSIUS exudes fervent determination, his surface calm concealing an undercurrent of anxiety. The stakes weigh heavy on him, as he battles the tension between his fierce resolve and the fear of impending failure. His words brim with the weight of desperation, hinting at unspoken doubts about the loyalty of his cohorts.',
        ap.emotional_tags = ["cassius exudes fervent determination, his surface calm concealing an undercurrent of anxiety. the stakes weigh heavy on him, as he battles the tension between his fierce resolve", "the fear of impending failure. his words brim with the weight of desperation, hinting at unspoken doubts about the loyalty of his cohorts.", "cassius exudes fervent determination", "his surface calm concealing an undercurrent of anxiety. the stakes weigh heavy on him", "as he battles the tension between his fierce resolve and the fear of impending failure. his words brim with the weight of desperation", "hinting at unspoken doubts about the loyalty of his cohorts."],
        ap.active_plans = ["Execute Caligula's assassination during the Games, leveraging the chaos of the final day.", "Persuade Marcus and the others to commit to the plan despite potential risks.", "Prepare for a swift transition to declare a Republic following the assassination."],
        ap.beliefs = ["Freedom is worth the risk of assassination, as tyranny must be confronted.", "Calculated strategies can overcome overwhelming odds, even against well-guarded targets.", "Loyalty is valuable, yet easily misinterpreted in times of desperate ambition."],
        ap.goals = ["Short-term: Strategically execute the assassination plan without detection.", "Medium-term: Establish a Republic that ends Caligula\u2019s tyrannical reign.", "Ultimate: Restore order to Rome and liberate it from the grip of madness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_2'})
    ON CREATE SET
        ap.current_status = 'MARCUS appears conflicted, standing slightly apart in the corridor, his posture tense and hesitant. His pacing slows as he processes CASSIUS\'s bold assertions. He gestures weakly, indicating his struggle to reconcile loyalty with caution, embodying the weight of the decision that looms ahead.',
        ap.emotional_state = 'MARCUS wears a mask of apprehension, his brow furrowed with concern as he contemplates the perilous implications of their plot. Internally, he wrestles with fear and doubt, torn between his growing desire for safety and the loyalty he feels towards his fellow conspirators. His hesitation reflects a deeper conflict between ambition and moral integrity.',
        ap.emotional_tags = ["marcus wears a mask of apprehension, his brow furrowed with concern as he contemplates the perilous implications of their plot. internally, he wrestles with fear", "doubt, torn between his growing desire for safety", "the loyalty he feels towards his fellow conspirators. his hesitation reflects a deeper conflict between ambition", "moral integrity.", "marcus wears a mask of apprehension", "his brow furrowed with concern as he contemplates the perilous implications of their plot. internally", "he wrestles with fear and doubt", "torn between his growing desire for safety and the loyalty he feels towards his fellow conspirators. his hesitation reflects a deeper conflict between ambition and moral integrity."],
        ap.active_plans = ["Evaluate the risks involved in the assassination scheme and gather intel.", "Seek a way to persuade CALIGULA to use the covered exit without raising suspicion.", "Contribute to the plan's execution, ensuring minimal risk to his own life."],
        ap.beliefs = ["The danger of assassination outweighs the potential benefits of a new regime.", "Loyalty to comrades is paramount, but personal survival must take precedence.", "Caligula's tyranny must end, but the cost of action must be carefully weighed."],
        ap.goals = ["Short-term: Ensure a safe execution of the plan without compromising his position.", "Medium-term: Assist in manuevering CALIGULA into a vulnerable position for the assassination.", "Ultimate: Survive the coup and navigate the aftermath to protect his own interests."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Cassius is the driving force, pacing restlessly in the shadowed corridor, his body language radiating impatience and urgency. He stands firmly before Marcus and Asprenas, directly addressing them with forceful gestures, emphasizing the need for immediate action. His movements are sharp and decisive, reflecting his soldier\'s mentality and command presence.',
        ap.emotional_state = 'Cassius is consumed by a burning resolve masked by impatience. Outwardly, he projects an image of unwavering determination and controlled anger, dismissing any hesitation as weakness. Beneath this hardened exterior, a deep-seated fear for Rome\'s future and a simmering rage against Caligula\'s tyranny fuel his actions. He is tired of deliberation, desperate for decisive action, and perhaps anxious about the immense risk they are about to undertake, yet committed to seeing it through.',
        ap.emotional_tags = ["cassius is consumed by a burning resolve masked by impatience. outwardly, he projects an image of unwavering determination", "controlled anger, dismissing any hesitation as weakness. beneath this hardened exterior, a deep-seated fear for rome's future", "a simmering rage against caligula's tyranny fuel his actions. he is tired of deliberation, desperate for decisive action,", "perhaps anxious about the immense risk they are about to undertake, yet committed to seeing it through.", "cassius is consumed by a burning resolve masked by impatience. outwardly", "he projects an image of unwavering determination and controlled anger", "dismissing any hesitation as weakness. beneath this hardened exterior", "a deep-seated fear for rome's future and a simmering rage against caligula's tyranny fuel his actions. he is tired of deliberation", "desperate for decisive action", "and perhaps anxious about the immense risk they are about to undertake", "yet committed to seeing it through."],
        ap.active_plans = ["To solidify Marcus and Asprenas' commitment to the assassination plan, overcoming their reservations.", "To finalize the tactical details of the assassination, focusing on isolating Caligula at the covered way.", "To clearly assign roles to each conspirator to ensure a coordinated and effective execution of the plan."],
        ap.beliefs = ["Tyrannicide is a necessary evil to liberate Rome from Caligula's madness and restore order.", "Procrastination and hesitation are fatal flaws that will only increase the danger and solidify Caligula's tyrannical grip.", "Bold, decisive action, even if risky, is the only path to freedom and a return to republican values."],
        ap.goals = ["Short-term Goal: Secure unequivocal agreement from Marcus and Asprenas to participate actively in the assassination.", "Medium-term Goal: Orchestrate and execute the assassination of Caligula during the Games, minimizing collateral damage.", "Ultimate Goal: Establish a Republic in Rome, dismantling the imperial family's power and ending the cycle of tyranny and madness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Marcus physically recoils from Cassius\'s aggressive stance, his posture suggesting reluctance and apprehension. He stands slightly apart, his movements are hesitant as he voices concerns and objections, questioning the feasibility and risks of the plan. He is listening intently but his body language conveys doubt and inner conflict, caught between duty and fear.',
        ap.emotional_state = 'Marcus is deeply conflicted, torn between his ambition and a palpable fear of the consequences. Outwardly, he presents a cautious and hesitant demeanor, emphasizing the dangers of their plan and the power of Caligula\'s guards. Internally, he wrestles with the enormity of regicide and the personal risk involved, his ambition clashing with his survival instincts. He is likely terrified of failure and the repercussions, yet knows inaction under Caligula\'s rule is also a form of slow death, creating a profound inner turmoil.',
        ap.emotional_tags = ["marcus is deeply conflicted, torn between his ambition", "a palpable fear of the consequences. outwardly, he presents a cautious", "hesitant demeanor, emphasizing the dangers of their plan", "the power of caligula's guards. internally, he wrestles with the enormity of regicide", "the personal risk involved, his ambition clashing with his survival instincts. he is likely terrified of failure", "the repercussions, yet knows inaction under caligula's rule is also a form of slow death, creating a profound inner turmoil.", "marcus is deeply conflicted", "torn between his ambition and a palpable fear of the consequences. outwardly", "he presents a cautious and hesitant demeanor", "emphasizing the dangers of their plan and the power of caligula's guards. internally", "he wrestles with the enormity of regicide and the personal risk involved", "his ambition clashing with his survival instincts. he is likely terrified of failure and the repercussions", "yet knows inaction under caligula's rule is also a form of slow death", "creating a profound inner turmoil."],
        ap.active_plans = ["To thoroughly assess the risks and potential flaws in Cassius's assassination plan before fully committing.", "To articulate his reservations and seek reassurance about the plan's viability, particularly regarding the German guards.", "To reluctantly agree to participate, driven by the logic of Cassius and Asprenas, despite his deep-seated fears and moral qualms."],
        ap.beliefs = ["Assassinating an Emperor, especially one protected by German guards, is an exceptionally perilous undertaking with unpredictable outcomes.", "The immediate threat of Caligula is undeniable, but the potential chaos and retribution following regicide are equally terrifying.", "Self-preservation is a primal instinct, yet inaction in the face of tyranny may be a greater long-term danger to himself and Rome."],
        ap.goals = ["Short-term Goal: Evaluate the immediate dangers and potential escape routes if the assassination fails, focusing on personal survival.", "Medium-term Goal: Navigate the assassination attempt and its immediate aftermath with minimal personal harm, hedging his bets for different outcomes.", "Ultimate Goal:  Restore stability to Rome and potentially advance his own position in a post-Caligula world, while ensuring his long-term safety and influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_8_3'})
    ON CREATE SET
        ap.current_status = 'Sabinus stands alongside Asprenas, listening intently to Cassius\'s plan, his posture suggesting anxiety and worry. He interjects with practical questions, seeking clarification on the details, particularly concerning the German guards and the exit strategy. His movements are minimal, focused on absorbing the information and assessing its feasibility, appearing less proactive than Cassius and more reactive to the unfolding plan.',
        ap.emotional_state = 'Sabinus is primarily driven by anxiety and a pragmatic worry about the plan\'s execution. Outwardly, he expresses his concerns through questions and hesitant agreement, seeking reassurance and practical solutions. Internally, he is likely fearful of the risks involved, yet also motivated by a desire to end Caligula\'s reign and perhaps a personal grievance against the tyrant. His worry about leaving the Imperial family alive reveals a pragmatic, if somewhat ruthless, concern for long-term security and the elimination of future threats, driven by underlying fear and uncertainty.',
        ap.emotional_tags = ["sabinus is primarily driven by anxiety", "a pragmatic worry about the plan's execution. outwardly, he expresses his concerns through questions", "hesitant agreement, seeking reassurance", "practical solutions. internally, he is likely fearful of the risks involved, yet also motivated by a desire to end caligula's reign", "perhaps a personal grievance against the tyrant. his worry about leaving the imperial family alive reveals a pragmatic, if somewhat ruthless, concern for long-term security", "the elimination of future threats, driven by underlying fear", "uncertainty.", "sabinus is primarily driven by anxiety and a pragmatic worry about the plan's execution. outwardly", "he expresses his concerns through questions and hesitant agreement", "seeking reassurance and practical solutions. internally", "he is likely fearful of the risks involved", "yet also motivated by a desire to end caligula's reign and perhaps a personal grievance against the tyrant. his worry about leaving the imperial family alive reveals a pragmatic", "if somewhat ruthless", "concern for long-term security and the elimination of future threats", "driven by underlying fear and uncertainty."],
        ap.active_plans = ["To fully understand the logistical aspects of the assassination plan, ensuring all practical details are accounted for.", "To voice his concerns about potential weaknesses in the plan, specifically regarding the German guards and the exit strategy, seeking reassurance and solutions.", "To express his reservations about leaving other members of the Imperial family alive, advocating for a more comprehensive and ruthless approach to eliminate future threats."],
        ap.beliefs = ["Success hinges on meticulous planning and attention to detail, especially in overcoming practical obstacles like Caligula's guards.", "Any oversight or miscalculation could jeopardize the entire assassination attempt and lead to catastrophic failure.", "Leaving potential enemies alive, even if they are not the primary target, poses a significant future risk to the conspirators' safety and the stability of Rome."],
        ap.goals = ["Short-term Goal: Gain a clear and detailed understanding of the assassination plan to minimize unforeseen risks and ensure personal safety during the attempt.", "Medium-term Goal: Successfully participate in the assassination of Caligula and survive the immediate aftermath, avoiding capture or retribution.", "Ultimate Goal: Achieve a safer and more stable Rome, free from Caligula's tyranny, although his primary motivation appears to be immediate safety and successful regicide, rather than a grander vision for the Republic, tinged with a pragmatic ruthlessness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_4'})
    ON CREATE SET
        ap.current_status = 'CASSIUS stands firm, exuding a commanding presence as he paces with purpose in the corridor. His posture is taut, with shoulders squared and hands clasped tightly together, underscoring his determination. When he asserts the need to kill Caligula, his gestures are sharp and decisive, punctuating his words with fervor.',
        ap.emotional_state = 'CASSIUS\'s surface demeanor reflects confidence and urgency, as his brow furrows with the weight of his convictions. Underneath lies a simmering tension; he is acutely aware of the moral implications of their plot, which gnaws at him despite his assurances of control. He struggles with the heavy burden of responsibility for the lives at stake, creating an internal conflict between his resolve and the potential loss of innocent lives.',
        ap.emotional_tags = ["cassius's surface demeanor reflects confidence", "urgency, as his brow furrows with the weight of his convictions. underneath lies a simmering tension; he is acutely aware of the moral implications of their plot, which gnaws at him despite his assurances of control. he struggles with the heavy burden of responsibility for the lives at stake, creating an internal conflict between his resolve", "the potential loss of innocent lives.", "cassius's surface demeanor reflects confidence and urgency", "as his brow furrows with the weight of his convictions. underneath lies a simmering tension; he is acutely aware of the moral implications of their plot", "which gnaws at him despite his assurances of control. he struggles with the heavy burden of responsibility for the lives at stake", "creating an internal conflict between his resolve and the potential loss of innocent lives.", "cassius's surface demeanor reflects confidence and urgency, as his brow furrows with the weight of his convictions. underneath lies a simmering tension", "he is acutely aware of the moral implications of their plot, which gnaws at him despite his assurances of control. he struggles with the heavy burden of responsibility for the lives at stake, creating an internal conflict between his resolve and the potential loss of innocent lives."],
        ap.active_plans = ["To persuade the conspirators to commit to the assassination of Caligula.", "To coordinate the timing and execution of the plan during the Games.", "To ensure the safety of his co-conspirators by isolating Caligula from his guards."],
        ap.beliefs = ["The end justifies the means when battling tyranny.", "Caligula's reign must end for the sake of Rome's future.", "Loyalty to comrades is paramount, even in the face of moral dilemmas."],
        ap.goals = ["Short-term: To successfully convince MARCUS and ASPRENAS to join the assassination plan.", "Medium-term: To execute the assassination during the final day of the Games, minimizing risks.", "Ultimate: To restore freedom to Rome by establishing a Republic and ending Caligula's tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_4'})
    ON CREATE SET
        ap.current_status = 'ASPRENAS stands slightly hunched, arms crossed defensively as he speaks up, his body language betraying his unease. He fidgets subtly, glancing at CASSIUS and then away, indicative of his troubled mind. His hesitance in presenting his concerns showcases his inner conflict about the violent path they are contemplating.',
        ap.emotional_state = 'ASPRENAS displays a façade of pragmatism, but beneath, he wrestles with fear and moral apprehension. His concerns about the implications of their actions reveal a deep-seated anxiety about the loss of innocent lives, and his body language fluctuates between anxious fidgeting and resolute determination to see justice served. The tension in his voice reflects the weight of potential consequences.',
        ap.emotional_tags = ["asprenas displays a fa\u00e7ade of pragmatism, but beneath, he wrestles with fear", "moral apprehension. his concerns about the implications of their actions reveal a deep-seated anxiety about the loss of innocent lives,", "his body language fluctuates between anxious fidgeting", "resolute determination to see justice served. the tension in his voice reflects the weight of potential consequences.", "asprenas displays a fa\u00e7ade of pragmatism", "but beneath", "he wrestles with fear and moral apprehension. his concerns about the implications of their actions reveal a deep-seated anxiety about the loss of innocent lives", "and his body language fluctuates between anxious fidgeting and resolute determination to see justice served. the tension in his voice reflects the weight of potential consequences.", "asprenas displays a fa\u00e7ade of pragmatism,", "beneath, he wrestles with fear and moral apprehension. his concerns about the implications of their actions reveal a deep-seated anxiety about the loss of innocent lives, and his body language fluctuates between anxious fidgeting and resolute determination to see justice served. the tension in his voice reflects the weight of potential consequences."],
        ap.active_plans = ["To voice concerns about the potential collateral damage of their assassination plan.", "To encourage a more cautious approach to the assassination to mitigate innocent casualties.", "To ultimately support the group in their resolve, albeit reluctantly."],
        ap.beliefs = ["Violence begets violence; one must consider the innocent lives at stake.", "A successful rebellion requires careful planning to ensure minimal loss.", "The current regime's madness must end, but at what cost?"],
        ap.goals = ["Short-term: To express concerns and seek a plan that limits collateral damage.", "Medium-term: To ensure the conspiracy is executed with precision to avoid chaos.", "Ultimate: To support a change in power that leads to a safer Rome, free from tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_4'})
    ON CREATE SET
        ap.current_status = 'MARCUS stands rigid, arms akimbo, listening intently as he processes CASSIUS\'s plan. His stance is firm yet uncertain, reflecting his inner turmoil about the proposed violence. He shifts his weight from one foot to the other, indicative of his apprehension about the risks involved in their plotting.',
        ap.emotional_state = 'MARCUS\'s surface calm belies an undercurrent of anxiety and doubt. His expressions reveal a man grappling with the harsh realities of their plan, torn between ambition and self-preservation. The mention of innocent lives causes his resolve to waver, showcasing his conflict between loyalty to his comrades and moral qualms about the broader implications of their actions.',
        ap.emotional_tags = ["marcus's surface calm belies an undercurrent of anxiety", "doubt. his expressions reveal a man grappling with the harsh realities of their plan, torn between ambition", "self-preservation. the mention of innocent lives causes his resolve to waver, showcasing his conflict between loyalty to his comrades", "moral qualms about the broader implications of their actions.", "marcus's surface calm belies an undercurrent of anxiety and doubt. his expressions reveal a man grappling with the harsh realities of their plan", "torn between ambition and self-preservation. the mention of innocent lives causes his resolve to waver", "showcasing his conflict between loyalty to his comrades and moral qualms about the broader implications of their actions."],
        ap.active_plans = ["To cautiously evaluate the risks of the assassination plan.", "To negotiate the terms of the assassination to ensure Caligula\u2019s death without implicating innocent parties.", "To ultimately decide whether to fully commit to the conspiracy or withdraw if it escalates."],
        ap.beliefs = ["The safety of the innocent must be prioritized, even when faced with tyranny.", "Assassination is a last resort, fraught with unpredictable consequences.", "Survival in the court demands careful navigation of alliances and enmities."],
        ap.goals = ["Short-term: To gain clarity on the assassination plan and its implications.", "Medium-term: To ensure the operation can be executed safely and effectively.", "Ultimate: To restore order in Rome while safeguarding his own position and future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Cassius dominates the confined space of the palace corridor, pacing with a soldier\'s restless energy as he addresses Marcus and Asprenas. His movements are sharp and purposeful, underscoring the urgency he feels. He gestures emphatically as he speaks of killing Caligula, his physical presence conveying a man ready for decisive action, impatient with any sign of wavering from his fellow conspirators.',
        ap.emotional_state = 'On the surface, Cassius projects an image of unwavering resolve and impatience, his tone sharp and demanding as he pushes for immediate action. Beneath this hardened exterior, however, lies a simmering anxiety fueled by the precariousness of their situation under Caligula\'s tyranny. He masks any personal fear with aggressive determination, driven by a deep conviction that only decisive action can secure their survival and liberate Rome from madness, masking any internal turmoil with outward forcefulness.',
        ap.emotional_tags = ["on the surface, cassius projects an image of unwavering resolve", "impatience, his tone sharp", "demanding as he pushes for immediate action. beneath this hardened exterior, however, lies a simmering anxiety fueled by the precariousness of their situation under caligula's tyranny. he masks any personal fear with aggressive determination, driven by a deep conviction that only decisive action can secure their survival", "liberate rome from madness, masking any internal turmoil with outward forcefulness.", "on the surface", "cassius projects an image of unwavering resolve and impatience", "his tone sharp and demanding as he pushes for immediate action. beneath this hardened exterior", "however", "lies a simmering anxiety fueled by the precariousness of their situation under caligula's tyranny. he masks any personal fear with aggressive determination", "driven by a deep conviction that only decisive action can secure their survival and liberate rome from madness", "masking any internal turmoil with outward forcefulness."],
        ap.active_plans = ["To solidify Marcus and Asprenas's commitment to the assassination plot, overcoming Marcus's reservations.", "To finalize the tactical details of the assassination, specifically focusing on the timing and location during the Games.", "To initially advocate for eliminating the entire Imperial family to secure the conspirators' future, though he is willing to compromise on this to maintain unity."],
        ap.beliefs = ["Tyrannical rule must be met with decisive and forceful action to ensure freedom.", "Hesitation and delay are weaknesses that will be exploited by their enemies, leading to certain doom.", "Personal risk is an acceptable price to pay for the greater good of liberating Rome from Caligula's madness."],
        ap.goals = ["short-term\": \"To secure the immediate agreement of Marcus and Asprenas and finalize the assassination plan for the next day.", "medium-term\": \"To successfully assassinate Caligula during the Games, triggering the planned coup.", "ultimate\": \"To establish a Republic in Rome, dismantling the tyrannical imperial system and restoring order and liberty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Marcus stands in the shadowed corridor, physically present but positioned as the recipient of Cassius\'s forceful persuasion. He listens intently, his posture reflecting a mix of apprehension and contemplation. He speaks cautiously, voicing his concerns about the risks involved in the assassination and questioning the practicality of the plan, his movements and stance indicating a man weighing the gravity of the situation and his own personal peril.',
        ap.emotional_state = 'Marcus outwardly displays a cautious and anxious demeanor, his words laced with hesitancy as he voices the risks of the assassination plot. Internally, he is deeply conflicted, torn between his desire to be rid of Caligula\'s tyranny and his fear of the catastrophic repercussions of such a dangerous act. He grapples with the moral implications of regicide and reveals an aversion to unnecessary bloodshed, specifically resisting the idea of extending the kill order beyond Caligula himself, showcasing his internal struggle between ambition and conscience.',
        ap.emotional_tags = ["marcus outwardly displays a cautious", "anxious demeanor, his words laced with hesitancy as he voices the risks of the assassination plot. internally, he is deeply conflicted, torn between his desire to be rid of caligula's tyranny", "his fear of the catastrophic repercussions of such a dangerous act. he grapples with the moral implications of regicide", "reveals an aversion to unnecessary bloodshed, specifically resisting the idea of extending the kill order beyond caligula himself, showcasing his internal struggle between ambition", "conscience.", "marcus outwardly displays a cautious and anxious demeanor", "his words laced with hesitancy as he voices the risks of the assassination plot. internally", "he is deeply conflicted", "torn between his desire to be rid of caligula's tyranny and his fear of the catastrophic repercussions of such a dangerous act. he grapples with the moral implications of regicide and reveals an aversion to unnecessary bloodshed", "specifically resisting the idea of extending the kill order beyond caligula himself", "showcasing his internal struggle between ambition and conscience."],
        ap.active_plans = ["To carefully assess the level of risk associated with Cassius's assassination plan, identifying potential flaws and weaknesses.", "To seek reassurance and further clarification from Cassius and Asprenas regarding the specifics of the plan, particularly concerning the German guards.", "To negotiate the scope of the assassination, arguing against the inclusion of the entire Imperial family and limiting the target to Caligula alone due to moral and practical considerations."],
        ap.beliefs = ["Assassination, while a drastic measure, may be justified under extreme tyranny, but it must be approached with caution and meticulous planning.", "Unnecessary violence and bloodshed are morally reprehensible, and the scope of the assassination should be limited to the absolute minimum required.", "Personal survival is paramount, and any plan must carefully consider and mitigate the risks to oneself."],
        ap.goals = ["short-term\": \"To thoroughly understand the assassination plan and identify ways to minimize his personal risk and ensure its feasibility.", "medium-term\": \"To participate in the removal of Caligula from power, ideally with minimal collateral damage and bloodshed.", "ultimate\": \"To see Rome restored to a state of order and stability, though ideally through means that align with his sense of moral responsibility and limit unnecessary violence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_5'})
    ON CREATE SET
        ap.current_status = 'Asprenas stands alongside Cassius, his physical presence offering support to the hardened soldier\'s forceful stance. He listens attentively to both Cassius and Marcus, interjecting to reinforce Cassius\'s arguments and address Marcus\'s doubts. His posture is engaged and earnest, indicating his active participation in persuading Marcus and solidifying the conspiracy, positioning himself as a pragmatic ally in the face of Marcus\'s hesitation.',
        ap.emotional_state = 'Asprenas projects a demeanor of pragmatic concern, mirroring Cassius\'s urgency and showing agreement with the need for decisive action. Internally, he is likely driven by a deep-seated fear of Caligula and the escalating danger of his reign. He believes inaction is a death sentence and views the assassination as a necessary act of self-preservation. While he expresses concern for survival, his advocacy for eliminating the entire Imperial family reveals a colder, more ruthless pragmatism beneath the surface, prioritizing the group\'s safety above broader moral considerations.',
        ap.emotional_tags = ["asprenas projects a demeanor of pragmatic concern, mirroring cassius's urgency", "showing agreement with the need for decisive action. internally, he is likely driven by a deep-seated fear of caligula", "the escalating danger of his reign. he believes inaction is a death sentence", "views the assassination as a necessary act of self-preservation. while he expresses concern for survival, his advocacy for eliminating the entire imperial family reveals a colder, more ruthless pragmatism beneath the surface, prioritizing the group's safety above broader moral considerations.", "asprenas projects a demeanor of pragmatic concern", "mirroring cassius's urgency and showing agreement with the need for decisive action. internally", "he is likely driven by a deep-seated fear of caligula and the escalating danger of his reign. he believes inaction is a death sentence and views the assassination as a necessary act of self-preservation. while he expresses concern for survival", "his advocacy for eliminating the entire imperial family reveals a colder", "more ruthless pragmatism beneath the surface", "prioritizing the group's safety above broader moral considerations."],
        ap.active_plans = ["To actively support Cassius in persuading Marcus to fully commit to the assassination plan, countering Marcus's reservations with pragmatic arguments.", "To reinforce the urgency of the situation and emphasize the dire consequences of inaction under Caligula's tyrannical rule.", "To advocate for the elimination of the entire Imperial family as a necessary measure to ensure the long-term safety and security of the conspirators after Caligula's death."],
        ap.beliefs = ["Caligula's continued reign represents an existential threat to them and Rome, making decisive action imperative for survival.", "Inaction is a more dangerous course than taking bold action, as it guarantees eventual destruction under Caligula's madness.", "Complete elimination of potential threats, including the entire Imperial family, is necessary to secure the conspirators' future and ensure the success of their coup."],
        ap.goals = ["short-term\": \"To successfully convince Marcus to overcome his hesitation and fully commit to the assassination plan, solidifying their united front.", "medium-term\": \"To participate in the assassination of Caligula and, ideally, the entire Imperial family, to eliminate all immediate threats.", "ultimate\": \"To establish a new, stable order in Rome, ensuring the long-term safety and security of the conspirators and preventing future tyranny, even if it requires ruthless measures."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_9_1'})
    ON CREATE SET
        oi.description = 'The dice serve as central instruments of Caligula\'s frustration, highlighting his struggles with luck and control. As he throws them repeatedly, their outcome dictates the flow of the scene and reflects his emotional state. Claudius offers a set of dice that purportedly belonged to Alexander, attempting to shift the luck, which adds layers to the themes of fortune and power dynamics within the court.',
        oi.status_before = 'The dice belong to Caligula, previously used in a game of chance, symbolizing both his authority and the randomness of fate.',
        oi.status_after = 'The dice remain in Caligula\'s possession but are now imbued with the tension of his losses, their role in the scene signaling the unpredictability of his reign.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_9_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_9_2'})
    ON CREATE SET
        oi.description = 'Initially, the dice are instruments of chance in a gambling game between Caligula and Marcus, representing the unpredictable nature of fortune and Caligula\'s volatile luck.  When Caligula loses, the dice become a scapegoat for his frustration, blamed as \'unlucky\' by the Emperor. Subsequently, Claudius introduces a new set of dice, claiming a legendary provenance, transforming the object into a symbol of potential good fortune and manipulation. These new dice become a tool for Claudius to flatter and control Caligula, shifting the narrative from loss to the promise of a lucky turn, and raising the stakes of the game both literally and figuratively.',
        oi.status_before = 'The dice, implied to be Marcus\'s set or simply \'in play\', are considered \'unlucky\' by Caligula as he experiences a losing streak in the game. They are functional gambling tools, but in Caligula\'s perception, they are tainted by misfortune.',
        oi.status_after = 'The original dice are effectively discarded or ignored, replaced by Claudius\'s \'lucky\' dice. Claudius\'s dice are now imbued with a narrative of legendary fortune and become the focal point of the dice game, symbolizing a potential shift in Caligula\'s luck and a tool for Claudius\'s manipulation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_9_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_9_3'})
    ON CREATE SET
        oi.description = 'The dice act as a catalyst for Caligula\'s perceived luck, transforming the mood in the Imperial Box. Initially seen as a symbol of loss, they shift to represent hope and opportunity as Caligula suddenly starts winning. Claudius\'s offer to lend his \'lucky\' dice underscores their narrative significance, highlighting the superstitions surrounding luck and fortune in the Emperor\'s psyche.',
        oi.status_before = 'Prior to the event, the dice belonged to Claudius, seen as mere gambling tools lacking any perceived significance or luck.',
        oi.status_after = 'After the event, the dice are now seen as lucky charms for Caligula, symbolizing the Emperor\'s temporary reversal of fortune and reinforcing his delusional belief in the personal power of luck.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_9_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_dice_event_9_4'})
    ON CREATE SET
        oi.description = 'The dice are initially used by Caligula, which he blames for his losing streak, accusing Marcus of providing unlucky dice. Claudius then offers his own set, claiming they once belonged to Alexander the Great, imbuing them with a mythical quality. These \'lucky\' dice become the catalyst for Caligula\'s winning streak, dramatically shifting the scene\'s dynamic. They are not merely tools for gambling but symbols of fate, chance, and the capricious nature of Caligula\'s rule, driving the escalating tension and financial stakes of the scene as Caligula\'s mood and demands change with his perceived luck.',
        oi.status_before = 'Initially, the dice are presented as ordinary gambling objects, presumably belonging to Marcus and being used by Caligula in a losing game, representing mundane tools of chance.',
        oi.status_after = 'After Claudius presents his set, the dice are transformed into objects of perceived luck and historical significance in Caligula\'s mind. They become instrumental in Caligula\'s winning streak and escalating demands, symbolizing the volatile and easily manipulated nature of his perception of fate and power.'
    WITH oi
    MATCH (o:Object {uuid: 'object_dice'})
    MATCH (e:Event {uuid: 'event_9_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Caligula occupies a position of dominance in the Imperial Box, animatedly throwing dice with a flourish that belies his growing frustration. His posture alternates between arrogance and exasperation as he lambasts his luck, conveying an air of petulance that highlights his volatile temperament.',
        ap.emotional_state = 'Caligula\'s surface emotions oscillate between frustration and indignation as he loses repeatedly, his facial expressions contorting into a mask of disbelief and anger. Internally, he grapples with feelings of inadequacy and humiliation, his authority undermined by the triviality of the game. There’s a simmering rage beneath his playful bravado, revealing a deep-seated fear of losing control.',
        ap.emotional_tags = ["caligula's surface emotions oscillate between frustration", "indignation as he loses repeatedly, his facial expressions contorting into a mask of disbelief", "anger. internally, he grapples with feelings of inadequacy", "humiliation, his authority undermined by the triviality of the game. there\u2019s a simmering rage beneath his playful bravado, revealing a deep-seated fear of losing control.", "caligula's surface emotions oscillate between frustration and indignation as he loses repeatedly", "his facial expressions contorting into a mask of disbelief and anger. internally", "he grapples with feelings of inadequacy and humiliation", "his authority undermined by the triviality of the game. there\u2019s a simmering rage beneath his playful bravado", "revealing a deep-seated fear of losing control."],
        ap.active_plans = ["To regain his lost money through further gambling, seeking a return to his former luck.", "To assert dominance over Claudius and the other courtiers by showcasing his power despite his losses.", "To distract himself from the mounting pressures of his rule by indulging in games of chance."],
        ap.beliefs = ["Luck is a defining factor of power, and losing reflects poorly on his authority.", "As Emperor, he deserves to have everything go his way, including fortune.", "His relationships with courtiers should revolve around displays of wealth and dominion."],
        ap.goals = ["Short-term: To win back his losses at the dice game, thus restoring his sense of luck.", "Medium-term: To maintain the fa\u00e7ade of control and superiority in the face of adversity.", "Ultimate: To solidify his power as Emperor by ensuring that all around him acknowledge his whims and authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nearby, embodying a posture of subservience as he watches Caligula\'s antics with feigned concern. His hands are clasped together, and he leans slightly forward, eyes wide with a mixture of anxiety and calculation, ready to interject with offers of support.',
        ap.emotional_state = 'On the surface, Claudius exhibits concern and attentiveness, his brows furrowed as he navigates the Emperor\'s unpredictable moods. Internally, however, he is anxious about the fallout from Caligula’s frustration and fears his own position in the court could be jeopardized. The tension between his desire for self-preservation and his loyalty creates a palpable internal conflict.',
        ap.emotional_tags = ["on the surface, claudius exhibits concern", "attentiveness, his brows furrowed as he navigates the emperor's unpredictable moods. internally, however, he is anxious about the fallout from caligula\u2019s frustration", "fears his own position in the court could be jeopardized. the tension between his desire for self-preservation", "his loyalty creates a palpable internal conflict.", "on the surface", "claudius exhibits concern and attentiveness", "his brows furrowed as he navigates the emperor's unpredictable moods. internally", "however", "he is anxious about the fallout from caligula\u2019s frustration and fears his own position in the court could be jeopardized. the tension between his desire for self-preservation and his loyalty creates a palpable internal conflict."],
        ap.active_plans = ["To placate Caligula by offering assistance, thus ensuring his own safety and favor.", "To subtly backtrack on his previous offers if they lead to unwelcome repercussions.", "To gather information from Caligula's reactions, understanding that his mood today could affect future interactions."],
        ap.beliefs = ["Survival in the court is achieved through servility and strategic support of Caligula.", "Caligula\u2019s volatile nature makes it essential to remain in his good graces.", "The court\u2019s dynamics are precariously balanced, and any miscalculation could lead to ruin."],
        ap.goals = ["Short-term: To manage Caligula's temper and avoid provoking his ire.", "Medium-term: To secure his position within the court while navigating the Emperor's whims.", "Ultimate: To ultimately ensure the stability of his own life amidst the chaotic rule of Caligula."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Caligula sits in his imperial box, brooding over a losing streak in a dice game. He throws the dice with frustrated energy, his imperial robes slightly askew, betraying a petulant displeasure. He slams the dice down, declaring he\'s done playing, only to be drawn back in by Claudius\'s timely intervention and the lure of \'lucky\' dice.',
        ap.emotional_state = 'Initially, Caligula is consumed by frustrated anger and childish petulance at his losing streak. Outwardly, he displays dramatic annoyance, cursing his luck. However, beneath this surface, he is deeply superstitious and vain, readily susceptible to flattery. Claudius\'s offering of \'lucky\' dice and the comparison to Alexander the Great instantly shifts his mood to one of excited anticipation and renewed confidence, fueled by a desperate hope for his fortunes to turn.',
        ap.emotional_tags = ["initially, caligula is consumed by frustrated anger", "childish petulance at his losing streak. outwardly, he displays dramatic annoyance, cursing his luck. however, beneath this surface, he is deeply superstitious", "vain, readily susceptible to flattery. claudius's offering of 'lucky' dice", "the comparison to alexander the great instantly shifts his mood to one of excited anticipation", "renewed confidence, fueled by a desperate hope for his fortunes to turn.", "initially", "caligula is consumed by frustrated anger and childish petulance at his losing streak. outwardly", "he displays dramatic annoyance", "cursing his luck. however", "beneath this surface", "he is deeply superstitious and vain", "readily susceptible to flattery. claudius's offering of 'lucky' dice and the comparison to alexander the great instantly shifts his mood to one of excited anticipation and renewed confidence", "fueled by a desperate hope for his fortunes to turn."],
        ap.active_plans = ["To recoup his gambling losses and prove his superior luck.", "To assert his dominance by blaming Marcus's dice for his misfortune.", "To exploit Claudius's offering to gain an advantage and extract more money."],
        ap.beliefs = ["He believes in luck and superstition, readily accepting the idea of lucky dice.", "He believes in his own inherent superiority and entitlement to good fortune, viewing losses as an affront to his status.", "He believes flattery and gifts are his due, readily accepting Claudius's offering as a form of tribute."],
        ap.goals = ["Short-term: To win the current dice game and reverse his losing streak.", "Medium-term: To reinforce his image as a powerful and fortunate ruler, unbound by the whims of fate.", "Ultimate: To be perceived as god-like and invincible, deserving of constant admiration and tribute."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands slightly hunched, his posture obsequious, observing Caligula\'s gambling frustration with a carefully constructed air of concern. He stammers slightly as he offers to lend money, quickly pivoting to presenting the \'lucky\' dice when he senses Caligula\'s aversion to debt. He gestures with a trembling hand as he recounts the dice\'s legendary history, his eyes fixed on Caligula\'s reaction.',
        ap.emotional_state = 'Claudius is a study in controlled anxiety. Outwardly, he projects deference and eagerness to please, his stammer amplified by nervousness. Internally, he is calculating and strategic, carefully manipulating Caligula\'s vanity and superstition to his own advantage. Beneath the surface of obsequiousness lies a shrewd understanding of Caligula\'s weaknesses and a pragmatic desire to navigate the emperor\'s volatile moods safely. His emotional state is a carefully constructed performance of subservience masking a core of self-preservation.',
        ap.emotional_tags = ["claudius is a study in controlled anxiety. outwardly, he projects deference", "eagerness to please, his stammer amplified by nervousness. internally, he is calculating", "strategic, carefully manipulating caligula's vanity", "superstition to his own advantage. beneath the surface of obsequiousness lies a shrewd understanding of caligula's weaknesses", "a pragmatic desire to navigate the emperor's volatile moods safely. his emotional state is a carefully constructed performance of subservience masking a core of self-preservation.", "claudius is a study in controlled anxiety. outwardly", "he projects deference and eagerness to please", "his stammer amplified by nervousness. internally", "he is calculating and strategic", "carefully manipulating caligula's vanity and superstition to his own advantage. beneath the surface of obsequiousness lies a shrewd understanding of caligula's weaknesses and a pragmatic desire to navigate the emperor's volatile moods safely. his emotional state is a carefully constructed performance of subservience masking a core of self-preservation."],
        ap.active_plans = ["To appease Caligula and deflect any potential anger directed his way.", "To ingratiate himself with Caligula by appearing helpful and generous, offering a solution to his gambling woes.", "To subtly manipulate the situation to his advantage by offering a 'gift' that plays on Caligula's ego and superstitions, shifting the focus away from financial loss and onto the promise of good fortune."],
        ap.beliefs = ["He believes survival in Caligula's court requires constant vigilance and appeasement.", "He believes Caligula is deeply vain and susceptible to flattery and manipulation.", "He believes that appearing harmless and helpful is the best way to avoid becoming a target of Caligula's unpredictable wrath."],
        ap.goals = ["Short-term: To calm Caligula's frustration and ensure the emperor remains favorably disposed towards him in this immediate interaction.", "Medium-term: To solidify his position as a seemingly harmless and even helpful figure in Caligula's eyes, building a buffer against future threats.", "Ultimate: To survive Caligula's reign by consistently navigating the treacherous court with cunning and calculated deference."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Marcus stands slightly apart, having been playing dice with Caligula. He is caught in the crossfire of Caligula\'s bad temper, initially defensive when his dice are blamed, but quickly adopting a more cautious posture. He shifts his weight, glancing between Caligula and Claudius, a soldier caught in a political game he only partially understands. He attempts to redirect the conversation by suggesting food.',
        ap.emotional_state = 'Marcus is experiencing a blend of anxiety and suppressed irritation. Outwardly, he maintains a soldierly composure, though his initial defensiveness about his dice betrays a flicker of annoyance at Caligula\'s irrationality. Beneath the surface, he is tense and wary, acutely aware of Caligula\'s volatile mood and the potential danger of being on the Emperor\'s bad side. He is likely frustrated by the capricious nature of the court and the need to constantly placate a madman, yet fear dictates his outward actions.',
        ap.emotional_tags = ["marcus is experiencing a blend of anxiety", "suppressed irritation. outwardly, he maintains a soldierly composure, though his initial defensiveness about his dice betrays a flicker of annoyance at caligula's irrationality. beneath the surface, he is tense", "wary, acutely aware of caligula's volatile mood", "the potential danger of being on the emperor's bad side. he is likely frustrated by the capricious nature of the court", "the need to constantly placate a madman, yet fear dictates his outward actions.", "marcus is experiencing a blend of anxiety and suppressed irritation. outwardly", "he maintains a soldierly composure", "though his initial defensiveness about his dice betrays a flicker of annoyance at caligula's irrationality. beneath the surface", "he is tense and wary", "acutely aware of caligula's volatile mood and the potential danger of being on the emperor's bad side. he is likely frustrated by the capricious nature of the court and the need to constantly placate a madman", "yet fear dictates his outward actions."],
        ap.active_plans = ["To extricate himself from Caligula's displeasure and avoid becoming the target of his anger.", "To subtly defend his own integrity when his dice are unfairly blamed.", "To de-escalate the tense situation by changing the subject and offering a practical suggestion like food, hoping to shift Caligula's focus."],
        ap.beliefs = ["He believes Caligula is irrational and prone to blaming others for his own misfortunes.", "He believes that direct confrontation with Caligula is dangerous and should be avoided.", "He believes in the importance of maintaining a cautious and adaptable stance in the unpredictable environment of the imperial court."],
        ap.goals = ["Short-term: To diffuse the current tense situation and avoid further provoking Caligula.", "Medium-term: To maintain a position of relative safety within the court, navigating the emperor's moods without becoming a scapegoat.", "Ultimate: To survive Caligula's reign and hope for a return to a more stable and rational order in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Caligula sits at the Imperial Box, a gleam of excitement in his eyes as he throws dice, his posture animated and exuberant. He gestures expressively when declaring his losses, and as he starts winning, he leans forward, radiating a newfound confidence, demanding payment from those around him.',
        ap.emotional_state = 'Outwardly, Caligula displays joy and excitement, with an exuberant laugh that echoes through the hall. Internally, however, there is a tension as he grapples with his need for validation and control in a world where luck seems to turn against him. Beneath the surface, his egocentric worldview drives a desperate need to assert his dominance.',
        ap.emotional_tags = ["outwardly, caligula displays joy", "excitement, with an exuberant laugh that echoes through the hall. internally, however, there is a tension as he grapples with his need for validation", "control in a world where luck seems to turn against him. beneath the surface, his egocentric worldview drives a desperate need to assert his dominance.", "outwardly", "caligula displays joy and excitement", "with an exuberant laugh that echoes through the hall. internally", "however", "there is a tension as he grapples with his need for validation and control in a world where luck seems to turn against him. beneath the surface", "his egocentric worldview drives a desperate need to assert his dominance."],
        ap.active_plans = ["To win back his lost money and assert his power by leveraging Claudius's dice.", "To entertain himself and the crowd with his gambling antics.", "To manipulate his perception of luck and fortune to bolster his ego."],
        ap.beliefs = ["Luck is a personal attribute that can be influenced by one's actions.", "His status as Emperor entitles him to both fortune and the loyalty of those around him.", "Others' misfortunes are opportunities for his own gain."],
        ap.goals = ["Short-term: To win money at the dice game.", "Medium-term: To consolidate his power by showing he can change his luck through manipulation and control.", "Ultimate: To maintain his position as the feared and revered ruler of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Claudius remains standing near Caligula, his posture slightly hunched as he observes the game with a facade of concern. He speaks in a careful, measured tone, offering dice and attempting to manage Caligula\'s mood while exuding an air of subservience.',
        ap.emotional_state = 'Claudius exhibits a blend of feigned concern and underlying apprehension. His outward calm masks a swirling mix of anxiety about Caligula\'s volatility and the precariousness of his own position. Internally, he feels a simmering urge to protect himself while grappling with the absurdity of the situation.',
        ap.emotional_tags = ["claudius exhibits a blend of feigned concern", "underlying apprehension. his outward calm masks a swirling mix of anxiety about caligula's volatility", "the precariousness of his own position. internally, he feels a simmering urge to protect himself while grappling with the absurdity of the situation.", "claudius exhibits a blend of feigned concern and underlying apprehension. his outward calm masks a swirling mix of anxiety about caligula's volatility and the precariousness of his own position. internally", "he feels a simmering urge to protect himself while grappling with the absurdity of the situation.", "claudius exhibits a blend of feigned concern and underlying apprehension. his outward calm masks a swirling mix of anxiety about caligula's volatility and the precariousness of his own position. internally, he feels a simmering urge to protect himself", "grappling with the absurdity of the situation."],
        ap.active_plans = ["To appease Caligula by offering his own dice to redeem himself and improve their relationship.", "To divert Caligula's attention away from his losses to avoid a potential outburst.", "To navigate the delicate balance of remaining useful while not provoking Caligula's anger."],
        ap.beliefs = ["Maintaining Caligula's favor is crucial for his own survival.", "Obsequiousness can provide a layer of protection against the Emperor's whims.", "The nature of power in Rome is one of fleeting alliances and constant vigilance."],
        ap.goals = ["Short-term: To lend Caligula his dice and regain favor.", "Medium-term: To maintain a position of relevance within the court while avoiding unnecessary risks.", "Ultimate: To survive the tumultuous political landscape and secure his own power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Marcus stands nearby, his arms crossed with a relaxed yet alert posture. He interjects with a suggestion for food, trying to lighten the atmosphere while observing the dynamics of the game. His expression is composed, though his eyes reflect a keen awareness of the shifting tides of power.',
        ap.emotional_state = 'Marcus projects a calm demeanor, attempting to inject levity into the situation. However, internally, he grapples with the anxiety of being caught in Caligula\'s unpredictable moods. His attempt to suggest food underscores an unspoken desire for normalcy amid chaotic circumstances.',
        ap.emotional_tags = ["marcus projects a calm demeanor", "attempting to inject levity into the situation. however", "internally", "he grapples with the anxiety of being caught in caligula's unpredictable moods. his attempt to suggest food underscores an unspoken desire for normalcy amid chaotic circumstances."],
        ap.active_plans = ["To ease the tension in the room by suggesting food, hoping to distract Caligula from his gambling losses.", "To assess the mood of the Emperor and adapt accordingly to maintain his own position.", "To navigate the power dynamics at play and remain in Caligula's good graces."],
        ap.beliefs = ["A light-hearted approach can diffuse tension in volatile situations.", "Understanding the whims of power can help in preserving one's own status.", "Self-preservation is paramount in a court where loyalty is fleeting."],
        ap.goals = ["Short-term: To contribute to a lighter atmosphere by offering food.", "Medium-term: To maintain a steady footing in the volatile environment of the court.", "Ultimate: To protect his own interests while navigating the dangerous political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Caligula is actively throwing dice, initially with mounting frustration as he loses. He gestures dramatically, slamming the dice down and lamenting his bad luck. As Claudius offers new dice, his demeanor shifts; he becomes more animated and focused, convinced of a change in fortune. He leans forward intently as he throws, basking in his newfound winning streak and issuing demands for payment with increasing imperiousness.',
        ap.emotional_state = 'Outwardly, Caligula displays a volatile mix of petulance and manic elation. Initially, he\'s visibly annoyed and blames external factors for his losses, exhibiting a childish frustration.  However, when his luck turns, his mood swings dramatically to overconfident excitement. Beneath this surface, there\'s a deep insecurity driving his need to win and dominate, revealing a fragile ego that swings wildly between self-pity and tyrannical arrogance, seeking constant validation through games of chance and power.',
        ap.emotional_tags = ["outwardly, caligula displays a volatile mix of petulance", "manic elation. initially, he's visibly annoyed", "blames external factors for his losses, exhibiting a childish frustration.  however, when his luck turns, his mood swings dramatically to overconfident excitement. beneath this surface, there's a deep insecurity driving his need to win", "dominate, revealing a fragile ego that swings wildly between self-pity", "tyrannical arrogance, seeking constant validation through games of chance", "power.", "outwardly", "caligula displays a volatile mix of petulance and manic elation. initially", "he's visibly annoyed and blames external factors for his losses", "exhibiting a childish frustration.  however", "when his luck turns", "his mood swings dramatically to overconfident excitement. beneath this surface", "there's a deep insecurity driving his need to win and dominate", "revealing a fragile ego that swings wildly between self-pity and tyrannical arrogance", "seeking constant validation through games of chance and power."],
        ap.active_plans = ["To win back his lost money and demonstrate his superior luck.", "To assert his dominance over Marcus by accusing him of bringing bad luck.", "To exploit Claudius's subservience and extract financial resources by leveraging his new wife's wealth."],
        ap.beliefs = ["As Emperor, he is entitled to good fortune and success in all endeavors, including games of chance.", "Any misfortune is a personal affront and must be the fault of others, not himself.", "His imperial authority grants him the right to demand and take whatever he desires from his subjects, regardless of fairness or reason."],
        ap.goals = ["short-term: To win the current dice game and recoup his gambling losses immediately.", "medium-term: To reinforce his image as powerful and fortunate, maintaining control and dominance within his court through displays of capricious power.", "ultimate: To solidify his absolute authority as a god-like ruler, ensuring complete obedience and extracting maximum resources and admiration from everyone around him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands slightly behind Caligula, observing the dice game with a posture of forced attentiveness and feigned concern. He gestures deferentially when offering to lend money and then presents the \'lucky\' dice with a stammering, obsequious manner. As Caligula\'s demands escalate and focus shifts to Claudius\'s finances, he becomes more physically withdrawn, his movements constrained and hesitant, reflecting his growing unease.',
        ap.emotional_state = 'On the surface, Claudius projects an image of polite compliance and eagerness to please, carefully masking his underlying anxiety. Internally, he is deeply apprehensive, navigating the precarious situation with calculated subservience. He is acutely aware of Caligula\'s volatile nature and the potential danger of his demands. Beneath his outward obsequiousness lies a strategic pragmatism; he is calculating how to appease Caligula while minimizing his own personal risk and financial exposure, a constant tightrope walk between survival and ruin.',
        ap.emotional_tags = ["on the surface, claudius projects an image of polite compliance", "eagerness to please, carefully masking his underlying anxiety. internally, he is deeply apprehensive, navigating the precarious situation with calculated subservience. he is acutely aware of caligula's volatile nature", "the potential danger of his demands. beneath his outward obsequiousness lies a strategic pragmatism; he is calculating how to appease caligula while minimizing his own personal risk", "financial exposure, a constant tightrope walk between survival", "ruin.", "on the surface", "claudius projects an image of polite compliance and eagerness to please", "carefully masking his underlying anxiety. internally", "he is deeply apprehensive", "navigating the precarious situation with calculated subservience. he is acutely aware of caligula's volatile nature and the potential danger of his demands. beneath his outward obsequiousness lies a strategic pragmatism; he is calculating how to appease caligula while minimizing his own personal risk and financial exposure", "a constant tightrope walk between survival and ruin.", "on the surface, claudius projects an image of polite compliance and eagerness to please, carefully masking his underlying anxiety. internally, he is deeply apprehensive, navigating the precarious situation with calculated subservience. he is acutely aware of caligula's volatile nature and the potential danger of his demands. beneath his outward obsequiousness lies a strategic pragmatism", "he is calculating how to appease caligula while minimizing his own personal risk and financial exposure, a constant tightrope walk between survival and ruin.", "on the surface, claudius projects an image of polite compliance and eagerness to please, carefully masking his underlying anxiety. internally, he is deeply apprehensive, navigating the precarious situation with calculated subservience. he is acutely aware of caligula's volatile nature and the potential danger of his demands. beneath his outward obsequiousness lies a strategic pragmatism; he is calculating how to appease caligula", "minimizing his own personal risk and financial exposure, a constant tightrope walk between survival and ruin."],
        ap.active_plans = ["To placate Caligula and avoid becoming the target of his unpredictable rage.", "To offer small tokens of goodwill, like lending money and dice, to create a semblance of favor.", "To subtly manage the situation to protect his own resources and limit the extent of Caligula's financial demands on him."],
        ap.beliefs = ["Survival under Caligula's tyranny depends on absolute obedience and skillful appeasement.", "Any form of resistance or disagreement, no matter how slight, can have dire consequences.", "His personal safety and well-being are directly tied to his ability to remain inconspicuous and useful to those in power, however mad they may be."],
        ap.goals = ["short-term: To survive this dice game encounter without provoking Caligula's anger or suffering significant financial loss.", "medium-term: To maintain a low profile and continue to be perceived as harmless and compliant, thus ensuring his continued survival in the dangerous court.", "ultimate: To outlast Caligula's reign and potentially find a path to a more stable and less perilous future, though this goal remains largely unspoken and uncertain given his immediate vulnerability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Marcus initially participates in the dice game, engaging directly with Caligula and losing. He gestures with the dice, perhaps with a forced casualness, but his demeanor shifts to defensiveness when Caligula accuses him of using unlucky dice. He attempts to deflect the tension by suggesting food, a subtle effort to change the subject and diffuse the increasingly charged atmosphere in the Imperial Box.',
        ap.emotional_state = 'Marcus begins the scene with a degree of professional composure, participating in the game as part of his courtly duties. However, as Caligula\'s mood darkens and he becomes accusatory, Marcus\'s outward demeanor becomes more strained and wary. Internally, he experiences growing unease and anxiety as he witnesses Caligula\'s volatile shift. He is caught in a precarious position, needing to balance loyalty with self-preservation, and the sudden accusation throws him off balance, revealing his underlying fear of Caligula\'s unpredictable tyranny.',
        ap.emotional_tags = ["marcus begins the scene with a degree of professional composure, participating in the game as part of his courtly duties. however, as caligula's mood darkens", "he becomes accusatory, marcus's outward demeanor becomes more strained", "wary. internally, he experiences growing unease", "anxiety as he witnesses caligula's volatile shift. he is caught in a precarious position, needing to balance loyalty with self-preservation,", "the sudden accusation throws him off balance, revealing his underlying fear of caligula's unpredictable tyranny.", "marcus begins the scene with a degree of professional composure", "participating in the game as part of his courtly duties. however", "as caligula's mood darkens and he becomes accusatory", "marcus's outward demeanor becomes more strained and wary. internally", "he experiences growing unease and anxiety as he witnesses caligula's volatile shift. he is caught in a precarious position", "needing to balance loyalty with self-preservation", "and the sudden accusation throws him off balance", "revealing his underlying fear of caligula's unpredictable tyranny."],
        ap.active_plans = ["To initially engage in the dice game as a means of courtly interaction and perhaps currying favor.", "To defend himself against Caligula's baseless accusation regarding the dice, maintaining a semblance of dignity.", "To attempt to de-escalate the rising tension and redirect Caligula's focus away from the dice game and potential blame by suggesting a diversion like eating."],
        ap.beliefs = ["Maintaining a degree of cordiality with Caligula is essential, even in seemingly trivial activities like dice games, for navigating the court.", "Unjust accusations, even from the Emperor, should be challenged subtly to avoid complete subjugation and loss of face.", "Diversionary tactics can be effective in managing Caligula's erratic moods and preventing situations from escalating into dangerous territory."],
        ap.goals = ["short-term: To navigate this dice game encounter without becoming a direct target of Caligula's wrath or suffering immediate negative consequences.", "medium-term: To maintain a professional distance from Caligula's escalating madness while still operating within the court, preserving his position and influence.", "ultimate: To survive Caligula's unpredictable reign and hope for a return to a more stable political climate, where loyalty and reason are valued over capricious tyranny."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sword_event_10_1'})
    ON CREATE SET
        oi.description = 'The sword serves as both a physical weapon and a symbol of rebellion for Cassius. As he checks it, the action signifies his readiness to engage in the imminent violence required to assassinate Caligula. The sword is a crucial element in their conspiracy, embodying the resolve to fight against tyranny and the bloodshed that will ensue.',
        oi.status_before = 'Prior to the event, the sword is likely sheathed and secured, a mere tool of war awaiting its moment of use. It represents both the potential for violence and the weight of the choices that have led Cassius and Sabinus to this point.',
        oi.status_after = 'Following the event, the sword may either remain drawn in anticipation of action or be stained with the blood of betrayal, marking a pivotal shift in its narrative significance as it becomes an instrument of change in the power dynamics of Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sword'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Cassius stands resolute, checking his sword with a firm grip, his posture exuding confidence and determination. He positions himself strategically, ensuring that guards are in place to secure their location, embodying a leader preparing for an imminent confrontation. His movements are deliberate, and his gaze is focused, signaling his readiness for the impending clash.',
        ap.emotional_state = 'Cassius presents an outward calm, his voice steady as he speaks. However, beneath this composed facade lies a tumult of anticipation and resolve; he understands the gravity of their plot against Caligula. The weight of rebellion presses on him, mingling excitement with a sense of dread about the violence ahead. He is determined yet aware of the risks that accompany their actions.',
        ap.emotional_tags = ["cassius presents an outward calm, his voice steady as he speaks. however, beneath this composed facade lies a tumult of anticipation", "resolve; he understands the gravity of their plot against caligula. the weight of rebellion presses on him, mingling excitement with a sense of dread about the violence ahead. he is determined yet aware of the risks that accompany their actions.", "cassius presents an outward calm", "his voice steady as he speaks. however", "beneath this composed facade lies a tumult of anticipation and resolve; he understands the gravity of their plot against caligula. the weight of rebellion presses on him", "mingling excitement with a sense of dread about the violence ahead. he is determined yet aware of the risks that accompany their actions.", "cassius presents an outward calm, his voice steady as he speaks. however, beneath this composed facade lies a tumult of anticipation and resolve", "he understands the gravity of their plot against caligula. the weight of rebellion presses on him, mingling excitement with a sense of dread about the violence ahead. he is determined yet aware of the risks that accompany their actions."],
        ap.active_plans = ["To execute the assassination of Caligula with strategic precision.", "To ensure that no interruptions occur by assigning guards at both ends of the corridor.", "To take the lead in the conspiracy, showcasing bravery and resolve to inspire confidence in Sabinus."],
        ap.beliefs = ["Sovereignty should belong to those who demonstrate strength and resolve, not to a mad tyrant.", "Loyalty has a breaking point, especially under oppressive rule.", "Rebellion is justified if it leads to liberation from tyranny."],
        ap.goals = ["Short-term: Secure the area for the assassination plot and prepare for immediate action.", "Medium-term: Successfully eliminate Caligula without casualties among conspirators.", "Ultimate: Restore order to Rome and overthrow the tyranny of Caligula."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Sabinus shifts nervously, his hands fidgeting as he observes Cassius prepare for action. He stands close, his body language betraying his anxiousness and uncertainty about the impending confrontation. His posture is tense, reflecting both anticipation and the weight of the conspiracy they are about to undertake.',
        ap.emotional_state = 'On the surface, Sabinus expresses apprehension about their timing, his voice wavering slightly as he speaks. Internally, he is torn between fear and a desperate yearning for retribution against Caligula. He grapples with the moral implications of their actions, feeling the heavy burden of responsibility for what may unfold.',
        ap.emotional_tags = ["on the surface, sabinus expresses apprehension about their timing, his voice wavering slightly as he speaks. internally, he is torn between fear", "a desperate yearning for retribution against caligula. he grapples with the moral implications of their actions, feeling the heavy burden of responsibility for what may unfold.", "on the surface", "sabinus expresses apprehension about their timing", "his voice wavering slightly as he speaks. internally", "he is torn between fear and a desperate yearning for retribution against caligula. he grapples with the moral implications of their actions", "feeling the heavy burden of responsibility for what may unfold."],
        ap.active_plans = ["To assist Cassius in the assassination plot against Caligula.", "To monitor the surroundings for any potential threats or disruptions.", "To bolster his own resolve and commitment to the conspiracy despite his fears."],
        ap.beliefs = ["Justice must be served for the wrongs inflicted upon the people of Rome.", "Revenge against a tyrant is a noble cause, even at great personal risk.", "Partnership in rebellion is vital for overcoming the fear of retribution."],
        ap.goals = ["Short-term: Support Cassius in executing the assassination plan.", "Medium-term: Ensure the safety of the conspirators during the operation.", "Ultimate: Achieve retribution against Caligula for the suffering of the Roman people."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Caligula, having declared himself victorious in their unspoken game, leans back, observing Claudius and Marcus with a sharp, assessing gaze. He is no longer actively engaged in the game but is now in a mode of detached observation, his body language radiating an unsettling stillness as he watches for reactions to his abrupt shift in mood and topic.',
        ap.emotional_state = 'Beneath the surface of his proclaimed victory, Caligula is experiencing a subtle shift from triumph to unease. While outwardly composed and even jovial, there\'s an undercurrent of suspicion and paranoia creeping into his demeanor. He appears to be testing the waters, probing for any sign of dissent or hidden agendas amongst his companions, his laughter carrying a brittle edge as he tries to maintain control of the shifting dynamics.',
        ap.emotional_tags = ["beneath the surface of his proclaimed victory, caligula is experiencing a subtle shift from triumph to unease. while outwardly composed", "even jovial, there's an undercurrent of suspicion", "paranoia creeping into his demeanor. he appears to be testing the waters, probing for any sign of dissent or hidden agendas amongst his companions, his laughter carrying a brittle edge as he tries to maintain control of the shifting dynamics.", "beneath the surface of his proclaimed victory", "caligula is experiencing a subtle shift from triumph to unease. while outwardly composed and even jovial", "there's an undercurrent of suspicion and paranoia creeping into his demeanor. he appears to be testing the waters", "probing for any sign of dissent or hidden agendas amongst his companions", "his laughter carrying a brittle edge as he tries to maintain control of the shifting dynamics."],
        ap.active_plans = ["To abruptly end the game to assert his dominance and control over the situation.", "To observe the reactions of Claudius and Marcus to gauge their true feelings and intentions.", "To subtly probe Marcus's unusual behavior and nervousness, suspecting hidden motives."],
        ap.beliefs = ["He believes his whims should dictate the mood and direction of any interaction.", "He believes everyone around him is potentially plotting against him or hiding something.", "He believes displays of nervousness or unusual behavior are signs of disloyalty or deceit."],
        ap.goals = ["To maintain absolute control over his surroundings and the people within them (short-term).", "To uncover any hidden threats or conspiracies against him, ensuring his safety and power (medium-term).", "To solidify his image as an unpredictable and all-powerful emperor who cannot be questioned (ultimate)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Claudius physically shrinks in Caligula\'s presence, his stammer becoming more pronounced as he attempts to navigate the emperor\'s unpredictable mood swings. He gestures weakly, his movements hesitant, as he tries to reassure Caligula of his loyalty and to downplay any perceived slight or change in atmosphere. He is careful to maintain a posture of subservience and harmlessness.',
        ap.emotional_state = 'Claudius is gripped by anxiety and fear, acutely aware of the precariousness of his position. Outwardly, he attempts to project obsequious flattery and agreement, masking his internal turmoil. He is walking a tightrope, desperately trying to anticipate Caligula\'s desires and avoid provoking his wrath. Beneath the surface of his forced smile and stammered words lies a deep-seated dread of misstepping and incurring the emperor\'s displeasure.',
        ap.emotional_tags = ["claudius is gripped by anxiety", "fear, acutely aware of the precariousness of his position. outwardly, he attempts to project obsequious flattery", "agreement, masking his internal turmoil. he is walking a tightrope, desperately trying to anticipate caligula's desires", "avoid provoking his wrath. beneath the surface of his forced smile", "stammered words lies a deep-seated dread of misstepping", "incurring the emperor's displeasure.", "claudius is gripped by anxiety and fear", "acutely aware of the precariousness of his position. outwardly", "he attempts to project obsequious flattery and agreement", "masking his internal turmoil. he is walking a tightrope", "desperately trying to anticipate caligula's desires and avoid provoking his wrath. beneath the surface of his forced smile and stammered words lies a deep-seated dread of misstepping and incurring the emperor's displeasure."],
        ap.active_plans = ["To placate Caligula and reassure him of his unwavering loyalty and admiration.", "To deflect attention from himself and his own potential discomfort in the situation.", "To carefully observe Caligula's mood shifts and adapt his responses accordingly to ensure his own safety."],
        ap.beliefs = ["Survival in Caligula's court depends on absolute submission and flattery.", "Any perceived deviation from expected behavior will be interpreted as treachery by Caligula.", "His stammer and perceived clumsiness can be used as a shield, making him seem less threatening and more pathetic in Caligula's eyes."],
        ap.goals = ["To avoid becoming the target of Caligula's unpredictable anger or suspicion in this immediate encounter (short-term).", "To maintain his precarious position within the court by remaining inconspicuous and useful to Caligula (medium-term).", "To ultimately survive Caligula's reign and see Rome restored to some semblance of order and sanity (ultimate)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Marcus initially attempts to steer the conversation towards lighter topics, suggesting food and swimming, but quickly becomes visibly nervous as Caligula\'s mood shifts. He makes a hasty and somewhat unconvincing excuse about needing to leave, his movements becoming abrupt and his gaze darting around as if seeking an escape route from the intensifying tension.',
        ap.emotional_state = 'Marcus is experiencing rising anxiety and discomfort as he senses Caligula\'s growing suspicion and the darkening mood. He is outwardly attempting to maintain a facade of normalcy by suggesting alternative activities, but internally, he is overwhelmed by a pressing need to remove himself from the situation. His nervousness betrays a deeper unease, possibly linked to his involvement in the conspiracy against Caligula, making him desperate to avoid scrutiny.',
        ap.emotional_tags = ["marcus is experiencing rising anxiety", "discomfort as he senses caligula's growing suspicion", "the darkening mood. he is outwardly attempting to maintain a facade of normalcy by suggesting alternative activities, but internally, he is overwhelmed by a pressing need to remove himself from the situation. his nervousness betrays a deeper unease, possibly linked to his involvement in the conspiracy against caligula, making him desperate to avoid scrutiny.", "marcus is experiencing rising anxiety and discomfort as he senses caligula's growing suspicion and the darkening mood. he is outwardly attempting to maintain a facade of normalcy by suggesting alternative activities", "but internally", "he is overwhelmed by a pressing need to remove himself from the situation. his nervousness betrays a deeper unease", "possibly linked to his involvement in the conspiracy against caligula", "making him desperate to avoid scrutiny.", "marcus is experiencing rising anxiety and discomfort as he senses caligula's growing suspicion and the darkening mood. he is outwardly attempting to maintain a facade of normalcy by suggesting alternative activities,", "internally, he is overwhelmed by a pressing need to remove himself from the situation. his nervousness betrays a deeper unease, possibly linked to his involvement in the conspiracy against caligula, making him desperate to avoid scrutiny."],
        ap.active_plans = ["To initially diffuse the tension by suggesting a change of activity, shifting away from the game.", "To create a believable excuse to leave the Imperial Box and escape Caligula's increasingly unsettling presence.", "To subtly disengage from the conversation and minimize his interaction with Caligula to avoid arousing further suspicion."],
        ap.beliefs = ["Caligula's unpredictable mood swings are dangerous and should be avoided if possible.", "His own nervousness is likely visible to Caligula and could be interpreted negatively.", "Leaving the scene is the best immediate course of action to protect himself and his plans."],
        ap.goals = ["To remove himself from the immediate discomfort and potential danger of Caligula's presence (short-term).", "To avoid arousing Caligula's suspicion about his true intentions and activities (medium-term).", "To successfully participate in the conspiracy against Caligula and contribute to his downfall (ultimate)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Marcus stands slightly apart from Caligula and Claudius, fidgeting with anxiety, his posture betraying his discomfort. His movements are cautious, glancing between the two as he attempts to steer the conversation away from the tense atmosphere. His facial expressions flicker between politeness and unease.',
        ap.emotional_state = 'On the surface, Marcus feigns casualness, using humor to mask his growing concern over Caligula\'s erratic behavior. Internally, he grapples with anxiety, feeling the weight of impending danger. The contrast between his outward nonchalance and inner turmoil reveals a growing sense of fear regarding the Emperor\'s mental state and his own precarious position.',
        ap.emotional_tags = ["on the surface, marcus feigns casualness, using humor to mask his growing concern over caligula's erratic behavior. internally, he grapples with anxiety, feeling the weight of impending danger. the contrast between his outward nonchalance", "inner turmoil reveals a growing sense of fear regarding the emperor's mental state", "his own precarious position.", "on the surface", "marcus feigns casualness", "using humor to mask his growing concern over caligula's erratic behavior. internally", "he grapples with anxiety", "feeling the weight of impending danger. the contrast between his outward nonchalance and inner turmoil reveals a growing sense of fear regarding the emperor's mental state and his own precarious position."],
        ap.active_plans = ["To diffuse the tense atmosphere by suggesting an alternative activity, namely a swim and a meal.", "To gauge Caligula's mood, looking for signs of volatility that could endanger him.", "To position himself favorably in Caligula\u2019s eyes by appearing agreeable and unaffected by the Emperor\u2019s whims."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, but survival is equally important.", "The only way to navigate the chaos of Caligula's court is through humor and agility.", "Caligula's erratic behavior is a sign of deeper instability that could threaten everyone."],
        ap.goals = ["Short-term: To maintain a sense of normalcy and humor in the conversation to deflect tension.", "Medium-term: To effectively monitor Caligula's state of mind and adapt his behavior accordingly.", "Ultimate: To survive the treacherous political landscape and secure his position in the court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Caligula leans back slightly, his flushed face reflecting a mixture of triumph and disdain. He dominates the space, exuding both authority and unpredictability. His gestures are grand and dismissive, especially when he waves away Marcus\'s suggestion of a swim, showcasing his whimsical nature.',
        ap.emotional_state = 'Caligula is outwardly jovial, enjoying the power his victory grants him, but beneath this façade lies a simmering paranoia. His remarks, tinged with sarcasm, indicate an underlying insecurity. The shifting tone in his interactions reveals an unsettling need to dominate while grappling with feelings of unease about those around him.',
        ap.emotional_tags = ["caligula is outwardly jovial", "enjoying the power his victory grants him", "but beneath this fa\u00e7ade lies a simmering paranoia. his remarks", "tinged with sarcasm", "indicate an underlying insecurity. the shifting tone in his interactions reveals an unsettling need to dominate while grappling with feelings of unease about those around him.", "caligula is outwardly jovial, enjoying the power his victory grants him, but beneath this fa\u00e7ade lies a simmering paranoia. his remarks, tinged with sarcasm, indicate an underlying insecurity. the shifting tone in his interactions reveals an unsettling need to dominate", "grappling with feelings of unease about those around him.", "caligula is outwardly jovial, enjoying the power his victory grants him,", "beneath this fa\u00e7ade lies a simmering paranoia. his remarks, tinged with sarcasm, indicate an underlying insecurity. the shifting tone in his interactions reveals an unsettling need to dominate while grappling with feelings of unease about those around him."],
        ap.active_plans = ["To assert his power and control over both Marcus and Claudius by dismissing their suggestions.", "To gauge the reactions of his family and courtiers, testing their loyalty through manipulation.", "To maintain an appearance of benevolence while subtly threatening those around him."],
        ap.beliefs = ["His authority is absolute and must be maintained at all costs.", "The whims of the Emperor are beyond reproach; dissent is an act of treason.", "Any sign of weakness or nervousness in his courtiers is a direct challenge to his power."],
        ap.goals = ["Short-term: To provoke reactions from Claudius and Marcus, reinforcing his dominance.", "Medium-term: To keep the atmosphere light while simultaneously sowing discord among his court.", "Ultimate: To consolidate his power and eliminate any threats to his reign, perceived or real."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Claudius sits in a defensive posture, his stammer punctuating his words as he engages with Caligula. His hands are clasped tightly in his lap, and his eyes dart between Marcus and Caligula, indicating his unease and desire to tread carefully in this perilous situation.',
        ap.emotional_state = 'Claudius\'s exterior betrays a facade of congeniality, masking a torrent of inner conflict. He expresses a desire to please Caligula while his heart races with apprehension, fully aware of the capricious nature of the Emperor. There\'s an inherent tension between his need for survival and the moral compromises he must navigate.',
        ap.emotional_tags = ["claudius's exterior betrays a facade of congeniality, masking a torrent of inner conflict. he expresses a desire to please caligula while his heart races with apprehension, fully aware of the capricious nature of the emperor. there's an inherent tension between his need for survival", "the moral compromises he must navigate.", "claudius's exterior betrays a facade of congeniality", "masking a torrent of inner conflict. he expresses a desire to please caligula while his heart races with apprehension", "fully aware of the capricious nature of the emperor. there's an inherent tension between his need for survival and the moral compromises he must navigate.", "claudius's exterior betrays a facade of congeniality, masking a torrent of inner conflict. he expresses a desire to please caligula", "his heart races with apprehension, fully aware of the capricious nature of the emperor. there's an inherent tension between his need for survival and the moral compromises he must navigate."],
        ap.active_plans = ["To placate Caligula while subtly reinforcing his value as a source of entertainment.", "To deflect any potential ire from Caligula by downplaying his own happiness and emphasizing the Emperor's.", "To maintain a low profile and avoid provoking Caligula further, while assessing the mood in the box."],
        ap.beliefs = ["Survival in this court requires a delicate balance of flattery and caution.", "Caligula's whims are unpredictable and can change without warning.", "To thrive, one must adapt to the mood of those in power rather than challenge them directly."],
        ap.goals = ["Short-term: To assuage Caligula\u2019s ego by praising his happiness and downplaying his own.", "Medium-term: To navigate the court's treacherous dynamics without drawing suspicion or ire.", "Ultimate: To secure his position in a world where loyalty is tenuous and dangerous."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands before Caligula in the Imperial Box, his body slightly bowed in deference. He stammers through his words, gesticulating weakly with his hands as he attempts to convey his supposed gratitude for Caligula\'s \'kindness\'. He carefully avoids direct eye contact, his posture designed to appear as non-threatening and utterly submissive as possible, a scholar shrinking in the shadow of imperial madness.',
        ap.emotional_state = 'Beneath a veneer of forced gratitude, Claudius is gripped by acute anxiety. His outward stammering and clumsy expressions are amplified by genuine fear, as he perceives Caligula\'s \'favor\' as a thinly veiled threat. Internally, he is calculating, his mind racing to find the right words to deflect danger. He is terrified of making a misstep that could provoke Caligula\'s wrath, masking his sharp intellect with feigned foolishness to survive the emperor\'s capricious mood.',
        ap.emotional_tags = ["beneath a veneer of forced gratitude, claudius is gripped by acute anxiety. his outward stammering", "clumsy expressions are amplified by genuine fear, as he perceives caligula's 'favor' as a thinly veiled threat. internally, he is calculating, his mind racing to find the right words to deflect danger. he is terrified of making a misstep that could provoke caligula's wrath, masking his sharp intellect with feigned foolishness to survive the emperor's capricious mood.", "beneath a veneer of forced gratitude", "claudius is gripped by acute anxiety. his outward stammering and clumsy expressions are amplified by genuine fear", "as he perceives caligula's 'favor' as a thinly veiled threat. internally", "he is calculating", "his mind racing to find the right words to deflect danger. he is terrified of making a misstep that could provoke caligula's wrath", "masking his sharp intellect with feigned foolishness to survive the emperor's capricious mood."],
        ap.active_plans = ["Evade Caligula's dangerous 'favor' by expressing contentment and asking for nothing.", "Flatter Caligula's immense ego to placate him and divert his attention.", "Maintain a facade of harmlessness and intellectual inadequacy to avoid being perceived as a threat."],
        ap.beliefs = ["Survival under Caligula demands constant vigilance and strategic deception.", "Appealing to Caligula's vanity is the most effective way to manipulate his mood.", "Any direct request to Caligula is fraught with peril and must be avoided at all costs."],
        ap.goals = ["Short-term: To escape this immediate interaction with Caligula unscathed and without making any compromising promises.", "Medium-term: To continue navigating Caligula's reign by remaining unnoticed and compliant, thus ensuring his personal safety.", "Ultimate: To outlive Caligula's reign of terror and witness a return to a more stable and less perilous Rome, if such a thing is even possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Caligula reclines in the Imperial Box, radiating an unsettling mix of triumph and boredom. His gaze is fixed on Claudius, sharp and probing, as he offers a \'favor\' with a sinister undercurrent. He observes Marcus\'s abrupt departure with suspicion, his posture shifting from relaxed amusement to watchful unease. He is the apex predator in his gilded cage, surveying his domain and the creatures within it.',
        ap.emotional_state = 'On the surface, Caligula projects an air of capricious amusement and imperial confidence, reveling in his perceived victory and the power he holds over those around him. However, beneath this facade lies a deep-seated paranoia and insecurity. He is suspicious of Marcus\'s sudden exit and tests Claudius\'s sincerity with a veiled threat disguised as a \'favor\'. His emotional state is a volatile cocktail of arrogance, suspicion, and a lurking madness that makes him utterly unpredictable.',
        ap.emotional_tags = ["on the surface, caligula projects an air of capricious amusement", "imperial confidence, reveling in his perceived victory", "the power he holds over those around him. however, beneath this facade lies a deep-seated paranoia", "insecurity. he is suspicious of marcus's sudden exit", "tests claudius's sincerity with a veiled threat disguised as a 'favor'. his emotional state is a volatile cocktail of arrogance, suspicion,", "a lurking madness that makes him utterly unpredictable.", "on the surface", "caligula projects an air of capricious amusement and imperial confidence", "reveling in his perceived victory and the power he holds over those around him. however", "beneath this facade lies a deep-seated paranoia and insecurity. he is suspicious of marcus's sudden exit and tests claudius's sincerity with a veiled threat disguised as a 'favor'. his emotional state is a volatile cocktail of arrogance", "suspicion", "and a lurking madness that makes him utterly unpredictable."],
        ap.active_plans = ["Test the loyalty and sincerity of Claudius and Marcus through veiled threats and seemingly generous offers.", "Maintain an atmosphere of fear and unpredictability to reinforce his absolute authority.", "Indulge his capricious whims and observe the reactions of his court to gauge their true feelings and intentions."],
        ap.beliefs = ["Absolute power demands constant vigilance and suspicion, as everyone is potentially an enemy.", "Fear and intimidation are essential tools for maintaining control and ensuring obedience.", "His own divine status justifies his erratic behavior and demands unquestioning adoration from all."],
        ap.goals = ["Short-term: To derive amusement from the spectacle of the Games and the reactions of his courtiers to his pronouncements and moods.", "Medium-term: To solidify his absolute control over Rome by suppressing any hint of dissent or disloyalty through unpredictable acts of favor and terror.", "Ultimate: To achieve undisputed divine status and be worshipped as a god, ensuring his eternal legacy and transcending mortal limitations, however delusional this ambition may be."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Caligula sits confidently in the Imperial Box, his demeanor radiating the self-satisfaction of a ruler reveling in his own authority. His posture is relaxed, yet there\'s a predatory glimmer in his eyes as he surveys Claudius and Marcus. His gestures are grandiose, punctuating his speech with an air of jovial cruelty, particularly when he reveals the cruel nature of his gift to Claudius. He leans forward, a subtle but significant posture shift that indicates both interest and possessiveness, as he continues to toy with his uncle\'s feelings.',
        ap.emotional_state = 'On the surface, Caligula appears gleeful and triumphant, confident in his power and control over the room. However, beneath this joy lies a sinister enjoyment of manipulation and chaos, hinting at deeper insecurities that drive him to assert dominance through mockery. His laughter and playful teasing mask a growing paranoia, especially as he suddenly becomes suspicious of Marcus’s eagerness to leave, indicating an underlying tension that complicates his supposed merriment.',
        ap.emotional_tags = ["on the surface, caligula appears gleeful", "triumphant, confident in his power", "control over the room. however, beneath this joy lies a sinister enjoyment of manipulation", "chaos, hinting at deeper insecurities that drive him to assert dominance through mockery. his laughter", "playful teasing mask a growing paranoia, especially as he suddenly becomes suspicious of marcus\u2019s eagerness to leave, indicating an underlying tension that complicates his supposed merriment.", "on the surface", "caligula appears gleeful and triumphant", "confident in his power and control over the room. however", "beneath this joy lies a sinister enjoyment of manipulation and chaos", "hinting at deeper insecurities that drive him to assert dominance through mockery. his laughter and playful teasing mask a growing paranoia", "especially as he suddenly becomes suspicious of marcus\u2019s eagerness to leave", "indicating an underlying tension that complicates his supposed merriment."],
        ap.active_plans = ["To maintain control over the atmosphere in the Imperial Box and assert his dominance over Claudius and Marcus.", "To sow discord by revealing the cruel joke behind Claudius's marriage, reinforcing his power through humiliation.", "To keep a watchful eye on Marcus and ensure that any signs of dissent or betrayal are quickly quashed."],
        ap.beliefs = ["Power must be wielded with fear and ridicule to maintain authority.", "Humor at the expense of others reaffirms his superiority and fortifies loyalty through intimidation.", "Even close allies are potential threats, and preemptive suspicion is necessary to secure his reign."],
        ap.goals = ["Short-term: To enjoy the spectacle of the Games and assert his dominance over his uncle and Marcus.", "Medium-term: To solidify his control over the court by keeping Claudius in a state of confusion and Marcus under surveillance.", "Ultimate: To establish himself as an unassailable ruler, feared and adored, while eliminating threats to his reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Marcus stands at the periphery of the Imperial Box, his body slightly angled away from Caligula, indicating a desire to withdraw. He fidgets subtly, a nervous gesture that betrays his unease. His posture is rigid, suggesting a mix of formality and the instinct to escape the oppressive atmosphere. He attempts to maintain composure but his tension is palpable as he prepares to leave, a decision that seems instinctive, driven by the need for a reprieve from the Emperor\'s scrutiny.',
        ap.emotional_state = 'Marcus exhibits a façade of professionalism, but underneath lies a bubbling anxiety. His effort to lighten the mood with a quip about his stomach troubles reveals a deep-seated fear of Caligula\'s unpredictable nature. This surface humor masks an internal conflict as he wrestles with the dread of being perceived as weak, compounded by his growing trepidation about the Emperor\'s increasingly erratic behavior and the fear of being caught in a political game he cannot control.',
        ap.emotional_tags = ["marcus exhibits a fa\u00e7ade of professionalism, but underneath lies a bubbling anxiety. his effort to lighten the mood with a quip about his stomach troubles reveals a deep-seated fear of caligula's unpredictable nature. this surface humor masks an internal conflict as he wrestles with the dread of being perceived as weak, compounded by his growing trepidation about the emperor's increasingly erratic behavior", "the fear of being caught in a political game he cannot control.", "marcus exhibits a fa\u00e7ade of professionalism", "but underneath lies a bubbling anxiety. his effort to lighten the mood with a quip about his stomach troubles reveals a deep-seated fear of caligula's unpredictable nature. this surface humor masks an internal conflict as he wrestles with the dread of being perceived as weak", "compounded by his growing trepidation about the emperor's increasingly erratic behavior and the fear of being caught in a political game he cannot control.", "marcus exhibits a fa\u00e7ade of professionalism,", "underneath lies a bubbling anxiety. his effort to lighten the mood with a quip about his stomach troubles reveals a deep-seated fear of caligula's unpredictable nature. this surface humor masks an internal conflict as he wrestles with the dread of being perceived as weak, compounded by his growing trepidation about the emperor's increasingly erratic behavior and the fear of being caught in a political game he cannot control."],
        ap.active_plans = ["To exit the tense situation in the Imperial Box and regain a sense of control over his environment.", "To buy time and distance himself from Caligula's watchful gaze, potentially to devise a strategy or plan.", "To navigate the treacherous court dynamics without drawing Caligula's ire or suspicion."],
        ap.beliefs = ["Survival in Caligula's court depends on adaptability and quick thinking.", "Maintaining a fa\u00e7ade of loyalty is essential to navigate the perilous waters of imperial politics.", "Every action must be calculated to avoid drawing attention or inciting the Emperor's wrath."],
        ap.goals = ["Short-term: To excuse himself from the oppressive atmosphere of the Imperial Box without raising suspicion.", "Medium-term: To assess the political landscape outside the immediate presence of Caligula and Claudius.", "Ultimate: To find a way to protect himself and his interests amidst the chaos of Caligula's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_4'})
    ON CREATE SET
        ap.current_status = 'Claudius sits before Caligula, his posture a mix of submission and forced confidence. He leans slightly forward, attempting to engage while suppressing his inherent fear. His stammer frequently interrupts his speech, revealing both his discomfort and his struggle to articulate his thoughts clearly, a tangible manifestation of his internal conflict. Claudius’s hands rest on his lap, betraying a slight tremble as he navigates the dangerous terrain of humor and political correctness in front of the Emperor.',
        ap.emotional_state = 'Claudius presents a façade of joviality, trying to appease Caligula with his compliments regarding the cruel joke of his marriage. However, beneath this attempt lies deep-rooted anxiety and a desperate need for approval. His stammer reveals the dissonance between his desire to express gratitude and the overwhelming fear of reprisal for any misstep he might make, showcasing an internal struggle between his intellect and his physical limitations.',
        ap.emotional_tags = ["claudius presents a fa\u00e7ade of joviality, trying to appease caligula with his compliments regarding the cruel joke of his marriage. however, beneath this attempt lies deep-rooted anxiety", "a desperate need for approval. his stammer reveals the dissonance between his desire to express gratitude", "the overwhelming fear of reprisal for any misstep he might make, showcasing an internal struggle between his intellect", "his physical limitations.", "claudius presents a fa\u00e7ade of joviality", "trying to appease caligula with his compliments regarding the cruel joke of his marriage. however", "beneath this attempt lies deep-rooted anxiety and a desperate need for approval. his stammer reveals the dissonance between his desire to express gratitude and the overwhelming fear of reprisal for any misstep he might make", "showcasing an internal struggle between his intellect and his physical limitations."],
        ap.active_plans = ["To placate Caligula and maintain his favor by downplaying the malicious intent behind the marriage.", "To navigate the conversation carefully, avoiding any statements that could provoke Caligula's wrath.", "To seek a measure of safety by asserting his role as a source of amusement for the Emperor."],
        ap.beliefs = ["To survive in this treacherous environment, one must adapt to the whims of power and play the role expected.", "Humor can be a double-edged sword; it can endear or alienate, and must be wielded with care.", "The whims of Caligula are unpredictable, and survival hinges on staying in his good graces."],
        ap.goals = ["Short-term: To mitigate the tension in the conversation and maintain a positive rapport with Caligula.", "Medium-term: To ensure his own safety by carefully navigating the unpredictable moods of the Emperor.", "Ultimate: To find a way to reclaim his dignity and position within the court while avoiding the destructive chaos surrounding him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Marcus, standing within the opulent Imperial Box, makes a sudden, abrupt move to leave, attempting to mask his fluster with a physical exit. He gestures vaguely at his stomach, offering a transparently weak excuse about digestive discomfort, his body language betraying a forced casualness that clashes with the underlying tension of the moment.',
        ap.emotional_state = 'Beneath a veneer of feigned nonchalance, Marcus is a knot of anxiety and fear. Outwardly, he tries to project a sense of mild digestive distress, but his hasty departure and flimsy excuse reveal his inner turmoil. Internally, he is gripped by apprehension, acutely aware of Caligula’s piercing gaze and suspicious nature. The tension between his need to escape and the danger of appearing guilty is palpable, creating a silent battle within him.',
        ap.emotional_tags = ["beneath a veneer of feigned nonchalance, marcus is a knot of anxiety", "fear. outwardly, he tries to project a sense of mild digestive distress, but his hasty departure", "flimsy excuse reveal his inner turmoil. internally, he is gripped by apprehension, acutely aware of caligula\u2019s piercing gaze", "suspicious nature. the tension between his need to escape", "the danger of appearing guilty is palpable, creating a silent battle within him.", "beneath a veneer of feigned nonchalance", "marcus is a knot of anxiety and fear. outwardly", "he tries to project a sense of mild digestive distress", "but his hasty departure and flimsy excuse reveal his inner turmoil. internally", "he is gripped by apprehension", "acutely aware of caligula\u2019s piercing gaze and suspicious nature. the tension between his need to escape and the danger of appearing guilty is palpable", "creating a silent battle within him.", "beneath a veneer of feigned nonchalance, marcus is a knot of anxiety and fear. outwardly, he tries to project a sense of mild digestive distress,", "his hasty departure and flimsy excuse reveal his inner turmoil. internally, he is gripped by apprehension, acutely aware of caligula\u2019s piercing gaze and suspicious nature. the tension between his need to escape and the danger of appearing guilty is palpable, creating a silent battle within him."],
        ap.active_plans = ["To physically remove himself from Caligula's immediate scrutiny.", "To create distance from the increasingly tense atmosphere within the Imperial Box.", "To subtly signal to any fellow conspirators (if present in the wider arena) that something is amiss without overtly raising suspicion."],
        ap.beliefs = ["Caligula's paranoia makes any unusual behavior dangerous.", "Maintaining composure is crucial for survival under Caligula's rule.", "A quick, believable exit is better than prolonged exposure to Caligula's unpredictable moods."],
        ap.goals = ["Short-term: To successfully leave the Imperial Box without arousing further suspicion from Caligula.", "Medium-term: To ensure his nervous behavior is dismissed as a minor, physical ailment and not linked to any disloyalty.", "Ultimate: To contribute to the conspiracy against Caligula, ensuring the Emperor's downfall and Rome's liberation from tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Caligula remains seated, his body language shifting from relaxed victory to rigid alertness as Marcus announces his departure. His gaze sharpens, intently tracking Marcus\'s movements, his head cocked slightly as if listening for unspoken truths. He directs his attention to Claudius, his tone shifting from casual banter to a probing, almost accusatory questioning about Marcus\'s behavior.',
        ap.emotional_state = 'Caligula\'s initial triumphant mood swiftly curdles into suspicion and paranoia. Outwardly, he maintains a facade of detached amusement, but his pointed questions and dismissive tone betray his growing unease. Internally, he is consumed by distrust, his mind racing to find hidden meanings in Marcus\'s sudden exit. The shift from playful cruelty to genuine suspicion reveals the fragile nature of his confidence and the ever-present fear of betrayal that fuels his tyranny.',
        ap.emotional_tags = ["caligula's initial triumphant mood swiftly curdles into suspicion", "paranoia. outwardly, he maintains a facade of detached amusement, but his pointed questions", "dismissive tone betray his growing unease. internally, he is consumed by distrust, his mind racing to find hidden meanings in marcus's sudden exit. the shift from playful cruelty to genuine suspicion reveals the fragile nature of his confidence", "the ever-present fear of betrayal that fuels his tyranny.", "caligula's initial triumphant mood swiftly curdles into suspicion and paranoia. outwardly", "he maintains a facade of detached amusement", "but his pointed questions and dismissive tone betray his growing unease. internally", "he is consumed by distrust", "his mind racing to find hidden meanings in marcus's sudden exit. the shift from playful cruelty to genuine suspicion reveals the fragile nature of his confidence and the ever-present fear of betrayal that fuels his tyranny.", "caligula's initial triumphant mood swiftly curdles into suspicion and paranoia. outwardly, he maintains a facade of detached amusement,", "his pointed questions and dismissive tone betray his growing unease. internally, he is consumed by distrust, his mind racing to find hidden meanings in marcus's sudden exit. the shift from playful cruelty to genuine suspicion reveals the fragile nature of his confidence and the ever-present fear of betrayal that fuels his tyranny."],
        ap.active_plans = ["To assert his dominance by openly questioning Marcus's behavior and implying judgment.", "To probe Claudius for insights or confirmations of his suspicions about Marcus.", "To maintain an air of unpredictable authority, reminding everyone of his power to scrutinize and punish at whim."],
        ap.beliefs = ["Everyone around him is potentially deceitful and plotting against him.", "Any deviation from expected behavior is a sign of disloyalty.", "He possesses superior insight and can perceive hidden motives that others try to conceal."],
        ap.goals = ["Short-term: To understand the reason behind Marcus's 'nervousness' and determine if it poses a threat.", "Medium-term: To reinforce his absolute control over the court by demonstrating his vigilance and suspicion.", "Ultimate: To solidify his divine status and eradicate any potential threats to his rule, ensuring unchallenged power and adoration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_5'})
    ON CREATE SET
        ap.current_status = 'Claudius, seated beside Caligula, adopts a posture of exaggerated subservience, his body slightly hunched and his gaze lowered, avoiding direct eye contact with the Emperor. He stammers and gestures with nervous hands as he responds to Caligula\'s probing questions about Marcus, attempting to deflect suspicion by emphasizing his own perpetual state of nervousness in Caligula\'s presence.',
        ap.emotional_state = 'Claudius is deeply anxious and acutely aware of the precariousness of the situation. Outwardly, he projects his usual persona of a bumbling, harmless fool, exaggerating his stammer and feigning confusion. Internally, he is calculating and strategic, recognizing the danger in Caligula\'s suspicion and working to diffuse it. He feels a surge of fear for Marcus and for the potential exposure of any conspiracy, relying on his well-practiced facade to navigate the treacherous currents of Caligula\'s paranoia.',
        ap.emotional_tags = ["claudius is deeply anxious", "acutely aware of the precariousness of the situation. outwardly, he projects his usual persona of a bumbling, harmless fool, exaggerating his stammer", "feigning confusion. internally, he is calculating", "strategic, recognizing the danger in caligula's suspicion", "working to diffuse it. he feels a surge of fear for marcus", "for the potential exposure of any conspiracy, relying on his well-practiced facade to navigate the treacherous currents of caligula's paranoia.", "claudius is deeply anxious and acutely aware of the precariousness of the situation. outwardly", "he projects his usual persona of a bumbling", "harmless fool", "exaggerating his stammer and feigning confusion. internally", "he is calculating and strategic", "recognizing the danger in caligula's suspicion and working to diffuse it. he feels a surge of fear for marcus and for the potential exposure of any conspiracy", "relying on his well-practiced facade to navigate the treacherous currents of caligula's paranoia."],
        ap.active_plans = ["To immediately deflect Caligula's suspicion away from Marcus by offering a generalized explanation of nervousness.", "To reinforce his established image as a non-threatening, intellectually inferior individual in Caligula's eyes.", "To subtly downplay the significance of Marcus's behavior, framing it as a trivial matter of 'nature calling' rather than anything politically motivated."],
        ap.beliefs = ["Appearing foolish and harmless is his best defense against Caligula's tyranny.", "Caligula's ego is easily manipulated by flattery and displays of subservience.", "Protecting others, even indirectly, is a moral imperative in this corrupt court, even if it means reinforcing his own negative self-perception."],
        ap.goals = ["Short-term: To successfully divert Caligula's attention and reassure him that Marcus's behavior is insignificant.", "Medium-term: To maintain his position of seeming insignificance within the court, allowing him to observe and potentially act without drawing suspicion.", "Ultimate: To see Rome freed from Caligula's madness and to contribute to a more just and stable future, even if from the shadows and without overt recognition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Claudius stands amidst the tension in the Imperial Box, fidgeting slightly as he attempts to maintain a calm demeanor in the presence of Caligula. His stammer is pronounced as he chooses his words carefully, striving to appease the Emperor while averting his gaze from the mounting madness around them.',
        ap.emotional_state = 'Claudius exudes a façade of calmness, yet beneath it lies a deep-seated anxiety. His outward politeness masks a swirling turmoil of fear and frustration, particularly regarding Caligula\'s erratic behavior. The contrast between his restrained demeanor and the internal turmoil reveals a man caught in a perilous game of survival.',
        ap.emotional_tags = ["claudius exudes a fa\u00e7ade of calmness, yet beneath it lies a deep-seated anxiety. his outward politeness masks a swirling turmoil of fear", "frustration, particularly regarding caligula's erratic behavior. the contrast between his restrained demeanor", "the internal turmoil reveals a man caught in a perilous game of survival.", "claudius exudes a fa\u00e7ade of calmness", "yet beneath it lies a deep-seated anxiety. his outward politeness masks a swirling turmoil of fear and frustration", "particularly regarding caligula's erratic behavior. the contrast between his restrained demeanor and the internal turmoil reveals a man caught in a perilous game of survival."],
        ap.active_plans = ["To defuse Caligula's paranoia with careful words and gestures.", "To ensure the safety of Marcus by redirecting the Emperor's attention.", "To subtly assert his own vulnerability to position himself as a loyal subject amidst the chaos."],
        ap.beliefs = ["Power is inherently dangerous and must be navigated with caution.", "Survival often requires sacrificing personal integrity.", "Caligula's madness is a threat that cannot be underestimated."],
        ap.goals = ["Short-term: To keep the conversation light and divert Caligula's focus away from Marcus.", "Medium-term: To maintain his own safety and that of his allies in the court.", "Ultimate: To find a way to dismantle or resist the tyranny of Caligula without drawing attention to his opposition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_6'})
    ON CREATE SET
        ap.current_status = 'Caligula lounges in the Imperial Box, his posture relaxed yet dominant, exuding an unsettling charisma that fills the space. He sweeps his gaze over Claudius and Marcus, a playful smirk dancing on his lips as he toys with their nerves, embodying a reckless sense of authority.',
        ap.emotional_state = 'Caligula\'s surface demeanor is one of playful confidence, but underlying it is a volatile mixture of paranoia and insecurity. His laughter masks a growing fear of betrayal, leading him to scrutinize those around him. This duality creates a tense atmosphere, as he oscillates between amusement and suspicion.',
        ap.emotional_tags = ["caligula's surface demeanor is one of playful confidence, but underlying it is a volatile mixture of paranoia", "insecurity. his laughter masks a growing fear of betrayal, leading him to scrutinize those around him. this duality creates a tense atmosphere, as he oscillates between amusement", "suspicion.", "caligula's surface demeanor is one of playful confidence", "but underlying it is a volatile mixture of paranoia and insecurity. his laughter masks a growing fear of betrayal", "leading him to scrutinize those around him. this duality creates a tense atmosphere", "as he oscillates between amusement and suspicion.", "caligula's surface demeanor is one of playful confidence,", "underlying it is a volatile mixture of paranoia and insecurity. his laughter masks a growing fear of betrayal, leading him to scrutinize those around him. this duality creates a tense atmosphere, as he oscillates between amusement and suspicion."],
        ap.active_plans = ["To assert his dominance over Claudius and Marcus through his unpredictable behavior.", "To distract from his own insecurities by mocking the nervousness of his companions.", "To maintain the illusion of control and merriment in the face of his own internal chaos."],
        ap.beliefs = ["Power is a game to be played with bravado and unpredictability.", "Any perceived weakness in others is an opportunity to instill fear and assert control.", "Laughter and mockery are tools to deflect attention from his own insecurities."],
        ap.goals = ["Short-term: To entertain himself by provoking reactions from Claudius and Marcus.", "Medium-term: To reinforce his position as the uncontested ruler of Rome through fear and chaos.", "Ultimate: To achieve a god-like status in the eyes of the Roman people, solidifying his reign despite the madness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Marcus bursts into the palace corridor, visibly agitated and sweating profusely. He is out of breath, indicating he has run to deliver urgent news. He speaks directly and urgently to Cassius, his movements and demeanor reflecting a state of high alert and stress as he conveys the critical information.',
        ap.emotional_state = 'Marcus is outwardly panicked and stressed, evident in his hurried entrance and urgent tone. Beneath the surface, he is likely gripped by fear and frustration. He fears the disruption to their carefully laid plans and the potential consequences if they cannot proceed. There\'s an internal conflict between his ambition for a successful plot and the immediate obstacle of Caligula\'s unexpected behavior, creating a tense and anxious state.',
        ap.emotional_tags = ["marcus is outwardly panicked", "stressed, evident in his hurried entrance", "urgent tone. beneath the surface, he is likely gripped by fear", "frustration. he fears the disruption to their carefully laid plans", "the potential consequences if they cannot proceed. there's an internal conflict between his ambition for a successful plot", "the immediate obstacle of caligula's unexpected behavior, creating a tense", "anxious state.", "marcus is outwardly panicked and stressed", "evident in his hurried entrance and urgent tone. beneath the surface", "he is likely gripped by fear and frustration. he fears the disruption to their carefully laid plans and the potential consequences if they cannot proceed. there's an internal conflict between his ambition for a successful plot and the immediate obstacle of caligula's unexpected behavior", "creating a tense and anxious state."],
        ap.active_plans = ["Inform Cassius immediately about Caligula's refusal to eat, as this directly impacts their assassination plan.", "Seek an alternative strategy to lure Caligula out of his chambers, since the original plan is now compromised.", "Ensure the assassination plot remains viable and can be executed despite this unforeseen setback, preserving the momentum and secrecy of their conspiracy."],
        ap.beliefs = ["Caligula's unpredictable whims and moods pose a significant threat to their carefully constructed plans.", "The assassination of Caligula is the only way to restore sanity and order to Rome, believing extreme measures are necessary.", "Maintaining secrecy and acting swiftly are paramount to the success of their conspiracy, as any delay could expose them to Caligula's wrath."],
        ap.goals = ["short_term\": \"To find an immediate solution to get Caligula to leave his chambers, thereby salvaging their assassination opportunity.", "medium_term\": \"To successfully assassinate Caligula and remove him from power, believing this will lead to a more stable Rome.", "ultimate\": \"To secure a more favorable position for himself in the post-Caligula power structure, ensuring his own survival and potentially advancement in the new order."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Cassius stands firm, his posture tense and ready for action, sweat glistening on his brow as he bursts into the corridor. His eyes are aflame with anger and determination, his fists clenched at his sides, embodying the fury of a man at the end of his tether. He paces slightly, agitated by the inaction, and his movements are sharp, reflecting an urgency to act against Caligula\'s tyranny.',
        ap.emotional_state = 'Outwardly, Cassius radiates raw fury and desperation, his voice raw as he declares his intention to kill Caligula. Internally, however, there is a maelstrom of conflicting emotions—fear of failure, the weight of loyalty to his comrades, and a deep-seated frustration at the current state of their world. The tension between his burning desire for liberation and the very real danger of execution looms heavy in his heart.',
        ap.emotional_tags = ["outwardly, cassius radiates raw fury", "desperation, his voice raw as he declares his intention to kill caligula. internally, however, there is a maelstrom of conflicting emotions\u2014fear of failure, the weight of loyalty to his comrades,", "a deep-seated frustration at the current state of their world. the tension between his burning desire for liberation", "the very real danger of execution looms heavy in his heart.", "outwardly", "cassius radiates raw fury and desperation", "his voice raw as he declares his intention to kill caligula. internally", "however", "there is a maelstrom of conflicting emotions\u2014fear of failure", "the weight of loyalty to his comrades", "and a deep-seated frustration at the current state of their world. the tension between his burning desire for liberation and the very real danger of execution looms heavy in his heart."],
        ap.active_plans = ["To confront Caligula directly, risking everything to end his reign of terror.", "To rally Marcus for support in the assassination attempt, demonstrating the need for unity among the conspirators.", "To provoke urgency by threatening action, hoping this pressure will spur others to act against Caligula."],
        ap.beliefs = ["He believes that the only way to restore order and freedom in Rome is through decisive action, even if it means murder.", "He holds a conviction that the current tyranny cannot be tolerated any longer and must be dealt with immediately.", "He perceives loyalty to his fellow conspirators as paramount, prioritizing their safety and goals above his own."],
        ap.goals = ["Short-term: To convince Marcus to assist him in luring Caligula out of hiding.", "Medium-term: To execute the assassination plan against Caligula, thereby liberating Rome from tyranny.", "Ultimate: To restore a sense of justice and order in Rome, making it a place where freedom can flourish once more."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Marcus bursts into the palace corridor, visibly out of breath and covered in sweat, indicating he has run to deliver urgent news. He is actively trying to interrupt Cassius\'s immediate violent plan, gesticulating with his hands to emphasize the urgency and gravity of the situation. His body language suggests agitation and a desperate need to communicate quickly and effectively.',
        ap.emotional_state = 'Marcus is primarily anxious and stressed. His surface emotions are clear: worry and urgency. Internally, he is battling fear of failure and the potential repercussions of a botched assassination attempt. He\'s caught between the need to act decisively and the fear of catastrophic consequences if they move too rashly. He is motivated by self-preservation and a desire for a successful outcome, which clashes with Cassius\'s more impulsive approach.',
        ap.emotional_tags = ["marcus is primarily anxious", "stressed. his surface emotions are clear: worry", "urgency. internally, he is battling fear of failure", "the potential repercussions of a botched assassination attempt. he's caught between the need to act decisively", "the fear of catastrophic consequences if they move too rashly. he is motivated by self-preservation", "a desire for a successful outcome, which clashes with cassius's more impulsive approach.", "marcus is primarily anxious and stressed. his surface emotions are clear: worry and urgency. internally", "he is battling fear of failure and the potential repercussions of a botched assassination attempt. he's caught between the need to act decisively and the fear of catastrophic consequences if they move too rashly. he is motivated by self-preservation and a desire for a successful outcome", "which clashes with cassius's more impulsive approach."],
        ap.active_plans = ["Communicate the critical information that Caligula is not eating and their original plan is compromised.", "Dissuade Cassius from his immediate, violent impulse to attack Caligula directly in his chambers.", "Propose an alternative, more strategic approach to lure Caligula out of his guarded chambers by exploiting his vanity and interest in entertainment (Greek ballet)."],
        ap.beliefs = ["Strategic planning and patience are crucial for successful military and political actions, especially in high-stakes situations.", "Impulsive violence without proper planning is likely to lead to failure and increased danger for the conspirators.", "Caligula, despite his madness, is still predictable in his vanity and desires, which can be exploited for strategic advantage."],
        ap.goals = ["Short-term: Prevent Cassius from making a suicidal and strategically unsound attack on Caligula.", "Medium-term: Successfully lure Caligula out into a more vulnerable and controllable location for assassination.", "Ultimate: Ensure the success of the conspiracy to remove Caligula from power while minimizing risk to themselves and maximizing the chances of a stable transition of power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Cassius stands firm and resolute, reacting with immediate aggression to Marcus\'s news. He is physically imposing, likely with a clenched jaw and intense gaze, as he declares his willingness to storm Caligula\'s chambers and kill him directly. His posture and tone convey unwavering determination and a readiness for immediate violent action, showing he is prepared to disregard personal safety for the mission.',
        ap.emotional_state = 'Cassius is consumed by a fiery mix of anger and frustration. His surface emotion is raw, unfiltered rage and impatience, reacting violently to the setback. Internally, he is driven by a deep-seated hatred for Caligula\'s tyranny and a burning desire for immediate liberation. He is willing to sacrifice himself for the cause, indicating a potential conflict between his desire for success and his willingness to engage in what could be a suicide mission. His motivation is primarily driven by righteous fury and a sense of urgency.',
        ap.emotional_tags = ["cassius is consumed by a fiery mix of anger", "frustration. his surface emotion is raw, unfiltered rage", "impatience, reacting violently to the setback. internally, he is driven by a deep-seated hatred for caligula's tyranny", "a burning desire for immediate liberation. he is willing to sacrifice himself for the cause, indicating a potential conflict between his desire for success", "his willingness to engage in what could be a suicide mission. his motivation is primarily driven by righteous fury", "a sense of urgency.", "cassius is consumed by a fiery mix of anger and frustration. his surface emotion is raw", "unfiltered rage and impatience", "reacting violently to the setback. internally", "he is driven by a deep-seated hatred for caligula's tyranny and a burning desire for immediate liberation. he is willing to sacrifice himself for the cause", "indicating a potential conflict between his desire for success and his willingness to engage in what could be a suicide mission. his motivation is primarily driven by righteous fury and a sense of urgency."],
        ap.active_plans = ["Immediately assassinate Caligula, even if it means attacking him directly in his chambers.", "Rely on Marcus for backup and assistance in the potentially violent confrontation that will ensue.", "Consider alternative plans only if directly confronted with compelling reasons, though with visible impatience and reluctance (as seen in his 'Anything. But get him out here!' response)."],
        ap.beliefs = ["Caligula is an irredeemable tyrant who must be eliminated by any means necessary.", "Direct and decisive action is sometimes required, even if it carries significant personal risk.", "The urgency of the situation outweighs the need for overly cautious or complex planning; immediate action is paramount to seize the moment."],
        ap.goals = ["Short-term: Kill Caligula as quickly as possible, even if it means a direct, risky confrontation.", "Medium-term: End Caligula's reign of terror and liberate Rome from his tyranny.", "Ultimate: Restore order and justice to Rome, even at the cost of his own life, believing that his sacrifice will serve the greater good of the Republic and its people."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Marcus stands in the Imperial Box, feigning nonchalance despite the tense atmosphere. His posture is alert yet measured, carefully controlling his movements as he relays information about the Greek ballet. His gestures are subtle, suggesting confidence while masking the underlying urgency of the situation.',
        ap.emotional_state = 'Marcus presents a calm exterior, his voice steady as he informs Caligula of the ballet troupe. Internally, however, he is laced with anxiety, knowing the gravity of the impending assassination plot. The tension between his ambition and the fear of Caligula’s wrath creates an unspoken conflict within him, driving him to navigate this dangerous moment with calculated care.',
        ap.emotional_tags = ["marcus presents a calm exterior, his voice steady as he informs caligula of the ballet troupe. internally, however, he is laced with anxiety, knowing the gravity of the impending assassination plot. the tension between his ambition", "the fear of caligula\u2019s wrath creates an unspoken conflict within him, driving him to navigate this dangerous moment with calculated care.", "marcus presents a calm exterior", "his voice steady as he informs caligula of the ballet troupe. internally", "however", "he is laced with anxiety", "knowing the gravity of the impending assassination plot. the tension between his ambition and the fear of caligula\u2019s wrath creates an unspoken conflict within him", "driving him to navigate this dangerous moment with calculated care."],
        ap.active_plans = ["Lure Caligula out of the Imperial Box using the Greek ballet as a distraction.", "Maintain a facade of confidence to avoid arousing suspicion in Caligula.", "Facilitate the assassination plot by ensuring Caligula is in a vulnerable position."],
        ap.beliefs = ["The survival of Rome necessitates action against tyranny, even if it involves personal risk.", "Ambition must be tempered with caution in the unpredictable court of Caligula.", "Betrayal, although dangerous, may be the only path to reclaiming freedom for the Roman people."],
        ap.goals = ["Short-term: Successfully convince Caligula to leave the Imperial Box to witness the performance.", "Medium-term: Play a key role in the assassination plot against Caligula.", "Ultimate: Restore order in Rome by removing the tyrannical rule of Caligula."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Caligula occupies the center of the Imperial Box, his demeanor grandiose and commanding. He gestures animatedly, his enthusiasm for the Greek ballet evident as he commands Marcus to bring the dancers in. He radiates an air of self-importance, oblivious to the impending danger that surrounds him.',
        ap.emotional_state = 'Caligula exudes a façade of excitement and delight at the prospect of the ballet performance. However, beneath this surface, there lies an undercurrent of paranoia and insecurity. His erratic need for adoration drives him to engage in frivolous distractions, revealing a desperate need to escape the looming threats of assassination that haunt his reign.',
        ap.emotional_tags = ["caligula exudes a fa\u00e7ade of excitement", "delight at the prospect of the ballet performance. however, beneath this surface, there lies an undercurrent of paranoia", "insecurity. his erratic need for adoration drives him to engage in frivolous distractions, revealing a desperate need to escape the looming threats of assassination that haunt his reign.", "caligula exudes a fa\u00e7ade of excitement and delight at the prospect of the ballet performance. however", "beneath this surface", "there lies an undercurrent of paranoia and insecurity. his erratic need for adoration drives him to engage in frivolous distractions", "revealing a desperate need to escape the looming threats of assassination that haunt his reign."],
        ap.active_plans = ["Enjoy the performance of the Greek ballet and bask in the adulation of his court.", "Assert his power by demonstrating his authority over the performers.", "Delude himself into believing that such entertainment can keep dissent at bay."],
        ap.beliefs = ["His imperial status grants him the right to indulgence and entertainment, regardless of the consequences.", "The loyalty of his courtiers is absolute, and the spectacle will reinforce his control.", "Engaging in lavish distractions serves to obscure threats against his rule."],
        ap.goals = ["Short-term: Experience the ballet performance as a source of immediate gratification.", "Medium-term: Maintain the illusion of control and stability within his court.", "Ultimate: Secure his position as the uncontested ruler, despite the chaos around him."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Though not directly present in the Imperial Box, Cassius’s influence looms large over the event. His tactical foresight is evident in Marcus’s report; he has orchestrated the arrival of the ballet as bait. Cassius remains hidden, waiting in the shadows to ensure the plan unfolds as intended.',
        ap.emotional_state = 'Cassius maintains a composed exterior, masking his intense focus and determination. Internally, he is anxious, knowing the stakes of the impending assassination. He grapples with the weight of treachery, driven by a fierce resolve to liberate Rome from tyranny, which fuels a sense of purpose amidst the tension.',
        ap.emotional_tags = ["cassius maintains a composed exterior, masking his intense focus", "determination. internally, he is anxious, knowing the stakes of the impending assassination. he grapples with the weight of treachery, driven by a fierce resolve to liberate rome from tyranny, which fuels a sense of purpose amidst the tension.", "cassius maintains a composed exterior", "masking his intense focus and determination. internally", "he is anxious", "knowing the stakes of the impending assassination. he grapples with the weight of treachery", "driven by a fierce resolve to liberate rome from tyranny", "which fuels a sense of purpose amidst the tension."],
        ap.active_plans = ["Coordinate the assassination attempt against Caligula through strategic distractions.", "Utilize Marcus as an unwitting pawn to facilitate the plan.", "Remain undetected while ensuring that all conspirators are positioned for success."],
        ap.beliefs = ["Freedom from tyranny is worth any risk, even if it involves betrayal.", "Carefully planned actions can yield the liberation of Rome from Caligula's madness.", "Loyalty to a cause can surpass loyalty to an individual, especially in the face of oppression."],
        ap.goals = ["Short-term: Ensure Caligula is lured away for the assassination plot to be executed.", "Medium-term: Engage with fellow conspirators to solidify the rebellion against Caligula.", "Ultimate: Restore the integrity of Roman governance by eliminating the tyrant."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Caligula, initially seated in his Imperial Box enjoying the Games, perks up at Marcus\'s return and announcement of a Greek ballet. He leans forward, intrigued, his boredom momentarily forgotten. He questions the location of the dancers, readily accepting Marcus’s explanation that they are waiting outside to perform a dance in his honor. Caligula then eagerly takes the lead, gesturing for Marcus and others to follow him out to witness this spectacle, a clear eagerness in his movements.',
        ap.emotional_state = 'On the surface, Caligula displays vanity and childish excitement, his boredom replaced by a flicker of anticipation for new entertainment. He\'s clearly susceptible to flattery, readily believing in a performance dedicated to him. Beneath this veneer of imperial amusement, a deep-seated narcissism and craving for adoration are evident. He expects constant tributes and readily falls for the conspirators\' bait, revealing a dangerous combination of arrogance and naiveté.',
        ap.emotional_tags = ["on the surface, caligula displays vanity", "childish excitement, his boredom replaced by a flicker of anticipation for new entertainment. he's clearly susceptible to flattery, readily believing in a performance dedicated to him. beneath this veneer of imperial amusement, a deep-seated narcissism", "craving for adoration are evident. he expects constant tributes", "readily falls for the conspirators' bait, revealing a dangerous combination of arrogance", "naivet\u00e9.", "on the surface", "caligula displays vanity and childish excitement", "his boredom replaced by a flicker of anticipation for new entertainment. he's clearly susceptible to flattery", "readily believing in a performance dedicated to him. beneath this veneer of imperial amusement", "a deep-seated narcissism and craving for adoration are evident. he expects constant tributes and readily falls for the conspirators' bait", "revealing a dangerous combination of arrogance and naivet\u00e9."],
        ap.active_plans = ["To be entertained and alleviate his boredom with the ongoing Games.", "To indulge his vanity and bask in the supposed admiration of the 'Greek ballet' dancers.", "To potentially involve himself in the performance, further inflating his ego and sense of importance."],
        ap.beliefs = ["He is entitled to constant entertainment and lavish displays of respect as the divine Emperor.", "Everyone should be eager to honor him and perform for his amusement.", "His judgment is infallible, and any performance offered to him must be genuinely in his honor and to his benefit."],
        ap.goals = ["short-term\": \"To witness the Greek ballet performance immediately and judge its quality.", "medium-term\": \"To be sufficiently impressed and flattered by the performance, reinforcing his sense of superiority.", "ultimate\": \"To further solidify his image as a god-like figure who commands adoration and whose every whim is catered to, enhancing his tyrannical self-perception."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Marcus re-enters the Imperial Box, striving to project an air of nonchalance to mask his inner turmoil. He addresses Caligula with practiced deference, relaying the fabricated message about the Greek ballet with a casual tone. He carefully observes Caligula’s reaction, gauging the success of their deception. He subtly emphasizes the dancers\' location at the rear, guiding Caligula away from the public front of the box and towards the pre-arranged ambush.',
        ap.emotional_state = 'Outwardly, Marcus maintains a facade of calm obedience and professional detachment, presenting himself as a loyal officer merely delivering information. However, beneath this carefully constructed exterior, he is fraught with tension and anxiety. He carries the heavy weight of deception and the imminent, perilous act of treason. His internal state is a maelstrom of fear and resolve, battling to suppress any tell-tale signs of his true intentions while executing his crucial part in the assassination plot.',
        ap.emotional_tags = ["outwardly, marcus maintains a facade of calm obedience", "professional detachment, presenting himself as a loyal officer merely delivering information. however, beneath this carefully constructed exterior, he is fraught with tension", "anxiety. he carries the heavy weight of deception", "the imminent, perilous act of treason. his internal state is a maelstrom of fear", "resolve, battling to suppress any tell-tale signs of his true intentions while executing his crucial part in the assassination plot.", "outwardly", "marcus maintains a facade of calm obedience and professional detachment", "presenting himself as a loyal officer merely delivering information. however", "beneath this carefully constructed exterior", "he is fraught with tension and anxiety. he carries the heavy weight of deception and the imminent", "perilous act of treason. his internal state is a maelstrom of fear and resolve", "battling to suppress any tell-tale signs of his true intentions while executing his crucial part in the assassination plot.", "outwardly, marcus maintains a facade of calm obedience and professional detachment, presenting himself as a loyal officer merely delivering information. however, beneath this carefully constructed exterior, he is fraught with tension and anxiety. he carries the heavy weight of deception and the imminent, perilous act of treason. his internal state is a maelstrom of fear and resolve, battling to suppress any tell-tale signs of his true intentions", "executing his crucial part in the assassination plot."],
        ap.active_plans = ["To convincingly deceive Caligula into believing the fabricated story of the Greek ballet.", "To lure Caligula away from the safety of the crowded Imperial Box and towards the secluded rear area.", "To ensure Caligula follows him willingly and without suspicion, delivering him into the hands of the waiting conspirators."],
        ap.beliefs = ["Caligula's tyrannical reign is an unbearable evil that must be ended for the sake of Rome's stability and future.", "Deception and manipulation are justifiable means to achieve the greater good of liberating Rome from Caligula's madness.", "Maintaining absolute composure and projecting unwavering loyalty are crucial for the success of the assassination plot and his own survival."],
        ap.goals = ["short-term\": \"To successfully lead Caligula out of the Imperial Box to the rear entrance without raising any alarm.", "medium-term\": \"To ensure Caligula reaches the designated ambush point, allowing the conspirators to execute their plan.", "ultimate\": \"To contribute decisively to the assassination of Caligula, hoping to usher in a new era of order and sanity for Rome, even if it means risking his own life and reputation."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sword_event_14_1'})
    ON CREATE SET
        oi.description = 'The swords drawn by Cassius and Sabinus serve as more than just weapons; they are potent symbols of rebellion against Caligula’s tyranny. In this charged moment, the swords are poised for action, representing the conspirators\' resolve to reclaim liberty for Rome. The gleaming blades reflect the stakes at hand, embodying the violent transition from oppression to freedom.',
        oi.status_before = 'The swords were sheathed, waiting in the shadows of rebellion as the conspirators plotted against Caligula’s oppressive regime.',
        oi.status_after = 'Following the confrontation, the swords remain drawn, ready to execute the rebellion\'s intent, signifying a shift from clandestine plotting to open rebellion and bloodshed.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sword'})
    MATCH (e:Event {uuid: 'event_14_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_sword_event_14_3'})
    ON CREATE SET
        oi.description = 'The sword serves as both a weapon and a symbol of rebellion against Caligula\'s tyranny. Cassius wields it with a firm grip, embodying the will to enact justice and reclaim power. The glint of the blade signifies the transition from oppression to potential liberation, marking a pivotal moment in the conspirators\' struggle.',
        oi.status_before = 'The sword is sheathed, symbolizing the tension of unfulfilled rebellion and the oppressive rule of Caligula.',
        oi.status_after = 'The sword, now drawn, signifies a turning point; it is poised to deliver justice, its readiness reflecting the conspirators\' determination to confront their tyrant.'
    WITH oi
    MATCH (o:Object {uuid: 'object_sword'})
    MATCH (e:Event {uuid: 'event_14_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Cassius stands resolute, sword drawn, his stature unwavering as he faces Caligula in the covered way. His posture is tense yet commanding, embodying the weight of his convictions. The steel glints in the dim light, symbolizing both his readiness for battle and the gravity of the moment.',
        ap.emotional_state = 'Cassius radiates fierce determination, his brow furrowed with focus. While outwardly calm, a tempest of emotions churns beneath the surface; he is resolute yet aware of the enormity of his actions. The adrenaline courses through him as he confronts the Emperor, battling the remnants of loyalty with a growing sense of righteous anger.',
        ap.emotional_tags = ["cassius radiates fierce determination", "his brow furrowed with focus. while outwardly calm", "a tempest of emotions churns beneath the surface; he is resolute yet aware of the enormity of his actions. the adrenaline courses through him as he confronts the emperor", "battling the remnants of loyalty with a growing sense of righteous anger.", "cassius radiates fierce determination, his brow furrowed with focus. while outwardly calm, a tempest of emotions churns beneath the surface", "he is resolute yet aware of the enormity of his actions. the adrenaline courses through him as he confronts the emperor, battling the remnants of loyalty with a growing sense of righteous anger."],
        ap.active_plans = ["To declare 'Liberty!' as the watchword of their rebellion, galvanizing his allies against Caligula's tyranny.", "To confront Caligula directly, challenging the legitimacy of his claim to divinity.", "To rally support among his fellow conspirators for the assassination of Caligula, aiming to overthrow the tyrant."],
        ap.beliefs = ["Freedom is an inherent right that must be fought for, regardless of the personal cost.", "Caligula's tyranny must end for Rome to survive and thrive.", "Loyalty to the state must outweigh personal loyalty to a mad ruler."],
        ap.goals = ["Short-term: To successfully confront Caligula and assert the rebellion's intent.", "Medium-term: To eliminate Caligula and restore order to Rome.", "Ultimate: To establish a new governance that prioritizes liberty and justice for all citizens."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Caligula steps into the covered way, his demeanor shifting from casual arrogance to sheer panic as he realizes the gravity of his situation. His hands flail defensively, and he backs away slightly, desperate to maintain his facade of power even as the swords are drawn against him.',
        ap.emotional_state = 'Caligula\'s initial bravado crumbles into frantic dread, his laughter fading into cries for help as he faces the reality of his imminent demise. Internally, he battles with feelings of betrayal and fear, wrestling with the loss of control and questioning his perceived divinity as he cries out for Drusilla.',
        ap.emotional_tags = ["caligula's initial bravado crumbles into frantic dread, his laughter fading into cries for help as he faces the reality of his imminent demise. internally, he battles with feelings of betrayal", "fear, wrestling with the loss of control", "questioning his perceived divinity as he cries out for drusilla.", "caligula's initial bravado crumbles into frantic dread", "his laughter fading into cries for help as he faces the reality of his imminent demise. internally", "he battles with feelings of betrayal and fear", "wrestling with the loss of control and questioning his perceived divinity as he cries out for drusilla."],
        ap.active_plans = ["To assert his divinity, attempting to deflect the coup by claiming invulnerability.", "To appeal to the loyalty of those around him, invoking their fear of the consequences of rebellion.", "To escape the situation entirely, seeking to regain control and retaliate against his perceived betrayers."],
        ap.beliefs = ["He views himself as a divine being, above mortal concerns, and thus untouchable.", "Loyalty is paramount; betrayal is an unforgivable sin in his rule.", "Power must be maintained at all costs, and any challenge to his authority is a personal affront."],
        ap.goals = ["Short-term: To survive the assassination attempt and reassert control over his empire.", "Medium-term: To punish those who would dare to defy him and solidify his grip on power.", "Ultimate: To restore his image as an invincible ruler, feared and revered by all."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Caligula, cornered in the covered way, finds himself facing the cold steel of Cassius\'s and Sabinus\'s drawn swords. He stumbles backward, his imperial robes suddenly feeling heavy and cumbersome, his earlier bravado evaporating in the face of imminent death. He flails his arms, a desperate, bird-like motion, as if trying to ward off the inevitable with sheer disbelief. His eyes dart wildly, searching for escape where there is none, his regal posture collapsing into a posture of abject terror.',
        ap.emotional_state = 'Beneath the veneer of divine emperor, Caligula is exposed as utterly, profoundly terrified. His surface emotion is a frantic denial, a desperate clinging to the delusion of his godhood as a shield against mortality. Internally, he is gripped by raw panic, the realization that his power, his divinity, is meaningless against cold steel. There\'s a palpable conflict between his inflated self-image and the brutal reality crashing down upon him. His cries for the deceased Drusilla suggest a regression to a childlike state, seeking comfort and protection from a lost figure of security in the face of overwhelming fear.',
        ap.emotional_tags = ["beneath the veneer of divine emperor, caligula is exposed as utterly, profoundly terrified. his surface emotion is a frantic denial, a desperate clinging to the delusion of his godhood as a shield against mortality. internally, he is gripped by raw panic, the realization that his power, his divinity, is meaningless against cold steel. there's a palpable conflict between his inflated self-image", "the brutal reality crashing down upon him. his cries for the deceased drusilla suggest a regression to a childlike state, seeking comfort", "protection from a lost figure of security in the face of overwhelming fear.", "beneath the veneer of divine emperor", "caligula is exposed as utterly", "profoundly terrified. his surface emotion is a frantic denial", "a desperate clinging to the delusion of his godhood as a shield against mortality. internally", "he is gripped by raw panic", "the realization that his power", "his divinity", "is meaningless against cold steel. there's a palpable conflict between his inflated self-image and the brutal reality crashing down upon him. his cries for the deceased drusilla suggest a regression to a childlike state", "seeking comfort and protection from a lost figure of security in the face of overwhelming fear."],
        ap.active_plans = ["To verbally assert his divinity in a last-ditch effort to intimidate or dissuade his assassins.", "To appeal to some sense of loyalty or fear in Cassius and Sabinus by reminding them of his imperial status, however delusional.", "To invoke the name of Drusilla, possibly as a desperate plea for supernatural intervention or as a cry for a lost source of comfort and authority, hoping to confuse or emotionally manipulate his attackers."],
        ap.beliefs = ["He desperately clings to the belief in his own divinity, even as death stares him in the face, revealing a profound self-deception or a final act of manic denial.", "He believes that his proclaimed godhood should afford him invulnerability, an exemption from mortal laws and violence, showcasing his detachment from reality.", "He perhaps subconsciously believes that invoking Drusilla's name might offer some spectral protection or at least momentarily disorient his attackers, rooted in his past dependence on her influence."],
        ap.goals = ["Short-term: To survive this immediate encounter and escape the drawn swords.", "Medium-term: To reassert his authority and punish those who dared to challenge his divine status, reinforcing his tyrannical rule.", "Ultimate: To solidify his image as a god-emperor, transcending mortal limitations and securing his legacy as a divine ruler, even in the face of death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Cassius stands defiantly with his sword drawn, poised and ready to strike. His posture is rigid, embodying the tension of the moment, as he directs the final order to finish Caligula. The determination in his stance reflects his resolve to reclaim agency from tyranny.',
        ap.emotional_state = 'Cassius exhibits a fierce intensity marked by the gravity of his decision. Beneath the surface bravado, there is an undercurrent of anxiety about the moral weight of regicide. He grapples with the burden of leadership, driven by desperation and a sense of justice for the wrongs inflicted by Caligula.',
        ap.emotional_tags = ["cassius exhibits a fierce intensity marked by the gravity of his decision. beneath the surface bravado, there is an undercurrent of anxiety about the moral weight of regicide. he grapples with the burden of leadership, driven by desperation", "a sense of justice for the wrongs inflicted by caligula.", "cassius exhibits a fierce intensity marked by the gravity of his decision. beneath the surface bravado", "there is an undercurrent of anxiety about the moral weight of regicide. he grapples with the burden of leadership", "driven by desperation and a sense of justice for the wrongs inflicted by caligula."],
        ap.active_plans = ["Execute Caligula to ensure the end of his tyrannical rule.", "Rally the conspirators to act decisively and reclaim their power.", "Establish a new order in Rome, free from Caligula's madness."],
        ap.beliefs = ["Liberty is a fundamental right that must be reclaimed from tyranny.", "Caligula's reign is a threat to the stability and morality of Rome.", "The ends justify the means in the pursuit of freedom."],
        ap.goals = ["Short-term: Eliminate Caligula to prevent further oppression.", "Medium-term: Build a coalition among the conspirators to restore order.", "Ultimate: Establish a government that protects the rights and freedoms of the Roman citizens."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Sabinus stands resolute in the covered way, sword brandished and ready for action alongside Cassius. He confronts Caligula directly, delivering the powerful line about avenging their wives. His stance is firm, embodying a warrior prepared to strike down a tyrant, driven by a deeply personal sense of justice.',
        ap.emotional_state = 'Beneath a veneer of grim determination, Sabinus is fueled by righteous anger and a profound sense of grievance. He channels personal pain and the collective suffering of Roman women into a focused resolve. Though fear may linger, it is overshadowed by a burning desire for retribution and a belief that his actions are morally justified, driven by a profound empathy for the wronged wives of Rome.',
        ap.emotional_tags = ["beneath a veneer of grim determination, sabinus is fueled by righteous anger", "a profound sense of grievance. he channels personal pain", "the collective suffering of roman women into a focused resolve. though fear may linger, it is overshadowed by a burning desire for retribution", "a belief that his actions are morally justified, driven by a profound empathy for the wronged wives of rome.", "beneath a veneer of grim determination", "sabinus is fueled by righteous anger and a profound sense of grievance. he channels personal pain and the collective suffering of roman women into a focused resolve. though fear may linger", "it is overshadowed by a burning desire for retribution and a belief that his actions are morally justified", "driven by a profound empathy for the wronged wives of rome."],
        ap.active_plans = ["To assassinate Caligula swiftly and decisively.", "To articulate the personal and moral justification for the assassination by invoking the plight of their wives.", "To contribute to the broader conspiracy aimed at liberating Rome from tyranny."],
        ap.beliefs = ["Caligula's tyranny is an intolerable evil that must be eradicated.", "Justice demands retribution for the suffering inflicted upon the women of Rome.", "Personal action, even violence, is necessary to restore moral order and protect the vulnerable."],
        ap.goals = ["short-term\": \"To strike down Caligula in this immediate confrontation, ensuring his death.", "medium-term\": \"To contribute to the success of the conspiracy and the downfall of Caligula's regime.", "ultimate\": \"To achieve justice for the wronged women of Rome and contribute to a more just and honorable society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_4'})
    ON CREATE SET
        ap.current_status = 'Caligula enters the covered way with an air of imperial entitlement, only to be met by the cold steel of drawn swords. He initially falters, confused and questioning, before panic sets in. He postures and pleads, desperately invoking his supposed divinity and crying out for Drusilla in a pathetic display of terror as he faces imminent death.',
        ap.emotional_state = 'Caligula\'s bravado shatters instantly, revealing a core of raw fear and disbelief. His surface emotions oscillate wildly from confusion to terror, underscored by a desperate denial of his mortality. Internally, he grapples with the crumbling illusion of his godhood as stark reality crashes in. His frantic cries expose the profound chasm between his inflated self-image and the terrifying vulnerability of his actual position, highlighting his descent into utter madness in his final moments.',
        ap.emotional_tags = ["caligula's bravado shatters instantly, revealing a core of raw fear", "disbelief. his surface emotions oscillate wildly from confusion to terror, underscored by a desperate denial of his mortality. internally, he grapples with the crumbling illusion of his godhood as stark reality crashes in. his frantic cries expose the profound chasm between his inflated self-image", "the terrifying vulnerability of his actual position, highlighting his descent into utter madness in his final moments.", "caligula's bravado shatters instantly", "revealing a core of raw fear and disbelief. his surface emotions oscillate wildly from confusion to terror", "underscored by a desperate denial of his mortality. internally", "he grapples with the crumbling illusion of his godhood as stark reality crashes in. his frantic cries expose the profound chasm between his inflated self-image and the terrifying vulnerability of his actual position", "highlighting his descent into utter madness in his final moments."],
        ap.active_plans = ["To understand the sudden threat and the conspirators' intentions.", "To leverage his self-proclaimed divinity as a shield against harm, attempting to intimidate his attackers.", "To elicit sympathy or intervention by calling for Drusilla and pleading for his life, hoping for a miraculous escape."],
        ap.beliefs = ["His divine status renders him invulnerable and beyond mortal judgment.", "His imperial authority is absolute, and rebellion is unthinkable and impossible.", "The force of his will and the fear he inspires should be sufficient to control any situation, even mortal danger."],
        ap.goals = ["short-term\": \"To survive the immediate assassination attempt and escape unharmed.", "medium-term\": \"To reassert his dominance and exact brutal revenge upon the conspirators to reaffirm his power.", "ultimate\": \"To maintain his unchallenged rule and solidify his image as a god-emperor, worshipped and feared without question."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_5'})
    ON CREATE SET
        ap.current_status = 'Caligula stands at the center of chaos, his body trembling as he confronts Cassius and Sabinus. His posture is one of desperation, arms waving wildly as he pleads for his life, the fear palpable as he recoils from the blades drawn against him.',
        ap.emotional_state = 'Outwardly, Caligula is frantic, his voice rising in pitch and panic, reflecting his terror at the imminent threat. Internally, he is grappling with the shattering of his delusions of invincibility, realizing that his godhood is meaningless in the face of death. This creates a stark conflict between his previous arrogance and the stark reality of his mortality.',
        ap.emotional_tags = ["outwardly, caligula is frantic, his voice rising in pitch", "panic, reflecting his terror at the imminent threat. internally, he is grappling with the shattering of his delusions of invincibility, realizing that his godhood is meaningless in the face of death. this creates a stark conflict between his previous arrogance", "the stark reality of his mortality.", "outwardly", "caligula is frantic", "his voice rising in pitch and panic", "reflecting his terror at the imminent threat. internally", "he is grappling with the shattering of his delusions of invincibility", "realizing that his godhood is meaningless in the face of death. this creates a stark conflict between his previous arrogance and the stark reality of his mortality."],
        ap.active_plans = ["To convince his assassins of his divine status and prevent his execution.", "To invoke the memory of Drusilla, attempting to elicit sympathy and stall for time.", "To escape the immediate threat posed by Cassius and Sabinus, seeking refuge in his status as Emperor."],
        ap.beliefs = ["He believes he is a god and, therefore, invincible to mortal harm.", "He holds a conviction that his royal lineage grants him authority over life and death.", "Caligula thinks love and loyalty, as demonstrated by those closest to him, can protect him in times of danger."],
        ap.goals = ["Short-term: To survive the immediate assassination attempt and assert his power.", "Medium-term: To regain control over his court and eliminate the threat posed by the conspirators.", "Ultimate: To reinforce his status as a divine ruler and stabilize his reign amidst growing dissent."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_14_6'})
    ON CREATE SET
        ap.current_status = 'Caesonia arrives on the scene in a state of high distress, her voice ringing out in a desperate cry. She is moving, likely running or rushing into the covered way, clearly searching for someone amidst the immediate aftermath of the assassination. Her fragmented questions and exclamations reveal her disoriented state and urgent need to find Cassius.',
        ap.emotional_state = 'Caesonia is consumed by raw panic and disbelief. Outwardly, her frantic calls and questions betray her terror and confusion. Beneath the surface, she is likely experiencing a profound shock at the sudden, violent disruption of the world she knew. Her maternal instincts are in overdrive, overriding any political awareness as her primary concern shifts entirely to the safety of her child, a vulnerability brutally exposed by the unfolding chaos.',
        ap.emotional_tags = ["caesonia is consumed by raw panic", "disbelief. outwardly, her frantic calls", "questions betray her terror", "confusion. beneath the surface, she is likely experiencing a profound shock at the sudden, violent disruption of the world she knew. her maternal instincts are in overdrive, overriding any political awareness as her primary concern shifts entirely to the safety of her child, a vulnerability brutally exposed by the unfolding chaos.", "caesonia is consumed by raw panic and disbelief. outwardly", "her frantic calls and questions betray her terror and confusion. beneath the surface", "she is likely experiencing a profound shock at the sudden", "violent disruption of the world she knew. her maternal instincts are in overdrive", "overriding any political awareness as her primary concern shifts entirely to the safety of her child", "a vulnerability brutally exposed by the unfolding chaos."],
        ap.active_plans = ["Immediately locate Cassius amidst the confusion.", "Assess the immediate danger and ensure the safety of her child.", "Understand the unfolding events and the sudden absence of the Emperor and his guard."],
        ap.beliefs = ["Family, particularly her child, is her utmost priority in times of crisis.", "Cassius, as her partner and a figure of strength, is her protector and source of security.", "The established order, however corrupt, provided a semblance of safety and predictability, now violently shattered."],
        ap.goals = ["Short-term: Find Cassius and ensure the immediate safety of her baby from the surrounding chaos.", "Medium-term: Understand the implications of Caligula's death and the power vacuum it creates for her and her child's future.", "Ultimate: Secure a safe and stable future for herself and her child in a Rome now plunged into uncertainty and potential danger."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_tattered_purple_robe_event_15_7'})
    ON CREATE SET
        oi.description = 'The tattered purple robe serves as a mocking symbol of Claudius\'s involuntary ascension to power. Gratus drapes it over Claudius as an absurd coronation garment, reinforcing the grotesque nature of the event and underscoring the farcical reality of his new role as Emperor. It highlights the decay of the once-magnificent imperial authority, reduced to a mere rag amidst the chaos.',
        oi.status_before = 'The robe was among the looted goods in the Grand Throne Room, a once-proud symbol of imperial status now abandoned and forgotten in the chaos of Caligula\'s assassination.',
        oi.status_after = 'After being thrown over Claudius, the robe further embodies the decay of Rome\'s imperial power, clinging pitifully to him as he is paraded around, a stark representation of his reluctant and tragic claim to the throne.'
    WITH oi
    MATCH (o:Object {uuid: 'object_tattered_purple_robe'})
    MATCH (e:Event {uuid: 'event_15_7'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Gratus, a burly Praetorian Guard, dominates the chaotic scene in the ransacked Grand Throne Room. He shoves aside a senator with ease, rummaging through a chest for valuables. His physical stance is aggressive, with shoulders squared and hands gripping objects tightly, emphasizing his power in the midst of looting.',
        ap.emotional_state = 'Gratus exhibits surface-level excitement and aggression, his eyes gleaming with the thrill of plunder. Internally, his emotions are mixed; he feels empowered by the chaos yet aware of the precariousness of their situation post-assassination. His motivations are muddled by ambition and the fear of losing his status within the disarray.',
        ap.emotional_tags = ["gratus exhibits surface-level excitement", "aggression, his eyes gleaming with the thrill of plunder. internally, his emotions are mixed; he feels empowered by the chaos yet aware of the precariousness of their situation post-assassination. his motivations are muddled by ambition", "the fear of losing his status within the disarray.", "gratus exhibits surface-level excitement and aggression", "his eyes gleaming with the thrill of plunder. internally", "his emotions are mixed; he feels empowered by the chaos yet aware of the precariousness of their situation post-assassination. his motivations are muddled by ambition and the fear of losing his status within the disarray.", "gratus exhibits surface-level excitement and aggression, his eyes gleaming with the thrill of plunder. internally, his emotions are mixed", "he feels empowered by the chaos yet aware of the precariousness of their situation post-assassination. his motivations are muddled by ambition and the fear of losing his status within the disarray."],
        ap.active_plans = ["To seize as much loot as possible before the Germans arrive.", "To assert dominance over others in the room, showcasing his strength.", "To find a way to elevate his status among the Praetorian Guard in this chaotic power shift."],
        ap.beliefs = ["Might makes right; strength is necessary to survive in this power vacuum.", "The Praetorian Guard must assert themselves amidst the chaos to retain control.", "Wealth and power are intertwined in the aftermath of Caligula's death."],
        ap.goals = ["Short-term: To gather valuable loot quickly.", "Medium-term: To position himself as a leader among the soldiers during this moment of chaos.", "Ultimate: To stabilize his standing in the new order that will arise from the ashes of Caligula's reign."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Gratus is in the thick of the looting within the Grand Throne Room, actively participating in the ransacking of the palace. He is physically dominant, shoving aside senators and aggressively searching for valuables. Spotting Claudius cowering amongst the senators, he immediately assumes him to be an assassin, moving to apprehend him with forceful intent, ready to enact immediate retribution.',
        ap.emotional_state = 'Initially, Gratus is driven by opportunistic greed, reveling in the chaos to seize plunder. This quickly morphs into aggressive anger and fear when he perceives Claudius as an assassin, fueled by a primal concern for his own job security and the stability of the Praetorian Guard. Beneath this aggression lies a deeper anxiety about the uncertain future and a desperate yearning for order to be restored, even if through an unlikely figurehead.',
        ap.emotional_tags = ["initially, gratus is driven by opportunistic greed, reveling in the chaos to seize plunder. this quickly morphs into aggressive anger", "fear when he perceives claudius as an assassin, fueled by a primal concern for his own job security", "the stability of the praetorian guard. beneath this aggression lies a deeper anxiety about the uncertain future", "a desperate yearning for order to be restored, even if through an unlikely figurehead.", "initially", "gratus is driven by opportunistic greed", "reveling in the chaos to seize plunder. this quickly morphs into aggressive anger and fear when he perceives claudius as an assassin", "fueled by a primal concern for his own job security and the stability of the praetorian guard. beneath this aggression lies a deeper anxiety about the uncertain future and a desperate yearning for order to be restored", "even if through an unlikely figurehead."],
        ap.active_plans = ["To seize valuable loot from the palace amidst the post-assassination chaos.", "To identify and punish those he believes responsible for Caligula's death, driven by a sense of misplaced loyalty and vengeance.", "To ensure the continuation of the Praetorian Guard's role and his own position by finding a replacement Emperor, any Emperor, to restore order."],
        ap.beliefs = ["The Praetorian Guard is essential for Roman order and his personal well-being.", "The assassination of an Emperor is a direct threat to the Praetorian Guard's existence and therefore must be addressed swiftly.", "Immediate, forceful action is necessary to restore order and prevent further chaos, even if based on mistaken assumptions."],
        ap.goals = ["Short-term: Maximize personal gain through looting in the immediate aftermath of the assassination.", "Medium-term: Secure the continuation of the Praetorian Guard and his own employment within it by supporting the swift appointment of a new Emperor.", "Ultimate: Maintain a stable and materially comfortable position within the Roman power structure, reliant on the authority of an Emperor and the Praetorian Guard."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is physically diminished, cowering and hiding amongst the terrified senators in the ransacked Grand Throne Room. He is attempting to remain as unobtrusive as possible amidst the chaotic looting and soldier activity. When Gratus confronts him, Claudius is immediately defensive and pleading, stammering denials and begging for his life, physically leaning on a pillar for support, emphasizing his vulnerability.',
        ap.emotional_state = 'Claudius is consumed by intense fear and terror, witnessing the raw violence and opportunistic looting firsthand. His outward demeanor is one of abject panic, pleading for his life with desperate sincerity. Internally, he is deeply repulsed by the unfolding chaos and the immediate threat of violence directed at him. Simultaneously, he feels a profound aversion to the very idea of power, desperately wishing to avoid any responsibility or leadership, longing for a return to the principles of a Republic, a sentiment at odds with the unfolding events forcing him towards imperial destiny.',
        ap.emotional_tags = ["claudius is consumed by intense fear", "terror, witnessing the raw violence", "opportunistic looting firsthand. his outward demeanor is one of abject panic, pleading for his life with desperate sincerity. internally, he is deeply repulsed by the unfolding chaos", "the immediate threat of violence directed at him. simultaneously, he feels a profound aversion to the very idea of power, desperately wishing to avoid any responsibility or leadership, longing for a return to the principles of a republic, a sentiment at odds with the unfolding events forcing him towards imperial destiny.", "claudius is consumed by intense fear and terror", "witnessing the raw violence and opportunistic looting firsthand. his outward demeanor is one of abject panic", "pleading for his life with desperate sincerity. internally", "he is deeply repulsed by the unfolding chaos and the immediate threat of violence directed at him. simultaneously", "he feels a profound aversion to the very idea of power", "desperately wishing to avoid any responsibility or leadership", "longing for a return to the principles of a republic", "a sentiment at odds with the unfolding events forcing him towards imperial destiny."],
        ap.active_plans = ["To remain unseen and avoid drawing attention from the looting soldiers, hoping to be overlooked in the chaos.", "To escape the dangerous and chaotic throne room and seek safety, possibly attempting to find his wife amidst the confusion.", "To vehemently deny any involvement in Caligula's assassination and convince the soldiers of his innocence, distancing himself from any perceived threat."],
        ap.beliefs = ["He is fundamentally unsuited and utterly unwilling to become Emperor, viewing it as a terrifying prospect.", "A Republican form of government is inherently superior to the tyranny of an Empire, representing order and justice in his scholarly mind.", "Personal safety and avoidance of conflict are paramount, valuing a quiet life of scholarship over political power and public life."],
        ap.goals = ["Short-term: Survive the immediate threat of violence and escape the ransacked throne room unharmed.", "Medium-term: See the restoration of order and stability in Rome, ideally through the establishment of a Republic, reflecting his political ideals.", "Ultimate: Return to a peaceful, private life dedicated to scholarship, free from the burdens and dangers of political involvement and imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Gratus, a burly Praetorian, stands assertively in the throne room, shoving aside a senator with a disdainful gesture as he rummages through a chest of valuables. He exudes an air of authority amidst the chaos, his posture brimming with the confident bravado typical of a soldier in plundering frenzy. When he grabs Claudius, his grip is rough, embodying his brutish nature and the power dynamics at play.',
        ap.emotional_state = 'On the surface, Gratus appears aggressive and excited by the looting, his face alight with the thrill of acquisition. Internally, however, a flicker of uncertainty may lurk as he recognizes the precariousness of the situation and the potential consequences of his actions. His moment of confrontation with Claudius reveals a tension between his violent instincts and a deeper awareness of the shifting loyalties among the soldiers and the imminent chaos.',
        ap.emotional_tags = ["on the surface, gratus appears aggressive", "excited by the looting, his face alight with the thrill of acquisition. internally, however, a flicker of uncertainty may lurk as he recognizes the precariousness of the situation", "the potential consequences of his actions. his moment of confrontation with claudius reveals a tension between his violent instincts", "a deeper awareness of the shifting loyalties among the soldiers", "the imminent chaos.", "on the surface", "gratus appears aggressive and excited by the looting", "his face alight with the thrill of acquisition. internally", "however", "a flicker of uncertainty may lurk as he recognizes the precariousness of the situation and the potential consequences of his actions. his moment of confrontation with claudius reveals a tension between his violent instincts and a deeper awareness of the shifting loyalties among the soldiers and the imminent chaos."],
        ap.active_plans = ["To assert dominance in the throne room by claiming valuables and displaying strength to his fellow soldiers.", "To confront and eliminate any perceived threats to his authority, as exemplified by his initial aggression towards Claudius.", "To navigate the ongoing power vacuum post-Caligula, positioning himself favorably within the new military hierarchy."],
        ap.beliefs = ["Might makes right; strength and aggression determine one's place in Roman society.", "Loyalty to the Praetorian Guard is paramount, and showing weakness or mercy is an unforgivable flaw.", "In times of chaos, the boldest will seize power, and he intends to be among them."],
        ap.goals = ["Short-term: To secure valuable items from the Grand Throne Room amidst the chaos.", "Medium-term: To maintain control and authority among the soldiers as the new power dynamics unfold.", "Ultimate: To rise in rank and influence within the Praetorian Guard, potentially positioning himself as a key player in the new regime."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_3'})
    ON CREATE SET
        ap.current_status = 'Claudius, trembling and stammering, is caught in a moment of sheer fear as Gratus grabs him, his frail body pressing against a nearby pillar for support. His posture is defensive and submissive, reflecting his crippling anxiety in this chaotic environment. As the Sergeant intervenes, Claudius struggles to rise, leaning heavily, his frailty stark against the backdrop of the fierce soldiers around him.',
        ap.emotional_state = 'Outwardly, Claudius exhibits panic and desperation, his voice shaking as he pleads for his life. Internally, a deeper fear simmers—fear of the violent upheaval around him and the unknown fate that awaits him. He feels a profound sense of insignificance, as his identity fades in the chaos, underscored by the awareness of being dismissed as harmless. This moment is pivotal, as it hints at his reluctant acceptance of a destiny he does not want.',
        ap.emotional_tags = ["outwardly, claudius exhibits panic", "desperation, his voice shaking as he pleads for his life. internally, a deeper fear simmers\u2014fear of the violent upheaval around him", "the unknown fate that awaits him. he feels a profound sense of insignificance, as his identity fades in the chaos, underscored by the awareness of being dismissed as harmless. this moment is pivotal, as it hints at his reluctant acceptance of a destiny he does not want.", "outwardly", "claudius exhibits panic and desperation", "his voice shaking as he pleads for his life. internally", "a deeper fear simmers\u2014fear of the violent upheaval around him and the unknown fate that awaits him. he feels a profound sense of insignificance", "as his identity fades in the chaos", "underscored by the awareness of being dismissed as harmless. this moment is pivotal", "as it hints at his reluctant acceptance of a destiny he does not want."],
        ap.active_plans = ["To escape the immediate threat posed by Gratus and the soldiers by seeking safety.", "To locate and find his wife, which represents a fleeting sense of normalcy amidst the chaos.", "To navigate the unexpected turn of events that could thrust him into a position of power, despite his aversion to it."],
        ap.beliefs = ["His stammer and physical limitations make him a target and liability in the volatile environment.", "Desire for a Republic reflects his belief in a governance system that aligns with his scholarly ideals, rather than the chaos of imperial power.", "His insignificance in the eyes of the soldiers reinforces a belief that he is unfit for leadership, a notion he both resents and fears."],
        ap.goals = ["Short-term: To survive the immediate danger posed by Gratus and the chaotic environment.", "Medium-term: To reunite with his wife, seeking solace in personal connection amidst the turmoil.", "Ultimate: To advocate for a return to Republican values, though he grapples with the irony of potentially becoming Emperor himself."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_4'})
    ON CREATE SET
        ap.current_status = 'Gratus is amidst the looting Praetorian Guard in the Grand Throne Room, initially focused on plundering valuables and maintaining order among his men. He is physically active, shoving aside senators and actively searching for loot. He quickly shifts focus when he believes he has identified one of Caligula\'s assassins, grabbing Claudius aggressively.',
        ap.emotional_state = 'Gratus begins with a crude sense of purpose, driven by the immediate opportunities of looting and a raw anger at the assassination of Emperor Caligula. This quickly morphs into pragmatic opportunism.  He is not overtly emotional but driven by a practical desire for stability and the continued employment of the Praetorian Guard. There\'s a hint of simple-mindedness in his logic, but it\'s underpinned by a soldier\'s directness and a need for decisive action.',
        ap.emotional_tags = ["gratus begins with a crude sense of purpose, driven by the immediate opportunities of looting", "a raw anger at the assassination of emperor caligula. this quickly morphs into pragmatic opportunism.  he is not overtly emotional but driven by a practical desire for stability", "the continued employment of the praetorian guard. there's a hint of simple-mindedness in his logic, but it's underpinned by a soldier's directness", "a need for decisive action.", "gratus begins with a crude sense of purpose", "driven by the immediate opportunities of looting and a raw anger at the assassination of emperor caligula. this quickly morphs into pragmatic opportunism.  he is not overtly emotional but driven by a practical desire for stability and the continued employment of the praetorian guard. there's a hint of simple-mindedness in his logic", "but it's underpinned by a soldier's directness and a need for decisive action.", "gratus begins with a crude sense of purpose, driven by the immediate opportunities of looting and a raw anger at the assassination of emperor caligula. this quickly morphs into pragmatic opportunism.  he is not overtly emotional", "driven by a practical desire for stability and the continued employment of the praetorian guard. there's a hint of simple-mindedness in his logic,", "it's underpinned by a soldier's directness and a need for decisive action."],
        ap.active_plans = ["Secure valuable loot from the palace spoils.", "Identify and potentially punish those perceived as responsible for the Emperor's death.", "Find a solution to the leadership vacuum that threatens the Praetorian Guard's existence and privileges."],
        ap.beliefs = ["The Praetorian Guard's survival and prosperity are directly linked to the existence of an Emperor.", "In times of chaos, any leader is better than no leader, regardless of their suitability.", "Practicality and immediate needs outweigh tradition or ideal qualifications in this crisis."],
        ap.goals = ["Short-term: Maximize personal gain from looting the palace.", "Medium-term: Ensure the Praetorian Guard remains employed and relevant in the new political landscape.", "Ultimate: Establish a stable power structure that benefits the Praetorian Guard and provides a sense of order, even if it's unconventional or absurd."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_4'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially cowering and attempting to remain unseen amidst the chaotic looting in the Grand Throne Room. When Gratus seizes him, he is physically weak and terrified, stammering out pleas for his life and emphasizing his innocence in Caligula\'s assassination. He struggles to stand when helped up, leaning heavily on a pillar, highlighting his physical frailty and vulnerability in this violent environment.',
        ap.emotional_state = 'Claudius is initially consumed by sheer terror, fearing for his life as he is mistaken for an assassin. Relief floods him when the Sergeant recognizes him and dismisses the accusation. However, this relief is immediately replaced by disbelief and horror as the guards propose him as Emperor. He is desperate to disavow any ambition for power, clinging to his desire for peace and a return to a Republic, revealing a profound aversion to leadership and the chaotic world of imperial politics.',
        ap.emotional_tags = ["claudius is initially consumed by sheer terror, fearing for his life as he is mistaken for an assassin. relief floods him when the sergeant recognizes him", "dismisses the accusation. however, this relief is immediately replaced by disbelief", "horror as the guards propose him as emperor. he is desperate to disavow any ambition for power, clinging to his desire for peace", "a return to a republic, revealing a profound aversion to leadership", "the chaotic world of imperial politics.", "claudius is initially consumed by sheer terror", "fearing for his life as he is mistaken for an assassin. relief floods him when the sergeant recognizes him and dismisses the accusation. however", "this relief is immediately replaced by disbelief and horror as the guards propose him as emperor. he is desperate to disavow any ambition for power", "clinging to his desire for peace and a return to a republic", "revealing a profound aversion to leadership and the chaotic world of imperial politics."],
        ap.active_plans = ["Remain inconspicuous and avoid drawing attention from the looting soldiers.", "Convince the soldiers of his innocence and lack of involvement in any conspiracy.", "Find Calpurnia and escape the dangerous palace environment to return to safety and obscurity."],
        ap.beliefs = ["He is utterly unfit and unwilling to rule, deeply preferring scholarly pursuits and a quiet life to the burdens of power.", "A Republic is the ideal form of Roman government, reflecting his intellectual and historical leanings.", "His physical disabilities and perceived lack of political acumen disqualify him from any position of leadership, especially the emperorship."],
        ap.goals = ["Short-term: Escape immediate physical danger and the chaotic situation in the throne room.", "Medium-term: Rejoin Calpurnia and return to a peaceful, private existence, away from the political turmoil.", "Ultimate: Witness the restoration of the Roman Republic, reflecting his idealistic and perhaps naive political aspirations, though he likely knows this is unrealistic."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands trembling, his body pressed against a pillar as Gratus aggressively grabs him, forcing him into a situation he utterly abhors. His stammering voice emerges, pleading for mercy and attempting to assert his innocence while leaning heavily for support, embodying the frailty that characterizes him in this moment of crisis.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal sheer panic and terror at the thought of being mistaken for an assassin. His stammering is a physical manifestation of his fear. Internally, however, he grapples with a deep aversion to power and a longing for a Republic, feeling trapped in an absurdity he cannot escape. This conflict between his desires and the brutal reality of the situation heightens his fear.',
        ap.emotional_tags = ["claudius's surface emotions reveal sheer panic", "terror at the thought of being mistaken for an assassin. his stammering is a physical manifestation of his fear. internally, however, he grapples with a deep aversion to power", "a longing for a republic, feeling trapped in an absurdity he cannot escape. this conflict between his desires", "the brutal reality of the situation heightens his fear.", "claudius's surface emotions reveal sheer panic and terror at the thought of being mistaken for an assassin. his stammering is a physical manifestation of his fear. internally", "however", "he grapples with a deep aversion to power and a longing for a republic", "feeling trapped in an absurdity he cannot escape. this conflict between his desires and the brutal reality of the situation heightens his fear."],
        ap.active_plans = ["Flee the immediate danger posed by the soldiers and seek safety.", "Find his wife amidst the chaos, aiming for a moment of solace.", "Reject the notion of becoming Emperor and assert his belief in a Republic."],
        ap.beliefs = ["A firm belief in the ideals of a Republic over monarchy.", "The conviction that power corrupts and leads to moral decay.", "An inherent understanding of his own intellectual capabilities, believing they should not be overshadowed by ambition."],
        ap.goals = ["Short-term: Escape the soldiers and find safety.", "Medium-term: Reconnect with his wife and form an alliance.", "Ultimate: Promote the idea of a Republic and avoid the burdens of imperial power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_6'})
    ON CREATE SET
        ap.current_status = 'Gratus is initially engaged in looting the throne room, a picture of opportunism amidst chaos. Upon spotting Claudius, he aggressively confronts him, mistaking him for an assassin. Corrected by the Sergeant, Gratus quickly pivots, enthusiastically seizing the idea of Claudius as Emperor. He physically manhandles Claudius, grabbing and hoisting him onto the shoulders of fellow soldiers, actively participating in the forceful acclamation.',
        ap.emotional_state = 'Gratus is driven by a crude mix of aggression and opportunism. Initially accusatory and violent towards who he perceives as a threat, he swiftly transitions to excited enthusiasm at the prospect of an Emperor, driven by self-preservation and a desire for continued employment as a Praetorian Guard. There\'s a palpable lack of genuine respect or concern for Claudius himself; Gratus\'s emotions are purely transactional and self-serving, reflecting the brutal pragmatism of the moment.',
        ap.emotional_tags = ["gratus is driven by a crude mix of aggression", "opportunism. initially accusatory", "violent towards who he perceives as a threat, he swiftly transitions to excited enthusiasm at the prospect of an emperor, driven by self-preservation", "a desire for continued employment as a praetorian guard. there's a palpable lack of genuine respect or concern for claudius himself; gratus's emotions are purely transactional", "self-serving, reflecting the brutal pragmatism of the moment.", "gratus is driven by a crude mix of aggression and opportunism. initially accusatory and violent towards who he perceives as a threat", "he swiftly transitions to excited enthusiasm at the prospect of an emperor", "driven by self-preservation and a desire for continued employment as a praetorian guard. there's a palpable lack of genuine respect or concern for claudius himself; gratus's emotions are purely transactional and self-serving", "reflecting the brutal pragmatism of the moment.", "gratus is driven by a crude mix of aggression and opportunism. initially accusatory and violent towards who he perceives as a threat, he swiftly transitions to excited enthusiasm at the prospect of an emperor, driven by self-preservation and a desire for continued employment as a praetorian guard. there's a palpable lack of genuine respect or concern for claudius himself", "gratus's emotions are purely transactional and self-serving, reflecting the brutal pragmatism of the moment."],
        ap.active_plans = ["Continue looting and securing valuables from the throne room chaos.", "Initially identify and punish perceived threats like 'assassins'.", "Embrace and promote the idea of Claudius as Emperor to secure the Praetorian Guard's future.", "Physically impose the imperial status on Claudius, overriding his protests."],
        ap.beliefs = ["The Praetorian Guard's existence and livelihood are directly tied to having an Emperor.", "Any Emperor is better than no Emperor, especially in a chaotic power vacuum.", "Claudius, being perceived as weak and harmless, might be a controllable and preferable Emperor.", "Forceful action and group consensus can override individual dissent, especially in a military context."],
        ap.goals = ["Short-term: Secure immediate material gains through looting.", "Medium-term: Ensure the continuation of the Praetorian Guard and his own position within it by quickly installing a new Emperor.", "Ultimate: Maintain a stable, power-structured environment where the Praetorian Guard remains relevant and influential, guaranteeing his personal security and status."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_6'})
    ON CREATE SET
        ap.current_status = 'Claudius is found cowering and stammering amidst the ransacked throne room, initially terrified and pleading for his life when confronted by Gratus. He is physically weak and leans on a pillar for support, highlighting his vulnerability. As the soldiers proclaim him Emperor, he thrashes weakly and protests feebly, utterly overwhelmed and resisting the forceful imposition of imperial status, desperately trying to assert his desire for a Republic.',
        ap.emotional_state = 'Claudius is consumed by abject terror at being mistaken for an assassin and threatened. Relief washes over him when the Sergeant intervenes, only to be replaced by horror and disbelief as the soldiers propose him as Emperor. His internal state is a maelstrom of fear, confusion, and profound unwillingness. He is deeply averse to power and genuinely desires a Republic, creating a stark conflict between his personal ideals and the terrifying reality being thrust upon him. His stammer is amplified by his distress, betraying his deep-seated anxiety.',
        ap.emotional_tags = ["claudius is consumed by abject terror at being mistaken for an assassin", "threatened. relief washes over him when the sergeant intervenes, only to be replaced by horror", "disbelief as the soldiers propose him as emperor. his internal state is a maelstrom of fear, confusion,", "profound unwillingness. he is deeply averse to power", "genuinely desires a republic, creating a stark conflict between his personal ideals", "the terrifying reality being thrust upon him. his stammer is amplified by his distress, betraying his deep-seated anxiety.", "claudius is consumed by abject terror at being mistaken for an assassin and threatened. relief washes over him when the sergeant intervenes", "only to be replaced by horror and disbelief as the soldiers propose him as emperor. his internal state is a maelstrom of fear", "confusion", "and profound unwillingness. he is deeply averse to power and genuinely desires a republic", "creating a stark conflict between his personal ideals and the terrifying reality being thrust upon him. his stammer is amplified by his distress", "betraying his deep-seated anxiety."],
        ap.active_plans = ["Avoid being harmed or killed amidst the chaos following Caligula's assassination.", "Escape the dangerous situation in the throne room and find safety.", "Locate his wife, Calpurnia, in the chaotic aftermath (implied desire based on script).", "Vehemently reject the idea of becoming Emperor and advocate for the establishment of a Republic."],
        ap.beliefs = ["He is fundamentally unsuited and unwilling to be Emperor, believing himself to be a scholar, not a ruler.", "A Republic is a more desirable and just form of government than an Empire, reflecting his scholarly ideals.", "Power and imperial status are dangerous and corrupting forces that he wants to avoid.", "His physical limitations and perceived inadequacies make him a poor choice for leadership."],
        ap.goals = ["Short-term: Survive the immediate threat and avoid being forced into the role of Emperor.", "Medium-term: Return to his former life of scholarly pursuits and peace, away from political turmoil, perhaps hoping to influence the establishment of a Republic.", "Ultimate: Live a quiet, scholarly life dedicated to learning and contemplation, free from the burdens and dangers of imperial power, in a stable and just political system (ideally a Republic)."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_7'})
    ON CREATE SET
        ap.current_status = 'Gratus, a burly Praetorian Guard, stands among the chaos of the ransacked Grand Throne Room, his strong arms aggressively shoving aside a senator as he rummages through loot. When he spots Claudius cowering in fear, he grabs him roughly, showcasing his physical dominance amidst the other soldiers. He engages in a forceful yet protective manner, attempting to rally the soldiers around a new leader.',
        ap.emotional_state = 'Gratus exhibits a blustering bravado tailored to the chaos around him, showing confidence in his actions. However, beneath the surface lies a simmering anxiety about the instability of their situation—his anger signifies an urge to assert control in a rapidly devolving environment. He seeks to reassure Claudius but his tone conveys a sense of derisive cynicism about the situation.',
        ap.emotional_tags = ["gratus exhibits a blustering bravado tailored to the chaos around him", "showing confidence in his actions. however", "beneath the surface lies a simmering anxiety about the instability of their situation\u2014his anger signifies an urge to assert control in a rapidly devolving environment. he seeks to reassure claudius but his tone conveys a sense of derisive cynicism about the situation.", "gratus exhibits a blustering bravado tailored to the chaos around him, showing confidence in his actions. however, beneath the surface lies a simmering anxiety about the instability of their situation\u2014his anger signifies an urge to assert control in a rapidly devolving environment. he seeks to reassure claudius", "his tone conveys a sense of derisive cynicism about the situation."],
        ap.active_plans = ["To assert dominance over Claudius by physically hoisting him as a figurehead Emperor, thereby unifying the soldiers under a new leader.", "To distract the other soldiers from their growing fear of the German mercenaries by framing Claudius's ascension as beneficial for their survival.", "To find a way to maintain the Praetorian Guard's role in the new power structure following Caligula's assassination."],
        ap.beliefs = ["The current chaos demands a strong leader, and Claudius, despite his apparent weaknesses, can be molded into that role.", "Loyalty to the Praetorian Guard is paramount, and maintaining their relevance is essential for his survival.", "Power is best wielded through intimidation and strength, and he sees Claudius as a puppet to manipulate."],
        ap.goals = ["Short-term: To protect his immediate position within the chaos of the throne room by rallying around Claudius as Emperor.", "Medium-term: To establish the Praetorian Guard's authority in the power vacuum left by Caligula's death.", "Ultimate: To secure a favored status within the new regime, ensuring both his personal safety and the prestige of the Guard."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_7'})
    ON CREATE SET
        ap.current_status = 'Claudius, trembling with fear, is forcibly hoisted onto the shoulders of the Praetorian Guards. His body language reflects his terror as he thrashes weakly against the overwhelming strength of the soldiers parading him around the looted Throne Room. He leans heavily on a pillar, struggling to maintain his balance and dignity amid the chaos.',
        ap.emotional_state = 'Claudius is engulfed in a storm of panic and disbelief, his outward stammering betraying the deep-seated dread within. He desperately pleads for mercy, his internal conflict between survival and his ideals evident in his protests for a Republic. The disparity between his meek exterior and the monumental event unfolding around him creates a poignant tension, reflecting his internal struggle.',
        ap.emotional_tags = ["claudius is engulfed in a storm of panic", "disbelief, his outward stammering betraying the deep-seated dread within. he desperately pleads for mercy, his internal conflict between survival", "his ideals evident in his protests for a republic. the disparity between his meek exterior", "the monumental event unfolding around him creates a poignant tension, reflecting his internal struggle.", "claudius is engulfed in a storm of panic and disbelief", "his outward stammering betraying the deep-seated dread within. he desperately pleads for mercy", "his internal conflict between survival and his ideals evident in his protests for a republic. the disparity between his meek exterior and the monumental event unfolding around him creates a poignant tension", "reflecting his internal struggle."],
        ap.active_plans = ["To escape the clutches of the Guard and seek safety, particularly to find his wife amidst the chaos.", "To voice his desire for a Republic, opposing the absurdity of his forced coronation.", "To navigate the new political landscape without becoming a pawn in the hands of the Praetorian Guard."],
        ap.beliefs = ["The belief that power should not be held by one individual, advocating instead for a Republic.", "An understanding that he is perceived as a weak link in the power structure, exacerbating his feelings of inadequacy.", "A conviction that the chaos of Rome can be challenged through reason and integrity rather than brute force."],
        ap.goals = ["Short-term: To escape from the soldiers and find safety in the turmoil surrounding him.", "Medium-term: To rally support for his vision of restoring the Republic, focusing on his intellectual strengths.", "Ultimate: To distance himself from the violent power struggle and establish a more stable and just governance for Rome."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_briseis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_briseis'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_briseis_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_2_6'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_5'}),
          (b:Event {uuid: 'event_2_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_2_7'}),
          (b:Scene {uuid: 'scene_2'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_2_6'}),
          (b:Event {uuid: 'event_2_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_diana'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_poppaea'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_poppaea_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_poppaea_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caesonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_diana'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_diana_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_2_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_2_6'}),
          (b:Event {uuid: 'event_2_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_2_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_2_6'}),
          (b:Event {uuid: 'event_2_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caesonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_2_7'}),
          (b:Event {uuid: 'event_2_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_3_8'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_7'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_3_9'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_8'}),
          (b:Event {uuid: 'event_3_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_3_10'}),
          (b:Scene {uuid: 'scene_3'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_3_9'}),
          (b:Event {uuid: 'event_3_10'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_5'}),
          (b:Event {uuid: 'event_3_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_6'}),
          (b:Event {uuid: 'event_3_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_7'}),
          (b:Event {uuid: 'event_3_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_8'}),
          (b:Event {uuid: 'event_3_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_9'}),
          (b:Event {uuid: 'event_3_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_9'}),
          (b:Event {uuid: 'event_3_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_3_10'}),
          (b:Event {uuid: 'event_3_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_10'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_3_10'}),
          (b:Event {uuid: 'event_3_10'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caesonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_3'}),
          (b:Event {uuid: 'event_4_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_4_4'}),
          (b:Event {uuid: 'event_4_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_4'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_5_1'}),
          (b:Scene {uuid: 'scene_5'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_calpurnia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_calpurnia_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_7_6'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_5'}),
          (b:Event {uuid: 'event_7_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_7_7'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_6'}),
          (b:Event {uuid: 'event_7_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_7_8'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_7'}),
          (b:Event {uuid: 'event_7_8'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_7_9'}),
          (b:Scene {uuid: 'scene_7'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_7_8'}),
          (b:Event {uuid: 'event_7_9'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_3'}),
          (b:Event {uuid: 'event_7_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_valeria_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_4'}),
          (b:Event {uuid: 'event_7_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_5'}),
          (b:Event {uuid: 'event_7_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_7_6'}),
          (b:Event {uuid: 'event_7_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_7'}),
          (b:Event {uuid: 'event_7_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_valeria_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_7'}),
          (b:Event {uuid: 'event_7_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_valeria_messalina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_valeria_messalina_event_7_8'}),
          (b:Event {uuid: 'event_7_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_8'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_7_8'}),
          (b:Event {uuid: 'event_7_8'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_9'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_7_9'}),
          (b:Event {uuid: 'event_7_9'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_2'}),
          (b:Event {uuid: 'event_8_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_8_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_8_3'}),
          (b:Event {uuid: 'event_8_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_4'}),
          (b:Event {uuid: 'event_8_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_asprenas'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_asprenas_event_8_5'}),
          (b:Event {uuid: 'event_8_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_9'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_10_1'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_11_6'}),
          (b:Scene {uuid: 'scene_11'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_11_5'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_4'}),
          (b:Event {uuid: 'event_11_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_5'}),
          (b:Event {uuid: 'event_11_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_11_6'}),
          (b:Event {uuid: 'event_11_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_marcus_vinicius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_marcus_vinicius_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_14_6'}),
          (b:Scene {uuid: 'scene_14'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_14_5'}),
          (b:Event {uuid: 'event_14_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_cassius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_cassius_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sabinus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sabinus_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_4'}),
          (b:Event {uuid: 'event_14_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_14_5'}),
          (b:Event {uuid: 'event_14_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caesonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_14_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caesonia_event_14_6'}),
          (b:Event {uuid: 'event_14_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_hail_who?'})
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
MATCH (a:Event {uuid: 'event_15_5'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_4'}),
          (b:Event {uuid: 'event_15_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_15_6'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_5'}),
          (b:Event {uuid: 'event_15_6'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_15_7'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_15_6'}),
          (b:Event {uuid: 'event_15_7'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_2'}),
          (b:Event {uuid: 'event_15_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_3'}),
          (b:Event {uuid: 'event_15_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_4'}),
          (b:Event {uuid: 'event_15_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_4'}),
          (b:Event {uuid: 'event_15_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_5'}),
          (b:Event {uuid: 'event_15_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_6'}),
          (b:Event {uuid: 'event_15_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_6'}),
          (b:Event {uuid: 'event_15_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_gratus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_gratus_event_15_7'}),
          (b:Event {uuid: 'event_15_7'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius_claudius_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_7'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_claudius_drusus_event_15_7'}),
          (b:Event {uuid: 'event_15_7'})
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
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_2'}),
                      (e2:Event {uuid: 'event_2_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_3'}),
                      (e2:Event {uuid: 'event_2_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_4'}),
                      (e2:Event {uuid: 'event_2_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_5'}),
                      (e2:Event {uuid: 'event_2_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_1'}),
                      (e2:Event {uuid: 'event_2_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_2'}),
                      (e2:Event {uuid: 'event_2_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_3'}),
                      (e2:Event {uuid: 'event_2_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_4'}),
                      (e2:Event {uuid: 'event_2_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_5'}),
                      (e2:Event {uuid: 'event_2_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_2_6'}),
                      (e2:Event {uuid: 'event_2_7'})
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
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_5'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_6'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_7'}),
                      (e2:Event {uuid: 'event_3_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_5'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_6'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_7'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_8'}),
                      (e2:Event {uuid: 'event_3_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_1'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_2'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_3'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_4'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_5'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_6'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_7'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_8'}),
                      (e2:Event {uuid: 'event_3_10'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_3_9'}),
                      (e2:Event {uuid: 'event_3_10'})
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
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_4'}),
                      (e2:Event {uuid: 'event_7_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_5'}),
                      (e2:Event {uuid: 'event_7_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_4'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_5'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_6'}),
                      (e2:Event {uuid: 'event_7_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_4'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_5'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_6'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_7'}),
                      (e2:Event {uuid: 'event_7_8'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_1'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_2'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_3'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_4'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_5'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_6'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_7'}),
                      (e2:Event {uuid: 'event_7_9'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_7_8'}),
                      (e2:Event {uuid: 'event_7_9'})
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
                

                MATCH (e1:Event {uuid: 'event_11_1'}),
                      (e2:Event {uuid: 'event_11_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_2'}),
                      (e2:Event {uuid: 'event_11_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_3'}),
                      (e2:Event {uuid: 'event_11_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_4'}),
                      (e2:Event {uuid: 'event_11_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_11_5'}),
                      (e2:Event {uuid: 'event_11_6'})
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
                

                MATCH (e1:Event {uuid: 'event_14_1'}),
                      (e2:Event {uuid: 'event_14_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_2'}),
                      (e2:Event {uuid: 'event_14_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_3'}),
                      (e2:Event {uuid: 'event_14_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_4'}),
                      (e2:Event {uuid: 'event_14_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_14_5'}),
                      (e2:Event {uuid: 'event_14_6'})
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
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_3'}),
                      (e2:Event {uuid: 'event_15_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_4'}),
                      (e2:Event {uuid: 'event_15_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_3'}),
                      (e2:Event {uuid: 'event_15_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_4'}),
                      (e2:Event {uuid: 'event_15_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_5'}),
                      (e2:Event {uuid: 'event_15_6'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_1'}),
                      (e2:Event {uuid: 'event_15_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_2'}),
                      (e2:Event {uuid: 'event_15_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_3'}),
                      (e2:Event {uuid: 'event_15_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_4'}),
                      (e2:Event {uuid: 'event_15_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_5'}),
                      (e2:Event {uuid: 'event_15_7'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_15_6'}),
                      (e2:Event {uuid: 'event_15_7'})
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
