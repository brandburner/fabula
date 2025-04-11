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
        source_file: '/home/user/fabula/output/pre_processed/iclaudius_s01e08_graph.json',
        creation_timestamp: '2025-04-11T16:17:19.571013',
        version: '1.0'
    });
    
MERGE (a:Agent {uuid: 'agent_claudius'})
    ON CREATE SET
        a.name = 'Claudius',
        a.title = 'None',
        a.description = 'Claudius, in his private villa, is initially detached and dismissive when confronted by his wife Aelia, but the brutal events in Rome awaken a passionate moral outrage beneath his usual scholarly detachment. He is pragmatic and self-protective while also showing deep-seated moral sensitivity.',
        a.traits = ["Detached", "Reflective", "Moralistic", "Self-protective"],
        a.sphere_of_influence = 'Scholarship'
    ;
MERGE (a:Agent {uuid: 'agent_antonia'})
    ON CREATE SET
        a.name = 'Antonia',
        a.title = 'None',
        a.description = 'Antonia emerges as a fierce matriarch with a commanding presence. Burdened by family lineage and the betrayal within it, she defends her decisions with emotional depth and steadfast protection, displaying both authority and a complex inner life.',
        a.traits = ["Commanding", "Emotionally complex", "Unyielding", "Protective"],
        a.sphere_of_influence = 'Imperial household'
    ;
MERGE (a:Agent {uuid: 'agent_apicata'})
    ON CREATE SET
        a.name = 'Apicata',
        a.title = 'None',
        a.description = 'Apicata is remembered for her tragic final act. Once a desperate and justice-seeking mother, her suicide in reaction to the brutal purges becomes a poignant symbol of the human cost of Rome\'s ruthless political machinations.',
        a.traits = ["Bereaved", "Despairing", "Mother", "Victim of Circumstance"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_helen'})
    ON CREATE SET
        a.name = 'Helen',
        a.title = 'None',
        a.description = 'Helen is a vulnerable figure ensnared by the dangerous dynamics of the Imperial court. Constrained by her family ties and manipulated by the ambitions of others, she embodies the fragility of those caught in the allure and peril of power.',
        a.traits = ["Mentioned", "Target of Poisoning", "Daughter of Livilla", "Innocent", "Vulnerable"],
        a.sphere_of_influence = 'Imperial Family'
    ;
MERGE (a:Agent {uuid: 'agent_livilla'})
    ON CREATE SET
        a.name = 'Livilla',
        a.title = 'None',
        a.description = 'Livilla, though absent from direct action in the scene, looms large as a tragic figure whose ambition and betrayal have far-reaching familial consequences. Her manipulative and ambitious nature is tempered by the sense of being an innocent victim of her own desires.',
        a.traits = ["Ambitious", "Manipulative", "Tragic figure", "Innocent victim"],
        a.sphere_of_influence = 'Imperial family dynamics'
    ;
MERGE (a:Agent {uuid: 'agent_nero'})
    ON CREATE SET
        a.name = 'Nero',
        a.title = 'None',
        a.description = 'Nero is mentioned as Helen\'s intended fiancé whose prospects have been derailed by political affairs. Although his presence is only noted in conversation, he is portrayed as a politically significant pawn facing vulnerability amidst the intrigues of the state.',
        a.traits = ["Politically Significant", "Vulnerable", "Pawn", "Mentioned"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_sejanus'})
    ON CREATE SET
        a.name = 'Lucius Aelius Sejanus',
        a.title = 'None',
        a.description = 'Lucius Aelius Sejanus is the fallen Praetorian Prefect whose dramatic downfall is marked by a transformation from arrogance to desperate paternal concern. His tragic end and the brutal seizure of power serve as a stark commentary on the perilous nature of ambition in Rome.',
        a.traits = ["Fallen", "Desperate", "Fearful", "Paternal (in extremis)"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_castor'})
    ON CREATE SET
        a.name = 'Castor',
        a.title = 'None',
        a.description = 'Castor, the deceased son of Tiberius, is remembered as a loyal warning voice whose untimely death sparked the Emperor’s fury. His fate underscores the collateral damage of ambition and betrayal in the dangerous political climate of Rome.',
        a.traits = ["loyal", "insightful", "trusting", "victim", "warned Tiberius"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_tiberius'})
    ON CREATE SET
        a.name = 'Tiberius Claudius Nero Drusus Caesar',
        a.title = 'Emperor of Rome',
        a.description = 'Tiberius is an aging emperor ruled by paranoia and a sense of betrayal. Operating from a distance yet exerting absolute authority, he is determined to crush dissent, as evidenced by his ruthless decree against Sejanus and his associates.',
        a.traits = ["paranoid", "authoritative", "betrayed", "ruthless", "calculating", "imperial", "remote"],
        a.sphere_of_influence = 'Roman Empire'
    ;
MERGE (a:Agent {uuid: 'agent_thrasyllus'})
    ON CREATE SET
        a.name = 'Thrasyllus',
        a.title = 'None',
        a.description = 'Thrasyllus is a shrewd advisor to Emperor Tiberius, known for his inscrutable demeanor and dutiful counsel. His calm and unreadable expression reflects the subtle game of survival within the treacherous corridors of the Imperial court.',
        a.traits = ["Unreadable", "Wise (in Tiberius's view)", "Agreeable", "Advisor", "Courtier"],
        a.sphere_of_influence = 'Imperial Advice'
    ;
MERGE (a:Agent {uuid: 'agent_agrippina'})
    ON CREATE SET
        a.name = 'Agrippina',
        a.title = 'None',
        a.description = 'Agrippina is a fierce and defiant protector of her family’s legacy. Bold and cunning, she challenges tyranny head on and uses her intelligence to navigate and oppose the harsh realities of Imperial politics.',
        a.traits = ["Defiant", "Cunning", "Loyal", "Fearless"],
        a.sphere_of_influence = 'Imperial Politics'
    ;
MERGE (a:Agent {uuid: 'agent_attius'})
    ON CREATE SET
        a.name = 'Attius',
        a.title = 'Petitioner',
        a.description = 'Attius is an anxious and desperate petitioner seeking favor from Sejanus. His persistence and eagerness highlight both his dependence on imperial influence and the pervasive desperation of those caught in the upper echelons of Roman power struggles.',
        a.traits = ["anxious", "persistent", "eager", "submissive", "desperate"],
        a.sphere_of_influence = 'Civic Matters, Petitioning'
    ;
MERGE (a:Agent {uuid: 'agent_arria'})
    ON CREATE SET
        a.name = 'Arria',
        a.title = 'None',
        a.description = 'Arria, the young daughter of Sejanus, becomes an unwitting victim embroiled in the brutal purges of Roman politics. Her terrified pleas underscore the tragic collateral damage inflicted upon innocent families amidst the ruthless exercise of power.',
        a.traits = ["Innocent", "Terrified", "Youthful", "Victim"],
        a.sphere_of_influence = 'Innocent Observer'
    ;
MERGE (a:Agent {uuid: 'agent_junius'})
    ON CREATE SET
        a.name = 'Junius',
        a.title = 'Son of Sejanus',
        a.description = 'Junius is the thoughtful and cautious young son of Sejanus who, despite his tender age, exhibits sensitivity and an early awareness of the treacherous familial and political dynamics surrounding him.',
        a.traits = ["Cautious", "Inquisitive", "Sensitive", "Compliant"],
        a.sphere_of_influence = 'Innocent Observer'
    ;
MERGE (a:Agent {uuid: 'agent_slave'})
    ON CREATE SET
        a.name = 'Slave',
        a.title = 'None',
        a.description = 'The Slave is a minor yet functional character within the imperial household, acting as an obedient messenger and servant. This unnamed figure highlights the rigid social structure and the suppression of individual identity in the service of Roman authority.',
        a.traits = ["Unnamed", "Servant", "Informer", "Unwitting", "Loyal to Antonia"],
        a.sphere_of_influence = 'Domestic Service'
    ;
MERGE (a:Agent {uuid: 'agent_asinius_gallus'})
    ON CREATE SET
        a.name = 'Asinius Gallus',
        a.title = 'Senator',
        a.description = 'Asinius Gallus is a patrician senator known for his arrogance and intellectual inclination. Initially portrayed as confident and dismissive of opposing views while engaging in high-level discourse, his later arrest underscores his role as a significant dissenter and opponent of Sejanus’s regime.',
        a.traits = ["Arrogant", "Intellectually inclined", "Entitled", "Dismissing of opposing views", "arrested", "significant", "dissenter (implied)", "senator"],
        a.sphere_of_influence = 'Political and intellectual discourse'
    ;
MERGE (a:Agent {uuid: 'agent_quaestor'})
    ON CREATE SET
        a.name = 'Quaestor',
        a.title = 'Quaestor',
        a.description = 'The Quaestor is an official Roman Senate figure responsible for communicating the Emperor\'s decrees and maintaining order. He embodies the formal and authoritative tone of imperial governance, even as he remains unaware of the deeper repercussions of his actions.',
        a.traits = ["official", "authoritative", "formal", "impartial", "literate"],
        a.sphere_of_influence = 'Roman Senate'
    ;
MERGE (a:Agent {uuid: 'agent_drusus'})
    ON CREATE SET
        a.name = 'Drusus',
        a.title = 'None',
        a.description = 'Drusus, the son of Germanicus, is a young man caught in a desperate and unjust situation. Panicked and fearful, he pleads for recognition by both the Emperor and Sejanus, revealing his vulnerable and powerless state amid the brutal exercise of authority.',
        a.traits = ["Desperate", "Fearful", "Innocent (claims)", "Powerless"],
        a.sphere_of_influence = 'None'
    ;
MERGE (a:Agent {uuid: 'agent_macro'})
    ON CREATE SET
        a.name = 'Sertorius Macro',
        a.title = 'Praetorian Prefect',
        a.description = 'Sertorius Macro is the epitome of ruthless Roman efficiency. As Praetorian Prefect, he executes the Emperor’s orders with chilling pragmatism and cruelty, demonstrating a monstrous disregard for basic human dignity.',
        a.traits = ["Ruthless", "Pragmatic", "Cruel", "Authoritarian"],
        a.sphere_of_influence = 'Military Command'
    ;
MERGE (a:Agent {uuid: 'agent_guard_1'})
    ON CREATE SET
        a.name = 'Guard 1',
        a.title = 'Soldier',
        a.description = 'Guard 1 is an anonymous enforcer under Macro’s command, representing the faceless nature of Roman military enforcement. His obedience and compliance illustrate the routine implementation of cruel and brutal orders.',
        a.traits = ["Obedient", "Pragmatic", "Faceless", "Compliant"],
        a.sphere_of_influence = 'Military Enforcement'
    ;
MERGE (a:Agent {uuid: 'agent_caligula'})
    ON CREATE SET
        a.name = 'Caligula',
        a.title = 'None',
        a.description = 'Caligula, Tiberius’s grandson, is opportunistic and amoral. Feigning innocence while coldly exploiting political chaos for personal gain, he reveals a cynical and manipulative nature that is both detached and calculating.',
        a.traits = ["opportunistic", "amoral", "cynical", "manipulative", "pragmatic"],
        a.sphere_of_influence = 'Political Intrigue'
    ;
MERGE (a:Agent {uuid: 'agent_aelia'})
    ON CREATE SET
        a.name = 'Aelia',
        a.title = 'None',
        a.description = 'Aelia, wife to Claudius, enters the scene in a state of terror as she flees the violent political purges in Rome. Her raw fear and desperate pleas for survival reveal a self-serving instinct for self-preservation, even amidst personal and familial crisis.',
        a.traits = ["Terrified", "Panicked", "Desperate", "Self-serving"],
        a.sphere_of_influence = 'Personal Survival'
    ;
MERGE (a:Agent {uuid: 'agent_atticus'})
    ON CREATE SET
        a.name = 'Atticus',
        a.title = 'None',
        a.description = 'Atticus is a shrewd and pragmatic Roman publisher in his fifties, running a library and scriptorium. He balances a keen business acumen with an appreciation for literary works, while remaining obsequious towards his patrician clientele.',
        a.traits = ["shrewd", "pragmatic", "business-minded", "efficient", "obsequious"],
        a.sphere_of_influence = 'Roman publishing'
    ;
MERGE (a:Agent {uuid: 'agent_scribe_1'})
    ON CREATE SET
        a.name = 'Scribe 1',
        a.title = 'None',
        a.description = 'Scribe 1 works in Atticus\'s scriptorium, demonstrating diligence and artistic skill in calligraphy and illustration. His role, though subordinate, is crucial in the production of literary works and reflects the tension between creative expression and commercial demands.',
        a.traits = ["diligent", "skilled", "subordinate", "artistic", "compliant"],
        a.sphere_of_influence = 'scriptorium'
    ;
MERGE (a:Agent {uuid: 'agent_bystander_1'})
    ON CREATE SET
        a.name = 'Bystander',
        a.title = 'None',
        a.description = 'The Bystander is an unnamed individual present in the Senate chamber whose anxious inquiries reflect the general confusion and uncertainty of the Roman public amidst sudden political upheaval.',
        a.traits = ["curious", "anxious", "uninformed", "representative", "observant"],
        a.sphere_of_influence = 'Roman public'
    ;
MERGE (a:Agent {uuid: 'agent_senator_1'})
    ON CREATE SET
        a.name = 'Senator',
        a.title = 'Senator',
        a.description = 'This Senator embodies the self-serving and opportunistic nature of Roman politics. Focused on personal advantage amidst crisis, his brusque dismissal of others and quick pivot to align with power underscore the volatile loyalties within the Senate.',
        a.traits = ["pragmatic", "opportunistic", "self-serving", "decisive", "calculating"],
        a.sphere_of_influence = 'Roman Senate'
    ;
MERGE (a:Agent {uuid: 'agent_captain_of_the_guard_1'})
    ON CREATE SET
        a.name = 'Captain of the Guard 1',
        a.title = 'Captain of the Guard',
        a.description = 'Captain of the Guard 1 is charged with executing orders within the Senate, but his hesitance and brief moral conflict reveal an internal struggle between duty and personal conscience. Despite his subordinate position, he is emblematic of the human cost within the machinery of Roman power.',
        a.traits = ["Hesitant", "Duty-bound", "Conscientious (faintly)", "Subordinate"],
        a.sphere_of_influence = 'Military Enforcement'
    ;
MERGE (o:Object {uuid: 'object_vine_branch'})
    ON CREATE SET
        o.name = 'Vine Branch',
        o.description = 'A slender, flexible branch from a vine, often associated with cultivation and nature. In this context, it symbolizes punishment and the physical repercussions of disobedience.',
        o.purpose = 'Used as a tool for flogging, representing Tiberius\'s harshness.',
        o.significance = 'Serves as a symbol of Tiberius\'s authority and the cruelty that can accompany power; highlights the dangerous dynamics of fear and control within the Imperial court.'
    ;
MERGE (o:Object {uuid: 'object_documents'})
    ON CREATE SET
        o.name = 'Documents',
        o.description = 'Documents exchanged within the Assembly Hall representing petitions, requests, and possibly secret communications related to political and civic matters. They are tangible representations of bureaucratic processes and the channels of influence in the Roman palace.',
        o.purpose = 'To convey requests, petitions, and secret information.',
        o.significance = 'Symbolizes bureaucratic process and political intrigue.'
    ;
MERGE (o:Object {uuid: 'object_forged_letters'})
    ON CREATE SET
        o.name = 'Forged Letters',
        o.description = 'Letters that Drusus claims are forged and not actually written by him. They are incriminating documents purportedly used to frame him, symbolizing political manipulation and injustice.',
        o.purpose = 'To incriminate Drusus.',
        o.significance = 'Evidence of political manipulation and injustice, serving as a catalyst for Drusus’s arrest and the ensuing drama.'
    ;
MERGE (o:Object {uuid: 'object_message'})
    ON CREATE SET
        o.name = 'Message',
        o.description = 'An unspecified written message to be delivered by Macro on behalf of the Emperor, intended solely for Sejanus and carrying important directives concerning his political future.',
        o.purpose = 'To communicate the Emperor\'s request regarding Sejanus\'s position.',
        o.significance = 'Highlights the political dynamics at play and the personal ambitions of Sejanus.'
    ;
MERGE (o:Object {uuid: 'object_scroll'})
    ON CREATE SET
        o.name = 'Scroll',
        o.description = 'A crucial document in Tiberius\'s possession that contains evidence, as presented by Claudius, of a conspiracy involving Livilla, Sejanus, and the poisoning of Castor. It is designed as a weaponized document igniting Tiberius\'s fury.',
        o.purpose = 'To reveal evidence of conspiracy and treachery.',
        o.significance = 'Acts as a catalyst for the scene\'s dramatic tension, symbolizing truth and exposure in a world filled with deceit.'
    ;
MERGE (o:Object {uuid: 'object_history_of_carthage'})
    ON CREATE SET
        o.name = 'History of Carthage',
        o.description = 'A historical work written by Claudius about Carthage, complete with copies made. One copy is kept at his home and decorated with drawings of elephants. It is used as a cover for secretly sending incriminating letters to Tiberius.',
        o.purpose = 'To serve as a cover for sending secret letters to Tiberius.',
        o.significance = 'Represents Claudius\'s scholarly pursuits and is instrumental in conveying Antonia\'s secret message amidst political intrigue.'
    ;
MERGE (o:Object {uuid: 'object_history_of_carthage_elephants'})
    ON CREATE SET
        o.name = 'History of Carthage with elephants',
        o.description = 'A specific edition of the \'History of Carthage\' that includes exquisite illustrations of elephants. This version emphasizes artistic embellishment but was later deemed commercially unviable by Atticus.',
        o.purpose = 'Illustrated historical record.',
        o.significance = 'Highlights the conflict between artistic effort and commercial considerations in publishing.'
    ;
MERGE (o:Object {uuid: 'object_history_of_carthage_no_elephants'})
    ON CREATE SET
        o.name = 'History of Carthage without elephants',
        o.description = 'A revised edition of the \'History of Carthage\' from which the elephant illustrations have been removed, leaving only the bare text. This version is preferred for general sale due to its commercial viability.',
        o.purpose = 'Plain historical record.',
        o.significance = 'Represents commercial pragmatism in publishing by prioritizing textual content over decorative elements.'
    ;
MERGE (o:Object {uuid: 'object_essay_pollio_cicero'})
    ON CREATE SET
        o.name = 'Essay on Pollio and Cicero',
        o.description = 'An essay written by Asinius Gallus focusing on the figures of Pollio and Cicero, representing a detailed scholarly critique. Claudius’s disagreement with its conclusions underscores a dynamic intellectual discourse.',
        o.purpose = 'Scholarly essay and literary criticism.',
        o.significance = 'Represents intellectual discourse and differing scholarly opinions.'
    ;
MERGE (o:Object {uuid: 'object_letters_livillas_writing'})
    ON CREATE SET
        o.name = 'Letters in Livilla\'s Writing',
        o.description = 'Drafts of letters written by Livilla to Sejanus that reveal her plot to murder her husband Castor and her scheme to assassinate Emperor Tiberius. Discovered by Antonia, they expose Livilla\'s ambition and moral corruption.',
        o.purpose = 'To expose Livilla\'s treachery and murderous plots.',
        o.significance = 'Crucial evidence of Livilla\'s crimes and ambition; serves as a catalyst for Antonia\'s plan to inform Tiberius.'
    ;
MERGE (o:Object {uuid: 'object_scroll_for_letters'})
    ON CREATE SET
        o.name = 'Scroll for Letters',
        o.description = 'A scroll intended to carry the pasted-together pieces of Livilla\'s incriminating letters along with a cover letter from Antonia. It is designed to be concealed within Claudius\'s \'History of Carthage\' to secretly deliver evidence to Tiberius.',
        o.purpose = 'To secretly transport incriminating letters to Tiberius.',
        o.significance = 'Serves as a means of clandestine communication, symbolizing deception and hidden agendas.'
    ;
MERGE (o:Object {uuid: 'object_emperors_message'})
    ON CREATE SET
        o.name = 'Emperor\'s Message',
        o.description = 'The Emperor\'s Message is a letter from Tiberius, read aloud to the Senate by the Quaestor. Originating from Capri, it catalyzes the scene by revealing Tiberius\'s accusations against Sejanus and demanding his arrest.',
        o.purpose = 'To inform the Senate of Sejanus\'s betrayal and demand his arrest.',
        o.significance = 'Acts as a catalyst for action, symbolizing imperial authority and the devastating impact of Tiberius\'s decrees.'
    ;
MERGE (o:Object {uuid: 'object_list'})
    ON CREATE SET
        o.name = 'List',
        o.description = 'A roster of individuals condemned to execution, representing a systematic political purge. It embodies the dehumanizing and bureaucratic nature of state-sanctioned killings in the Roman Empire.',
        o.purpose = 'To enumerate individuals slated for execution.',
        o.significance = 'Symbolizes systematic political purge and dehumanization, reducing human lives to mere names.'
    ;
MERGE (o:Object {uuid: 'object_chains'})
    ON CREATE SET
        o.name = 'Chains',
        o.description = 'Heavy restraints used on Sejanus, serving both as a physical tool to render him immobile and a symbolic representation of his fall from grace and subjugation.',
        o.purpose = 'To restrain and incapacitate prisoners.',
        o.significance = 'Acts as a symbol of imprisonment, lost power, and the crushing nature of imperial authority.'
    ;
MERGE (l:Location {uuid: 'location_imperial_palace_study'})
    ON CREATE SET
        l.name = 'Imperial Palace - Study',
        l.description = 'A secluded study deep within the Imperial Palace, steeped in shadow with flickering torches and dust motes dancing in the oppressive air. The high-backed chair and stone walls evoke authority, secrets, and treachery.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_palace_drawing_room'})
    ON CREATE SET
        l.name = 'Palace Drawing Room',
        l.description = 'An ornate yet frigid drawing room located within the Imperial Palace. Decorated with sumptuous opulence that sharply contrasts a cold, emotional distance, the room serves as a stage for tense personal and familial confrontations amid imperial power.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_tiberius_study'})
    ON CREATE SET
        l.name = 'Tiberius\'s Study',
        l.description = 'A dimly lit, private chamber within the Imperial Palace designed for secluded contemplation and confidential discussions. Shadowed by oil lamps and austere Roman decor, it reflects Tiberius\'s scholarly inclinations and the gravity of imperial decision-making.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_roman_palace_assembly_hall_corridor'})
    ON CREATE SET
        l.name = 'Roman Palace - Assembly Hall/Corridor',
        l.description = 'A grand and bustling assembly hall and corridor within the Roman Palace used for political maneuvering. Filled with civic officials and conspirators, it is characterized by hushed urgency and a network of pathways that facilitate both public functions and clandestine meetings.',
        l.type = 'Hall/Corridor'
    ;
MERGE (l:Location {uuid: 'location_senate_chamber'})
    ON CREATE SET
        l.name = 'Senate Chamber',
        l.description = 'A grand hall within the Roman Palace that serves as the traditional meeting place for the Roman Senate. The space, steeped in history and formal proceedings, becomes a stage for dramatic revelations that shatter the illusion of stability in Rome.',
        l.type = 'Building'
    ;
MERGE (l:Location {uuid: 'location_corridor_outside_senate'})
    ON CREATE SET
        l.name = 'Corridor Outside Senate',
        l.description = 'A dimly lit, functional corridor located just outside the Senate Chamber within the Roman Palace. With cold stone walls and echoing acoustics, it serves as a transitional space marked by tension, brutal authority, and the suppression of dissent.',
        l.type = 'Corridor'
    ;
MERGE (l:Location {uuid: 'location_holding_cell'})
    ON CREATE SET
        l.name = 'Holding Cell',
        l.description = 'A small, confined holding cell off the corridor outside the Senate. Stark, unpleasant, and designed for temporary detention, the cell embodies isolation and dehumanization as a method of enforcing compliance.',
        l.type = 'Cell'
    ;
MERGE (l:Location {uuid: 'location_livillas_chambers'})
    ON CREATE SET
        l.name = 'Livilla\'s Chambers',
        l.description = 'A private space within the palace that mirrors Livilla’s inner turmoil. Charged with tension, it is characterized by a sense of confinement and emotional outburst, reflecting the personal dramas and political constraints of the Imperial Palace.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_atticus_library'})
    ON CREATE SET
        l.name = 'Atticus\'s Library',
        l.description = 'A cluttered, working library filled with the sound of rustling papyrus and scribes at work. The space, lined with scrolls and a separating counter for business interactions, reflects the practical and commercial aspects of book publishing in ancient Rome.',
        l.type = 'Library'
    ;
MERGE (l:Location {uuid: 'location_clandestine_chamber'})
    ON CREATE SET
        l.name = 'Clandestine Chamber',
        l.description = 'A dimly lit chamber that hosts secretive and oppressive political dealings. Heavy with tension and whispered conspiracies, the room encapsulates the hidden power struggles within the Imperial Palace.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_antonias_chambers'})
    ON CREATE SET
        l.name = 'Antonia\'s Chambers',
        l.description = 'A private space within the palace that reflects Antonia\'s regal bearing and sharp wit. Charged with anxiety and urgency, the chambers serve as a command center in a familial crisis amid opulent Roman decor.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_senate'})
    ON CREATE SET
        l.name = 'Senate',
        l.description = 'The governing body of Rome housed in a formal government building. Although only referenced, it represents the establishment of political power and acts as a stage for public decisions, decrees, and the display of imperial authority.',
        l.type = 'Government Building'
    ;
MERGE (l:Location {uuid: 'location_capri'})
    ON CREATE SET
        l.name = 'Capri',
        l.description = 'The island retreat of Emperor Tiberius, far removed from the chaos of Rome. Serving as a secluded imperial residence with controlled access by Sejanus, it embodies isolation, paranoia, and remote authoritative power.',
        l.type = 'Island'
    ;
MERGE (l:Location {uuid: 'location_livillas_room'})
    ON CREATE SET
        l.name = 'Livilla\'s Room',
        l.description = 'A room associated with Livilla that, though not directly seen, reveals hidden secrets through discarded drafts and evidence of treachery. Once a private space, its clearing out marks a symbolic exposure of deceit in the palace.',
        l.type = 'Room'
    ;
MERGE (l:Location {uuid: 'location_senate_steps'})
    ON CREATE SET
        l.name = 'Senate Steps',
        l.description = 'A traditionally revered public space that has become defiled and desecrated. Now strewn with bodies, the steps symbolize the collapse of Roman order and the brutal imposition of state-sanctioned violence.',
        l.type = 'Public Space'
    ;
MERGE (l:Location {uuid: 'location_tiberius_villa'})
    ON CREATE SET
        l.name = 'Tiberius\' Villa',
        l.description = 'A private and secluded imperial residence away from public view. Set in a daytime scene that contrasts with its dark undertones of betrayal and conspiracy, the villa serves as the secretive backdrop for critical power decisions.',
        l.type = 'Villa'
    ;
MERGE (l:Location {uuid: 'location_execution_ground'})
    ON CREATE SET
        l.name = 'Execution Ground',
        l.description = 'A grim and desolate public space situated near the Senate, marked by scattered bodies, blood-soaked earth, and an overwhelming atmosphere of mourning and terror. It stands as a visceral testament to state-sanctioned violence and brutal political purges.',
        l.type = 'Public Space'
    ;
MERGE (l:Location {uuid: 'location_claudius_villa'})
    ON CREATE SET
        l.name = 'Claudius\'s Villa',
        l.description = 'The private quarters of Claudius, intended as a sanctuary. However, its daytime calm is shattered by intrusions of public violence, transforming the villa into a stage where personal refuge intersects with the turmoil of external political strife.',
        l.type = 'Villa/Private Quarters'
    ;
MERGE (l:Location {uuid: 'location_rome'})
    ON CREATE SET
        l.name = 'Rome',
        l.description = 'The ancient city itself, portrayed as a theatre of terror and carnage. With executions occurring throughout—most notably on the desecrated Senate Steps—the city symbolizes the collapse of order, the brutality of governance, and profound moral decay.',
        l.type = 'City'
    ;
MERGE (o:Organization {uuid: 'org_vestal_virgins'})
    ON CREATE SET
        o.name = 'Vestal Virgins',
        o.description = 'A religious order of women in ancient Rome dedicated to Vesta, the goddess of the hearth. The Vestal Virgins were expected to remain celibate and uphold strict religious duties, symbolizing purity and the sacred fire of Rome. In the narrative, Livilla contrasts her own desire for marriage and sexual freedom with the austere, celibate life of a Vestal Virgin, underscoring her rejection of such an unnatural and restrictive existence.',
        o.sphere_of_influence = 'Roman Religion'
    ;
MERGE (o:Organization {uuid: 'org_sejanus_guards'})
    ON CREATE SET
        o.name = 'Sejanus\'s Guards',
        o.description = 'The Praetorian Guard regiment under the command of Sertorius Macro, Sejanus\'s Guards function as the brutal enforcers of Roman authority. Loyal to Macro and, by extension, Emperor Tiberius, they execute orders with ruthless efficiency. Their actions—such as restraining Arria and dragging Sejanus away—highlight their role as instruments of state terror, enforcing imperial will and suppressing dissent through violence.',
        o.sphere_of_influence = 'Military Enforcement, Political Control'
    ;
MERGE (o:Organization {uuid: 'org_senate_of_rome'})
    ON CREATE SET
        o.name = 'Senate of Rome',
        o.description = 'The Senate of Rome is the governing and advisory assembly composed of patrician nobles and senior magistrates. In the narrative, the Senate represents the traditional power structure of Rome, yet is shown to be subservient to the will of Emperor Tiberius. Its initial astonishment at Sejanus\'s betrayal gives way to obedience as it votes \'Aye!\' in support of the Emperor’s decree, reflecting its vulnerability to imperial power even in times of crisis.',
        o.sphere_of_influence = 'Roman governance and legislation'
    ;
MERGE (ep:Episode {uuid: 'episode_reign_of_terror'})
    ON CREATE SET
        ep.title = 'Reign of Terror',
        ep.description = '',
        ep.airdate = ''
    ;
MERGE (s:Scene {uuid: 'scene_1'})
    ON CREATE SET
        s.title = 'Accusation in the Shadows',
        s.description = 'In the dimly lit, oppressive study of the Imperial Palace, shadows cling to the stone walls, mirroring the secrets festering within. Torches flicker, casting dancing lights across the room, barely piercing the gloom that embodies Rome\'s fearful atmosphere under Tiberius\'s distant rule and Sejanus\'s growing power. Antonia, a woman hardened by Roman austerity and maternal pride, sits like a statue, her posture rigid with disapproval. Before her stands Apicata, a whirlwind of desperation, her pleas echoing the anxieties of countless Roman citizens caught in Sejanus\'s web. The air is thick with unspoken accusations and veiled threats as Apicata, stripped of her children and fueled by a mother\'s desperation, confronts the formidable Antonia, revealing a secret that could shatter the foundations of the Imperial family and expose the deadly ambition lurking within Livilla.',
        s.scene_number = 1
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_1_1'})
    ON CREATE SET
        e.title = 'A Mother\'s Desperate Plea',
        e.description = 'Apicata, distraught over Sejanus taking her children, implores Antonia for help. She believes Livilla, now Sejanus\'s lover, might persuade him to return the children, viewing them as obstacles to her ambitions. Apicata\'s raw emotional state contrasts sharply with the cold, formal setting of the Imperial study, highlighting the personal tragedies unfolding amidst political machinations. Her desperation underscores the ruthless nature of Sejanus, who uses children as pawns in his power games, and sets the stage for the shocking revelations to come.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["APICATA: Will you speak to her? Will you ask her to persuade him to let me have them? To her, they'll only be a nuisance. They'll come between him and her. I can understand that. But to me they are everything. Everything."]
    ;
MERGE (e:Event {uuid: 'event_1_2'})
    ON CREATE SET
        e.title = 'Antonia\'s Scornful Rejection',
        e.description = 'Antonia responds with cold disdain, expressing her deep contempt for Livilla, Sejanus, and Apicata herself. She rebuffs Apicata\'s plea, disgusted by what she sees as the moral decay of Rome, blaming people like Apicata for prioritizing personal gain over Roman virtues. Antonia\'s harsh words reveal her rigid moral code and her deep disappointment in her own daughter, Livilla. This initial rejection intensifies Apicata\'s desperation and forces her to escalate her tactics to gain Antonia\'s attention and leverage.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["ANTONIA: Understand this. That though my daughter has lived in my house since the death of her husband, we are not on friendly terms. I despise her though she is my daughter and I'll ask no favor of her. I despise that man I know to be her lover, and you too I despise for having married him knowing what he was. And now you complain because he treats you as were once content to see him treat others! You disgust me, all of you! You and people like you have made a sewer of Rome, fit only for rats to live in! Honor, service, duty mean nothing any more. Well, your children are everything to you? And what of Rome? All you are, you owe to Rome. But you've destroyed it, all of you, with your greedy ambition and your petty selfishness. Well, then enjoy what you've made of it, but don't come crying to me!"]
    ;
MERGE (e:Event {uuid: 'event_1_3'})
    ON CREATE SET
        e.title = 'The Murderous Revelation',
        e.description = 'Undeterred by Antonia\'s scorn, Apicata reveals a shocking secret: Livilla murdered her husband Castor with poison provided by Sejanus. She uses this devastating information as leverage, threatening to expose Livilla to Tiberius and ruin Antonia\'s family name if her children are not returned. Apicata\'s revelation is a dramatic turning point, shifting the scene from a plea for help to a tense confrontation based on blackmail and deadly secrets. The accusation hangs heavy in the air, forcing Antonia to confront the horrifying possibility of her daughter\'s treachery.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["APICATA: I didn't come here to talk of Rome, but of my children. Rome can sink. I want my children! And if you won't help me freely, then I must tell you of something, Lady, that may compel you. I told you I knew much and more besides. Well, here it is. Your daughter's husband died no natural death. Castor was murdered by your daughter. Sejanus supplied the poison but she fed it to him. Believe me, that guilty pair are set upon a course that would lead them to a kingly crown - they'll settle for nothing less. If I go to Tiberius with this story, what then becomes of your precious family name?"]
    ;
MERGE (e:Event {uuid: 'event_1_4'})
    ON CREATE SET
        e.title = 'Antonia\'s Disbelief and Inquiry',
        e.description = 'Antonia vehemently denies Apicata\'s accusation, demanding proof. Apicata claims she has slaves who will testify under questioning or torture. Antonia, now visibly shaken, questions why Apicata hasn\'t gone to Tiberius already. Apicata explains Sejanus controls access to the Emperor and going directly would be suicidal, with her last resort being Tiberius reading wills, something even Sejanus can\'t control. This exchange reveals the extent of Sejanus\'s power and the dangerous political landscape, forcing Antonia to consider the veracity of Apicata\'s claims and the potential ramifications for her family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["ANTONIA: You're lying.", "APICATA: No.", "ANTONIA: What proof have you?", "APICATA: Slaves that will talk freely, or under torture, of things seen and heard.", "ANTONIA: Then why haven't you been to the Emperor before?", "APICATA: Because Sejanus has the sorting of his mail and the sifting of his visitors, you should know that. To get to Tiberius would cost me my life and that's my last resort. Oh yes, he still reads people's wills when they leave everything to him. Not even Sejanus can prevent that. And if need be, that's the course I'll follow. Without my children, my life is nothing. Think carefully, Mark Antony's daughter. Guard your family name. Let the lovers have their crown, what is that to us? But get me back my children!"]
    ;
MERGE (e:Event {uuid: 'event_1_5'})
    ON CREATE SET
        e.title = 'Claudius\'s Dismissal and Cryptic Hints',
        e.description = 'After Apicata departs, Antonia turns to Claudius, who has been silently observing. Claudius dismisses Apicata\'s claims as demented, refusing to believe Livilla capable of murder, though he admits Livilla has done \'dreadful things\' before. When pressed by Antonia, he vaguely refers to Livilla\'s involvement in Postumus\'s banishment, revealing he knows more than he initially lets on and hinting at deeper family secrets.  His hesitant revelations plant seeds of doubt in Antonia\'s mind, contrasting with his initial denial and pushing her to investigate further.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["CLAUDIUS: Well, she certainly l-l-loves her children.", "ANTONIA: Oh, you fool! Is that all you can find to say?", "CLAUDIUS: No. What else do you w-want me to say?", "ANTONIA: Do you believe her?", "CLAUDIUS: N-n-no! Not a word of it. She's demented. Her mind's unhinged. Livilla's done some pretty d-dreadful things in her time, but I can't believe she'd do that.", "ANTONIA: What dreadful things?", "CLAUDIUS: Oh, uh, things. She connived at the b-banishment of Postumus. Ah, well, you know.", "ANTONIA: No, I didn't know. How? Why wasn't I told?", "CLAUDIUS: Well, it was all a s-secret. I'm the only one that knows. I think L-Livia m-m-made her do it.", "ANTONIA: And why was it a secret from me and not from you?", "CLAUDIUS: It's a l-l-long story, Mother."]
    ;
MERGE (s:Scene {uuid: 'scene_2'})
    ON CREATE SET
        s.title = 'Confrontation in the Drawing Room',
        s.description = 'In the opulent yet frigid drawing room of the palace, the contrast between sumptuous décor and the sharp edges of ambition is palpable. The air is thick with tension as HELEN, tearful and distraught, stands near her mother LIVILLA, who attempts to comfort her with a cold demeanor, revealing the distance forged by political necessity. As ANTONIA enters, her presence commands attention, shifting the focus from personal woes to the larger implications of familial loyalty and ambition. The dialogue reveals Helen\'s distress over her marriage prospects amidst the chaos of court machinations, while Antonia and Livilla engage in a fierce confrontation about love, ambition, and the sacrifices demanded by their political reality. The scene encapsulates the heavy burden of expectations placed on women within the imperial family, as Livilla\'s dreams of marrying Sejanus collide with the stark realities of her role in a treacherous environment. Themes of power, betrayal, and maternal loyalty permeate the interactions, setting the stage for the unfolding drama of ambition and its consequences.',
        s.scene_number = 2
    
    WITH s
    MATCH (l:Location {uuid: 'location_palace_drawing_room'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_2_1'})
    ON CREATE SET
        e.title = 'Helen\'s Despair',
        e.description = 'HELEN expresses her distress over their uncertain future, lamenting her thwarted marriage to Nero, embodying the personal turmoil amidst the political chaos. LIVILLA\'s response is cold, prioritizing state affairs over her daughter\'s feelings, which ignites the emotional tension in the room.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Well, what am I to do now?", "We shall find someone else for you to marry. Stop blubbering, child! Do you think the affairs of state must take account of your marriage plans?"]
    ;
MERGE (e:Event {uuid: 'event_2_2'})
    ON CREATE SET
        e.title = 'Antonia\'s Intervention',
        e.description = 'ANTONIA enters, questioning HELEN\'s priorities. She chastises her for thinking only of her own pleasures, urging her to pray for Nero\'s safety instead. This shift in focus underscores the stark contrast between personal desires and the larger political stakes at play.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["You'd do better to pray for his safety. Now, leave us. I want to talk to your mother."]
    ;
MERGE (e:Event {uuid: 'event_2_3'})
    ON CREATE SET
        e.title = 'Livilla\'s Bold Declaration',
        e.description = 'The tension escalates as ANTONIA confronts LIVILLA about her plans to marry AELIUS SEJANUS. LIVILLA defends her choice, insisting on her right to love and marry, while ANTONIA warns her of the dangers of her decision, illustrating the conflict between personal ambition and familial duty.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Is it true you intend to marry AELIUS SEJANUS?", "I am in love with him, Mother... and he with me."]
    ;
MERGE (e:Event {uuid: 'event_2_4'})
    ON CREATE SET
        e.title = 'Consequences of Ambition',
        e.description = 'ANTONIA warns LIVILLA that SEJANUS is using her, highlighting the ruthless nature of political ambition. This exchange reveals the complexities of loyalty, love, and betrayal, as ANTONIA implores her daughter to consider the implications of her actions on Sejanus\'s children and on their own family.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["He's using you.", "What do I care about his children?"]
    ;
MERGE (e:Event {uuid: 'event_2_5'})
    ON CREATE SET
        e.title = 'Apicata\'s Plea',
        e.description = 'In a pivotal moment, ANTONIA reveals that APICATA has sought her out regarding her children, urging LIVILLA to consider their plight. This revelation adds a layer of moral complexity to LIVILLA\'s decisions, suggesting the personal cost of ambition and the interconnectedness of their fates.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["She would like you to persuade Sejanus to let her have the children back."]
    ;
MERGE (s:Scene {uuid: 'scene_3'})
    ON CREATE SET
        s.title = 'The Emperor\'s Rejection',
        s.description = 'The dimly lit study of Tiberius, Emperor of Rome, is a space heavy with unspoken power dynamics. Ancient scrolls and imperial documents are scattered across a heavy wooden desk, hinting at the vast empire controlled from this room. Tiberius, aged and wary, sits in regal attire, his gaze fixed on Sejanus who stands respectfully before him. The air crackles with tension as Sejanus awaits the emperor\'s verdict on a matter of grave personal and political consequence – his request to marry Livilla. The emotional atmosphere is thick with veiled threats and suppressed ambition, as Tiberius, with calculated precision, delivers his refusal. This scene serves as a critical turning point, exposing the limits of Sejanus\'s influence and setting the stage for escalating conflict and intrigue within the Imperial family. The thematic undercurrents of power, control, and the illusion of favor permeate every interaction, underscoring the precarious nature of relationships in the Roman court.',
        s.scene_number = 3
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_3_1'})
    ON CREATE SET
        e.title = 'Marriage Proposal Denied',
        e.description = 'Tiberius, with cold detachment, informs Sejanus that he cannot permit him to marry Livilla. He meticulously explains his reasoning, cloaking his refusal in political pragmatism, stating that such a union would necessitate elevating Sejanus to an unacceptably high rank. Tiberius subtly implies that Livilla\'s ambition and the expectations of Roman society would inevitably lead to demands for Sejanus\'s further advancement, creating unwanted political pressure and envy. This rejection is a calculated blow to Sejanus\'s aspirations, highlighting the Emperor\'s firm control and suspicion of the Prefect\'s growing influence. The moment reveals Tiberius\'s manipulative nature, using feigned reason to mask his distrust and desire to maintain absolute power.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["TIBERIUS: I must tell you, I cannot allow you to marry Livilla.", "TIBERIUS: Such a marriage would compel me to raise you to the most exalted rank.", "TIBERIUS: Do you suppose that Livilla, once married to my son, would be content to grow old as the wife of a gentleman outside the Senate?"]
    ;
MERGE (e:Event {uuid: 'event_3_2'})
    ON CREATE SET
        e.title = 'A Hollow Counter-Offer: Helen\'s Hand',
        e.description = 'Attempting to soften the blow of his outright refusal, Tiberius proposes an alternative alliance: marriage to Livilla\'s daughter, Helen. This offer is presented as a compromise, seemingly beneficial to Sejanus by still offering a connection to the Imperial family, yet strategically limiting his ascent. Tiberius frames it as a way to avoid \'comment\' and maintain political stability. However, the proposal is thinly veiled manipulation, designed to appease Sejanus without granting him the dangerous level of influence marriage to Livilla would entail. The Emperor\'s suggestion reveals his cunning and his intent to keep Sejanus in check while maintaining the illusion of favor.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: Let me put another proposal to you. One that would excite less comment.", "TIBERIUS: Would you contemplate marriage with her?", "SEJANUS: With Helen?", "TIBERIUS: Why not? Such an alliance with my family would be much more acceptable to me. Well, think about it."]
    ;
MERGE (e:Event {uuid: 'event_3_3'})
    ON CREATE SET
        e.title = 'The Emperor\'s Marked List',
        e.description = 'Sejanus, though undoubtedly stung by the rejection, maintains a facade of subservience and presents Tiberius with a list of individuals seeking an audience.  He has subtly pre-selected and marked names he deems important for the Emperor\'s attention, showcasing his control over access to Tiberius and his continued influence within the court. This action underlines Sejanus\'s strategic mind and his awareness of the power he wields, even in the face of imperial disapproval. The list itself becomes a symbol of curated information and manipulated access, highlighting the insidious nature of power in Rome.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["SEJANUS: Um... I have the list here. I've marked the ones I think you should see. The rest are of no consequence.", "TIBERIUS: Well, those you've marked I'll see tomorrow. The rest you can send away."]
    ;
MERGE (e:Event {uuid: 'event_3_4'})
    ON CREATE SET
        e.title = 'Dismissal and Imminent Confrontation',
        e.description = 'Tiberius curtly dismisses Sejanus, indicating the audience is over and that Sejanus\'s presence is no longer required.  He then pointedly asks about Agrippina and expresses his willingness to see her immediately, while explicitly refusing to see Nero. This deliberate choice underscores the shift in focus and the impending confrontation with Agrippina. It highlights Tiberius\'s calculated manipulation of his court, pitting individuals against each other and setting the stage for further dramatic conflict. The dismissal leaves Sejanus sidelined and foreshadows the more significant and volatile encounter with Agrippina, promising a shift in the power dynamics within the palace.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["TIBERIUS: Well, you can deal with your problems yourself.", "SEJANUS: And Agrippina?", "TIBERIUS: I'll see her now.", "SEJANUS: I take it you have no wish to see Nero?", "TIBERIUS: None."]
    ;
MERGE (s:Scene {uuid: 'scene_4'})
    ON CREATE SET
        s.title = 'A Moment of Judgement',
        s.description = 'In the dimly lit expanse of Tiberius\'s study, the atmosphere is thick with tension and the weight of impending decisions. The room, adorned with heavy draperies and grand furnishings, serves as both a sanctuary and a prison for the Emperor, who remains seated with an air of authority veiled in uncertainty. Thrasyllus enters, his expression unreadable, and the silence between them speaks volumes. Tiberius\'s voice breaks the stillness, echoing off the stone walls as he questions the wisdom of his recent decisions regarding Sejanus and Livilla. The conversation unfolds with a veiled subtext of manipulation and survival, revealing Tiberius\'s fears of losing his grip on power. This scene encapsulates the intricate dance of loyalty and ambition that defines the political landscape of Rome, underscoring the fragile nature of alliances and the ruthless calculus that underpins Tiberius\'s rule.',
        s.scene_number = 4
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_4_1'})
    ON CREATE SET
        e.title = 'Tiberius Questions Thrasyllus',
        e.description = 'Tiberius, seated in the darkness of his study, seeks validation from Thrasyllus regarding his decision to deny Sejanus the marriage to Livilla. His tone reflects both authority and a hint of doubt as he asks, \'Well, Thrasyllus, was I wise to deny him marriage with Livilla?\' Thrasyllus responds affirmatively, reinforcing Tiberius\'s sense of control. The exchange hints at Tiberius\'s need for reassurance in a world where loyalty is fleeting and power is precarious.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Well, Thrasyllus, was I wise to deny him marriage with Livilla?", "Wise, Excellency."]
    ;
MERGE (e:Event {uuid: 'event_4_2'})
    ON CREATE SET
        e.title = 'Tiberius Offers a Bargain',
        e.description = 'As the conversation deepens, Tiberius reveals his decision to offer Sejanus the hand of Livilla\'s daughter instead, seeking Thrasyllus\'s insight on this alternative arrangement. This moment highlights Tiberius\'s cunning nature and his desire to manipulate the situation to maintain power. Thrasyllus’s response, \'He deserves it,\' reinforces the necessity of appeasing Sejanus, further illuminating the dark undercurrents of loyalty and ambition at play.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["And to offer him her daughter instead?", "He deserves it."]
    ;
MERGE (s:Scene {uuid: 'scene_5'})
    ON CREATE SET
        s.title = 'Exile Declared',
        s.description = 'In the shadowy confines of Tiberius\'s study, a tense confrontation unfolds between the aging Emperor and the defiant Agrippina. The room, heavy with the scent of power and decay, becomes the stage for a brutal verbal duel. Agrippina, eyes blazing, confronts Tiberius, accusing him of senility and of being a puppet to Sejanus. Tiberius, initially feigning mild amusement, reveals his iron fist as Agrippina\'s accusations strike a nerve. The emotional atmosphere shifts from charged defiance to chilling cruelty as Tiberius, cornered and enraged, unleashes his vindictive nature. He coldly announces Agrippina\'s exile to the desolate island of Pandateria, the same prison that once held her mother, and her son Nero\'s banishment to Ponza. The scene culminates in a stark display of imperial power as Tiberius, stung by Agrippina\'s final, scathing insult, demands a vine branch to flog the \'queen\', underscoring the absolute, merciless authority he wields and the tragic fate awaiting Agrippina and her family.',
        s.scene_number = 5
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_5_1'})
    ON CREATE SET
        e.title = 'Opening Salvos of Defiance',
        e.description = 'Agrippina is brought before Tiberius in his study, immediately launching into a scathing critique of his appearance and rule. She compares his reign to a farce, contrasting it sharply with the gravity of a Greek tragedy, setting a tone of open hostility and disrespect from the outset. Tiberius attempts to deflect her barbs with a dismissive remark about her dramatic flair, but the underlying tension is palpable.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["TIBERIUS: My dear, you look like a Greek tragedy.", "AGRIPPINA: And you look like a Roman farce."]
    ;
MERGE (e:Event {uuid: 'event_5_2'})
    ON CREATE SET
        e.title = 'Accusation of Ungratefulness and Lost Nobility',
        e.description = 'Tiberius warns Agrippina that her sharp tongue will have severe consequences. Agrippina retorts that it is not her words, but the people\'s love for her family, particularly Germanicus, that is the real issue. She pointedly reminds Tiberius that Germanicus, despite popular demand, remained loyal to Tiberius when Augustus died, implying Tiberius\'s ingratitude and lack of nobility compared to her late husband.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["TIBERIUS: That tongue of yours has cost you dear and will cost you dearer.", "AGRIPPINA: It's not my tongue that costs me dear, but the love people have for me and my family.", "TIBERIUS: And how you have used that love against me!", "AGRIPPINA: Against you? Germanicus could have led the armies of the Rhine against you, but he was too noble. They proclaimed him Emperor when Augustus died, but he said Rome already had an Emperor. More fool him!"]
    ;
MERGE (e:Event {uuid: 'event_5_3'})
    ON CREATE SET
        e.title = 'Senility Accusation and Succession Challenge',
        e.description = 'Tiberius, growing impatient, states that Agrippina\'s words only justify his actions against her. Agrippina escalates her attack, accusing Tiberius of senility and blindness to his own interests. She directly challenges his line of succession, arguing that only Germanicus\'s sons are fit to rule and questioning Tiberius\'s judgment.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["TIBERIUS: Every word you say makes my task easier.", "AGRIPPINA: Oh, don't pretend you ever found it hard to be vindictive. That you always were. But are you now so senile that you're blind to your own interests?", "TIBERIUS: I'm not so senile that I'm blind to yours.", "AGRIPPINA: You're an old man, Tiberius, and you'll die soon. Where can you look for a successor except to the sons of Germanicus?"]
    ;
MERGE (e:Event {uuid: 'event_5_4'})
    ON CREATE SET
        e.title = 'Succession Claim Dismissed and Sejanus\'s Shadow Looms',
        e.description = 'Tiberius asserts his right to choose his successor, mentioning Livilla\'s son Gemellus. Agrippina dismisses Gemellus as a mere child unfit to rule Rome, emphasizing that Rome needs strong men, not infants, to govern. She then delivers a devastating accusation, stating that Tiberius is not truly ruling, but is instead controlled by Sejanus, whom she depicts as a poisonous spider whispering in his ear, highlighting Sejanus\'s insidious influence and true power in Rome.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["TIBERIUS: I've a grandson of my own - Livilla's boy.", "AGRIPPINA: Gemellus is a child. Rome isn't Egypt. Children don't rule because their fathers ruled. Rome must be governed by men, not infants.", "TIBERIUS: I'll make my own arrangements, thank you!", "AGRIPPINA: You? Oh, you think you'll make them, but he'll make them. Sejanus - that black spider that sits on your shoulder squirting his poison in your ear. You think you rule in Rome? He rules in Rome! And the moment the last of my boys is dead, you'll know he rules in Rome."]
    ;
MERGE (e:Event {uuid: 'event_5_5'})
    ON CREATE SET
        e.title = 'Exile to the Islands of Despair',
        e.description = 'Tiberius, masking his rage with a chilling calmness, remarks on Agrippina\'s beauty when angry, using it as a cruel prelude to delivering his sentence. He announces her exile to Pandateria, the same island where her mother Julia was exiled, ironically naming it her \'kingdom\'. He also decrees Nero\'s exile to the even smaller island of Ponza, mocking their future as rulers of these desolate lands, and adding a final, taunting offer to visit them in their exile, twisting the knife of his cruelty.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["TIBERIUS: My dear, how pretty you look when you look angry. It makes me sad to have to send you away. But a queen must have a domain and I've chosen yours. Do you know where I'm going to send you? To the island of Pandateria, where Julia, your mother, spent so many years in exile. You will inherit her kingdom. That's only just. Your greatest wish will be fulfilled. You will be queen after all. As for Nero, I'm sending him to Ponza. An island even smaller than yours. You will have to think how to govern these mighty empires. If you're lonely, I could come and call on you."]
    ;
MERGE (e:Event {uuid: 'event_5_6'})
    ON CREATE SET
        e.title = 'Final Insult and Order for Flogging',
        e.description = 'In a final act of defiance, Agrippina spits a venomous insult, calling Tiberius \'blood-soaked mud\', encapsulating his tyrannical and cruel nature. Enraged beyond pretense, Tiberius drops his facade of calmness and, in a raw display of imperial power and vindictiveness, demands a vine branch to flog Agrippina, ending the scene with a brutal and shocking command, highlighting the absolute power and cruelty of his rule.',
        e.sequence_within_scene = 6,
        e.key_dialogue = ["AGRIPPINA: Blood-soaked mud you've been called and that's what you are.", "TIBERIUS: Bring me a vine branch! This queen needs flogging before she goes!"]
    ;
MERGE (s:Scene {uuid: 'scene_6'})
    ON CREATE SET
        s.title = 'Confrontation of Ambitions',
        s.description = 'In the grand assembly hall of the Roman palace, a sense of urgency permeates the air as civic officials and conspirators navigate the bustling space, exchanging whispered promises and secret petitions. The atmosphere is thick with the tension of unresolved ambitions. Sejanus, a sharp and ambitious Praetorian Prefect, enters, his demeanor carefully neutral as he addresses the anxious petitioner, Attius. The tension escalates as his children, Arria and Junius, rush to greet him, revealing a stark contrast between familial innocence and the dark political currents swirling around them. The scene shifts as Livilla, the ruthless Imperial Princess, enters and confronts Sejanus about a denied marriage proposal from Tiberius. Their conversation reveals the dangerous depths of their ambitions and the lengths they will go to achieve their desires, culminating in a heated exchange that exposes the fragility of their alliance and the treacherous game they play in the shadow of Tiberius\'s authority. The stakes are raised as Livilla’s fury erupts over the suggestion of marrying her daughter to Sejanus, highlighting the twisted nature of their ambitions and the potential for devastating betrayal.',
        s.scene_number = 6
    
    WITH s
    MATCH (l:Location {uuid: 'location_roman_palace_assembly_hall_corridor'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_6_1'})
    ON CREATE SET
        e.title = 'Sejanus Addresses Petitioners',
        e.description = 'Sejanus enters the assembly hall, greeted by a crowd filled with civic officials and conspirators. He addresses Attius, a nervous petitioner, asserting that all cases were discussed with the Emperor and that decisions will be communicated in due time. His firm demeanor establishes his authority and the expectations of the power dynamics at play.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Gentlemen, if you will leave your names with my secretary, all your requests will be considered. Excuse me.", "Every case was discussed. The Emperor's decision will be communicated to you in good time."]
    ;
MERGE (e:Event {uuid: 'event_6_2'})
    ON CREATE SET
        e.title = 'Family Reunion Interrupted',
        e.description = 'Sejanus\'s children, Arria and Junius, rush to greet him, highlighting the familial bonds strained by his political life. Their innocent questions about their mother reveal the emotional turmoil within the family dynamic as Sejanus\'s sharp response emphasizes his displeasure and the tension in balancing family responsibilities with political ambitions.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Father, Father, Father, you're back!", "I told you I didn't wish to discuss that again."]
    ;
MERGE (e:Event {uuid: 'event_6_3'})
    ON CREATE SET
        e.title = 'Livilla\'s Entrance and Confrontation',
        e.description = 'Livilla enters, smiling at Arria, and immediately shifts the atmosphere from familial warmth to political tension. She confronts Sejanus about Tiberius\'s refusal of their marriage proposal, revealing the stakes of their relationship. Their back-and-forth exposes the depth of their ambition and the precariousness of their alliance, culminating in a fierce argument over the prospect of marrying Livilla\'s daughter, Helen.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Did you ask him?", "You bastard! You bastard! I'll kill you! I'll kill you!"]
    ;
MERGE (e:Event {uuid: 'event_6_4'})
    ON CREATE SET
        e.title = 'The Proposal for Marriage',
        e.description = 'The confrontation escalates as Sejanus suggests a different marriage proposal with Livilla\'s daughter, Helen, as a means to secure their union. This proposal ignites Livilla\'s rage, leading to a brutal exchange of accusations and revealing the depths of their twisted ambitions and the moral compromises they are willing to make. Sejanus attempts to rationalize the situation, but Livilla\'s fury challenges his authority and unveils the fragility of their plan.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["If that is the only way we can be together, why not?", "You'll service us both then, will you, like a stallion?"]
    ;
MERGE (s:Scene {uuid: 'scene_7'})
    ON CREATE SET
        s.title = 'Senate\'s Stand Against Imperial Decree',
        s.description = 'Inside the imposing Senate Chamber, daylight filters through high windows, illuminating the stern faces of assembled senators. The air is thick with a palpable tension, a stark contrast to the usual procedural formality.  Marble pillars and statues loom over the chamber, witnesses to centuries of Roman power, now seemingly diminished and cowed. Gallus, his voice resonating with conviction, stands to address his peers, challenging the latest imperial decree emanating from Capri. His words cut through the silence, accusing the Emperor of demanding blind obedience and eroding the Senate\'s integrity. The emotional atmosphere is charged with a mixture of fear and simmering defiance. Senators murmur amongst themselves, caught between the instinct for self-preservation and a flicker of Roman pride. This scene is pivotal in highlighting the growing tyranny of Tiberius and the Senate\'s struggle to maintain any semblance of authority. It underscores the thematic conflict between imperial power and the crumbling institutions of the Republic, setting the stage for open rebellion or further subjugation.',
        s.scene_number = 7
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_7_1'})
    ON CREATE SET
        e.title = 'Gallus Challenges Imperial Authority',
        e.description = 'Gallus, a respected Senator, rises to address the assembled body, his voice ringing with indignation. He passionately denounces the Emperor Tiberius\'s latest demand for an arrest warrant – this time for Drusus Caesar, Agrippina’s second son. Gallus highlights the disturbing pattern of Tiberius issuing decrees from Capri without providing any supporting evidence or allowing the Senate to fulfill its duty of investigation. He pointedly criticizes the expectation that the Senate should merely rubber-stamp imperial wishes, likening it to the subservience of a \'compliant wife\'. Gallus firmly declares his refusal to blindly sign off on such demands, asserting his right and duty to scrutinize documents before giving his consent. His courageous stance directly confronts the Emperor\'s overreach and ignites a spark of defiance within the chamber, challenging the pervasive atmosphere of fear and compliance.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["GALLUS: Once again, the Emperor writes from Capri demanding yet another arrest! First it was the Lady Agrippina and her eldest son, Nero Caesar, and now it is her second son, Drusus Caesar.", "GALLUS: No documents are produced for the Senate to investigate. Only our consent is asked for. Our signature. Like that of some compliant wife.", "GALLUS: Senators, my signature is not to be had for the asking. I was brought up to read a document before I signed it. You may do as you please."]
    ;
MERGE (e:Event {uuid: 'event_7_2'})
    ON CREATE SET
        e.title = 'Vote on Drusus Caesar\'s Arrest Requested',
        e.description = 'Immediately following Gallus\'s defiant speech, the Quaestor, seated nearby, rises to counter the Senator\'s challenge and assert imperial authority.  Acting as the voice of the Emperor\'s will within the Senate, the Quaestor swiftly moves to neutralize Gallus\'s dissent and regain control of the proceedings.  In a formal and authoritative tone, the Quaestor calls for the question to be put to the Senate – a vote on the arrest of Drusus Caesar. This action directly confronts the senators with a crucial decision: either side with Gallus and uphold the Senate\'s integrity, risking the Emperor\'s wrath, or succumb to pressure and approve the arrest, further diminishing their own power and validating Tiberius\'s autocratic rule. The call for a vote immediately escalates the tension in the chamber, forcing the senators to publicly declare their allegiance and setting the stage for a potentially divisive and consequential decision.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["QUAESTOR: Senators, I ask that the question be put for the arrest of Drusus Caesar."]
    ;
MERGE (s:Scene {uuid: 'scene_8'})
    ON CREATE SET
        s.title = 'Desperation Behind Bars',
        s.description = 'In the shadowy confines of the corridor outside the Senate, the air is thick with tension as Drusus, the desperate son of Germanicus, is forcefully dragged by Macro, Sejanus\'s cold and efficient henchman, alongside guards. The corridor is dimly lit, echoing with the muffled sounds of political machinations happening nearby. Drusus\'s pleas ring out, a stark contrast to the impassive demeanor of his captors, as he implores them to let him see the Emperor, protesting that the letters implicating him are mere forgeries. The holding cell looms ahead, a grim reminder of the precariousness of power in Rome, where innocence is disregarded amidst treachery. This scene underscores the brutal reality of the political landscape, where familial ties are severed by ambition and desperation, and the voice of the accused is silenced. Themes of power, betrayal, and helplessness are palpably woven into the fabric of this moment.',
        s.scene_number = 8
    
    WITH s
    MATCH (l:Location {uuid: 'location_corridor_outside_senate'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_8_1'})
    ON CREATE SET
        e.title = 'Drusus\'s Plea for Freedom',
        e.description = 'Drusus is forcibly dragged by Macro and the guards toward a holding cell, his desperation palpable. He cries out to see the Emperor, protesting that the letters accusing him of treachery are not his own. His pleas reflect his helplessness in the face of overwhelming power, highlighting the brutality of the political system that has ensnared him. Macro, showing no mercy, orders the guards to silence him if he makes too much noise, revealing the callous disregard for Drusus\'s plight and the cold efficiency of the system designed to uphold Sejanus\'s ambitions. This moment emphasizes the theme of power dynamics and the often tragic consequences of political gamesmanship.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I must see the Emperor! Those letters were forged!", "They're not mine! Please! Let me see Sejanus, then! Please let me out! Please let me out!", "If he makes too much noise, go in and quieten him. Otherwise, you don't open the door.", "You don't."]
    ;
MERGE (s:Scene {uuid: 'scene_9'})
    ON CREATE SET
        s.title = 'A Worried Warning and an Unwanted Wife',
        s.description = 'In the dimly lit study of the Imperial Palace, lined with scrolls and busts that speak of intellectual pursuits, Claudius stands anxiously by the window, the weight of recent events heavy on his mind. Caligula enters with an air of careless nonchalance, shattering the quiet tension with his flippant demeanor. Their conversation reveals Caligula\'s chilling indifference to his brother\'s plight and his unsettling excitement about an invitation to Capri from Tiberius. The scene\'s atmosphere shifts dramatically with the unexpected arrival of Aelia, Claudius\'s estranged wife, who strides in with confidence and sharp words, highlighting the transactional and loveless nature of their marriage. Antonia\'s subsequent entrance adds another layer of familial complexity, her stern presence underscoring the strained relationships and simmering suspicions within the Imperial household. The scene functions to reveal character dynamics, expose Caligula\'s callous nature, and introduce the intrigue surrounding Aelia\'s visit and Helen\'s mysterious illness, setting the stage for further political and familial machinations.',
        s.scene_number = 9
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_9_1'})
    ON CREATE SET
        e.title = 'Claudius Warns Caligula of Danger',
        e.description = 'Claudius, visibly anxious, questions Caligula about his whereabouts and informs him of Drusus\'s arrest. He expresses concern for Caligula\'s safety, hinting at the danger posed by Tiberius. Caligula, however, remains disturbingly unconcerned about his brother\'s fate and seems more intrigued by the drama unfolding around him than worried about personal risk.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: C-Caligula. Where have you been?", "CALIGULA: Have you heard D-Drusus has been arrested?", "CLAUDIUS: Well, d-doesn't it worry you? After all, he's your brother.", "CALIGULA: Listen. Caligula. I think you're in grave danger.", "CLAUDIUS: Tiberius."]
    ;
MERGE (e:Event {uuid: 'event_9_2'})
    ON CREATE SET
        e.title = 'Caligula Reveals Invitation to Capri and Indifference to Family',
        e.description = 'Caligula dismisses Claudius\'s warning, revealing that Tiberius has invited him to Capri. He expresses excitement about the infamous rumors surrounding Tiberius\'s life there, showing a disturbing fascination with the Emperor\'s depravity. When Claudius urges him to speak up for his mother and brothers, Caligula callously admits he only cares about his mother, revealing a deep-seated indifference to his own family and a self-serving nature.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CALIGULA: No, I don't think so. He's invited me to Capri.", "CLAUDIUS: Are you going?", "CALIGULA: Well, of course I am. Everyone has such a marvelous time. The stories I've heard.", "CLAUDIUS: Listen, Cal.. Caligula, if you get the chance, you must s-speak up for them.", "CALIGULA: To tell you the truth, I couldn't give a damn about Drusus and Nero."]
    ;
MERGE (e:Event {uuid: 'event_9_3'})
    ON CREATE SET
        e.title = 'Aelia\'s Scornful Entrance and Purposeful Visit',
        e.description = 'Aelia arrives, her entrance announced by a Slave, and immediately confronts Claudius with sharp, dismissive remarks about their marriage and his unappealing nature. She reveals her true purpose for being at the palace is to see Livilla, using Claudius as a mere convenient stop in her visit. Her confident and cutting demeanor highlights the loveless and pragmatic arrangement of their marriage and her independent agenda.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["SLAVE: Your wife, the Lady Aelia is here.", "CLAUDIUS: My w-w-wife? What does she w-want?", "AELIA: Claudius. I heard you were in Rome. Why didn't you come and see me?", "AELIA: Oh, don't flatter yourself. It's to your advantage to be seen with me. You may be a member of the Imperial family but you're not every woman's ideal husband.", "AELIA: Oh, don't try and be clever with me. I came here to see your sister, and when I heard you were in Rome, I thought I'd let you know I was alive and well."]
    ;
MERGE (e:Event {uuid: 'event_9_4'})
    ON CREATE SET
        e.title = 'Antonia\'s Stern Interrogation and Suspicion of Sejanus',
        e.description = 'Antonia enters, interrupting the tense exchange between Claudius and Aelia. She expresses her suspicion of Aelia\'s motives for visiting Livilla, implying a distrust of both women and the current social norms. Claudius speculates that Sejanus might have sent Aelia to check on Helen. Antonia reveals her deep concern about Helen\'s unexplained illness and hints at a suspicion that Sejanus\'s interest in her granddaughter is not innocent, deepening the intrigue and foreshadowing potential danger.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["ANTONIA: Ahem!", "ANTONIA: Well, I should have been surprised if you'd called to see my son.", "ANTONIA: I find life very strange today. Those who are married live apart and those who aren't live together. It would seem that for the good of Rome, we should abolish marriage altogether.", "CLAUDIUS: Perhaps Sejanus sent her to find out how Helen was.", "ANTONIA: Am I to understand that man is now paying court to my granddaughter?", "ANTONIA: What is wrong with Helen? The doctors don't seem to know.", "ANTONIA: Oh, don't be so ridiculous. What do you know of women's complaints? The girl's been in bed for a week!"]
    ;
MERGE (s:Scene {uuid: 'scene_10'})
    ON CREATE SET
        s.title = 'Desperation and Demand',
        s.description = 'In the dimly lit confines of Livilla\'s chambers, tension crackles in the air like electricity. The opulent decor belies the chaos brewing within. Livilla paces back and forth, her anxious footsteps echoing off the marble walls, a reflection of her turbulent thoughts. Aelia enters, her demeanor a mix of concern and pragmatism. The atmosphere is laden with an undercurrent of urgency as Livilla hands Aelia a message, her voice charged with desperation. As they discuss the state of Livilla\'s daughter, Helen, the conversation quickly spirals into a fierce declaration of possessiveness over her former lover. Livilla’s refusal to relinquish her claim over Castor, despite the looming shadow of Tiberius and the societal constraints surrounding them, reveals the depths of her ambition and despair. The scene encapsulates the themes of familial loyalty, ambition, and the personal stakes intertwined with political maneuvers, underscoring the constant tension that defines their world. Outside, the Imperial Palace looms, a reminder of the power struggles that govern their lives.',
        s.scene_number = 10
    
    WITH s
    MATCH (l:Location {uuid: 'location_livillas_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_10_1'})
    ON CREATE SET
        e.title = 'Livilla\'s Urgent Plea',
        e.description = 'Livilla, visibly anxious, hands Aelia a message meant for Castor, instructing her to ensure its secrecy and destruction after reading. This moment highlights Livilla\'s desperation and the lengths she is willing to go to maintain control over her situation, revealing her emotional turmoil regarding her relationship with Castor and their daughter Helen.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["I want you to give him this. No one must see it, and tell him to destroy it when he's read it.", "How is Helen? Is she improving? What exactly is wrong with her? He's very anxious about her."]
    ;
MERGE (e:Event {uuid: 'event_10_2'})
    ON CREATE SET
        e.title = 'Aelia\'s Attempt to Reassure',
        e.description = 'Aelia inquires about Helen\'s condition, revealing her concern for both the child and Livilla. She attempts to reassure Livilla that Castor\'s feelings remain unchanged despite the marriage to Helen, highlighting the complexity of their relationships and the emotional stakes involved in the political machinations at play.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Oh, my dear, his feelings for you are unchanged, you must know that. His marriage to Helen is a marriage of convenience."]
    ;
MERGE (e:Event {uuid: 'event_10_3'})
    ON CREATE SET
        e.title = 'Livilla\'s Defiance',
        e.description = 'Livilla\'s frustration boils over as she declares her unwillingness to let Castor marry their daughter, demonstrating her fierce determination to reclaim what she believes is rightfully hers. This pivotal moment underscores her desperation and ambition, as she boldly demands Aelia convey her feelings to Castor.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["But he promised to marry me. Do you think I'm going to stand by and see him marry my daughter?", "Tell him not to forget that!"]
    ;
MERGE (e:Event {uuid: 'event_10_4'})
    ON CREATE SET
        e.title = 'Aelia\'s Pragmatic Insight',
        e.description = 'Aelia attempts to temper Livilla\'s fierce emotions by reminding her of the practical realities concerning Tiberius and Castor\'s marriage. Her words reveal the harsh truth of their world, where love is convoluted by political necessity and ambition.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["But if Tiberius...", "Men are different."]
    ;
MERGE (e:Event {uuid: 'event_10_5'})
    ON CREATE SET
        e.title = 'Livilla\'s Despair',
        e.description = 'Livilla reveals her emotional turmoil as she expresses her despair over the separation from Castor. This moment encapsulates the emotional stakes involved, highlighting her vulnerability amidst the ruthless politics of their world, and further deepening the audience\'s understanding of her character.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["It's driving me to despair! I can't bear this separation."]
    ;
MERGE (s:Scene {uuid: 'scene_11'})
    ON CREATE SET
        s.title = 'Elephants in Carthage',
        s.description = 'Claudius\'s study, filled with scrolls and the scent of old parchment, becomes a stage for a minor, yet telling, drama. Atticus, the ever-fussy librarian, bursts in, beaming with pride over his latest creation: a lavishly decorated copy of Claudius\'s history of Carthage. The air is thick with Atticus\'s self-importance and the rustle of papyrus, juxtaposed against Claudius\'s quiet scholarly demeanor. However, the mood quickly shifts as Claudius\'s polite interest turns to mild exasperation at the gaudy, elephant-themed embellishments. The scene\'s atmosphere transitions from lighthearted pedantry to a subtle intellectual sparring match, punctuated by Atticus\'s obliviousness and Claudius\'s dry wit. This seemingly trivial exchange underscores Claudius\'s serious scholarly aspirations against the superficiality of courtly tastes.  It highlights his understated intellect and the constant misunderstandings he faces, even in his own study. The arrival of Gallus then elevates the scene, shifting the tone towards intellectual camaraderie and a hint of political discourse, as Claudius is finally recognised for his intellectual pursuits, even if in a seemingly offhand manner.',
        s.scene_number = 11
    
    WITH s
    MATCH (l:Location {uuid: 'location_imperial_palace_study'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_11_1'})
    ON CREATE SET
        e.title = 'Ornate Elephants Displease Scholar',
        e.description = 'Atticus, brimming with self-satisfaction, presents Claudius with a beautifully transcribed and decorated copy of his \'History of Carthage\'. He emphasizes the exquisite lettering and fashionable ornamentation, particularly the elephant motifs, believing he has perfectly captured Claudius\'s taste. Claudius, initially polite, expresses his mild disapproval of the excessive decoration, deeming it inappropriate for a serious historical work. This reveals Claudius\'s desire for scholarly integrity over superficial aesthetics, contrasting with Atticus\'s focus on pleasing fashionable tastes. The moment underscores Claudius\'s intellectual seriousness being at odds with the frivolous expectations often placed upon him.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Hmmm, it's very good but I don't like all this decoration. It's far too ornate.", "ATTICUS: Oh, my dear sir, this decoration is fashionable. And, if I may say so, for a history of Carthage, what could be more apt than elephants?", "CLAUDIUS: Yea, But I didn't ask for elephants."]
    ;
MERGE (e:Event {uuid: 'event_11_2'})
    ON CREATE SET
        e.title = 'Client Confusion and Compromise',
        e.description = 'Atticus, flustered by Claudius\'s rejection of the elephants, attempts to justify his artistic choices, highlighting the \'motif\' and even playfully suggesting further embellishments involving Hannibal\'s mistresses. Claudius firmly dismisses these ideas, reiterating his desire for a serious, undecorated text.  Atticus, in a dramatic display of professional flexibility, declares elephants \'out\' and proposes a complete rework, but Claudius, pragmatically needing a copy immediately, concedes and agrees to accept one with elephants. This exchange humorously highlights Atticus\'s dramatic and somewhat superficial approach to his craft and Claudius\'s weary acceptance of the less-than-ideal circumstances.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["ATTICUS: Yes, I know you didn't ask for elephants, but knowing your superb good taste, naturally I thought you'd agree.", "CLAUDIUS: Well, I don't! This is a serious work. Just because I mention elephants into the text, why do we have to see them?", "ATTICUS: But it's a motif.", "CLAUDIUS: It's a d-damned s-silly motif! If I'd mention Hannibal's mistresses. I suppose you've drawn concubines all over the text too!", "ATTICUS: Well, if you don't like elephants...", "CLAUDIUS: No, I don't.", "ATTICUS: Very well. No more elephants. Elephants are out.", "CLAUDIUS: Well, I need one copy today. Very well I'll take one with elephants.", "ATTICUS: Are you quite sure?", "CLAUDIUS: Yes, yes, yes, I'm quite sure! Just g-get it for me!"]
    ;
MERGE (e:Event {uuid: 'event_11_3'})
    ON CREATE SET
        e.title = 'Gallus Arrives, Mistaken Identity, Intellectual Invitation',
        e.description = 'In a comedic turn, Atticus immediately mistakes the arriving Senator Gallus for a new client interested in the elephant-decorated Carthage history, demonstrating his commercial mindset and lack of understanding of social cues and Claudius\'s status. Gallus, however, is there for a genuine intellectual exchange with Claudius, inquiring about the \'History of Carthage\' and then pivoting to a discussion about his essay on Pollio and Cicero.  He invites Claudius to walk with him to the Senate to debate the essay, which Claudius accepts. This event shifts the scene from a lighthearted conflict about aesthetics to a moment of intellectual recognition for Claudius, finally engaging him in a serious discussion and acknowledging his scholarly mind, even if briefly before the political arena of the Senate calls.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["ATTICUS: Ah, my dear ASINIUS GALLUS, what a pleasure to see you. One History of Carthage with elephants. Our work for you is on time. Your copies will be ready in seven days.", "GALLUS: Good. Now, Claudius, what's this about a History of Carthage?", "CLAUDIUS: Yes, I'm having one copied.", "ATTICUS: Without elephants.", "CLAUDIUS: I'll send you a copy.", "GALLUS: Did you read my essay on Pollio and Cicero?", "CLAUDIUS: Yes. I didn't quite agree with it.", "GALLUS: Ah, well, walk with me to the Senate and tell me why not. Goodbye, Atticus.", "ATTICUS: Goodbye. You will erase all trace of elephants, leaving only the bare text. Ah, what a feast for his readers!"]
    ;
MERGE (s:Scene {uuid: 'scene_12'})
    ON CREATE SET
        s.title = 'A Race Against Time',
        s.description = 'In the cluttered sanctuary of Atticus\'s library, the air is thick with the smell of parchment and ink, as sunlight filters through the tall windows, casting patterns on the stone floor. Scrolls line the walls, their spines cracked from years of use, while scribes, hunched over their work, add to the symphony of rustling papyrus and scratching quills. Atticus, a shrewd Roman publisher, stands behind a wooden counter, overseeing his industrious scribes with a discerning eye. Claudius, awkward yet determined, waits impatiently, his scholarly demeanor at odds with the urgency of his request. The atmosphere shifts dramatically with the arrival of Asinius Gallus, a patrician whose arrogance fills the room as he engages in a brisk exchange with Claudius, revealing the competitive nature of intellectual pursuits in Rome. The tension between personal ambition and political maneuvering is palpable, underscoring the relentless drive for knowledge and favor in a world steeped in intrigue. This scene serves to highlight Claudius\'s struggle for recognition and the often-absurd barriers to the dissemination of knowledge in the imperial court, while also illustrating the dynamics of power and influence at play among Rome\'s elite.',
        s.scene_number = 12
    
    WITH s
    MATCH (l:Location {uuid: 'location_atticus_library'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_12_1'})
    ON CREATE SET
        e.title = 'Atticus Oversees Scribes',
        e.description = 'In the bustling atmosphere of Atticus\'s library, the shrewd publisher oversees his scribes, ensuring the meticulous work on scrolls is done to perfection. He instructs a scribe about the importance of meeting client expectations, emphasizing that if a client does not want elephants depicted, they will not force them into the edition. This moment illustrates Atticus\'s dedication to his craft and the pressures of the publishing business in ancient Rome.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["My dear fellow, these elephants are exquisitely drawn. But if a client does not like elephants, we shall force no elephants upon him. You will re-work the entire edition. The copies won't be ready in time, of course."]
    ;
MERGE (e:Event {uuid: 'event_12_2'})
    ON CREATE SET
        e.title = 'Claudius Demands a Copy',
        e.description = 'Claudius, feeling the pressure of time, insists that he needs one copy immediately, despite Atticus\'s concerns about the elephants. This moment captures Claudius\'s urgency and determination, setting the stakes higher as he navigates the complexities of scholarly work amidst the political machinations of Rome.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Well, I need one copy today. Very well I'll take one with elephants."]
    ;
MERGE (e:Event {uuid: 'event_12_3'})
    ON CREATE SET
        e.title = 'Gallus Enters the Library',
        e.description = 'As Atticus converses with Claudius, Asinius Gallus strides into the library, exuding an air of superiority. He greets Atticus and inquires about his history project, indicating the competitive nature of scholarly pursuits. This interaction reveals the hierarchy among Rome\'s intellectuals and sets the stage for further discourse.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Ah, my dear ASINIUS GALLUS, what a pleasure to see you.", "Good. Now, Claudius, what's this about a History of Carthage?"]
    ;
MERGE (e:Event {uuid: 'event_12_4'})
    ON CREATE SET
        e.title = 'Discussion of Pollio and Cicero',
        e.description = 'Gallus engages Claudius in a conversation about his essay on Pollio and Cicero, seeking validation for his intellectual pursuits. Claudius\'s disagreement showcases the tension between their differing viewpoints, emphasizing the competitive spirit among scholars in this era.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Did you read my essay on Pollio and Cicero?", "Yes. I didn't quite agree with it."]
    ;
MERGE (e:Event {uuid: 'event_12_5'})
    ON CREATE SET
        e.title = 'Gallus Invites Claudius to Walk',
        e.description = 'Gallus, eager to discuss his ideas further, invites Claudius to walk with him to the Senate, which signifies the intertwining of personal ambition with public duty. This invitation highlights the importance of intellectual discussions in the corridors of power, marking Claudius\'s reluctant acceptance as a pivotal moment in his journey.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["Ah, well, walk with me to the Senate and tell me why not."]
    ;
MERGE (s:Scene {uuid: 'scene_13'})
    ON CREATE SET
        s.title = 'Confession Under Duress',
        s.description = 'In the dimly lit clandestine chamber, the air hangs heavy with unspoken threats as Sejanus orchestrates his brutal interrogation. Claudius, present but powerless, attempts to deflect the rising tension with scholarly musings, but the chamber\'s true purpose is revealed when Macro, Sejanus\'s enforcer, steps forward to arrest Gallus. The atmosphere shifts from strained civility to overt coercion as Sejanus demands Gallus sign a fabricated confession, the scroll in his hand a symbol of manufactured guilt. Gallus, though outnumbered and threatened, stands firm, his refusal echoing in the confined space. His defiance escalates into a scathing indictment of Sejanus\'s character and the insidious nature of unchecked ambition, delivered with cutting intellectual scorn. The scene crackles with the raw tension between Gallus\'s unwavering integrity and Sejanus\'s ruthless determination to break him, highlighting the brutal tactics employed to consolidate power in Tiberius\'s Rome. The thematic undercurrent of corrupted justice and the fragility of truth permeates the chamber, underscored by the stark contrast between intellectual discourse and violent intimidation.',
        s.scene_number = 13
    
    WITH s
    MATCH (l:Location {uuid: 'location_clandestine_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_13_1'})
    ON CREATE SET
        e.title = 'Scholarly Pretense Amidst Rising Tension',
        e.description = 'In the dimly lit chamber, Claudius attempts to steer the conversation towards a detached intellectual discussion, comparing orators Pollio and Cicero, seemingly oblivious to the palpable tension in the room. Gallus, however, dismisses Cicero\'s oratory as pompous, their exchange a thin veil over the impending confrontation. This feigned normalcy highlights the precariousness of Gallus\'s situation, juxtaposed against Claudius\'s characteristic detachment and discomfort in the face of direct conflict.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: Gallus, I heard P-Pollio speak many times. He was a great orator, but he was no comparison with Cicero.", "GALLUS: Well, I'll have to say I think, as a fool, Cicero's speeches were pompous and contrived and he thought far too much of himself. And they must have sounded worse than they read."]
    ;
MERGE (e:Event {uuid: 'event_13_2'})
    ON CREATE SET
        e.title = 'The Warrant and the Arrest',
        e.description = 'Macro, Sejanus\'s ruthless enforcer, steps forward, shattering the pretense of civility. He produces a warrant, purportedly signed by Emperor Tiberius, for Gallus\'s arrest. The charge is revealed as inciting enmity between Tiberius and Sejanus, a fabricated accusation designed to silence dissent and consolidate Sejanus\'s power. Gallus, though surprised, questions the grounds for his arrest, but Macro\'s cold demeanor and the official warrant underscore the gravity of the situation and the futility of resistance.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["MACRO: Asinius Gallus? Lucius Asinius Gallus. I've a warrant signed by the Emperor for your arrest.", "GALLUS: My arrest? On what grounds?", "MACRO: Of inciting enmity between the Emperor and the commander of his guard, Lucius Aelius Sejanus.", "GALLUS: Is this a joke?", "MACRO: No joke."]
    ;
MERGE (e:Event {uuid: 'event_13_3'})
    ON CREATE SET
        e.title = 'Ominous Farewell and the Demand for Confession',
        e.description = 'As the reality of his arrest sinks in, Gallus directs a sardonic comment to Claudius, acknowledging the futility of intellectual pursuits in the face of tyranny. Sejanus then advances, presenting a scroll and demanding Gallus sign it. The scroll is revealed to be a confession, a tool of coercion intended to falsely implicate Gallus in a conspiracy with Drusus. This moment marks the shift from arrest to blatant manipulation, exposing Sejanus\'s intention to fabricate evidence and crush any opposition through deceit and force.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["GALLUS: Better hurry with your history of Carthage, Claudius. There'll soon be no one left to read it.", "SEJANUS: Sign it.", "GALLUS: What is it?", "SEJANUS: A confession.", "GALLUS: To what?", "SEJANUS: Your conspiracy with Drusus to subvert the armies of the Rhine."]
    ;
MERGE (e:Event {uuid: 'event_13_4'})
    ON CREATE SET
        e.title = 'Defiant Refusal and Scathing Indictment',
        e.description = 'Gallus vehemently refuses to sign the confession, recognizing it as a tool for Sejanus\'s political machinations. His defiance escalates into a powerful and eloquent condemnation of Sejanus\'s character, ambition, and corrupting influence. Gallus dissects Sejanus\'s rise to power, highlighting his lack of scruples and the destructive impact of small minds wielding immense ambition. He delivers a scathing critique of Roman society\'s vulnerability to such individuals, culminating in a deeply insulting and memorable analogy comparing Sejanus to \'putrefaction\' and a lack of \'sense of smell\' in mankind.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["GALLUS: Huh!", "SEJANUS: Sign it.", "GALLUS: You wrote it, you sign it.", "SEJANUS: Sign it. You will before we've finished with you.", "GALLUS: I'll sign nothing for you to produce after I'm dead. Bring me to trial or murder me and take the consequences.", "SEJANUS: There will be no trial. I have no need of a trial to prove your guilt.", "GALLUS: A song sung by every small-town corrupt policeman, which is what you are and what you should have stayed. I've watched your career with fascination, Sejanus. It's been a revelation to me. I never fully realized before how a small mind, allied to unlimited ambition, and without scruple can destroy a country full of clever men. I've seen how frail is the structure of a civilization before the onslaught of a gust of really bad breath!... Yes. But I suppose you're not really the destroyer. We must look elsewhere for that. You're merely the putrefaction that spreads after death - the outward and visible sign of its presence.... You're a lesson in history to me, Sejanus. Proving that above all.. mankind needs...its sense...of smell."]
    ;
MERGE (e:Event {uuid: 'event_13_5'})
    ON CREATE SET
        e.title = 'Renewed Coercion and Unresolved Fate',
        e.description = 'Enraged but not deterred by Gallus\'s defiance and insults, Sejanus coldly orders Macro to \'bring him round\', signaling a continuation of the brutal interrogation and the escalation of physical coercion. This abrupt ending leaves Gallus\'s fate unresolved within the scene, emphasizing Sejanus\'s unwavering ruthlessness and the perilous situation for those who dare to oppose him. The scene concludes on a note of chilling anticipation, implying further violence and highlighting the oppressive atmosphere of Sejanus\'s reign of terror.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["SEJANUS: Bring him round. We'll start again."]
    ;
MERGE (s:Scene {uuid: 'scene_14'})
    ON CREATE SET
        s.title = 'A Mother\'s Despair',
        s.description = 'In the opulent yet tense confines of Antonia\'s chambers, the regal matriarch paces anxiously, her sharp demeanor reflecting the turmoil within her. The sun filters through the window, casting long shadows that underscore the gravity of the revelations about to unfold. Claudius enters, visibly distressed, breaking the suffocating silence with news of Asinius Gallus\'s arrest, a harbinger of the chaos enveloping the palace. Antonia\'s commanding presence is palpable as she thrusts a stack of letters towards Claudius, urging him to read them. The atmosphere thickens with dread as he realizes the letters are written by Livilla, detailing a nefarious plot involving the poisoning of Castor and a conspiracy against Tiberius. Antonia’s fury and horror coalesce as she reveals that Livilla is also poisoning her own daughter, Helen, in her unrelenting pursuit of power. The stakes escalate when Antonia insists that Tiberius must be informed, despite the perilous nature of revealing Livilla’s treachery. Claudius, caught in a web of familial loyalty and fear, is torn between revealing the truth and the potential repercussions on their family. The emotional intensity crescendos as Antonia chastises Claudius for his scholarly pursuits, reminding him that in this world, the stakes are far greater than history books. This scene encapsulates the tragic intersection of family loyalty and the ruthless ambition that defines Roman politics, setting the stage for the dark choices that lie ahead.',
        s.scene_number = 14
    
    WITH s
    MATCH (l:Location {uuid: 'location_antonias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_14_1'})
    ON CREATE SET
        e.title = 'Claudius Brings Disturbing News',
        e.description = 'Claudius enters Antonia\'s chambers, visibly distressed by the news of Asinius Gallus\'s arrest on the steps of the Senate. His words hang in the air, a grim precursor to the revelations about to unfold. Antonia’s immediate reaction is one of urgency, as she commands Claudius to read the letters she has brought forth, each one dripping with the treachery of Livilla. As Claudius processes the implications of the news, the tension escalates, marking the beginning of their descent into the horrific reality of their family’s conspiracies.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS: They've arrested Asinius Gallus on the steps of the Senate.", "ANTONIA: Read this."]
    ;
MERGE (e:Event {uuid: 'event_14_2'})
    ON CREATE SET
        e.title = 'Revelation of Treachery',
        e.description = 'As Claudius reads the letters, a horrifying realization dawns upon him. Antonia reveals that Livilla and Apicata conspired to poison Castor, and now Livilla is urging her lover to assassinate Tiberius. The gravity of the situation weighs heavily on both of them as Antonia expresses her fury and betrayal, declaring Livilla monstrous for her actions. The emotional stakes rise as Claudius grapples with the horror that his family is embroiled in such dark plots, igniting a fierce determination in Antonia to act.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["ANTONIA: They poisoned Castor. Both of them.", "ANTONIA: She's poisoning Helen."]
    ;
MERGE (e:Event {uuid: 'event_14_3'})
    ON CREATE SET
        e.title = 'A Plan to Alert Tiberius',
        e.description = 'Antonia formulates a desperate plan to inform Tiberius of the conspiracy, revealing her sharp acumen in navigating the treacherous political landscape. Claudius, hesitant and fearful of the repercussions, is pressured by Antonia to seek permission from Sejanus to visit Tiberius at Capri under the guise of dedicating his work. The urgency of their situation is palpable as Antonia insists on crafting a letter to accompany the incriminating evidence, emphasizing that their only hope lies in unveiling Livilla\'s treachery before it\'s too late.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["ANTONIA: Tiberius must be told.", "CLAUDIUS: D-do you want people to know that your own daughter...?"]
    ;
MERGE (s:Scene {uuid: 'scene_15'})
    ON CREATE SET
        s.title = 'Bloody Aftermath on the Senate Steps',
        s.description = 'Daylight reveals a scene of brutal chaos outside the Senate. Overturned chariots lie scattered like discarded toys, testaments to the violent upheaval that has just transpired. The majestic steps of the Senate, usually symbols of Roman order and law, are now gruesomely stained with fresh blood, stark evidence of the terror unleashed. Panic still lingers in the air as terrified citizens scream and flee, desperately trying to escape the aftermath of the carnage. Amidst this pandemonium, the Emperor\'s Guard marches in with implacable resolve, their heavy footsteps echoing through the square as they assert control, their presence a chilling promise of the iron fist of Imperial authority descending upon the city. The scene is thick with the metallic scent of blood and the acrid tang of fear, a visceral tableau of the brutal cost of Roman ambition and political treachery.',
        s.scene_number = 15
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_steps'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_15_1'})
    ON CREATE SET
        e.title = 'Imperial Guard Seizes Control Amidst Terror',
        e.description = 'The scene is one of immediate aftermath. The once orderly Senate steps are now a landscape of disarray and terror. Overturned chariots and pools of fresh blood paint a grim picture of recent violence.  Roman citizens, gripped by fear, run screaming in all directions, desperately trying to escape the unfolding horror. Just as chaos threatens to consume the scene, the Emperor\'s Guard arrives, their disciplined ranks a stark contrast to the surrounding panic. They move with ruthless efficiency, their presence alone enough to instill a chilling order, asserting the Emperor\'s power in the wake of the bloodshed and solidifying the brutal reality of the new regime.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CLAUDIUS (O.S.): (muffled) Sshh!"]
    ;
MERGE (s:Scene {uuid: 'scene_16'})
    ON CREATE SET
        s.title = 'The Poisoned Chalice',
        s.description = 'In Tiberius\'s villa, a tense atmosphere carries the weight of betrayal and political intrigue. The room, dimly lit, is filled with the echoes of whispered secrets. Tiberius, furious and commanding, stands with a scroll in hand, revealing the treacherous plot against him by Livilla and Sejanus. Claudius, unshaven and visibly nervous, attempts to navigate the volatile exchange between Tiberius and Caligula, who exhibits a blend of arrogance and ambition. The air is thick with tension as accusations fly, unveiling the ruthless dynamics of power and the chilling reality of loyalty\'s fragility. As plans to purge Sejanus\'s influence take shape, the scene encapsulates the precarious balance of power within the imperial court, highlighting the depths of betrayal that will shatter familial ties. This moment serves as a catalyst for the impending chaos that will envelop Rome, revealing the characters\' ambitions and foreshadowing the bloodshed to come.',
        s.scene_number = 16
    
    WITH s
    MATCH (l:Location {uuid: 'location_tiberius_villa'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_16_1'})
    ON CREATE SET
        e.title = 'Tiberius Unleashes Accusations',
        e.description = 'Tiberius, filled with rage, confronts Caligula about the evidence Claudius has brought forth. He reveals that Livilla, Caligula\'s aunt, plotted to poison his son, showcasing the deep betrayal within their family. This revelation sets the tone for the impending conflict and highlights the treacherous nature of the court.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Your uncle has brought me evidence that my son was poisoned by his wife.", "Your mother's a very noble woman."]
    ;
MERGE (e:Event {uuid: 'event_16_2'})
    ON CREATE SET
        e.title = 'Caligula\'s Cynical Commentary',
        e.description = 'Caligula reacts to Tiberius\'s accusations with a mix of disdain and amusement, suggesting that he always suspected Livilla\'s treachery. This moment showcases Caligula\'s character as someone who thrives on the chaos and deception surrounding him, reinforcing the theme of betrayal within the imperial family.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Aunt Livilla? Whew! I always knew that woman was no good."]
    ;
MERGE (e:Event {uuid: 'event_16_3'})
    ON CREATE SET
        e.title = 'The Plan to Eliminate Sejanus Takes Shape',
        e.description = 'As Tiberius reveals the extent of Sejanus\'s betrayal, he contemplates how to arrest him, given Sejanus\'s control over the Guard. Claudius\'s inquiry into finding a trustworthy man adds to the tension, while Caligula suggests Sertorius Macro, emphasizing the ruthless pragmatism required to navigate these treacherous waters.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["The point is, how to arrest him.", "Isn't he loyal to Sejanus?", "Find a dog who'll eat a dog."]
    ;
MERGE (e:Event {uuid: 'event_16_4'})
    ON CREATE SET
        e.title = 'Tiberius\'s Dark Resolution',
        e.description = 'Tiberius\'s chilling declaration to purge the city reveals his intent to eliminate all threats, comparing the ensuing violence to the purging of Rome. This foreshadows the chaos that will ensue, illustrating the brutal lengths to which Tiberius is willing to go to secure his power amidst the growing threats.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["I will open Rome's bowels! The streets will run like a sewer!"]
    ;
MERGE (s:Scene {uuid: 'scene_17'})
    ON CREATE SET
        s.title = 'The Emperor\'s Ominous Summons',
        s.description = 'Daylight streams onto the steps of the Senate, casting long shadows as Macro approaches Sejanus. The air is thick with unspoken tension, despite the seemingly casual greeting. Sejanus, surrounded by his family and guards, anticipates a moment of triumph, believing the Emperor\'s message will confirm his ascension. Arria and Junius, Sejanus\'s children, are present, adding a layer of familial expectation to the scene. However, Macro\'s carefully chosen words and veiled demeanor hint at a darker undercurrent. The scene shifts from apparent formality to a chilling power play as Macro, with calculated precision, uses the Emperor\'s seal to command Sejanus\'s own guard, turning their loyalty against their master. The initial anticipation of good news transforms into a palpable sense of dread, signaling a dramatic turning point in Sejanus\'s fortunes and setting the stage for his imminent downfall. This public space, moments before buzzing with the promise of power, now vibrates with the threat of betrayal.',
        s.scene_number = 17
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_steps'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_17_1'})
    ON CREATE SET
        e.title = 'Macro\'s Arrival with a Deceptive Greeting',
        e.description = 'Macro, with a stern facade, approaches Sejanus at the Senate steps, offering a seemingly respectful hail. He claims to carry a message from Emperor Tiberius, immediately piquing Sejanus\'s interest and that of his entourage. Macro\'s arrival disrupts the scene\'s initial calm, introducing an element of uncertainty and anticipation. His words are carefully chosen, masking the true nature of his mission and creating a false sense of imperial favor.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["MACRO: Hail. Sejanus.", "SEJANUS: Macro, why are you here?", "MACRO: The Emperor sent me with a message for the Senate."]
    ;
MERGE (e:Event {uuid: 'event_17_2'})
    ON CREATE SET
        e.title = 'False Promise of Imperial Favor',
        e.description = 'Macro elaborates on the message, suggesting it contains Tiberius\'s request to appoint Sejanus as \'Protector of the City,\' a title implying he is the Emperor\'s chosen successor. This news, delivered in a public setting with Sejanus\'s family present, amplifies the dramatic irony as Sejanus and his children briefly entertain the illusion of triumph, unaware of the treachery about to unfold. Macro skillfully manipulates Sejanus\'s ambition, luring him deeper into the trap.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["SEJANUS: Where is the Emperor?", "MACRO: Waiting outside the city.", "SEJANUS: Why did he not send for me?", "MACRO: He could hardly ask you to deliver this. I believe it contains his request that you be made Protector of the City. Doesn't that mean his successor?", "SEJANUS: Then you had better deliver it. I'll see that you get my command.", "ARRIA: Why has Father gone inside? Why doesn't he wait for the Emperor?", "JUNIUS: Because he's obviously not coming. He never comes.", "ARRIA: What a shame. We may as well go home then."]
    ;
MERGE (e:Event {uuid: 'event_17_3'})
    ON CREATE SET
        e.title = 'Macro\'s Calculated Coup and Guard\'s Recoil',
        e.description = 'As Sejanus enters the Senate building, believing in his imminent promotion, Macro swiftly pivots to execute his true mission. He addresses the Captain of the Guard, producing the Emperor\'s seal – a symbol of unquestionable authority. Confirming its authenticity, Macro commands the Captain to withdraw the guard to barracks and await his further orders. This decisive action reveals Macro\'s betrayal and signals the abrupt collapse of Sejanus\'s power. The once loyal guards, now under Macro\'s command, begin to retreat, marking the final, crushing blow to Sejanus’s ambition and security.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["MACRO: Captain of the Guard! You recognize this seal?", "CAPTAIN OF THE GUARD 1 The Emperor's, sir.", "MACRO: Read it.", "CAPTAIN OF THE GUARD 1 Sir!", "MACRO: Take you guard back to the barrack. Inform all company commanders they are to remain in camp until I arrive.", "CAPTAIN OF THE GUARD 1 Sir! Guard!", "CAPTAIN OF THE GUARD 2 Forward!", "CAPTAIN OF THE GUARD 1 Change! Forward!"]
    ;
MERGE (s:Scene {uuid: 'scene_18'})
    ON CREATE SET
        s.title = 'The Emperor\'s Decree',
        s.description = 'In the stark and imposing Senate Chamber, a palpable tension hangs in the air as the Quaestor, with a grave demeanor, reads Emperor Tiberius\'s message to the gathered Senators. The chamber, adorned with the symbols of Roman authority, becomes a stage for the shocking revelations that will echo through the marble halls. Tiberius\'s words, laden with betrayal and urgency, unveil the dark conspiracy led by Sejanus, the very man he once trusted. As Senators exchange anxious glances, the atmosphere shifts from shock to a frantic call to action, embodying the chaotic underpinnings of political life in Rome. This scene not only marks the dramatic fall of Sejanus but also ignites a collective response from the Senate, underscoring the themes of betrayal, power, and the fragility of loyalty in the face of treachery.',
        s.scene_number = 18
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_chamber'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_18_1'})
    ON CREATE SET
        e.title = 'The Quaestor Reads the Emperor\'s Message',
        e.description = 'The Quaestor stands before the gathered Senate, reading Tiberius\'s message that reveals a devastating betrayal. Senators are stunned as they learn of Sejanus’s conspiracy to assassinate the Emperor. The gravity of the situation is palpable, as the Senate grapples with the implications of such treachery, marking a significant turning point in the political landscape of Rome.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["From the Emperor Tiberius to the Senate of Rome, greetings.", "Such is the advanced state of this plot to seize power that I, your Emperor, am marooned outside the city.", "I demand the arrest of Lucius Aelius Sejanus and all those connected with him."]
    ;
MERGE (e:Event {uuid: 'event_18_2'})
    ON CREATE SET
        e.title = 'Senate Unites Against Sejanus',
        e.description = 'As the gravity of the Emperor\'s words settle in, the atmosphere shifts dramatically. A bystander expresses his confusion, which leads to a senator\'s urgent declaration that Sejanus has fallen and must be arrested. The Senate, once hesitant, stands united in a resolute decision to follow the Emperor\'s command, signifying a collective shift of power.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["Sejanus has fallen. He's to be arrested. Now, come on, move out my way and let me pass.", "Aye!"]
    ;
MERGE (s:Scene {uuid: 'scene_19'})
    ON CREATE SET
        s.title = 'Senate Steps Secured',
        s.description = 'The grand marble steps of the Senate, usually bustling with the movement of senators and citizens, are now the domain of armed soldiers. The atmosphere is thick with tension, the bright daylight doing little to dispel the sense of foreboding that hangs heavy in the air.  The soldiers, clad in Roman military garb, march with purpose, their movements sharp and decisive, effectively cutting off any access to the Senate. This scene marks the immediate aftermath of Tiberius\'s decree against Sejanus, demonstrating the swift and brutal enforcement of imperial will and the palpable shift in power. The very stones seem to vibrate with suppressed fear as the military presence asserts absolute control, transforming a place of political debate into a stage for raw power.',
        s.scene_number = 19
    
    WITH s
    MATCH (l:Location {uuid: 'location_senate_steps'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_19_1'})
    ON CREATE SET
        e.title = 'Guards Mobilize on Senate Steps',
        e.description = 'A Captain of the Guard, his armor gleaming in the sunlight, strides purposefully towards the Senate steps, followed closely by a contingent of Roman soldiers. Their approach is not a casual patrol; it is a deliberate and forceful occupation of the space.  The Captain\'s command rings out, cutting through the tense silence, ordering his men to advance and secure the area. This action serves as a stark visual representation of the Emperor\'s authority being physically imposed, silencing any potential dissent and underlining the regime\'s iron grip. The soldiers\' advance is a clear message: the Senate is no longer a place of free discourse, but a territory under military control.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["CAPTAIN OF THE GUARD 2: Guard! Forward!"]
    ;
MERGE (s:Scene {uuid: 'scene_20'})
    ON CREATE SET
        s.title = 'The Descent into Despair',
        s.description = 'The scene unfolds on a grim, desolate execution ground that bears the weight of sorrow and fury. The atmosphere is heavy with the remnants of previous executions, marked by the haunting sight of lifeless bodies strewn about the dirt. Under a pallid sky, ARRIA, a young girl, struggles against the iron grip of the guards, her desperate cries for her father echoing in the stillness. The CAPTAIN OF THE GUARD 1 wrestles with his conscience, torn between duty and a flickering sense of morality. As MACRO, the ruthless Praetorian Prefect, arrives, the tension escalates; he embodies the cold, unyielding nature of power. The CAPTAIN’s reluctance to kill ARRIA, citing her virginity and the bad omen it represents, is met with MACRO’s chilling pragmatism. He commands the execution to proceed regardless of the girl’s innocence. SEJANUS, now a broken man in chains, is thrust into the scene, desperately seeking information about the missing children, only to be met with MACRO\'s brutal indifference. The screams of the innocent fill the air, a reminder of the chaos unfolding as lives are extinguished in the relentless pursuit of power. This scene starkly underscores the themes of innocence lost and the merciless nature of ambition, marking a moment of profound tragedy in the tapestry of Roman politics.',
        s.scene_number = 20
    
    WITH s
    MATCH (l:Location {uuid: 'location_execution_ground'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_20_1'})
    ON CREATE SET
        e.title = 'Arria\'s Desperation',
        e.description = 'The scene opens with ARRIA, a young girl, struggling against the guards who are restraining her. Her cries for her father pierce the heavy air, encapsulating the innocence being crushed in the face of tyranny. The CAPTAIN OF THE GUARD 1 expresses his inner turmoil, torn between his duty to execute the innocent and his moral compass, which protests against the act.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["You're hurting me! Father! Father!"]
    ;
MERGE (e:Event {uuid: 'event_20_2'})
    ON CREATE SET
        e.title = 'Macro\'s Command',
        e.description = 'MACRO arrives at the execution ground, exuding authority and ruthless pragmatism. He dismisses the CAPTAIN\'s concerns about ARRIA\'s virginity and the potential bad luck that comes with executing a virgin. His commands are stark and unyielding, pushing the guards to carry out the execution regardless of moral implications.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["They're on the list. Now, get on with it.", "Well, make sure she's not a virgin before you kill her."]
    ;
MERGE (e:Event {uuid: 'event_20_3'})
    ON CREATE SET
        e.title = 'Sejanus\'s Plea',
        e.description = 'SEJANUS, now in chains, is brought forward to the execution ground. His desperation is palpable as he inquires about the missing children, revealing his broken spirit. MACRO\'s response is cold and dismissive, indicating that Sejanus\'s downfall has left him powerless and alone, a stark contrast to his once-mighty position.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Macro, what have they done with the children?", "They've gone on ahead of you, my friend."]
    ;
MERGE (s:Scene {uuid: 'scene_21'})
    ON CREATE SET
        s.title = 'A Mother\'s Unyielding Sentence',
        s.description = 'Antonia\'s chambers are stark and dimly lit, reflecting the grim purpose they now serve as Livilla\'s prison.  The heavy door muffles Livilla\'s desperate cries from within, her pleas for release echoing through the austere space. Antonia sits motionless, an impassive statue of grief and resolve, as Claudius bursts in, his face etched with distress. The air is thick with unspoken sorrow and the chilling weight of Antonia\'s judgment. This scene serves as the devastating climax of Livilla\'s treachery, highlighting the brutal consequences of ambition and the agonizing choices faced by Antonia. It underscores the themes of justice versus mercy, and the crushing burden of familial duty in the corrupt world of Imperial Rome. The scene is a tableau of despair, emphasizing the irreversible nature of Antonia\'s decision and the tragic fate of Livilla.',
        s.scene_number = 21
    
    WITH s
    MATCH (l:Location {uuid: 'location_antonias_chambers'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_21_1'})
    ON CREATE SET
        e.title = 'Livilla\'s Imprisoned Despair',
        e.description = 'Livilla is heard from behind a locked door, her voice filled with rising panic and desperation. She repeatedly screams for her mother to release her, the cries echoing the claustrophobia and finality of her imprisonment. This event immediately establishes Livilla\'s dire situation and sets a tone of intense emotional distress for the scene. It highlights the consequence of her actions and the inescapable nature of Antonia\'s judgment.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["LIVILLA (O.S.): Mother! Let me out! Let me out! Let me out! Let me out! Let me out!"]
    ;
MERGE (e:Event {uuid: 'event_21_2'})
    ON CREATE SET
        e.title = 'Claudius\'s Distraught Plea',
        e.description = 'Claudius enters Antonia\'s chambers in a state of agitation, visibly upset by Livilla\'s confinement and Antonia\'s cold demeanor. He questions Antonia with a stammering urgency, demanding to know her intentions and pleading for Livilla\'s release. Claudius\'s distress underscores his compassionate nature and his inability to comprehend the extremity of Antonia\'s justice. His entrance injects a dynamic conflict into the scene, contrasting with Antonia\'s static resolve and Livilla\'s unseen panic.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["CLAUDIUS: What are you doing? What are you going to d-do with her? For heaven's sake, let her out! How long are you going to leave her in there?"]
    ;
MERGE (e:Event {uuid: 'event_21_3'})
    ON CREATE SET
        e.title = 'Antonia\'s Death Sentence Declared',
        e.description = 'Antonia, with chilling calmness, reveals her devastating sentence: Livilla will remain imprisoned until she dies. Her words are delivered with an impassive finality that silences Claudius\'s protests. Antonia explains that this is Livilla\'s \'punishment\' and her own \'burden\' to bear, as she will remain outside the door, listening to her daughter\'s demise. This moment is the scene\'s dramatic core, exposing the full extent of Antonia\'s wrath and the tragic consequences of Livilla\'s actions. It showcases the brutal inflexibility of Roman justice and the agonizing personal cost for Antonia herself.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["ANTONIA: Until she dies.", "CLAUDIUS: Dies? Dies? Have you gone mad? She's your daughter. How can you leave her to die?", "ANTONIA: That's her punishment.", "CLAUDIUS: But how can bear to sit out here and listen to her?", "ANTONIA: And that's mine. Leave me, Claudius. I shan't move from here until they open that door and find her dead. Leave me.", "CLAUDIUS: Oh, no... No... No!"]
    ;
MERGE (s:Scene {uuid: 'scene_22'})
    ON CREATE SET
        s.title = 'Descent into Chaos',
        s.description = 'The scene unfolds in the private quarters of Claudius\'s villa, a stark contrast to the chaos erupting outside. Aelia bursts in, her voice laced with terror as she reveals the brutal executions taking place across Rome. The once serene and domestic space becomes a claustrophobic prison of fear, with Aelia\'s desperation echoing off the walls. Claudius, initially shocked, is drawn into the horror of the situation as Aelia recounts the horrific fate of Sejanus\'s children and the widespread violence gripping the city. The emotional atmosphere escalates from panic to intense despair as Aelia implores Claudius for help, only to be met with his cold rejection. The weight of their marital discord is compounded by the external chaos, highlighting the fragility of alliances and the dire consequences of political machinations. This scene serves as a pivotal moment, underscoring the devastation wrought by ambition and betrayal, and Claudius’s awakening realization of the perilous stakes surrounding him.',
        s.scene_number = 22
    
    WITH s
    MATCH (l:Location {uuid: 'location_claudius_villa'})
    MERGE (s)-[:LOCATED_IN]->(l)
    ;
MERGE (e:Event {uuid: 'event_22_1'})
    ON CREATE SET
        e.title = 'Aelia\'s Frantic Plea for Help',
        e.description = 'Aelia bursts into Claudius\'s private quarters, frantically pleading for his help amidst reports of widespread executions. Her terror reveals the brutal reality of the political upheaval, as she recounts the horrific fate of the children associated with Sejanus. Aelia’s desperate plea highlights her vulnerability and the immediate threat posed to her life, underscoring the chaos enveloping Rome.',
        e.sequence_within_scene = 1,
        e.key_dialogue = ["Claudius! Claudius! Claudius! Oh, Claudius! Claudius, help me. They're killing everyone!", "Save me, Claudius! Save me! I'll do anything. Anything, Claudius.", "Executions are taking place all over the city. The Senate steps are strewn with bodies."]
    ;
MERGE (e:Event {uuid: 'event_22_2'})
    ON CREATE SET
        e.title = 'Claudius\'s Shock and Horror',
        e.description = 'Claudius reacts with disbelief and horror as Aelia informs him about the atrocities occurring in Rome, including the murder of children. His emotional response reveals the gravity of the situation, as he realizes the extent of the violence gripping the city. This moment marks a turning point for Claudius, as he transitions from a passive observer to an unwilling participant in the political turmoil.',
        e.sequence_within_scene = 2,
        e.key_dialogue = ["His children?", "Rome... Rome, you are finished! Finished! You are despicable! Despicable!"]
    ;
MERGE (e:Event {uuid: 'event_22_3'})
    ON CREATE SET
        e.title = 'Aelia’s Desperation Intensifies',
        e.description = 'Aelia\'s pleas grow more frantic as she continues to implore Claudius for protection, revealing her fear of being taken and killed like others. This moment underscores the personal stakes involved in the political chaos, as Claudius\'s emotional detachment becomes evident. Aelia\'s desperation contrasts sharply with Claudius\'s cold rejection, heightening the tension between them.',
        e.sequence_within_scene = 3,
        e.key_dialogue = ["Oh, Claudius, please, Claudius. Help me!", "No, Claudius!", "Save me, Claudius."]
    ;
MERGE (e:Event {uuid: 'event_22_4'})
    ON CREATE SET
        e.title = 'Claudius\'s Rejection of Aelia',
        e.description = 'In a moment of emotional turmoil, Claudius rejects Aelia\'s pleas for help, demanding she leave him. This rejection marks a significant moment in their relationship, signifying both Claudius’s growing awareness of the dangers surrounding him and his unwillingness to engage further in the chaos. The emotional intensity peaks as Aelia\'s vulnerability is met with Claudius\'s harsh resolve, encapsulating the tragic consequences of their intertwined fates.',
        e.sequence_within_scene = 4,
        e.key_dialogue = ["Oh, get out of my life!", "No, no! Go away! I never want to see you again!"]
    ;
MERGE (e:Event {uuid: 'event_22_5'})
    ON CREATE SET
        e.title = 'Claudius Reflects on His Alliance',
        e.description = 'In a voiceover, Claudius reflects on the implications of his marriage to Aelia and the dangers that come with his alliance to Sejanus’s family. This moment of introspection reveals his evolving perspective on loyalty and survival in the treacherous political landscape, culminating in a decisive acknowledgment of his ability to sever ties. Claudius’s thoughts illustrate the gravity of the situation and his determination to navigate the perilous waters of Roman politics.',
        e.sequence_within_scene = 5,
        e.key_dialogue = ["My alliance by marriage with Sejanus' family might have cost me my life...", "I was now allowed to divorce Aelia and to return an eighth part of her dowry."]
    ;
MATCH (a:Agent {uuid: 'agent_macro'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guard_1'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_captain_of_the_guard_1'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (o:Object {uuid: 'object_vine_branch'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_message'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scroll'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_history_of_carthage'}),
          (a:Agent {uuid: 'agent_claudius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_essay_pollio_cicero'}),
          (a:Agent {uuid: 'agent_gallus'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_letters_livillas_writing'}),
          (a:Agent {uuid: 'agent_livilla'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_scroll_for_letters'}),
          (a:Agent {uuid: 'agent_antonia'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_emperors_message'}),
          (a:Agent {uuid: 'agent_tiberius'})
    MERGE (a)-[:OWNS]->(o);
MATCH (o:Object {uuid: 'object_list'}),
          (a:Agent {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:OWNS]->(o);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_captain_of_the_guard_1'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MATCH (a:Agent {uuid: 'agent_guard_1'}),
          (o:Organization {uuid: 'org_sejanus_guards'})
    MERGE (a)-[:AFFILIATED_WITH]->(o);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Apicata stands before Antonia, her posture tense and fragile, her hands wringing in desperation. She paces slightly, unable to contain her anguish, her voice trembling as she pleads for the return of her children, her entire being radiating urgency and fear.',
        ap.emotional_state = 'Apicata is outwardly consumed by despair and desperation, her eyes wide with fear and intensity. Beneath this veneer, however, is an undercurrent of fierce resolve; her protective instincts for her children drive her to confront Antonia even at great personal risk. The weight of her desperation creates a palpable tension as she navigates the precarious balance of appealing to Antonia\'s maternal instincts.',
        ap.emotional_tags = ["apicata is outwardly consumed by despair", "desperation, her eyes wide with fear", "intensity. beneath this veneer, however, is an undercurrent of fierce resolve; her protective instincts for her children drive her to confront antonia even at great personal risk. the weight of her desperation creates a palpable tension as she navigates the precarious balance of appealing to antonia's maternal instincts.", "apicata is outwardly consumed by despair and desperation", "her eyes wide with fear and intensity. beneath this veneer", "however", "is an undercurrent of fierce resolve; her protective instincts for her children drive her to confront antonia even at great personal risk. the weight of her desperation creates a palpable tension as she navigates the precarious balance of appealing to antonia's maternal instincts.", "apicata is outwardly consumed by despair and desperation, her eyes wide with fear and intensity. beneath this veneer, however, is an undercurrent of fierce resolve", "her protective instincts for her children drive her to confront antonia even at great personal risk. the weight of her desperation creates a palpable tension as she navigates the precarious balance of appealing to antonia's maternal instincts."],
        ap.active_plans = ["To persuade Antonia to intervene with Livilla on her behalf to reclaim her children from Sejanus.", "To reveal the dark truth about Livilla\u2019s role in Castor's death, leveraging this information to compel Antonia's action.", "To prepare for the possibility of confronting Tiberius directly if Antonia refuses to help, showing her desperation to reclaim her children."],
        ap.beliefs = ["Her children are her entire world, and their safety supersedes all else, including her own life.", "The political games of Rome are secondary to the maternal bond and the need for justice regarding her children's fate.", "Livilla's ambitions are a direct threat not just to her children, but to the moral fabric of their family, highlighting her belief in loyalty and familial duty."],
        ap.goals = ["Short-term: To convince Antonia to speak to Livilla and advocate for the return of her children.", "Medium-term: To gather enough support and evidence to confront Tiberius about the dangers posed by Sejanus and Livilla.", "Ultimate: To ensure the safety and well-being of her children, restoring her family, even if it means exposing deep-seated treachery."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'})
    ON CREATE SET
        ap.current_status = 'Antonia sits rigidly in a high-backed chair, her posture reflecting authority yet burdened by worry. She leans forward at times, her expression hardening in disdain as she listens to Apicata’s desperate pleas. Her gestures are sharp and dismissive, reflecting her contempt for the situation and those involved.',
        ap.emotional_state = 'Antonia’s surface emotions are a mixture of disdain and frustration, her brow furrowed as she reacts to Apicata’s plea. Internally, she grapples with her conflicting feelings toward her daughter Livilla and the situation’s implications for her family\'s honor. She feels trapped between maternal loyalty to her daughter and the moral outrage towards the betrayal that has unfolded, igniting a storm of discontent within her.',
        ap.emotional_tags = ["antonia\u2019s surface emotions are a mixture of disdain", "frustration, her brow furrowed as she reacts to apicata\u2019s plea. internally, she grapples with her conflicting feelings toward her daughter livilla", "the situation\u2019s implications for her family's honor. she feels trapped between maternal loyalty to her daughter", "the moral outrage towards the betrayal that has unfolded, igniting a storm of discontent within her.", "antonia\u2019s surface emotions are a mixture of disdain and frustration", "her brow furrowed as she reacts to apicata\u2019s plea. internally", "she grapples with her conflicting feelings toward her daughter livilla and the situation\u2019s implications for her family's honor. she feels trapped between maternal loyalty to her daughter and the moral outrage towards the betrayal that has unfolded", "igniting a storm of discontent within her."],
        ap.active_plans = ["To refuse Apicata's plea, asserting her disdain for Livilla and Sejanus, and maintaining her moral high ground.", "To protect her family's name and legacy by dismissing Apicata's claims and the underlying threat they pose.", "To confront the realities of betrayal within her family and weigh her options regarding Livilla\u2019s ambitions, despite her initial rejection of Apicata\u2019s request."],
        ap.beliefs = ["Loyalty to family is paramount, yet it is tainted by personal ambition and betrayal, leading to a belief in moral integrity over familial bonds.", "The political machinations of Rome are corrupt and self-destructive, embodied by the actions of those close to her.", "Her identity is intertwined with her family\u2019s name and honor, making the betrayal by Livilla a personal affront that she must navigate carefully."],
        ap.goals = ["Short-term: To dismiss Apicata\u2019s claims and avoid getting involved in the treacherous web of her daughter\u2019s ambitions.", "Medium-term: To protect her family\u2019s reputation while grappling with the implications of Livilla\u2019s actions.", "Ultimate: To preserve the integrity and honor of her household amidst the chaotic power struggles of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Antonia remains seated and rigid in her high-backed chair, an imposing figure unmoved by Apicata\'s distress. Her posture is stiff, her gaze unwavering as she listens to Apicata\'s desperate plea. She makes no move to offer comfort or sympathy, maintaining a physical distance that mirrors her emotional detachment and moral condemnation. Her stillness amplifies the harshness of her words and her unyielding stance against Apicata.',
        ap.emotional_state = 'Antonia outwardly expresses cold disdain and moral outrage, her tone sharp and dismissive. Beneath this harsh exterior, she is wrestling with deep disappointment and disgust, particularly towards her own daughter, Livilla. She is internally conflicted, torn between her inherent maternal instincts and her rigid adherence to Roman virtues. Her unspoken conflict is her inability to reconcile her love for her daughter with the abhorrence of Livilla\'s actions, leading to a severe and seemingly uncompassionate rejection of Apicata\'s plea.',
        ap.emotional_tags = ["antonia outwardly expresses cold disdain", "moral outrage, her tone sharp", "dismissive. beneath this harsh exterior, she is wrestling with deep disappointment", "disgust, particularly towards her own daughter, livilla. she is internally conflicted, torn between her inherent maternal instincts", "her rigid adherence to roman virtues. her unspoken conflict is her inability to reconcile her love for her daughter with the abhorrence of livilla's actions, leading to a severe", "seemingly uncompassionate rejection of apicata's plea.", "antonia outwardly expresses cold disdain and moral outrage", "her tone sharp and dismissive. beneath this harsh exterior", "she is wrestling with deep disappointment and disgust", "particularly towards her own daughter", "livilla. she is internally conflicted", "torn between her inherent maternal instincts and her rigid adherence to roman virtues. her unspoken conflict is her inability to reconcile her love for her daughter with the abhorrence of livilla's actions", "leading to a severe and seemingly uncompassionate rejection of apicata's plea."],
        ap.active_plans = ["Assert her moral superiority and disgust at the perceived corruption of Roman society.", "Firmly reject Apicata's request for help, emphasizing her contempt for Apicata, Sejanus, and Livilla.", "Uphold what she believes are traditional Roman values by condemning those she sees as contributing to Rome's moral decay."],
        ap.beliefs = ["The traditional Roman virtues of honor, duty, and service are paramount and are being eroded by selfish ambition.", "Individuals are responsible for their moral choices and must face the consequences, regardless of circumstance.", "Personal desires should always be subordinate to the greater good of Rome and its established moral order."],
        ap.goals = ["short_term\": \"To end the uncomfortable and distasteful encounter with Apicata as quickly as possible.", "medium_term\": \"To reaffirm her own moral righteousness and distance herself from the perceived moral degradation of Rome.", "ultimate\": \"To preserve and defend the traditional Roman values she holds dear, even if it requires harshness and personal sacrifice."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_2'})
    ON CREATE SET
        ap.current_status = 'Apicata stands before Antonia in a posture of desperation, her body language conveying her distress and vulnerability. She pleads with Antonia, her voice laced with urgency and a mother\'s anguish. She gestures imploringly, seeking to elicit empathy and assistance from the formidable matriarch. Despite Antonia\'s cold reception, Apicata persists, driven by her unwavering determination to secure her children\'s safety.',
        ap.emotional_state = 'Apicata\'s surface emotions are raw desperation and profound anguish, openly displayed through her tearful plea and fervent words about her children. Internally, beneath her visible vulnerability, burns a core of fierce maternal resolve. She is torn between her desperate need for Antonia\'s help and a growing sense of defiance fueled by Antonia\'s scornful rejection. Her unspoken motivation shifts from simple supplication to a determined strategy of leveraging her secret knowledge to compel Antonia\'s cooperation, revealing a hidden strength beneath her initial despair.',
        ap.emotional_tags = ["apicata's surface emotions are raw desperation", "profound anguish, openly displayed through her tearful plea", "fervent words about her children. internally, beneath her visible vulnerability, burns a core of fierce maternal resolve. she is torn between her desperate need for antonia's help", "a growing sense of defiance fueled by antonia's scornful rejection. her unspoken motivation shifts from simple supplication to a determined strategy of leveraging her secret knowledge to compel antonia's cooperation, revealing a hidden strength beneath her initial despair.", "apicata's surface emotions are raw desperation and profound anguish", "openly displayed through her tearful plea and fervent words about her children. internally", "beneath her visible vulnerability", "burns a core of fierce maternal resolve. she is torn between her desperate need for antonia's help and a growing sense of defiance fueled by antonia's scornful rejection. her unspoken motivation shifts from simple supplication to a determined strategy of leveraging her secret knowledge to compel antonia's cooperation", "revealing a hidden strength beneath her initial despair."],
        ap.active_plans = ["Initially, to evoke Antonia's maternal sympathy and secure her voluntary assistance in retrieving her children.", "To clearly articulate the depth of her maternal love and the existential importance of her children to her.", "As a contingency, to threaten Antonia with the revelation of Livilla's crime, using it as leverage to force Antonia's hand if her plea for compassion fails."],
        ap.beliefs = ["A mother's bond with her children is sacred and transcends all other considerations, including social status and political concerns.", "She has a fundamental right to her children's presence and safety, regardless of her past associations with Sejanus.", "Exposing the truth about Livilla's crime is a morally justifiable action if it is necessary to protect her children and ensure their return."],
        ap.goals = ["short_term\": \"To persuade Antonia to immediately agree to help her retrieve her children from Sejanus and Livilla.", "medium_term\": \"To successfully secure the safe return of her children, removing them from the potential danger posed by Sejanus and Livilla.", "ultimate\": \"To guarantee the long-term safety and well-being of her children, ensuring they are free from harm and can live secure lives, even if it means drastic personal risks and public scandal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Apicata stands before Antonia, her posture tense and desperate, her hands wringing as she fights to maintain control amidst her emotional turmoil. The shadows of the room seem to wrap around her, amplifying her distress as she reveals the dark truth about Livilla and Sejanus.',
        ap.emotional_state = 'Apicata is filled with a mixture of desperation and fierce determination. On the surface, her fear for her children is palpable, reflected in her pleading tone and frantic gestures. Internally, she wrestles with anger and sorrow, feeling betrayed by those she once trusted, particularly Livilla and Sejanus. The stakes of her revelation weigh heavily on her, pushing her to the brink as she makes her shocking accusation.',
        ap.emotional_tags = ["apicata is filled with a mixture of desperation", "fierce determination. on the surface, her fear for her children is palpable, reflected in her pleading tone", "frantic gestures. internally, she wrestles with anger", "sorrow, feeling betrayed by those she once trusted, particularly livilla", "sejanus. the stakes of her revelation weigh heavily on her, pushing her to the brink as she makes her shocking accusation.", "apicata is filled with a mixture of desperation and fierce determination. on the surface", "her fear for her children is palpable", "reflected in her pleading tone and frantic gestures. internally", "she wrestles with anger and sorrow", "feeling betrayed by those she once trusted", "particularly livilla and sejanus. the stakes of her revelation weigh heavily on her", "pushing her to the brink as she makes her shocking accusation."],
        ap.active_plans = ["To persuade Antonia to intervene on her behalf to retrieve her children from Sejanus.", "To leverage the information about Livilla's involvement in Castor's murder as a bargaining chip.", "To expose the treachery of Livilla and Sejanus to Tiberius if her demands are not met."],
        ap.beliefs = ["Her children are her everything, and she must do whatever it takes to protect them.", "The truth must come to light, even if it means sacrificing her safety.", "The corrupt nature of Roman ambition has ruined her family and must be confronted."],
        ap.goals = ["Short-term: To recover her children from Sejanus's influence.", "Medium-term: To ensure Livilla and Sejanus face consequences for their actions.", "Ultimate: To reclaim her position as a mother and protector in a world consumed by ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'})
    ON CREATE SET
        ap.current_status = 'Antonia sits rigidly in her high-backed chair, her body tense as she listens to Apicata\'s desperate pleas. Her expression is a mask of disdain and anger, reflecting her contempt for the situation and the people involved. She gestures sharply, her fingers gripping the chair as she debates the weight of Apicata\'s words.',
        ap.emotional_state = 'Antonia\'s emotional state is tumultuous, characterized by anger and a fierce protectiveness over her family name. Outwardly, she expresses disgust and scorn towards both Apicata and Livilla. Internally, she grapples with the horror of the revelation about her daughter, feeling a deep conflict between familial loyalty and her moral outrage at the ambition that has tainted her family. The accusation of her daughter\'s involvement in murder strikes at her core.',
        ap.emotional_tags = ["antonia's emotional state is tumultuous, characterized by anger", "a fierce protectiveness over her family name. outwardly, she expresses disgust", "scorn towards both apicata", "livilla. internally, she grapples with the horror of the revelation about her daughter, feeling a deep conflict between familial loyalty", "her moral outrage at the ambition that has tainted her family. the accusation of her daughter's involvement in murder strikes at her core.", "antonia's emotional state is tumultuous", "characterized by anger and a fierce protectiveness over her family name. outwardly", "she expresses disgust and scorn towards both apicata and livilla. internally", "she grapples with the horror of the revelation about her daughter", "feeling a deep conflict between familial loyalty and her moral outrage at the ambition that has tainted her family. the accusation of her daughter's involvement in murder strikes at her core."],
        ap.active_plans = ["To refuse Apicata's demands firmly, asserting her disdain for her daughter's actions.", "To protect her family's name from the implications of Apicata's accusations.", "To maintain her authority and dismiss any notion of intervening with Livilla."],
        ap.beliefs = ["Honor and duty to Rome supersede personal familial ties and emotions.", "The pursuit of power has destroyed the core values of their society.", "Her daughter\u2019s actions tarnish her legacy, and she must sever ties to protect her own reputation."],
        ap.goals = ["Short-term: To assert her authority and reinforce her disdain towards Apicata.", "Medium-term: To distance herself from Livilla\u2019s actions to preserve her family\u2019s name.", "Ultimate: To restore a sense of order and integrity to her family amidst the chaos of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Antonia remains seated in her high-backed chair, maintaining a regal and imposing posture despite the unsettling nature of Apicata\'s accusations. Her body is rigid, indicating tension, but her movements are minimal as she intently observes Apicata. She leans slightly forward, her gaze sharp and unwavering, scrutinizing Apicata\'s every word and gesture for signs of deceit or truth.',
        ap.emotional_state = 'Initially, Antonia expresses vehement disbelief and disgust, her surface emotions radiating contempt and moral outrage towards Apicata. However, beneath this outward rejection, a flicker of unease and doubt begins to surface as Apicata persists and presents a compelling motive.  Internally, Antonia is wrestling with the potential implications for her family\'s honor and the horrifying possibility that her own daughter could be capable of such treachery, creating a conflict between maternal loyalty and moral duty.',
        ap.emotional_tags = ["initially, antonia expresses vehement disbelief", "disgust, her surface emotions radiating contempt", "moral outrage towards apicata. however, beneath this outward rejection, a flicker of unease", "doubt begins to surface as apicata persists", "presents a compelling motive.  internally, antonia is wrestling with the potential implications for her family's honor", "the horrifying possibility that her own daughter could be capable of such treachery, creating a conflict between maternal loyalty", "moral duty.", "initially", "antonia expresses vehement disbelief and disgust", "her surface emotions radiating contempt and moral outrage towards apicata. however", "beneath this outward rejection", "a flicker of unease and doubt begins to surface as apicata persists and presents a compelling motive.  internally", "antonia is wrestling with the potential implications for her family's honor and the horrifying possibility that her own daughter could be capable of such treachery", "creating a conflict between maternal loyalty and moral duty."],
        ap.active_plans = ["Forcefully deny Apicata's accusations and assert her moral superiority to intimidate Apicata into silence or recantation.", "Demand concrete proof from Apicata to expose any falsehood and quickly dismiss her claims as baseless.", "Subtly probe Apicata for further details and inconsistencies in her story to gauge the veracity of her accusations while protecting her own emotional vulnerability."],
        ap.beliefs = ["Her family name and reputation are of utmost importance and must be shielded from scandal at all costs.", "Individuals like Apicata, associated with Sejanus, are inherently morally compromised and their motives are suspect.", "Despite her strained relationship with Livilla, familial bonds hold weight, and condemning her daughter without irrefutable proof is a grave step not to be taken lightly."],
        ap.goals = ["short_term\": \"To immediately dismiss Apicata and her disturbing claims to maintain control of the situation and her emotional equilibrium.", "medium_term\": \"To discreetly investigate the validity of Apicata's accusations without causing undue alarm or public scandal, potentially through trusted slaves or confidantes.", "ultimate\": \"To safeguard her family's honor and legacy, even if it requires confronting painful truths about her own daughter and making difficult, morally ambiguous choices."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_4'})
    ON CREATE SET
        ap.current_status = 'Apicata stands before Antonia, her physical presence conveying a mix of desperation and newfound resolve. Initially distraught and pleading, her posture shifts as she reveals her leverage, becoming more assertive. She uses expressive hand gestures to emphasize her sincerity and the urgency of her plea, while maintaining direct eye contact with Antonia to convey her conviction and challenge Antonia\'s initial dismissal.',
        ap.emotional_state = 'Apicata is primarily driven by a mother\'s desperate anguish and fear for her children\'s safety, which is palpable in her initial pleas. Beneath this surface desperation, a steely resolve hardens as she realizes her accusation against Livilla is her only leverage. She is emotionally torn between her fear of Sejanus\'s reach and her unwavering determination to reclaim her children, exhibiting a complex mix of vulnerability and calculated manipulation as she navigates this dangerous encounter.',
        ap.emotional_tags = ["apicata is primarily driven by a mother's desperate anguish", "fear for her children's safety, which is palpable in her initial pleas. beneath this surface desperation, a steely resolve hardens as she realizes her accusation against livilla is her only leverage. she is emotionally torn between her fear of sejanus's reach", "her unwavering determination to reclaim her children, exhibiting a complex mix of vulnerability", "calculated manipulation as she navigates this dangerous encounter.", "apicata is primarily driven by a mother's desperate anguish and fear for her children's safety", "which is palpable in her initial pleas. beneath this surface desperation", "a steely resolve hardens as she realizes her accusation against livilla is her only leverage. she is emotionally torn between her fear of sejanus's reach and her unwavering determination to reclaim her children", "exhibiting a complex mix of vulnerability and calculated manipulation as she navigates this dangerous encounter."],
        ap.active_plans = ["Emotionally appeal to Antonia's sense of motherhood and compassion to elicit sympathy and secure her assistance in retrieving her children.", "Reveal the damning secret of Livilla's crime as a strategic tool to compel Antonia's cooperation through fear of scandal and family disgrace.", "Assess Antonia's reaction to the accusation to gauge her level of belief and determine the most effective approach to manipulate her into helping secure her children's return."],
        ap.beliefs = ["Her children's safety and well-being are paramount, justifying any risk or moral compromise necessary for their retrieval.", "The Roman power structure is inherently corrupt and inaccessible to someone of her status, necessitating unconventional and risky methods to achieve her goals.", "Powerful figures like Antonia are ultimately motivated by self-preservation and protection of their family's reputation, vulnerabilities that can be exploited to her advantage."],
        ap.goals = ["short_term\": \"To convince Antonia of the credibility of her threat and secure an immediate commitment to intervene on her behalf to get her children back.", "medium_term\": \"To ensure the safe return of her children, using the leverage of Livilla's secret if necessary, regardless of the personal cost or wider repercussions.", "ultimate\": \"To create a safe and stable environment for her children, free from the influence of Sejanus and the dangerous Roman court, even if it means sacrificing her own reputation or future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Antonia sits rigidly in a high-backed chair, her posture tense and authoritative as she confronts Apicata\'s desperate pleas. Her voice is sharp, laced with disdain as she asserts her disdain for Livilla and her lover Sejanus. Antonia embodies a woman wrestling with her maternal bonds and moral convictions, her gestures punctuating the gravity of her words.',
        ap.emotional_state = 'Antonia\'s surface emotions reflect a fierce resolve mixed with deep-seated disdain. Her tone is cold and cutting, revealing her anger at both Apicata and her daughter Livilla. Internally, she is conflicted, torn between familial loyalty and her disdain for the ambition that has tainted her family. Her motivations reveal an unspoken grief and a desperate need for control amidst the chaos.',
        ap.emotional_tags = ["antonia's surface emotions reflect a fierce resolve mixed with deep-seated disdain. her tone is cold", "cutting, revealing her anger at both apicata", "her daughter livilla. internally, she is conflicted, torn between familial loyalty", "her disdain for the ambition that has tainted her family. her motivations reveal an unspoken grief", "a desperate need for control amidst the chaos.", "antonia's surface emotions reflect a fierce resolve mixed with deep-seated disdain. her tone is cold and cutting", "revealing her anger at both apicata and her daughter livilla. internally", "she is conflicted", "torn between familial loyalty and her disdain for the ambition that has tainted her family. her motivations reveal an unspoken grief and a desperate need for control amidst the chaos."],
        ap.active_plans = ["To protect her family's name from scandal and betrayal.", "To refuse any assistance to Apicata, whom she views as complicit in the corruption of Rome.", "To confront Livilla about the potential repercussions of her actions, should Apicata's claims prove true."],
        ap.beliefs = ["Family honor is paramount, and blood ties must not supersede moral integrity.", "Ambition and greed have destroyed the familial bonds that once held Rome together.", "Those who betray their family deserve no sympathy or aid."],
        ap.goals = ["Short-term: To dismiss Apicata's claims and maintain her authority.", "Medium-term: To confront Livilla about her actions and their implications for the family.", "Ultimate: To restore stability and honor to her family amidst the chaos of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'})
    ON CREATE SET
        ap.current_status = 'Claudius observes the interaction between Antonia and Apicata from a distance, his posture reflective and hesitant. He engages in the conversation with a stammer, revealing his discomfort and reluctance to fully confront the brutal realities being discussed. His gestures are minimal, reflecting his timid nature, yet his voice carries an undertone of hidden knowledge.',
        ap.emotional_state = 'Claudius exhibits a mix of detachment and underlying tension. Outwardly dismissive, he struggles with the weight of his family\'s dark history, hinting at his internal conflicts. He feels compelled to protect himself and his family while grappling with the moral implications of Livilla’s potential actions. His internal fears reveal a man caught between familial loyalty and the need for self-preservation.',
        ap.emotional_tags = ["claudius exhibits a mix of detachment", "underlying tension. outwardly dismissive, he struggles with the weight of his family's dark history, hinting at his internal conflicts. he feels compelled to protect himself", "his family while grappling with the moral implications of livilla\u2019s potential actions. his internal fears reveal a man caught between familial loyalty", "the need for self-preservation.", "claudius exhibits a mix of detachment and underlying tension. outwardly dismissive", "he struggles with the weight of his family's dark history", "hinting at his internal conflicts. he feels compelled to protect himself and his family while grappling with the moral implications of livilla\u2019s potential actions. his internal fears reveal a man caught between familial loyalty and the need for self-preservation.", "claudius exhibits a mix of detachment and underlying tension. outwardly dismissive, he struggles with the weight of his family's dark history, hinting at his internal conflicts. he feels compelled to protect himself and his family", "grappling with the moral implications of livilla\u2019s potential actions. his internal fears reveal a man caught between familial loyalty and the need for self-preservation."],
        ap.active_plans = ["To support his mother, Antonia, by downplaying Apicata's claims.", "To share what little knowledge he has about Livilla's past indiscretions to sway Antonia's perceptions.", "To navigate the dangerous waters of familial loyalty without taking an overt stance against Livilla."],
        ap.beliefs = ["His family, despite its flaws, must be protected from external threats.", "Livilla\u2019s actions may be dreadful, but they do not extend to murder as claimed by Apicata.", "Knowledge of the past should guide the present, yet he fears the repercussions of revealing too much."],
        ap.goals = ["Short-term: To reassure Antonia that Apicata's claims are unfounded.", "Medium-term: To gather more information about the dynamics at play without putting himself at risk.", "Ultimate: To ensure his own safety while navigating the treacherous politics of the Imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Helen stands tearfully in the ornate drawing room, her posture reflecting her emotional distress. She directly addresses Livilla with a plaintive question about her future, her voice trembling with uncertainty as she grapples with the disruption of her marriage plans. Her presence is marked by visible sadness, a stark contrast to the opulent setting.',
        ap.emotional_state = 'On the surface, Helen is openly distraught, her tears and questioning tone revealing her immediate sadness and confusion. Internally, she is experiencing a deep sense of despair and vulnerability, feeling lost and powerless as her personal life is thrown into chaos by external events.  She is emotionally raw and desperately seeking reassurance and direction amidst the upheaval, highlighting an unspoken conflict between her personal desires and the harsh realities of her world.',
        ap.emotional_tags = ["on the surface, helen is openly distraught, her tears", "questioning tone revealing her immediate sadness", "confusion. internally, she is experiencing a deep sense of despair", "vulnerability, feeling lost", "powerless as her personal life is thrown into chaos by external events.  she is emotionally raw", "desperately seeking reassurance", "direction amidst the upheaval, highlighting an unspoken conflict between her personal desires", "the harsh realities of her world.", "on the surface", "helen is openly distraught", "her tears and questioning tone revealing her immediate sadness and confusion. internally", "she is experiencing a deep sense of despair and vulnerability", "feeling lost and powerless as her personal life is thrown into chaos by external events.  she is emotionally raw and desperately seeking reassurance and direction amidst the upheaval", "highlighting an unspoken conflict between her personal desires and the harsh realities of her world."],
        ap.active_plans = ["Express her immediate distress and seek emotional support from Livilla.", "Understand the practical implications of her thwarted marriage plans and what alternatives might exist.", "Hope for a resolution that will restore some stability and direction to her life."],
        ap.beliefs = ["Marriage is a crucial aspect of a woman's life and future in Roman society.", "Her family, particularly her mother, should prioritize her personal happiness and well-being.", "She is entitled to a secure and predictable future, free from the disruptions of political turmoil."],
        ap.goals = ["Short-term: Stop crying and receive comfort or a semblance of reassurance from Livilla.", "Medium-term: Secure a new, suitable marriage arrangement to ensure her social and economic stability.", "Ultimate: Achieve a peaceful and secure life, shielded from the volatile world of Roman politics and courtly intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_1'})
    ON CREATE SET
        ap.current_status = 'Livilla stands near Helen in the palace drawing room, though her physical comfort is perfunctory and cold. She attempts to soothe Helen\'s distress with dismissive words, prioritizing \'affairs of state\' over her daughter\'s emotional needs. Her posture is rigid, her movements economical, reflecting her emotional detachment and focus on larger concerns beyond Helen\'s immediate feelings.',
        ap.emotional_state = 'Outwardly, Livilla displays a cold and impatient demeanor, evident in her sharp tone and dismissive language towards Helen. Beneath this surface, she is likely preoccupied and stressed by her own ambitious plans and the complexities of the political situation.  There is a stark internal conflict between her societal role as a mother and her self-serving ambition, leading her to suppress any genuine maternal empathy in favor of maintaining control and focusing on her own agenda.',
        ap.emotional_tags = ["outwardly, livilla displays a cold", "impatient demeanor, evident in her sharp tone", "dismissive language towards helen. beneath this surface, she is likely preoccupied", "stressed by her own ambitious plans", "the complexities of the political situation.  there is a stark internal conflict between her societal role as a mother", "her self-serving ambition, leading her to suppress any genuine maternal empathy in favor of maintaining control", "focusing on her own agenda.", "outwardly", "livilla displays a cold and impatient demeanor", "evident in her sharp tone and dismissive language towards helen. beneath this surface", "she is likely preoccupied and stressed by her own ambitious plans and the complexities of the political situation.  there is a stark internal conflict between her societal role as a mother and her self-serving ambition", "leading her to suppress any genuine maternal empathy in favor of maintaining control and focusing on her own agenda."],
        ap.active_plans = ["Quickly dismiss Helen's emotional outburst and minimize the significance of her personal distress.", "Redirect the conversation away from Helen's feelings and towards what she considers more important 'state affairs'.", "Maintain an image of composure and control in front of both Helen and, potentially, Antonia who is about to enter, masking any personal anxieties or vulnerabilities."],
        ap.beliefs = ["Political and state matters are of paramount importance and should always take precedence over personal emotions.", "Emotional displays, especially from women, are a sign of weakness and should be suppressed in the face of serious affairs.", "She is justified in prioritizing her own ambitions and desires, even if it means being unsympathetic or dismissive of her daughter's feelings."],
        ap.goals = ["Short-term: Silence Helen's complaints and swiftly conclude the emotionally charged scene.", "Medium-term: Secure her planned marriage to Sejanus and solidify her own position and influence within the Roman power structure.", "Ultimate: Achieve significant power and status through her strategic alliances and actions, potentially becoming a major player in Roman politics, even at the cost of familial harmony and genuine emotional connections."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Helen stands tearfully near Livilla, her posture slumped, arms crossed protectively over her chest. She shifts her weight nervously, fidgeting with the hem of her dress as her voice quivers with emotion while she expresses her distress over losing her chance to marry Nero.',
        ap.emotional_state = 'Surface emotions reveal Helen\'s despair and confusion, as her tears spill forth, contrasting with Livilla\'s cold demeanor. Internally, she grapples with a feeling of abandonment and fear, torn between her desire for love and the harsh reality of her situation. The weight of familial expectations and political maneuvering creates a tension that amplifies her vulnerability.',
        ap.emotional_tags = ["surface emotions reveal helen's despair", "confusion, as her tears spill forth, contrasting with livilla's cold demeanor. internally, she grapples with a feeling of abandonment", "fear, torn between her desire for love", "the harsh reality of her situation. the weight of familial expectations", "political maneuvering creates a tension that amplifies her vulnerability.", "surface emotions reveal helen's despair and confusion", "as her tears spill forth", "contrasting with livilla's cold demeanor. internally", "she grapples with a feeling of abandonment and fear", "torn between her desire for love and the harsh reality of her situation. the weight of familial expectations and political maneuvering creates a tension that amplifies her vulnerability."],
        ap.active_plans = ["To find a way to marry Nero despite the obstacles in her path.", "To seek comfort and reassurance from Livilla, hoping for maternal support.", "To navigate her emotions and desires in the face of political turmoil."],
        ap.beliefs = ["Believes in the sanctity of love and marriage, especially toward Nero.", "Holds the conviction that her desires should align with her family's expectations, but feels conflicted.", "Thinks that personal happiness is achievable despite the political chaos around her."],
        ap.goals = ["Short-term: To process her emotions and find solace with her mother.", "Medium-term: To reclaim her prospects for a marriage that aligns with her desires.", "Ultimate: To secure a loving relationship with Nero, seeing it as a means to validate her worth in a turbulent world."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'})
    ON CREATE SET
        ap.current_status = 'Antonia enters the drawing room with a commanding presence, her posture straightened and purposeful. She approaches with an air of authority, her gaze piercing as she confronts both Helen\'s self-absorption and Livilla\'s choices with sharp, deliberate movements.',
        ap.emotional_state = 'On the surface, Antonia expresses frustration and disappointment, her tone firm yet laced with concern for her family\'s future. Internally, she wrestles with the weight of maternal duty and the bitter realization of Livilla\'s ambitions, feeling the strain of her own protective instincts clashing with the reality of betrayal.',
        ap.emotional_tags = ["on the surface, antonia expresses frustration", "disappointment, her tone firm yet laced with concern for her family's future. internally, she wrestles with the weight of maternal duty", "the bitter realization of livilla's ambitions, feeling the strain of her own protective instincts clashing with the reality of betrayal.", "on the surface", "antonia expresses frustration and disappointment", "her tone firm yet laced with concern for her family's future. internally", "she wrestles with the weight of maternal duty and the bitter realization of livilla's ambitions", "feeling the strain of her own protective instincts clashing with the reality of betrayal."],
        ap.active_plans = ["To redirect Helen's focus from her personal desires to the greater danger concerning Nero.", "To confront Livilla about her intentions with Sejanus and express her disapproval.", "To assert her authority as the matriarch and remind Livilla of her responsibilities as a daughter."],
        ap.beliefs = ["Believes that familial loyalty and safety should supersede personal desires.", "Holds the conviction that one must be aware of the political ramifications of their actions.", "Thinks that as a mother, it is her duty to guide her children away from perilous decisions."],
        ap.goals = ["Short-term: To chastise Helen and redirect her thoughts towards more pressing matters.", "Medium-term: To discourage Livilla's marriage to Sejanus, which she sees as a dangerous folly.", "Ultimate: To protect her family's legacy and maintain the integrity of their name amidst the chaos of power struggles."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Livilla stands in the ornate drawing room, initially feigning comfort towards her daughter Helen, though her posture and clipped words betray a lack of genuine empathy.  She dismisses Helen\'s distress over thwarted marriage plans with a sharp impatience, indicating her focus is elsewhere. When Antonia enters, Livilla shifts her attention, becoming defensively poised to justify her actions.',
        ap.emotional_state = 'Livilla outwardly presents a facade of cool indifference and self-assuredness, attempting to appear in control and resolute in her decision to marry Sejanus. Beneath this veneer, however, lies a simmering defiance and a hint of vulnerability. She is clearly defensive, reacting strongly to Antonia\'s probing questions and warnings, suggesting an internal conflict between her desires and the societal and familial expectations she attempts to shrug off. There\'s an unspoken hunger for autonomy and perhaps a touch of desperation driving her choices.',
        ap.emotional_tags = ["livilla outwardly presents a facade of cool indifference", "self-assuredness, attempting to appear in control", "resolute in her decision to marry sejanus. beneath this veneer, however, lies a simmering defiance", "a hint of vulnerability. she is clearly defensive, reacting strongly to antonia's probing questions", "warnings, suggesting an internal conflict between her desires", "the societal", "familial expectations she attempts to shrug off. there's an unspoken hunger for autonomy", "perhaps a touch of desperation driving her choices.", "livilla outwardly presents a facade of cool indifference and self-assuredness", "attempting to appear in control and resolute in her decision to marry sejanus. beneath this veneer", "however", "lies a simmering defiance and a hint of vulnerability. she is clearly defensive", "reacting strongly to antonia's probing questions and warnings", "suggesting an internal conflict between her desires and the societal and familial expectations she attempts to shrug off. there's an unspoken hunger for autonomy and perhaps a touch of desperation driving her choices."],
        ap.active_plans = ["Defend her decision to marry Sejanus as a matter of personal choice and desire for companionship.", "Dismiss Antonia's concerns about the political ramifications of her marriage, focusing on her individual needs.", "Evade direct confrontation by deflecting questions and asserting her independence from familial control."],
        ap.beliefs = ["She believes she has the right to pursue her own happiness and romantic desires, irrespective of her family's expectations or political considerations.", "She believes Antonia is being overly traditional and doesn't understand the needs of a woman who has been widowed for years.", "She believes her relationship with Sejanus is based on genuine love, or at least she wants to believe it, to justify her ambitious choice."],
        ap.goals = ["{type: short-term, description: To rebuff Antonia's interrogation and assert her right to marry Sejanus without further interference.}", "{type: medium-term, description: To proceed with the marriage to Sejanus and establish a new phase of her life, free from the constraints of widowhood and familial expectations.}", "{type: ultimate, description: To secure personal happiness and potentially greater influence through her union with Sejanus, even if it means defying her family and societal norms.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'})
    ON CREATE SET
        ap.current_status = 'Antonia enters the drawing room with a commanding and regal bearing, immediately taking charge of the atmosphere. She observes Livilla and Helen with a critical eye, her presence radiating authority and concern.  Turning her focused gaze on Livilla, Antonia stands firm, her posture conveying disapproval and a readiness to confront her daughter directly about the unsettling marriage proposal.',
        ap.emotional_state = 'Antonia is deeply troubled and disapproving, her surface demeanor controlled but laced with a profound maternal concern that clashes with her regal authority. Beneath the surface, she grapples with disappointment and a growing sense of alarm at Livilla\'s choices.  She is likely experiencing a turmoil of emotions - anger at Livilla\'s perceived foolishness, fear for the family\'s reputation and safety, and a deep sadness at her daughter\'s apparent moral blindness. Her unspoken conflict is between her fierce maternal loyalty and her duty to the family\'s political standing and moral integrity.',
        ap.emotional_tags = ["antonia is deeply troubled", "disapproving, her surface demeanor controlled but laced with a profound maternal concern that clashes with her regal authority. beneath the surface, she grapples with disappointment", "a growing sense of alarm at livilla's choices.  she is likely experiencing a turmoil of emotions - anger at livilla's perceived foolishness, fear for the family's reputation", "safety,", "a deep sadness at her daughter's apparent moral blindness. her unspoken conflict is between her fierce maternal loyalty", "her duty to the family's political standing", "moral integrity.", "antonia is deeply troubled and disapproving", "her surface demeanor controlled but laced with a profound maternal concern that clashes with her regal authority. beneath the surface", "she grapples with disappointment and a growing sense of alarm at livilla's choices.  she is likely experiencing a turmoil of emotions - anger at livilla's perceived foolishness", "fear for the family's reputation and safety", "and a deep sadness at her daughter's apparent moral blindness. her unspoken conflict is between her fierce maternal loyalty and her duty to the family's political standing and moral integrity.", "antonia is deeply troubled and disapproving, her surface demeanor controlled", "laced with a profound maternal concern that clashes with her regal authority. beneath the surface, she grapples with disappointment and a growing sense of alarm at livilla's choices.  she is likely experiencing a turmoil of emotions - anger at livilla's perceived foolishness, fear for the family's reputation and safety, and a deep sadness at her daughter's apparent moral blindness. her unspoken conflict is between her fierce maternal loyalty and her duty to the family's political standing and moral integrity."],
        ap.active_plans = ["Confront Livilla directly about her intention to marry Sejanus to ascertain the truth and Livilla's motivations.", "Warn Livilla of the grave political and familial implications of marrying Sejanus, emphasizing the Emperor's likely disapproval.", "Attempt to dissuade Livilla from proceeding with the marriage by appealing to her sense of familial duty and highlighting the dangers of Sejanus's ambition."],
        ap.beliefs = ["She believes that Livilla's personal desires must be subordinate to the welfare and reputation of the family and the stability of Rome.", "She believes that Sejanus is manipulative and dangerous, and that Livilla is being foolishly naive in trusting him.", "She believes that marriage is not merely a personal affair but a matter of state and lineage, particularly for someone of Livilla's standing."],
        ap.goals = ["{type: short-term, description: To make Livilla understand the gravity of her decision and the dangers associated with marrying Sejanus.}", "{type: medium-term, description: To prevent Livilla from marrying Sejanus, thereby averting potential political and familial disaster.}", "{type: ultimate, description: To protect the honor and stability of her family and to ensure that Livilla does not become a pawn in Sejanus's dangerous game, upholding the traditional values of Roman nobility.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Livilla stands near Helen, her posture slightly stiff as she attempts to provide comfort, though her expression is cool and detached. She gestures dismissively at Helen\'s tears, her body language revealing impatience with the emotional display.',
        ap.emotional_state = 'Outwardly, Livilla appears calm and composed, masking any internal conflict with a veneer of indifference. However, beneath the surface, her emotional state is tumultuous; she grapples with the implications of her ambitions and the potential betrayal of her mother’s fears. Livilla is torn between her desire for personal happiness and her mother\'s warnings, illustrating a deep internal struggle.',
        ap.emotional_tags = ["outwardly, livilla appears calm", "composed, masking any internal conflict with a veneer of indifference. however, beneath the surface, her emotional state is tumultuous; she grapples with the implications of her ambitions", "the potential betrayal of her mother\u2019s fears. livilla is torn between her desire for personal happiness", "her mother's warnings, illustrating a deep internal struggle.", "outwardly", "livilla appears calm and composed", "masking any internal conflict with a veneer of indifference. however", "beneath the surface", "her emotional state is tumultuous; she grapples with the implications of her ambitions and the potential betrayal of her mother\u2019s fears. livilla is torn between her desire for personal happiness and her mother's warnings", "illustrating a deep internal struggle.", "outwardly, livilla appears calm and composed, masking any internal conflict with a veneer of indifference. however, beneath the surface, her emotional state is tumultuous", "she grapples with the implications of her ambitions and the potential betrayal of her mother\u2019s fears. livilla is torn between her desire for personal happiness and her mother's warnings, illustrating a deep internal struggle."],
        ap.active_plans = ["To reassure Helen that she will find a suitable marriage, dismissing her concerns as trivial.", "To assert her independence in the face of Antonia's questioning, demonstrating her autonomy and desire for control over her life.", "To solidify her relationship with Sejanus, affirming her decision to marry him despite potential consequences."],
        ap.beliefs = ["Marriage is a personal choice and should not be dictated by political concerns or familial expectations.", "Love can conquer political machinations; her feelings for Sejanus are genuine despite the risks.", "She believes that her happiness and desires should take precedence over her mother\u2019s fear and traditional expectations."],
        ap.goals = ["Short-term: To convince Helen to accept her situation and move past her disappointment.", "Medium-term: To establish her relationship with Sejanus, seeking happiness in her personal life.", "Ultimate: To gain power and influence through her marriage to Sejanus, strengthening her position within the imperial hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'})
    ON CREATE SET
        ap.current_status = 'Antonia enters the drawing room with an air of authority, her posture straight and commanding. She directly addresses Livilla, her gestures sharp and decisive, reflecting her impatience and concern for the implications of her daughter\'s actions.',
        ap.emotional_state = 'Antonia exudes a strong, protective demeanor, yet her words are laced with underlying anxiety about Livilla\'s choices. While she confronts her daughter with authority, there’s a palpable tension, indicating her fear that Livilla may be blinded by ambition. Antonia’s emotional state is a mix of maternal worry and fierce determination to safeguard her family’s legacy.',
        ap.emotional_tags = ["antonia exudes a strong, protective demeanor, yet her words are laced with underlying anxiety about livilla's choices. while she confronts her daughter with authority, there\u2019s a palpable tension, indicating her fear that livilla may be blinded by ambition. antonia\u2019s emotional state is a mix of maternal worry", "fierce determination to safeguard her family\u2019s legacy.", "antonia exudes a strong", "protective demeanor", "yet her words are laced with underlying anxiety about livilla's choices. while she confronts her daughter with authority", "there\u2019s a palpable tension", "indicating her fear that livilla may be blinded by ambition. antonia\u2019s emotional state is a mix of maternal worry and fierce determination to safeguard her family\u2019s legacy."],
        ap.active_plans = ["To confront Livilla about her intentions towards Sejanus, seeking to protect her daughter from potential manipulation.", "To redirect the focus from personal desires to the greater implications of political loyalty and familial responsibilities.", "To persuade Livilla to consider the consequences of her actions on Sejanus\u2019s children and on their own family dynamics."],
        ap.beliefs = ["Political marriages should be approached with caution, emphasizing the importance of familial duty over personal desire.", "Sejanus is a manipulative figure, and Livilla\u2019s feelings for him may cloud her judgment.", "The safety and well-being of the family must take precedence over individual desires, particularly in the treacherous landscape of Roman politics."],
        ap.goals = ["Short-term: To convince Livilla to reconsider her relationship with Sejanus for the family's sake.", "Medium-term: To protect her family from the ramifications of Livilla\u2019s choices and safeguard their legacy.", "Ultimate: To restore integrity and loyalty within the family amidst the chaos of ambition and betrayal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Livilla stands in the ornate drawing room, initially attempting to comfort her weeping daughter Helen, though her touch and words lack genuine warmth. As Antonia enters and questions her, Livilla becomes immediately defensive, her posture stiffening and her gaze hardening. She parries Antonia\'s accusations with dismissive pronouncements and attempts to redirect the conversation away from her true intentions.',
        ap.emotional_state = 'Outwardly, Livilla presents a facade of cool indifference and slight irritation, particularly at Antonia\'s probing questions and Helen\'s emotional display. Beneath this veneer, she simmers with a potent mix of defiance and self-justification. She feels cornered and misunderstood, resenting Antonia\'s interference in her personal desires, and possibly masking a flicker of unease about the moral implications of her actions concerning Apicata\'s children.',
        ap.emotional_tags = ["outwardly, livilla presents a facade of cool indifference", "slight irritation, particularly at antonia's probing questions", "helen's emotional display. beneath this veneer, she simmers with a potent mix of defiance", "self-justification. she feels cornered", "misunderstood, resenting antonia's interference in her personal desires,", "possibly masking a flicker of unease about the moral implications of her actions concerning apicata's children.", "outwardly", "livilla presents a facade of cool indifference and slight irritation", "particularly at antonia's probing questions and helen's emotional display. beneath this veneer", "she simmers with a potent mix of defiance and self-justification. she feels cornered and misunderstood", "resenting antonia's interference in her personal desires", "and possibly masking a flicker of unease about the moral implications of her actions concerning apicata's children."],
        ap.active_plans = ["To deflect Antonia's interrogation about her relationship with Sejanus.", "To assert her independence and right to make her own choices, especially regarding marriage.", "To minimize the significance of Apicata's plea and dismiss the plight of Sejanus's children as irrelevant to her."],
        ap.beliefs = ["Her personal desires and happiness supersede familial or moral obligations.", "Marriage to Sejanus is a strategic move that will elevate her status and free her from her current constraints.", "Apicata and her children are inconsequential pawns in the larger game of power and ambition she is playing."],
        ap.goals = ["short-term\": \"To end Antonia's questioning and reassert control over the conversation.", "medium-term\": \"To secure Tiberius's approval (or at least acquiescence) for her marriage to Sejanus.", "ultimate\": \"To achieve a position of power and influence alongside Sejanus, escaping the shadow of her family and forging her own destiny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Antonia enters the drawing room with a commanding presence, her very bearing radiating authority and disapproval. She observes the tail end of Livilla\'s dismissive interaction with Helen before directly confronting Livilla. Her posture is erect, her gaze unwavering and intense as she presses Livilla for answers, her voice resonating with a mixture of maternal concern and righteous indignation.',
        ap.emotional_state = 'Antonia\'s surface emotion is controlled anger and deep disappointment. She speaks with a sharp, interrogative tone, her facial expressions conveying her profound disapproval of Livilla\'s choices. Internally, she is wrestling with a conflict between her love for her daughter and her moral outrage at Livilla\'s ambition and apparent callousness. She feels betrayed and deeply concerned for the future of her family\'s honor, sensing the dangerous path Livilla is treading.',
        ap.emotional_tags = ["antonia's surface emotion is controlled anger", "deep disappointment. she speaks with a sharp, interrogative tone, her facial expressions conveying her profound disapproval of livilla's choices. internally, she is wrestling with a conflict between her love for her daughter", "her moral outrage at livilla's ambition", "apparent callousness. she feels betrayed", "deeply concerned for the future of her family's honor, sensing the dangerous path livilla is treading.", "antonia's surface emotion is controlled anger and deep disappointment. she speaks with a sharp", "interrogative tone", "her facial expressions conveying her profound disapproval of livilla's choices. internally", "she is wrestling with a conflict between her love for her daughter and her moral outrage at livilla's ambition and apparent callousness. she feels betrayed and deeply concerned for the future of her family's honor", "sensing the dangerous path livilla is treading."],
        ap.active_plans = ["To directly confront Livilla about the rumors of her intended marriage to Sejanus.", "To ascertain the truth of Livilla's intentions and understand the depth of her involvement with Sejanus.", "To appeal to Livilla's sense of familial duty and compassion, particularly regarding Apicata's children, hoping to awaken some moral conscience."],
        ap.beliefs = ["Marriage is a sacred and politically significant union, not to be entered into lightly or for selfish reasons.", "Family lineage and honor are paramount, and Livilla's actions are a grave threat to both.", "Sejanus is a dangerous and manipulative figure who is exploiting Livilla for his own ambitious ends, and Livilla is blinded by her own desires."],
        ap.goals = ["short-term\": \"To extract the truth from Livilla regarding her relationship with Sejanus and her intentions.", "medium-term\": \"To dissuade Livilla from marrying Sejanus and to make her recognize the potential consequences of her actions.", "ultimate\": \"To protect her family's honor and legacy from further scandal and to guide Livilla back towards a path of virtue and responsibility, though this hope is diminishing."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_2_5'})
    ON CREATE SET
        ap.current_status = 'Apicata is not physically present in the drawing room but is powerfully invoked through Antonia\'s words. Her status is defined by her absence from her children and her desperate plea conveyed via Antonia. She is an unseen force, her anguish and desire for reunion hanging heavy in the air between Antonia and Livilla, influencing their tense exchange.',
        ap.emotional_state = 'Though absent, Apicata’s emotional state permeates the scene through Antonia\'s compassionate portrayal. She is depicted as deeply distraught and desperate, consumed by maternal grief and a fervent longing for her children. Her internal state is characterized by a potent mix of sorrow, fear for her children\'s well-being under Sejanus\'s control, and a fragile hope that her plea through Antonia might sway Livilla\'s actions.',
        ap.emotional_tags = ["though absent, apicata\u2019s emotional state permeates the scene through antonia's compassionate portrayal. she is depicted as deeply distraught", "desperate, consumed by maternal grief", "a fervent longing for her children. her internal state is characterized by a potent mix of sorrow, fear for her children's well-being under sejanus's control,", "a fragile hope that her plea through antonia might sway livilla's actions.", "though absent", "apicata\u2019s emotional state permeates the scene through antonia's compassionate portrayal. she is depicted as deeply distraught and desperate", "consumed by maternal grief and a fervent longing for her children. her internal state is characterized by a potent mix of sorrow", "fear for her children's well-being under sejanus's control", "and a fragile hope that her plea through antonia might sway livilla's actions."],
        ap.active_plans = ["To use Antonia, a woman of power and influence within the Imperial family, as an intermediary to reach Livilla.", "To appeal to Livilla's potential empathy and feminine solidarity, hoping she might understand a mother's love for her children.", "To indirectly pressure Sejanus through Livilla to allow her access to her children again."],
        ap.beliefs = ["A mother has an inherent right to be with her children, and their forced separation is a profound injustice.", "Livilla, as a woman and perhaps as a mother herself, might possess a capacity for compassion that Sejanus lacks.", "Antonia, as a respected matriarch, holds moral authority and could potentially influence Livilla's decisions."],
        ap.goals = ["short-term\": \"To have Antonia deliver her plea effectively to Livilla, emphasizing her suffering and the children's plight.", "medium-term\": \"To persuade Livilla to intercede with Sejanus on her behalf, advocating for her right to see her children.", "ultimate\": \"To be reunited with her children and to ensure their safety and well-being, ideally regaining custody and removing them from Sejanus's sphere of influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits at his desk, a figure of imperial authority, meticulously reviewing documents. His posture is upright, exuding confidence, as he addresses Sejanus with a cold detachment. His gestures are minimal yet precise, underscoring the weight of his position.',
        ap.emotional_state = 'Tiberius presents an outer calm, but beneath lies a swirling tempest of paranoia and distrust. His tone is clipped and authoritative, concealing a fear of Sejanus\'s rising power and ambition. This dissonance reveals his internal struggle between maintaining control and the encroaching threat of betrayal.',
        ap.emotional_tags = ["tiberius presents an outer calm, but beneath lies a swirling tempest of paranoia", "distrust. his tone is clipped", "authoritative, concealing a fear of sejanus's rising power", "ambition. this dissonance reveals his internal struggle between maintaining control", "the encroaching threat of betrayal.", "tiberius presents an outer calm", "but beneath lies a swirling tempest of paranoia and distrust. his tone is clipped and authoritative", "concealing a fear of sejanus's rising power and ambition. this dissonance reveals his internal struggle between maintaining control and the encroaching threat of betrayal.", "tiberius presents an outer calm,", "beneath lies a swirling tempest of paranoia and distrust. his tone is clipped and authoritative, concealing a fear of sejanus's rising power and ambition. this dissonance reveals his internal struggle between maintaining control and the encroaching threat of betrayal."],
        ap.active_plans = ["To assert his authority over Sejanus by denying the marriage proposal, thereby reinforcing the hierarchy of power.", "To manipulate the narrative around Livilla's ambitions, ensuring that any union does not threaten his own position as Emperor.", "To maintain an atmosphere of suspicion and control, carefully managing the perceptions of loyalty among those in his inner circle."],
        ap.beliefs = ["Power must remain centralized under his control to prevent any threats to his reign.", "Ambition in others is a potential source of betrayal, especially from those he deems ambitious like Sejanus.", "Political maneuvering is a necessary tool to maintain stability within the empire."],
        ap.goals = ["Short-term: To firmly reject Sejanus's proposal without revealing his true motives.", "Medium-term: To solidify his hold on power by preventing potential rivalries that could arise from Sejanus's ambitions.", "Ultimate: To maintain his sovereignty over Rome and protect his legacy from the dangers posed by his inner circle."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands before Tiberius, poised yet visibly tense. His posture conveys a mix of confidence and apprehension as he awaits the Emperor\'s decision, his hands fidgeting slightly, betraying the storm of ambition and frustration brewing within.',
        ap.emotional_state = 'Outwardly, Sejanus maintains a facade of composure, but internally, he is grappling with disappointment and a growing sense of urgency. His polite inquiries mask an underlying resentment towards Tiberius, as he senses the tightening noose of political constraints around his ambitions.',
        ap.emotional_tags = ["outwardly, sejanus maintains a facade of composure, but internally, he is grappling with disappointment", "a growing sense of urgency. his polite inquiries mask an underlying resentment towards tiberius, as he senses the tightening noose of political constraints around his ambitions.", "outwardly", "sejanus maintains a facade of composure", "but internally", "he is grappling with disappointment and a growing sense of urgency. his polite inquiries mask an underlying resentment towards tiberius", "as he senses the tightening noose of political constraints around his ambitions.", "outwardly, sejanus maintains a facade of composure,", "internally, he is grappling with disappointment and a growing sense of urgency. his polite inquiries mask an underlying resentment towards tiberius, as he senses the tightening noose of political constraints around his ambitions."],
        ap.active_plans = ["To challenge Tiberius's authority by questioning his reasoning for denying the marriage proposal.", "To seek alternative alliances by considering the proposition of marrying Helen, thus preserving his influence.", "To navigate the political landscape carefully, ensuring that his standing remains secure even in the face of Tiberius's refusal."],
        ap.beliefs = ["Personal ambition is justified and necessary for the advancement of power within Rome.", "The Emperor's decisions are often riddled with jealousy and paranoia that threaten his own aspirations.", "Building alliances through marriage is a strategic move to enhance his standing and mitigate risks."],
        ap.goals = ["Short-term: To gain clarity on Tiberius's reasons for the refusal and to keep the dialogue open for negotiation.", "Medium-term: To secure an alliance with Helen as a secondary option, maintaining influence within the imperial family.", "Ultimate: To rise above his current rank and solidify his position as one of the most powerful figures in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Emperor Tiberius is seated imperiously at his desk, surrounded by official documents, a symbol of his absolute authority. He is actively engaged in reviewing papers, creating a pretense of diligent governance while orchestrating a delicate political maneuver against Sejanus. His posture is relaxed yet commanding, indicating his control over the setting and the unfolding conversation.',
        ap.emotional_state = 'Tiberius projects an outward calm and measured demeanor, speaking in a reasoned tone as if carefully considering Sejanus\'s interests. However, beneath this composed surface lies a deep well of paranoia and suspicion. He is emotionally detached, viewing Sejanus and the proposed marriage purely as strategic elements in his power game. His internal state is characterized by cunning calculation and a desire to maintain dominance, masking his distrust with a veneer of imperial benevolence.',
        ap.emotional_tags = ["tiberius projects an outward calm", "measured demeanor, speaking in a reasoned tone as if carefully considering sejanus's interests. however, beneath this composed surface lies a deep well of paranoia", "suspicion. he is emotionally detached, viewing sejanus", "the proposed marriage purely as strategic elements in his power game. his internal state is characterized by cunning calculation", "a desire to maintain dominance, masking his distrust with a veneer of imperial benevolence.", "tiberius projects an outward calm and measured demeanor", "speaking in a reasoned tone as if carefully considering sejanus's interests. however", "beneath this composed surface lies a deep well of paranoia and suspicion. he is emotionally detached", "viewing sejanus and the proposed marriage purely as strategic elements in his power game. his internal state is characterized by cunning calculation and a desire to maintain dominance", "masking his distrust with a veneer of imperial benevolence."],
        ap.active_plans = ["Reject Sejanus's direct request to marry Livilla to curtail his growing influence and prevent a power imbalance.", "Offer a seemingly conciliatory alternative by proposing marriage to Helen, Livilla's daughter, to appease Sejanus without granting him significant political leverage.", "Observe Sejanus's reaction to this counter-offer to gauge his true ambitions and measure the extent of his disappointment and potential defiance."],
        ap.beliefs = ["Absolute imperial authority must be maintained at all costs, and any perceived threat to this authority must be neutralized or carefully managed.", "Sejanus, despite his outward loyalty, is inherently ambitious and poses a potential risk to the stability of the empire and Tiberius's reign.", "Political marriages are strategic tools to be deployed to control power dynamics, reward loyalty conditionally, and prevent any single individual from becoming too powerful."],
        ap.goals = ["Short-term: Placate Sejanus's immediate ambition for a closer tie to the Imperial family while strategically limiting his actual power and influence.", "Medium-term: Preserve the existing power structure, ensuring no single figure, including Sejanus, becomes capable of challenging Tiberius's supreme authority.", "Ultimate: Secure the long-term stability of the Julio-Claudian dynasty and his personal legacy as the unwavering ruler of Rome, even through manipulation and control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands attentively before Tiberius\'s desk, positioned as a subordinate awaiting the Emperor\'s judgment. He is physically still, listening intently to Tiberius\'s words, yet his posture subtly betrays a tension beneath the surface of outward respect. He is present to receive the imperial decree regarding his ambitious marriage proposal, his body language reflecting a mixture of anticipation and controlled apprehension.',
        ap.emotional_state = 'On the surface, Sejanus maintains a facade of respectful acceptance and mild disappointment, echoing Tiberius\'s reasoned tone and expressing understanding. Internally, he is experiencing a profound sense of frustration and thwarted ambition. His disappointment at the direct rejection is palpable, likely tinged with suppressed anger and a feeling of being strategically outmaneuvered. He is grappling with the blow to his aspirations, while carefully concealing his true emotional turmoil to avoid provoking Tiberius\'s displeasure.',
        ap.emotional_tags = ["on the surface, sejanus maintains a facade of respectful acceptance", "mild disappointment, echoing tiberius's reasoned tone", "expressing understanding. internally, he is experiencing a profound sense of frustration", "thwarted ambition. his disappointment at the direct rejection is palpable, likely tinged with suppressed anger", "a feeling of being strategically outmaneuvered. he is grappling with the blow to his aspirations, while carefully concealing his true emotional turmoil to avoid provoking tiberius's displeasure.", "on the surface", "sejanus maintains a facade of respectful acceptance and mild disappointment", "echoing tiberius's reasoned tone and expressing understanding. internally", "he is experiencing a profound sense of frustration and thwarted ambition. his disappointment at the direct rejection is palpable", "likely tinged with suppressed anger and a feeling of being strategically outmaneuvered. he is grappling with the blow to his aspirations", "while carefully concealing his true emotional turmoil to avoid provoking tiberius's displeasure.", "on the surface, sejanus maintains a facade of respectful acceptance and mild disappointment, echoing tiberius's reasoned tone and expressing understanding. internally, he is experiencing a profound sense of frustration and thwarted ambition. his disappointment at the direct rejection is palpable, likely tinged with suppressed anger and a feeling of being strategically outmaneuvered. he is grappling with the blow to his aspirations,", "carefully concealing his true emotional turmoil to avoid provoking tiberius's displeasure."],
        ap.active_plans = ["Attempt to understand the precise reasoning behind Tiberius's refusal to marry Livilla, probing for any possible avenues to still achieve his desired outcome or negotiate a compromise.", "Assess the sincerity and value of Tiberius's counter-proposal of marriage to Helen, evaluating whether this alternative alliance can still serve his broader ambitions, even if to a lesser extent.", "Maintain a composed and agreeable demeanor throughout the conversation to avoid antagonizing Tiberius, preserving his current position and ensuring continued access to the Emperor's confidence, despite this setback."],
        ap.beliefs = ["Marriage into the Imperial family, specifically to Livilla, is a critical step towards consolidating his power and achieving a status commensurate with his ambition and perceived worth.", "Tiberius, despite his shrewdness, can be influenced and persuaded through calculated arguments and appeals to reason, especially regarding matters of state and family alliances.", "His own capabilities and strategic importance to Tiberius's rule warrant greater recognition and advancement, even if it means navigating subtle power dynamics and imperial sensitivities."],
        ap.goals = ["Short-term: Secure a politically advantageous marriage that enhances his status and influence, even if it's not the initially desired union with Livilla, but her daughter Helen.", "Medium-term: Continue to strategically increase his power and proximity to the imperial family, positioning himself for greater influence and potential future advancement within the Roman hierarchy.", "Ultimate: Achieve a position of paramount power within Rome, potentially even surpassing the current limitations of his Praetorian Prefect role, aiming for a position of co-rule or significant imperial authority, though these ambitions are now complicated by Tiberius's refusal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits at his desk, reviewing documents with an air of authority. His posture is rigid and commanding, eyes focused intently on Sejanus, who stands before him. He gestures dismissively when rejecting Sejanus\'s marriage proposal, highlighting his imperial power.',
        ap.emotional_state = 'Tiberius exhibits a facade of cold detachment, masking the underlying paranoia and insecurity that fuel his decisions. His tone is firm yet condescending, revealing a simmering frustration at Sejanus\'s ambitions while he tries to maintain control over the situation.',
        ap.emotional_tags = ["tiberius exhibits a facade of cold detachment, masking the underlying paranoia", "insecurity that fuel his decisions. his tone is firm yet condescending, revealing a simmering frustration at sejanus's ambitions while he tries to maintain control over the situation.", "tiberius exhibits a facade of cold detachment", "masking the underlying paranoia and insecurity that fuel his decisions. his tone is firm yet condescending", "revealing a simmering frustration at sejanus's ambitions while he tries to maintain control over the situation.", "tiberius exhibits a facade of cold detachment, masking the underlying paranoia and insecurity that fuel his decisions. his tone is firm yet condescending, revealing a simmering frustration at sejanus's ambitions", "he tries to maintain control over the situation."],
        ap.active_plans = ["To assert his power by rejecting Sejanus's marriage proposal to Livilla.", "To manipulate the political landscape by suggesting a less contentious marriage to Helen.", "To maintain control over the Senate by filtering who has access to him through Sejanus."],
        ap.beliefs = ["Power must be wielded ruthlessly to maintain authority.", "Women cannot be trusted to remain loyal after marriage.", "Rivalries must be managed through strategic alliances to prevent threats to his reign."],
        ap.goals = ["Short-term: To firmly reject Sejanus's marriage proposal without provoking open dissent.", "Medium-term: To solidify his own position by manipulating Sejanus\u2019s ambitions.", "Ultimate: To preserve the stability of his rule amidst growing threats from within his own court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands before Tiberius, maintaining an outward posture of submission while internally bristling at the rejection. He holds a list of names, visibly marked, indicating his calculated approach to managing access to Tiberius.',
        ap.emotional_state = 'Sejanus hides his disappointment behind a mask of compliance, showcasing a blend of frustration and determination. Beneath the surface, he grapples with the sting of rejection, masking a growing resolve to maneuver through the political landscape despite Tiberius’s denouncement.',
        ap.emotional_tags = ["sejanus hides his disappointment behind a mask of compliance, showcasing a blend of frustration", "determination. beneath the surface, he grapples with the sting of rejection, masking a growing resolve to maneuver through the political landscape despite tiberius\u2019s denouncement.", "sejanus hides his disappointment behind a mask of compliance", "showcasing a blend of frustration and determination. beneath the surface", "he grapples with the sting of rejection", "masking a growing resolve to maneuver through the political landscape despite tiberius\u2019s denouncement."],
        ap.active_plans = ["To present Tiberius with a carefully curated list of individuals to showcase his ongoing influence.", "To subtly undermine Tiberius\u2019s authority by suggesting a more favorable marriage to Helen.", "To navigate the fallout of his proposal rejection and position himself favorably within the court."],
        ap.beliefs = ["Political power can be maintained through strategic manipulation and control.", "The Emperor\u2019s decisions can be swayed through careful presentation of information.", "Personal ambition is essential to achieving one's goals, even in the face of direct refusal."],
        ap.goals = ["Short-term: To recover from Tiberius's rejection by proposing an alternative marriage.", "Medium-term: To consolidate power by managing access to Tiberius and influencing the Senate.", "Ultimate: To secure a position of greater authority and influence within the Imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Emperor Tiberius is seated imperiously at his desk in his study, surrounded by documents that signify the weight of his office and the endless paperwork of governance. He gestures with a dismissive wave of his hand towards Sejanus, indicating the audience is at an end. His posture is relaxed yet commanding, leaning back slightly in his chair, observing Sejanus with a calculating gaze, ensuring his Prefect understands the finality of his pronouncements.',
        ap.emotional_state = 'Tiberius projects an air of detached imperial authority, his tone measured and seemingly reasonable as he explains his refusal. However, beneath this veneer of calm lies a deep-seated paranoia and suspicion. He is wary of Sejanus\'s ambition and influence, feeling threatened by the very power he has allowed him to accrue. His words are laced with subtle barbs and veiled accusations, revealing his distrust and his need to maintain absolute control. There\'s a hint of cruel amusement in his eyes as he toys with Sejanus, enjoying his discomfort and reinforcing his own dominance.',
        ap.emotional_tags = ["tiberius projects an air of detached imperial authority, his tone measured", "seemingly reasonable as he explains his refusal. however, beneath this veneer of calm lies a deep-seated paranoia", "suspicion. he is wary of sejanus's ambition", "influence, feeling threatened by the very power he has allowed him to accrue. his words are laced with subtle barbs", "veiled accusations, revealing his distrust", "his need to maintain absolute control. there's a hint of cruel amusement in his eyes as he toys with sejanus, enjoying his discomfort", "reinforcing his own dominance.", "tiberius projects an air of detached imperial authority", "his tone measured and seemingly reasonable as he explains his refusal. however", "beneath this veneer of calm lies a deep-seated paranoia and suspicion. he is wary of sejanus's ambition and influence", "feeling threatened by the very power he has allowed him to accrue. his words are laced with subtle barbs and veiled accusations", "revealing his distrust and his need to maintain absolute control. there's a hint of cruel amusement in his eyes as he toys with sejanus", "enjoying his discomfort and reinforcing his own dominance."],
        ap.active_plans = ["To firmly reject Sejanus's request to marry Livilla, ensuring no further escalation of Sejanus's power.", "To subtly probe Sejanus's reaction to the rejection, gauging his true level of disappointment and potential for future dissent.", "To assert his supreme authority by offering a 'compromise' marriage to Helen, Livilla's daughter, which is in reality another form of control and manipulation."],
        ap.beliefs = ["He believes that absolute power must be maintained through constant vigilance and distrust, seeing potential threats in even his most trusted advisors.", "He believes in manipulating people and situations to his advantage, using offers and denials as tools to control those around him.", "He believes that family lineage and public perception are critical to maintaining imperial stability, using these factors to justify his decisions, even if they are rooted in personal paranoia."],
        ap.goals = ["Short-term: End the audience with Sejanus decisively, leaving no room for further negotiation on the marriage proposal.", "Medium-term: Weaken Sejanus's growing influence by denying him a strategic marriage and reminding him of his subordinate position.", "Ultimate: Secure his reign by preemptively eliminating any potential challenges to his authority, ensuring his continued dominance and legacy, even through fear and manipulation."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_4'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands rigidly before Tiberius\'s desk, his body language initially composed and respectful as befitting a Praetorian Prefect addressing his Emperor. As Tiberius delivers his rejection, Sejanus maintains a facade of calm attentiveness, though his posture subtly stiffens, and his hands may clench slightly, betraying his inner tension. He listens intently, his gaze fixed on Tiberius, seeking to decipher the true meaning behind the Emperor\'s words and the extent of his disapproval.',
        ap.emotional_state = 'On the surface, Sejanus presents an image of controlled disappointment and deference, carefully masking his true emotions. However, internally, he is experiencing a surge of frustration and suppressed anger at Tiberius\'s blunt rejection of his marriage proposal. He feels undermined and potentially humiliated, as his carefully laid plans are thwarted. There is a conflict between his outward show of loyalty and his simmering ambition, a tension that threatens to boil over. He is acutely aware of the precariousness of his position, needing to balance his desire for power with the necessity of maintaining Tiberius\'s favor.',
        ap.emotional_tags = ["on the surface, sejanus presents an image of controlled disappointment", "deference, carefully masking his true emotions. however, internally, he is experiencing a surge of frustration", "suppressed anger at tiberius's blunt rejection of his marriage proposal. he feels undermined", "potentially humiliated, as his carefully laid plans are thwarted. there is a conflict between his outward show of loyalty", "his simmering ambition, a tension that threatens to boil over. he is acutely aware of the precariousness of his position, needing to balance his desire for power with the necessity of maintaining tiberius's favor.", "on the surface", "sejanus presents an image of controlled disappointment and deference", "carefully masking his true emotions. however", "internally", "he is experiencing a surge of frustration and suppressed anger at tiberius's blunt rejection of his marriage proposal. he feels undermined and potentially humiliated", "as his carefully laid plans are thwarted. there is a conflict between his outward show of loyalty and his simmering ambition", "a tension that threatens to boil over. he is acutely aware of the precariousness of his position", "needing to balance his desire for power with the necessity of maintaining tiberius's favor."],
        ap.active_plans = ["To understand the Emperor's stated reasons for rejection, probing for any possible loopholes or avenues for future persuasion.", "To maintain a respectful and subservient demeanor, avoiding any outward display of anger or resentment that could be interpreted as disloyalty.", "To subtly gauge the Emperor's true feelings towards him, assessing whether this rejection is a temporary setback or a sign of deeper distrust and potential downfall."],
        ap.beliefs = ["He believes that marriage to Livilla is a crucial step towards consolidating his power and influence, essential for his long-term ambitions.", "He believes in his own cunning and ability to manipulate situations to his advantage, still hoping to find a way to overcome Tiberius's objections.", "He believes that maintaining the appearance of loyalty to Tiberius is paramount for his survival and continued advancement, even while harboring ambitions that contradict this loyalty."],
        ap.goals = ["Short-term: To exit the audience without showing any sign of weakness or dissent, preserving his image and avoiding immediate repercussions.", "Medium-term: To reassess his strategy for gaining power, considering the 'compromise' marriage to Helen while also exploring alternative paths to influence.", "Ultimate: To ultimately achieve a position of supreme power, possibly even surpassing Tiberius, though for now, survival and strategic maneuvering are his more immediate priorities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_1'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus stands in the dim light of Tiberius\'s study, his posture poised and attentive. He maintains an unreadable expression, carefully observing Tiberius as the Emperor grapples with his decisions. Thrasyllus\'s demeanor is steady, conveying an air of calm amidst the tension as he responds to Tiberius\'s questions.',
        ap.emotional_state = 'On the surface, Thrasyllus appears calm and composed, showing no signs of agitation or doubt. Internally, however, there may be a subtle tension—an awareness of the precariousness of Tiberius\'s position and the potential ramifications of his decisions. His commitment to offering support suggests a conflict between loyalty and the inherent dangers of serving a ruler plagued by insecurity.',
        ap.emotional_tags = ["on the surface, thrasyllus appears calm", "composed, showing no signs of agitation or doubt. internally, however, there may be a subtle tension\u2014an awareness of the precariousness of tiberius's position", "the potential ramifications of his decisions. his commitment to offering support suggests a conflict between loyalty", "the inherent dangers of serving a ruler plagued by insecurity.", "on the surface", "thrasyllus appears calm and composed", "showing no signs of agitation or doubt. internally", "however", "there may be a subtle tension\u2014an awareness of the precariousness of tiberius's position and the potential ramifications of his decisions. his commitment to offering support suggests a conflict between loyalty and the inherent dangers of serving a ruler plagued by insecurity."],
        ap.active_plans = ["To affirm Tiberius's decision regarding the marriage denial to bolster the Emperor's confidence.", "To navigate the treacherous political landscape by aligning himself with Tiberius's choices and maintaining his position.", "To subtly influence Tiberius's perceptions of Sejanus and other court players, ensuring his own survival."],
        ap.beliefs = ["Loyalty to Tiberius is crucial for his own safety and position.", "Power dynamics are ever-shifting, and one must adapt to survive.", "The political landscape is fraught with betrayal, and one must tread cautiously."],
        ap.goals = ["Short-term: To reinforce Tiberius's sense of control and validate his decisions.", "Medium-term: To maintain his position as a trusted advisor amidst the court\u2019s machinations.", "Ultimate: To navigate the treacherous waters of Imperial politics without becoming a target himself."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_2'})
    ON CREATE SET
        ap.current_status = 'Thrasyllus enters Tiberius\'s study, his posture formal and deferential as he stands before the seated Emperor. He maintains an air of composed attentiveness, his body language conveying respect and readiness to serve. His responses are measured and concise, carefully chosen to align with Tiberius\'s line of questioning, never volunteering information but answering directly when prompted.',
        ap.emotional_state = 'Thrasyllus presents a facade of impassivity, his face deliberately unreadable to mask his true feelings. Beneath this controlled exterior, he is acutely aware of the precariousness of his position and the volatile nature of Tiberius\'s mind. He is likely feeling a mix of caution and shrewd calculation, carefully weighing his words to avoid any misstep that could displease the Emperor. There\'s an undercurrent of self-preservation guiding his emotional state, prioritizing safety and stability in the treacherous court.',
        ap.emotional_tags = ["thrasyllus presents a facade of impassivity, his face deliberately unreadable to mask his true feelings. beneath this controlled exterior, he is acutely aware of the precariousness of his position", "the volatile nature of tiberius's mind. he is likely feeling a mix of caution", "shrewd calculation, carefully weighing his words to avoid any misstep that could displease the emperor. there's an undercurrent of self-preservation guiding his emotional state, prioritizing safety", "stability in the treacherous court.", "thrasyllus presents a facade of impassivity", "his face deliberately unreadable to mask his true feelings. beneath this controlled exterior", "he is acutely aware of the precariousness of his position and the volatile nature of tiberius's mind. he is likely feeling a mix of caution and shrewd calculation", "carefully weighing his words to avoid any misstep that could displease the emperor. there's an undercurrent of self-preservation guiding his emotional state", "prioritizing safety and stability in the treacherous court."],
        ap.active_plans = ["To carefully gauge Tiberius's true motivations behind offering Helen instead of Livilla to Sejanus, discerning if it's a genuine compromise or a more intricate manipulation.", "To provide responses that validate Tiberius's decisions and bolster his sense of wisdom, reinforcing the Emperor's confidence in his own judgment.", "To maintain his unreadable demeanor, preventing Tiberius from discerning his personal opinions or any potential reservations about the Emperor's strategy, thus preserving his position as a trusted, if enigmatic, advisor."],
        ap.beliefs = ["The Emperor's favor is the ultimate currency in Roman politics, and maintaining it is crucial for survival and influence.", "Discretion and ambiguity are powerful tools for advisors in the Imperial court, allowing for flexibility and avoiding direct confrontation.", "Appeasing powerful figures like Sejanus, even with seemingly hollow gestures, is a necessary tactic to manage immediate threats and maintain a semblance of stability."],
        ap.goals = ["Short-term: To answer Tiberius's questions in a way that satisfies the Emperor's need for validation and reinforces his self-perception of wisdom.", "Medium-term: To solidify his position as a trusted advisor by consistently offering counsel that aligns with Tiberius's inclinations and strengthens his confidence.", "Ultimate: To navigate the treacherous political landscape by remaining indispensable to Tiberius, ensuring his own long-term survival and potentially increasing his subtle influence within the court without drawing undue attention."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_vine_branch_event_5_5'})
    ON CREATE SET
        oi.description = 'The vine branch is summoned by Tiberius as a symbol of punishment and control, representing the physical repercussions of defiance against his authority. Its invocation serves as a chilling reminder of the consequences that await those who challenge the Emperor, further emphasizing the dangerous atmosphere of the Imperial court.',
        oi.status_before = 'Prior to the event, the vine branch lies untouched within Tiberius\'s study, a mere object of nature devoid of its ominous connotations. It rests among the decorum, representing the serene façade of the Emperor\'s solitude.',
        oi.status_after = 'Following the event, the vine branch becomes a vivid symbol of Tiberius’s capacity for cruelty and punishment, forever linked to Agrippina’s defiance. It may be seen as a reminder of the Emperor\'s merciless decree and the lengths to which he will go to maintain his power.'
    WITH oi
    MATCH (o:Object {uuid: 'object_vine_branch'})
    MATCH (e:Event {uuid: 'event_5_5'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_vine_branch_event_5_6'})
    ON CREATE SET
        oi.description = 'The vine branch is explicitly demanded by Tiberius as an instrument of punishment. It is to be used to flog Agrippina, symbolizing a brutal, physical assertion of his imperial power and a starkly visceral response to her final act of defiance. The object’s involvement is not merely functional; it represents the raw, unchecked authority of Tiberius, transforming a simple agricultural tool into a weapon of imperial vindictiveness and dominance, highlighting the cruelty at the heart of his rule.',
        oi.status_before = 'The vine branch is presumed to be readily available within Tiberius\'s study or nearby, perhaps kept as a symbol of Roman authority or for less violent purposes. It exists as a neutral object, awaiting direction and purpose from Tiberius, its owner.',
        oi.status_after = 'The vine branch, once brought into the scene at Tiberius\'s command, becomes charged with menace. It is transformed into a symbol of impending violence and Agrippina\'s imminent humiliation. Its status shifts from an inert object to a potent representation of Tiberius\'s tyrannical power and the brutal consequences of challenging him, foreshadowing physical pain and degradation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_vine_branch'})
    MATCH (e:Event {uuid: 'event_5_6'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands firm, her posture defiant as she faces Tiberius. Her eyes blaze with indignation, hands perhaps clenched at her sides or gesturing dramatically as she launches scathing critiques of his rule. The energy in the room shifts as she refuses to back down, embodying a fierce resolve and urgency.',
        ap.emotional_state = 'Agrippina is a tempest of defiance and righteousness. On the surface, she\'s fiercely confrontational, her tone laced with scorn and contempt for Tiberius. Internally, however, she wrestles with the gravity of her situation; her love for her family fuels her anger, yet beneath that, there\'s the sharp sting of fear for their safety. She is acutely aware of the stakes involved.',
        ap.emotional_tags = ["agrippina is a tempest of defiance", "righteousness. on the surface, she's fiercely confrontational, her tone laced with scorn", "contempt for tiberius. internally, however, she wrestles with the gravity of her situation; her love for her family fuels her anger, yet beneath that, there's the sharp sting of fear for their safety. she is acutely aware of the stakes involved.", "agrippina is a tempest of defiance and righteousness. on the surface", "she's fiercely confrontational", "her tone laced with scorn and contempt for tiberius. internally", "however", "she wrestles with the gravity of her situation; her love for her family fuels her anger", "yet beneath that", "there's the sharp sting of fear for their safety. she is acutely aware of the stakes involved.", "agrippina is a tempest of defiance and righteousness. on the surface, she's fiercely confrontational, her tone laced with scorn and contempt for tiberius. internally, however, she wrestles with the gravity of her situation", "her love for her family fuels her anger, yet beneath that, there's the sharp sting of fear for their safety. she is acutely aware of the stakes involved."],
        ap.active_plans = ["To challenge Tiberius's authority and highlight his weaknesses.", "To assert the legitimacy of her family's claim to power over Tiberius's reign.", "To expose the influence of Sejanus as a threat to both her family and Rome."],
        ap.beliefs = ["Rome deserves strong and just leadership, not the tyrannical rule of an aging emperor.", "Her family's legacy is worth fighting for, even at great personal risk.", "Seniority and lineage should not dictate power; merit and strength should prevail."],
        ap.goals = ["Short-term: To confront Tiberius and make him aware of her dissent.", "Medium-term: To undermine Tiberius's authority and rally support for her family's claim.", "Ultimate: To ensure the safety and succession of her sons over Tiberius's potential heirs."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits with an air of authority, his body language relaxed yet guarded. He wields his power with a dismissive wave of his hand, attempting to diminish Agrippina\'s fiery presence. His posture is one of calculated indifference, but there’s an underlying tension as he responds to her provocations with biting retorts.',
        ap.emotional_state = 'Tiberius exhibits a facade of control, masking his growing paranoia and irritation at Agrippina\'s defiance. His dismissive remarks suggest a blend of annoyance and condescension, but beneath this lies an acute awareness of the threats he faces. He is defensive, trying to maintain authority while grappling with the potential consequences of Agrippina’s accusations.',
        ap.emotional_tags = ["tiberius exhibits a facade of control, masking his growing paranoia", "irritation at agrippina's defiance. his dismissive remarks suggest a blend of annoyance", "condescension, but beneath this lies an acute awareness of the threats he faces. he is defensive, trying to maintain authority while grappling with the potential consequences of agrippina\u2019s accusations.", "tiberius exhibits a facade of control", "masking his growing paranoia and irritation at agrippina's defiance. his dismissive remarks suggest a blend of annoyance and condescension", "but beneath this lies an acute awareness of the threats he faces. he is defensive", "trying to maintain authority while grappling with the potential consequences of agrippina\u2019s accusations.", "tiberius exhibits a facade of control, masking his growing paranoia and irritation at agrippina's defiance. his dismissive remarks suggest a blend of annoyance and condescension, but beneath this lies an acute awareness of the threats he faces. he is defensive, trying to maintain authority", "grappling with the potential consequences of agrippina\u2019s accusations.", "tiberius exhibits a facade of control, masking his growing paranoia and irritation at agrippina's defiance. his dismissive remarks suggest a blend of annoyance and condescension,", "beneath this lies an acute awareness of the threats he faces. he is defensive, trying to maintain authority while grappling with the potential consequences of agrippina\u2019s accusations."],
        ap.active_plans = ["To maintain his authority and assert control over Agrippina.", "To deflect her criticisms by mocking her emotional state and perceived dramatic flair.", "To manipulate the situation by threatening exile, showcasing his power over her and her family."],
        ap.beliefs = ["Authority must be maintained at all costs to preserve the stability of the empire.", "Dissent must be crushed swiftly to avoid emboldening further opposition.", "He sees himself as a legitimate ruler, despite Agrippina's challenges."],
        ap.goals = ["Short-term: To intimidate Agrippina into silence and compliance.", "Medium-term: To secure his position by eliminating dissenting voices like hers.", "Ultimate: To navigate the political landscape while protecting his legacy against perceived threats."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands before Tiberius, her posture rigid with defiance. She gestures emphatically as she speaks, her movements sharp and purposeful, emphasizing the force of her accusations. Her eyes blaze as she confronts the Emperor directly, showing no fear despite the perilous situation she is in.',
        ap.emotional_state = 'On the surface, Agrippina exudes righteous fury and scorn, her tone dripping with contempt for Tiberius whom she sees as weak and manipulated. Beneath this anger, there is a deep-seated frustration and fear for her family\'s future. She is battling not just for herself but for her sons, masking her vulnerability with a bold and aggressive demeanor, desperately trying to provoke a reaction from the seemingly detached Emperor.',
        ap.emotional_tags = ["on the surface, agrippina exudes righteous fury", "scorn, her tone dripping with contempt for tiberius whom she sees as weak", "manipulated. beneath this anger, there is a deep-seated frustration", "fear for her family's future. she is battling not just for herself but for her sons, masking her vulnerability with a bold", "aggressive demeanor, desperately trying to provoke a reaction from the seemingly detached emperor.", "on the surface", "agrippina exudes righteous fury and scorn", "her tone dripping with contempt for tiberius whom she sees as weak and manipulated. beneath this anger", "there is a deep-seated frustration and fear for her family's future. she is battling not just for herself but for her sons", "masking her vulnerability with a bold and aggressive demeanor", "desperately trying to provoke a reaction from the seemingly detached emperor.", "on the surface, agrippina exudes righteous fury and scorn, her tone dripping with contempt for tiberius whom she sees as weak and manipulated. beneath this anger, there is a deep-seated frustration and fear for her family's future. she is battling not just for herself", "for her sons, masking her vulnerability with a bold and aggressive demeanor, desperately trying to provoke a reaction from the seemingly detached emperor."],
        ap.active_plans = ["To expose Tiberius's dependence on Sejanus and his declining grip on power.", "To assert the rightful claim of Germanicus's sons to the succession, reminding Tiberius of their family's popularity and merit.", "To provoke Tiberius into revealing his true intentions and to gauge the extent of his senility or cunning."],
        ap.beliefs = ["Her family, through Germanicus, represents true Roman nobility and virtue, contrasting sharply with Tiberius's perceived failings.", "Tiberius is no longer fit to rule, being easily swayed by Sejanus, who is a poisonous influence.", "The people of Rome naturally favor her family, and this popular support is a source of power and legitimacy."],
        ap.goals = ["Short-term: To verbally dominate Tiberius and land impactful blows in their confrontation.", "Medium-term: To sway Tiberius to consider her sons as successors, or at least to plant seeds of doubt about Sejanus's influence.", "Ultimate: To secure the imperial succession for her sons and ensure the survival and prominence of her family in Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius remains seated, observing Agrippina with a chilling detachment. He initially attempts to dismiss her with sarcasm, but as the confrontation escalates, his demeanor hardens. He uses measured words, each sentence a calculated move in their power play. Towards the end, he signals for a vine branch, a physical manifestation of his imperial authority and impending punishment.',
        ap.emotional_state = 'Tiberius outwardly presents a facade of sardonic amusement and imperial calm, attempting to belittle Agrippina\'s passionate outburst. However, beneath this veneer, he is deeply threatened by Agrippina\'s popularity and her accusations strike a nerve, revealing his paranoia and insecurity about his rule. He is internally conflicted, feeling both resentment towards Agrippina\'s family and a strategic need to control the narrative of succession.',
        ap.emotional_tags = ["tiberius outwardly presents a facade of sardonic amusement", "imperial calm, attempting to belittle agrippina's passionate outburst. however, beneath this veneer, he is deeply threatened by agrippina's popularity", "her accusations strike a nerve, revealing his paranoia", "insecurity about his rule. he is internally conflicted, feeling both resentment towards agrippina's family", "a strategic need to control the narrative of succession.", "tiberius outwardly presents a facade of sardonic amusement and imperial calm", "attempting to belittle agrippina's passionate outburst. however", "beneath this veneer", "he is deeply threatened by agrippina's popularity and her accusations strike a nerve", "revealing his paranoia and insecurity about his rule. he is internally conflicted", "feeling both resentment towards agrippina's family and a strategic need to control the narrative of succession."],
        ap.active_plans = ["To assert his imperial authority and dominance over Agrippina, reminding her of her subordinate position.", "To provoke Agrippina into further incriminating herself with her defiant words, justifying his actions against her.", "To neutralize Agrippina and her sons as potential threats to his rule and the succession, ensuring his continued control and legacy."],
        ap.beliefs = ["As Emperor, his authority is absolute and unquestionable, and dissent must be crushed ruthlessly.", "Agrippina and her family are a direct challenge to his power and must be eliminated to secure his dynasty.", "Fear and punishment are effective tools to maintain order and control in the face of opposition."],
        ap.goals = ["Short-term: To win the verbal sparring match with Agrippina, demonstrating his intellectual and political superiority.", "Medium-term: To exile Agrippina and Nero, effectively removing them from the Roman political landscape and diminishing their influence.", "Ultimate: To solidify his power, secure the succession in a way that benefits him (even if through Livilla's son), and quell any challenges to his imperial authority."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands defiantly in Tiberius\'s study, her posture straight and unwavering, with eyes blazing with intensity. She gestures emphatically as she challenges Tiberius, her movements sharp and purposeful, embodying her fierce spirit amid the tension of their confrontation.',
        ap.emotional_state = 'Agrippina\'s surface emotions reveal a fierce defiance and anger towards Tiberius, her words laced with contempt and righteous fury. Internally, she grapples with desperation and urgency, as the stakes of her family\'s survival hover over her in this dangerous political arena. The conflict between her maternal instincts and the harsh reality of power creates a storm within her.',
        ap.emotional_tags = ["agrippina's surface emotions reveal a fierce defiance", "anger towards tiberius, her words laced with contempt", "righteous fury. internally, she grapples with desperation", "urgency, as the stakes of her family's survival hover over her in this dangerous political arena. the conflict between her maternal instincts", "the harsh reality of power creates a storm within her.", "agrippina's surface emotions reveal a fierce defiance and anger towards tiberius", "her words laced with contempt and righteous fury. internally", "she grapples with desperation and urgency", "as the stakes of her family's survival hover over her in this dangerous political arena. the conflict between her maternal instincts and the harsh reality of power creates a storm within her."],
        ap.active_plans = ["To confront Tiberius directly about his senility and the threats to her family's legacy.", "To undermine Tiberius's authority by questioning his judgment on succession and exposing Sejanus's manipulations.", "To secure a favorable position for her son, Nero, in the line of succession against Tiberius's plans."],
        ap.beliefs = ["The belief that her family's legacy and honor must be protected at all costs.", "The conviction that Tiberius's rule is failing and dangerous, needing to be challenged.", "The understanding that only the sons of Germanicus are fit to rule Rome, contrasting with Tiberius's choice."],
        ap.goals = ["Short-term: To assert her influence over Tiberius and advocate for her family's position.", "Medium-term: To expose Sejanus's treachery and secure a safe future for her son, Nero.", "Ultimate: To restore the rightful legacy of Germanicus and ensure competent leadership for Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius, seated behind his desk, displays a relaxed yet commanding presence. He leans slightly back, arms crossed, exuding a facade of control despite the charged atmosphere. His gestures are dismissive, as he waves Agrippina off, embodying the arrogance of power as he responds to her provocations.',
        ap.emotional_state = 'Tiberius’s surface demeanor is calm and sardonic, showing amusement in the face of Agrippina\'s ire. Beneath this, however, lies a turbulent mix of paranoia and frustration. He feels threatened by Agrippina’s boldness and is increasingly aware of his own vulnerabilities, fighting against the encroachment of age and the machinations of those around him.',
        ap.emotional_tags = ["tiberius\u2019s surface demeanor is calm", "sardonic, showing amusement in the face of agrippina's ire. beneath this, however, lies a turbulent mix of paranoia", "frustration. he feels threatened by agrippina\u2019s boldness", "is increasingly aware of his own vulnerabilities, fighting against the encroachment of age", "the machinations of those around him.", "tiberius\u2019s surface demeanor is calm and sardonic", "showing amusement in the face of agrippina's ire. beneath this", "however", "lies a turbulent mix of paranoia and frustration. he feels threatened by agrippina\u2019s boldness and is increasingly aware of his own vulnerabilities", "fighting against the encroachment of age and the machinations of those around him."],
        ap.active_plans = ["To assert his authority by exiling Agrippina and undermining her influence.", "To reinforce his power by claiming the legitimacy of his chosen successor, Livilla's child, Gemellus.", "To dismiss the threat posed by Agrippina and solidify his control over the succession narrative in Rome."],
        ap.beliefs = ["The conviction that he must eliminate threats to maintain his power as emperor, regardless of familial ties.", "The belief that he is still in control, despite the signs of senility creeping into his governance.", "The understanding that loyalty is fleeting and must be constantly enforced through fear and manipulation."],
        ap.goals = ["Short-term: To successfully exile Agrippina and quell her challenges to his authority.", "Medium-term: To establish Gemellus as his successor to secure his lineage's control over Rome.", "Ultimate: To maintain his reign and legacy, ensuring that no one threatens his grip on power until his death."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Agrippina storms into Tiberius\'s study, ushered in but radiating defiance. She stands tall, posture erect, her gaze fixed and blazing directly at Tiberius, embodying a physical challenge to his authority. Her movements are likely sharp and deliberate as she engages in a heated verbal duel, her presence filling the room with righteous fury and unwavering conviction.',
        ap.emotional_state = 'Agrippina\'s surface emotions are a volatile mix of anger and contempt, evident in her sharp retorts and accusations, calling Tiberius a \'Roman farce\'. Beneath this outward rage lies a deep-seated fear for her sons\' future and a desperate desire to protect her family\'s legacy.  There\'s a palpable tension between her controlled defiance and the underlying anxiety of challenging the Emperor directly, showcasing her bravery masking vulnerability.',
        ap.emotional_tags = ["agrippina's surface emotions are a volatile mix of anger", "contempt, evident in her sharp retorts", "accusations, calling tiberius a 'roman farce'. beneath this outward rage lies a deep-seated fear for her sons' future", "a desperate desire to protect her family's legacy.  there's a palpable tension between her controlled defiance", "the underlying anxiety of challenging the emperor directly, showcasing her bravery masking vulnerability.", "agrippina's surface emotions are a volatile mix of anger and contempt", "evident in her sharp retorts and accusations", "calling tiberius a 'roman farce'. beneath this outward rage lies a deep-seated fear for her sons' future and a desperate desire to protect her family's legacy.  there's a palpable tension between her controlled defiance and the underlying anxiety of challenging the emperor directly", "showcasing her bravery masking vulnerability."],
        ap.active_plans = ["To expose Tiberius's weakness and dependence on Sejanus, undermining his image of absolute power.", "To advocate for her sons as the most suitable and popular successors, directly challenging Tiberius's succession plans.", "To provoke Tiberius into revealing his true intentions and motivations, forcing him to confront the reality of his declining rule and Sejanus's growing influence."],
        ap.beliefs = ["Her family, descended from Germanicus, is inherently more virtuous and deserving of leadership than Tiberius and his lineage.", "Tiberius is no longer fit to rule, blinded by age and manipulated by Sejanus, making him a danger to Rome.", "True Roman leadership should be based on merit and popular support, not merely hereditary succession, thus validating her sons' claim."],
        ap.goals = ["Short-term: To verbally dismantle Tiberius's authority and expose Sejanus's control in this direct confrontation.", "Medium-term: To secure recognition for her sons as the legitimate heirs to the empire, countering Tiberius's stated preference for Gemellus.", "Ultimate: To ensure the long-term safety and political dominance of her family, safeguarding her sons from the treacherous machinations of the Roman court and securing their future rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius is positioned within his study, likely seated or standing with an air of imperial composure initially, though his posture shifts as Agrippina\'s accusations escalate. He engages Agrippina with sarcastic remarks and dismissive gestures, attempting to maintain control of the conversation. As the argument intensifies, his demeanor hardens, culminating in a direct, threatening command for a vine branch, signaling a shift from verbal sparring to physical intimidation.',
        ap.emotional_state = 'On the surface, Tiberius displays a veneer of sarcastic amusement and imperial detachment, mocking Agrippina\'s dramatic entrance and dismissing her concerns. Internally, he is increasingly agitated and insecure, feeling threatened by Agrippina\'s popularity and her bold challenge to his authority.  His paranoia is inflamed by her accusations of Sejanus\'s control, revealing a deep-seated fear of losing his grip on power and a growing rage at being confronted and undermined.',
        ap.emotional_tags = ["on the surface, tiberius displays a veneer of sarcastic amusement", "imperial detachment, mocking agrippina's dramatic entrance", "dismissing her concerns. internally, he is increasingly agitated", "insecure, feeling threatened by agrippina's popularity", "her bold challenge to his authority.  his paranoia is inflamed by her accusations of sejanus's control, revealing a deep-seated fear of losing his grip on power", "a growing rage at being confronted", "undermined.", "on the surface", "tiberius displays a veneer of sarcastic amusement and imperial detachment", "mocking agrippina's dramatic entrance and dismissing her concerns. internally", "he is increasingly agitated and insecure", "feeling threatened by agrippina's popularity and her bold challenge to his authority.  his paranoia is inflamed by her accusations of sejanus's control", "revealing a deep-seated fear of losing his grip on power and a growing rage at being confronted and undermined."],
        ap.active_plans = ["To reassert his dominance over Agrippina through verbal barbs and threats, reminding her of his absolute power as Emperor.", "To dismiss Agrippina's claim for her sons' succession and reaffirm his own right to choose, even if it's a hollow claim regarding Gemellus.", "To silence Agrippina permanently by exiling her, removing a significant political threat and demonstrating his ruthlessness to any potential dissenters."],
        ap.beliefs = ["As Emperor, his authority is absolute and unquestionable, granting him the sole right to determine his successor and punish any opposition.", "Agrippina and her family are dangerous rivals who must be neutralized to secure his dynasty and maintain order.", "Fear and intimidation are effective tools for maintaining control, and physical punishment is a justifiable means to enforce obedience and suppress defiance."],
        ap.goals = ["Short-term: To humiliate and silence Agrippina in this confrontation, asserting his dominance in his study.", "Medium-term: To ensure his succession remains under his control, even if he is indecisive about Gemellus, and to eliminate Agrippina as a political rival through exile.", "Ultimate: To solidify his legacy as the unchallenged Emperor of Rome, crushing any threats to his power and ensuring the continuation of his rule through his chosen arrangements, however fragile or paranoid they may be."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands defiantly in Tiberius\'s study, posture firm and unyielding. She faces Tiberius with blazing eyes, her body radiating tension as she confronts him with sharp words that pierce the thick air of the chamber. Her hands may clench at her sides, a testament to her concealed fury.',
        ap.emotional_state = 'Agrippina\'s outer facade is a mask of fierce defiance, her voice steady yet seething with indignation. Beneath this bravado lies a tempest of fear and desperation for her family’s legacy, battling against the realization of her impending exile. The conflict between her righteous anger and the looming threat of punishment creates a palpable tension in her demeanor.',
        ap.emotional_tags = ["agrippina's outer facade is a mask of fierce defiance, her voice steady yet seething with indignation. beneath this bravado lies a tempest of fear", "desperation for her family\u2019s legacy, battling against the realization of her impending exile. the conflict between her righteous anger", "the looming threat of punishment creates a palpable tension in her demeanor.", "agrippina's outer facade is a mask of fierce defiance", "her voice steady yet seething with indignation. beneath this bravado lies a tempest of fear and desperation for her family\u2019s legacy", "battling against the realization of her impending exile. the conflict between her righteous anger and the looming threat of punishment creates a palpable tension in her demeanor."],
        ap.active_plans = ["To challenge Tiberius's decree with her sharp tongue and defiance, hoping to sway him or at least reveal his weaknesses.", "To assert the legitimacy and strength of her family's legacy, positioning her sons as rightful heirs to the throne.", "To expose Sejanus's manipulations and undermine his influence over Tiberius, reclaiming power for her family."],
        ap.beliefs = ["Power must be wielded by those with the strongest will and moral backbone, like her family.", "Tiberius's reign is crumbling, making it imperative to seize the moment for her family's benefit.", "Loyalty should belong to family first, and any betrayal must be met with fierce resistance."],
        ap.goals = ["Short-term: To convince Tiberius to reconsider her exile and that of her son Nero.", "Medium-term: To protect her family from Tiberius's whims by rallying support amongst allies.", "Ultimate: To restore her family's stature and influence in Rome, ensuring her sons succeed where their father could not."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_5'})
    ON CREATE SET
        ap.current_status = 'Tiberius sits behind a grand desk in his study, his posture exuding an air of cold authority. He maintains a composed demeanor, but his eyes glint with a mix of amusement and malice as he delivers his decree to Agrippina. His gestures are deliberate, a thin smile curving his lips as he mocks her predicament.',
        ap.emotional_state = 'Tiberius presents a facade of calm but is internally tempestuous, grappling with the irritation Agrippina provokes. His surface nonchalance masks a deep-seated paranoia and resentment towards her challenge. He clings to his power tightly, yet his weariness suggests that he is burdened by the constant threat of opposition, particularly from Sejanus\'s cunning manipulations.',
        ap.emotional_tags = ["tiberius presents a facade of calm but is internally tempestuous, grappling with the irritation agrippina provokes. his surface nonchalance masks a deep-seated paranoia", "resentment towards her challenge. he clings to his power tightly, yet his weariness suggests that he is burdened by the constant threat of opposition, particularly from sejanus's cunning manipulations.", "tiberius presents a facade of calm but is internally tempestuous", "grappling with the irritation agrippina provokes. his surface nonchalance masks a deep-seated paranoia and resentment towards her challenge. he clings to his power tightly", "yet his weariness suggests that he is burdened by the constant threat of opposition", "particularly from sejanus's cunning manipulations.", "tiberius presents a facade of calm", "is internally tempestuous, grappling with the irritation agrippina provokes. his surface nonchalance masks a deep-seated paranoia and resentment towards her challenge. he clings to his power tightly, yet his weariness suggests that he is burdened by the constant threat of opposition, particularly from sejanus's cunning manipulations."],
        ap.active_plans = ["To assert his authority by exiling Agrippina, reinforcing his control over the political landscape.", "To manipulate the situation to his advantage, using Agrippina's anger as leverage against her family.", "To ensure that his own legacy continues through Livilla's son, demonstrating his determination to shape Rome\u2019s future on his terms."],
        ap.beliefs = ["Authority must be maintained at all costs, and those who challenge it will be swiftly reminded of their place.", "Weakness invites betrayal; thus, he must constantly project strength and control.", "The destinies of the empire are shaped by the decisions of the emperor, and he will not allow Agrippina to disrupt this balance."],
        ap.goals = ["Short-term: To successfully execute the exile of Agrippina and Nero without backlash.", "Medium-term: To solidify his alliances and ensure Sejanus\u2019s loyalty while keeping potential threats at bay.", "Ultimate: To secure his position as Emperor and dictate the future of Rome, eliminating all challenges to his rule."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_6'})
    ON CREATE SET
        ap.current_status = 'Agrippina stands tall and unyielding before Tiberius, her body language radiating defiance despite the dire circumstances. Her eyes are ablaze with righteous anger as she delivers a final, scathing insult, her voice ringing with contempt. She makes no move to retreat or soften her stance, fully embracing the consequences of her words.',
        ap.emotional_state = 'Agrippina\'s surface emotion is one of intense fury and disdain, spitting out the insult \'blood-soaked mud\' with venomous force. Beneath this outward rage, there is a deep well of sorrow and frustration at her powerlessness against Tiberius\'s tyranny. She is likely battling despair at her impending exile, but her pride and defiance prevent any outward display of weakness, choosing to go down fighting with words.',
        ap.emotional_tags = ["agrippina's surface emotion is one of intense fury", "disdain, spitting out the insult 'blood-soaked mud' with venomous force. beneath this outward rage, there is a deep well of sorrow", "frustration at her powerlessness against tiberius's tyranny. she is likely battling despair at her impending exile, but her pride", "defiance prevent any outward display of weakness, choosing to go down fighting with words.", "agrippina's surface emotion is one of intense fury and disdain", "spitting out the insult 'blood-soaked mud' with venomous force. beneath this outward rage", "there is a deep well of sorrow and frustration at her powerlessness against tiberius's tyranny. she is likely battling despair at her impending exile", "but her pride and defiance prevent any outward display of weakness", "choosing to go down fighting with words.", "agrippina's surface emotion is one of intense fury and disdain, spitting out the insult 'blood-soaked mud' with venomous force. beneath this outward rage, there is a deep well of sorrow and frustration at her powerlessness against tiberius's tyranny. she is likely battling despair at her impending exile,", "her pride and defiance prevent any outward display of weakness, choosing to go down fighting with words."],
        ap.active_plans = ["To deliver a final, impactful condemnation of Tiberius's rule.", "To strip away any pretense of respect or fear Tiberius might expect.", "To solidify her image as a defiant opponent of tyranny, even in defeat."],
        ap.beliefs = ["Tiberius is a corrupt and cruel tyrant, undeserving of respect.", "Her family's honor and legacy are worth defending, even at great personal cost.", "Speaking truth to power, however dangerous, is a moral imperative."],
        ap.goals = ["short-term: To inflict maximum psychological damage on Tiberius with her final insult.", "medium-term: To leave a lasting impression of her defiance that will resonate beyond her exile.", "ultimate: To inspire future resistance against tyranny and uphold the values she believes in, even if she cannot personally witness its success."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_6'})
    ON CREATE SET
        ap.current_status = 'Initially seated and feigning composure, Tiberius is jolted by Agrippina\'s insult. His facade of detached amusement crumbles, replaced by raw, unfiltered rage. He slams his hand on the table, his voice rising in fury as he barks the command for a vine branch, his body tense with uncontrolled anger and a desire for immediate, brutal retribution.',
        ap.emotional_state = 'On the surface, Tiberius displays explosive anger, a violent outburst triggered by Agrippina\'s final insult. Internally, he is driven by deep-seated paranoia and a desperate need to assert his absolute authority. Agrippina\'s words pierce his carefully constructed image of imperial control, exposing his insecurity and fear of being perceived as weak or ineffective. The rage is a manifestation of his wounded pride and tyrannical insecurity.',
        ap.emotional_tags = ["on the surface, tiberius displays explosive anger, a violent outburst triggered by agrippina's final insult. internally, he is driven by deep-seated paranoia", "a desperate need to assert his absolute authority. agrippina's words pierce his carefully constructed image of imperial control, exposing his insecurity", "fear of being perceived as weak or ineffective. the rage is a manifestation of his wounded pride", "tyrannical insecurity.", "on the surface", "tiberius displays explosive anger", "a violent outburst triggered by agrippina's final insult. internally", "he is driven by deep-seated paranoia and a desperate need to assert his absolute authority. agrippina's words pierce his carefully constructed image of imperial control", "exposing his insecurity and fear of being perceived as weak or ineffective. the rage is a manifestation of his wounded pride and tyrannical insecurity."],
        ap.active_plans = ["To immediately and forcefully silence Agrippina's defiance.", "To reassert his dominance and control over the situation.", "To inflict physical and psychological punishment to demonstrate the consequences of opposing him."],
        ap.beliefs = ["As Emperor, his authority is absolute and unquestionable.", "Any form of disrespect or defiance is a direct threat to his rule and must be crushed.", "Physical punishment is a legitimate and effective tool to enforce obedience and maintain power."],
        ap.goals = ["short-term: To physically dominate and humiliate Agrippina through flogging.", "medium-term: To ensure Agrippina's exile is not seen as a sign of weakness but as a demonstration of his power.", "ultimate: To solidify his image as a ruthless and unchallengeable ruler, deterring future dissent and securing his legacy through fear."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_documents_event_6_1'})
    ON CREATE SET
        oi.description = 'The documents exchanged in the assembly hall serve as vital representations of the petitions and requests made by the petitioners. They are symbols of the bureaucratic processes that govern power dynamics in the palace, reflecting the ambitions and desperation of those seeking favor. The documents are likely held by Sejanus\'s secretary, awaiting examination and decision-making from the Emperor.',
        oi.status_before = 'The documents are in pristine condition, prepared for review by the Emperor, carrying the weight of numerous requests and political maneuverings from various petitioners.',
        oi.status_after = 'Following the event, the documents remain with Sejanus’s secretary, still awaiting further decisions from the Emperor, their importance undiminished as the political landscape continues to shift.'
    WITH oi
    MATCH (o:Object {uuid: 'object_documents'})
    MATCH (e:Event {uuid: 'event_6_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the assembly hall with a carefully neutral expression, asserting his authority over the crowd of civic officials and conspirators. He moves past petitioners confidently, pushing through the throng with purpose, displaying firm gestures as he addresses Attius, blocking his path momentarily to assert control.',
        ap.emotional_state = 'Sejanus projects a composed demeanor, masked beneath a surface of calculated neutrality. However, internally, he wrestles with the pressure of maintaining his position amidst growing political tensions, feeling the weight of expectations from both the Emperor and the conspirators around him. Beneath his calm, there lies a simmering tension, a recognition of his precarious status.',
        ap.emotional_tags = ["sejanus projects a composed demeanor, masked beneath a surface of calculated neutrality. however, internally, he wrestles with the pressure of maintaining his position amidst growing political tensions, feeling the weight of expectations from both the emperor", "the conspirators around him. beneath his calm, there lies a simmering tension, a recognition of his precarious status.", "sejanus projects a composed demeanor", "masked beneath a surface of calculated neutrality. however", "internally", "he wrestles with the pressure of maintaining his position amidst growing political tensions", "feeling the weight of expectations from both the emperor and the conspirators around him. beneath his calm", "there lies a simmering tension", "a recognition of his precarious status."],
        ap.active_plans = ["To reinforce his authority by managing the expectations of petitioners like Attius and ensuring they remain compliant.", "To navigate the complex political landscape while maintaining his favor with Tiberius and the Imperial family.", "To strategize on future alliances and potential marriage proposals to secure his position."],
        ap.beliefs = ["Power must be maintained through a fa\u00e7ade of control and authority.", "The loyalty of those around him can be manipulated to his advantage.", "Personal ambition is crucial for survival in the ruthless environment of Roman politics."],
        ap.goals = ["Short-term: To address the concerns of petitioners and assert his influence in the assembly.", "Medium-term: To secure a marriage that will strengthen his political ties within the Imperial family.", "Ultimate: To position himself as the unassailable power within Rome, with the Emperor's favor firmly in his grasp."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_attius_event_6_1'})
    ON CREATE SET
        ap.current_status = 'Attius steps forward anxiously, physically blocking Sejanus\'s way in a desperate attempt to gain attention for his case. His body leans slightly forward, hands clasped nervously, indicating both his anxious demeanor and the urgency of his request.',
        ap.emotional_state = 'Attius is riddled with anxiety and desperation, his surface emotions portraying hopefulness as he seeks favor from Sejanus. Internally, he battles fear of rejection and the harsh realities of his position, aware that his future hinges on the whims of those in power. The tension between his outward hope and inner dread creates a palpable conflict within him.',
        ap.emotional_tags = ["attius is riddled with anxiety", "desperation, his surface emotions portraying hopefulness as he seeks favor from sejanus. internally, he battles fear of rejection", "the harsh realities of his position, aware that his future hinges on the whims of those in power. the tension between his outward hope", "inner dread creates a palpable conflict within him.", "attius is riddled with anxiety and desperation", "his surface emotions portraying hopefulness as he seeks favor from sejanus. internally", "he battles fear of rejection and the harsh realities of his position", "aware that his future hinges on the whims of those in power. the tension between his outward hope and inner dread creates a palpable conflict within him."],
        ap.active_plans = ["To secure a favorable outcome regarding his case by gaining Sejanus's attention.", "To leverage his relationship with Sejanus to navigate the political machinations of the assembly.", "To maintain persistence in securing decisions from the Emperor that would alter his fortunes."],
        ap.beliefs = ["Influence and connections are vital for survival in the political landscape.", "Persistence can sometimes yield favorable outcomes in desperate situations.", "The fortunes of men like Sejanus dictate the rise or fall of individuals like himself."],
        ap.goals = ["Short-term: To elicit a commitment from Sejanus regarding his case before the Emperor.", "Medium-term: To navigate the complexities of the political system to improve his standing.", "Ultimate: To secure a stable position within the Imperial hierarchy, safeguarding his future."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Arria bursts into action upon seeing her father, rushing towards him with unrestrained joy alongside her brother Junius. She is physically animated, her movements quick and eager as she seeks his attention and affection, clearly delighted by his return and the prospect of spending time with him. She positions herself close to Sejanus, using her physical presence to reinforce her request and draw him into a familial interaction.',
        ap.emotional_state = 'Arria is brimming with surface happiness at her father\'s return, openly expressing her excitement and eagerness to be with him. Beneath this joy, there\'s a palpable undercurrent of longing for her mother, revealed in her persistent questioning and visible sadness when Sejanus dismisses the topic. She is emotionally vulnerable, her cheerfulness tinged with a subtle plea for familial reconciliation, showcasing a child\'s innocent hope for a complete and loving family unit.',
        ap.emotional_tags = ["arria is brimming with surface happiness at her father's return, openly expressing her excitement", "eagerness to be with him. beneath this joy, there's a palpable undercurrent of longing for her mother, revealed in her persistent questioning", "visible sadness when sejanus dismisses the topic. she is emotionally vulnerable, her cheerfulness tinged with a subtle plea for familial reconciliation, showcasing a child's innocent hope for a complete", "loving family unit.", "arria is brimming with surface happiness at her father's return", "openly expressing her excitement and eagerness to be with him. beneath this joy", "there's a palpable undercurrent of longing for her mother", "revealed in her persistent questioning and visible sadness when sejanus dismisses the topic. she is emotionally vulnerable", "her cheerfulness tinged with a subtle plea for familial reconciliation", "showcasing a child's innocent hope for a complete and loving family unit."],
        ap.active_plans = ["To express her joy and excitement at Sejanus's return, ensuring he knows she is happy to see him.", "To secure dinner with her father, reinforcing her desire for his attention and time.", "To advocate for her mother's return into their lives, directly addressing the sensitive topic despite potential disapproval."],
        ap.beliefs = ["Her father is a loving figure who cares for her and Junius.", "Families should be together, and her mother's absence is unnatural and undesirable.", "Expressing her desires and being 'good' will positively influence her father's decisions."],
        ap.goals = ["Short-term: To have dinner with her father on this day.", "Medium-term: To convince her father to allow her mother to visit them again.", "Ultimate: To reunite her family, restoring the presence of both parents in their lives."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Junius follows Arria in rushing to greet Sejanus, though his enthusiasm is more measured and less overtly expressive than his sister\'s. He physically approaches Sejanus but maintains a slight distance, observing Arria\'s more effusive greeting and interjecting with a touch of skepticism regarding Arria\'s pronouncements. His posture is less about seeking immediate affection and more about cautious observation and quiet participation in the familial interaction.',
        ap.emotional_state = 'Junius displays a more subdued surface happiness compared to Arria, his excitement tempered by a cautious and perhaps slightly melancholic undertone. Internally, he is likely processing the complexities of his family situation, showing a hint of skepticism towards Arria\'s optimism which suggests a deeper awareness of the strained family dynamic. He harbors a quiet longing for his mother, evident in his question, but he is more reserved in expressing it directly, indicating a more introspective and less outwardly emotional nature than Arria.',
        ap.emotional_tags = ["junius displays a more subdued surface happiness compared to arria, his excitement tempered by a cautious", "perhaps slightly melancholic undertone. internally, he is likely processing the complexities of his family situation, showing a hint of skepticism towards arria's optimism which suggests a deeper awareness of the strained family dynamic. he harbors a quiet longing for his mother, evident in his question, but he is more reserved in expressing it directly, indicating a more introspective", "less outwardly emotional nature than arria.", "junius displays a more subdued surface happiness compared to arria", "his excitement tempered by a cautious and perhaps slightly melancholic undertone. internally", "he is likely processing the complexities of his family situation", "showing a hint of skepticism towards arria's optimism which suggests a deeper awareness of the strained family dynamic. he harbors a quiet longing for his mother", "evident in his question", "but he is more reserved in expressing it directly", "indicating a more introspective and less outwardly emotional nature than arria.", "junius displays a more subdued surface happiness compared to arria, his excitement tempered by a cautious and perhaps slightly melancholic undertone. internally, he is likely processing the complexities of his family situation, showing a hint of skepticism towards arria's optimism which suggests a deeper awareness of the strained family dynamic. he harbors a quiet longing for his mother, evident in his question,", "he is more reserved in expressing it directly, indicating a more introspective and less outwardly emotional nature than arria."],
        ap.active_plans = ["To greet his father and acknowledge his return, participating in the expected familial ritual.", "To observe Arria's interaction with Sejanus, gauging his father's mood and receptiveness.", "To subtly inquire about his mother's absence, using Arria's more direct approach as a cover for his own curiosity and concern."],
        ap.beliefs = ["His father is the primary authority figure and his reactions need to be carefully considered.", "Arria's optimism is often naive, and reality might be more complex or less favorable.", "The absence of their mother is unusual and requires understanding, even if unspoken directly by adults."],
        ap.goals = ["Short-term: To spend time with his father and assess his current disposition.", "Medium-term: To understand the true reasons behind his mother's absence and the family's separation.", "Ultimate: To achieve a sense of stability and clarity within his family, even if full reunification is unlikely."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the assembly hall projecting an image of controlled neutrality, initially engaging with petitioners with curt efficiency. When his children rush to him, he shifts to a paternal role, briefly embracing them and agreeing to dinner. However, upon the mention of their mother, his demeanor hardens abruptly. He physically pushes past Attius earlier in the scene, and now directs sharp, dismissive commands to Arria and Junius, using his physical presence and raised voice to assert dominance and quickly shut down the unwelcome topic, creating emotional distance.',
        ap.emotional_state = 'On the surface, Sejanus displays professional detachment and paternal affection, yet beneath this veneer, he is emotionally strained and internally conflicted. The petitioners evoke a controlled impatience, while his children trigger a deeper discomfort and suppressed anger when they mention their mother. He is actively repressing vulnerability and any outward display of emotional complexity, projecting an image of unwavering control to mask his internal turmoil and the precariousness of his personal and political balancing act. There is a tension between his desire to appear as a loving father and his ruthless ambition which necessitates emotional detachment.',
        ap.emotional_tags = ["on the surface, sejanus displays professional detachment", "paternal affection, yet beneath this veneer, he is emotionally strained", "internally conflicted. the petitioners evoke a controlled impatience, while his children trigger a deeper discomfort", "suppressed anger when they mention their mother. he is actively repressing vulnerability", "any outward display of emotional complexity, projecting an image of unwavering control to mask his internal turmoil", "the precariousness of his personal", "political balancing act. there is a tension between his desire to appear as a loving father", "his ruthless ambition which necessitates emotional detachment.", "on the surface", "sejanus displays professional detachment and paternal affection", "yet beneath this veneer", "he is emotionally strained and internally conflicted. the petitioners evoke a controlled impatience", "while his children trigger a deeper discomfort and suppressed anger when they mention their mother. he is actively repressing vulnerability and any outward display of emotional complexity", "projecting an image of unwavering control to mask his internal turmoil and the precariousness of his personal and political balancing act. there is a tension between his desire to appear as a loving father and his ruthless ambition which necessitates emotional detachment.", "on the surface, sejanus displays professional detachment and paternal affection, yet beneath this veneer, he is emotionally strained and internally conflicted. the petitioners evoke a controlled impatience,", "his children trigger a deeper discomfort and suppressed anger when they mention their mother. he is actively repressing vulnerability and any outward display of emotional complexity, projecting an image of unwavering control to mask his internal turmoil and the precariousness of his personal and political balancing act. there is a tension between his desire to appear as a loving father and his ruthless ambition which necessitates emotional detachment."],
        ap.active_plans = ["To maintain a professional and efficient image while dealing with petitioners, reinforcing his authority and competence.", "To briefly engage with his children to fulfill expected paternal duties, without allowing emotional closeness to compromise his controlled persona.", "To suppress any discussion or inquiry about his children's mother, swiftly shutting down the topic to avoid emotional vulnerability and maintain control over the narrative within his family life."],
        ap.beliefs = ["Emotional displays are weaknesses that must be suppressed, especially in a public and political context.", "Maintaining absolute control over his personal and professional life is essential for his survival and advancement.", "Children should obey and not question his decisions, particularly regarding sensitive or inconvenient topics like their mother's absence."],
        ap.goals = ["Short-term: To efficiently manage petitioners and maintain his image of control in the assembly hall.", "Medium-term: To avoid any emotional or personal distractions that could undermine his political focus and ambition, including managing his children's inquiries about their mother.", "Ultimate: To consolidate his power and achieve his ambitious political goals, requiring him to maintain a ruthless and emotionally detached persona in all aspects of his life."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Livilla enters the assembly hall with a confident smile directed at her daughter, Arria, but quickly shifts to a more serious demeanor when confronting Sejanus. Her body language oscillates between warmth for her children and tension in her interactions with Sejanus, reflecting her dual roles as a mother and a political player.',
        ap.emotional_state = 'Livilla initially exhibits a facade of warmth and maternal pride, but this quickly gives way to frustration and anger as she confronts Sejanus about Tiberius\'s refusal of their marriage proposal. Beneath her anger lies a deep-seated desperation, as her ambitions and desires are threatened, creating a volatile cocktail of emotions.',
        ap.emotional_tags = ["livilla initially exhibits a facade of warmth", "maternal pride, but this quickly gives way to frustration", "anger as she confronts sejanus about tiberius's refusal of their marriage proposal. beneath her anger lies a deep-seated desperation, as her ambitions", "desires are threatened, creating a volatile cocktail of emotions.", "livilla initially exhibits a facade of warmth and maternal pride", "but this quickly gives way to frustration and anger as she confronts sejanus about tiberius's refusal of their marriage proposal. beneath her anger lies a deep-seated desperation", "as her ambitions and desires are threatened", "creating a volatile cocktail of emotions.", "livilla initially exhibits a facade of warmth and maternal pride,", "this quickly gives way to frustration and anger as she confronts sejanus about tiberius's refusal of their marriage proposal. beneath her anger lies a deep-seated desperation, as her ambitions and desires are threatened, creating a volatile cocktail of emotions."],
        ap.active_plans = ["To secure a marriage with Sejanus to elevate their status.", "To manipulate Sejanus into addressing Tiberius's refusal for their marriage.", "To protect her relationship with Sejanus while navigating the political dangers surrounding them."],
        ap.beliefs = ["Believes her ambitions should not be thwarted by Tiberius's decisions.", "Conviction that her relationship with Sejanus is paramount to her power.", "Holds that family connections, especially through marriage, can solidify her status and influence."],
        ap.goals = ["Short-term: To persuade Sejanus to renew his efforts with Tiberius regarding their marriage.", "Medium-term: To establish a political alliance through marriage that secures her family's power.", "Ultimate: To eliminate any obstacles, including marrying her daughter to Sejanus, to achieve her ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands at the center of the assembly hall, exuding an air of authority as he interacts with petitioners and his children. When confronted by Livilla, his posture becomes more guarded, indicating his struggle to maintain control in the face of her accusations and the emotional tempest that unfolds.',
        ap.emotional_state = 'Sejanus presents a composed exterior, but internally he is conflicted and anxious about Tiberius\'s refusal. His anger and irritation surface during Livilla\'s confrontation, as he tries to assert control and practicality, revealing the tension between his ambitions and his fears of losing power.',
        ap.emotional_tags = ["sejanus presents a composed exterior, but internally he is conflicted", "anxious about tiberius's refusal. his anger", "irritation surface during livilla's confrontation, as he tries to assert control", "practicality, revealing the tension between his ambitions", "his fears of losing power.", "sejanus presents a composed exterior", "but internally he is conflicted and anxious about tiberius's refusal. his anger and irritation surface during livilla's confrontation", "as he tries to assert control and practicality", "revealing the tension between his ambitions and his fears of losing power.", "sejanus presents a composed exterior,", "internally he is conflicted and anxious about tiberius's refusal. his anger and irritation surface during livilla's confrontation, as he tries to assert control and practicality, revealing the tension between his ambitions and his fears of losing power."],
        ap.active_plans = ["To maintain his position and influence despite Tiberius's refusal.", "To navigate his relationship with Livilla while exploring alternative marriage options.", "To eliminate threats to his power by managing alliances carefully."],
        ap.beliefs = ["Believes that ambition must be tempered with caution to avoid suspicion from Tiberius.", "Holds that marrying into the Imperial family will solidify his power.", "Maintains that emotional attachments should not cloud judgment in political matters."],
        ap.goals = ["Short-term: To persuade Livilla to reconsider their strategy regarding Tiberius.", "Medium-term: To establish a marriage link with the Imperial family through Livilla's daughter to gain legitimacy.", "Ultimate: To secure his position as the primary power broker in Rome by eliminating rivals and consolidating influence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Livilla enters the assembly hall, summoned by a slave, her initial demeanor suggesting eager anticipation. However, upon hearing Sejanus\'s report of Tiberius\'s refusal and the proposed alternative, her composure shatters. She explodes in a fit of rage, unleashing a torrent of insults and accusations at Sejanus, her body language and tone conveying utter fury and betrayal.',
        ap.emotional_state = 'Initially, Livilla is hopeful and expectant, believing Sejanus will deliver news of their impending marriage. This anticipation swiftly morphs into volcanic fury and humiliation as she grapples with Tiberius\'s rejection and the demeaning suggestion of Sejanus marrying her daughter. Beneath the surface anger, there\'s a deep sense of wounded pride and thwarted ambition. Her internal conflict rages between her desire for power and her personal sense of worth, leading to an explosive outward display.',
        ap.emotional_tags = ["initially, livilla is hopeful", "expectant, believing sejanus will deliver news of their impending marriage. this anticipation swiftly morphs into volcanic fury", "humiliation as she grapples with tiberius's rejection", "the demeaning suggestion of sejanus marrying her daughter. beneath the surface anger, there's a deep sense of wounded pride", "thwarted ambition. her internal conflict rages between her desire for power", "her personal sense of worth, leading to an explosive outward display.", "initially", "livilla is hopeful and expectant", "believing sejanus will deliver news of their impending marriage. this anticipation swiftly morphs into volcanic fury and humiliation as she grapples with tiberius's rejection and the demeaning suggestion of sejanus marrying her daughter. beneath the surface anger", "there's a deep sense of wounded pride and thwarted ambition. her internal conflict rages between her desire for power and her personal sense of worth", "leading to an explosive outward display."],
        ap.active_plans = ["To understand the full extent of Tiberius's refusal and the implications for her and Sejanus's plans.", "To assert her dominance in the relationship with Sejanus, ensuring he remains committed to their original marriage plan.", "To express her outrage and pain at the perceived insult and betrayal, making Sejanus feel the weight of her displeasure."],
        ap.beliefs = ["She believes she is entitled to marry Sejanus and that Tiberius is unjustly obstructing their happiness and ambitions.", "She believes Sejanus should be entirely devoted to her and prioritize their marriage above all else.", "She believes she is superior to Sejanus in status and deserving of his unwavering loyalty and efforts to secure their union."],
        ap.goals = ["Short-term: To vent her immediate anger and frustration at Sejanus, demanding reassurance and a clear path forward.", "Medium-term: To circumvent Tiberius's refusal and still find a way to marry Sejanus, securing their combined power.", "Ultimate: To achieve ultimate power and status in Rome as Sejanus's wife, solidifying her position and influence within the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_4'})
    ON CREATE SET
        ap.current_status = 'Sejanus enters the assembly hall, initially projecting an image of controlled authority, navigating petitioners with practiced ease. However, his carefully constructed facade falters as Livilla confronts him about Tiberius\'s decision. He becomes defensive and attempts to rationalize the Emperor\'s refusal and propose the alternative marriage to Helen. Throughout Livilla\'s outburst, he tries to regain control, alternating between placating her rage and asserting his own pragmatic perspective.',
        ap.emotional_state = 'Sejanus begins with a neutral and composed demeanor, masking underlying anxiety about Tiberius\'s decision. Upon facing Livilla\'s fury, he becomes increasingly defensive and strained. Beneath his attempts at rationality, there\'s a current of frustration and fear that their carefully laid plans are unraveling. He\'s caught between his ambition, which dictates accepting Tiberius\'s compromise, and the need to manage Livilla\'s volatile emotions and maintain her support. He struggles to balance pragmatism with passion in this tense exchange.',
        ap.emotional_tags = ["sejanus begins with a neutral", "composed demeanor, masking underlying anxiety about tiberius's decision. upon facing livilla's fury, he becomes increasingly defensive", "strained. beneath his attempts at rationality, there's a current of frustration", "fear that their carefully laid plans are unraveling. he's caught between his ambition, which dictates accepting tiberius's compromise,", "the need to manage livilla's volatile emotions", "maintain her support. he struggles to balance pragmatism with passion in this tense exchange.", "sejanus begins with a neutral and composed demeanor", "masking underlying anxiety about tiberius's decision. upon facing livilla's fury", "he becomes increasingly defensive and strained. beneath his attempts at rationality", "there's a current of frustration and fear that their carefully laid plans are unraveling. he's caught between his ambition", "which dictates accepting tiberius's compromise", "and the need to manage livilla's volatile emotions and maintain her support. he struggles to balance pragmatism with passion in this tense exchange."],
        ap.active_plans = ["To deliver Tiberius's refusal and the alternative proposal in a way that minimizes Livilla's negative reaction and maintains her cooperation.", "To persuade Livilla that marrying Helen is a strategic advantage, framing it as a temporary tactical compromise to achieve their long-term goals.", "To reassure Livilla of his continued love and commitment, despite the setback, and to regain control of the situation by appealing to her sense of pragmatism and ambition."],
        ap.beliefs = ["He believes that marrying Livilla is essential for his ascent to power and that Tiberius's refusal is a significant obstacle to overcome.", "He believes that political expediency sometimes requires personal sacrifices and that the marriage to Helen, though undesirable, is a necessary compromise.", "He believes he can manipulate the situation to his advantage, even with Tiberius's interference, and that his relationship with Livilla is strong enough to withstand this challenge."],
        ap.goals = ["Short-term: To de-escalate Livilla's rage and convince her to listen to his rationalization of the Helen proposal.", "Medium-term: To secure a marriage link to the Imperial family through Helen, maintaining proximity to power and influence.", "Ultimate: To consolidate his power, potentially surpassing Tiberius, with Livilla by his side, using any means necessary, including politically strategic marriages."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_1'})
    ON CREATE SET
        ap.current_status = 'The Quaestor sits nearby, overseeing the proceedings with a watchful yet restrained posture, attempting to maintain order amidst the rising cacophony of dissent in the Senate. He occasionally gestures for silence, attempting to assert his authority as the voice of the Emperor\'s demands.',
        ap.emotional_state = 'The Quaestor\'s surface demeanor reflects a professional detachment, but internally he feels the tension of supporting an increasingly tyrannical regime. He grapples with the weight of his responsibility, torn between duty and the growing unease among the Senators.',
        ap.emotional_tags = ["the quaestor's surface demeanor reflects a professional detachment, but internally he feels the tension of supporting an increasingly tyrannical regime. he grapples with the weight of his responsibility, torn between duty", "the growing unease among the senators.", "the quaestor's surface demeanor reflects a professional detachment", "but internally he feels the tension of supporting an increasingly tyrannical regime. he grapples with the weight of his responsibility", "torn between duty and the growing unease among the senators.", "the quaestor's surface demeanor reflects a professional detachment,", "internally he feels the tension of supporting an increasingly tyrannical regime. he grapples with the weight of his responsibility, torn between duty and the growing unease among the senators."],
        ap.active_plans = ["To facilitate the Emperor's demands for Drusus's arrest by presenting the issue to the Senate as a matter of procedure.", "To maintain order and control in the Senate, ensuring that the discussion remains focused on protocol rather than dissent.", "To seek affirmation from the Senators for the Emperor's wishes, thereby reinforcing the power dynamics favoring Tiberius."],
        ap.beliefs = ["The Senate must act as an extension of the Emperor's will, reinforcing the authority of the imperial rule.", "Maintaining order is pivotal for the stability of the Empire, even at the cost of dissenting voices.", "His role as Quaestor is essential in upholding the traditions of the Senate and the legitimacy of the Empire, regardless of personal opinions on Tiberius's orders."],
        ap.goals = ["Short-term: To secure the Senate's agreement on the arrest of Drusus Caesar, following the Emperor's orders.", "Medium-term: To navigate the political landscape and maintain his position within the Senate amidst growing opposition.", "Ultimate: To ensure the continuation of imperial authority while preserving his own standing and influence in the Senate."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_2'})
    ON CREATE SET
        ap.current_status = 'Having listened to Gallus\'s impassioned speech challenging the Emperor\'s demands, the Quaestor rises from his seat with a practiced air of senatorial decorum. He positions himself to address the entire chamber, his posture firm and official, ready to counteract the wave of dissent sparked by Gallus. He prepares to speak, his movements deliberate and measured, ensuring his every action conveys authority and purpose.',
        ap.emotional_state = 'The Quaestor projects an outward composure, maintaining the expected gravitas of his office.  Beneath this veneer, he likely experiences a professional resolve mixed with a hint of impatience at Gallus\'s disruptive oration. He is not driven by personal animosity, but by a bureaucratic imperative to ensure the Senate proceeds according to imperial wishes.  There\'s a subtle tension between his role as a servant of the Senate and his duty to the Emperor, a conflict he resolves by prioritizing the latter in this moment of challenge.',
        ap.emotional_tags = ["the quaestor projects an outward composure, maintaining the expected gravitas of his office.  beneath this veneer, he likely experiences a professional resolve mixed with a hint of impatience at gallus's disruptive oration. he is not driven by personal animosity, but by a bureaucratic imperative to ensure the senate proceeds according to imperial wishes.  there's a subtle tension between his role as a servant of the senate", "his duty to the emperor, a conflict he resolves by prioritizing the latter in this moment of challenge.", "the quaestor projects an outward composure", "maintaining the expected gravitas of his office.  beneath this veneer", "he likely experiences a professional resolve mixed with a hint of impatience at gallus's disruptive oration. he is not driven by personal animosity", "but by a bureaucratic imperative to ensure the senate proceeds according to imperial wishes.  there's a subtle tension between his role as a servant of the senate and his duty to the emperor", "a conflict he resolves by prioritizing the latter in this moment of challenge.", "the quaestor projects an outward composure, maintaining the expected gravitas of his office.  beneath this veneer, he likely experiences a professional resolve mixed with a hint of impatience at gallus's disruptive oration. he is not driven by personal animosity,", "by a bureaucratic imperative to ensure the senate proceeds according to imperial wishes.  there's a subtle tension between his role as a servant of the senate and his duty to the emperor, a conflict he resolves by prioritizing the latter in this moment of challenge."],
        ap.active_plans = ["Immediately quell the rising tide of senatorial dissent initiated by Gallus's speech.", "Reassert the Emperor's authority and ensure the Senate acts in accordance with Tiberius's decree.", "Force a definitive vote on the arrest of Drusus Caesar, leaving no room for further debate or opposition."],
        ap.beliefs = ["The Emperor's will is the ultimate authority in Rome and must be obeyed by the Senate.", "Maintaining order and procedural correctness in the Senate is crucial for effective governance.", "Individual senators should respect the formal processes and decisions dictated by imperial command."],
        ap.goals = ["Short-term: To successfully call for and conduct a vote on Drusus Caesar's arrest during this Senate session.", "Medium-term: To reinforce the Senate's role as an instrument of imperial policy, ensuring smooth legislative processes.", "Ultimate: To contribute to the stability and functioning of the Roman state as defined by the Emperor's rule, upholding the established order."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_forged_letters_event_8_1'})
    ON CREATE SET
        oi.description = 'The forged letters are central to Drusus’s plea for freedom, as he vehemently claims they are not his. Their existence underlines the political manipulation at play, serving as evidence against him and symbolizing the treachery of the court that has ensnared him. The letters are a catalyst for his desperate cries, as they represent his wrongful imprisonment.',
        oi.status_before = 'The forged letters exist as instruments of deceit, held by those in power to frame Drusus and undermine his credibility, yet they are not physically present in the scene.',
        oi.status_after = 'Following the event, the letters remain in the hands of those who control Drusus\'s fate, continuing to be a source of manipulation and danger as they solidify his entrapment in the political web.'
    WITH oi
    MATCH (o:Object {uuid: 'object_forged_letters'})
    MATCH (e:Event {uuid: 'event_8_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Drusus is physically restrained, being forcibly dragged by Macro and guards towards a holding cell. His body is tense with desperation, attempting to break free while pleading earnestly for mercy, showcasing a posture of panic and helplessness.',
        ap.emotional_state = 'Drusus is overwhelmed with fear and desperation, his voice filled with urgency as he protests his innocence. Beneath his cries, there is a deep sense of powerlessness and hopelessness, as he realizes the gravity of his situation and the indifference of his captors.',
        ap.emotional_tags = ["drusus is overwhelmed with fear", "desperation, his voice filled with urgency as he protests his innocence. beneath his cries, there is a deep sense of powerlessness", "hopelessness, as he realizes the gravity of his situation", "the indifference of his captors.", "drusus is overwhelmed with fear and desperation", "his voice filled with urgency as he protests his innocence. beneath his cries", "there is a deep sense of powerlessness and hopelessness", "as he realizes the gravity of his situation and the indifference of his captors."],
        ap.active_plans = ["To convince Macro and the guards of his innocence regarding the forged letters.", "To gain access to the Emperor in hopes of clearing his name.", "To appeal to Sejanus to intervene on his behalf."],
        ap.beliefs = ["That justice can be achieved if he is heard by the Emperor.", "That the letters accusing him are a manipulation and he can prove his innocence.", "That familial ties and loyalty can sway the decisions of those in power."],
        ap.goals = ["Short-term: To escape the holding cell and avoid being silenced.", "Medium-term: To have an audience with the Emperor or Sejanus to explain his situation.", "Ultimate: To clear his name and restore his place within the Imperial family, preventing any punishment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Macro stands firmly, exuding an air of cold control as he directs the guards in their treatment of Drusus. He remains physically imposing, showing no signs of empathy as he executes orders without hesitation.',
        ap.emotional_state = 'Macro exhibits a chilling detachment, his demeanor stoic and unwavering. He presents a facade of authority, masking any internal conflicts regarding his role in enforcing the Emperor’s or Sejanus\'s commands, revealing a deep-seated belief in the necessity of his actions.',
        ap.emotional_tags = ["macro exhibits a chilling detachment, his demeanor stoic", "unwavering. he presents a facade of authority, masking any internal conflicts regarding his role in enforcing the emperor\u2019s or sejanus's commands, revealing a deep-seated belief in the necessity of his actions.", "macro exhibits a chilling detachment", "his demeanor stoic and unwavering. he presents a facade of authority", "masking any internal conflicts regarding his role in enforcing the emperor\u2019s or sejanus's commands", "revealing a deep-seated belief in the necessity of his actions."],
        ap.active_plans = ["To ensure that Drusus is subdued and delivered to a holding cell without resistance.", "To maintain the authority of Sejanus by enforcing strict discipline among the guards.", "To quickly eliminate any potential noise or dissent from Drusus to prevent disruption."],
        ap.beliefs = ["That power must be maintained through fear and control, even at the expense of justice.", "That loyalty to Sejanus is paramount to his own survival and advancement.", "That the ends justify the means in the pursuit of order and discipline."],
        ap.goals = ["Short-term: To successfully contain Drusus and prevent him from causing any disturbances.", "Medium-term: To uphold the authority of Sejanus and ensure his own position remains secure.", "Ultimate: To rise through the ranks of the Praetorian Guard by demonstrating his efficiency and loyalty to the Emperor."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_8_1'})
    ON CREATE SET
        ap.current_status = 'Guard 1 is positioned as a silent enforcer, obediently following Macro’s directives. He stands ready to act if Drusus becomes too vocal or troublesome, reflecting a sense of duty without any personal investment in the situation.',
        ap.emotional_state = 'The guard maintains an unfeeling exterior, embodying the impassiveness of his role. Internally, he might feel a twinge of discomfort at the treatment of Drusus, yet he suppresses any empathy due to his conditioning to follow orders without question.',
        ap.emotional_tags = ["the guard maintains an unfeeling exterior", "embodying the impassiveness of his role. internally", "he might feel a twinge of discomfort at the treatment of drusus", "yet he suppresses any empathy due to his conditioning to follow orders without question."],
        ap.active_plans = ["To comply with Macro's orders and ensure Drusus remains silent.", "To assist in the physical restraint of Drusus if necessary.", "To communicate with other guards about the handling of prisoners."],
        ap.beliefs = ["That following orders is crucial for maintaining order within the ranks.", "That showing mercy in a situation like this could lead to personal repercussions.", "That the political machinations of the Emperor and Sejanus are beyond his control and understanding."],
        ap.goals = ["Short-term: To fulfill the commands of Macro without incident.", "Medium-term: To avoid any entanglement in the politics surrounding Drusus\u2019s arrest.", "Ultimate: To maintain his position and avoid any backlash from those in power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands near a window in his study, his posture tense and shoulders slightly hunched, indicative of his anxiety. He paces restlessly as he questions Caligula, his hands gesturing nervously as he attempts to convey the gravity of the situation. His voice is strained and punctuated by his characteristic stammer, which intensifies under stress, further highlighting his unease.',
        ap.emotional_state = 'On the surface, Claudius exhibits clear anxiety and worry, expressed through his nervous movements and stammering speech. Beneath this visible agitation lies a deeper concern for his family, particularly Caligula and the unjustly arrested Drusus. He is frustrated and exasperated by Caligula\'s detached and self-absorbed attitude, struggling to reconcile his own sense of familial duty with the callous indifference of his nephew. There\'s an unspoken conflict between his desire to protect his family and his ingrained fear of directly confronting the dangers of the imperial court.',
        ap.emotional_tags = ["on the surface, claudius exhibits clear anxiety", "worry, expressed through his nervous movements", "stammering speech. beneath this visible agitation lies a deeper concern for his family, particularly caligula", "the unjustly arrested drusus. he is frustrated", "exasperated by caligula's detached", "self-absorbed attitude, struggling to reconcile his own sense of familial duty with the callous indifference of his nephew. there's an unspoken conflict between his desire to protect his family", "his ingrained fear of directly confronting the dangers of the imperial court.", "on the surface", "claudius exhibits clear anxiety and worry", "expressed through his nervous movements and stammering speech. beneath this visible agitation lies a deeper concern for his family", "particularly caligula and the unjustly arrested drusus. he is frustrated and exasperated by caligula's detached and self-absorbed attitude", "struggling to reconcile his own sense of familial duty with the callous indifference of his nephew. there's an unspoken conflict between his desire to protect his family and his ingrained fear of directly confronting the dangers of the imperial court."],
        ap.active_plans = ["To impress upon Caligula the seriousness of Drusus's arrest and the potential danger it signifies for the entire family, including Caligula himself.", "To urge Caligula to use his upcoming visit to Capri as an opportunity to speak to Tiberius on behalf of Agrippina and Drusus, hoping to mitigate their situation.", "To gauge Caligula's true feelings and intentions regarding Tiberius's invitation and the unfolding political turmoil, trying to understand if Caligula perceives the danger at all."],
        ap.beliefs = ["Family loyalty, while complicated and often tested, is a fundamental value and responsibility, even in the treacherous Roman court.", "Tiberius is an increasingly dangerous and unpredictable ruler, posing a genuine threat to those around him, especially his own family.", "Caligula, despite his outward recklessness, is potentially naive and unaware of the true dangers surrounding him, making him vulnerable to manipulation and harm."],
        ap.goals = ["Short-term: To ensure Caligula understands the immediate threat and acts cautiously when he goes to Capri.", "Medium-term: To influence Caligula to advocate for Agrippina and Drusus, even if for selfish reasons, hoping to alleviate their plight.", "Ultimate: To navigate the dangerous political landscape and protect his family from further harm, striving for a semblance of justice and stability within the corrupt system, though he knows this is a difficult and long-term aspiration."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'})
    ON CREATE SET
        ap.current_status = 'Caligula enters the study with a carefree swagger, embodying nonchalance and self-assurance. He moves with a relaxed, almost languid gait, contrasting sharply with Claudius\'s anxious energy. He leans in close to Claudius only when his curiosity is piqued, maintaining a physical distance otherwise. When he loses interest, he shrugs dismissively and turns to leave, indicating his fleeting attention span and self-centered focus.',
        ap.emotional_state = 'Caligula outwardly projects an air of amusement and detachment, responding to news of his brother\'s arrest with a disturbingly casual \'shame.\' Beneath this facade of indifference, he is keenly opportunistic and self-serving. He seems intrigued by the drama and potential spectacle of Drusus\'s fate and Tiberius\'s Capri escapades, viewing these events as entertainment rather than genuine cause for concern. His internal state is characterized by a chilling detachment from familial bonds and a focus solely on personal advancement. There\'s an unspoken calculation in his demeanor, as if he is assessing how these events can be leveraged to his own advantage, masking his ambition with feigned innocence.',
        ap.emotional_tags = ["caligula outwardly projects an air of amusement", "detachment, responding to news of his brother's arrest with a disturbingly casual 'shame.' beneath this facade of indifference, he is keenly opportunistic", "self-serving. he seems intrigued by the drama", "potential spectacle of drusus's fate", "tiberius's capri escapades, viewing these events as entertainment rather than genuine cause for concern. his internal state is characterized by a chilling detachment from familial bonds", "a focus solely on personal advancement. there's an unspoken calculation in his demeanor, as if he is assessing how these events can be leveraged to his own advantage, masking his ambition with feigned innocence.", "caligula outwardly projects an air of amusement and detachment", "responding to news of his brother's arrest with a disturbingly casual 'shame.' beneath this facade of indifference", "he is keenly opportunistic and self-serving. he seems intrigued by the drama and potential spectacle of drusus's fate and tiberius's capri escapades", "viewing these events as entertainment rather than genuine cause for concern. his internal state is characterized by a chilling detachment from familial bonds and a focus solely on personal advancement. there's an unspoken calculation in his demeanor", "as if he is assessing how these events can be leveraged to his own advantage", "masking his ambition with feigned innocence."],
        ap.active_plans = ["To maintain a facade of ignorance and innocence, deflecting any responsibility or concern for Drusus's plight and Agrippina's exile.", "To gather information about Tiberius's intentions and the atmosphere in Capri, assessing the potential opportunities and dangers that lie ahead for him personally.", "To accept Tiberius's invitation to Capri enthusiastically, aiming to ingratiate himself with the Emperor and position himself favorably within the imperial court, regardless of the risks to his family."],
        ap.beliefs = ["Self-preservation and personal advancement are the primary goals in the ruthless world of Roman politics, outweighing familial obligations or moral considerations.", "Showing genuine emotion or concern is a weakness that can be exploited, and detachment is a more effective strategy for survival and manipulation.", "Tiberius's favor is the key to power and influence, and any opportunity to gain his attention and approval should be seized, even if it requires sacrificing others."],
        ap.goals = ["Short-term: To secure his trip to Capri and ensure it is perceived as a positive and advantageous opportunity by Tiberius.", "Medium-term: To cultivate a closer relationship with Tiberius in Capri, potentially positioning himself as a favored successor or at least a trusted confidant.", "Ultimate: To ascend to a position of significant power and influence, potentially even Emperor, by exploiting the chaos and instability within the imperial family and the Roman court, using any means necessary to achieve his ambitions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands near a window, his posture tense, hands fidgeting slightly. He shifts his weight, glancing at Caligula with visible anxiety, his brow furrowing as he speaks, indicating his concern about the family’s precarious situation.',
        ap.emotional_state = 'Claudius\'s surface emotions reveal anxiety and urgency as he tries to warn Caligula about the dangers posed by Tiberius. Internally, he grapples with frustration at Caligula\'s indifference and fear for his family\'s safety, feeling a chasm between his protective instincts and Caligula\'s cavalier attitude. His concern for his mother and brothers intensifies his despair.',
        ap.emotional_tags = ["claudius's surface emotions reveal anxiety", "urgency as he tries to warn caligula about the dangers posed by tiberius. internally, he grapples with frustration at caligula's indifference", "fear for his family's safety, feeling a chasm between his protective instincts", "caligula's cavalier attitude. his concern for his mother", "brothers intensifies his despair.", "claudius's surface emotions reveal anxiety and urgency as he tries to warn caligula about the dangers posed by tiberius. internally", "he grapples with frustration at caligula's indifference and fear for his family's safety", "feeling a chasm between his protective instincts and caligula's cavalier attitude. his concern for his mother and brothers intensifies his despair."],
        ap.active_plans = ["To warn Caligula about the potential threats posed by Tiberius.", "To encourage Caligula to advocate for their family's safety.", "To express his own anxieties regarding the political turmoil unfolding in Rome."],
        ap.beliefs = ["Family loyalty is paramount, especially in the face of danger.", "The political landscape is treacherous, requiring vigilance.", "Words and actions carry weight in a world where alliances are fragile."],
        ap.goals = ["Short-term: To communicate the dangers posed by Tiberius to Caligula.", "Medium-term: To secure the safety of his family amidst growing political chaos.", "Ultimate: To navigate the treacherous waters of Roman politics while protecting his loved ones."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'})
    ON CREATE SET
        ap.current_status = 'Caligula enters with an air of casual confidence, leaning slightly as if to amplify his carefree demeanor. He displays indifference, shrugging off Claudius\'s concerns and exhibiting a casual swagger as he discusses his excitement about Capri.',
        ap.emotional_state = 'Caligula outwardly expresses a carefree attitude, even amusement at the unfolding crisis. However, beneath this facade, there lies an unsettling detachment and self-serving pragmatism. His cavalier treatment of family matters reveals an emotional conflict, as he prioritizes personal amusement over familial loyalty.',
        ap.emotional_tags = ["caligula outwardly expresses a carefree attitude, even amusement at the unfolding crisis. however, beneath this facade, there lies an unsettling detachment", "self-serving pragmatism. his cavalier treatment of family matters reveals an emotional conflict, as he prioritizes personal amusement over familial loyalty.", "caligula outwardly expresses a carefree attitude", "even amusement at the unfolding crisis. however", "beneath this facade", "there lies an unsettling detachment and self-serving pragmatism. his cavalier treatment of family matters reveals an emotional conflict", "as he prioritizes personal amusement over familial loyalty."],
        ap.active_plans = ["To dismiss Claudius's concerns about Tiberius and the implications for their family.", "To indulge in the excitement surrounding his invitation to Capri, viewing it as an opportunity.", "To maintain his image of carefree charm, deflecting deeper discussions about family loyalty."],
        ap.beliefs = ["Power dynamics are fluid; one must navigate them for personal gain.", "Family ties are secondary to personal ambition and pleasure.", "The allure of power and indulgence often outweighs the value of familial loyalty."],
        ap.goals = ["Short-term: To enjoy the opportunity presented by Tiberius's invitation.", "Medium-term: To maintain his position and influence within the Imperial family without taking unnecessary risks.", "Ultimate: To secure his own power and status in Rome, regardless of the costs to his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands anxiously by the window in his study, a space filled with scrolls and busts reflecting his scholarly nature. He is engaged in a tense conversation with Caligula, attempting to convey the gravity of Drusus\'s arrest and the looming danger to their family. He shifts from trying to reason with Caligula to becoming disheartened by his brother\'s callousness, ultimately expressing his deep disappointment before Aelia\'s abrupt arrival interrupts their exchange.',
        ap.emotional_state = 'Initially, Claudius is deeply worried and agitated about the perilous situation facing Drusus and the rest of their family. He expresses concern and frustration towards Caligula\'s detached attitude, revealing a surface anxiety that quickly deepens into profound disappointment and weariness. Beneath this outward frustration, there\'s a palpable sense of resignation and sadness at the moral decay he perceives within his own family, highlighting a conflict between his desire for familial solidarity and the grim reality of their self-serving behaviors.',
        ap.emotional_tags = ["initially, claudius is deeply worried", "agitated about the perilous situation facing drusus", "the rest of their family. he expresses concern", "frustration towards caligula's detached attitude, revealing a surface anxiety that quickly deepens into profound disappointment", "weariness. beneath this outward frustration, there's a palpable sense of resignation", "sadness at the moral decay he perceives within his own family, highlighting a conflict between his desire for familial solidarity", "the grim reality of their self-serving behaviors.", "initially", "claudius is deeply worried and agitated about the perilous situation facing drusus and the rest of their family. he expresses concern and frustration towards caligula's detached attitude", "revealing a surface anxiety that quickly deepens into profound disappointment and weariness. beneath this outward frustration", "there's a palpable sense of resignation and sadness at the moral decay he perceives within his own family", "highlighting a conflict between his desire for familial solidarity and the grim reality of their self-serving behaviors."],
        ap.active_plans = ["To warn Caligula about the potential danger Tiberius poses to him and the family.", "To persuade Caligula to show some concern and advocate for their imprisoned family members, particularly Agrippina, to Tiberius.", "To disengage from the disheartening conversation with Caligula and find a moment of peace amidst the palace intrigue."],
        ap.beliefs = ["Family loyalty and mutual support are vital, especially in times of crisis and political instability.", "Caligula is naive and dangerously underestimating the threat posed by Tiberius and the current political climate.", "Moral responsibility dictates that one should speak out against injustice and try to protect family members, even if it seems futile."],
        ap.goals = ["short_term\": \"To make Caligula understand the seriousness of their family's situation and the potential consequences of Tiberius's actions.", "medium_term\": \"To influence Caligula to use his upcoming visit to Capri to plead for mercy or leniency for Agrippina and his brothers.", "ultimate\": \"To preserve some semblance of moral integrity within his family and to navigate the treacherous political landscape without compromising his own values, however often he may feel powerless."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_3'})
    ON CREATE SET
        ap.current_status = 'Aelia makes a confident entrance into Claudius\'s study, announced by a Slave. She immediately establishes her assertive presence by pointedly criticizing Claudius\'s lack of appeal as a husband and questioning why he hasn\'t visited her. Her movements are purposeful as she navigates the room, clearly in control of the interaction, using the encounter with Claudius as a brief, almost dismissive interlude before her intended visit with Livilla.',
        ap.emotional_state = 'Aelia exudes a cool confidence and a dismissive scorn towards Claudius. Her surface emotions are characterized by sharp wit and a condescending tone, designed to underscore her independence and lack of emotional investment in their marriage. Internally, she is pragmatic and self-assured, focused on her own agenda and social standing. There\'s a clear detachment and perhaps even a calculated manipulation in her demeanor, suggesting she sees relationships, including her marriage, as transactional arrangements rather than based on affection or mutual respect. She is emotionally detached and focused on strategic social maneuvering.',
        ap.emotional_tags = ["aelia exudes a cool confidence", "a dismissive scorn towards claudius. her surface emotions are characterized by sharp wit", "a condescending tone, designed to underscore her independence", "lack of emotional investment in their marriage. internally, she is pragmatic", "self-assured, focused on her own agenda", "social standing. there's a clear detachment", "perhaps even a calculated manipulation in her demeanor, suggesting she sees relationships, including her marriage, as transactional arrangements rather than based on affection or mutual respect. she is emotionally detached", "focused on strategic social maneuvering.", "aelia exudes a cool confidence and a dismissive scorn towards claudius. her surface emotions are characterized by sharp wit and a condescending tone", "designed to underscore her independence and lack of emotional investment in their marriage. internally", "she is pragmatic and self-assured", "focused on her own agenda and social standing. there's a clear detachment and perhaps even a calculated manipulation in her demeanor", "suggesting she sees relationships", "including her marriage", "as transactional arrangements rather than based on affection or mutual respect. she is emotionally detached and focused on strategic social maneuvering."],
        ap.active_plans = ["To assert her independence and dominance in her nominal marriage to Claudius, making it clear she is not reliant on him.", "To publicly present herself as a figure of social importance and desirability, despite her loveless marriage, reinforcing her status in the Roman court.", "To use her visit to Claudius as a convenient pretext for her actual purpose: meeting with Livilla, masking her true intentions behind a superficial interaction with her husband.", "To maintain a veneer of confidence and control in the treacherous social and political environment of Rome, projecting an image of strength and self-reliance."],
        ap.beliefs = ["Marriage, particularly hers with Claudius, is a matter of social and political arrangement, devoid of genuine emotional connection.", "Personal advantage and social standing are paramount, and relationships should be leveraged for strategic gain and protection.", "Claudius is socially and personally inferior to her; she views him with disdain and sees their marriage as a burden or a matter of convenience, not affection."],
        ap.goals = ["short_term\": \"To convey her self-sufficiency and lack of interest in a genuine marital relationship with Claudius, establishing clear boundaries in their interaction.", "medium_term\": \"To proceed with her intended visit to Livilla and fulfill the purpose behind it, which may involve gathering information or delivering a message, possibly related to Sejanus or Helen as inferred by Claudius and Antonia.", "ultimate\": \"To secure her position and well-being within the Roman elite through strategic alliances and calculated social maneuvers, ensuring her survival and continued influence in a politically volatile environment, independent of Claudius's standing."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Antonia enters the dim study with a commanding presence, her expression stern and resolute. She interrupts the ongoing conversation between Claudius and Aelia, positioning herself firmly as the matriarch concerned about her family\'s well-being. Her posture is upright, projecting authority and vigilance.',
        ap.emotional_state = 'Antonia\'s exterior reflects a fierce protectiveness and authority, yet beneath that lies a layer of anxiety and suspicion regarding the motives of those around her. Her concern for Helen\'s health and the implications of Sejanus\'s involvement create an undercurrent of tension within her, revealing a conflict between maternal love and the fear of betrayal.',
        ap.emotional_tags = ["antonia's exterior reflects a fierce protectiveness", "authority, yet beneath that lies a layer of anxiety", "suspicion regarding the motives of those around her. her concern for helen's health", "the implications of sejanus's involvement create an undercurrent of tension within her, revealing a conflict between maternal love", "the fear of betrayal.", "antonia's exterior reflects a fierce protectiveness and authority", "yet beneath that lies a layer of anxiety and suspicion regarding the motives of those around her. her concern for helen's health and the implications of sejanus's involvement create an undercurrent of tension within her", "revealing a conflict between maternal love and the fear of betrayal."],
        ap.active_plans = ["To interrogate Aelia about her motives for visiting Livilla.", "To ascertain the truth behind Helen's mysterious illness.", "To keep a vigilant eye on Sejanus's intentions regarding her family."],
        ap.beliefs = ["Loyalty to family must be prioritized above all else.", "Sejanus's ambitions pose a direct threat to her family's safety.", "Trust is a rare commodity in the treacherous political landscape of Rome."],
        ap.goals = ["Short-term: To gather information about Aelia's visit and intentions.", "Medium-term: To protect her granddaughter Helen from potential harm.", "Ultimate: To safeguard her family's legacy and confront the dangers posed by Sejanus."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands near the window, looking anxious and fidgeting slightly as he engages with Aelia and expresses his concerns about their family. His physical demeanor suggests unease, which is compounded by the tension in the room as Antonia enters.',
        ap.emotional_state = 'Claudius exhibits a mix of anxiety and frustration, particularly as he attempts to reach out to Caligula about the danger posed by Tiberius. Internally, he is burdened by a sense of helplessness regarding his family\'s fate, revealing the weight of his moral compass clashing with the harsh realities of the political landscape.',
        ap.emotional_tags = ["claudius exhibits a mix of anxiety", "frustration, particularly as he attempts to reach out to caligula about the danger posed by tiberius. internally, he is burdened by a sense of helplessness regarding his family's fate, revealing the weight of his moral compass clashing with the harsh realities of the political landscape.", "claudius exhibits a mix of anxiety and frustration", "particularly as he attempts to reach out to caligula about the danger posed by tiberius. internally", "he is burdened by a sense of helplessness regarding his family's fate", "revealing the weight of his moral compass clashing with the harsh realities of the political landscape."],
        ap.active_plans = ["To inform Caligula about the potential danger posed by Tiberius.", "To understand Aelia's true intentions and protect family interests.", "To gather information regarding Helen's health and her relationship with Sejanus."],
        ap.beliefs = ["Family loyalty should guide decisions, even in perilous circumstances.", "Ignorance of the political landscape can lead to devastating consequences.", "The safety of his family is paramount, and he feels a duty to protect them."],
        ap.goals = ["Short-term: To warn Caligula about potential dangers.", "Medium-term: To uncover the truth about Helen's illness and Sejanus's involvement.", "Ultimate: To navigate the treacherous political waters and ensure his family's survival."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_4'})
    ON CREATE SET
        ap.current_status = 'Aelia enters the study with an air of confidence and assertiveness. She confronts Claudius directly, her posture radiating self-assurance. However, her dialogue reveals a desperation beneath the surface as she navigates the turbulent waters of courtly politics.',
        ap.emotional_state = 'Aelia\'s outward confidence masks a deep-seated fear stemming from the violent political purges in Rome, which heightens her instinct for self-preservation. She oscillates between assertive engagement with Claudius and an underlying anxiety about their precarious situation, revealing a complex interplay between her self-interest and familial concern.',
        ap.emotional_tags = ["aelia's outward confidence masks a deep-seated fear stemming from the violent political purges in rome, which heightens her instinct for self-preservation. she oscillates between assertive engagement with claudius", "an underlying anxiety about their precarious situation, revealing a complex interplay between her self-interest", "familial concern.", "aelia's outward confidence masks a deep-seated fear stemming from the violent political purges in rome", "which heightens her instinct for self-preservation. she oscillates between assertive engagement with claudius and an underlying anxiety about their precarious situation", "revealing a complex interplay between her self-interest and familial concern."],
        ap.active_plans = ["To check on Livilla's well-being and possibly leverage her connection for personal security.", "To assert her position and remind Claudius of the advantages of their marriage.", "To navigate the tense dynamics of the family and gather information on potential threats."],
        ap.beliefs = ["Self-preservation is key in a world filled with political danger.", "Family connections can provide safety, but must be handled with caution.", "Power dynamics within the family can shift, requiring vigilance and adaptability."],
        ap.goals = ["Short-term: To establish her presence and assert her importance in the family.", "Medium-term: To maintain her safety amid the political turmoil surrounding her.", "Ultimate: To protect her interests and those of her family by navigating the treacherous political landscape."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_message_event_10_1'})
    ON CREATE SET
        oi.description = 'The message serves as the central catalyst for this tense exchange between Livilla and Aelia. Livilla urgently hands it to Aelia, emphasizing the critical need for its secret delivery to \'him\' and its immediate destruction upon reading. This message embodies Livilla\'s desperate attempt to maintain a connection and exert influence over \'him\' despite their physical separation and Tiberius\'s disapproval. It is a tangible representation of Livilla\'s emotional turmoil and her determination to control her romantic and political destiny, acting as a tool for communication and manipulation within the dangerous game of palace intrigue.',
        oi.status_before = 'The message exists as a physical object, presumably written by Livilla and containing her personal communication for \'him\'. It is in Livilla\'s possession within her chambers, representing her private thoughts and desires intended for a specific recipient.',
        oi.status_after = 'The message is now transferred from Livilla\'s possession to Aelia\'s, tasked with the responsibility of its secret delivery. Its status shifts from a private expression to a tool for clandestine communication, its fate contingent on Aelia\'s actions and the recipient\'s compliance with Livilla\'s instructions for its destruction after reading.'
    WITH oi
    MATCH (o:Object {uuid: 'object_message'})
    MATCH (e:Event {uuid: 'event_10_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Livilla is pacing restlessly within her chambers, her movements agitated and betraying a deep inner turmoil. She abruptly stops pacing as Aelia enters, immediately focusing her attention on her with an air of urgent command. Livilla thrusts a message into Aelia\'s hand, emphasizing the critical need for secrecy and demanding its destruction after it has been read, showcasing her controlling nature even in moments of distress.',
        ap.emotional_state = 'Livilla is consumed by a volatile mix of anxiety and barely suppressed fury. Outwardly, she displays impatience and a demand for immediate action, her tone sharp and imperious as she barks orders at Aelia. Beneath this surface agitation simmers a deep well of despair and jealousy, fueled by her forced separation from \'him\' and the looming threat of his marriage to her daughter. Her internal conflict is palpable - torn between her passionate desires and the suffocating constraints of her political reality, she teeters on the edge of emotional collapse, desperately clinging to any semblance of control.',
        ap.emotional_tags = ["livilla is consumed by a volatile mix of anxiety", "barely suppressed fury. outwardly, she displays impatience", "a demand for immediate action, her tone sharp", "imperious as she barks orders at aelia. beneath this surface agitation simmers a deep well of despair", "jealousy, fueled by her forced separation from 'him'", "the looming threat of his marriage to her daughter. her internal conflict is palpable - torn between her passionate desires", "the suffocating constraints of her political reality, she teeters on the edge of emotional collapse, desperately clinging to any semblance of control.", "livilla is consumed by a volatile mix of anxiety and barely suppressed fury. outwardly", "she displays impatience and a demand for immediate action", "her tone sharp and imperious as she barks orders at aelia. beneath this surface agitation simmers a deep well of despair and jealousy", "fueled by her forced separation from 'him' and the looming threat of his marriage to her daughter. her internal conflict is palpable - torn between her passionate desires and the suffocating constraints of her political reality", "she teeters on the edge of emotional collapse", "desperately clinging to any semblance of control."],
        ap.active_plans = ["To ensure the message reaches its intended recipient without detection.", "To reassert her dominance and claim over 'him', reminding him of their bond.", "To vent her frustration and despair about the enforced separation and perceived betrayal."],
        ap.beliefs = ["'He' rightfully belongs to her, and their connection transcends any political arrangement.", "Tiberius's authority is finite and will eventually wane, allowing her desires to prevail.", "Maintaining secrecy and controlling information are paramount to navigating the treacherous palace environment."],
        ap.goals = ["{type: short-term, objective: To have her message delivered swiftly and securely, eliciting a reassuring response from 'him'.}", "{type: medium-term, objective: To end the enforced separation from 'him' and resume their intimate relationship, defying Tiberius's interference.}", "{type: ultimate, objective: To ultimately marry 'him', solidifying her power and status, regardless of familial or political obstacles.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_1'})
    ON CREATE SET
        ap.current_status = 'Aelia enters Livilla\'s chambers, her demeanor initially cautious and composed. She listens attentively to Livilla\'s urgent demands, accepting the message and the accompanying instructions with a practiced air of subservience. Aelia attempts to inject calm into the tense atmosphere, offering reassurances about \'his\' feelings and the temporary nature of the separation, carefully navigating Livilla\'s emotional volatility while maintaining a delicate balance of diplomacy and self-preservation.',
        ap.emotional_state = 'Aelia presents an outwardly calm and reassuring facade, projecting an image of composure and understanding as she interacts with the agitated Livilla. However, beneath this placid exterior, she is likely navigating a complex web of anxieties. She must manage Livilla\'s volatile emotions while simultaneously ensuring her own safety and avoiding entanglement in palace intrigues. There is a subtle undercurrent of weariness and perhaps a hint of fear in her attempts to placate Livilla, reflecting the precariousness of her position and the ever-present dangers of the Roman court. She is walking a tightrope, attempting to soothe Livilla without overstepping or revealing any personal emotion that could be misconstrued.',
        ap.emotional_tags = ["aelia presents an outwardly calm", "reassuring facade, projecting an image of composure", "understanding as she interacts with the agitated livilla. however, beneath this placid exterior, she is likely navigating a complex web of anxieties. she must manage livilla's volatile emotions while simultaneously ensuring her own safety", "avoiding entanglement in palace intrigues. there is a subtle undercurrent of weariness", "perhaps a hint of fear in her attempts to placate livilla, reflecting the precariousness of her position", "the ever-present dangers of the roman court. she is walking a tightrope, attempting to soothe livilla without overstepping or revealing any personal emotion that could be misconstrued.", "aelia presents an outwardly calm and reassuring facade", "projecting an image of composure and understanding as she interacts with the agitated livilla. however", "beneath this placid exterior", "she is likely navigating a complex web of anxieties. she must manage livilla's volatile emotions while simultaneously ensuring her own safety and avoiding entanglement in palace intrigues. there is a subtle undercurrent of weariness and perhaps a hint of fear in her attempts to placate livilla", "reflecting the precariousness of her position and the ever-present dangers of the roman court. she is walking a tightrope", "attempting to soothe livilla without overstepping or revealing any personal emotion that could be misconstrued.", "aelia presents an outwardly calm and reassuring facade, projecting an image of composure and understanding as she interacts with the agitated livilla. however, beneath this placid exterior, she is likely navigating a complex web of anxieties. she must manage livilla's volatile emotions", "simultaneously ensuring her own safety and avoiding entanglement in palace intrigues. there is a subtle undercurrent of weariness and perhaps a hint of fear in her attempts to placate livilla, reflecting the precariousness of her position and the ever-present dangers of the roman court. she is walking a tightrope, attempting to soothe livilla without overstepping or revealing any personal emotion that could be misconstrued."],
        ap.active_plans = ["To carefully receive and understand Livilla's urgent instructions regarding the message.", "To reassure Livilla about 'his' continued affection and the temporary nature of their separation, aiming to de-escalate her emotional state.", "To subtly gather information about Helen's condition, showing a veneer of concern while potentially seeking to understand the broader context of Livilla's distress."],
        ap.beliefs = ["Maintaining a neutral and pragmatic stance is crucial for survival within the treacherous palace environment.", "Reassurances and diplomatic language can temporarily diffuse volatile situations and manage powerful personalities like Livilla.", "Men and women have fundamentally different approaches to relationships and emotional expression, a generalization useful for navigating fraught conversations."],
        ap.goals = ["{type: short-term, objective: To successfully receive the message and Livilla's instructions without becoming emotionally entangled in her drama.}", "{type: medium-term, objective: To deliver the message discreetly, as instructed (though not explicitly stated in this scene, it is implied by the context), and then detach from the situation.}", "{type: ultimate, objective: To navigate palace intrigues successfully, maintain her position, and avoid becoming a target or casualty in the unfolding power struggles, prioritizing self-preservation.}"]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Aelia enters Livilla\'s chambers with concern etched on her face, her posture slightly hunched as she approaches Livilla, sensing the tension in the air. She keeps her movements measured and careful, attempting to bridge the growing emotional chasm with a gentle presence as she inquires about Helen\'s well-being.',
        ap.emotional_state = 'Aelia\'s outward demeanor is calm and nurturing, though beneath the surface lies a current of anxiety—her tone conveys a deep concern for both Helen and Livilla. The weight of the political machinations presses heavily on her, revealing an internal struggle between her desire to soothe and her awareness of the desperation surrounding them.',
        ap.emotional_tags = ["aelia's outward demeanor is calm", "nurturing, though beneath the surface lies a current of anxiety\u2014her tone conveys a deep concern for both helen", "livilla. the weight of the political machinations presses heavily on her, revealing an internal struggle between her desire to soothe", "her awareness of the desperation surrounding them.", "aelia's outward demeanor is calm and nurturing", "though beneath the surface lies a current of anxiety\u2014her tone conveys a deep concern for both helen and livilla. the weight of the political machinations presses heavily on her", "revealing an internal struggle between her desire to soothe and her awareness of the desperation surrounding them."],
        ap.active_plans = ["To reassure Livilla about Castor's feelings and dispel her anxieties regarding the marriage to Helen.", "To gather information about Helen's condition to provide a sense of hope and stability.", "To maintain a semblance of calm while navigating the emotionally charged atmosphere of Livilla's distress."],
        ap.beliefs = ["Aelia believes that maintaining emotional connections is crucial for survival amid the chaos of Roman politics.", "She holds a conviction that loyalty and reassurance can help sustain Livilla through this tumultuous period.", "Aelia believes that the bonds of love, even under the strain of betrayal, can remain intact despite the complexity of their situations."],
        ap.goals = ["Short-term: To establish a supportive dialogue with Livilla and ease her fears regarding Castor's affections.", "Medium-term: To navigate the political landscape effectively, ensuring that Livilla remains a valuable ally despite her emotional turmoil.", "Ultimate: To secure the safety of her family and herself by fostering strong alliances in a precarious environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_2'})
    ON CREATE SET
        ap.current_status = 'Livilla paces the room with an anxious energy, her movements quick and agitated as she awaits Aelia\'s response. Her posture is tense, arms crossed tightly over her chest, revealing her inner turmoil. She glances at Aelia with intense focus, signaling her desperation for reassurance amid the chaos unfolding around her.',
        ap.emotional_state = 'On the surface, Livilla\'s frustration spills over into sharp retorts, but beneath lies a profound despair fueled by her sense of betrayal and separation from Castor. She feels an emotional riptide, torn between her ambitions and maternal instincts, leading to an intense conflict that drives her to demand loyalty and recognition.',
        ap.emotional_tags = ["on the surface, livilla's frustration spills over into sharp retorts, but beneath lies a profound despair fueled by her sense of betrayal", "separation from castor. she feels an emotional riptide, torn between her ambitions", "maternal instincts, leading to an intense conflict that drives her to demand loyalty", "recognition.", "on the surface", "livilla's frustration spills over into sharp retorts", "but beneath lies a profound despair fueled by her sense of betrayal and separation from castor. she feels an emotional riptide", "torn between her ambitions and maternal instincts", "leading to an intense conflict that drives her to demand loyalty and recognition.", "on the surface, livilla's frustration spills over into sharp retorts,", "beneath lies a profound despair fueled by her sense of betrayal and separation from castor. she feels an emotional riptide, torn between her ambitions and maternal instincts, leading to an intense conflict that drives her to demand loyalty and recognition."],
        ap.active_plans = ["To convey her urgency to Aelia regarding Castor's feelings and the need for loyalty amidst her separation from him.", "To express her determination to reclaim her position and relationship with Castor before he becomes permanently bound to Helen.", "To assert her emotional stakes in the situation, driving Aelia to deliver her message with the utmost secrecy and care."],
        ap.beliefs = ["Livilla believes that love and loyalty can be manipulated to serve her ambitions, justifying her ruthless decisions.", "She holds a deep conviction that her connection with Castor is unbreakable, despite his marriage to her daughter.", "Livilla believes that time is on her side, and that Tiberius's death will eventually shift the power dynamics in her favor."],
        ap.goals = ["Short-term: To ensure Aelia delivers her message to Castor without interference and to reinforce her own position.", "Medium-term: To navigate the political landscape with shrewdness, maintaining her desire for Castor's love while manipulating those around her.", "Ultimate: To reclaim her agency and position of power within the court, regardless of the sacrifices it may entail."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Livilla paces her chambers with a restless energy, her movements sharp and agitated, reflecting the turmoil within. She dictates instructions to Aelia, her words laced with impatience and command, clearly intending to use Aelia as her intermediary to reach Castor. Her physical presence dominates the space, though confined, suggesting a caged animal desperate to break free.',
        ap.emotional_state = 'Livilla is consumed by a volatile mix of frustration and possessive jealousy. Outwardly, she is imperious and demanding, barking orders at Aelia and dismissing concerns about Helen with cold indifference. Beneath this facade of control, however, simmers a deep-seated desperation and insecurity. She feels abandoned and replaced, her internal state a tempest of wounded pride and fear that Castor\'s affections are waning. Her unspoken conflict lies in her ambition for power clashing with her raw, possessive desires for Castor, creating a dangerous emotional instability.',
        ap.emotional_tags = ["livilla is consumed by a volatile mix of frustration", "possessive jealousy. outwardly, she is imperious", "demanding, barking orders at aelia", "dismissing concerns about helen with cold indifference. beneath this facade of control, however, simmers a deep-seated desperation", "insecurity. she feels abandoned", "replaced, her internal state a tempest of wounded pride", "fear that castor's affections are waning. her unspoken conflict lies in her ambition for power clashing with her raw, possessive desires for castor, creating a dangerous emotional instability.", "livilla is consumed by a volatile mix of frustration and possessive jealousy. outwardly", "she is imperious and demanding", "barking orders at aelia and dismissing concerns about helen with cold indifference. beneath this facade of control", "however", "simmers a deep-seated desperation and insecurity. she feels abandoned and replaced", "her internal state a tempest of wounded pride and fear that castor's affections are waning. her unspoken conflict lies in her ambition for power clashing with her raw", "possessive desires for castor", "creating a dangerous emotional instability."],
        ap.active_plans = ["To send a passionate and urgent message to Castor to remind him of their bond.", "To reassert her claim over Castor and undermine the proposed marriage to Helen.", "To manipulate Aelia into becoming her confidante and messenger, ensuring the message reaches Castor discreetly."],
        ap.beliefs = ["Castor's feelings for her are genuine and still strong despite appearances.", "Tiberius's decrees are temporary obstacles that can be circumvented.", "Her desires and emotions should be the primary concern in this situation, overriding political considerations and family obligations."],
        ap.goals = ["short-term\": \"To receive reassurance from Castor that his feelings for her remain strong and unchanged.", "medium-term\": \"To prevent Castor from marrying Helen and to rekindle their affair, solidifying her position in his life.", "ultimate\": \"To ultimately marry Castor, securing both her personal desires and potentially enhancing her political influence, even if it means defying Tiberius."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_3'})
    ON CREATE SET
        ap.current_status = 'Aelia enters Livilla\'s chambers, listening attentively to Livilla\'s demands, her posture suggesting a degree of caution and deference. She responds to Livilla\'s emotional outbursts with measured words, attempting to navigate the volatile situation without provoking Livilla\'s wrath. Her physical presence is less assertive, indicating her role as a messenger and intermediary rather than a primary actor in this emotional drama.',
        ap.emotional_state = 'Aelia presents a composed and diplomatic exterior, responding to Livilla with apparent sympathy and understanding, using phrases like \'Oh, my dear\' to placate her. Internally, she is likely feeling apprehensive and wary of Livilla\'s passionate outburst and the dangerous game of courtly intrigue she\'s being drawn into. There\'s an unspoken conflict between her desire to maintain a neutral stance and her being coerced into delivering a potentially risky message, highlighting her vulnerability in the face of Livilla\'s forceful personality and desperation.',
        ap.emotional_tags = ["aelia presents a composed", "diplomatic exterior, responding to livilla with apparent sympathy", "understanding, using phrases like 'oh, my dear' to placate her. internally, she is likely feeling apprehensive", "wary of livilla's passionate outburst", "the dangerous game of courtly intrigue she's being drawn into. there's an unspoken conflict between her desire to maintain a neutral stance", "her being coerced into delivering a potentially risky message, highlighting her vulnerability in the face of livilla's forceful personality", "desperation.", "aelia presents a composed and diplomatic exterior", "responding to livilla with apparent sympathy and understanding", "using phrases like 'oh", "my dear' to placate her. internally", "she is likely feeling apprehensive and wary of livilla's passionate outburst and the dangerous game of courtly intrigue she's being drawn into. there's an unspoken conflict between her desire to maintain a neutral stance and her being coerced into delivering a potentially risky message", "highlighting her vulnerability in the face of livilla's forceful personality and desperation."],
        ap.active_plans = ["To carefully listen to Livilla's instructions and understand the message she needs to convey to Castor.", "To offer calming words to Livilla, attempting to de-escalate her emotional state and manage her expectations.", "To deliver Livilla's message to Castor discreetly, minimizing her own exposure and potential repercussions from Tiberius or others."],
        ap.beliefs = ["Men's feelings and behaviors are fundamentally different from women's, suggesting a cynical or pragmatic view on relationships.", "Tiberius's authority is a significant force to be reckoned with, even for someone as powerful as Livilla.", "Maintaining appearances and adhering to social conventions is crucial for survival in the Roman court, even amidst passionate personal dramas."],
        ap.goals = ["short-term\": \"To successfully receive the message from Livilla and exit the chambers without becoming further entangled in her emotional turmoil.", "medium-term\": \"To deliver Livilla's message to Castor as requested, while ensuring her own safety and discretion in the process.", "ultimate\": \"To navigate the treacherous political landscape of the Roman court, maintaining her position and avoiding direct conflict, ultimately ensuring her own and Claudius's survival and stability."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Aelia enters Livilla\'s chambers with a composed yet concerned demeanor, her posture firm yet slightly tense as she approaches Livilla. She speaks with a measured tone, attempting to maintain a sense of calm amidst the emotional storm brewing around them.',
        ap.emotional_state = 'Aelia exhibits a surface level of calmness, yet her concern for Livilla and the dire implications of the political situation create an undercurrent of anxiety. She struggles to balance her loyalty to Livilla with the harsh realities they face, reflecting her internal conflict between personal affection and pragmatic reasoning.',
        ap.emotional_tags = ["aelia exhibits a surface level of calmness, yet her concern for livilla", "the dire implications of the political situation create an undercurrent of anxiety. she struggles to balance her loyalty to livilla with the harsh realities they face, reflecting her internal conflict between personal affection", "pragmatic reasoning.", "aelia exhibits a surface level of calmness", "yet her concern for livilla and the dire implications of the political situation create an undercurrent of anxiety. she struggles to balance her loyalty to livilla with the harsh realities they face", "reflecting her internal conflict between personal affection and pragmatic reasoning."],
        ap.active_plans = ["To reassure Livilla about her relationship with Tiberius and navigate the emotional turmoil surrounding their separation.", "To emphasize the necessity of political appearances, attempting to ground Livilla's fervor in the realities of their situation.", "To subtly remind Livilla of the precariousness of their position in the court, encouraging her to temper her ambitions for the moment."],
        ap.beliefs = ["She believes that love is often subordinate to political necessity in their world.", "Aelia holds the conviction that emotional stability is essential for survival in the political landscape of Rome.", "She recognizes that loyalty can be a double-edged sword, often leading to perilous consequences."],
        ap.goals = ["Short-term: To provide emotional support to Livilla during her distress.", "Medium-term: To manage the relationship dynamics between Livilla and Tiberius to prevent escalation.", "Ultimate: To ensure her family's survival amidst the chaos of political machinations."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_4'})
    ON CREATE SET
        ap.current_status = 'Livilla paces anxiously in her chambers, her movements restless and agitated as she contemplates the precariousness of her situation. She gestures emphatically while speaking with Aelia, illustrating her emotional turmoil and determination to reclaim what she believes is rightfully hers.',
        ap.emotional_state = 'Livilla\'s surface emotions radiate desperation and frustration, her fierce ambition clashing with the harsh reality of her separation from Tiberius. Beneath her bravado, however, lies a profound sense of despair and fear of losing both Tiberius and her daughter, highlighting the internal conflict between her desires and the constraints of their world.',
        ap.emotional_tags = ["livilla's surface emotions radiate desperation", "frustration, her fierce ambition clashing with the harsh reality of her separation from tiberius. beneath her bravado, however, lies a profound sense of despair", "fear of losing both tiberius", "her daughter, highlighting the internal conflict between her desires", "the constraints of their world.", "livilla's surface emotions radiate desperation and frustration", "her fierce ambition clashing with the harsh reality of her separation from tiberius. beneath her bravado", "however", "lies a profound sense of despair and fear of losing both tiberius and her daughter", "highlighting the internal conflict between her desires and the constraints of their world."],
        ap.active_plans = ["To assert her claim on Tiberius, attempting to reestablish her influence despite the political constraints.", "To communicate her distress about the situation with Helen, revealing the depths of her emotional stakes.", "To prepare a message to Tiberius that underscores her desperation, ensuring he understands her unwavering feelings for him."],
        ap.beliefs = ["She believes that love and loyalty should take precedence over political alliances.", "Livilla holds the conviction that her desires and ambitions should not be compromised by family ties.", "She is convinced that Tiberius's eventual demise could lead to her reclaiming power and love, despite the dangers it entails."],
        ap.goals = ["Short-term: To convey her feelings to Tiberius and urge him to remember his promise to marry her.", "Medium-term: To disrupt the marriage plans between Tiberius and Helen, positioning herself back into the center of the power dynamics.", "Ultimate: To secure her position and influence within the Imperial family, reclaiming what she perceives as her rightful place."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Livilla is a whirlwind of restless energy, pacing back and forth within her opulent chambers. Her movements are sharp and agitated, betraying her inner turmoil. She halts abruptly as Aelia enters, fixing her with an intense gaze and immediately issuing instructions, demanding Aelia act as her clandestine messenger. Her body language conveys a desperate need to exert control in a situation where she feels increasingly powerless.',
        ap.emotional_state = 'Livilla is consumed by a volatile mix of despair and possessive rage. Outwardly, she expresses intense frustration and a sense of being driven to the brink, using dramatic pronouncements to emphasize her suffering. Beneath the surface, jealousy and insecurity gnaw at her, fueled by the fear of losing her desired lover to another woman, even her own daughter. An unspoken conflict rages within her: the clash between her ambition for power and her desperate longing for personal validation and romantic fulfillment, creating a palpable tension.',
        ap.emotional_tags = ["livilla is consumed by a volatile mix of despair", "possessive rage. outwardly, she expresses intense frustration", "a sense of being driven to the brink, using dramatic pronouncements to emphasize her suffering. beneath the surface, jealousy", "insecurity gnaw at her, fueled by the fear of losing her desired lover to another woman, even her own daughter. an unspoken conflict rages within her: the clash between her ambition for power", "her desperate longing for personal validation", "romantic fulfillment, creating a palpable tension.", "livilla is consumed by a volatile mix of despair and possessive rage. outwardly", "she expresses intense frustration and a sense of being driven to the brink", "using dramatic pronouncements to emphasize her suffering. beneath the surface", "jealousy and insecurity gnaw at her", "fueled by the fear of losing her desired lover to another woman", "even her own daughter. an unspoken conflict rages within her: the clash between her ambition for power and her desperate longing for personal validation and romantic fulfillment", "creating a palpable tension."],
        ap.active_plans = ["To use Aelia as an intermediary to communicate her distress and demands to her desired lover.", "To remind 'him' of her claim on him and their past promises of marriage.", "To manipulate 'him' emotionally by expressing her despair and highlighting the intolerable nature of their separation."],
        ap.beliefs = ["She firmly believes that 'he' rightfully belongs to her and that their bond transcends any political arrangement.", "She believes Tiberius's reign is finite and temporary, and therefore should not dictate her long-term desires.", "She believes in the power of her own emotions and desires to influence the actions of others, particularly 'him'."],
        ap.goals = ["short_term\": \"To receive immediate reassurance of 'his' unwavering love and loyalty through Aelia's report.", "medium_term\": \"To prevent 'him' from marrying her daughter Helen and secure his commitment to her instead.", "ultimate\": \"To ultimately marry 'him', solidifying her position and reclaiming control over her romantic and political destiny, regardless of Tiberius's wishes."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_5'})
    ON CREATE SET
        ap.current_status = 'Aelia enters Livilla\'s chambers with a composed demeanor, immediately engaging Livilla in conversation. She adopts a cautiously reassuring posture, listening attentively to Livilla\'s outburst and responding with placating words. She accepts the task of delivering Livilla\'s message, indicating a willingness to play the role of intermediary in this delicate and potentially dangerous situation. Her movements are deliberate and controlled, reflecting her attempt to navigate the volatile emotional landscape of the scene.',
        ap.emotional_state = 'Aelia maintains a surface calm, employing soothing tones and diplomatic language to manage Livilla\'s emotional volatility. Internally, she is likely navigating a complex web of loyalties and self-preservation. While outwardly reassuring Livilla of \'his\' feelings, she may harbor private doubts or anxieties about the situation\'s true nature and potential repercussions. There\'s an unspoken tension between her role as a seemingly supportive confidante and the pragmatic awareness of the political risks associated with Livilla\'s passionate desires and Tiberius\'s authority.',
        ap.emotional_tags = ["aelia maintains a surface calm, employing soothing tones", "diplomatic language to manage livilla's emotional volatility. internally, she is likely navigating a complex web of loyalties", "self-preservation. while outwardly reassuring livilla of 'his' feelings, she may harbor private doubts or anxieties about the situation's true nature", "potential repercussions. there's an unspoken tension between her role as a seemingly supportive confidante", "the pragmatic awareness of the political risks associated with livilla's passionate desires", "tiberius's authority.", "aelia maintains a surface calm", "employing soothing tones and diplomatic language to manage livilla's emotional volatility. internally", "she is likely navigating a complex web of loyalties and self-preservation. while outwardly reassuring livilla of 'his' feelings", "she may harbor private doubts or anxieties about the situation's true nature and potential repercussions. there's an unspoken tension between her role as a seemingly supportive confidante and the pragmatic awareness of the political risks associated with livilla's passionate desires and tiberius's authority."],
        ap.active_plans = ["To assess Helen's condition by inquiring about her health and improvement, potentially gathering information to report back later.", "To pacify Livilla's emotional distress by offering comforting words and assurances about 'his' feelings, aiming to de-escalate the immediate tension.", "To agree to deliver Livilla's message as requested, positioning herself as a helpful and trustworthy go-between while carefully considering the implications of this action."],
        ap.beliefs = ["She believes in the necessity of maintaining social decorum and political appearances, as suggested by her mention of a 'marriage of convenience'.", "She believes in a fundamental difference between men and women in matters of love and relationships ('Men are different'), potentially justifying 'his' actions to Livilla.", "She believes in the temporary nature of the current separation and the possibility of eventual resolution and reconciliation, offering a glimmer of hope to Livilla to manage her despair."],
        ap.goals = ["short_term\": \"To calm Livilla's immediate emotional outburst and successfully receive the message for delivery without escalating the situation further.", "medium_term\": \"To maintain her position as a trusted figure within the court, capable of navigating delicate interpersonal and political situations, thus ensuring her continued relevance and influence.", "ultimate\": \"To ensure her own survival and stability within the treacherous Roman court by skillfully playing various roles \u2013 confidante, messenger, observer \u2013 and adapting to the ever-shifting power dynamics, ultimately prioritizing her own well-being in a dangerous environment."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_11_1'})
    ON CREATE SET
        oi.description = 'The scroll serves as the focal point of the scene, representing Claudius\'s scholarly pursuits. It is presented by Atticus, who touts its ornate decoration as an enhancement to Claudius\'s work on Carthage, though Claudius rejects the embellishments. This conflict highlights the tension between scholarly integrity and fashionable presentation.',
        oi.status_before = 'The scroll existed as a raw, unfinished manuscript with simple text awaiting transcription and decoration, reflecting its potential.',
        oi.status_after = 'Following the conversation, the scroll will undergo modifications, removing the decorative elephants, highlighting Claudius\'s insistence on scholarly simplicity over ornamentation.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_11_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_11_2'})
    ON CREATE SET
        oi.description = 'The scroll, containing Claudius\'s \'History of Carthage\', is presented by Atticus as a finished product, lavishly decorated with elephant motifs and ornate lettering, embodying Atticus\'s artistic and commercial vision for the work. It becomes the central point of contention, sparking a debate between Claudius and Atticus about the appropriateness of its decoration versus the seriousness of its scholarly content. The scroll visually represents the clash between superficial aesthetics and scholarly substance, and ultimately becomes a symbol of Claudius\'s pragmatic compromise.',
        oi.status_before = 'The scroll exists as a newly completed, highly decorated copy of Claudius\'s \'History of Carthage\', fresh from Atticus\'s scriptorium, intended to be presented to Claudius as a finished and impressive piece of work, ready for his approval and use.',
        oi.status_after = 'The scroll remains decorated with elephants, despite Claudius\'s disapproval of the ornamentation. Claudius, needing a copy immediately, pragmatically accepts the decorated version, making the scroll a slightly ironic symbol of his concession and the prevailing superficiality he often encounters. It is now in Claudius\'s possession, ready to be used, albeit with unwanted embellishments.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_11_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_11_3'})
    ON CREATE SET
        oi.description = 'The scroll serves as the focal point of discussion between Claudius and Atticus, representing both a tangible product of their work and a battleground for their differing views on aesthetics. Claudius\'s frustrations with its decoration illustrate his desire for integrity in scholarship, while the scroll\'s ornate presentation symbolizes Atticus\'s commercial mindset.',
        oi.status_before = 'The scroll is in the process of being copied, adorned with lavish decorations, including elephants, which Claudius finds excessive and inappropriate for the historical work on Carthage.',
        oi.status_after = 'Following Claudius\'s insistence, the scroll will undergo revisions, removing the decorative elements as per his preferences, illustrating the tension between artistic flourish and academic seriousness.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_11_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated at a desk, examining a scroll with a furrowed brow. He gestures dismissively at Atticus’s exuberance, his posture tense as he struggles to maintain composure. He fidgets with the scroll, emphasizing his irritation with the ornate decorations.',
        ap.emotional_state = 'Outwardly, Claudius displays mild annoyance, his tone sharp yet restrained as he critiques the excessive embellishments. Internally, he wrestles with a deeper frustration about maintaining scholarly integrity in a world that prioritizes superficial aesthetics, feeling the weight of expectation from those around him.',
        ap.emotional_tags = ["outwardly", "claudius displays mild annoyance", "his tone sharp yet restrained as he critiques the excessive embellishments. internally", "he wrestles with a deeper frustration about maintaining scholarly integrity in a world that prioritizes superficial aesthetics", "feeling the weight of expectation from those around him."],
        ap.active_plans = ["To assert his preference for scholarly simplicity in the presentation of his work.", "To navigate the conversation with Atticus without causing offense, reflecting his desire for political and social harmony.", "To ensure the integrity of his research is preserved in the publication."],
        ap.beliefs = ["Serious scholarship should not be overshadowed by decorative excess.", "The true value of a historical work lies in its content, not its embellishments.", "He has a duty to uphold scholarly standards, even amongst the frivolities of the court."],
        ap.goals = ["Short-term: To finalize the scroll's edition without unnecessary decoration.", "Medium-term: To establish his reputation as a serious scholar among his peers.", "Ultimate: To contribute meaningful historical scholarship that reflects the truth of the past."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_1'})
    ON CREATE SET
        ap.current_status = 'Atticus enters the study bustling with energy, brandishing the beautifully transcribed scroll. His posture is animated, gesturing towards the decorations as he extols their virtues, exuding confidence in his work while seemingly oblivious to Claudius’s discontent.',
        ap.emotional_state = 'Atticus radiates enthusiasm and self-satisfaction, believing he has met Claudius’s expectations with the ornate design. However, beneath this cheerful exterior lies a hint of tension; he feels the pressure to please Claudius while grappling with his own artistic inclinations.',
        ap.emotional_tags = ["atticus radiates enthusiasm", "self-satisfaction, believing he has met claudius\u2019s expectations with the ornate design. however, beneath this cheerful exterior lies a hint of tension; he feels the pressure to please claudius while grappling with his own artistic inclinations.", "atticus radiates enthusiasm and self-satisfaction", "believing he has met claudius\u2019s expectations with the ornate design. however", "beneath this cheerful exterior lies a hint of tension; he feels the pressure to please claudius while grappling with his own artistic inclinations.", "atticus radiates enthusiasm and self-satisfaction, believing he has met claudius\u2019s expectations with the ornate design. however, beneath this cheerful exterior lies a hint of tension", "he feels the pressure to please claudius while grappling with his own artistic inclinations.", "atticus radiates enthusiasm and self-satisfaction, believing he has met claudius\u2019s expectations with the ornate design. however, beneath this cheerful exterior lies a hint of tension; he feels the pressure to please claudius", "grappling with his own artistic inclinations."],
        ap.active_plans = ["To showcase the craftsmanship of the scroll and express pride in the work completed.", "To persuade Claudius of the merits of the decorative elements as fashionable and appropriate for the historical narrative.", "To re-establish a harmonious working relationship with Claudius despite the disagreement."],
        ap.beliefs = ["Aesthetics are crucial in publishing and should reflect current trends to appeal to readers.", "The embellishments enhance the storytelling aspect of history, making it more engaging.", "His role as a publisher is to balance the demands of content with artistic presentation."],
        ap.goals = ["Short-term: To defend the inclusion of elephants in the scroll as a necessary motif.", "Medium-term: To maintain the business relationship with Claudius while delivering quality work.", "Ultimate: To establish his reputation as a leading publisher in Rome, renowned for both content and artistic flair."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Claudius is seated in his study, deeply engrossed in reading a scroll, his brow furrowed in concentration. When Atticus enters with a flourish, Claudius rises to meet him, though his initial scholarly focus quickly shifts to mild annoyance as he examines the presented copies. Despite his clear disapproval of the ornate decorations, he ultimately pragmatically agrees to take a copy with the unwanted elephants.',
        ap.emotional_state = 'Initially, Claudius is in a state of scholarly absorption, detached from the petty concerns of court life. This quickly transitions to irritation and exasperation as he confronts Atticus\'s flamboyant artistic choices, feelings of frustration simmering beneath a veneer of weary politeness.  Internally, he is likely battling between his desire for scholarly integrity and the pragmatic need to simply get the task done, revealing a resignation to the superficialities of his world.',
        ap.emotional_tags = ["initially, claudius is in a state of scholarly absorption, detached from the petty concerns of court life. this quickly transitions to irritation", "exasperation as he confronts atticus's flamboyant artistic choices, feelings of frustration simmering beneath a veneer of weary politeness.  internally, he is likely battling between his desire for scholarly integrity", "the pragmatic need to simply get the task done, revealing a resignation to the superficialities of his world.", "initially", "claudius is in a state of scholarly absorption", "detached from the petty concerns of court life. this quickly transitions to irritation and exasperation as he confronts atticus's flamboyant artistic choices", "feelings of frustration simmering beneath a veneer of weary politeness.  internally", "he is likely battling between his desire for scholarly integrity and the pragmatic need to simply get the task done", "revealing a resignation to the superficialities of his world."],
        ap.active_plans = ["To secure a copy of his 'History of Carthage' for his immediate use.", "To firmly communicate his preference for a serious, undecorated version of his historical work to Atticus.", "To disengage from the trivial argument about decoration and move on to more intellectually stimulating discussions, as exemplified by his eagerness to talk with Gallus."],
        ap.beliefs = ["A serious historical text should prioritize content and clarity over superficial aesthetic embellishments.", "Practicality and expediency sometimes necessitate compromising on ideal preferences.", "Intellectual discourse and scholarly pursuits are inherently more valuable and meaningful than frivolous artistic debates."],
        ap.goals = ["Short-term Goal: Obtain a usable copy of his 'History of Carthage' without further delay, even if it's not aesthetically ideal.", "Medium-term Goal: Ensure that future copies of his work, or at least a separate edition, are produced in a more scholarly, undecorated style.", "Ultimate Goal: Be recognized and respected as a serious historian and intellectual, beyond his imperial lineage and perceived eccentricities."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_2'})
    ON CREATE SET
        ap.current_status = 'Atticus bursts into Claudius\'s study, brimming with theatrical enthusiasm, gesturing grandly towards the scrolls he carries. He presents them as masterpieces of his scriptorium\'s craft, eagerly awaiting praise. When met with Claudius\'s disapproval, he becomes flustered and defensive, yet quickly shifts to a show of exaggerated flexibility, dramatically conceding to Claudius\'s wishes, albeit with a hint of wounded artistic pride.',
        ap.emotional_state = 'Atticus begins with exuberant pride and confidence in his artistic judgment and the quality of his work, seeking validation from his esteemed client. Claudius\'s negative reaction throws him into a state of flustered defensiveness, tinged with a performative dramatic flair. Beneath the surface, he is likely experiencing a conflict between his desire to please his client and his own commercial and artistic instincts, masking any genuine disappointment with a show of professional adaptability.',
        ap.emotional_tags = ["atticus begins with exuberant pride", "confidence in his artistic judgment", "the quality of his work, seeking validation from his esteemed client. claudius's negative reaction throws him into a state of flustered defensiveness, tinged with a performative dramatic flair. beneath the surface, he is likely experiencing a conflict between his desire to please his client", "his own commercial", "artistic instincts, masking any genuine disappointment with a show of professional adaptability.", "atticus begins with exuberant pride and confidence in his artistic judgment and the quality of his work", "seeking validation from his esteemed client. claudius's negative reaction throws him into a state of flustered defensiveness", "tinged with a performative dramatic flair. beneath the surface", "he is likely experiencing a conflict between his desire to please his client and his own commercial and artistic instincts", "masking any genuine disappointment with a show of professional adaptability."],
        ap.active_plans = ["To impress Claudius with the luxurious and fashionable quality of the decorated scroll copies.", "To justify his artistic choices, particularly the elephant motif, as being both fashionable and thematically appropriate.", "To maintain a positive and profitable business relationship with Claudius by ultimately appearing to concede to his client's demands, even if somewhat reluctantly."],
        ap.beliefs = ["Ornate decoration enhances the perceived value and desirability of a scholarly work, especially for a wealthy Roman clientele.", "Current fashion and artistic trends are crucial for commercial success and client satisfaction in the scriptorium business.", "Dramatic gestures and a show of accommodating flexibility are effective ways to manage client relations and maintain a veneer of professionalism."],
        ap.goals = ["Short-term Goal: Salvage the situation by appearing agreeable to Claudius's preferences, even if it means downplaying his own artistic vision.", "Medium-term Goal: Continue to secure commissions from Claudius and other wealthy patrons by demonstrating both artistic capability and client service.", "Ultimate Goal: Establish and maintain a highly successful and prestigious scriptorium, known for both artistic quality and business acumen within Roman society."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Atticus enters the study bustling with energy, gesturing enthusiastically as he presents the beautifully crafted scrolls to Claudius. His posture is animated, filled with excitement over the work they have done, despite the tension in the air regarding the ornamentation.',
        ap.emotional_state = 'Atticus displays surface-level enthusiasm and pride in the completed copies, his tone buoyant and his eyes sparkling with excitement. Yet beneath this, there remains a hidden tension; he is overly eager to please and perhaps a touch anxious about Claudius\'s reaction to the ornate decorations, which clashes with his own aesthetic preferences.',
        ap.emotional_tags = ["atticus displays surface-level enthusiasm", "pride in the completed copies, his tone buoyant", "his eyes sparkling with excitement. yet beneath this, there remains a hidden tension; he is overly eager to please", "perhaps a touch anxious about claudius's reaction to the ornate decorations, which clashes with his own aesthetic preferences.", "atticus displays surface-level enthusiasm and pride in the completed copies", "his tone buoyant and his eyes sparkling with excitement. yet beneath this", "there remains a hidden tension; he is overly eager to please and perhaps a touch anxious about claudius's reaction to the ornate decorations", "which clashes with his own aesthetic preferences.", "atticus displays surface-level enthusiasm and pride in the completed copies, his tone buoyant and his eyes sparkling with excitement. yet beneath this, there remains a hidden tension", "he is overly eager to please and perhaps a touch anxious about claudius's reaction to the ornate decorations, which clashes with his own aesthetic preferences."],
        ap.active_plans = ["To showcase the completed scrolls and impress Claudius with the quality of work.", "To persuade Claudius to accept the decorative elements he initially criticized.", "To maintain a positive relationship with Claudius by navigating his preferences tactfully."],
        ap.beliefs = ["He believes in the importance of aesthetics in literature and that beauty enhances the reader's experience.", "He thinks that pleasing his patrician clients is essential for the success of his library.", "He views scholarly works as both an art form and a commercial product that must appeal to taste."],
        ap.goals = ["Short-term: To finalize the scrolls for immediate delivery to Claudius.", "Medium-term: To establish a reputation for quality work in the eyes of influential clients.", "Ultimate: To secure ongoing patronage from the elite of Rome, ensuring the financial viability of his library."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    ON CREATE SET
        ap.current_status = 'Claudius sits at the desk, examining a scroll with a furrowed brow. He maintains a tense yet determined posture, his hands gesturing dismissively as he expresses his concerns about the ornate decorations while engaging with Atticus.',
        ap.emotional_state = 'Outwardly, Claudius appears frustrated and annoyed by the excessive decoration of the scrolls, his tone clipped and his expression stern. Internally, he feels a deeper sense of intellectual integrity and desire for seriousness in scholarly work, wrestling with the pressure to maintain his status while confronting the frivolity he perceives around him.',
        ap.emotional_tags = ["outwardly, claudius appears frustrated", "annoyed by the excessive decoration of the scrolls, his tone clipped", "his expression stern. internally, he feels a deeper sense of intellectual integrity", "desire for seriousness in scholarly work, wrestling with the pressure to maintain his status while confronting the frivolity he perceives around him.", "outwardly", "claudius appears frustrated and annoyed by the excessive decoration of the scrolls", "his tone clipped and his expression stern. internally", "he feels a deeper sense of intellectual integrity and desire for seriousness in scholarly work", "wrestling with the pressure to maintain his status while confronting the frivolity he perceives around him.", "outwardly, claudius appears frustrated and annoyed by the excessive decoration of the scrolls, his tone clipped and his expression stern. internally, he feels a deeper sense of intellectual integrity and desire for seriousness in scholarly work, wrestling with the pressure to maintain his status", "confronting the frivolity he perceives around him."],
        ap.active_plans = ["To assert his authority over the scroll's content and aesthetics against Atticus's commercial approach.", "To ensure that the scrolls reflect a serious academic tone fitting for his scholarly intentions.", "To engage intellectually with Gallus, shifting from a simple disagreement to a constructive discussion."],
        ap.beliefs = ["He believes that scholarly works should prioritize substance over embellishment.", "He thinks that his intellect and knowledge should be recognized and respected despite his stammer.", "He holds a conviction that literature has a role in shaping understanding and should reflect serious historical narratives."],
        ap.goals = ["Short-term: To clarify his preferences for the scrolls and ensure they align with his vision of serious scholarship.", "Medium-term: To engage in a meaningful intellectual exchange with Gallus that validates his scholarly efforts.", "Ultimate: To contribute to the discourse of Roman history in a way that establishes his credibility and importance in the political landscape."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_history_of_carthage_elephants_event_12_1'})
    ON CREATE SET
        oi.description = 'The \'History of Carthage with elephants\' is the central point of contention and action within Atticus\'s library. It serves as a tangible example of the intersection between artistic creation and commercial demands in Roman publishing. Atticus uses this specific edition to illustrate his business philosophy, instructing the scribe to erase the \'exquisite\' elephant illustrations because they might not appeal to all clients. The scroll becomes a prop in Atticus\'s lesson on client-centric business practices, directly influencing the scribe\'s actions as he is ordered to modify it.',
        oi.status_before = 'Prior to Atticus\'s intervention, the \'History of Carthage with elephants\' exists as a completed or near-completed scroll, featuring detailed and \'exquisite\' illustrations of elephants. It represents a more elaborate, potentially higher-value edition, ready for sale or presentation to clients who might appreciate artistic embellishments. It stands as a testament to the scribe\'s skill and the potential for artistic flourish in book production.',
        oi.status_after = 'Following Atticus\'s instructions, the \'History of Carthage with elephants\' is transformed into a revised, less embellished version. The \'exquisite\' elephant illustrations are erased, leaving behind only the bare text. It becomes a more streamlined, commercially practical edition, designed to appeal to a broader range of clients or those with specific preferences against illustrated versions. The scroll shifts from an example of artistic detail to one of commercial adaptability and client-focused production.'
    WITH oi
    MATCH (o:Object {uuid: 'object_history_of_carthage_elephants'})
    MATCH (e:Event {uuid: 'event_12_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_history_of_carthage_elephants_event_12_2'})
    ON CREATE SET
        oi.description = 'The History of Carthage with elephants serves as a focal point in the conversation between Claudius and Atticus. Claudius insists on receiving a copy despite the artistic embellishments, highlighting his determination amid pressing scholarly needs. The book symbolizes the intersection of political expectations and Claudius\'s scholarly pursuits, becoming a narrative device that underscores the tension in the scene involving artistic integrity and client desires.',
        oi.status_before = 'The History of Carthage with elephants is in the process of being revised for a client, characterized by exquisite illustrations that Atticus believes may not be commercially viable.',
        oi.status_after = 'Following Claudius\'s insistence, the book is marked for immediate completion, indicating a shift in focus from Atticus’s artistic standards toward fulfilling Claudius\'s urgent demand, although Atticus plans to erase the illustrations before finalizing.'
    WITH oi
    MATCH (o:Object {uuid: 'object_history_of_carthage_elephants'})
    MATCH (e:Event {uuid: 'event_12_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_history_of_carthage_event_12_3'})
    ON CREATE SET
        oi.description = 'The \'History of Carthage\' serves as the central object of transaction and discussion in this event. Claudius is present in the library specifically to procure a copy, indicating his desire to possess and likely utilize this work. Atticus mentions its availability in different editions (\'with elephants\', \'without elephants\'), highlighting its status as a published work available for purchase. Gallus\'s inquiry about Claudius\'s \'History of Carthage\' and Atticus preparing a copy for him underscores its significance within the Roman intellectual community and its role as a tangible product of Claudius\'s scholarship.',
        oi.status_before = 'Multiple copies of \'History of Carthage\' exist within Atticus\'s library, in varying states of completion and decoration (some with elephant illustrations). Claudius possesses the original manuscript and potentially other copies, including one at home decorated with elephants. Gallus is aware of its existence and Claudius\'s authorship.',
        oi.status_after = 'Claudius successfully acquires a copy of \'History of Carthage\' from Atticus, adding to his personal collection. Atticus is instructed to prepare another copy for Gallus, which will be ready in seven days, furthering the circulation and dissemination of the work. The \'History of Carthage\' remains a sought-after intellectual commodity, actively being distributed and discussed within Roman society.'
    WITH oi
    MATCH (o:Object {uuid: 'object_history_of_carthage'})
    MATCH (e:Event {uuid: 'event_12_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_essay_pollio_cicero_event_12_4'})
    ON CREATE SET
        oi.description = 'The essay on Pollio and Cicero serves as a focal point in the conversation between Gallus and Claudius. It represents not only Gallus\'s intellectual endeavor but also the competitive nature of scholarly discourse in Rome. Claudius\'s disagreement with the essay highlights their differing viewpoints, illustrating the tension and rivalry that exists among scholars. The essay ultimately becomes a vehicle for Claudius to assert his own ideas in a public setting, aligning with his desire for intellectual validation.',
        oi.status_before = 'Prior to the event, the essay exists as a completed work authored by Gallus, likely circulated among scholars as a significant contribution to political and historical discourse involving prominent figures.',
        oi.status_after = 'Following the event, the essay\'s status remains unchanged in terms of its content, but it gains notoriety as a point of contention between Gallus and Claudius, encapsulating the dynamic of their intellectual rivalry.'
    WITH oi
    MATCH (o:Object {uuid: 'object_essay_pollio_cicero'})
    MATCH (e:Event {uuid: 'event_12_4'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_1'})
    ON CREATE SET
        ap.current_status = 'Atticus stands firmly behind the counter in his bustling library, his posture erect as he oversees his scribes with a keen eye. He gestures with a decisive hand as he addresses one scribe in particular, his voice carrying the weight of a publisher\'s authority amidst the rustling of papyrus and scratching of quills. He is actively managing the workflow and quality control within his scriptorium, ensuring every detail aligns with client demands.',
        ap.emotional_state = 'Atticus is in a pragmatic and business-oriented mood, exhibiting a blend of shrewdness and slight impatience. Outwardly, he maintains a professional demeanor, yet beneath the surface, there\'s a hint of the commercial pressure he operates under. He is focused on efficiency and customer satisfaction, prioritizing practical business considerations over artistic indulgences. While he appreciates the scribe\'s artistry, his primary concern is meeting client expectations and deadlines.',
        ap.emotional_tags = ["atticus is in a pragmatic", "business-oriented mood, exhibiting a blend of shrewdness", "slight impatience. outwardly, he maintains a professional demeanor, yet beneath the surface, there's a hint of the commercial pressure he operates under. he is focused on efficiency", "customer satisfaction, prioritizing practical business considerations over artistic indulgences. while he appreciates the scribe's artistry, his primary concern is meeting client expectations", "deadlines.", "atticus is in a pragmatic and business-oriented mood", "exhibiting a blend of shrewdness and slight impatience. outwardly", "he maintains a professional demeanor", "yet beneath the surface", "there's a hint of the commercial pressure he operates under. he is focused on efficiency and customer satisfaction", "prioritizing practical business considerations over artistic indulgences. while he appreciates the scribe's artistry", "his primary concern is meeting client expectations and deadlines."],
        ap.active_plans = ["Ensure the 'History of Carthage' edition meets client preferences by removing unwanted elephant illustrations.", "Maintain the efficiency of his scriptorium by instructing scribes to rework editions promptly.", "Uphold his reputation for quality and customer service in the competitive Roman publishing market."],
        ap.beliefs = ["Client satisfaction is the cornerstone of a successful publishing business.", "Adaptability and responsiveness to client demands are essential for commercial viability.", "Practicality and cost-effectiveness must guide business decisions, even at the expense of artistic embellishments."],
        ap.goals = ["Short-term: Instruct the scribe to remove all elephant illustrations from the 'History of Carthage' edition.", "Medium-term: Deliver the revised 'History of Carthage' edition to Asinius Gallus within the promised timeframe.", "Ultimate: Sustain a thriving and profitable publishing business by consistently meeting client needs and adapting to market demands."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_scribe_1_event_12_1'})
    ON CREATE SET
        ap.current_status = 'The Scribe stands attentively before Atticus, holding a scroll adorned with detailed elephant illustrations. He listens respectfully, albeit with a slightly subdued posture, as Atticus delivers instructions regarding the removal of his artwork. His quill and ink are momentarily paused, awaiting direction, his stance reflecting a professional readiness to comply with his superior\'s orders.',
        ap.emotional_state = 'The Scribe likely experiences a mix of resignation and slight disappointment. While he outwardly shows professional acceptance of Atticus\'s directive, there\'s an undercurrent of subdued artistic frustration. He may feel a personal attachment to the \'exquisitely drawn\' elephants, his artistic pride perhaps slightly wounded by their dismissal for commercial reasons. However, his training and professional role dictate obedience, suppressing any overt display of personal feelings in favor of compliance.',
        ap.emotional_tags = ["the scribe likely experiences a mix of resignation", "slight disappointment. while he outwardly shows professional acceptance of atticus's directive, there's an undercurrent of subdued artistic frustration. he may feel a personal attachment to the 'exquisitely drawn' elephants, his artistic pride perhaps slightly wounded by their dismissal for commercial reasons. however, his training", "professional role dictate obedience, suppressing any overt display of personal feelings in favor of compliance.", "the scribe likely experiences a mix of resignation and slight disappointment. while he outwardly shows professional acceptance of atticus's directive", "there's an undercurrent of subdued artistic frustration. he may feel a personal attachment to the 'exquisitely drawn' elephants", "his artistic pride perhaps slightly wounded by their dismissal for commercial reasons. however", "his training and professional role dictate obedience", "suppressing any overt display of personal feelings in favor of compliance."],
        ap.active_plans = ["Actively listen to and fully understand Atticus's instructions regarding the alteration of the scroll.", "Acknowledge and accept the commercial rationale behind removing the elephant illustrations, despite any personal artistic preferences.", "Prepare to diligently rework the 'History of Carthage' edition by carefully erasing all traces of the elephant illustrations as instructed."],
        ap.beliefs = ["The publisher's directives are to be followed without question in a commercial scriptorium setting.", "Client preference and commercial viability take precedence over individual artistic expression in commissioned works.", "Professionalism requires accepting and adapting to feedback, even when it involves modifying or removing carefully crafted work."],
        ap.goals = ["Short-term: Comprehend and immediately begin executing Atticus's instructions to erase the elephant illustrations from the scroll.", "Medium-term: Efficiently rework the 'History of Carthage' edition to meet the revised specifications and deadlines.", "Ultimate: Continue to perform his duties diligently as a scribe, contributing to the scriptorium's output while navigating the balance between artistic skill and commercial demands."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands at the counter of Atticus\'s cluttered library, his posture tense with impatience. He fidgets, his hands gripping the edge of a scroll as he waits for Atticus to complete his work. His brows furrow in frustration, and he speaks with urgency, his voice slightly raised as he insists on receiving a copy of the History of Carthage today, despite the artistically unnecessary elephant illustrations.',
        ap.emotional_state = 'Claudius’s surface demeanor reflects impatience and determination as he feels the pressure of time weighing on him. Internally, he wrestles with anxiety and a sense of urgency, driven by the need to assert his scholarly ambitions in a world filled with political machinations. His rapid speech reveals an urgency beneath the awkwardness, hinting at a deeper fear of being overlooked or dismissed.',
        ap.emotional_tags = ["claudius\u2019s surface demeanor reflects impatience", "determination as he feels the pressure of time weighing on him. internally, he wrestles with anxiety", "a sense of urgency, driven by the need to assert his scholarly ambitions in a world filled with political machinations. his rapid speech reveals an urgency beneath the awkwardness, hinting at a deeper fear of being overlooked or dismissed.", "claudius\u2019s surface demeanor reflects impatience and determination as he feels the pressure of time weighing on him. internally", "he wrestles with anxiety and a sense of urgency", "driven by the need to assert his scholarly ambitions in a world filled with political machinations. his rapid speech reveals an urgency beneath the awkwardness", "hinting at a deeper fear of being overlooked or dismissed."],
        ap.active_plans = ["Obtain a copy of the History of Carthage today, despite the unconventional illustrations.", "Navigate the complexities of scholarly expectations amidst political pressures.", "Maintain his position as a serious scholar in the face of distractions."],
        ap.beliefs = ["The pursuit of knowledge is essential, even within the chaotic Roman political landscape.", "His scholarly work can contribute to his standing and legacy in Roman society.", "He must assert his needs and desires to be taken seriously by those in power."],
        ap.goals = ["Short-term: Secure a copy of the History of Carthage for immediate use.", "Medium-term: Establish himself as a respected scholar despite his social awkwardness.", "Ultimate: Navigate the treacherous waters of Roman politics while contributing to historical discourse."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_2'})
    ON CREATE SET
        ap.current_status = 'Atticus stands behind the counter, overseeing his scribes with a keen eye. He appears composed, demonstrating his shrewdness as he discusses the ongoing work on the History of Carthage. His gestures are precise and calculated as he addresses Claudius and Gallus, suggesting revisions and maintaining the balance between client satisfaction and artistic integrity.',
        ap.emotional_state = 'Atticus\'s surface demeanor is one of calm authority, though there\'s an underlying tension in his voice as he navigates Claudius\'s impatience. He maintains a pragmatic outlook, balancing his role as a publisher with the whims of his patrician clients. Beneath this calm, he is keenly aware of the stakes involved in satisfying both artistic standards and client demands.',
        ap.emotional_tags = ["atticus's surface demeanor is one of calm authority, though there's an underlying tension in his voice as he navigates claudius's impatience. he maintains a pragmatic outlook, balancing his role as a publisher with the whims of his patrician clients. beneath this calm, he is keenly aware of the stakes involved in satisfying both artistic standards", "client demands.", "atticus's surface demeanor is one of calm authority", "though there's an underlying tension in his voice as he navigates claudius's impatience. he maintains a pragmatic outlook", "balancing his role as a publisher with the whims of his patrician clients. beneath this calm", "he is keenly aware of the stakes involved in satisfying both artistic standards and client demands."],
        ap.active_plans = ["Ensure the revisions to the History of Carthage meet client expectations and artistic standards.", "Maintain his reputation as a reliable publisher while managing the demands of powerful patrons.", "Facilitate a smooth transaction and preserve positive relationships with clients like Gallus."],
        ap.beliefs = ["Artistic integrity must be preserved even at the cost of immediate client satisfaction.", "Successful publishing relies on balancing client demands with the quality of work.", "Sustaining relationships with influential clients is key to his business's longevity."],
        ap.goals = ["Short-term: Complete the revision of the History of Carthage to meet Claudius's needs.", "Medium-term: Build a strong reputation as a shrewd and reliable publisher.", "Ultimate: Establish a lasting legacy in the literary community of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Atticus stands behind the counter in his library, directing his scribes with specific instructions about their work, demonstrating his control over the scriptorium\'s operations. He engages with Claudius as a customer, fulfilling his order, and smoothly transitions to greet the patrician Gallus, showcasing his adeptness at managing different clients.',
        ap.emotional_state = 'Atticus presents a veneer of professional courtesy and shrewdness, especially when dealing with clients. Outwardly, he is calm and efficient, maintaining a business-like demeanor even when faced with rework. Beneath the surface, he is pragmatic and focused on the smooth operation of his business, prioritizing customer satisfaction and demonstrating a subtle obsequiousness towards higher-status individuals like Gallus to ensure continued patronage.',
        ap.emotional_tags = ["atticus presents a veneer of professional courtesy", "shrewdness, especially when dealing with clients. outwardly, he is calm", "efficient, maintaining a business-like demeanor even when faced with rework. beneath the surface, he is pragmatic", "focused on the smooth operation of his business, prioritizing customer satisfaction", "demonstrating a subtle obsequiousness towards higher-status individuals like gallus to ensure continued patronage.", "atticus presents a veneer of professional courtesy and shrewdness", "especially when dealing with clients. outwardly", "he is calm and efficient", "maintaining a business-like demeanor even when faced with rework. beneath the surface", "he is pragmatic and focused on the smooth operation of his business", "prioritizing customer satisfaction and demonstrating a subtle obsequiousness towards higher-status individuals like gallus to ensure continued patronage."],
        ap.active_plans = ["Ensure the efficient production and delivery of book copies to his clients.", "Maintain a positive and professional interaction with both Claudius and Gallus to secure future business.", "Manage his scribes effectively to meet client demands, even when rework is required, minimizing disruption to workflow."],
        ap.beliefs = ["Customer satisfaction is paramount for business success.", "Respecting social hierarchy and catering to patrician clients is essential for a thriving Roman business.", "Efficiency and timely delivery are key to maintaining a reputable and profitable library and scriptorium."],
        ap.goals = ["short-term\": \"Fulfill Claudius's immediate request for a copy of 'History of Carthage' and address Gallus's inquiry efficiently.", "medium-term\": \"Complete Gallus's order within the promised seven days and ensure all book copies are produced to client specifications, adjusting production as needed.", "ultimate\": \"Sustain and grow a prosperous library and publishing business by providing excellent service and catering to the literary needs of Rome's elite."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    ON CREATE SET
        ap.current_status = 'Claudius is positioned in Atticus\'s library as a customer, waiting somewhat impatiently for his copy of \'History of Carthage\'. He interacts with Atticus to finalize his purchase and then engages in a brief, intellectually charged exchange with Gallus upon his arrival, before departing the library with him.',
        ap.emotional_state = 'Claudius displays initial impatience and a desire for swift service, evident in his repeated requests to Atticus. He transitions to a more engaged, though still slightly detached, intellectual posture when Gallus arrives. Outwardly, he is polite but firm in his disagreement with Gallus\'s essay, suggesting an underlying confidence in his own scholarly opinions, perhaps tinged with a scholarly aloofness or disregard for social niceties in intellectual debate. He is primarily focused on obtaining his book and engaging in intellectual discourse, revealing a mind absorbed in scholarly pursuits.',
        ap.emotional_tags = ["claudius displays initial impatience", "a desire for swift service, evident in his repeated requests to atticus. he transitions to a more engaged, though still slightly detached, intellectual posture when gallus arrives. outwardly, he is polite but firm in his disagreement with gallus's essay, suggesting an underlying confidence in his own scholarly opinions, perhaps tinged with a scholarly aloofness or disregard for social niceties in intellectual debate. he is primarily focused on obtaining his book", "engaging in intellectual discourse, revealing a mind absorbed in scholarly pursuits.", "claudius displays initial impatience and a desire for swift service", "evident in his repeated requests to atticus. he transitions to a more engaged", "though still slightly detached", "intellectual posture when gallus arrives. outwardly", "he is polite but firm in his disagreement with gallus's essay", "suggesting an underlying confidence in his own scholarly opinions", "perhaps tinged with a scholarly aloofness or disregard for social niceties in intellectual debate. he is primarily focused on obtaining his book and engaging in intellectual discourse", "revealing a mind absorbed in scholarly pursuits.", "claudius displays initial impatience and a desire for swift service, evident in his repeated requests to atticus. he transitions to a more engaged, though still slightly detached, intellectual posture when gallus arrives. outwardly, he is polite", "firm in his disagreement with gallus's essay, suggesting an underlying confidence in his own scholarly opinions, perhaps tinged with a scholarly aloofness or disregard for social niceties in intellectual debate. he is primarily focused on obtaining his book and engaging in intellectual discourse, revealing a mind absorbed in scholarly pursuits."],
        ap.active_plans = ["Acquire a copy of his 'History of Carthage' from Atticus for his personal use and scholarly pursuits.", "Engage in intellectual debate with Gallus, articulating his differing viewpoint on Pollio and Cicero's work.", "Maintain his image as a serious scholar by engaging in intellectual discussions and demonstrating his knowledge to his peers like Gallus."],
        ap.beliefs = ["Scholarly work and intellectual pursuits are of paramount importance and deserve dedicated time and resources.", "Honest and direct intellectual critique is valuable and necessary for scholarly progress, even if it means disagreeing with established figures.", "His 'History of Carthage' is a significant contribution to scholarship and worthy of dissemination and discussion within intellectual circles."],
        ap.goals = ["short-term\": \"Secure the copy of 'History of Carthage' he needs and initiate an intellectual discussion with Gallus about their differing scholarly opinions.", "medium-term\": \"Continue his scholarly work, potentially using the purchased copy for further research or writing, and engage in ongoing intellectual exchanges with figures like Gallus.", "ultimate\": \"Achieve recognition and respect within Roman intellectual circles for his scholarly contributions, particularly his historical works, and contribute meaningfully to the intellectual discourse of his time."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands awkwardly in Atticus\'s cluttered library, visibly impatient as he waits for the completion of his requested work. His posture is tense, and he fidgets, revealing his scholarly eagerness despite his natural awkwardness. When Gallus enters, Claudius\'s expression shifts to one of cautious engagement, showing his interest in maintaining scholarly discourse while grappling with his own insecurities.',
        ap.emotional_state = 'Surface emotions reveal Claudius\'s anxiety and frustration over Gallus\'s intellectual dominance, showcased through his stammering and hurried speech. Internally, he struggles with feelings of inadequacy and a desire for validation, as he knows that his critique of Gallus\'s essay may invite hostility. The tension between his need for approval and his intellectual integrity fuels his inner conflict.',
        ap.emotional_tags = ["surface emotions reveal claudius's anxiety", "frustration over gallus's intellectual dominance, showcased through his stammering", "hurried speech. internally, he struggles with feelings of inadequacy", "a desire for validation, as he knows that his critique of gallus's essay may invite hostility. the tension between his need for approval", "his intellectual integrity fuels his inner conflict.", "surface emotions reveal claudius's anxiety and frustration over gallus's intellectual dominance", "showcased through his stammering and hurried speech. internally", "he struggles with feelings of inadequacy and a desire for validation", "as he knows that his critique of gallus's essay may invite hostility. the tension between his need for approval and his intellectual integrity fuels his inner conflict."],
        ap.active_plans = ["To secure a copy of the History of Carthage for his studies, demonstrating his commitment to scholarly pursuits.", "To engage in a constructive dialogue with Gallus, despite his disagreements, in hopes of gaining intellectual credibility.", "To navigate the competitive landscape of Roman scholarship without alienating Gallus, maintaining his dignity while standing firm in his opinions."],
        ap.beliefs = ["Valuing scholarly integrity over popularity, believing that honest discourse is essential for intellectual growth.", "Feeling that his stammer and awkwardness do not define his worth as a scholar, despite the perception of his peers.", "Believing that knowledge is power and that engaging with differing viewpoints enriches his understanding of history and politics."],
        ap.goals = ["Short-term: To obtain a copy of the History of Carthage, emphasizing the importance of immediate scholarly needs.", "Medium-term: To assert his intellectual perspective in discussions with Gallus, showcasing his capacity for critical analysis.", "Ultimate: To carve out a respected place in Roman scholarly circles despite his perceived weaknesses, ultimately achieving recognition for his insights."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in Atticus\'s cluttered library, amidst the rustling papyrus and scratching quills of busy scribes. He is positioned near the counter, waiting with barely concealed impatience as Atticus deals with other clients. He initially requests any copy of the \'History of Carthage\', showing his eagerness to acquire the text, even if it includes unwanted illustrations.',
        ap.emotional_state = 'On the surface, Claudius displays impatience and a desire to expedite the transaction with Atticus, evident in his clipped responses and insistence on receiving a copy quickly. Beneath this surface, there\'s a subtle frustration with the mundane practicalities of book acquisition, contrasting with his scholarly inclinations. He may be feeling slightly put out by Atticus\'s focus on commercial details rather than the intellectual value of the work. However, his willingness to engage with Gallus\'s essay later hints at an underlying eagerness for intellectual discourse.',
        ap.emotional_tags = ["on the surface, claudius displays impatience", "a desire to expedite the transaction with atticus, evident in his clipped responses", "insistence on receiving a copy quickly. beneath this surface, there's a subtle frustration with the mundane practicalities of book acquisition, contrasting with his scholarly inclinations. he may be feeling slightly put out by atticus's focus on commercial details rather than the intellectual value of the work. however, his willingness to engage with gallus's essay later hints at an underlying eagerness for intellectual discourse.", "on the surface", "claudius displays impatience and a desire to expedite the transaction with atticus", "evident in his clipped responses and insistence on receiving a copy quickly. beneath this surface", "there's a subtle frustration with the mundane practicalities of book acquisition", "contrasting with his scholarly inclinations. he may be feeling slightly put out by atticus's focus on commercial details rather than the intellectual value of the work. however", "his willingness to engage with gallus's essay later hints at an underlying eagerness for intellectual discourse."],
        ap.active_plans = ["To quickly obtain a copy of his 'History of Carthage' from Atticus, even if it's not the ideal version.", "To exit the library and engage in conversation with Gallus, transitioning from a transactional setting to a potentially intellectual one.", "To articulate his differing viewpoints on Gallus's essay about Pollio and Cicero during their walk to the Senate, demonstrating his intellectual engagement and critical thinking."],
        ap.beliefs = ["Intellectual pursuits and scholarly work are inherently valuable and worthy of his time and effort.", "He possesses informed and valid opinions on scholarly matters, capable of disagreeing with established figures like Gallus.", "Direct engagement and discussion are essential for intellectual growth and the refinement of ideas, even in informal settings like a walk to the Senate."],
        ap.goals = ["Short-term Goal: Acquire a physical copy of his 'History of Carthage' to further his scholarly work or personal reference.", "Medium-term Goal: Participate in an intellectual exchange with Gallus, asserting his scholarly credibility and refining his own arguments through debate.", "Ultimate Goal: Maintain and enhance his reputation as a scholar within the Roman intellectual circles, subtly navigating the complexities of Roman society through intellectual engagement rather than direct political action."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_13_3'})
    ON CREATE SET
        oi.description = 'The scroll represents a coercive tool in Sejanus\'s strategy, intended to falsely implicate Gallus in a conspiracy. Sejanus demands Gallus sign it, asserting its significance as a means to fabricate evidence against him, illustrating the depths of manipulation at play.',
        oi.status_before = 'The scroll exists as a written document of false allegations, created by Sejanus to serve his agenda, waiting for Gallus to either accept its terms or become a victim of its implications.',
        oi.status_after = 'After the confrontation, the scroll remains an ominous presence in the chamber, a symbol of deceit and manipulation, yet its content may soon lead to Gallus\'s downfall if he is coerced into signing.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_13_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in the dimly lit chamber, maintaining an air of scholarly detachment. He shifts slightly, attempting to steer the conversation towards a comparison of Pollio and Cicero, gesturing in a way that suggests he is attempting to trivialize the escalating tension around him, his posture relaxed but tinged with discomfort.',
        ap.emotional_state = 'Outwardly, Claudius appears calm, his tone steady as he discusses oratory skills. However, beneath this facade lies a deep unease; he senses the danger in the room but feels incapable of confronting it head-on. There is a stark conflict between his intellectual instincts and the imminent threat looming over Gallus, which he cannot ignore.',
        ap.emotional_tags = ["outwardly, claudius appears calm, his tone steady as he discusses oratory skills. however, beneath this facade lies a deep unease; he senses the danger in the room but feels incapable of confronting it head-on. there is a stark conflict between his intellectual instincts", "the imminent threat looming over gallus, which he cannot ignore.", "outwardly", "claudius appears calm", "his tone steady as he discusses oratory skills. however", "beneath this facade lies a deep unease; he senses the danger in the room but feels incapable of confronting it head-on. there is a stark conflict between his intellectual instincts and the imminent threat looming over gallus", "which he cannot ignore.", "outwardly, claudius appears calm, his tone steady as he discusses oratory skills. however, beneath this facade lies a deep unease", "he senses the danger in the room but feels incapable of confronting it head-on. there is a stark conflict between his intellectual instincts and the imminent threat looming over gallus, which he cannot ignore.", "outwardly, claudius appears calm, his tone steady as he discusses oratory skills. however, beneath this facade lies a deep unease; he senses the danger in the room", "feels incapable of confronting it head-on. there is a stark conflict between his intellectual instincts and the imminent threat looming over gallus, which he cannot ignore."],
        ap.active_plans = ["To redirect the conversation away from the confrontation at hand, seeking to diffuse the tension.", "To maintain an intellectual demeanor despite the brewing conflict, as a means of self-preservation.", "To gather information on the dynamics between Gallus and Sejanus, attempting to understand the implications for his own safety."],
        ap.beliefs = ["The importance of intellectual discourse as a means to navigate difficult conversations.", "That avoiding direct confrontation might protect him and others in the room.", "The belief that knowledge and scholarship are valuable, even in a treacherous environment."],
        ap.goals = ["Short-term: To survive the immediate tension without taking sides.", "Medium-term: To understand the political landscape and potential threats to himself and his allies.", "Ultimate: To seek a way to restore some semblance of stability within the chaotic court of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus looms menacingly in the dim chamber, exuding cold authority as he confronts Gallus. With a scroll in hand, he steps forward, demanding compliance with a chilling intensity, his posture rigid and commanding as he prepares to enforce his will upon the Senator.',
        ap.emotional_state = 'Sejanus radiates a mixture of confidence and underlying desperation; his eyes glint with ambition as he seeks to crush dissent. Outwardly, he projects calm authority, but internally, there is a simmering rage fueled by the stakes of his ambition. He perceives Gallus as a direct threat, heightening his resolve to eliminate opposition swiftly.',
        ap.emotional_tags = ["sejanus radiates a mixture of confidence", "underlying desperation; his eyes glint with ambition as he seeks to crush dissent. outwardly, he projects calm authority, but internally, there is a simmering rage fueled by the stakes of his ambition. he perceives gallus as a direct threat, heightening his resolve to eliminate opposition swiftly.", "sejanus radiates a mixture of confidence and underlying desperation; his eyes glint with ambition as he seeks to crush dissent. outwardly", "he projects calm authority", "but internally", "there is a simmering rage fueled by the stakes of his ambition. he perceives gallus as a direct threat", "heightening his resolve to eliminate opposition swiftly.", "sejanus radiates a mixture of confidence and underlying desperation", "his eyes glint with ambition as he seeks to crush dissent. outwardly, he projects calm authority, but internally, there is a simmering rage fueled by the stakes of his ambition. he perceives gallus as a direct threat, heightening his resolve to eliminate opposition swiftly.", "sejanus radiates a mixture of confidence and underlying desperation; his eyes glint with ambition as he seeks to crush dissent. outwardly, he projects calm authority,", "internally, there is a simmering rage fueled by the stakes of his ambition. he perceives gallus as a direct threat, heightening his resolve to eliminate opposition swiftly."],
        ap.active_plans = ["To intimidate Gallus into signing a confession, thereby consolidating his power and eliminating a rival.", "To assert his authority over the Senate by showcasing his control through the arrest of Gallus.", "To stifle any further dissent against his rule by setting a precedent of fear."],
        ap.beliefs = ["Power is best maintained through intimidation and control over rivals.", "Loyalty is a weak and fleeting concept; only fear ensures compliance.", "Ambition justifies any means necessary to achieve his goals."],
        ap.goals = ["Short-term: To secure Gallus's confession and eliminate him as a threat.", "Medium-term: To solidify his standing with Tiberius by demonstrating his ability to manage opposition.", "Ultimate: To seize greater power within the Roman Empire, positioning himself above all potential rivals."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Macro strides into the dimly lit chamber, his presence immediately shifting the atmosphere from tense debate to imminent threat. He positions himself directly before Gallus, a physical barrier embodying Sejanus\'s will.  With a swift, decisive movement, he presents the warrant, his posture rigid and unyielding, showcasing his role as the blunt instrument of authority, ready to enforce the Emperor\'s—or rather, Sejanus\'s—decree with brutal efficiency.',
        ap.emotional_state = 'Macro exudes a chillingly cold and pragmatic demeanor. On the surface, he is utterly impassive, his face a mask of professional detachment as he delivers the warrant. Internally, he is driven by a ruthless efficiency and unquestioning loyalty to Sejanus, or perhaps a deeper ambition of his own. There\'s an undercurrent of satisfaction in his precise execution of power, devoid of empathy or moral consideration for Gallus\'s plight.',
        ap.emotional_tags = ["macro exudes a chillingly cold", "pragmatic demeanor. on the surface, he is utterly impassive, his face a mask of professional detachment as he delivers the warrant. internally, he is driven by a ruthless efficiency", "unquestioning loyalty to sejanus, or perhaps a deeper ambition of his own. there's an undercurrent of satisfaction in his precise execution of power, devoid of empathy or moral consideration for gallus's plight.", "macro exudes a chillingly cold and pragmatic demeanor. on the surface", "he is utterly impassive", "his face a mask of professional detachment as he delivers the warrant. internally", "he is driven by a ruthless efficiency and unquestioning loyalty to sejanus", "or perhaps a deeper ambition of his own. there's an undercurrent of satisfaction in his precise execution of power", "devoid of empathy or moral consideration for gallus's plight."],
        ap.active_plans = ["To immediately and efficiently execute the arrest of Gallus as ordered by Sejanus.", "To intimidate Gallus into submission, ensuring no resistance or public outcry.", "To solidify Sejanus's authority by demonstrating swift and decisive action against perceived enemies."],
        ap.beliefs = ["Unquestioning obedience to authority is the cornerstone of order and power.", "Ruthless action is a necessary tool to maintain control and eliminate dissent.", "Sejanus's power is absolute and must be enforced without hesitation or moral qualms."],
        ap.goals = ["Short-term: To successfully apprehend Gallus and deliver him into Sejanus's custody.", "Medium-term: To further establish Sejanus's dominance and crush any opposition to his rule, reinforcing his own position within the Praetorian Guard.", "Ultimate: To rise in power and influence within the Roman hierarchy by consistently demonstrating unwavering loyalty and ruthless effectiveness, potentially surpassing Sejanus himself one day."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus initially observes from the shadows, allowing Macro to initiate the brutal confrontation. He remains slightly behind, a puppeteer watching his instrument at work.  When Gallus challenges the arrest, Sejanus steps forward, scroll in hand, taking center stage. His movements are deliberate and controlled, emphasizing his calculated nature. He directly engages Gallus, presenting the fabricated confession with an air of cold authority, asserting his dominance through both physical presence and psychological manipulation.',
        ap.emotional_state = 'Sejanus projects an aura of icy control and calculated ambition. Outwardly, he is calm and imperious, showing no flicker of doubt or emotion as he orchestrates Gallus\'s downfall. Beneath the surface, a simmering rage at Gallus\'s defiance and intellectual superiority fuels his actions. He is driven by a desperate need to consolidate power, masking his insecurity with a veneer of ruthless confidence. There is a palpable sense of vindictive satisfaction in cornering his critic and forcing submission.',
        ap.emotional_tags = ["sejanus projects an aura of icy control", "calculated ambition. outwardly, he is calm", "imperious, showing no flicker of doubt or emotion as he orchestrates gallus's downfall. beneath the surface, a simmering rage at gallus's defiance", "intellectual superiority fuels his actions. he is driven by a desperate need to consolidate power, masking his insecurity with a veneer of ruthless confidence. there is a palpable sense of vindictive satisfaction in cornering his critic", "forcing submission.", "sejanus projects an aura of icy control and calculated ambition. outwardly", "he is calm and imperious", "showing no flicker of doubt or emotion as he orchestrates gallus's downfall. beneath the surface", "a simmering rage at gallus's defiance and intellectual superiority fuels his actions. he is driven by a desperate need to consolidate power", "masking his insecurity with a veneer of ruthless confidence. there is a palpable sense of vindictive satisfaction in cornering his critic and forcing submission."],
        ap.active_plans = ["To coerce Gallus into signing the false confession, thereby legitimizing his arrest and silencing him permanently.", "To break Gallus's spirit and publically humiliate him, deterring any future dissent or challenges to his authority.", "To eliminate Gallus as a potential threat and to send a clear message to other senators of the consequences of opposing him, consolidating his iron grip on power."],
        ap.beliefs = ["Power is not merely to be wielded, but to be seized and maintained through any means necessary, including fabrication and coercion.", "Dissent and intellectual opposition are dangerous threats that must be crushed to ensure stability and his continued ascent.", "He is entitled to power and dominance, viewing those who oppose him as obstacles to be eliminated without moral compunction."],
        ap.goals = ["Short-term: To secure Gallus's signature on the confession, providing a pretext for his execution and silencing him.", "Medium-term: To eliminate all credible opposition within the Senate and solidify his position as the true power behind the throne, rendering Tiberius increasingly irrelevant.", "Ultimate: To usurp Tiberius's power and become the sole ruler of Rome, establishing a dynasty under his own name and legacy, fueled by his insatiable ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands assertively, his cold demeanor radiating authority. He clutches a scroll tightly, a symbol of his manipulative power, as he confronts Gallus with a predatory focus, stepping forward to emphasize his intimidation.',
        ap.emotional_state = 'Sejanus exhibits a facade of calm control, yet beneath this lies a simmering impatience. His cold ambition drives him to coerce Gallus into submission, revealing a deep-seated insecurity about maintaining power amidst growing opposition.',
        ap.emotional_tags = ["sejanus exhibits a facade of calm control", "yet beneath this lies a simmering impatience. his cold ambition drives him to coerce gallus into submission", "revealing a deep-seated insecurity about maintaining power amidst growing opposition."],
        ap.active_plans = ["To force Gallus into signing a fabricated confession to eliminate him as a threat.", "To assert his dominance and instill fear in any potential dissenters through coercive tactics.", "To manipulate the narrative around Gallus's actions to align it with his own ambitions."],
        ap.beliefs = ["The ends justify the means in the pursuit of power.", "Fear is a more effective tool than loyalty in controlling others.", "Those who oppose him must be crushed to maintain his position."],
        ap.goals = ["Short-term: To secure Gallus's confession and eliminate him as a rival.", "Medium-term: To consolidate power by using Gallus's downfall to deter other senators from opposing him.", "Ultimate: To achieve uncontested control over the Roman political landscape."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Macro stands rigidly, his imposing frame a testament to his role as Sejanus\'s enforcer. He watches Gallus closely, ready to act should the senator resist, exuding an air of ruthless efficiency as he delivers the Emperor\'s warrant.',
        ap.emotional_state = 'Macro\'s emotional state is dominated by a lethal calm, his ruthlessness evident in every movement. He is devoid of empathy, driven solely by duty to execute Sejanus\'s orders, embodying the cold pragmatism of a man who views others as mere tools.',
        ap.emotional_tags = ["macro's emotional state is dominated by a lethal calm", "his ruthlessness evident in every movement. he is devoid of empathy", "driven solely by duty to execute sejanus's orders", "embodying the cold pragmatism of a man who views others as mere tools."],
        ap.active_plans = ["To ensure that Gallus does not escape or resist arrest.", "To support Sejanus\u2019s authority by enforcing his demands without question.", "To maintain the fear and control that his role as enforcer provides."],
        ap.beliefs = ["Loyalty to power is paramount; personal feelings must be set aside.", "Violence and intimidation are necessary tools in maintaining order.", "The strong survive in the brutal world of Roman politics."],
        ap.goals = ["Short-term: To successfully arrest Gallus and bring him to heel.", "Medium-term: To reinforce his position by demonstrating his loyalty to Sejanus.", "Ultimate: To rise through the ranks of power by being indispensable in the execution of Sejanus's will."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'})
    ON CREATE SET
        ap.current_status = 'Claudius remains somewhat in the background, observing the confrontation with a mix of detachment and underlying concern. His body language reflects a scholarly poise, yet his eyes betray a flicker of alarm at the escalation of violence.',
        ap.emotional_state = 'Claudius\'s emotional state is conflicted; he appears calm on the surface but is internally troubled by the unfolding events. His scholarly detachment clashes with a burgeoning awareness of the danger in the political landscape, revealing an instinct for self-preservation.',
        ap.emotional_tags = ["claudius's emotional state is conflicted; he appears calm on the surface but is internally troubled by the unfolding events. his scholarly detachment clashes with a burgeoning awareness of the danger in the political landscape", "revealing an instinct for self-preservation.", "claudius's emotional state is conflicted", "he appears calm on the surface but is internally troubled by the unfolding events. his scholarly detachment clashes with a burgeoning awareness of the danger in the political landscape, revealing an instinct for self-preservation.", "claudius's emotional state is conflicted; he appears calm on the surface", "is internally troubled by the unfolding events. his scholarly detachment clashes with a burgeoning awareness of the danger in the political landscape, revealing an instinct for self-preservation."],
        ap.active_plans = ["To remain an observer, gathering information about the political tensions.", "To protect himself and avoid drawing too much attention to his own position.", "To potentially intervene if the situation escalates beyond a point he deems acceptable."],
        ap.beliefs = ["Knowledge is power, and observing is a strategy for survival.", "The political game is fraught with peril, and caution is essential.", "The consequences of action in this realm can be dire, warranting careful navigation."],
        ap.goals = ["Short-term: To avoid becoming entangled in the conflict between Sejanus and Gallus.", "Medium-term: To leverage any information gained to position himself favorably in future political dynamics.", "Ultimate: To survive the political upheaval while remaining a credible figure within the imperial court."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands imperiously in the dimly lit chamber, scroll clutched in hand, his gaze fixed intensely on Gallus. He paces slightly as he speaks, projecting an aura of controlled menace, his physical presence dominating the confined space as he attempts to exert his will through intimidation and command.',
        ap.emotional_state = 'Sejanus is outwardly cold and imperious, masking a simmering rage beneath the surface. His composed demeanor barely conceals his frustration at Gallus\'s unexpected defiance and scathing words. Internally, he is likely feeling a surge of anger mixed with a need to reassert his authority, perceiving Gallus\'s resistance as a direct challenge to his meticulously constructed power.',
        ap.emotional_tags = ["sejanus is outwardly cold", "imperious, masking a simmering rage beneath the surface. his composed demeanor barely conceals his frustration at gallus's unexpected defiance", "scathing words. internally, he is likely feeling a surge of anger mixed with a need to reassert his authority, perceiving gallus's resistance as a direct challenge to his meticulously constructed power.", "sejanus is outwardly cold and imperious", "masking a simmering rage beneath the surface. his composed demeanor barely conceals his frustration at gallus's unexpected defiance and scathing words. internally", "he is likely feeling a surge of anger mixed with a need to reassert his authority", "perceiving gallus's resistance as a direct challenge to his meticulously constructed power."],
        ap.active_plans = ["Force Gallus to sign the confession scroll to manufacture evidence of treason.", "Intimidate and break Gallus's spirit to demonstrate his absolute power and discourage further dissent.", "Use Gallus's confession as a pretext to further consolidate his control and eliminate perceived threats, including any lingering supporters of Drusus."],
        ap.beliefs = ["Fear and intimidation are the most effective tools for maintaining power.", "Anyone who opposes him is an enemy to be crushed without mercy.", "Fabricated evidence is justifiable if it serves to strengthen his position and eliminate opposition."],
        ap.goals = ["Short-term: Obtain Gallus's signature on the confession at any cost.", "Medium-term: Eliminate all potential opposition and solidify his grip on power within Rome.", "Ultimate: Usurp Tiberius and become the undisputed ruler of Rome, establishing a dynasty built on fear and absolute control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Macro stands rigidly beside Sejanus, a hulking figure of silent menace. He is positioned as Sejanus\'s enforcer, his posture radiating readiness to act on command. He delivers the arrest warrant with cold, clipped precision, his movements economical and devoid of any personal inflection, embodying ruthless efficiency.',
        ap.emotional_state = 'Macro is emotionally detached and utterly pragmatic, displaying no visible emotion beyond professional efficiency. Internally, he is likely focused solely on carrying out Sejanus\'s orders with absolute obedience. He views Gallus as an obstacle to be removed, a target designated by his superior, and approaches the situation with cold, calculated resolve.',
        ap.emotional_tags = ["macro is emotionally detached", "utterly pragmatic, displaying no visible emotion beyond professional efficiency. internally, he is likely focused solely on carrying out sejanus's orders with absolute obedience. he views gallus as an obstacle to be removed, a target designated by his superior,", "approaches the situation with cold, calculated resolve.", "macro is emotionally detached and utterly pragmatic", "displaying no visible emotion beyond professional efficiency. internally", "he is likely focused solely on carrying out sejanus's orders with absolute obedience. he views gallus as an obstacle to be removed", "a target designated by his superior", "and approaches the situation with cold", "calculated resolve."],
        ap.active_plans = ["Execute Sejanus's orders without question or hesitation, arresting Gallus and ensuring his compliance.", "Intimidate Gallus through physical presence and the threat of force to expedite the confession.", "Maintain unwavering loyalty to Sejanus and demonstrate his value as a ruthless and effective enforcer."],
        ap.beliefs = ["Unquestioning obedience to authority is the cornerstone of his duty and career.", "Physical force and intimidation are legitimate and necessary tools for maintaining order and control.", "Personal morality is subservient to the demands of power and the orders of his superiors."],
        ap.goals = ["Short-term: Arrest Gallus and deliver him into Sejanus's custody swiftly and efficiently.", "Medium-term: Solidify his position as Sejanus's trusted and indispensable enforcer within the Praetorian Guard.", "Ultimate: Achieve advancement and security within the Roman power structure through unwavering loyalty and ruthless execution of commands, regardless of moral implications."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    ON CREATE SET
        ap.current_status = 'Claudius is present in the chamber, initially engaging in a seemingly detached literary discussion with Gallus, attempting to maintain a semblance of scholarly normalcy amidst the escalating tension. He observes the confrontation unfolding, his physical stance suggesting a desire to remain on the periphery, a witness rather than a participant in the brutal power play.',
        ap.emotional_state = 'Claudius initially displays a veneer of scholarly detachment and mild intellectual amusement, engaging in a debate about oratory to deflect from the immediate danger. However, beneath this façade, he is acutely aware of the menacing atmosphere and the injustice unfolding. Internally, he is likely experiencing a mix of fear and discomfort, witnessing the blatant abuse of power, yet feeling powerless and unwilling to directly intervene, prioritizing self-preservation.',
        ap.emotional_tags = ["claudius initially displays a veneer of scholarly detachment", "mild intellectual amusement, engaging in a debate about oratory to deflect from the immediate danger. however, beneath this fa\u00e7ade, he is acutely aware of the menacing atmosphere", "the injustice unfolding. internally, he is likely experiencing a mix of fear", "discomfort, witnessing the blatant abuse of power, yet feeling powerless", "unwilling to directly intervene, prioritizing self-preservation.", "claudius initially displays a veneer of scholarly detachment and mild intellectual amusement", "engaging in a debate about oratory to deflect from the immediate danger. however", "beneath this fa\u00e7ade", "he is acutely aware of the menacing atmosphere and the injustice unfolding. internally", "he is likely experiencing a mix of fear and discomfort", "witnessing the blatant abuse of power", "yet feeling powerless and unwilling to directly intervene", "prioritizing self-preservation."],
        ap.active_plans = ["Observe the situation and gather information about Sejanus's tactics and the extent of his ruthlessness.", "Maintain a neutral stance and avoid becoming a target of Sejanus's aggression by appearing uninvolved.", "Potentially use his scholarly persona to mask his observations and true understanding of the political machinations at play."],
        ap.beliefs = ["Direct confrontation with powerful figures like Sejanus is inherently dangerous and to be avoided.", "Knowledge and observation are valuable tools for survival in a treacherous political environment.", "Maintaining a low profile and appearing harmless offers a degree of protection in a world of ruthless ambition."],
        ap.goals = ["Short-term: Survive the immediate encounter without drawing Sejanus's ire or becoming implicated in the conflict.", "Medium-term: Continue to navigate the treacherous Roman court by remaining observant and adaptable, avoiding direct involvement in power struggles.", "Ultimate: Secure long-term survival and potentially find a way to use his unique position as an overlooked scholar to influence events from the shadows, while preserving his own life and integrity as much as possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_5'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands coldly before Gallus, holding a scroll that represents his authoritarian power while watching Macro enforce his will. His posture is commanding, exuding an air of control as he issues orders without hesitation.',
        ap.emotional_state = 'Sejanus exudes a chilling calmness, masking his underlying rage and paranoia. Outwardly composed, he feels the pressure of being challenged, his ambition driving him to escalate his methods against dissenters like Gallus.',
        ap.emotional_tags = ["sejanus exudes a chilling calmness, masking his underlying rage", "paranoia. outwardly composed, he feels the pressure of being challenged, his ambition driving him to escalate his methods against dissenters like gallus.", "sejanus exudes a chilling calmness", "masking his underlying rage and paranoia. outwardly composed", "he feels the pressure of being challenged", "his ambition driving him to escalate his methods against dissenters like gallus."],
        ap.active_plans = ["Coerce Gallus into signing a false confession to solidify his power.", "Use intimidation tactics to eliminate opposition and strengthen his position with Tiberius.", "Demonstrate ruthlessness to instill fear among potential dissenters within the Senate."],
        ap.beliefs = ["Power must be maintained through fear and control.", "Dissent is a direct threat to his ambitions and must be quashed.", "The ends justify the means, no matter the moral implications."],
        ap.goals = ["Short-term: Extract a confession from Gallus to discredit him.", "Medium-term: Solidify his position as the unquestionable authority in the emperor's regime.", "Ultimate: Overthrow Tiberius and assume full control of the empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_5'})
    ON CREATE SET
        ap.current_status = 'Macro looms over Gallus with an intimidating presence, prepared to physically enforce Sejanus\'s orders. His body language is aggressive, displaying a readiness to act on Sejanus\'s command.',
        ap.emotional_state = 'Macro displays a cold detachment, driven by his loyalty to Sejanus. While he remains focused on the task at hand, there is an underlying thrill in exerting his power over a defiant senator.',
        ap.emotional_tags = ["macro displays a cold detachment", "driven by his loyalty to sejanus. while he remains focused on the task at hand", "there is an underlying thrill in exerting his power over a defiant senator."],
        ap.active_plans = ["Ensure Gallus is subdued and compliant to Sejanus's demands.", "Intimidate other potential dissenters by showcasing his ruthless efficiency.", "Carry out orders swiftly to demonstrate loyalty and effectiveness in maintaining Sejanus's regime."],
        ap.beliefs = ["Strength and intimidation are vital tools in maintaining authority.", "Loyalty to Sejanus outweighs any moral qualms about his actions.", "The fulfillment of orders is paramount, regardless of the consequences."],
        ap.goals = ["Short-term: Bring Gallus to submission during the interrogation.", "Medium-term: Establish himself as a key enforcer within Sejanus's inner circle.", "Ultimate: Eliminate any threats to his own power and position as a formidable figure in the Praetorian guard."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_letters_livillas_writing_event_14_2'})
    ON CREATE SET
        oi.description = 'The letters, drafted by Livilla, serve as the catalyst for the shocking revelations shared between Antonia and Claudius. They expose the depth of Livilla’s treachery, detailing her plot to poison Castor and her ambitions to assassinate Tiberius. Antonia\'s discovery of these letters ignites a fierce urgency to act against her daughter\'s conspiracies.',
        oi.status_before = 'The letters were hidden in Livilla\'s room, considered worthless by others, destined for destruction as they were being cleared out by a slave.',
        oi.status_after = 'After Antonia\'s revelation, the letters become crucial evidence in their plot against Tiberius, transformed from discarded notes to instruments of impending action.'
    WITH oi
    MATCH (o:Object {uuid: 'object_letters_livillas_writing'})
    MATCH (e:Event {uuid: 'event_14_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_for_letters_event_14_3'})
    ON CREATE SET
        oi.description = 'The \'scroll for letters\' is conceptualized and designated as the vessel for delivering Livilla\'s incriminating letters and Antonia\'s crucial message to Tiberius. Antonia instructs Claudius to paste the pieces of paper, containing Livilla\'s drafts and her own explanatory letter, onto this scroll. Its primary function is to secretly transport this dangerous information, concealed within the \'History of Carthage\', bypassing Sejanus\'s surveillance. It represents a vital tool for clandestine communication, designed to breach the walls of imperial isolation and expose the deadly conspiracy.',
        oi.status_before = 'The scroll does not physically exist yet. It is an idea, a planned component in Antonia\'s strategy to communicate secretly with Tiberius.',
        oi.status_after = 'The scroll is prepared and exists as a tangible object, now containing Livilla\'s incriminating letter fragments and Antonia\'s explanatory note, ready to be concealed within the \'History of Carthage\' for its clandestine journey to Tiberius.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll_for_letters'})
    MATCH (e:Event {uuid: 'event_14_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_history_of_carthage_event_14_3'})
    ON CREATE SET
        oi.description = 'Claudius\'s \'History of Carthage\' is strategically repurposed as a deceptive cover for smuggling the scroll of incriminating letters to Tiberius. Antonia instructs Claudius to use a copy of his book, specifically the one with elephant drawings, to request an audience with Sejanus under the pretense of seeking Tiberius\'s blessing for its dedication. The book\'s scholarly and seemingly innocuous nature serves to deflect suspicion from its true, hidden contents. Antonia dismisses the book\'s actual value, emphasizing its role as a mere tool in her plan, highlighting the ruthless pragmatism of her strategy.',
        oi.status_before = 'The \'History of Carthage\' exists as a finished scholarly work, with copies available, including one at Claudius\'s home adorned with elephant drawings. It is valued by Claudius as a representation of his intellectual pursuits.',
        oi.status_after = 'The \'History of Carthage\', specifically the decorated copy, is now designated as the hiding place for the scroll of incriminating letters. Its status is transformed from a scholarly manuscript to a vehicle for dangerous political intrigue, its value now intertwined with the perilous mission to expose Livilla and Sejanus.'
    WITH oi
    MATCH (o:Object {uuid: 'object_history_of_carthage'})
    MATCH (e:Event {uuid: 'event_14_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Claudius enters Antonia\'s chambers in a state of visible distress, his physical agitation mirroring the turbulent news he bears of Gallus\'s arrest. He stands before Antonia, his posture conveying a mix of anxiety and confusion as he struggles to articulate the unsettling events unfolding in the Senate. He is immediately directed by Antonia to read the letters she presents.',
        ap.emotional_state = 'On the surface, Claudius displays confusion and worry, questioning Antonia with \'Why? Why? What is it?\'. Beneath this outward bewilderment, he grapples with a deeper unease, struggling to comprehend the political machinations that constantly disrupt his preferred scholarly detachment. His internal state is marked by a sense of being overwhelmed, as he is drawn into a familial drama far exceeding his comfort zone, contrasting sharply with his desire for a quiet, studious life.',
        ap.emotional_tags = ["on the surface, claudius displays confusion", "worry, questioning antonia with 'why? why? what is it?'. beneath this outward bewilderment, he grapples with a deeper unease, struggling to comprehend the political machinations that constantly disrupt his preferred scholarly detachment. his internal state is marked by a sense of being overwhelmed, as he is drawn into a familial drama far exceeding his comfort zone, contrasting sharply with his desire for a quiet, studious life.", "on the surface", "claudius displays confusion and worry", "questioning antonia with 'why? why? what is it?'. beneath this outward bewilderment", "he grapples with a deeper unease", "struggling to comprehend the political machinations that constantly disrupt his preferred scholarly detachment. his internal state is marked by a sense of being overwhelmed", "as he is drawn into a familial drama far exceeding his comfort zone", "contrasting sharply with his desire for a quiet", "studious life."],
        ap.active_plans = ["Deliver the news of Asinius Gallus's arrest to Antonia.", "Understand the reason for Antonia's urgent and commanding demeanor.", "Process the information contained within Livilla's letters as directed by Antonia."],
        ap.beliefs = ["Political events are chaotic and often incomprehensible.", "He is ill-equipped to navigate the complexities of Roman political intrigue.", "His scholarly pursuits offer a refuge from the dangerous world of power and betrayal."],
        ap.goals = ["Short-term: To understand the immediate cause of Antonia's distress and the significance of the letters.", "Medium-term: To avoid becoming entangled in the dangerous political schemes hinted at by Antonia.", "Ultimate: To return to his peaceful scholarly life, detached from the turmoil of the Imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'})
    ON CREATE SET
        ap.current_status = 'Antonia paces restlessly within her chambers, her regal bearing sharpened by anxiety and resolve. Upon Claudius\'s arrival, she is immediately assertive, thrusting letters into his hands and demanding he read them without delay. Her movements are brisk and purposeful, reflecting an urgency born from the damning revelations she now holds, her focus unwavering on the task of exposing Livilla\'s treachery.',
        ap.emotional_state = 'Antonia outwardly projects a commanding urgency and barely contained fury, her sharp tone and directive actions masking a deeper turmoil. Internally, she is battling a tempest of emotions – horror and disgust at Livilla\'s monstrous acts, profound grief for the betrayal by her own daughter, and a burning maternal rage. Beneath the surface of her immediate anger lies a steely resolve to ensure justice, driven by a fierce protectiveness for her family\'s honor and the stability of Rome, even if it means sacrificing her own child.',
        ap.emotional_tags = ["antonia outwardly projects a commanding urgency", "barely contained fury, her sharp tone", "directive actions masking a deeper turmoil. internally, she is battling a tempest of emotions \u2013 horror", "disgust at livilla's monstrous acts, profound grief for the betrayal by her own daughter,", "a burning maternal rage. beneath the surface of her immediate anger lies a steely resolve to ensure justice, driven by a fierce protectiveness for her family's honor", "the stability of rome, even if it means sacrificing her own child.", "antonia outwardly projects a commanding urgency and barely contained fury", "her sharp tone and directive actions masking a deeper turmoil. internally", "she is battling a tempest of emotions \u2013 horror and disgust at livilla's monstrous acts", "profound grief for the betrayal by her own daughter", "and a burning maternal rage. beneath the surface of her immediate anger lies a steely resolve to ensure justice", "driven by a fierce protectiveness for her family's honor and the stability of rome", "even if it means sacrificing her own child."],
        ap.active_plans = ["Ensure Claudius fully understands the gravity of Livilla's betrayal by forcing him to read the incriminating letters.", "Formulate a plan to deliver these letters to Tiberius, bypassing Sejanus's control.", "Utilize Claudius's scholarly pursuits as a plausible cover for his visit to Tiberius at Capri."],
        ap.beliefs = ["Livilla's actions are an unforgivable betrayal to family and Rome.", "Justice must be served, regardless of familial bonds.", "Sejanus is a wicked influence, and Livilla is even more monstrous.", "Claudius, despite his perceived weaknesses, can be instrumental in her plan."],
        ap.goals = ["Short-term: To convey the urgency and danger of the situation to Claudius and secure his cooperation.", "Medium-term: To expose Livilla and Sejanus's conspiracy to Emperor Tiberius and ensure their downfall.", "Ultimate: To restore order and justice within her family and the Roman state, even if it requires immense personal sacrifice and pain."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in Antonia\'s chambers, visibly distressed as he reads the letters. His posture is tense; he shifts from foot to foot, reflecting his mounting anxiety over the revelations contained within the missives.',
        ap.emotional_state = 'Claudius outwardly displays confusion and dread, his brow furrowed and his voice quavering. Internally, he grapples with horror and disbelief, feeling a deep moral outrage at the treachery woven into his family\'s legacy. The clash between his scholarly detachment and the emotional weight of the situation creates an inner turmoil.',
        ap.emotional_tags = ["claudius outwardly displays confusion", "dread, his brow furrowed", "his voice quavering. internally, he grapples with horror", "disbelief, feeling a deep moral outrage at the treachery woven into his family's legacy. the clash between his scholarly detachment", "the emotional weight of the situation creates an inner turmoil.", "claudius outwardly displays confusion and dread", "his brow furrowed and his voice quavering. internally", "he grapples with horror and disbelief", "feeling a deep moral outrage at the treachery woven into his family's legacy. the clash between his scholarly detachment and the emotional weight of the situation creates an inner turmoil."],
        ap.active_plans = ["To comprehend the full extent of the conspiracy against Tiberius.", "To protect his family from the repercussions of Livilla's actions.", "To find a way to communicate the urgent situation to Tiberius."],
        ap.beliefs = ["Family loyalty should prevail, even amidst betrayal.", "Knowledge is power, yet the horrific truth of this knowledge burdens him.", "Intervention is necessary to prevent further bloodshed in the palace."],
        ap.goals = ["Short-term: Understand the implications of Livilla's letters.", "Medium-term: Ensure Tiberius is informed about the conspiracy.", "Ultimate: Preserve the integrity of his family and prevent further tragedy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_2'})
    ON CREATE SET
        ap.current_status = 'Antonia paces anxiously, her movements sharp and purposeful. She exudes an intensity that reflects her growing fury and determination as she confronts the betrayal of her daughter.',
        ap.emotional_state = 'Antonia\'s surface emotions are marked by rage and indignation, her voice firm and commanding. Internally, she experiences a tumult of anguish as she reconciles her maternal love for Livilla with the monstrous betrayal she has uncovered. The realization that her daughter has become a threat unsettles her deeply.',
        ap.emotional_tags = ["antonia's surface emotions are marked by rage", "indignation, her voice firm", "commanding. internally, she experiences a tumult of anguish as she reconciles her maternal love for livilla with the monstrous betrayal she has uncovered. the realization that her daughter has become a threat unsettles her deeply.", "antonia's surface emotions are marked by rage and indignation", "her voice firm and commanding. internally", "she experiences a tumult of anguish as she reconciles her maternal love for livilla with the monstrous betrayal she has uncovered. the realization that her daughter has become a threat unsettles her deeply."],
        ap.active_plans = ["To reveal the conspiracy to Tiberius and gain his support.", "To assemble the evidence of Livilla's treachery to present it as undeniable truth.", "To protect her granddaughter Helen from the consequences of Livilla's actions."],
        ap.beliefs = ["A mother must protect her children, regardless of their actions.", "Betrayal within the family is the gravest sin.", "Quick and decisive action is necessary to avert disaster."],
        ap.goals = ["Short-term: Gather evidence of Livilla's wrongdoing.", "Medium-term: Convince Tiberius of the need for immediate action.", "Ultimate: Ensure the safety of her family and restore honor to her lineage."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Claudius enters Antonia\'s chambers in a state of distress, having just witnessed Gallus\'s arrest. He is initially overwhelmed and confused by Antonia\'s forceful demands to read Livilla\'s letters, stammering and questioning the purpose of these documents. He physically holds the letters, his hands trembling slightly as he grapples with the shocking content revealed to him.',
        ap.emotional_state = 'Claudius is visibly anxious and bewildered, his surface emotions reflecting confusion and fear. Internally, he is grappling with the horror of Livilla\'s treachery and the dangerous implications of Antonia\'s plan. He feels a deep-seated reluctance to become involved in political schemes, yet is also moved by his mother\'s distress and the gravity of the situation, creating an internal conflict between his desire for safety and his familial duty.',
        ap.emotional_tags = ["claudius is visibly anxious", "bewildered, his surface emotions reflecting confusion", "fear. internally, he is grappling with the horror of livilla's treachery", "the dangerous implications of antonia's plan. he feels a deep-seated reluctance to become involved in political schemes, yet is also moved by his mother's distress", "the gravity of the situation, creating an internal conflict between his desire for safety", "his familial duty.", "claudius is visibly anxious and bewildered", "his surface emotions reflecting confusion and fear. internally", "he is grappling with the horror of livilla's treachery and the dangerous implications of antonia's plan. he feels a deep-seated reluctance to become involved in political schemes", "yet is also moved by his mother's distress and the gravity of the situation", "creating an internal conflict between his desire for safety and his familial duty."],
        ap.active_plans = ["Understand the urgency and nature of Antonia's request to read Livilla's letters.", "Agree to Antonia's plan to seek permission from Sejanus to visit Tiberius at Capri.", "Offer his 'History of Carthage' as a plausible reason for the visit, though with some personal reluctance due to his attachment to the decorated copy."],
        ap.beliefs = ["He is perceived as harmless and insignificant by figures like Sejanus, which can be strategically advantageous.", "Direct confrontation with powerful figures like Sejanus and Tiberius is inherently dangerous and should be avoided.", "His scholarly pursuits are of little value or interest to the power players in Rome, making them a useful disguise for more serious intentions."],
        ap.goals = ["Short-term: To appease Antonia and follow her instructions to read and understand the letters.", "Medium-term: To secure permission from Sejanus to travel to Capri without arousing suspicion, using the book dedication as a pretext.", "Ultimate: To indirectly aid Antonia in exposing Livilla and Sejanus's plot while minimizing his own personal risk and maintaining his detached scholarly life as much as possible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Antonia paces restlessly in her chambers, radiating an intense energy of fury and determination. She thrusts Livilla\'s letters at Claudius, commanding him to read them with sharp, impatient directives. Her movements are brisk and purposeful, reflecting her urgent need to act decisively and quickly to expose her daughter\'s treachery and Sejanus\'s plot.',
        ap.emotional_state = 'Antonia\'s surface emotions are a volatile mix of anger and resolve, evident in her sharp tone and commanding demeanor. Beneath this outward rage, she is deeply wounded and betrayed by Livilla\'s actions, experiencing a profound grief intertwined with fury. There\'s a palpable tension between her love for her daughter and her fierce moral outrage at Livilla\'s monstrous betrayal, fueling her relentless pursuit of justice, even if it means condemning her own child.',
        ap.emotional_tags = ["antonia's surface emotions are a volatile mix of anger", "resolve, evident in her sharp tone", "commanding demeanor. beneath this outward rage, she is deeply wounded", "betrayed by livilla's actions, experiencing a profound grief intertwined with fury. there's a palpable tension between her love for her daughter", "her fierce moral outrage at livilla's monstrous betrayal, fueling her relentless pursuit of justice, even if it means condemning her own child.", "antonia's surface emotions are a volatile mix of anger and resolve", "evident in her sharp tone and commanding demeanor. beneath this outward rage", "she is deeply wounded and betrayed by livilla's actions", "experiencing a profound grief intertwined with fury. there's a palpable tension between her love for her daughter and her fierce moral outrage at livilla's monstrous betrayal", "fueling her relentless pursuit of justice", "even if it means condemning her own child."],
        ap.active_plans = ["Formulate a plan to deliver the incriminating letters to Tiberius secretly, bypassing Sejanus's control.", "Utilize Claudius, leveraging his perceived harmlessness and scholarly persona as a disguise.", "Prepare a cover letter to accompany Livilla's letters, ensuring Tiberius understands the gravity and authenticity of the evidence."],
        ap.beliefs = ["Livilla's treachery is monstrous and unforgivable, demanding immediate and decisive action.", "Sejanus is wicked, but Livilla's betrayal is a deeper, more personal wound.", "Claudius, despite his perceived foolishness, can be manipulated and directed to serve a crucial purpose in her plan."],
        ap.goals = ["Short-term: To ensure Claudius understands and agrees to execute her plan to visit Tiberius.", "Medium-term: To expose Livilla and Sejanus's conspiracy to Tiberius, hoping for imperial intervention and justice.", "Ultimate: To purge the corruption from her family and the Roman state, restoring some semblance of order and justice, even at the devastating personal cost of condemning her own daughter."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_14_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus is not physically present in Antonia\'s chambers, but his shadow looms large over the scene. He is the unseen antagonist, the gatekeeper to Tiberius and the intended target of Antonia\'s desperate plan. His power and control are implicitly acknowledged by Antonia and Claudius, as they must devise a strategy to circumvent his pervasive influence and surveillance.',
        ap.emotional_state = 'Though not explicitly depicted in the scene, Sejanus is operating under a facade of confidence and control. He likely feels secure in his position as Praetorian Prefect and in his manipulation of Tiberius, exhibiting arrogance and a sense of invulnerability. Internally, he is driven by relentless ambition and paranoia, constantly seeking to consolidate his power and eliminate any perceived threats, while perhaps underestimating the resolve of Antonia and the supposed insignificance of Claudius.',
        ap.emotional_tags = ["though not explicitly depicted in the scene, sejanus is operating under a facade of confidence", "control. he likely feels secure in his position as praetorian prefect", "in his manipulation of tiberius, exhibiting arrogance", "a sense of invulnerability. internally, he is driven by relentless ambition", "paranoia, constantly seeking to consolidate his power", "eliminate any perceived threats, while perhaps underestimating the resolve of antonia", "the supposed insignificance of claudius.", "though not explicitly depicted in the scene", "sejanus is operating under a facade of confidence and control. he likely feels secure in his position as praetorian prefect and in his manipulation of tiberius", "exhibiting arrogance and a sense of invulnerability. internally", "he is driven by relentless ambition and paranoia", "constantly seeking to consolidate his power and eliminate any perceived threats", "while perhaps underestimating the resolve of antonia and the supposed insignificance of claudius.", "though not explicitly depicted in the scene, sejanus is operating under a facade of confidence and control. he likely feels secure in his position as praetorian prefect and in his manipulation of tiberius, exhibiting arrogance and a sense of invulnerability. internally, he is driven by relentless ambition and paranoia, constantly seeking to consolidate his power and eliminate any perceived threats,", "perhaps underestimating the resolve of antonia and the supposed insignificance of claudius."],
        ap.active_plans = ["Maintain strict control over all access to Emperor Tiberius, filtering information and visitors.", "Continue to manipulate and exploit Livilla in their joint pursuit of power, aiming to assassinate Tiberius and seize control.", "Underestimate and dismiss Claudius as a harmless scholar, posing no threat to his ambitions, thus making Claudius's request to visit Tiberius seem innocuous."],
        ap.beliefs = ["His control over the Praetorian Guard and access to Tiberius makes him virtually untouchable.", "Claudius is a foolish and negligible figure, easily manipulated or ignored.", "Livilla is a valuable and indispensable ally in his ascent to power, despite her volatile nature and ambition."],
        ap.goals = ["Short-term: To maintain his grip on power and prevent any unwanted information from reaching Tiberius.", "Medium-term: To further his conspiracy with Livilla to eliminate Tiberius and consolidate his own authority.", "Ultimate: To become the dominant power in Rome, potentially even Emperor, through ruthless ambition and manipulation, eliminating all opposition and securing absolute control."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is not physically present in this chaotic scene; instead, his voice is heard in the background, muffled yet authoritative, attempting to calm the rising tide of fear among the citizens. His absence from the fray suggests a strategic positioning, possibly observing the chaos unfold from a distance, weighing his options carefully.',
        ap.emotional_state = 'There is a palpable tension in Claudius\'s voice as he attempts to impose order amid the chaos. On the surface, he projects calmness, but internally, he grapples with the weight of moral outrage at the violence that has erupted within the Senate. His usual scholarly detachment is pierced by a deep concern for the implications of this turmoil on the state and his role within it, revealing a conflicted emotional landscape.',
        ap.emotional_tags = ["there is a palpable tension in claudius's voice as he attempts to impose order amid the chaos. on the surface, he projects calmness, but internally, he grapples with the weight of moral outrage at the violence that has erupted within the senate. his usual scholarly detachment is pierced by a deep concern for the implications of this turmoil on the state", "his role within it, revealing a conflicted emotional landscape.", "there is a palpable tension in claudius's voice as he attempts to impose order amid the chaos. on the surface", "he projects calmness", "but internally", "he grapples with the weight of moral outrage at the violence that has erupted within the senate. his usual scholarly detachment is pierced by a deep concern for the implications of this turmoil on the state and his role within it", "revealing a conflicted emotional landscape.", "there is a palpable tension in claudius's voice as he attempts to impose order amid the chaos. on the surface, he projects calmness,", "internally, he grapples with the weight of moral outrage at the violence that has erupted within the senate. his usual scholarly detachment is pierced by a deep concern for the implications of this turmoil on the state and his role within it, revealing a conflicted emotional landscape."],
        ap.active_plans = ["To regain control and restore order in the chaos that has erupted on the Senate steps.", "To assess the loyalty and effectiveness of the Emperor's Guard in quelling the unrest.", "To navigate the political fallout from the violence, ensuring his own position remains secure amid the upheaval."],
        ap.beliefs = ["The stability of Rome is paramount, and he must act decisively to uphold it.", "Authority must be demonstrated through both discipline and compassion in the face of fear.", "Survival in the treacherous political landscape requires a balance of visibility and strategic detachment."],
        ap.goals = ["Short-term: To calm the immediate chaos and prevent further bloodshed during the unrest.", "Medium-term: To evaluate the loyalty of the Emperor's Guard and use their efficiency to his advantage.", "Ultimate: To establish himself as a stabilizing force in the empire, both respected and feared, while navigating the political dangers surrounding him."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_scroll_event_16_1'})
    ON CREATE SET
        oi.description = 'The scroll serves as the central catalyst for the entire event. It contains the damning evidence, presented by Claudius, that reveals Livilla and Sejanus\'s conspiracy to poison Castor and plot against Tiberius. Tiberius holds it as he confronts Caligula, reading from it to express his fury and reveal the treachery. Its content is the direct cause of Tiberius\'s rage and his subsequent plans to arrest Sejanus and purge Rome.  It is physically thrown by Tiberius in a gesture of anger and rejection towards Caligula and the very information it contains.',
        oi.status_before = 'The scroll is in Claudius\'s possession, containing critical and incriminating information regarding Livilla and Sejanus\'s plot. It is intended to be delivered to Tiberius as proof of the conspiracy, acting as a weaponized document designed to ignite the Emperor\'s fury and prompt action.',
        oi.status_after = 'The scroll is thrown to the floor by Tiberius in a fit of rage, its contents now fully revealed to both Tiberius and Caligula. It has served its purpose of delivering the incriminating evidence and triggering Tiberius\'s furious reaction and plans for retaliation. It becomes a symbol of the betrayal and the catalyst for the impending violence and political upheaval.'
    WITH oi
    MATCH (o:Object {uuid: 'object_scroll'})
    MATCH (e:Event {uuid: 'event_16_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Tiberius is standing in his villa, gripping a scroll, his body rigid with fury. He barks orders at Caligula to leave, then throws the scroll at Caligula\'s feet in a fit of rage. He paces slightly as he reveals the devastating news of his son\'s poisoning and the plot against him, his movements sharp and agitated, reflecting his inner turmoil and sense of betrayal.',
        ap.emotional_state = 'Tiberius is consumed by a volcanic rage, his fury palpable as he learns of the treachery against his son and himself. Beneath this surface anger, there\'s a deep-seated paranoia and a profound sense of betrayal by those he should trust. He feels cornered and vulnerable despite his imperial power, his words laced with bitterness and a hint of desperation as he seeks a solution to his precarious situation, revealing a mind teetering on the edge of madness.',
        ap.emotional_tags = ["tiberius is consumed by a volcanic rage, his fury palpable as he learns of the treachery against his son", "himself. beneath this surface anger, there's a deep-seated paranoia", "a profound sense of betrayal by those he should trust. he feels cornered", "vulnerable despite his imperial power, his words laced with bitterness", "a hint of desperation as he seeks a solution to his precarious situation, revealing a mind teetering on the edge of madness.", "tiberius is consumed by a volcanic rage", "his fury palpable as he learns of the treachery against his son and himself. beneath this surface anger", "there's a deep-seated paranoia and a profound sense of betrayal by those he should trust. he feels cornered and vulnerable despite his imperial power", "his words laced with bitterness and a hint of desperation as he seeks a solution to his precarious situation", "revealing a mind teetering on the edge of madness."],
        ap.active_plans = ["To assert his authority and dominance over Caligula by ordering him out and displaying his anger.", "To understand the full extent of the threat posed by Sejanus and Livilla.", "To find a solution to arrest Sejanus despite Sejanus's control over the Praetorian Guard.", "To identify and recruit someone ambitious enough to betray Sejanus from within his own ranks.", "To deceive Sejanus into a vulnerable position by pretending to travel to Rome."],
        ap.beliefs = ["Family members are inherently treacherous and cannot be fully trusted, as evidenced by Livilla's betrayal.", "Power is constantly under threat and must be defended ruthlessly.", "Loyalty is a rare and unreliable commodity, especially in the cutthroat world of Roman politics."],
        ap.goals = ["goals\": [\n          \"Short-term: Arrest Sejanus and Livilla to eliminate the immediate threat to his life and power.", "Medium-term: Purge Rome of Sejanus's supporters and consolidate his own authority.", "Ultimate: Secure his legacy and ensure the continuation of his rule through a chosen successor, albeit with deep mistrust."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_1'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nervously beside Tiberius and Caligula, unshaven and looking visibly uncomfortable. He remains mostly silent, observing the volatile interaction between Tiberius and Caligula. He stammers hesitantly when offering a suggestion, his posture suggesting a desire to remain unnoticed and avoid becoming the target of Tiberius\'s fury, yet also feeling a responsibility to offer some form of solution given the gravity of the situation he instigated by bringing the scroll.',
        ap.emotional_state = 'Claudius is deeply anxious and uncomfortable, caught in the crossfire of Tiberius\'s rage and Caligula\'s cynical observations. He feels the weight of the information he has delivered, understanding the devastating consequences it will unleash. Beneath his nervousness, there is a flicker of moral concern, a genuine desire to see justice done, even as he fears the brutal methods Tiberius is likely to employ. He is torn between his inherent caution and a sense of duty to address the revealed treachery.',
        ap.emotional_tags = ["claudius is deeply anxious", "uncomfortable, caught in the crossfire of tiberius's rage", "caligula's cynical observations. he feels the weight of the information he has delivered, understanding the devastating consequences it will unleash. beneath his nervousness, there is a flicker of moral concern, a genuine desire to see justice done, even as he fears the brutal methods tiberius is likely to employ. he is torn between his inherent caution", "a sense of duty to address the revealed treachery.", "claudius is deeply anxious and uncomfortable", "caught in the crossfire of tiberius's rage and caligula's cynical observations. he feels the weight of the information he has delivered", "understanding the devastating consequences it will unleash. beneath his nervousness", "there is a flicker of moral concern", "a genuine desire to see justice done", "even as he fears the brutal methods tiberius is likely to employ. he is torn between his inherent caution and a sense of duty to address the revealed treachery."],
        ap.active_plans = ["To remain as inconspicuous as possible, avoiding direct confrontation with Tiberius's volatile anger.", "To observe and understand the unfolding situation and the reactions of Tiberius and Caligula.", "To cautiously offer a suggestion that might lead to a less violent or more just resolution, appealing to integrity.", "To assess the personal risk he now faces, having delivered such explosive information to a paranoid Emperor.", "To potentially disengage from the immediate conflict once he has fulfilled his duty of delivering the evidence."],
        ap.beliefs = ["Integrity, while rare, is still a desirable and potentially effective quality, even in a corrupt environment.", "Honesty and truth-telling, despite the risks, are morally important, as evidenced by his act of revealing the conspiracy.", "The Roman court is a dangerous and unpredictable place where survival depends on caution and careful observation."],
        ap.goals = ["Short-term: Escape Tiberius's villa without incurring his wrath or becoming entangled in his plans.", "Medium-term: Navigate the political fallout from the revelations and ensure his own safety and that of his immediate family.", "Ultimate: Return to a semblance of peace and scholarly pursuits, distancing himself from the treacherous world of imperial politics, though understanding this may be increasingly impossible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Caligula stands in the villa, positioned beside Tiberius and Claudius. He exhibits a nonchalant posture, leaning slightly forward with a playful smirk as he reacts to Tiberius\'s accusations, embodying an air of sardonic amusement.',
        ap.emotional_state = 'Caligula displays surface disdain mixed with amusement, his tone light as he mocks Livilla\'s treachery. Internally, he revels in the chaos, seeing it as a stage for his own ambitions. His cynical demeanor masks a deeper, ruthless opportunism, suggesting he thrives amidst the turmoil.',
        ap.emotional_tags = ["caligula displays surface disdain mixed with amusement", "his tone light as he mocks livilla's treachery. internally", "he revels in the chaos", "seeing it as a stage for his own ambitions. his cynical demeanor masks a deeper", "ruthless opportunism", "suggesting he thrives amidst the turmoil."],
        ap.active_plans = ["To deflect attention from his own ambitions by mocking Livilla's actions.", "To align himself with Tiberius by suggesting potential allies in the plotting against Sejanus.", "To plant the seeds of his own future power by positioning himself favorably in Tiberius's eyes."],
        ap.beliefs = ["Power is obtained through manipulation and deceit.", "Trust is a luxury in the game of politics, where only ambition matters.", "Personal survival and advancement justify any means necessary."],
        ap.goals = ["Short-term: To appear loyal and amused, gaining favor with Tiberius.", "Medium-term: To eliminate Sejanus as a threat while capturing the attention of the Praetorian Guard.", "Ultimate: To ascend to the highest echelons of power, regardless of the moral cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands with a scroll in hand, his face contorted with fury as he confronts Caligula. His posture is tense, indicative of his anger and anxiety, emphasizing his authoritative yet paranoid nature as he plots against Sejanus.',
        ap.emotional_state = 'Tiberius\'s facade of authority hides a deep-seated paranoia and fear of betrayal. Outwardly, he exudes rage and determination, but internally, he grapples with the weight of distrust, feeling increasingly isolated and vulnerable in the imperial palace.',
        ap.emotional_tags = ["tiberius's facade of authority hides a deep-seated paranoia", "fear of betrayal. outwardly, he exudes rage", "determination, but internally, he grapples with the weight of distrust, feeling increasingly isolated", "vulnerable in the imperial palace.", "tiberius's facade of authority hides a deep-seated paranoia and fear of betrayal. outwardly", "he exudes rage and determination", "but internally", "he grapples with the weight of distrust", "feeling increasingly isolated and vulnerable in the imperial palace.", "tiberius's facade of authority hides a deep-seated paranoia and fear of betrayal. outwardly, he exudes rage and determination,", "internally, he grapples with the weight of distrust, feeling increasingly isolated and vulnerable in the imperial palace."],
        ap.active_plans = ["To expose Livilla's treachery and incriminate Sejanus through Claudius's evidence.", "To devise a strategy for arresting Sejanus without alerting him to the threat.", "To purge potential threats from the Senate, consolidating his power in the process."],
        ap.beliefs = ["Betrayal lurks everywhere, and loyalty is a rare commodity.", "Power must be maintained through strength and ruthlessness.", "The preservation of his reign is paramount, even at the cost of blood."],
        ap.goals = ["Short-term: To arrest Sejanus and eliminate the immediate threat to his power.", "Medium-term: To restore his control over the Guard and Senate, re-establishing authority.", "Ultimate: To secure his legacy and reign as Emperor free from the specter of betrayal."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Tiberius, Emperor of Rome, stands in his villa, clutching a scroll that details the treachery of his trusted Prefect, Sejanus. He paces with agitated energy, his voice booming with imperial authority, as he confronts Claudius and Caligula with the damning evidence. He throws the scroll down in a fit of rage, emphasizing the depth of his fury and betrayal.',
        ap.emotional_state = 'Tiberius is consumed by a volcanic rage, his face a mask of fury as he grapples with the revelation of betrayal by those he trusted. Beneath the surface of his anger lies a deep-seated paranoia and wounded pride. He feels personally affronted by Sejanus\'s treachery and Livilla\'s deceit. There is a chilling satisfaction in his voice as he speaks of purging Rome, revealing a vengeful undercurrent to his fury.',
        ap.emotional_tags = ["tiberius is consumed by a volcanic rage, his face a mask of fury as he grapples with the revelation of betrayal by those he trusted. beneath the surface of his anger lies a deep-seated paranoia", "wounded pride. he feels personally affronted by sejanus's treachery", "livilla's deceit. there is a chilling satisfaction in his voice as he speaks of purging rome, revealing a vengeful undercurrent to his fury.", "tiberius is consumed by a volcanic rage", "his face a mask of fury as he grapples with the revelation of betrayal by those he trusted. beneath the surface of his anger lies a deep-seated paranoia and wounded pride. he feels personally affronted by sejanus's treachery and livilla's deceit. there is a chilling satisfaction in his voice as he speaks of purging rome", "revealing a vengeful undercurrent to his fury."],
        ap.active_plans = ["To devise a plan to arrest Sejanus, despite Sejanus's control of the Praetorian Guard.", "To identify and exploit any individuals within the Guard who might be disloyal to Sejanus, even if motivated by ambition rather than integrity.", "To lure Sejanus to Rome under false pretenses, specifically to the Senate steps, to facilitate his arrest without alerting him to the danger."],
        ap.beliefs = ["Betrayal is the natural order in Roman politics, and trust is a fool's virtue.", "Ruthless pragmatism is the only effective tool to maintain power and order in a corrupt world.", "Integrity is a rare and likely non-existent quality among those vying for power in Rome."],
        ap.goals = ["Short-term: Arrest Sejanus swiftly and decisively, preventing any counter-action from the Praetorian Guard.", "Medium-term: Reassert his authority and eliminate all threats to his rule, including Sejanus's allies and supporters, through a brutal purge.", "Ultimate: Secure his legacy by demonstrating unwavering strength and crushing any challenge to his imperial power, even if it means descending into greater tyranny."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Caligula stands beside Claudius and Tiberius in the Emperor\'s villa, feigning wide-eyed surprise and concern at the unfolding drama. He listens intently, interjecting with carefully crafted questions and seemingly innocent remarks, positioning himself as a helpful observer while subtly manipulating the situation to his advantage. He maintains a posture of respectful attentiveness, masking his opportunistic calculations.',
        ap.emotional_state = 'Caligula outwardly projects an air of naive shock and moral indignation, expressing feigned disgust at the treachery revealed. However, beneath this veneer of innocence lies a cold, calculating opportunism. He is likely thrilled by the chaos and potential power vacuum created by Sejanus\'s downfall. His internal state is characterized by cynical detachment and a keen awareness of how to exploit the situation to ingratiate himself with Tiberius and advance his own ambitions.',
        ap.emotional_tags = ["caligula outwardly projects an air of naive shock", "moral indignation, expressing feigned disgust at the treachery revealed. however, beneath this veneer of innocence lies a cold, calculating opportunism. he is likely thrilled by the chaos", "potential power vacuum created by sejanus's downfall. his internal state is characterized by cynical detachment", "a keen awareness of how to exploit the situation to ingratiate himself with tiberius", "advance his own ambitions.", "caligula outwardly projects an air of naive shock and moral indignation", "expressing feigned disgust at the treachery revealed. however", "beneath this veneer of innocence lies a cold", "calculating opportunism. he is likely thrilled by the chaos and potential power vacuum created by sejanus's downfall. his internal state is characterized by cynical detachment and a keen awareness of how to exploit the situation to ingratiate himself with tiberius and advance his own ambitions."],
        ap.active_plans = ["To solidify his position with Tiberius by offering solutions and appearing loyal and helpful in dealing with the Sejanus crisis.", "To subtly undermine Sejanus by suggesting Sertorius Macro as a replacement, thus eliminating a potential rival and paving the way for his own ascent.", "To gather information and assess the shifting power dynamics, positioning himself to capitalize on the fallout from Sejanus's downfall and further his own agenda."],
        ap.beliefs = ["Ambition is the most reliable motivator in politics; self-interest trumps loyalty.", "Moral outrage is a useful performance for manipulating others and masking one's own ruthless intentions.", "The chaos of Roman politics provides ample opportunities for those cunning enough to seize them."],
        ap.goals = ["Short-term: Gain Tiberius's trust and favor by appearing supportive and resourceful during this crisis.", "Medium-term: Increase his influence within the imperial court and position himself as a valuable advisor to Tiberius, potentially even as his heir apparent.", "Ultimate: Secure the imperial throne for himself, viewing Sejanus's downfall as a step closer to realizing his own ambition to rule Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_3'})
    ON CREATE SET
        ap.current_status = 'Claudius stands nervously beside Tiberius and Caligula, unshaven and displaying a clear discomfort with the volatile situation. He has just delivered the scroll exposing Sejanus\'s plot and now observes Tiberius\'s furious reaction with apprehension. He attempts to interject with cautious questions, seeking a path to resolution while trying to remain inconspicuous and avoid incurring Tiberius\'s wrath.',
        ap.emotional_state = 'Claudius is deeply anxious and uneasy, feeling the weight of the dangerous information he has just delivered and the unpredictable consequences that will follow. He is likely fearful of Tiberius\'s rage and the potential for widespread violence. Beneath his nervousness, there is a flicker of moral concern, a desire to see justice done, albeit tempered by his ingrained survival instincts and awareness of the perilous nature of Roman politics.',
        ap.emotional_tags = ["claudius is deeply anxious", "uneasy, feeling the weight of the dangerous information he has just delivered", "the unpredictable consequences that will follow. he is likely fearful of tiberius's rage", "the potential for widespread violence. beneath his nervousness, there is a flicker of moral concern, a desire to see justice done, albeit tempered by his ingrained survival instincts", "awareness of the perilous nature of roman politics.", "claudius is deeply anxious and uneasy", "feeling the weight of the dangerous information he has just delivered and the unpredictable consequences that will follow. he is likely fearful of tiberius's rage and the potential for widespread violence. beneath his nervousness", "there is a flicker of moral concern", "a desire to see justice done", "albeit tempered by his ingrained survival instincts and awareness of the perilous nature of roman politics."],
        ap.active_plans = ["To subtly guide Tiberius towards a less bloody resolution, hoping to find a man of integrity within the Guard rather than relying solely on ambition and treachery.", "To remain as unobtrusive as possible, avoiding the spotlight of Tiberius's fury and Caligula's opportunistic maneuvering.", "To assess the situation and determine the safest course of action for himself and his own survival in the escalating crisis."],
        ap.beliefs = ["Genuine integrity is rare but still potentially valuable, even in the corrupt Roman court.", "Honesty, while risky, is sometimes necessary to address grave injustices, as demonstrated by his act of revealing the conspiracy.", "Violence and chaos are inherent dangers in Roman politics, and survival depends on careful navigation and avoidance of direct conflict."],
        ap.goals = ["Short-term: Find a way to resolve the Sejanus situation with minimal bloodshed and disruption, if possible.", "Medium-term: Restore a semblance of stability and justice to Rome, even within the existing flawed system.", "Ultimate: Survive the political turmoil and navigate the dangerous currents of imperial intrigue, hoping to contribute to a better future for Rome, however distant that prospect may seem."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Tiberius stands resolutely, a scroll clutched tightly in his fist, his expression twisted into a mask of fury. He towers over Claudius and Caligula, his posture rigid with authority, as he verbally lashes out, throwing the scroll at Caligula\'s feet with an explosive gesture, signaling his wrath and determination.',
        ap.emotional_state = 'Tiberius\'s surface anger belies an undercurrent of deep-seated paranoia and betrayal. His fury at perceived threats forces him into a corner, making him both volatile and dangerous. Internally, he grapples with fear and a sense of vulnerability, igniting a ruthless resolve to eliminate any opposition and secure his power at all costs.',
        ap.emotional_tags = ["tiberius's surface anger belies an undercurrent of deep-seated paranoia", "betrayal. his fury at perceived threats forces him into a corner, making him both volatile", "dangerous. internally, he grapples with fear", "a sense of vulnerability, igniting a ruthless resolve to eliminate any opposition", "secure his power at all costs.", "tiberius's surface anger belies an undercurrent of deep-seated paranoia and betrayal. his fury at perceived threats forces him into a corner", "making him both volatile and dangerous. internally", "he grapples with fear and a sense of vulnerability", "igniting a ruthless resolve to eliminate any opposition and secure his power at all costs."],
        ap.active_plans = ["To identify and eliminate threats to his power, particularly targeting Sejanus and those loyal to him.", "To execute a violent purge of those he perceives as disloyal or conspirators against him.", "To manipulate Caligula and use his connections to Sertorius Macro to his advantage, ensuring his control over the Guard."],
        ap.beliefs = ["Power must be maintained through absolute control and fear.", "Betrayal is rampant in the empire, necessitating preemptive strikes against rivals.", "Ambition often outweighs loyalty, and only the ruthless will survive."],
        ap.goals = ["Short-term: To swiftly arrest Sejanus and neutralize his influence.", "Medium-term: To consolidate his power and eliminate any rival factions within the Senate and Guard.", "Ultimate: To secure his legacy and reign as an unchallenged emperor of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_4'})
    ON CREATE SET
        ap.current_status = 'Caligula stands beside Tiberius, his demeanor oscillating between feigned innocence and cold calculation. His body language radiates a mix of amusement and opportunism, as he casually leans against a wall, watching the escalating drama unfold with a calculating glint in his eye.',
        ap.emotional_state = 'While Caligula masks his true feelings with light banter and casual observations, he internally relishes the chaos unfolding around him. His surface-level amusement hides a deeper enjoyment of the power struggles, illustrating his manipulative nature and desire to exploit the situation to his advantage.',
        ap.emotional_tags = ["while caligula masks his true feelings with light banter", "casual observations, he internally relishes the chaos unfolding around him. his surface-level amusement hides a deeper enjoyment of the power struggles, illustrating his manipulative nature", "desire to exploit the situation to his advantage.", "while caligula masks his true feelings with light banter and casual observations", "he internally relishes the chaos unfolding around him. his surface-level amusement hides a deeper enjoyment of the power struggles", "illustrating his manipulative nature and desire to exploit the situation to his advantage."],
        ap.active_plans = ["To position himself favorably in Tiberius's eyes, ensuring his future as a potential successor.", "To discreetly gather intelligence on Sejanus\u2019s loyalties and weaknesses.", "To use his connections, particularly with Macro, to strengthen his own power base."],
        ap.beliefs = ["Ambition is a necessary trait for survival in the brutal world of Roman politics.", "Deception is a tool to be wielded effectively, especially against rivals.", "Loyalty is fleeting; those who cling to it are often the first to fall."],
        ap.goals = ["Short-term: To ingratiate himself with Tiberius and solidify his position by suggesting a plan against Sejanus.", "Medium-term: To gain influence over the military by leveraging Macro\u2019s popularity.", "Ultimate: To secure the imperial throne for himself, using the chaos to his advantage."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_message_event_17_2'})
    ON CREATE SET
        oi.description = 'The message, sealed with the Emperor\'s insignia, serves as a pivotal plot device, symbolizing the precarious balance of power. Macro presents it as a harbinger of favor for Sejanus, inciting a momentary illusion of triumph while simultaneously setting the stage for impending treachery.',
        oi.status_before = 'Prior to the event, the message exists in a state of secrecy, a directive sent from Tiberius intended for Sejanus, its content hidden from all but Macro.',
        oi.status_after = 'After the event, the message\'s significance intensifies as its contents are revealed to Sejanus, altering the dynamics of trust and ambition within the Senate while deepening the trap that Macro has set.'
    WITH oi
    MATCH (o:Object {uuid: 'object_message'})
    MATCH (e:Event {uuid: 'event_17_2'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_message_event_17_3'})
    ON CREATE SET
        oi.description = 'The message, embodied by the Emperor\'s seal, acts as a crucial instrument of deception and authority in Macro\'s calculated coup. Macro initially presents the message verbally as containing news of Sejanus\'s promotion, using it as bait to lure Sejanus into a false sense of security. However, the true power of the message lies in the Emperor\'s seal itself, which Macro strategically displays to the Captain of the Guard. This visual confirmation of imperial authority allows Macro to bypass Sejanus\'s command structure and directly order the guard\'s withdrawal, turning the message into a tool to dismantle Sejanus\'s power base from under his nose.',
        oi.status_before = 'Prior to this event, the message, bearing the Emperor\'s seal, was presumably held by Macro, acting as Tiberius\'s agent outside the city. Its contents are unknown to Sejanus and his guards, adding an element of suspense and anticipation. It is a symbol of imperial communication, carrying the weight of Tiberius\'s authority and directives, ready to be deployed at the opportune moment.',
        oi.status_after = 'Following the event, the message, having served its primary function, remains in Macro\'s possession as a symbol of his successful deception and assertion of imperial power. The seal has been recognized and obeyed, effectively neutralizing Sejanus\'s immediate Praetorian Guard. The message now represents the decisive shift in power, marking the beginning of Sejanus\'s downfall and the re-establishment of Tiberius\'s control over Rome. Its physical state is unchanged, but its narrative significance is dramatically amplified.'
    WITH oi
    MATCH (o:Object {uuid: 'object_message'})
    MATCH (e:Event {uuid: 'event_17_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Macro arrives at the Senate steps, his posture rigid and face set in a stern expression. He approaches Sejanus directly, maintaining a formal distance while delivering a seemingly respectful hail. His movements are deliberate and controlled, suggesting a man on a precise mission, every gesture calculated to project authority and command attention in this tense public setting.',
        ap.emotional_state = 'On the surface, Macro presents an impassive and dutiful demeanor, the very picture of a soldier carrying out orders with unwavering resolve. However, beneath this stoic facade lies a cunning strategist executing a carefully orchestrated deception. He is focused and alert, acutely aware of the precariousness of the situation and the need to maintain his composure while delivering potentially devastating news to Sejanus, concealing any hint of triumph or malice.',
        ap.emotional_tags = ["on the surface, macro presents an impassive", "dutiful demeanor, the very picture of a soldier carrying out orders with unwavering resolve. however, beneath this stoic facade lies a cunning strategist executing a carefully orchestrated deception. he is focused", "alert, acutely aware of the precariousness of the situation", "the need to maintain his composure while delivering potentially devastating news to sejanus, concealing any hint of triumph or malice.", "on the surface", "macro presents an impassive and dutiful demeanor", "the very picture of a soldier carrying out orders with unwavering resolve. however", "beneath this stoic facade lies a cunning strategist executing a carefully orchestrated deception. he is focused and alert", "acutely aware of the precariousness of the situation and the need to maintain his composure while delivering potentially devastating news to sejanus", "concealing any hint of triumph or malice.", "on the surface, macro presents an impassive and dutiful demeanor, the very picture of a soldier carrying out orders with unwavering resolve. however, beneath this stoic facade lies a cunning strategist executing a carefully orchestrated deception. he is focused and alert, acutely aware of the precariousness of the situation and the need to maintain his composure", "delivering potentially devastating news to sejanus, concealing any hint of triumph or malice."],
        ap.active_plans = ["Deliver the Emperor's message to Sejanus in a way that appears to be an honor, masking its true intent.", "Use the Emperor's authority, represented by the seal, to manipulate the Captain of the Guard and isolate Sejanus's forces.", "Observe Sejanus's reaction to the news and ensure the smooth execution of the plan to arrest him, preparing for potential resistance but aiming for swift and decisive action."],
        ap.beliefs = ["Unquestioning obedience to the Emperor is the highest virtue and duty.", "Ruthless efficiency and pragmatism are necessary for maintaining order and power in Rome.", "Deception is a legitimate and essential tool in political and military strategy to achieve desired outcomes."],
        ap.goals = ["short_term\": \"Successfully deceive Sejanus into believing the message is one of favor, thus lowering his defenses and preventing immediate suspicion.", "medium_term\": \"Secure the Praetorian Guard's cooperation and neutralize Sejanus's personal guards to ensure a swift and bloodless arrest if possible, or a controlled and decisive one if necessary.", "ultimate\": \"Eliminate Sejanus as a threat to Tiberius's rule and restore stability to Rome by executing the Emperor's orders with unwavering precision and effectiveness, solidifying his own position as a loyal and capable servant of the Empire."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_1'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands prominently at the Senate steps, surrounded by his family and loyal guards, projecting an image of power and established authority. He engages with Macro with a mixture of curiosity and expectation, initially questioning Macro\'s presence directly rather than the Emperor\'s, indicating his anticipation of imperial recognition and perhaps a hint of underlying insecurity despite his outward confidence in this very public space.',
        ap.emotional_state = 'Sejanus outwardly displays an air of confident authority, expecting news that will further solidify his already considerable power. He is eager and anticipatory, hopeful that Macro\'s message confirms his ascent to \'Protector of the City\', interpreting it as a step towards even greater influence. However, beneath this veneer of self-assurance, a subtle current of paranoia might be stirring. He questions the Emperor\'s absence and indirect communication, betraying a latent unease about Tiberius\'s true intentions and the potential for hidden agendas within the seemingly positive message.',
        ap.emotional_tags = ["sejanus outwardly displays an air of confident authority, expecting news that will further solidify his already considerable power. he is eager", "anticipatory, hopeful that macro's message confirms his ascent to 'protector of the city', interpreting it as a step towards even greater influence. however, beneath this veneer of self-assurance, a subtle current of paranoia might be stirring. he questions the emperor's absence", "indirect communication, betraying a latent unease about tiberius's true intentions", "the potential for hidden agendas within the seemingly positive message.", "sejanus outwardly displays an air of confident authority", "expecting news that will further solidify his already considerable power. he is eager and anticipatory", "hopeful that macro's message confirms his ascent to 'protector of the city'", "interpreting it as a step towards even greater influence. however", "beneath this veneer of self-assurance", "a subtle current of paranoia might be stirring. he questions the emperor's absence and indirect communication", "betraying a latent unease about tiberius's true intentions and the potential for hidden agendas within the seemingly positive message."],
        ap.active_plans = ["Assess the true nature of Macro's message and discern whether it genuinely represents imperial favor or a veiled threat.", "Maintain a public posture of strength and control in front of his family and guards, reinforcing his image of power and invulnerability.", "Attempt to leverage any perceived imperial favor to further consolidate his position and influence within Rome, potentially preparing for an even greater leap in power."],
        ap.beliefs = ["His political acumen and strategic brilliance have made him indispensable to the Emperor and to Rome's stability.", "The Emperor, despite any reservations, will ultimately recognize and reward his ambition and loyalty with greater power and authority.", "Public perception and displays of power are crucial for maintaining control and deterring any potential opposition to his ascent."],
        ap.goals = ["short_term\": \"Receive and interpret Macro's message in a way that publicly enhances his status and authority, confirming his expectations of imperial favor and solidifying his public image.", "medium_term\": \"Utilize the anticipated 'Protector of the City' title to expand his control over Rome's military and civic affairs, further eroding Tiberius's direct power and strengthening his own position as de facto ruler.", "ultimate\": \"Secure ultimate power, potentially even the emperorship itself, by strategically leveraging his current position and any perceived imperial endorsement, aiming to become the undisputed ruler of Rome and establish a lasting legacy of power and dominance."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Macro stands confidently before Sejanus, his posture radiating authority. He delivers a message with calm precision, signaling the Emperor\'s intentions while maintaining a stern expression, subtly wielding his power in the confrontation.',
        ap.emotional_state = 'Outwardly composed, Macro\'s demeanor reveals a cold determination. Internally, he grapples with the heavy burden of loyalty to the Emperor while recognizing the dangerous game he plays with Sejanus\'s ambitions. His motivations are laced with strategic manipulation and calculated deceit.',
        ap.emotional_tags = ["outwardly composed, macro's demeanor reveals a cold determination. internally, he grapples with the heavy burden of loyalty to the emperor while recognizing the dangerous game he plays with sejanus's ambitions. his motivations are laced with strategic manipulation", "calculated deceit.", "outwardly composed", "macro's demeanor reveals a cold determination. internally", "he grapples with the heavy burden of loyalty to the emperor while recognizing the dangerous game he plays with sejanus's ambitions. his motivations are laced with strategic manipulation and calculated deceit.", "outwardly composed, macro's demeanor reveals a cold determination. internally, he grapples with the heavy burden of loyalty to the emperor", "recognizing the dangerous game he plays with sejanus's ambitions. his motivations are laced with strategic manipulation and calculated deceit."],
        ap.active_plans = ["Deliver Tiberius's message to Sejanus, ensuring it is taken seriously.", "Manipulate Sejanus's ambition by suggesting he is favored by the Emperor.", "Prepare to enforce the Emperor's will, regardless of the consequences for Sejanus."],
        ap.beliefs = ["Power is wielded through strategic communication and manipulation.", "Loyalty to Tiberius supersedes personal relationships.", "Ambition, when unchecked, leads to downfall."],
        ap.goals = ["Short-term: Successfully convey the message to Sejanus.", "Medium-term: Position himself favorably in the eyes of the Emperor.", "Ultimate: Maintain stability and power within the Praetorian Guard."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Sejanus stands with an air of confidence, initially pleased by Macro\'s words. His body language shifts subtly from relaxed to tense, revealing his ambition as he contemplates the implications of the Emperor’s message.',
        ap.emotional_state = 'Sejanus exhibits a façade of calm, masking a growing anxiety beneath as he questions Tiberius\'s intentions. The prospect of power excites him, but a flicker of doubt gnaws at his mind, suggesting an internal struggle between hope and fear of betrayal.',
        ap.emotional_tags = ["sejanus exhibits a fa\u00e7ade of calm, masking a growing anxiety beneath as he questions tiberius's intentions. the prospect of power excites him, but a flicker of doubt gnaws at his mind, suggesting an internal struggle between hope", "fear of betrayal.", "sejanus exhibits a fa\u00e7ade of calm", "masking a growing anxiety beneath as he questions tiberius's intentions. the prospect of power excites him", "but a flicker of doubt gnaws at his mind", "suggesting an internal struggle between hope and fear of betrayal.", "sejanus exhibits a fa\u00e7ade of calm, masking a growing anxiety beneath as he questions tiberius's intentions. the prospect of power excites him,", "a flicker of doubt gnaws at his mind, suggesting an internal struggle between hope and fear of betrayal."],
        ap.active_plans = ["Ensure the message is delivered and interpreted as a sign of Imperial favor.", "Solidify his position within the Senate by asserting his authority.", "Prepare for the potential repercussions of increased visibility and power."],
        ap.beliefs = ["Political success is achieved through cunning and manipulation.", "The loyalty of allies can be a double-edged sword.", "Power is worth any sacrifice, including trust."],
        ap.goals = ["Short-term: Gain the title of Protector of the City.", "Medium-term: Position himself as Tiberius's successor.", "Ultimate: Secure control over the Senate and eliminate threats to his power."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Arria stands beside her father, her youthful frame tense with confusion and concern. She shifts her weight from foot to foot, watching her father\'s interactions with Macro intently, her brow furrowing as uncertainty fills the air.',
        ap.emotional_state = 'Arria is visibly anxious, her youthful innocence clashing with the heavy atmosphere of political intrigue. She feels the weight of her father\'s reputation and the implications of the Emperor\'s message, struggling to comprehend the dangers that surround them.',
        ap.emotional_tags = ["arria is visibly anxious, her youthful innocence clashing with the heavy atmosphere of political intrigue. she feels the weight of her father's reputation", "the implications of the emperor's message, struggling to comprehend the dangers that surround them.", "arria is visibly anxious", "her youthful innocence clashing with the heavy atmosphere of political intrigue. she feels the weight of her father's reputation and the implications of the emperor's message", "struggling to comprehend the dangers that surround them."],
        ap.active_plans = ["Seek clarification on her father's actions and their implications.", "Support her father's ambitions while remaining cautious of the dangers.", "Protect her family's legacy amidst the brewing storm."],
        ap.beliefs = ["Loyalty to family is paramount, despite political chaos.", "Power dynamics can shift unexpectedly, leading to danger.", "Understanding the intricacies of court life is crucial for survival."],
        ap.goals = ["Short-term: Gain insight into the Emperor's intentions.", "Medium-term: Assist her father in navigating the complexities of power.", "Ultimate: Ensure her family's safety and continuity in an unstable environment."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_17_2'})
    ON CREATE SET
        ap.current_status = 'Junius stands close to Arria, his eyes wide with a mixture of curiosity and apprehension. He listens intently to the conversation, his body slightly leaning forward, eager yet cautious as he absorbs the tension of the moment.',
        ap.emotional_state = 'Junius feels a blend of confusion and concern, his youthful perspective clouded by the gravity of the situation. He is aware of the political danger surrounding his family, feeling the tremors of anxiety ripple through the air.',
        ap.emotional_tags = ["junius feels a blend of confusion", "concern, his youthful perspective clouded by the gravity of the situation. he is aware of the political danger surrounding his family, feeling the tremors of anxiety ripple through the air.", "junius feels a blend of confusion and concern", "his youthful perspective clouded by the gravity of the situation. he is aware of the political danger surrounding his family", "feeling the tremors of anxiety ripple through the air."],
        ap.active_plans = ["Stay close to Arria for support and guidance.", "Observe the interactions between Macro and Sejanus for insights.", "Understand the implications of the Emperor's message for his family."],
        ap.beliefs = ["Family loyalty is essential, especially in dangerous times.", "Political machinations are complex and often perilous.", "Courage can manifest in both action and observation."],
        ap.goals = ["Short-term: Grasp the significance of the ongoing conversation.", "Medium-term: Help protect his sister and uphold family honor.", "Ultimate: Navigate the treacherous waters of politics as he matures."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_3'})
    ON CREATE SET
        ap.current_status = 'Macro approaches Sejanus at the Senate steps with a deliberately calm and respectful demeanor, addressing him formally as \'Sejanus\'. He maintains a stern and soldierly posture, carefully presenting himself as a messenger bearing good news from the Emperor, all while subtly observing the surrounding guards and assessing the scene for the opportune moment to execute his true orders. He physically presents the Emperor\'s seal to the Captain of the Guard with a decisive gesture, ensuring its visibility and impact.',
        ap.emotional_state = 'On the surface, Macro projects an image of professional detachment and obedience, his tone measured and his expression unreadable to Sejanus. However, beneath this facade of military formality, Macro is operating with cold, calculated resolve. He is focused and determined, suppressing any personal emotions to effectively carry out Tiberius\'s command. There\'s an underlying tension as he navigates this deceptive encounter, knowing the stakes are incredibly high and any slip could jeopardize the mission and his own life.',
        ap.emotional_tags = ["on the surface, macro projects an image of professional detachment", "obedience, his tone measured", "his expression unreadable to sejanus. however, beneath this facade of military formality, macro is operating with cold, calculated resolve. he is focused", "determined, suppressing any personal emotions to effectively carry out tiberius's command. there's an underlying tension as he navigates this deceptive encounter, knowing the stakes are incredibly high", "any slip could jeopardize the mission", "his own life.", "on the surface", "macro projects an image of professional detachment and obedience", "his tone measured and his expression unreadable to sejanus. however", "beneath this facade of military formality", "macro is operating with cold", "calculated resolve. he is focused and determined", "suppressing any personal emotions to effectively carry out tiberius's command. there's an underlying tension as he navigates this deceptive encounter", "knowing the stakes are incredibly high and any slip could jeopardize the mission and his own life."],
        ap.active_plans = ["Deceive Sejanus into believing the message is about his promotion to 'Protector of the City'.", "Use the Emperor's seal to assert authority over the Praetorian Guard, bypassing Sejanus's command.", "Isolate Sejanus by dismissing his personal guard and ensuring their retreat to barracks, effectively neutralizing his immediate security."],
        ap.beliefs = ["Unwavering obedience to the Emperor's direct orders is paramount, overriding any previous allegiance to Sejanus.", "The Emperor's seal is the ultimate symbol of authority and will be instantly recognized and obeyed by the military.", "Swift and decisive action, executed with military precision, is essential for a successful coup and to prevent resistance from Sejanus's loyalists."],
        ap.goals = ["goals_short_term\": \"Deliver the deceptive message to Sejanus and use it as a pretext to approach his guards.", "goals_medium_term\": \"Disarm and remove Sejanus's Praetorian Guard from his immediate vicinity, rendering him vulnerable.", "goals_ultimate\": \"Secure Sejanus's arrest and ensure the smooth transition of power back to Tiberius's direct control, eliminating Sejanus as a threat to the Empire."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_emperors_message_event_18_1'})
    ON CREATE SET
        oi.description = 'The Emperor\'s Message is the catalyst for the scene, read aloud by the Quaestor. It reveals the shocking betrayal of Sejanus and incites fear and uncertainty among the Senators. The weight of its contents shapes the immediate reactions and decisions of those present in the Senate, marking a pivotal moment in the political landscape of Rome.',
        oi.status_before = 'The message existed as a private directive from Tiberius, containing sensitive information about Sejanus\'s alleged conspiracy, awaiting its public revelation.',
        oi.status_after = 'After being read, the Emperor\'s Message transforms from a secretive decree into a public declaration, now widely known among the Senators, solidifying Sejanus\'s downfall and altering the dynamics of power in Rome.'
    WITH oi
    MATCH (o:Object {uuid: 'object_emperors_message'})
    MATCH (e:Event {uuid: 'event_18_1'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_1'})
    ON CREATE SET
        ap.current_status = 'The Quaestor stands at the center of the Senate chamber, his posture upright and authoritative as he reads Tiberius\'s message. His voice booms through the room, commanding attention while his eyes sweep across the stunned faces of the Senators, reflecting a mix of formality and the weight of the moment.',
        ap.emotional_state = 'Outwardly calm and composed, the Quaestor presents a facade of professionalism. However, beneath the surface, there is an undercurrent of anxiety as he realizes the gravity of the message he conveys, knowing it may have profound implications for himself and the Senate. He grapples with the tension of relaying such a dangerous decree.',
        ap.emotional_tags = ["outwardly calm", "composed, the quaestor presents a facade of professionalism. however, beneath the surface, there is an undercurrent of anxiety as he realizes the gravity of the message he conveys, knowing it may have profound implications for himself", "the senate. he grapples with the tension of relaying such a dangerous decree.", "outwardly calm and composed", "the quaestor presents a facade of professionalism. however", "beneath the surface", "there is an undercurrent of anxiety as he realizes the gravity of the message he conveys", "knowing it may have profound implications for himself and the senate. he grapples with the tension of relaying such a dangerous decree."],
        ap.active_plans = ["To read Tiberius's message clearly and authoritatively to ensure the Senate understands the severity of the situation.", "To maintain order in the chamber, managing the reactions of the Senators and the bystander as the implications of the message unfold.", "To facilitate the Senate's decision-making process regarding the Emperor's demands, guiding them toward a collective response."],
        ap.beliefs = ["The Senate must act decisively to protect both its own interests and the stability of the Empire.", "As an official, it is his duty to relay the Emperor's words with fidelity, regardless of personal feelings about the content.", "Trust in the Emperor's judgment, believing that his authority must be upheld for the sake of Rome."],
        ap.goals = ["Short-term: To successfully read the Emperor's message without interruption.", "Medium-term: To oversee the Senate's response and ensure it aligns with the Emperor's directives.", "Ultimate: To preserve the integrity of the Senate and the Empire amidst political upheaval."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Although physically absent from the Senate, Tiberius\'s presence looms large as his decree is recited. His authority is palpable, dictating the actions and emotions of the Senate and shaping the political landscape with his words.',
        ap.emotional_state = 'Tiberius\'s emotional state is steeped in paranoia and betrayal. He is agitated by the threats surrounding him, feeling isolated and vulnerable, which drives his need to assert control over the Senate and eliminate perceived threats. His words reflect a mix of anger and fear regarding Sejanus’s betrayal.',
        ap.emotional_tags = ["tiberius's emotional state is steeped in paranoia", "betrayal. he is agitated by the threats surrounding him, feeling isolated", "vulnerable, which drives his need to assert control over the senate", "eliminate perceived threats. his words reflect a mix of anger", "fear regarding sejanus\u2019s betrayal.", "tiberius's emotional state is steeped in paranoia and betrayal. he is agitated by the threats surrounding him", "feeling isolated and vulnerable", "which drives his need to assert control over the senate and eliminate perceived threats. his words reflect a mix of anger and fear regarding sejanus\u2019s betrayal."],
        ap.active_plans = ["To instigate the arrest of Sejanus and demonstrate his power to the Senate.", "To eliminate threats to his reign by rallying the Senate behind his directive.", "To reinforce his authority as Emperor and reassert control over the political narrative in Rome."],
        ap.beliefs = ["Betrayal is a profound sin, and those who conspire against him must be dealt with swiftly and ruthlessly.", "His position as Emperor requires constant vigilance against treachery, both from allies and enemies.", "Maintaining a strong grip on power is essential for the survival of his reign and the stability of the Empire."],
        ap.goals = ["Short-term: To ensure the Senate reacts favorably to his decree and supports the arrests.", "Medium-term: To restore a sense of order and confidence in his leadership following this betrayal.", "Ultimate: To eliminate all threats to his power and maintain his reign over Rome without challenge."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'})
    ON CREATE SET
        ap.current_status = 'Although not physically present, Sejanus\'s fate is being sealed by Tiberius\'s words. His reputation is being dismantled in real-time, with the Quaestor\'s voice serving as the judge and jury in the Senate\'s perception of his actions.',
        ap.emotional_state = 'Sejanus experiences a complex mix of dread and disbelief as he realizes the extent of Tiberius\'s betrayal and the public nature of his downfall. The weight of impending arrest hangs heavy, filled with desperation to escape the consequences of his actions.',
        ap.emotional_tags = ["sejanus experiences a complex mix of dread", "disbelief as he realizes the extent of tiberius's betrayal", "the public nature of his downfall. the weight of impending arrest hangs heavy, filled with desperation to escape the consequences of his actions.", "sejanus experiences a complex mix of dread and disbelief as he realizes the extent of tiberius's betrayal and the public nature of his downfall. the weight of impending arrest hangs heavy", "filled with desperation to escape the consequences of his actions."],
        ap.active_plans = ["To attempt to discredit the allegations against him and protect his position.", "To seek any allies who might intercede on his behalf before his arrest.", "To devise a plan for survival amidst the rapidly collapsing political landscape."],
        ap.beliefs = ["Power is fleeting, and one must always be prepared for betrayal, even from those closest.", "Tiberius\u2019s trust is a double-edged sword; reliance on it can lead to downfall.", "Ambition is a necessary force in the brutal world of Roman politics, but it also carries grave risks."],
        ap.goals = ["Short-term: To evade arrest and maintain his position of power.", "Medium-term: To rally support from loyalists before the Senate makes its final decision.", "Ultimate: To reclaim authority and eliminate his rivals, ensuring his legacy in the leadership of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_1'})
    ON CREATE SET
        ap.current_status = 'The Senator stands among the gathering, visibly shifting with the weight of Tiberius\'s message. He maneuvers through the crowded chamber with brusque urgency, seeking to position himself advantageously amidst the chaos.',
        ap.emotional_state = 'His outward demeanor is one of opportunism, masking an underlying fear of the political implications of Sejanus’s downfall. He feels a sense of urgency to align with the prevailing power and is anxious to distance himself from any potential fallout.',
        ap.emotional_tags = ["his outward demeanor is one of opportunism, masking an underlying fear of the political implications of sejanus\u2019s downfall. he feels a sense of urgency to align with the prevailing power", "is anxious to distance himself from any potential fallout.", "his outward demeanor is one of opportunism", "masking an underlying fear of the political implications of sejanus\u2019s downfall. he feels a sense of urgency to align with the prevailing power and is anxious to distance himself from any potential fallout."],
        ap.active_plans = ["To quickly assess the situation and determine how to benefit from the unfolding chaos.", "To ensure his own safety and align himself with the Senate's decision in favor of Tiberius.", "To navigate through the emerging power dynamics and position himself favorably for future political maneuvers."],
        ap.beliefs = ["Survival in the Senate requires adaptability and quick decision-making.", "Loyalty is transactional; alliances shift with the tides of power.", "Seizing opportunities amidst crisis is essential for political advancement."],
        ap.goals = ["Short-term: To ensure he is seen as loyal to Tiberius in this critical moment.", "Medium-term: To leverage the situation to enhance his influence within the Senate.", "Ultimate: To secure a prominent position in the new political order following Sejanus's downfall."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_1'})
    ON CREATE SET
        ap.current_status = 'The Bystander stands slightly apart from the Senators, their anxious whispers and shifting expressions betraying the confusion that ripples through the chamber at the gravity of the news being read.',
        ap.emotional_state = 'Filled with anxiety and uncertainty, the Bystander\'s eyes dart around, absorbing the reactions of those around them. They feel a deep sense of foreboding, realizing the potential consequences of such a betrayal on their own lives.',
        ap.emotional_tags = ["filled with anxiety", "uncertainty, the bystander's eyes dart around, absorbing the reactions of those around them. they feel a deep sense of foreboding, realizing the potential consequences of such a betrayal on their own lives.", "filled with anxiety and uncertainty", "the bystander's eyes dart around", "absorbing the reactions of those around them. they feel a deep sense of foreboding", "realizing the potential consequences of such a betrayal on their own lives."],
        ap.active_plans = ["To gather information about the unfolding events and understand the implications for the future.", "To remain inconspicuous while assessing the reactions of the Senators for signs of shifting allegiances.", "To find a moment to discuss the situation with others outside the chamber, seeking clarity amid the chaos."],
        ap.beliefs = ["The political landscape is volatile, and the fallout from Sejanus's betrayal could affect everyone in the Senate.", "Knowledge is power, and understanding the shifting tides is crucial for survival.", "Loyalty and virtue mean little in the face of ambition and betrayal."],
        ap.goals = ["Short-term: To comprehend the political ramifications of the message being read.", "Medium-term: To ensure personal safety and avoid being drawn into the chaos.", "Ultimate: To navigate the political aftermath and align with the emerging powers."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Standing tall and formal before the assembled Senators, the Quaestor unrolls the Emperor\'s scroll, his voice resonating with the cold authority of official decree. He reads each word with measured cadence, his gaze sweeping across the stunned faces, ensuring every syllable of Tiberius\'s damning message is heard and understood by the gathered assembly.',
        ap.emotional_state = 'Outwardly, the Quaestor maintains a detached, professional demeanor, embodying the impassive face of Roman bureaucracy. Yet, beneath the surface, a tremor of apprehension might be present, a subtle awareness of the seismic shift occurring in the heart of Rome. He is a messenger, not a player, but even messengers can feel the chill of a sudden power vacuum and the potential fallout of imperial wrath.',
        ap.emotional_tags = ["outwardly, the quaestor maintains a detached, professional demeanor, embodying the impassive face of roman bureaucracy. yet, beneath the surface, a tremor of apprehension might be present, a subtle awareness of the seismic shift occurring in the heart of rome. he is a messenger, not a player, but even messengers can feel the chill of a sudden power vacuum", "the potential fallout of imperial wrath.", "outwardly", "the quaestor maintains a detached", "professional demeanor", "embodying the impassive face of roman bureaucracy. yet", "beneath the surface", "a tremor of apprehension might be present", "a subtle awareness of the seismic shift occurring in the heart of rome. he is a messenger", "not a player", "but even messengers can feel the chill of a sudden power vacuum and the potential fallout of imperial wrath.", "outwardly, the quaestor maintains a detached, professional demeanor, embodying the impassive face of roman bureaucracy. yet, beneath the surface, a tremor of apprehension might be present, a subtle awareness of the seismic shift occurring in the heart of rome. he is a messenger, not a player,", "even messengers can feel the chill of a sudden power vacuum and the potential fallout of imperial wrath."],
        ap.active_plans = ["To flawlessly execute his duty by reading the Emperor's message without deviation or personal interpretation.", "To maintain order and decorum within the Senate chamber during this volatile announcement.", "To formally pose the Emperor's demand to the Senate, ensuring a clear and unified response."],
        ap.beliefs = ["In the absolute authority of the Emperor and the sanctity of imperial decrees.", "In the importance of maintaining Roman order and upholding senatorial procedure.", "In his own role as a loyal servant of the state, bound by duty and tradition."],
        ap.goals = ["Short-term: To successfully complete the reading of the Emperor's message and record the Senate's response.", "Medium-term: To ensure the smooth transition of power and maintain stability within the Senate during this crisis.", "Ultimate: To continue serving the Roman state and uphold his position within the established hierarchy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Though physically absent, Tiberius dominates the Senate chamber through the sheer force of his written word. His message, delivered from distant Capri, acts as his proxy, reaching out like a spectral hand to command and condemn. He orchestrates events from afar, a puppeteer pulling strings that will send shockwaves through Rome, his power magnified by distance and dread.',
        ap.emotional_state = 'From his island exile, Tiberius projects an image of imperial wrath and decisive action. Beneath this facade of strength, however, simmers a cauldron of paranoia and wounded pride. Betrayal by his trusted Sejanus has ignited a cold fury, mingling with a deep-seated fear for his own safety and the stability of his reign. He is a wounded lion, lashing out to reassert dominance and crush any perceived threat, driven by a need for control born from profound insecurity.',
        ap.emotional_tags = ["from his island exile, tiberius projects an image of imperial wrath", "decisive action. beneath this facade of strength, however, simmers a cauldron of paranoia", "wounded pride. betrayal by his trusted sejanus has ignited a cold fury, mingling with a deep-seated fear for his own safety", "the stability of his reign. he is a wounded lion, lashing out to reassert dominance", "crush any perceived threat, driven by a need for control born from profound insecurity.", "from his island exile", "tiberius projects an image of imperial wrath and decisive action. beneath this facade of strength", "however", "simmers a cauldron of paranoia and wounded pride. betrayal by his trusted sejanus has ignited a cold fury", "mingling with a deep-seated fear for his own safety and the stability of his reign. he is a wounded lion", "lashing out to reassert dominance and crush any perceived threat", "driven by a need for control born from profound insecurity."],
        ap.active_plans = ["To publicly denounce Sejanus and strip him of all authority and legitimacy in the eyes of the Senate.", "To command the Senate to arrest Sejanus and his associates, ensuring swift and decisive action against his perceived enemies.", "To re-establish his absolute authority and instill fear, reminding Rome that even from afar, his power is absolute and inescapable."],
        ap.beliefs = ["That betrayal is the ultimate crime, deserving of swift and brutal retribution.", "That absolute power is the only guarantee of safety and order in Rome.", "That his rule is divinely ordained and essential for Rome's survival, justifying any measure to maintain it."],
        ap.goals = ["Short-term: To ensure the immediate arrest and incapacitation of Sejanus and his faction.", "Medium-term: To completely eliminate Sejanus's influence and consolidate his own power, purging any potential dissent.", "Ultimate: To secure his legacy and dynasty, ensuring the continuation of his rule and quelling any future challenges to his authority, even at the cost of justice and mercy."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Initially stunned into silence by the Quaestor\'s pronouncement, the Senator quickly snaps into pragmatic action. He is no longer a passive observer, but a man jolted into self-preservation mode, pushing through the bewildered crowd, eager to be seen reacting decisively and aligning himself with the now-dominant power. His movements are urgent, his focus entirely on navigating the shifting political landscape for personal gain.',
        ap.emotional_state = 'Fear and opportunism war within the Senator. Outwardly, he projects an air of urgent understanding and decisive action, eager to demonstrate his loyalty to the Emperor and his quick grasp of the new reality. Internally, he is likely scrambling to assess the implications of Sejanus\'s downfall for his own position, calculating how to best exploit the situation and avoid any association with the disgraced Prefect. Self-interest and a cynical pragmatism drive his every move.',
        ap.emotional_tags = ["fear", "opportunism war within the senator. outwardly, he projects an air of urgent understanding", "decisive action, eager to demonstrate his loyalty to the emperor", "his quick grasp of the new reality. internally, he is likely scrambling to assess the implications of sejanus's downfall for his own position, calculating how to best exploit the situation", "avoid any association with the disgraced prefect. self-interest", "a cynical pragmatism drive his every move.", "fear and opportunism war within the senator. outwardly", "he projects an air of urgent understanding and decisive action", "eager to demonstrate his loyalty to the emperor and his quick grasp of the new reality. internally", "he is likely scrambling to assess the implications of sejanus's downfall for his own position", "calculating how to best exploit the situation and avoid any association with the disgraced prefect. self-interest and a cynical pragmatism drive his every move."],
        ap.active_plans = ["To immediately understand the full scope of the Emperor's decree and the implications of Sejanus's fall.", "To publicly demonstrate his support for the Emperor and his condemnation of Sejanus, ensuring his allegiance is clearly visible.", "To swiftly position himself to benefit from the power vacuum created by Sejanus's downfall, seeking opportunities for personal advancement."],
        ap.beliefs = ["That power is the only true currency in Rome, and loyalty is a fluid commodity to be traded strategically.", "That self-preservation is paramount, and aligning with the strongest force is the key to survival.", "That personal advantage should always be prioritized in the chaotic game of Roman politics."],
        ap.goals = ["Short-term: To escape the Senate chamber and gather more information about the unfolding events in Rome.", "Medium-term: To secure his own position in the Senate and ensure he is not implicated in Sejanus's conspiracy.", "Ultimate: To maintain or enhance his power and influence within the Roman political system, regardless of who holds the imperial throne."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_2'})
    ON CREATE SET
        ap.current_status = 'Lost and bewildered amidst the sudden upheaval in the Senate, the Bystander embodies the confusion of the common Roman citizen. He whispers anxious questions, seeking clarity in the chaos, his presence a stark contrast to the decisive actions of the Senators. He is a passive recipient of information, struggling to comprehend the seismic shift in power and its potential impact on his life.',
        ap.emotional_state = 'Overwhelmed by confusion and anxiety, the Bystander\'s face reflects the fear of the unknown. His whispered questions betray a deep unease, a sense of being caught in forces beyond his control. He is outwardly expressing his disorientation, seeking reassurance and information, while internally grappling with the potential for instability and danger that Sejanus\'s downfall represents.',
        ap.emotional_tags = ["overwhelmed by confusion", "anxiety, the bystander's face reflects the fear of the unknown. his whispered questions betray a deep unease, a sense of being caught in forces beyond his control. he is outwardly expressing his disorientation, seeking reassurance", "information, while internally grappling with the potential for instability", "danger that sejanus's downfall represents.", "overwhelmed by confusion and anxiety", "the bystander's face reflects the fear of the unknown. his whispered questions betray a deep unease", "a sense of being caught in forces beyond his control. he is outwardly expressing his disorientation", "seeking reassurance and information", "while internally grappling with the potential for instability and danger that sejanus's downfall represents.", "overwhelmed by confusion and anxiety, the bystander's face reflects the fear of the unknown. his whispered questions betray a deep unease, a sense of being caught in forces beyond his control. he is outwardly expressing his disorientation, seeking reassurance and information,", "internally grappling with the potential for instability and danger that sejanus's downfall represents."],
        ap.active_plans = ["To understand the immediate situation and decipher the meaning of the Emperor's message.", "To seek information from those who appear to be more knowledgeable or in control of the situation.", "To assess the potential danger and consider how to protect himself and his interests in the face of political turmoil."],
        ap.beliefs = ["That political events are often opaque and unpredictable, impacting ordinary citizens without their understanding or consent.", "That powerful figures and imperial decrees shape the lives of common people, often in ways that are unclear and potentially threatening.", "That stability and order are fragile and easily disrupted by the ambitions of those in power."],
        ap.goals = ["Short-term: To gain a basic understanding of what is happening with Sejanus and the Emperor's decree.", "Medium-term: To ensure his personal safety and avoid being caught in any potential fallout from the political upheaval.", "Ultimate: To return to a state of normalcy and stability in Rome, where daily life is predictable and secure, free from the anxieties of imperial intrigue."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_19_1'})
    ON CREATE SET
        ap.current_status = 'Guard 1 stands at attention, his armor gleaming as he marches in formation with his fellow soldiers. He maintains a rigid posture, eyes forward, his movements precise and deliberate. The atmosphere is charged with tension as they advance towards the Senate steps, their presence marking a stark shift in authority, serving to intimidate any dissenting voices within the Senate.',
        ap.emotional_state = 'Guard 1 exhibits a facade of stoicism, reflecting his training and indoctrination into the military hierarchy. Outwardly calm and resolute, there’s an underlying tension in his stance that speaks to the weight of their mission. Beneath the surface, there may be flickers of doubt or fear regarding the oppressive nature of their orders, yet these emotions are suppressed in favor of obedience to authority.',
        ap.emotional_tags = ["guard 1 exhibits a facade of stoicism, reflecting his training", "indoctrination into the military hierarchy. outwardly calm", "resolute, there\u2019s an underlying tension in his stance that speaks to the weight of their mission. beneath the surface, there may be flickers of doubt or fear regarding the oppressive nature of their orders, yet these emotions are suppressed in favor of obedience to authority.", "guard 1 exhibits a facade of stoicism", "reflecting his training and indoctrination into the military hierarchy. outwardly calm and resolute", "there\u2019s an underlying tension in his stance that speaks to the weight of their mission. beneath the surface", "there may be flickers of doubt or fear regarding the oppressive nature of their orders", "yet these emotions are suppressed in favor of obedience to authority."],
        ap.active_plans = ["To secure the Senate steps and establish military control over the area.", "To maintain order and prevent any potential uprisings or dissent from senators or citizens.", "To follow the Captain's commands without question, showcasing loyalty to the Emperor's regime."],
        ap.beliefs = ["Loyalty to the Emperor is paramount, as it ensures personal safety and promotion within the ranks.", "The military's role is to enforce peace and stability, even through intimidation.", "Authority must be respected, and disobedience to orders is unacceptable, reflecting a belief in the need for order over chaos."],
        ap.goals = ["Short-term: To successfully carry out the orders given by the Captain without incident.", "Medium-term: To establish a reputation as a reliable soldier within the guard, ensuring future assignments.", "Ultimate: To contribute to the preservation of the Emperor\u2019s power and, in turn, secure a stable future for himself and his comrades."]
    ;
MERGE (oi:ObjectInvolvement {uuid: 'objectinvolvement_object_chains_event_20_3'})
    ON CREATE SET
        oi.description = 'The heavy chains are employed to physically restrain Sejanus, rendering him immobile and utterly powerless as he is brought to the execution ground. They are not merely functional restraints but potent symbols of his complete downfall and subjugation. The clanking of the chains as he moves serves as a constant, audible reminder of his loss of freedom and the irreversible nature of his fate, emphasizing the dramatic reversal of his once-unquestioned authority.',
        oi.status_before = 'The chains are likely heavy, cold iron, prepared and ready for use to bind and restrain a prisoner. They were probably stored somewhere in the Praetorian barracks or dungeons, awaiting their grim purpose in this public spectacle of justice.',
        oi.status_after = 'The chains remain on Sejanus throughout the event, continuing to bind him until his execution is complete. After his death, they would likely be removed, perhaps to be reused on other victims of imperial purges, becoming a recurring instrument of Roman tyranny and a stark symbol of its brutal power.'
    WITH oi
    MATCH (o:Object {uuid: 'object_chains'})
    MATCH (e:Event {uuid: 'event_20_3'})
    MERGE (o)-[:INVOLVED_IN]->(oi)
    MERGE (oi)-[:IN_EVENT]->(e);
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_20_1'})
    ON CREATE SET
        ap.current_status = 'Arria, a mere child amidst the brutal theater of Roman justice, thrashes against the unyielding grip of the guards. Her small body is contorted with fear and resistance, her limbs flailing in a desperate attempt to break free. Tears stream down her face as she twists her head, her voice raw and cracking as she cries out for the only protector she knows – her father.',
        ap.emotional_state = 'Terror consumes Arria, evident in her frantic struggles and piercing cries. Beneath the surface of her palpable fear lies a profound confusion; she cannot comprehend the monstrous events unfolding around her. Innocence clashes violently with the brutal reality of Roman power. There\'s a desperate hope flickering within her, a child\'s unwavering belief that her father holds the power to rescue her from this nightmare, even as the execution ground screams otherwise.',
        ap.emotional_tags = ["terror consumes arria, evident in her frantic struggles", "piercing cries. beneath the surface of her palpable fear lies a profound confusion; she cannot comprehend the monstrous events unfolding around her. innocence clashes violently with the brutal reality of roman power. there's a desperate hope flickering within her, a child's unwavering belief that her father holds the power to rescue her from this nightmare, even as the execution ground screams otherwise.", "terror consumes arria", "evident in her frantic struggles and piercing cries. beneath the surface of her palpable fear lies a profound confusion; she cannot comprehend the monstrous events unfolding around her. innocence clashes violently with the brutal reality of roman power. there's a desperate hope flickering within her", "a child's unwavering belief that her father holds the power to rescue her from this nightmare", "even as the execution ground screams otherwise.", "terror consumes arria, evident in her frantic struggles and piercing cries. beneath the surface of her palpable fear lies a profound confusion", "she cannot comprehend the monstrous events unfolding around her. innocence clashes violently with the brutal reality of roman power. there's a desperate hope flickering within her, a child's unwavering belief that her father holds the power to rescue her from this nightmare, even as the execution ground screams otherwise."],
        ap.active_plans = ["To escape the painful restraints of the guards.", "To summon her father, believing he can intervene and save her.", "To understand the incomprehensible horror that is being inflicted upon her."],
        ap.beliefs = ["Her father possesses the strength and will to protect her from any harm.", "Justice and fairness should prevail, especially for children.", "Authority figures are meant to safeguard the innocent, not persecute them."],
        ap.goals = ["Short-term: To stop the immediate pain and fear caused by the guards.", "Medium-term: To be reunited with her father and taken away from this terrifying place.", "Ultimate: To return to a life where such brutal violence and inexplicable terror do not exist."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_1'})
    ON CREATE SET
        ap.current_status = 'The Captain of the Guard 1 stands rigid, his hands firm on Arria\'s arms, yet his body language betrays a deep internal conflict. He hesitates, his gaze flickering between the terrified child and the grim execution ground. His voice, though firm in training, cracks with doubt as he articulates his moral qualms, momentarily halting the brutal machinery of execution.',
        ap.emotional_state = 'The Captain is visibly wrestling with his conscience. Outwardly, he maintains a semblance of duty, restraining Arria as ordered. However, his words and tone reveal a profound inner turmoil. He is caught between the ingrained obedience of a soldier and the innate human revulsion at executing a child, especially one deemed innocent. Unspoken is his fear of defying Macro, yet equally present is his dread of committing such a heinous act.',
        ap.emotional_tags = ["the captain is visibly wrestling with his conscience. outwardly, he maintains a semblance of duty, restraining arria as ordered. however, his words", "tone reveal a profound inner turmoil. he is caught between the ingrained obedience of a soldier", "the innate human revulsion at executing a child, especially one deemed innocent. unspoken is his fear of defying macro, yet equally present is his dread of committing such a heinous act.", "the captain is visibly wrestling with his conscience. outwardly", "he maintains a semblance of duty", "restraining arria as ordered. however", "his words and tone reveal a profound inner turmoil. he is caught between the ingrained obedience of a soldier and the innate human revulsion at executing a child", "especially one deemed innocent. unspoken is his fear of defying macro", "yet equally present is his dread of committing such a heinous act."],
        ap.active_plans = ["To carry out his orders to execute those on the list, as commanded.", "To voice his moral objections regarding the execution of a virgin child.", "To subtly delay the execution in the hope of a reprieve or change in orders, however unlikely."],
        ap.beliefs = ["He is bound by duty to obey the commands of his superiors.", "Killing a virgin is a sacrilege that will bring misfortune upon the city.", "There is a moral line that even in war and politics should not be crossed, especially concerning children."],
        ap.goals = ["Short-term: To fulfill his immediate duty without completely sacrificing his moral integrity.", "Medium-term: To avoid direct confrontation with Macro while expressing his reservations.", "Ultimate: To somehow reconcile his participation in this brutal act with his sense of self and honor, though this may prove impossible."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_2'})
    ON CREATE SET
        ap.current_status = 'Macro strides into the execution ground with an air of authority, his presence commanding respect and fear. He stands tall, eyes cold and calculating, dismissing the concerns of the Captain of the Guard with a flick of his hand, embodying the ruthless efficiency of Roman justice.',
        ap.emotional_state = 'Macro\'s surface composure reveals a chilling detachment to the moral implications of his commands. Beneath the surface, he harbors a dark satisfaction derived from enforcing the Emperor\'s will, displaying no sign of remorse or hesitation as he pushes for the execution.',
        ap.emotional_tags = ["macro's surface composure reveals a chilling detachment to the moral implications of his commands. beneath the surface", "he harbors a dark satisfaction derived from enforcing the emperor's will", "displaying no sign of remorse or hesitation as he pushes for the execution."],
        ap.active_plans = ["To maintain control over the execution ground by asserting his authority over the guards.", "To ensure the swift execution of those on the list, regardless of their age or circumstance.", "To demonstrate loyalty to Tiberius by carrying out brutal orders, further solidifying his own power."],
        ap.beliefs = ["Power must be wielded without hesitation, as weakness invites chaos.", "The lives of individuals are expendable in the pursuit of political stability.", "His role as Praetorian Prefect justifies any action taken in service of the Empire."],
        ap.goals = ["Short-term: To oversee the executions without any delay or dissent from the guards.", "Medium-term: To elevate his status within the ranks of the Praetorian Guard by showcasing his uncompromising adherence to orders.", "Ultimate: To secure his position as a key player in the power dynamics of Rome, enabling him to influence future political decisions."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_2'})
    ON CREATE SET
        ap.current_status = 'The Captain of the Guard stands conflicted, visibly trembling as he grips his weapon, torn between duty and conscience. He shifts uncomfortably, his posture stiff, as he confronts the moral weight of executing a virgin, a notion that deeply unsettles him.',
        ap.emotional_state = 'Outwardly, the Captain displays a mixture of fear and reluctance, his voice wavering as he questions the order to execute a child. Internally, he wrestles with a profound sense of guilt and horror, grappling with the implications of his role in this brutal act, revealing a chasm between personal ethics and loyalty to authority.',
        ap.emotional_tags = ["outwardly, the captain displays a mixture of fear", "reluctance, his voice wavering as he questions the order to execute a child. internally, he wrestles with a profound sense of guilt", "horror, grappling with the implications of his role in this brutal act, revealing a chasm between personal ethics", "loyalty to authority.", "outwardly", "the captain displays a mixture of fear and reluctance", "his voice wavering as he questions the order to execute a child. internally", "he wrestles with a profound sense of guilt and horror", "grappling with the implications of his role in this brutal act", "revealing a chasm between personal ethics and loyalty to authority."],
        ap.active_plans = ["To express his moral objections to Macro and delay the execution if possible.", "To protect the innocence of the girl, if only temporarily, by stalling the process.", "To find a way to circumvent the order without incurring Macro's wrath."],
        ap.beliefs = ["Every life, especially a child's, holds intrinsic value and should not be taken lightly.", "Blind obedience to authority can lead to moral corruption and personal regret.", "The execution of innocents could bring dire repercussions, both personally and for the city."],
        ap.goals = ["Short-term: To avoid executing Arria, seeking to find a way out of this horrific order.", "Medium-term: To maintain his position within the guard while upholding some sense of personal ethics.", "Ultimate: To eventually rise above the madness of Roman politics and serve in a capacity that preserves life rather than extinguishes it."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Sejanus is dragged onto the grim execution ground, his once-proud posture now slumped, his body weighed down by heavy chains. He moves with a shuffle, no longer the imposing Praetorian Prefect, but a broken man stripped of his authority and dignity. His eyes dart around, searching desperately for a glimpse of his children in this horrifying place.',
        ap.emotional_state = 'Beneath a veneer of forced composure, Sejanus is a tempest of despair and paternal anguish. His surface emotion is a desperate plea for information about his children, a raw vulnerability laid bare. Internally, he is consumed by terror and regret, the horrifying realization of his utter powerlessness crushing his spirit. The arrogance that once defined him has evaporated, replaced by the primal fear of a father for his offspring, a stark contrast to his previously ruthless persona.',
        ap.emotional_tags = ["beneath a veneer of forced composure, sejanus is a tempest of despair", "paternal anguish. his surface emotion is a desperate plea for information about his children, a raw vulnerability laid bare. internally, he is consumed by terror", "regret, the horrifying realization of his utter powerlessness crushing his spirit. the arrogance that once defined him has evaporated, replaced by the primal fear of a father for his offspring, a stark contrast to his previously ruthless persona.", "beneath a veneer of forced composure", "sejanus is a tempest of despair and paternal anguish. his surface emotion is a desperate plea for information about his children", "a raw vulnerability laid bare. internally", "he is consumed by terror and regret", "the horrifying realization of his utter powerlessness crushing his spirit. the arrogance that once defined him has evaporated", "replaced by the primal fear of a father for his offspring", "a stark contrast to his previously ruthless persona."],
        ap.active_plans = ["To ascertain the fate of his children, Arria and Junius.", "To appeal to Macro's former loyalty or any shred of humanity.", "To understand the full extent of his downfall and the consequences for his family."],
        ap.beliefs = ["He still holds onto a belief in paternal bonds, even in the face of his ruin.", "Perhaps a lingering, naive belief in the Roman concept of mercy or justice, despite the brutality surrounding him.", "He might believe that even in defeat, his status once afforded some protection to his family, now proven false."],
        ap.goals = ["Short-term: To get a truthful answer about his children's whereabouts and condition.", "Medium-term: If possible, to secure some form of protection or clemency for his children (though realistically, it's likely too late).", "Ultimate: To face his execution knowing the fate of his children, even if it's a grim truth, rather than being tormented by uncertainty."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_3'})
    ON CREATE SET
        ap.current_status = 'Macro strides onto the execution ground with an air of cold authority, his Praetorian armor gleaming dully in the harsh daylight. He observes the scene with detached efficiency, his movements precise and purposeful as he directs the guards and addresses the distraught Captain. He approaches Sejanus with a chilling lack of emotion, embodying the ruthless hand of imperial justice.',
        ap.emotional_state = 'Macro\'s emotional state is characterized by a chilling detachment and ruthless pragmatism. Outwardly, he displays cold efficiency and unwavering resolve in carrying out his orders. Internally, he is likely suppressing any personal feelings, focusing solely on his duty to the Emperor and the brutal necessities of Roman power. There is no hint of empathy or remorse, only the cold calculation of a man accustomed to violence and unquestioning obedience. His tone and demeanor are dismissive and devoid of any former camaraderie.',
        ap.emotional_tags = ["macro's emotional state is characterized by a chilling detachment", "ruthless pragmatism. outwardly, he displays cold efficiency", "unwavering resolve in carrying out his orders. internally, he is likely suppressing any personal feelings, focusing solely on his duty to the emperor", "the brutal necessities of roman power. there is no hint of empathy or remorse, only the cold calculation of a man accustomed to violence", "unquestioning obedience. his tone", "demeanor are dismissive", "devoid of any former camaraderie.", "macro's emotional state is characterized by a chilling detachment and ruthless pragmatism. outwardly", "he displays cold efficiency and unwavering resolve in carrying out his orders. internally", "he is likely suppressing any personal feelings", "focusing solely on his duty to the emperor and the brutal necessities of roman power. there is no hint of empathy or remorse", "only the cold calculation of a man accustomed to violence and unquestioning obedience. his tone and demeanor are dismissive and devoid of any former camaraderie."],
        ap.active_plans = ["To oversee the swift and brutal execution of all those on Tiberius's list, including Sejanus and his children.", "To quash any potential dissent or hesitation from the guards, ensuring the executions proceed without delay.", "To assert his authority and demonstrate his unwavering loyalty to Tiberius by carrying out these gruesome tasks efficiently."],
        ap.beliefs = ["Unquestioning obedience to imperial orders is paramount, regardless of personal feelings or moral qualms.", "Ruthless efficiency and pragmatism are essential for maintaining order and power in Rome.", "Sentimentality and compassion are weaknesses that have no place in the brutal realities of Roman politics."],
        ap.goals = ["Short-term: To ensure the immediate executions are carried out swiftly and without incident.", "Medium-term: To solidify his position as the ruthless enforcer of Tiberius's will, replacing Sejanus in the Emperor's favor.", "Ultimate: To maintain and increase his own power and influence within the Roman power structure by demonstrating unwavering loyalty and effectiveness."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_21_1'})
    ON CREATE SET
        ap.current_status = 'Livilla is locked in a room, banging on the door with increasing desperation. Her frantic pleas to her mother resonate through the air, infused with panic as she repeatedly cries out for release, showcasing her physicality and emotional turmoil behind the closed door.',
        ap.emotional_state = 'Livilla\'s outward expression is one of sheer terror and desperation, her voice rising in pitch as she appeals for her mother\'s mercy. Internally, she grapples with feelings of betrayal and hopelessness, realizing the gravity of her situation. The conflict between her prior ambition and the stark reality of her entrapment creates a poignant juxtaposition.',
        ap.emotional_tags = ["livilla's outward expression is one of sheer terror", "desperation, her voice rising in pitch as she appeals for her mother's mercy. internally, she grapples with feelings of betrayal", "hopelessness, realizing the gravity of her situation. the conflict between her prior ambition", "the stark reality of her entrapment creates a poignant juxtaposition.", "livilla's outward expression is one of sheer terror and desperation", "her voice rising in pitch as she appeals for her mother's mercy. internally", "she grapples with feelings of betrayal and hopelessness", "realizing the gravity of her situation. the conflict between her prior ambition and the stark reality of her entrapment creates a poignant juxtaposition."],
        ap.active_plans = ["To plead with her mother for freedom and understanding.", "To evoke any flicker of compassion from Antonia that may sway her judgment.", "To mentally strategize a way to escape her dire circumstances."],
        ap.beliefs = ["She believes her mother still loves her despite the betrayal.", "Livilla holds on to the notion that family bonds can be stronger than ambition.", "She believes that through emotional appeals, she can sway her mother's decision."],
        ap.goals = ["Short-term: To escape from her imprisonment and regain her freedom.", "Medium-term: To reconcile with her mother and restore familial ties.", "Ultimate: To reclaim her position and power within the Imperial family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Claudius bursts into Antonia\'s austere chambers, his movements agitated and rushed. He paces and gestures with frantic energy, his body language conveying a deep unease and urgent need to intervene. He confronts Antonia directly, his presence disrupting the heavy stillness of the room as he pleads for Livilla\'s release.',
        ap.emotional_state = 'Claudius is profoundly distraught and agitated, his stammer amplified by his emotional turmoil. Outwardly, he expresses shock and horror at Antonia\'s pronouncement, his tone laced with disbelief and desperation. Beneath the surface, he is grappling with a deep sense of moral conflict and compassion for Livilla, unable to reconcile Antonia\'s cold resolve with his own sense of familial duty and mercy. He is emotionally overwhelmed by the brutality of Antonia\'s decision and the suffering it entails.',
        ap.emotional_tags = ["claudius is profoundly distraught", "agitated, his stammer amplified by his emotional turmoil. outwardly, he expresses shock", "horror at antonia's pronouncement, his tone laced with disbelief", "desperation. beneath the surface, he is grappling with a deep sense of moral conflict", "compassion for livilla, unable to reconcile antonia's cold resolve with his own sense of familial duty", "mercy. he is emotionally overwhelmed by the brutality of antonia's decision", "the suffering it entails.", "claudius is profoundly distraught and agitated", "his stammer amplified by his emotional turmoil. outwardly", "he expresses shock and horror at antonia's pronouncement", "his tone laced with disbelief and desperation. beneath the surface", "he is grappling with a deep sense of moral conflict and compassion for livilla", "unable to reconcile antonia's cold resolve with his own sense of familial duty and mercy. he is emotionally overwhelmed by the brutality of antonia's decision and the suffering it entails."],
        ap.active_plans = ["To persuade Antonia to reconsider her extreme punishment for Livilla.", "To appeal to Antonia's maternal instincts and sense of compassion.", "To understand the full extent of Antonia's intentions and find a way to mitigate Livilla's suffering."],
        ap.beliefs = ["Family, even when flawed, should be treated with a degree of compassion and mercy.", "Death by confinement is an excessively cruel and inhumane punishment, even for grave offenses.", "Reason and dialogue should always be attempted before resorting to irreversible acts of violence or cruelty within a family."],
        ap.goals = ["Short-term: To immediately stop Livilla's slow death by confinement and secure her release from the locked room.", "Medium-term: To find a more just and less brutal form of punishment for Livilla, if punishment is indeed necessary.", "Ultimate: To preserve some semblance of familial unity and prevent further descent into brutality and irreversible acts of vengeance within his family."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_2'})
    ON CREATE SET
        ap.current_status = 'Antonia remains seated and utterly still, her posture rigid and unyielding. She sits impassively, a statue carved from ice, seemingly unaffected by Livilla\'s desperate cries and Claudius\'s emotional outburst. Her physical stillness is a stark contrast to the turmoil around her, emphasizing her iron resolve and emotional detachment from the unfolding horror.',
        ap.emotional_state = 'Antonia projects an image of cold, unwavering resolve, her face a mask of impassivity, her voice devoid of warmth.  On the surface, she appears to be executing a dispassionate act of justice. However, internally, she is enduring a profound emotional agony. The decision to condemn her own daughter to death is a devastating act, born from a place of deep betrayal and wounded maternal pride. Her impassivity is a shield, concealing a heart shattered by Livilla\'s treachery and hardened by the grim necessities of Roman justice. She is a woman wrestling with unbearable grief, choosing to embody Roman stoicism as a means of survival.',
        ap.emotional_tags = ["antonia projects an image of cold, unwavering resolve, her face a mask of impassivity, her voice devoid of warmth.  on the surface, she appears to be executing a dispassionate act of justice. however, internally, she is enduring a profound emotional agony. the decision to condemn her own daughter to death is a devastating act, born from a place of deep betrayal", "wounded maternal pride. her impassivity is a shield, concealing a heart shattered by livilla's treachery", "hardened by the grim necessities of roman justice. she is a woman wrestling with unbearable grief, choosing to embody roman stoicism as a means of survival.", "antonia projects an image of cold", "unwavering resolve", "her face a mask of impassivity", "her voice devoid of warmth.  on the surface", "she appears to be executing a dispassionate act of justice. however", "internally", "she is enduring a profound emotional agony. the decision to condemn her own daughter to death is a devastating act", "born from a place of deep betrayal and wounded maternal pride. her impassivity is a shield", "concealing a heart shattered by livilla's treachery and hardened by the grim necessities of roman justice. she is a woman wrestling with unbearable grief", "choosing to embody roman stoicism as a means of survival."],
        ap.active_plans = ["To ensure Livilla's death as punishment for her crimes and betrayal.", "To remain resolute and unmoved by any pleas for mercy, including Claudius's.", "To endure her own suffering as a necessary component of delivering justice and upholding her moral convictions."],
        ap.beliefs = ["Livilla's actions are unforgivable and demand the ultimate price.", "Justice, in its most severe form, is necessary to cleanse the family and Roman society of such treachery.", "As the matriarch of her family, she has the authority and duty to enforce justice, even if it means sacrificing her own daughter."],
        ap.goals = ["Short-term: To remain in her chambers until Livilla dies, ensuring the punishment is carried out.", "Medium-term: To restore a sense of honor and order to her family in the wake of Livilla's destructive actions.", "Ultimate: To uphold Roman moral values and demonstrate that even familial bonds cannot excuse or protect against the consequences of grave crimes, even at immense personal cost."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Antonia sits impassively in her austere chambers, exuding an oppressive calmness. She remains composed and unwavering, despite the turmoil outside the locked door. Her posture is rigid, reflecting her resolve to carry out her chosen course of action without hesitation.',
        ap.emotional_state = 'Antonia\'s surface demeanor is cold and resolute, betraying no emotion as she delivers her daughter\'s brutal fate. Internally, she grapples with the weight of her decision, a mixture of maternal anguish and fierce resolve. Her emotional conflicts reveal a mother torn between love and justice, showcasing her complex inner turmoil.',
        ap.emotional_tags = ["antonia's surface demeanor is cold", "resolute, betraying no emotion as she delivers her daughter's brutal fate. internally, she grapples with the weight of her decision, a mixture of maternal anguish", "fierce resolve. her emotional conflicts reveal a mother torn between love", "justice, showcasing her complex inner turmoil.", "antonia's surface demeanor is cold and resolute", "betraying no emotion as she delivers her daughter's brutal fate. internally", "she grapples with the weight of her decision", "a mixture of maternal anguish and fierce resolve. her emotional conflicts reveal a mother torn between love and justice", "showcasing her complex inner turmoil."],
        ap.active_plans = ["To enforce Livilla's punishment by keeping her imprisoned until death.", "To bear the burden of listening to her daughter's demise, demonstrating her maternal conviction in the face of betrayal.", "To assert her authority and restore order following Livilla's treachery, solidifying her role as the matriarch."],
        ap.beliefs = ["She believes in the necessity of harsh justice for betrayal, reinforcing her moral stance.", "She holds that personal sacrifice is a part of her duty as a mother and leader.", "She is convinced that Livilla's actions warrant severe consequences, reflecting her unwavering commitment to familial honor."],
        ap.goals = ["Short-term: To ensure Livilla remains imprisoned without intervention.", "Medium-term: To demonstrate her power and control within the family and court.", "Ultimate: To restore the integrity of her family name and eliminate the threat posed by Livilla's ambition."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'})
    ON CREATE SET
        ap.current_status = 'Claudius enters the dark chamber in a state of distress, visibly agitated. His movements reflect urgency as he approaches Antonia with a pleading demeanor, arms gesturing animatedly as he implores her to release Livilla from her grim fate.',
        ap.emotional_state = 'Claudius exhibits a deep sense of alarm and desperation, his voice trembling with concern for Livilla\'s life. Internally, his emotional turmoil is compounded by fear and moral outrage, reflecting a profound conflict between his familial loyalty and the harsh realities of Roman justice. He is caught in a web of compassion and helplessness.',
        ap.emotional_tags = ["claudius exhibits a deep sense of alarm", "desperation, his voice trembling with concern for livilla's life. internally, his emotional turmoil is compounded by fear", "moral outrage, reflecting a profound conflict between his familial loyalty", "the harsh realities of roman justice. he is caught in a web of compassion", "helplessness.", "claudius exhibits a deep sense of alarm and desperation", "his voice trembling with concern for livilla's life. internally", "his emotional turmoil is compounded by fear and moral outrage", "reflecting a profound conflict between his familial loyalty and the harsh realities of roman justice. he is caught in a web of compassion and helplessness."],
        ap.active_plans = ["To persuade Antonia to reconsider Livilla's punishment and release her.", "To express his moral outrage and disapproval of the sentence being imposed.", "To protect Livilla, showcasing his loyalty to his family amidst the chaos."],
        ap.beliefs = ["He believes that family bonds should override the harshness of punishment.", "He holds that mercy is a crucial virtue, especially in familial relationships.", "He is convinced that Antonia's decision is driven by madness rather than justice, highlighting his deep concern for their family's integrity."],
        ap.goals = ["Short-term: To prevent Livilla from being left to die in her imprisonment.", "Medium-term: To maintain some semblance of family unity amidst the chaos.", "Ultimate: To challenge the brutal norms of Roman justice and advocate for compassion."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_1'})
    ON CREATE SET
        ap.current_status = 'Aelia bursts into Claudius\'s private villa in a state of extreme distress, her physical presence marked by frantic movements and desperate gestures. She repeatedly calls out Claudius\'s name, her voice filled with terror as she throws herself upon him for help. She emphasizes her marital status, clinging to the idea that it should afford her protection from the widespread violence engulfing Rome.',
        ap.emotional_state = 'Aelia is consumed by raw terror, her surface emotions a whirlwind of panic and desperation. Her pleas are laced with hysteria as she recounts the gruesome executions. Beneath this outward display of fear lies a profound self-preservation instinct; her actions are driven purely by a desire to escape death. There\'s a calculated element to her appeal, leveraging her position as Claudius\'s wife, though her fear seems genuine and overwhelming.',
        ap.emotional_tags = ["aelia is consumed by raw terror, her surface emotions a whirlwind of panic", "desperation. her pleas are laced with hysteria as she recounts the gruesome executions. beneath this outward display of fear lies a profound self-preservation instinct; her actions are driven purely by a desire to escape death. there's a calculated element to her appeal, leveraging her position as claudius's wife, though her fear seems genuine", "overwhelming.", "aelia is consumed by raw terror", "her surface emotions a whirlwind of panic and desperation. her pleas are laced with hysteria as she recounts the gruesome executions. beneath this outward display of fear lies a profound self-preservation instinct; her actions are driven purely by a desire to escape death. there's a calculated element to her appeal", "leveraging her position as claudius's wife", "though her fear seems genuine and overwhelming.", "aelia is consumed by raw terror, her surface emotions a whirlwind of panic and desperation. her pleas are laced with hysteria as she recounts the gruesome executions. beneath this outward display of fear lies a profound self-preservation instinct", "her actions are driven purely by a desire to escape death. there's a calculated element to her appeal, leveraging her position as claudius's wife, though her fear seems genuine and overwhelming."],
        ap.active_plans = ["Seek immediate refuge and safety within Claudius's villa, believing it to be a sanctuary.", "Exploit her marital bond with Claudius, hoping to trigger his obligation and secure his protection.", "Evade the widespread executions and political purges taking place across Rome, ensuring her own survival."],
        ap.beliefs = ["In times of political upheaval, personal safety is the utmost priority.", "Marriage, even if politically motivated, should offer a degree of protection and security.", "Claudius, as her husband, is obligated to safeguard her life, regardless of their personal relationship."],
        ap.goals = ["Short-term: To find immediate physical safety and escape the immediate threat of execution.", "Medium-term: To secure long-term protection from the political violence and ensure her continued survival within the dangerous Roman landscape.", "Ultimate: To navigate the political turmoil and emerge unscathed, potentially leveraging her connections, including her marriage to Claudius, to maintain her position and status."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially in his private villa, seemingly engaged in his scholarly pursuits or seeking solitude, before being abruptly confronted by Aelia\'s frantic entrance. He physically recoils from her desperate pleas, his posture shifting from one of detachment to repulsion. He ultimately commands her to leave his villa, rejecting her pleas for help and severing their connection with a definitive dismissal.',
        ap.emotional_state = 'Claudius\'s initial emotional state is one of annoyance and detachment, disturbed by Aelia\'s hysterical intrusion into his private space. As Aelia details the atrocities in Rome—the brutal executions, the horrific fate of children—his detachment gives way to a profound moral outrage and disgust. While he verbally expresses intense condemnation of Rome\'s depravity, his actions reveal a conflicting internal state. He is moved by the horror, yet his primary emotional driver is self-preservation, leading him to reject Aelia’s plea and prioritize his own safety over compassion for her or the victims of the purges.',
        ap.emotional_tags = ["claudius's initial emotional state is one of annoyance", "detachment, disturbed by aelia's hysterical intrusion into his private space. as aelia details the atrocities in rome\u2014the brutal executions, the horrific fate of children\u2014his detachment gives way to a profound moral outrage", "disgust. while he verbally expresses intense condemnation of rome's depravity, his actions reveal a conflicting internal state. he is moved by the horror, yet his primary emotional driver is self-preservation, leading him to reject aelia\u2019s plea", "prioritize his own safety over compassion for her or the victims of the purges.", "claudius's initial emotional state is one of annoyance and detachment", "disturbed by aelia's hysterical intrusion into his private space. as aelia details the atrocities in rome\u2014the brutal executions", "the horrific fate of children\u2014his detachment gives way to a profound moral outrage and disgust. while he verbally expresses intense condemnation of rome's depravity", "his actions reveal a conflicting internal state. he is moved by the horror", "yet his primary emotional driver is self-preservation", "leading him to reject aelia\u2019s plea and prioritize his own safety over compassion for her or the victims of the purges."],
        ap.active_plans = ["Maintain his physical and emotional distance from Aelia and the unfolding chaos to avoid being implicated or endangered by association with Sejanus's family.", "Assert his authority within his own villa, reclaiming his personal space from Aelia's disruptive and unwanted presence.", "Express his moral disgust at the events in Rome verbally, allowing himself a release of emotion without taking any action that might compromise his own safety or position."],
        ap.beliefs = ["Personal safety and detachment are paramount for survival in politically turbulent times.", "Aelia represents a dangerous liability due to her connections with Sejanus's disgraced family.", "While the brutality in Rome is morally reprehensible, direct intervention or assistance is too risky and not his responsibility."],
        ap.goals = ["Short-term: To immediately remove Aelia from his villa and end her frantic appeal, restoring his personal space and emotional equilibrium.", "Medium-term: To formally sever all ties with Aelia and her family, ensuring no lingering connection to the disgraced Sejanus and solidifying his distance from the political purges.", "Ultimate: To survive the current crisis by remaining politically neutral and detached, preserving himself through scholarly pursuits and moral observation rather than direct involvement, while maintaining a semblance of moral integrity by verbally condemning the brutality."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_2'})
    ON CREATE SET
        ap.current_status = 'Aelia bursts into Claudius\'s villa, her physical presence marked by frantic gestures and wide, terrified eyes. She is agitated, her hands trembling as she clutches at Claudius\'s arm, pleading for his protection amidst the chaos outside. Her posture is hunched, embodying desperation as she implores him to save her from the impending violence sweeping through Rome.',
        ap.emotional_state = 'Surface emotions reveal Aelia\'s terror and panic; her voice quakes with fear as she recounts the brutal murders occurring in the city. Internally, she grapples with a primal instinct for self-preservation, desperate to cling to Claudius for safety. Unspoken conflicts arise as her pleas juxtapose with a potential awareness that her survival hinges on the very political machinations she is ensnared within.',
        ap.emotional_tags = ["surface emotions reveal aelia's terror", "panic; her voice quakes with fear as she recounts the brutal murders occurring in the city. internally, she grapples with a primal instinct for self-preservation, desperate to cling to claudius for safety. unspoken conflicts arise as her pleas juxtapose with a potential awareness that her survival hinges on the very political machinations she is ensnared within.", "surface emotions reveal aelia's terror and panic; her voice quakes with fear as she recounts the brutal murders occurring in the city. internally", "she grapples with a primal instinct for self-preservation", "desperate to cling to claudius for safety. unspoken conflicts arise as her pleas juxtapose with a potential awareness that her survival hinges on the very political machinations she is ensnared within.", "surface emotions reveal aelia's terror and panic", "her voice quakes with fear as she recounts the brutal murders occurring in the city. internally, she grapples with a primal instinct for self-preservation, desperate to cling to claudius for safety. unspoken conflicts arise as her pleas juxtapose with a potential awareness that her survival hinges on the very political machinations she is ensnared within."],
        ap.active_plans = ["Seek refuge with Claudius to avoid capture and potential death.", "Appeal to Claudius's sense of duty as her husband to protect her.", "Manipulate Claudius's sympathies by emphasizing the brutality inflicted upon innocents, including children."],
        ap.beliefs = ["Family loyalty must take precedence over political affiliations.", "Survival is paramount in the treacherous political landscape of Rome.", "Love and devotion can compel Claudius to act decisively."],
        ap.goals = ["Short-term: Secure a safe haven from the violence in Rome.", "Medium-term: Reestablish her position and influence within the Imperial household.", "Ultimate: Ensure the survival of herself and her family amidst the chaos."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_2'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in his private quarters, initially immobilized by disbelief at Aelia\'s frantic arrival. His posture reflects shock, with a slightly open mouth as he processes the horror of her words. As the gravity of the situation sinks in, he shifts from passive observer to active participant, his movements becoming more animated as he expresses outrage and despair at the atrocities recounted.',
        ap.emotional_state = 'Claudius\'s surface emotions oscillate between disbelief and horror, his usual scholarly demeanor shattered by the brutal realities Aelia presents. Internally, he experiences a tumultuous mix of anger, fear, and moral outrage, revealing a deep-seated sensitivity that contrasts with his desire to remain detached. The tension between his academic inclination toward analysis and the visceral emotional response to the violence reveals a profound inner conflict.',
        ap.emotional_tags = ["claudius's surface emotions oscillate between disbelief", "horror, his usual scholarly demeanor shattered by the brutal realities aelia presents. internally, he experiences a tumultuous mix of anger, fear,", "moral outrage, revealing a deep-seated sensitivity that contrasts with his desire to remain detached. the tension between his academic inclination toward analysis", "the visceral emotional response to the violence reveals a profound inner conflict.", "claudius's surface emotions oscillate between disbelief and horror", "his usual scholarly demeanor shattered by the brutal realities aelia presents. internally", "he experiences a tumultuous mix of anger", "fear", "and moral outrage", "revealing a deep-seated sensitivity that contrasts with his desire to remain detached. the tension between his academic inclination toward analysis and the visceral emotional response to the violence reveals a profound inner conflict."],
        ap.active_plans = ["Process the shocking information about the executions and political purges in Rome.", "Attempt to comprehend the implications of these events on his own safety and that of Aelia.", "Determine whether to take action to protect Aelia or to distance himself from her amidst the chaos."],
        ap.beliefs = ["The preservation of human life, especially the innocent, is paramount.", "Political power and ambition often lead to moral corruption and violence.", "Inaction in the face of tyranny is tantamount to complicity."],
        ap.goals = ["Short-term: Understand the extent of the violence to assess his and Aelia's safety.", "Medium-term: Decide whether to intervene against the ongoing atrocities.", "Ultimate: Navigate the treacherous political landscape to ensure his own survival and potentially that of Rome."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_3'})
    ON CREATE SET
        ap.current_status = 'Aelia bursts into Claudius\'s villa, physically invading his private space in a state of extreme agitation. She is clinging to Claudius, grabbing at him and pleading desperately for protection, her body language conveying utter terror and vulnerability as she seeks refuge from the escalating violence in Rome.',
        ap.emotional_state = 'Aelia is consumed by raw, palpable fear for her life. Outwardly, this manifests as frantic pleas, cries for help, and panicked statements about the widespread executions. Internally, she is driven by a primal survival instinct, overriding any semblance of composure. Her desperation is so profound that she declares she will do \'anything\' to be saved, highlighting a complete abandonment of pride in favor of self-preservation. There\'s a stark absence of genuine emotional connection to Claudius; her appeal is purely transactional, based on their marital status as a means to an end.',
        ap.emotional_tags = ["aelia is consumed by raw, palpable fear for her life. outwardly, this manifests as frantic pleas, cries for help,", "panicked statements about the widespread executions. internally, she is driven by a primal survival instinct, overriding any semblance of composure. her desperation is so profound that she declares she will do 'anything' to be saved, highlighting a complete abandonment of pride in favor of self-preservation. there's a stark absence of genuine emotional connection to claudius; her appeal is purely transactional, based on their marital status as a means to an end.", "aelia is consumed by raw", "palpable fear for her life. outwardly", "this manifests as frantic pleas", "cries for help", "and panicked statements about the widespread executions. internally", "she is driven by a primal survival instinct", "overriding any semblance of composure. her desperation is so profound that she declares she will do 'anything' to be saved", "highlighting a complete abandonment of pride in favor of self-preservation. there's a stark absence of genuine emotional connection to claudius; her appeal is purely transactional", "based on their marital status as a means to an end.", "aelia is consumed by raw, palpable fear for her life. outwardly, this manifests as frantic pleas, cries for help, and panicked statements about the widespread executions. internally, she is driven by a primal survival instinct, overriding any semblance of composure. her desperation is so profound that she declares she will do 'anything' to be saved, highlighting a complete abandonment of pride in favor of self-preservation. there's a stark absence of genuine emotional connection to claudius", "her appeal is purely transactional, based on their marital status as a means to an end."],
        ap.active_plans = ["Secure immediate safety within Claudius's villa as a temporary sanctuary.", "Exploit her marital bond with Claudius to compel him to offer protection.", "Evade capture and execution by hiding and remaining concealed from authorities.", "Plead with Claudius in an emotionally manipulative manner to elicit sympathy and aid."],
        ap.beliefs = ["Marriage entails an obligation for protection, regardless of affection or respect.", "Claudius, despite his perceived weakness, is her only viable chance for survival in this crisis.", "The threat of execution is immediate and indiscriminate, applying to anyone connected to the purged faction.", "Personal dignity and societal standing are secondary to the fundamental need to survive."],
        ap.goals = ["short-term\": \"To immediately find a safe hiding place and avoid being apprehended by those carrying out the executions.", "medium-term\": \"To convince Claudius to provide ongoing shelter and protection, ensuring her continued survival beyond the immediate threat.", "ultimate\": \"To escape the deadly political purges unscathed and resume a life of safety, even if it means sacrificing her marriage and social standing in the process."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_3'})
    ON CREATE SET
        ap.current_status = 'Claudius is initially in his private villa, likely engaged in scholarly pursuits or seeking refuge from the palace intrigues, when Aelia\'s frantic entrance shatters his peace. He listens to her terrified outburst with a growing shift from initial detachment to horrified attention, his physical stillness contrasting sharply with Aelia\'s frenzied energy, until he decisively orders her to leave, physically and emotionally distancing himself.',
        ap.emotional_state = 'Claudius begins with a degree of detached annoyance at Aelia\'s dramatic interruption, reflecting his usual scholarly aloofness. However, as she recounts the brutal details of the executions – especially the atrocities committed against children – a profound moral outrage ignites within him. This surfaces as his condemnation of Rome as \'despicable,\' revealing a deep-seated ethical sensitivity beneath his pragmatic exterior.  Internally, he is wrestling with the horror of the events and a growing desire to separate himself from the implicated and now dangerous Aelia, prioritizing his own safety and moral integrity.',
        ap.emotional_tags = ["claudius begins with a degree of detached annoyance at aelia's dramatic interruption, reflecting his usual scholarly aloofness. however, as she recounts the brutal details of the executions \u2013 especially the atrocities committed against children \u2013 a profound moral outrage ignites within him. this surfaces as his condemnation of rome as 'despicable,' revealing a deep-seated ethical sensitivity beneath his pragmatic exterior.  internally, he is wrestling with the horror of the events", "a growing desire to separate himself from the implicated", "now dangerous aelia, prioritizing his own safety", "moral integrity.", "claudius begins with a degree of detached annoyance at aelia's dramatic interruption", "reflecting his usual scholarly aloofness. however", "as she recounts the brutal details of the executions \u2013 especially the atrocities committed against children \u2013 a profound moral outrage ignites within him. this surfaces as his condemnation of rome as 'despicable", "' revealing a deep-seated ethical sensitivity beneath his pragmatic exterior.  internally", "he is wrestling with the horror of the events and a growing desire to separate himself from the implicated and now dangerous aelia", "prioritizing his own safety and moral integrity."],
        ap.active_plans = ["Maintain emotional and physical distance from Aelia's panic and desperation to avoid being drawn into the chaos.", "Express his moral disgust and condemnation of the violence in Rome, asserting his ethical stance.", "Sever all ties with Aelia decisively by ordering her to leave and rejecting her pleas for help, ensuring his own safety from association.", "Reaffirm his detachment from the brutal political realities by retreating back into his scholarly pursuits after Aelia's departure, as implied by the subsequent voice-over."],
        ap.beliefs = ["Personal detachment and non-involvement are his best strategies for surviving the dangerous political climate.", "The extreme violence and moral decay in Rome are abhorrent and signify a deep societal corruption.", "Maintaining a clear separation from individuals associated with the disgraced faction, like Aelia, is crucial for self-preservation.", "His familial connection to Antonia provides a level of inherent protection that Aelia, as part of Sejanus's family, does not possess."],
        ap.goals = ["short-term\": \"To expel Aelia from his villa immediately and restore his peace and solitude, removing the immediate source of panic and potential danger.", "medium-term\": \"To publicly and definitively dissociate himself from Aelia and, by extension, from Sejanus's disgraced family to ensure his continued safety and imperial favor.", "ultimate\": \"To navigate the treacherous political landscape and survive the purges, leveraging his lineage and cautious pragmatism, while maintaining a semblance of moral integrity amidst the corruption, ultimately returning to his preferred life of scholarship and relative safety."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_4'})
    ON CREATE SET
        ap.current_status = 'Aelia bursts into Claudius\'s private quarters, her actions driven by fear and desperation. She paces frantically, gesturing wildly as she pleads for help, her voice trembling and urgent as she recounts the horrors taking place outside.',
        ap.emotional_state = 'Aelia is visibly terrified, her face pale and eyes wide with panic as she expresses her fear of impending death. Beneath the surface, her desperation hints at a fierce survival instinct, grappling with the reality of a collapsing power structure that threatens her very existence.',
        ap.emotional_tags = ["aelia is visibly terrified, her face pale", "eyes wide with panic as she expresses her fear of impending death. beneath the surface, her desperation hints at a fierce survival instinct, grappling with the reality of a collapsing power structure that threatens her very existence.", "aelia is visibly terrified", "her face pale and eyes wide with panic as she expresses her fear of impending death. beneath the surface", "her desperation hints at a fierce survival instinct", "grappling with the reality of a collapsing power structure that threatens her very existence."],
        ap.active_plans = ["To convince Claudius to protect her from the political purges occurring in Rome.", "To secure a hiding place within Claudius's villa, believing it to be a sanctuary against the chaos outside.", "To leverage her identity as his wife to elicit sympathy and protection from Claudius."],
        ap.beliefs = ["Survival is paramount, and she must do whatever it takes to protect herself.", "Claudius, as her husband, has a duty to safeguard her from the dangers of the political environment.", "The loyalty and support of allies, even in times of crisis, are crucial for survival."],
        ap.goals = ["Short-term: To persuade Claudius to hide her and keep her safe from the violence.", "Medium-term: To stabilize her position and reclaim a sense of security in her marriage.", "Ultimate: To ensure her survival and the continued protection of her family amidst the turmoil of Roman politics."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_4'})
    ON CREATE SET
        ap.current_status = 'Claudius stands in his villa, initially detached and overtly dismissive of Aelia\'s frantic pleas. He exhibits physical tension, his posture stiffening as the horror of Aelia\'s words sinks in, his expressions shifting from confusion to outrage.',
        ap.emotional_state = 'Claudius\'s surface demeanor is one of irritation and frustration, indicated by his sharp, dismissive tone. Yet beneath this lies a brewing moral outrage and a keen awareness of the brutal events unfolding in Rome, contributing to his feelings of helplessness and despair.',
        ap.emotional_tags = ["claudius's surface demeanor is one of irritation", "frustration, indicated by his sharp, dismissive tone. yet beneath this lies a brewing moral outrage", "a keen awareness of the brutal events unfolding in rome, contributing to his feelings of helplessness", "despair.", "claudius's surface demeanor is one of irritation and frustration", "indicated by his sharp", "dismissive tone. yet beneath this lies a brewing moral outrage and a keen awareness of the brutal events unfolding in rome", "contributing to his feelings of helplessness and despair."],
        ap.active_plans = ["To distance himself from Aelia and the chaos resulting from the political purges.", "To protect his own life and status amidst the unfolding treachery without directly involving himself in Aelia's pleas.", "To reclaim agency over his own destiny by rejecting Aelia's emotional manipulations."],
        ap.beliefs = ["Survival in the turbulent political landscape requires detachment and pragmatism.", "Emotional connections can be a liability in times of danger and betrayal.", "The chaos of Rome reflects a deeper moral failing that cannot be ignored."],
        ap.goals = ["Short-term: To assert control over his life by rejecting Aelia's desperate pleas.", "Medium-term: To navigate the political upheaval without being drawn into personal conflict.", "Ultimate: To maintain his own safety and sanity in a world rife with betrayal and violence."]
    ;
MERGE (ap:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_5'})
    ON CREATE SET
        ap.current_status = 'Claudius is physically absent from the immediate scene, existing solely as a voiceover narrator reflecting on past events. He is in a contemplative state, likely removed from the immediate chaos described by Aelia, calmly recounting and analyzing his past situation and decisions regarding his marriage to Aelia and its connection to Sejanus\'s downfall. He is positioned as an observer and retrospective commentator, delivering his analysis directly to the audience.',
        ap.emotional_state = 'Beneath a veneer of detached analysis, Claudius harbors a deep-seated moral outrage at the brutality of Rome, expressed in his passionate outburst \'Despicable! Despicable!\'. However, his tone in the voiceover is largely measured and pragmatic. He reveals a sense of relief at having survived the political turmoil, acknowledging the potential danger of his past alliance. There is a subtle undercurrent of cynicism, particularly regarding Aelia\'s motives and his own past naivety in entering the alliance, now replaced by a hardened understanding of Roman politics.',
        ap.emotional_tags = ["beneath a veneer of detached analysis, claudius harbors a deep-seated moral outrage at the brutality of rome, expressed in his passionate outburst 'despicable! despicable!'. however, his tone in the voiceover is largely measured", "pragmatic. he reveals a sense of relief at having survived the political turmoil, acknowledging the potential danger of his past alliance. there is a subtle undercurrent of cynicism, particularly regarding aelia's motives", "his own past naivety in entering the alliance, now replaced by a hardened understanding of roman politics.", "beneath a veneer of detached analysis", "claudius harbors a deep-seated moral outrage at the brutality of rome", "expressed in his passionate outburst 'despicable! despicable!'. however", "his tone in the voiceover is largely measured and pragmatic. he reveals a sense of relief at having survived the political turmoil", "acknowledging the potential danger of his past alliance. there is a subtle undercurrent of cynicism", "particularly regarding aelia's motives and his own past naivety in entering the alliance", "now replaced by a hardened understanding of roman politics."],
        ap.active_plans = ["To analyze and understand the dangers of his past political alliances, specifically his marriage to Aelia and its connection to Sejanus.", "To justify his past actions, particularly his divorce from Aelia and the return of her dowry, as strategically sound decisions for his survival.", "To convey a sense of learned wisdom and political acumen to the audience, positioning himself as someone who has navigated treacherous waters and emerged wiser."],
        ap.beliefs = ["Political alliances in Rome are inherently dangerous and can quickly become liabilities.", "Survival in Roman politics requires pragmatism, detachment, and a willingness to sever ties when necessary.", "Family connections, especially through marriage, can be as much of a threat as a benefit in the cutthroat world of Roman power."],
        ap.goals = ["short_term\": \"To accurately recount and interpret the events surrounding Sejanus's downfall and his own precarious position within it.", "medium_term\": \"To establish his narrative as a lesson learned, demonstrating his ability to survive and adapt in the dangerous Roman political landscape.", "ultimate\": \"To position himself as a shrewd and insightful survivor, capable of understanding and navigating the complexities of Roman power, implicitly justifying his future actions and decisions."]
    ;
MATCH (s:Scene {uuid: 'scene_1'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_apicata'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_1'}),
          (b:Event {uuid: 'event_1_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_apicata'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_2'}),
          (b:Event {uuid: 'event_1_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_apicata'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_3'}),
          (b:Event {uuid: 'event_1_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_apicata'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_1_4'}),
          (b:Event {uuid: 'event_1_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_1_5'}),
          (b:Event {uuid: 'event_1_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_2'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_helen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_1'}),
          (b:Event {uuid: 'event_2_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_helen'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_helen_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_2'}),
          (b:Event {uuid: 'event_2_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_3'}),
          (b:Event {uuid: 'event_2_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_4'}),
          (b:Event {uuid: 'event_2_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_apicata'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_2_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_apicata_event_2_5'}),
          (b:Event {uuid: 'event_2_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_3'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_1'}),
          (b:Event {uuid: 'event_3_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_2'}),
          (b:Event {uuid: 'event_3_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_3'}),
          (b:Event {uuid: 'event_3_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_3_4'}),
          (b:Event {uuid: 'event_3_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_4'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_thrasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_1'}),
          (b:Event {uuid: 'event_4_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_thrasyllus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_thrasyllus_event_4_2'}),
          (b:Event {uuid: 'event_4_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_5'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_1'}),
          (b:Event {uuid: 'event_5_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_2'}),
          (b:Event {uuid: 'event_5_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_3'}),
          (b:Event {uuid: 'event_5_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_4'}),
          (b:Event {uuid: 'event_5_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_5'}),
          (b:Event {uuid: 'event_5_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_agrippina'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_agrippina_event_5_6'}),
          (b:Event {uuid: 'event_5_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_6'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_5_6'}),
          (b:Event {uuid: 'event_5_6'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_6'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_attius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_attius_event_6_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_attius_event_6_1'}),
          (b:Event {uuid: 'event_6_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_arria'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_junius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_2'}),
          (b:Event {uuid: 'event_6_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_3'}),
          (b:Event {uuid: 'event_6_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_6_4'}),
          (b:Event {uuid: 'event_6_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_7'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_1'}),
          (b:Event {uuid: 'event_7_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_7_2'}),
          (b:Event {uuid: 'event_7_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_8'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_7'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_8_1'}),
          (b:Scene {uuid: 'scene_8'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_drusus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_drusus_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_guard_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_8_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_8_1'}),
          (b:Event {uuid: 'event_8_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_9'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_1'}),
          (b:Event {uuid: 'event_9_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_9_2'}),
          (b:Event {uuid: 'event_9_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_3'}),
          (b:Event {uuid: 'event_9_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_9_4'}),
          (b:Event {uuid: 'event_9_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_10'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Event {uuid: 'event_10_5'}),
          (b:Scene {uuid: 'scene_10'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_10_4'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_1'}),
          (b:Event {uuid: 'event_10_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_2'}),
          (b:Event {uuid: 'event_10_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_3'}),
          (b:Event {uuid: 'event_10_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_4'}),
          (b:Event {uuid: 'event_10_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_10_5'}),
          (b:Event {uuid: 'event_10_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_11'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_1'}),
          (b:Event {uuid: 'event_11_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_2'}),
          (b:Event {uuid: 'event_11_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_11_3'}),
          (b:Event {uuid: 'event_11_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_12'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_scribe_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_scribe_1_event_12_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_scribe_1_event_12_1'}),
          (b:Event {uuid: 'event_12_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_2'}),
          (b:Event {uuid: 'event_12_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_atticus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_atticus_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_3'}),
          (b:Event {uuid: 'event_12_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_4'}),
          (b:Event {uuid: 'event_12_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_12_5'}),
          (b:Event {uuid: 'event_12_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_13'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Event {uuid: 'event_13_3'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_2'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_13_4'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_3'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_13_5'}),
          (b:Scene {uuid: 'scene_13'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_13_4'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_1'}),
          (b:Event {uuid: 'event_13_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_2'}),
          (b:Event {uuid: 'event_13_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_3'}),
          (b:Event {uuid: 'event_13_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_13_4'}),
          (b:Event {uuid: 'event_13_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_13_5'}),
          (b:Event {uuid: 'event_13_5'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_14'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_1'}),
          (b:Event {uuid: 'event_14_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_2'}),
          (b:Event {uuid: 'event_14_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_14_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_14_3'}),
          (b:Event {uuid: 'event_14_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_15'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_14'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_15_1'}),
          (b:Scene {uuid: 'scene_15'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_15_1'}),
          (b:Event {uuid: 'event_15_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_16'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_1'}),
          (b:Event {uuid: 'event_16_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_2'}),
          (b:Event {uuid: 'event_16_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_16_3'}),
          (b:Event {uuid: 'event_16_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_caligula'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_caligula_event_16_4'}),
          (b:Event {uuid: 'event_16_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_17'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_1'}),
          (b:Event {uuid: 'event_17_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_arria'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_junius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_17_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_junius_event_17_2'}),
          (b:Event {uuid: 'event_17_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_17_3'}),
          (b:Event {uuid: 'event_17_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_18'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_senator_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bystander_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_1'}),
          (b:Event {uuid: 'event_18_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_quaestor'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_quaestor_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_tiberius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_tiberius_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_senator_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_senator_1_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_bystander_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_bystander_1_event_18_2'}),
          (b:Event {uuid: 'event_18_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_19'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_18'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_19_1'}),
          (b:Scene {uuid: 'scene_19'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Agent {uuid: 'agent_guard_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_19_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_guard_1_event_19_1'}),
          (b:Event {uuid: 'event_19_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_20'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Event {uuid: 'event_20_3'}),
          (b:Scene {uuid: 'scene_20'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_20_2'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_arria'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_arria_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_captain_of_the_guard_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_1'}),
          (b:Event {uuid: 'event_20_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_captain_of_the_guard_1'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_captain_of_the_guard_1_event_20_2'}),
          (b:Event {uuid: 'event_20_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_sejanus'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_sejanus_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_macro'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_macro_event_20_3'}),
          (b:Event {uuid: 'event_20_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_21'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
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
MATCH (a:Agent {uuid: 'agent_livilla'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_21_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_livilla_event_21_1'}),
          (b:Event {uuid: 'event_21_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_2'}),
          (b:Event {uuid: 'event_21_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_antonia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_antonia_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_21_3'}),
          (b:Event {uuid: 'event_21_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (s:Scene {uuid: 'scene_22'}),
          (ep:Episode {uuid: 'episode_reign_of_terror'})
    MERGE (s)-[:PART_OF]->(ep);
MATCH (a:Scene {uuid: 'scene_21'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:NEXT_SCENE]->(b);
MATCH (a:Event {uuid: 'event_22_1'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_22_2'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_22_1'}),
          (b:Event {uuid: 'event_22_2'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_22_3'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_22_2'}),
          (b:Event {uuid: 'event_22_3'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_22_4'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_22_3'}),
          (b:Event {uuid: 'event_22_4'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Event {uuid: 'event_22_5'}),
          (b:Scene {uuid: 'scene_22'})
    MERGE (a)-[:OCCURS_IN]->(b);
MATCH (a:Event {uuid: 'event_22_4'}),
          (b:Event {uuid: 'event_22_5'})
    MERGE (a)-[:NEXT_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_1'}),
          (b:Event {uuid: 'event_22_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_1'}),
          (b:Event {uuid: 'event_22_1'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_2'}),
          (b:Event {uuid: 'event_22_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_2'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_2'}),
          (b:Event {uuid: 'event_22_2'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_3'}),
          (b:Event {uuid: 'event_22_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_3'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_3'}),
          (b:Event {uuid: 'event_22_3'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_aelia'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_aelia_event_22_4'}),
          (b:Event {uuid: 'event_22_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_4'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_4'}),
          (b:Event {uuid: 'event_22_4'})
    MERGE (a)-[:IN_EVENT]->(b);
MATCH (a:Agent {uuid: 'agent_claudius'}),
          (b:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_5'})
    MERGE (a)-[:PARTICIPATES_IN]->(b);
MATCH (a:AgentParticipation {uuid: 'agentparticipation_agent_claudius_event_22_5'}),
          (b:Event {uuid: 'event_22_5'})
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
                

                MATCH (e1:Event {uuid: 'event_10_1'}),
                      (e2:Event {uuid: 'event_10_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_2'}),
                      (e2:Event {uuid: 'event_10_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_3'}),
                      (e2:Event {uuid: 'event_10_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_10_4'}),
                      (e2:Event {uuid: 'event_10_5'})
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
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_2'}),
                      (e2:Event {uuid: 'event_13_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_2'}),
                      (e2:Event {uuid: 'event_13_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_3'}),
                      (e2:Event {uuid: 'event_13_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_1'}),
                      (e2:Event {uuid: 'event_13_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_2'}),
                      (e2:Event {uuid: 'event_13_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_3'}),
                      (e2:Event {uuid: 'event_13_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_13_4'}),
                      (e2:Event {uuid: 'event_13_5'})
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
                

                MATCH (e1:Event {uuid: 'event_18_1'}),
                      (e2:Event {uuid: 'event_18_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_20_1'}),
                      (e2:Event {uuid: 'event_20_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_20_1'}),
                      (e2:Event {uuid: 'event_20_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_20_2'}),
                      (e2:Event {uuid: 'event_20_3'})
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
                

                MATCH (e1:Event {uuid: 'event_22_1'}),
                      (e2:Event {uuid: 'event_22_2'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_1'}),
                      (e2:Event {uuid: 'event_22_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_2'}),
                      (e2:Event {uuid: 'event_22_3'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_1'}),
                      (e2:Event {uuid: 'event_22_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_2'}),
                      (e2:Event {uuid: 'event_22_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_3'}),
                      (e2:Event {uuid: 'event_22_4'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_1'}),
                      (e2:Event {uuid: 'event_22_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_2'}),
                      (e2:Event {uuid: 'event_22_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_3'}),
                      (e2:Event {uuid: 'event_22_5'})
                MERGE (e1)-[:HAPPENED_BEFORE]->(e2);
                

                MATCH (e1:Event {uuid: 'event_22_4'}),
                      (e2:Event {uuid: 'event_22_5'})
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
